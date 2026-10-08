import 'dart:async';
import 'package:flutter/material.dart';
import '../models/deneme_model.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import '../widgets/formatted_question_view.dart';
import '../widgets/source_page_view.dart';
import '../widgets/question_report_dialog.dart';
import 'mock_exam_result_screen.dart';

class MockExamScreen extends StatefulWidget {
  final DenemeExam deneme;

  const MockExamScreen({
    super.key,
    required this.deneme,
  });

  @override
  State<MockExamScreen> createState() => _MockExamScreenState();
}

class _MockExamScreenState extends State<MockExamScreen> {
  int _currentIndex = 0;
  double _fontSize = 16.0;

  // Track candidate answers: {questionIndex: selectedOptionIndex}
  final Map<int, int> _userAnswers = {};

  // Track eliminated options per question: {questionIndex: Set<optionIndex>}
  final Map<int, Set<int>> _eliminatedOptions = {};

  // Flagged/starred questions for review: {questionIndex}
  final Set<int> _flaggedQuestions = {};

  void _toggleEliminateOption(int optionIndex) {
    setState(() {
      final set = _eliminatedOptions.putIfAbsent(_currentIndex, () => <int>{});
      if (set.contains(optionIndex)) {
        set.remove(optionIndex);
      } else {
        set.add(optionIndex);
      }
    });
  }

  // KPSS 130 minutes countdown timer (130 * 60 = 7800 seconds)
  late int _remainingSeconds;
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.deneme.durationMinutes * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
          _elapsedSeconds++;
        } else {
          _timer?.cancel();
          _finishExam(autoFinish: true);
        }
      });
    });
  }

  String _formatTimer(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _finishExam({bool autoFinish = false}) {
    _timer?.cancel();

    final result = DenemeResult.calculate(
      denemeId: widget.deneme.id,
      denemeTitle: widget.deneme.title,
      questions: widget.deneme.questions,
      userAnswers: _userAnswers,
      elapsedSeconds: _elapsedSeconds,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MockExamResultScreen(
          result: result,
          questions: widget.deneme.questions,
        ),
      ),
    );
  }

  void _showFinishConfirmationDialog() {
    final answeredCount = _userAnswers.length;
    final emptyCount = widget.deneme.questions.length - answeredCount;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Row(
            children: [
              const Icon(Icons.flag_rounded, color: AppColors.warning, size: 26),
              SizedBox(width: 8),
              Text(
                'Sınavı Bitir',
                style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sınavı sonlandırmak istediğinizden emin misiniz? Sınav bittiğinde doğru/yanlışlarınız, netiniz, olası KPSS puanlarınız ve çözümleriniz sunulacaktır.',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _statSimple('Cevaplanan', '$answeredCount', AppColors.primaryLight),
                    _statSimple('Boş Soru', '$emptyCount', emptyCount > 0 ? AppColors.warning : AppColors.success),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Devam Et', style: TextStyle(color: AppColors.textSecondary)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _finishExam();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Evet, Sınavı Bitir', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Widget _statSimple(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ],
    );
  }

  void _openQuestionGridSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Soru Haritası (1-120)',
                          style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close_rounded, color: AppColors.textMuted),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Legend
                    Row(
                      children: [
                        _legendItem('İşaretli', AppColors.primary),
                        const SizedBox(width: 12),
                        _legendItem('Boş', AppColors.surfaceLight),
                        const SizedBox(width: 12),
                        _legendItem('Şüpheli (Yıldız)', AppColors.warning),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Course Quick Jump Buttons
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _jumpButton('Türkçe (1-30)', 0),
                          const SizedBox(width: 6),
                          _jumpButton('Matematik (31-56)', 30),
                          const SizedBox(width: 6),
                          _jumpButton('Geometri (57-60)', 56),
                          const SizedBox(width: 6),
                          _jumpButton('Tarih (61-87)', 60),
                          const SizedBox(width: 6),
                          _jumpButton('Coğrafya (88-105)', 87),
                          const SizedBox(width: 6),
                          _jumpButton('Vatandaşlık (106-120)', 105),
                        ],
                      ),
                    ),
                    Divider(color: AppColors.cardBorder, height: 20),
                    // Grid 120
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(widget.deneme.questions.length, (idx) {
                            final isCurrent = idx == _currentIndex;
                            final isAnswered = _userAnswers.containsKey(idx);
                            final isFlagged = _flaggedQuestions.contains(idx);

                            Color bg = AppColors.surfaceLight;
                            Color textCol = AppColors.textPrimary;
                            if (isAnswered) {
                              bg = AppColors.primary;
                              textCol = Colors.white;
                            }

                            return InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() => _currentIndex = idx);
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: bg,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isCurrent
                                        ? AppColors.primaryLight
                                        : isFlagged
                                            ? AppColors.warning
                                            : AppColors.cardBorder,
                                    width: isCurrent || isFlagged ? 2.0 : 1.0,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      '${idx + 1}',
                                      style: TextStyle(color: textCol, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    if (isFlagged)
                                      const Positioned(
                                        top: 2,
                                        right: 2,
                                        child: Icon(Icons.star_rounded, color: AppColors.warning, size: 10),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
      ],
    );
  }

  Widget _jumpButton(String label, int targetIdx) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        setState(() => _currentIndex = targetIdx);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Text(label, style: TextStyle(color: AppColors.textPrimary, fontSize: 11, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildStickyCourseTabs() {
    final sections = [
      {'title': 'Türkçe (1-30)', 'start': 0, 'end': 29},
      {'title': 'Matematik (31-60)', 'start': 30, 'end': 59},
      {'title': 'Tarih (61-87)', 'start': 60, 'end': 86},
      {'title': 'Coğrafya (88-105)', 'start': 87, 'end': 104},
      {'title': 'Vatandaşlık (106-120)', 'start': 105, 'end': 119},
    ];

    return Container(
      height: 38,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final sec = sections[i];
          final start = sec['start'] as int;
          final end = sec['end'] as int;
          final isActive = _currentIndex >= start && _currentIndex <= end;

          return InkWell(
            onTap: () {
              setState(() {
                _currentIndex = start;
              });
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isActive ? AppColors.primaryLight : AppColors.cardBorder,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                sec['title'] as String,
                style: TextStyle(
                  color: isActive ? Colors.white : AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getCourseTitle(int index) {
    if (index < 30) return 'Türkçe';
    if (index < 56) return 'Matematik';
    if (index < 60) return 'Geometri';
    if (index < 87) return 'Tarih';
    if (index < 105) return 'Coğrafya';
    return 'Vatandaşlık & Güncel';
  }

  String _getSectionTitle(int index) {
    if (index < 60) return 'Genel Yetenek';
    return 'Genel Kültür';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final currentQ = widget.deneme.questions[_currentIndex];
        final selectedOption = _userAnswers[_currentIndex];
        final isFlagged = _flaggedQuestions.contains(_currentIndex);

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            _showFinishConfirmationDialog();
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            onPressed: _showFinishConfirmationDialog,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.deneme.title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Soru ${_currentIndex + 1} / 120',
                style: TextStyle(fontSize: 11, color: AppColors.primaryLight, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: [
            // Countdown Timer Display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                color: _remainingSeconds < 600
                    ? AppColors.error.withValues(alpha: 0.2)
                    : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _remainingSeconds < 600 ? AppColors.error : AppColors.cardBorder,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 14,
                    color: _remainingSeconds < 600 ? AppColors.error : AppColors.warning,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatTimer(_remainingSeconds),
                    style: TextStyle(
                      color: _remainingSeconds < 600 ? AppColors.error : AppColors.textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),

            // Gece / Gündüz / Sepya Modu Butonu
            IconButton(
              tooltip: themeMode == ThemeModeType.dark
                  ? 'Gündüz Modu'
                  : (themeMode == ThemeModeType.light
                      ? 'Sepya / Kâğıt Modu'
                      : 'Karanlık Mod'),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              icon: Icon(
                themeMode == ThemeModeType.dark
                    ? Icons.light_mode_outlined
                    : (themeMode == ThemeModeType.light
                        ? Icons.auto_stories_outlined
                        : Icons.dark_mode_outlined),
                color: isDark ? const Color(0xFFFBBF24) : AppColors.primary,
                size: 20,
              ),
              onPressed: () => ThemeService.instance.toggleTheme(),
            ),

            // Soru Haritası Drawer Button
            IconButton(
              tooltip: 'Soru Haritası',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              icon: Icon(Icons.grid_view_rounded, color: AppColors.textSecondary, size: 20),
              onPressed: _openQuestionGridSheet,
            ),

            // Font size
            IconButton(
              tooltip: 'Yazı Boyutu',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              icon: Icon(Icons.format_size_rounded, color: AppColors.textSecondary, size: 20),
              onPressed: () {
                setState(() {
                  _fontSize = _fontSize >= 19.0 ? 14.0 : _fontSize + 1.5;
                });
              },
            ),

            // Soru Hata Bildir
            IconButton(
              tooltip: 'Soru Hata Bildir',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              icon: const Icon(Icons.flag_outlined, color: Color(0xFFEF4444), size: 20),
              onPressed: () => QuestionReportDialog.show(context, question: currentQ),
            ),
            const SizedBox(width: 6),
          ],
        ),
        body: Column(
          children: [
            // Section & Progress Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: AppColors.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      '${_getSectionTitle(_currentIndex)} • ${_getCourseTitle(_currentIndex)}',
                      style: TextStyle(color: AppColors.primaryLight, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      // Flag Question Button (Şüpheli)
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isFlagged) {
                              _flaggedQuestions.remove(_currentIndex);
                            } else {
                              _flaggedQuestions.add(_currentIndex);
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isFlagged ? AppColors.warning.withValues(alpha: 0.2) : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: isFlagged ? AppColors.warning : AppColors.cardBorder),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isFlagged ? Icons.star_rounded : Icons.star_border_rounded,
                                size: 16,
                                color: isFlagged ? AppColors.warning : AppColors.textMuted,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isFlagged ? 'İşaretlendi' : 'Yıldızla',
                                style: TextStyle(
                                  color: isFlagged ? AppColors.warning : AppColors.textMuted,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Finish Button
                      TextButton(
                        onPressed: _showFinishConfirmationDialog,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.error,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          backgroundColor: AppColors.error.withValues(alpha: 0.1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Sınavı Bitir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: (_currentIndex + 1) / widget.deneme.questions.length,
              backgroundColor: AppColors.surface,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 2.5,
            ),
            _buildStickyCourseTabs(),

            // Question Stem and Options Area
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    // Question text
                    FormattedQuestionView(
                      question: currentQ.question,
                      fontSize: _fontSize,
                      hasVisualDiagram: currentQ.sourceQuestionImages.isNotEmpty,
                    ),
                    const SizedBox(height: 20),

                    // Options - STRICTLY MARKING ONLY (SADECE İŞARETLEME) with Strikethrough
                    // No green/red, no solution reveal!
                    ...List.generate(currentQ.options.length, (optIdx) {
                      final isSelected = selectedOption == optIdx;
                      final isEliminated = _eliminatedOptions[_currentIndex]?.contains(optIdx) ?? false;

                      final Color cardColor = isEliminated
                          ? AppColors.surface.withValues(alpha: 0.35)
                          : (isSelected
                              ? AppColors.primary.withValues(alpha: 0.18)
                              : AppColors.surfaceLight);
                      final Color borderColor = isEliminated
                          ? AppColors.cardBorder.withValues(alpha: 0.3)
                          : (isSelected
                              ? AppColors.primaryLight
                              : AppColors.cardBorder);
                      final Color textColor = isEliminated
                          ? AppColors.textMuted
                          : (isSelected
                              ? AppColors.primaryLight
                              : AppColors.textPrimary);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isEliminated) {
                                _eliminatedOptions[_currentIndex]?.remove(optIdx);
                              }
                              if (isSelected) {
                                _userAnswers.remove(_currentIndex); // Unselect if tapped again
                              } else {
                                _userAnswers[_currentIndex] = optIdx; // Mark choice
                              }
                            });
                          },
                          onLongPress: () => _toggleEliminateOption(optIdx),
                          borderRadius: BorderRadius.circular(14),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: borderColor, width: isSelected ? 2.0 : 1.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected
                                        ? AppColors.primary
                                        : borderColor.withValues(alpha: 0.2),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    String.fromCharCode(65 + optIdx),
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      decoration: isEliminated ? TextDecoration.lineThrough : null,
                                      decorationColor: AppColors.textMuted,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    currentQ.options[optIdx].replaceFirst(RegExp(r'^[A-Ea-e]\)\s*'), ''),
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: _fontSize,
                                      height: 1.3,
                                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                      decoration: isEliminated ? TextDecoration.lineThrough : null,
                                      decorationColor: AppColors.textMuted,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                ),
                                // Şık Eleme / Geri Alma Butonu
                                InkWell(
                                  onTap: () => _toggleEliminateOption(optIdx),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      isEliminated ? Icons.undo_rounded : Icons.strikethrough_s_rounded,
                                      size: 19,
                                      color: isEliminated ? AppColors.warning : AppColors.textMuted.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                if (isSelected)
                                  Icon(Icons.radio_button_checked_rounded, color: AppColors.primaryLight, size: 20)
                                else
                                  Icon(Icons.radio_button_off_rounded, color: isEliminated ? AppColors.textMuted.withValues(alpha: 0.3) : AppColors.textMuted, size: 20),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Bottom Previous / Next Question Navigation
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border(top: BorderSide(color: AppColors.cardBorder)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _currentIndex > 0
                          ? () => setState(() => _currentIndex--)
                          : null,
                      icon: const Icon(Icons.arrow_back_rounded, size: 18),
                      label: const Text('Önceki Soru'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surfaceLight,
                        foregroundColor: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${_currentIndex + 1} / ${widget.deneme.questions.length}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    ElevatedButton.icon(
                      onPressed: _currentIndex < widget.deneme.questions.length - 1
                          ? () => setState(() => _currentIndex++)
                          : _showFinishConfirmationDialog,
                      icon: Icon(
                        _currentIndex < widget.deneme.questions.length - 1
                            ? Icons.arrow_forward_rounded
                            : Icons.check_circle_rounded,
                        size: 18,
                      ),
                      label: Text(_currentIndex < widget.deneme.questions.length - 1 ? 'Sonraki Soru' : 'Bitir'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentIndex < widget.deneme.questions.length - 1
                            ? AppColors.primary
                            : AppColors.success,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}
