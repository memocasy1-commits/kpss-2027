import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import '../widgets/solution_card.dart';
import '../widgets/formatted_question_view.dart';
import '../widgets/source_page_view.dart';
import '../widgets/drawing_canvas_overlay.dart';
import '../services/haptic_service.dart';
import '../services/leitner_service.dart';
import '../services/notes_service.dart';
import '../widgets/question_report_dialog.dart';

class ExamScreen extends StatefulWidget {
  final String title;
  final List<Question> questions;

  const ExamScreen({
    super.key,
    required this.title,
    required this.questions,
  });

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int _currentIndex = 0;
  double _fontSize = 16.0;
  bool _isBookmarked = false;
  bool _isDrawingMode = false;

  // Track answers for each question: {questionIndex: selectedOptionIndex}
  final Map<int, int> _userAnswers = {};

  // Track eliminated options per question: {questionIndex: Set<optionIndex>}
  final Map<int, Set<int>> _eliminatedOptions = {};

  // Track manually revealed solutions
  final Set<int> _manuallyRevealedSolutions = {};

  // Stopwatch timer
  int _elapsedSeconds = 0;
  Timer? _timer;

  void _toggleEliminateOption(int optionIndex) {
    if (_userAnswers.containsKey(_currentIndex)) return;
    setState(() {
      final set = _eliminatedOptions.putIfAbsent(_currentIndex, () => <int>{});
      if (set.contains(optionIndex)) {
        set.remove(optionIndex);
      } else {
        set.add(optionIndex);
      }
    });
    HapticService.instance.light();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    _checkBookmark();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  String _formatTimer(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _checkBookmark() async {
    if (widget.questions.isEmpty) return;
    final q = widget.questions[_currentIndex];
    final isB = await QuestionService.instance.isBookmarked(q.id);
    if (mounted) {
      setState(() {
        _isBookmarked = isB;
      });
    }
  }

  Future<void> _toggleBookmark() async {
    if (widget.questions.isEmpty) return;
    final q = widget.questions[_currentIndex];
    await QuestionService.instance.toggleBookmark(q.id);
    if (mounted) {
      setState(() {
        _isBookmarked = !_isBookmarked;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isBookmarked ? 'Soru yer imlerine eklendi ⭐' : 'Yer imi kaldırıldı'),
          duration: const Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _showAddNoteDialog() async {
    final q = widget.questions[_currentIndex];
    final existingNote = await NotesService.instance.getNote(q.id) ?? '';
    final controller = TextEditingController(text: existingNote);

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Row(
          children: [
            Icon(Icons.edit_note_rounded, color: Color(0xFF2563EB), size: 26),
            SizedBox(width: 8),
            Text('Soruya Not Ekle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${q.courseId.toUpperCase()} • Test ${q.testNum} • Soru ${q.qNum}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF3B82F6)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              maxLines: 4,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Örn: Bu istisnaya dikkat, Melikşah dönemi veziridir...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
        actions: [
          if (existingNote.isNotEmpty)
            TextButton(
              onPressed: () async {
                await NotesService.instance.deleteNote(q.id);
                if (ctx.mounted) Navigator.pop(ctx);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Not silindi'), duration: Duration(seconds: 1)),
                  );
                }
              },
              child: const Text('Notu Sil', style: TextStyle(color: Colors.redAccent)),
            ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Kapat'),
          ),
          ElevatedButton(
            onPressed: () async {
              await NotesService.instance.saveNote(q.id, controller.text);
              if (ctx.mounted) Navigator.pop(ctx);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Not kaydedildi 📝'), duration: Duration(seconds: 1)),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              foregroundColor: Colors.white,
            ),
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  void _handleOptionTap(int optionIndex) {
    // If already answered, do nothing
    if (_userAnswers.containsKey(_currentIndex)) return;

    if (_eliminatedOptions[_currentIndex]?.contains(optionIndex) ?? false) {
      _eliminatedOptions[_currentIndex]?.remove(optionIndex);
    }

    final q = widget.questions[_currentIndex];
    final bool isCorrect = optionIndex == q.correctIndex;

    HapticService.instance.selection();
    if (isCorrect) {
      HapticService.instance.success();
      LeitnerService.instance.recordReview(q.id, true);
    } else {
      HapticService.instance.error();
      LeitnerService.instance.addOrUpdateQuestion(q.id, resetToBox1: true);
    }

    setState(() {
      _userAnswers[_currentIndex] = optionIndex;
    });

    QuestionService.instance.recordAnswer(
      question: q,
      isCorrect: isCorrect,
      selectedIndex: optionIndex,
    );
  }

  void _goToQuestion(int index) {
    if (index >= 0 && index < widget.questions.length) {
      setState(() {
        _currentIndex = index;
        _isDrawingMode = false;
      });
      _checkBookmark();
    }
  }

  void _openQuestionGridSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Soru Gezgini',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: AppColors.textMuted),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(widget.questions.length, (idx) {
                    final isCurrent = idx == _currentIndex;
                    final hasAnswer = _userAnswers.containsKey(idx);
                    Color bg = AppColors.surfaceLight;
                    Color textCol = AppColors.textPrimary;

                    if (hasAnswer) {
                      final chosen = _userAnswers[idx]!;
                      final correct = widget.questions[idx].correctIndex;
                      if (chosen == correct) {
                        bg = AppColors.success;
                        textCol = Colors.white;
                      } else {
                        bg = AppColors.error;
                        textCol = Colors.white;
                      }
                    }

                    return InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        _goToQuestion(idx);
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(10),
                          border: isCurrent
                              ? Border.all(color: AppColors.primaryLight, width: 2.2)
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${idx + 1}',
                          style: TextStyle(
                            color: textCol,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFinishDialog() {
    int correctCount = 0;
    int wrongCount = 0;
    int emptyCount = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      if (_userAnswers.containsKey(i)) {
        if (_userAnswers[i] == widget.questions[i].correctIndex) {
          correctCount++;
        } else {
          wrongCount++;
        }
      } else {
        emptyCount++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Icon(Icons.emoji_events_rounded, color: AppColors.warning, size: 28),
              SizedBox(width: 10),
              Text(
                'Test Tamamlandı!',
                style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Geçen Süre: ${_formatTimer(_elapsedSeconds)}',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statBadge('Doğru', '$correctCount', AppColors.success),
                  _statBadge('Yanlış', '$wrongCount', AppColors.error),
                  _statBadge('Boş', '$emptyCount', AppColors.textMuted),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Exit exam screen
              },
              child: Text('Testi Bitir ve Çık', style: TextStyle(color: AppColors.primaryLight, fontSize: 15)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _userAnswers.clear();
                  _manuallyRevealedSolutions.clear();
                  _currentIndex = 0;
                  _elapsedSeconds = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Tekrar Çöz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Widget _statBadge(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
      ],
    );
  }

  Widget _buildDifficultyBadge(String diff, bool isDark) {
    Color bg;
    Color border;
    Color text;
    IconData icon;
    final d = diff.toLowerCase();

    if (d.contains('kolay')) {
      bg = const Color(0xFF10B981).withValues(alpha: isDark ? 0.15 : 0.12);
      border = const Color(0xFF10B981).withValues(alpha: isDark ? 0.4 : 0.35);
      text = isDark ? const Color(0xFF34D399) : const Color(0xFF059669);
      icon = Icons.bolt_outlined;
    } else if (d.contains('orta')) {
      bg = const Color(0xFFF59E0B).withValues(alpha: isDark ? 0.15 : 0.12);
      border = const Color(0xFFF59E0B).withValues(alpha: isDark ? 0.4 : 0.35);
      text = isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706);
      icon = Icons.trending_up_rounded;
    } else {
      bg = const Color(0xFFEF4444).withValues(alpha: isDark ? 0.15 : 0.12);
      border = const Color(0xFFEF4444).withValues(alpha: isDark ? 0.4 : 0.35);
      text = isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626);
      icon = Icons.local_fire_department_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: text, size: 14),
          const SizedBox(width: 4),
          Text(
            diff.toUpperCase(),
            style: TextStyle(
              color: text,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickQuestionNavigator() {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.cardBorder.withValues(alpha: 0.5))),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.questions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, idx) {
          final isCurrent = idx == _currentIndex;
          final isAnswered = _userAnswers.containsKey(idx);
          final isCorrect = isAnswered && _userAnswers[idx] == widget.questions[idx].correctIndex;

          Color bg = AppColors.surfaceLight;
          Color textCol = AppColors.textSecondary;
          if (isAnswered) {
            bg = isCorrect ? AppColors.success : AppColors.error;
            textCol = Colors.white;
          } else if (isCurrent) {
            bg = AppColors.primary;
            textCol = Colors.white;
          }

          return InkWell(
            onTap: () => _goToQuestion(idx),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isCurrent ? Colors.white : AppColors.cardBorder,
                  width: isCurrent ? 2 : 1,
                ),
              ),
              child: Text(
                '${idx + 1}',
                style: TextStyle(
                  color: textCol,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('Bu teste ait soru bulunamadı.')),
      );
    }

    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final Question currentQ = widget.questions[_currentIndex];
        final bool hasAnswered = _userAnswers.containsKey(_currentIndex);
        final int? selectedOption = _userAnswers[_currentIndex];
        final bool isSolutionManuallyRevealed = _manuallyRevealedSolutions.contains(_currentIndex);
        final bool isSolutionVisible = hasAnswered || isSolutionManuallyRevealed;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            titleSpacing: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              tooltip: 'Geri Dön',
              onPressed: () => Navigator.maybePop(context),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Soru ${_currentIndex + 1} / ${widget.questions.length}',
                  style: TextStyle(fontSize: 11.5, color: AppColors.primaryLight, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            actions: [
              // Timer badge (compact)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timer_outlined, size: 14, color: AppColors.warning),
                    const SizedBox(width: 4),
                    Text(
                      _formatTimer(_elapsedSeconds),
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              // Bookmark button
              IconButton(
                tooltip: _isBookmarked ? 'Yer İmini Kaldır' : 'Yer İmlerine Ekle',
                icon: Icon(
                  _isBookmarked ? Icons.star_rounded : Icons.star_outline_rounded,
                  color: _isBookmarked ? AppColors.warning : AppColors.textSecondary,
                  size: 23,
                ),
                onPressed: _toggleBookmark,
              ),
              // Karalama / Çizim Modu Butonu
              IconButton(
                tooltip: _isDrawingMode ? 'Karalamayı Kapat' : 'Soru Üzerine Çizim Yap',
                icon: Icon(
                  Icons.draw_rounded,
                  color: _isDrawingMode ? const Color(0xFF2563EB) : AppColors.textSecondary,
                  size: 21,
                ),
                onPressed: () {
                  setState(() {
                    _isDrawingMode = !_isDrawingMode;
                  });
                },
              ),
              // Menü (Daha Fazla Seçenek: Çözüm, Not, Yazı Boyutu, Tema)
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert_rounded, color: AppColors.textSecondary, size: 22),
                tooltip: 'Diğer Seçenekler',
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                onSelected: (val) {
                  if (val == 'solution') {
                    setState(() {
                      if (isSolutionManuallyRevealed) {
                        _manuallyRevealedSolutions.remove(_currentIndex);
                      } else {
                        _manuallyRevealedSolutions.add(_currentIndex);
                      }
                    });
                  } else if (val == 'note') {
                    _showAddNoteDialog();
                  } else if (val == 'report') {
                    QuestionReportDialog.show(context, question: currentQ);
                  } else if (val == 'font') {
                    setState(() {
                      _fontSize = _fontSize >= 19.0 ? 14.0 : _fontSize + 1.5;
                    });
                  } else if (val == 'theme') {
                    ThemeService.instance.toggleTheme();
                  }
                },
                itemBuilder: (ctx) => [
                  PopupMenuItem(
                    value: 'solution',
                    child: Row(
                      children: [
                        Icon(
                          isSolutionVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                          size: 19,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: 10),
                        Text(isSolutionVisible ? 'Çözümü Gizle' : 'Çözümü Göster'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'note',
                    child: Row(
                      children: [
                        Icon(Icons.edit_note_rounded, size: 19, color: Color(0xFF2563EB)),
                        SizedBox(width: 10),
                        Text('Soruya Not Ekle'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'report',
                    child: Row(
                      children: [
                        Icon(Icons.flag_outlined, size: 19, color: Color(0xFFEF4444)),
                        SizedBox(width: 10),
                        Text('Soru Hata Bildir'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'font',
                    child: Row(
                      children: [
                        Icon(Icons.format_size_rounded, size: 19, color: AppColors.textSecondary),
                        const SizedBox(width: 10),
                        Text('Yazı Boyutu (${_fontSize.toInt()}pt)'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'theme',
                    child: Row(
                      children: [
                        Icon(
                          themeMode == ThemeModeType.dark
                              ? Icons.light_mode_outlined
                              : (themeMode == ThemeModeType.light
                                  ? Icons.auto_stories_outlined
                                  : Icons.dark_mode_outlined),
                          size: 19,
                          color: const Color(0xFFFBBF24),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          themeMode == ThemeModeType.dark
                              ? 'Gündüz Modu'
                              : (themeMode == ThemeModeType.light ? 'Sepya Modu' : 'Karanlık Mod'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4),
            ],
          ),
      body: Stack(
        children: [
          Column(
        children: [
          // Linear progress bar
          LinearProgressIndicator(
            value: (_currentIndex + 1) / widget.questions.length,
            backgroundColor: AppColors.surface,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 3,
          ),
          // Hızlı Soru Gezgini (Yatay 1..N Barı)
          _buildQuickQuestionNavigator(),
          // Main scrollable Question and Options area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subtopic & Difficulty Badges
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (currentQ.subtopicTitle.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          margin: const EdgeInsets.only(bottom: 14),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1),
                          ),
                          child: Text(
                            currentQ.subtopicTitle,
                            style: TextStyle(
                              color: AppColors.primaryLight,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (currentQ.difficulty != null && currentQ.difficulty!.isNotEmpty)
                        _buildDifficultyBadge(currentQ.difficulty!, isDark),
                    ],
                  ),
                  // Geographic Map / Diagram / Figure (if question has an illustration)
                  if (currentQ.sourceQuestionImages.isNotEmpty) ...[
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        constraints: const BoxConstraints(maxHeight: 330),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.35), width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: SourcePageView(
                          images: currentQ.sourceQuestionImages,
                          label: currentQ.courseId == 'cografya'
                              ? 'Harita / Şema (Büyütmek için dokunun)'
                              : (currentQ.courseId == 'vatandaslik'
                                  ? 'Şema / Tablo (Büyütmek için dokunun)'
                                  : 'Geometri Şekli (Büyütmek için dokunun)'),
                        ),
                      ),
                    ),
                  ],

                  // Question Stem Text (Authentic Exam Typography)
                  FormattedQuestionView(
                    question: currentQ.question,
                    fontSize: _fontSize,
                    hasVisualDiagram: currentQ.sourceQuestionImages.isNotEmpty,
                  ),
                  const SizedBox(height: 18),

                  // Multiple Choice Options List with Strikethrough
                  ...List.generate(currentQ.options.length, (index) {
                    final isSelected = selectedOption == index;
                    final isCorrect = index == currentQ.correctIndex;
                    final isEliminated = _eliminatedOptions[_currentIndex]?.contains(index) ?? false;

                    Color cardColor = AppColors.surfaceLight;
                    Color borderColor = AppColors.cardBorder;
                    Color textColor = AppColors.textPrimary;
                    Widget? trailingIcon;

                    if (hasAnswered) {
                      if (isCorrect) {
                        cardColor = AppColors.success.withValues(alpha: 0.15);
                        borderColor = AppColors.success;
                        textColor = AppColors.success;
                        trailingIcon = const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 22);
                      } else if (isSelected) {
                        cardColor = AppColors.error.withValues(alpha: 0.15);
                        borderColor = AppColors.error;
                        textColor = AppColors.error;
                        trailingIcon = const Icon(Icons.cancel_rounded, color: AppColors.error, size: 22);
                      }
                    } else if (isEliminated) {
                      cardColor = AppColors.surface.withValues(alpha: 0.35);
                      borderColor = AppColors.cardBorder.withValues(alpha: 0.3);
                      textColor = AppColors.textMuted;
                    } else if (isSelected) {
                      cardColor = AppColors.primary.withValues(alpha: 0.15);
                      borderColor = AppColors.primary;
                      textColor = AppColors.primaryLight;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: () => _handleOptionTap(index),
                        onLongPress: () => _toggleEliminateOption(index),
                        borderRadius: BorderRadius.circular(14),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: borderColor, width: 1.5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: borderColor.withValues(alpha: 0.2),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  String.fromCharCode(65 + index),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: isEliminated ? TextDecoration.lineThrough : null,
                                    decorationColor: AppColors.error,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  currentQ.options[index].replaceFirst(RegExp(r'^\s*\(?[A-Ea-e][\)\.\-\:]\s*'), ''),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: _fontSize,
                                    height: 1.3,
                                    decoration: isEliminated ? TextDecoration.lineThrough : null,
                                    decorationColor: AppColors.error,
                                  ),
                                ),
                              ),
                              if (!hasAnswered)
                                InkWell(
                                  onTap: () => _toggleEliminateOption(index),
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: isEliminated
                                          ? AppColors.error.withValues(alpha: 0.12)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: isEliminated
                                            ? AppColors.error.withValues(alpha: 0.5)
                                            : Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    child: Icon(
                                      isEliminated ? Icons.undo_rounded : Icons.strikethrough_s_rounded,
                                      size: 18,
                                      color: isEliminated
                                          ? AppColors.error
                                          : AppColors.textMuted.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ),
                              if (trailingIcon != null) ...[
                                const SizedBox(width: 8),
                                trailingIcon,
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 10),

                  // Çözümü Gör (Show Solution) Manual Toggle Button
                  Center(
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            if (_manuallyRevealedSolutions.contains(_currentIndex)) {
                              _manuallyRevealedSolutions.remove(_currentIndex);
                            } else {
                              _manuallyRevealedSolutions.add(_currentIndex);
                            }
                          });
                        },
                        icon: Icon(
                          isSolutionVisible ? Icons.visibility_off_rounded : Icons.lightbulb_rounded,
                          size: 18,
                          color: isSolutionVisible ? AppColors.textMuted : AppColors.warning,
                        ),
                        label: Text(
                          isSolutionVisible ? 'Çözümü Gizle' : 'Çözümü ve Detaylı Anlatımı Gör',
                          style: TextStyle(
                            color: isSolutionVisible ? AppColors.textMuted : AppColors.warning,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isSolutionVisible ? AppColors.cardBorder : AppColors.warning.withValues(alpha: 0.6),
                            width: 1.5,
                          ),
                          backgroundColor: isSolutionVisible
                              ? AppColors.surfaceLight.withValues(alpha: 0.25)
                              : AppColors.warning.withValues(alpha: 0.12),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                  ),

                  // Solution Card (Displays immediately upon answering or tapping Çözümü Gör)
                  if (isSolutionVisible)
                    SolutionCard(
                      correctAnswer: currentQ.correctAnswer,
                      subtopicTitle: currentQ.subtopicTitle,
                      solutionText: currentQ.solution,
                      difficulty: currentQ.difficulty,
                      sourceImages: currentQ.sourceSolutionImages,
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border(top: BorderSide(color: AppColors.cardBorder, width: 1)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Previous button
                  IconButton.filledTonal(
                    onPressed: _currentIndex > 0 ? () => _goToQuestion(_currentIndex - 1) : null,
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.surfaceLight,
                      foregroundColor: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Grid explorer button
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _openQuestionGridSheet,
                      icon: Icon(Icons.grid_view_rounded, size: 18, color: AppColors.primaryLight),
                      label: Text(
                        '${_currentIndex + 1} / ${widget.questions.length}',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.cardBorder),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Next / Finish button
                  if (_currentIndex < widget.questions.length - 1)
                    IconButton.filled(
                      onPressed: () => _goToQuestion(_currentIndex + 1),
                      icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    )
                  else
                    ElevatedButton(
                      onPressed: _showFinishDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Bitir',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      if (_isDrawingMode)
        Positioned.fill(
          child: DrawingCanvasOverlay(
            isDark: isDark,
            onClose: () => setState(() => _isDrawingMode = false),
          ),
        ),
    ],
  ),
);
      },
    );
  }
}
