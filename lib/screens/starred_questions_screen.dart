import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../services/notes_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../widgets/formatted_question_view.dart';
import '../widgets/solution_card.dart';
import 'exam_screen.dart';

class StarredQuestionsScreen extends StatefulWidget {
  const StarredQuestionsScreen({super.key});

  @override
  State<StarredQuestionsScreen> createState() => _StarredQuestionsScreenState();
}

class _StarredQuestionsScreenState extends State<StarredQuestionsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Question> _starredQuestions = [];
  List<Map<String, dynamic>> _notesList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  Future<void> _loadData() async {
    final starred = await QuestionService.instance.getBookmarkedQuestions();
    final notes = await NotesService.instance.getAllNotesWithQuestions();
    if (mounted) {
      setState(() {
        _starredQuestions = starred;
        _notesList = notes;
        _isLoading = false;
      });
    }
  }

  void _unstar(String questionId) async {
    await QuestionService.instance.toggleBookmark(questionId);
    _loadData();
  }

  void _deleteNote(String questionId) async {
    await NotesService.instance.deleteNote(questionId);
    _loadData();
  }

  void _editNoteDialog(Question q, String currentNote) {
    final controller = TextEditingController(text: currentNote);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.edit_note_rounded, color: Color(0xFF2563EB)),
            SizedBox(width: 8),
            Text('Soru Notunu Düzenle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Bu soruyla ilgili hatırlatıcı notunuz...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () async {
              await NotesService.instance.saveNote(q.id, controller.text);
              if (ctx.mounted) Navigator.pop(ctx);
              if (mounted) _loadData();
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

  void _showQuestionModal(Question q, bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final bg = isDark ? const Color(0xFF0F172A) : Colors.white;
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: bg,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: ListView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Container(
                      width: 44,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FormattedQuestionView(
                    question: q.question,
                  ),
                  const SizedBox(height: 16),
                  SolutionCard(
                    correctAnswer: q.correctAnswer,
                    subtopicTitle: q.subtopicTitle,
                    solutionText: q.solution,
                    sourceImages: q.sourceSolutionImages,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        final Color bgColor = AppColors.background;
        final Color surfaceBg = AppColors.surface;
        final Color borderColor = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: surfaceBg,
            elevation: 0,
            title: Text(
              'Yıldızlı Sorular & Notlarım',
              style: TextStyle(
                color: textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF2563EB),
              unselectedLabelColor: textSecondary,
              indicatorColor: const Color(0xFF2563EB),
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: const Icon(Icons.star_rounded),
                  text: 'Yıldızlı (${_starredQuestions.length})',
                ),
                Tab(
                  icon: const Icon(Icons.sticky_note_2_rounded),
                  text: 'Notlarım (${_notesList.length})',
                ),
              ],
            ),
          ),
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _tabController,
                  children: [
                    // TAB 1: YILDIZLI SORULAR
                    _starredQuestions.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star_outline_rounded, size: 64, color: textSecondary.withValues(alpha: 0.4)),
                                const SizedBox(height: 12),
                                Text(
                                  'Henüz yıldızlı soru eklemediniz',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Test çözerken beğendiğiniz soruları yıldızlayarak buraya toplayabilirsiniz.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13, color: textSecondary),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                color: surfaceBg,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_starredQuestions.length} Kayıtlı Soru',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ExamScreen(
                                              title: 'Yıldızlı Sorular Pratiği',
                                              questions: _starredQuestions,
                                            ),
                                          ),
                                        ).then((_) => _loadData());
                                      },
                                      icon: const Icon(Icons.play_arrow_rounded, size: 18),
                                      label: const Text('Hepsini Çöz'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF2563EB),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(16),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _starredQuestions.length,
                                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                                  itemBuilder: (ctx, idx) {
                                    final q = _starredQuestions[idx];
                                    return InkWell(
                                      onTap: () => _showQuestionModal(q, isDark),
                                      borderRadius: BorderRadius.circular(14),
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          color: surfaceBg,
                                          borderRadius: BorderRadius.circular(14),
                                          border: Border.all(color: borderColor),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.amber.withValues(alpha: 0.15),
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Text(
                                                    '${q.courseId.toUpperCase()} • Test ${q.testNum} • Soru ${q.qNum}',
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.star_rounded, color: Colors.amber, size: 22),
                                                  tooltip: 'Yıldızdan Çıkar',
                                                  padding: EdgeInsets.zero,
                                                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                                  onPressed: () => _unstar(q.id),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              q.question,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 13.5, color: textPrimary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                    // TAB 2: SORU NOTLARI
                    _notesList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.note_alt_outlined, size: 64, color: textSecondary.withValues(alpha: 0.4)),
                                const SizedBox(height: 12),
                                Text(
                                  'Henüz soru notu eklemediniz',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Soru çözüm ekranında "Not Ekle" butonuna basarak kişisel notlarınızı buraya kaydedebilirsiniz.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13, color: textSecondary),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(16),
                            physics: const BouncingScrollPhysics(),
                            itemCount: _notesList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (ctx, idx) {
                              final item = _notesList[idx];
                              final Question q = item['question'] as Question;
                              final QuestionNote note = item['note'] as QuestionNote;

                              return Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: surfaceBg,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: borderColor),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF2563EB).withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            '${q.courseId.toUpperCase()} • Test ${q.testNum} • Soru ${q.qNum}',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF3B82F6),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.edit_outlined, size: 18),
                                              tooltip: 'Notu Düzenle',
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                              onPressed: () => _editNoteDialog(q, note.content),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete_outline_rounded, size: 18, color: Colors.redAccent),
                                              tooltip: 'Notu Sil',
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                              onPressed: () => _deleteNote(q.id),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFFEF3C7).withValues(alpha: 0.4),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: isDark ? const Color(0xFF334155) : const Color(0xFFFDE68A),
                                        ),
                                      ),
                                      child: Text(
                                        note.content,
                                        style: TextStyle(
                                          fontSize: 13,
                                          height: 1.4,
                                          fontWeight: FontWeight.w600,
                                          color: textPrimary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    InkWell(
                                      onTap: () => _showQuestionModal(q, isDark),
                                      child: Text(
                                        'Soruyu İncele: ${q.question}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: textSecondary,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                ),
        );
      },
    );
  }
}
