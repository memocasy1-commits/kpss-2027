import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../services/pdf_service.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';

class WrongQuestionsScreen extends StatefulWidget {
  const WrongQuestionsScreen({super.key});

  @override
  State<WrongQuestionsScreen> createState() => _WrongQuestionsScreenState();
}

class _WrongQuestionsScreenState extends State<WrongQuestionsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Question> _wrongQuestions = [];
  List<Question> _bookmarkedQuestions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    final wrongList = await QuestionService.instance.getWrongQuestions();
    final bookmarkList = await QuestionService.instance.getBookmarkedQuestions();
    if (mounted) {
      setState(() {
        _wrongQuestions = wrongList;
        _bookmarkedQuestions = bookmarkList;
        _isLoading = false;
      });
    }
  }

  void _exportCurrentTabPdf() {
    final isWrongTab = _tabController.index == 0;
    final targetList = isWrongTab ? _wrongQuestions : _bookmarkedQuestions;
    final title = isWrongTab ? 'KPSS Hata Defteri Testi' : 'KPSS Yıldızlı Sorular Testi';

    if (targetList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dışa aktarılacak soru bulunmuyor.')),
      );
      return;
    }

    PdfService.instance.exportQuestionsAsPdf(
      context: context,
      title: title,
      questions: targetList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        final Color bgColor = AppColors.background;
        final Color cardBg = AppColors.card;
        final Color cardBorder = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              'Tekrar & Hata Defteri',
              style: TextStyle(color: textPrimary, fontSize: 19, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                tooltip: 'PDF Olarak İndir / Yazdır',
                icon: const Icon(Icons.picture_as_pdf_rounded, color: Color(0xFFEF4444)),
                onPressed: _exportCurrentTabPdf,
              ),
              IconButton(
                tooltip: 'Yenile',
                icon: Icon(Icons.refresh_rounded, color: textSecondary),
                onPressed: _loadData,
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: textSecondary,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.warning_amber_rounded, size: 18),
                      const SizedBox(width: 6),
                      Text('Yanlışlarım (${_wrongQuestions.length})'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_rounded, size: 18),
                      const SizedBox(width: 6),
                      Text('Yıldızlılar (${_bookmarkedQuestions.length})'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: _isLoading
              ? Center(child: CircularProgressIndicator(color: AppColors.primary))
              : TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab 1: Yanlışlarım
                    _buildQuestionsTab(
                      questions: _wrongQuestions,
                      isWrongTab: true,
                      emptyTitle: 'Harika! Yanlış Sorun Yok 🎉',
                      emptySubtitle: 'Çözdüğün tüm soruları doğru bildin veya yanlış soruları tekrar çözüp başarıyla düzelttin.',
                      actionTitle: 'Yanlışları Tekrar Çöz',
                      actionColor: AppColors.error,
                      actionIcon: Icons.play_arrow_rounded,
                      isDark: isDark,
                      cardBg: cardBg,
                      cardBorder: cardBorder,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                    ),

                    // Tab 2: Yıldızlılar
                    _buildQuestionsTab(
                      questions: _bookmarkedQuestions,
                      isWrongTab: false,
                      emptyTitle: 'Henüz Yıldızlı Soru Yok ⭐',
                      emptySubtitle: 'Soru çözerken sağ üstteki yıldız ikonuna dokunarak kritik soruları buraya ekleyebilirsin.',
                      actionTitle: 'Yıldızlı Soruları Çöz',
                      actionColor: const Color(0xFFF59E0B),
                      actionIcon: Icons.star_rounded,
                      isDark: isDark,
                      cardBg: cardBg,
                      cardBorder: cardBorder,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildQuestionsTab({
    required List<Question> questions,
    required bool isWrongTab,
    required String emptyTitle,
    required String emptySubtitle,
    required String actionTitle,
    required Color actionColor,
    required IconData actionIcon,
    required bool isDark,
    required Color cardBg,
    required Color cardBorder,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    if (questions.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isWrongTab
                      ? const Color(0xFF10B981).withValues(alpha: 0.15)
                      : const Color(0xFFF59E0B).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isWrongTab ? Icons.verified_rounded : Icons.star_border_rounded,
                  size: 64,
                  color: isWrongTab ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                emptyTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                emptySubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: textSecondary, fontSize: 13, height: 1.4),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // Action Buttons Header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamScreen(
                          title: isWrongTab ? 'Hata Telafi Denemesi' : 'Yıldızlı Sorular Tekrarı',
                          questions: questions,
                        ),
                      ),
                    ).then((_) => _loadData());
                  },
                  icon: Icon(actionIcon, color: Colors.white, size: 20),
                  label: Text(
                    actionTitle,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actionColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                onPressed: _exportCurrentTabPdf,
                icon: const Icon(Icons.picture_as_pdf_rounded, size: 18, color: Color(0xFFEF4444)),
                label: const Text('PDF', style: TextStyle(fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  side: BorderSide(color: cardBorder),
                ),
              ),
            ],
          ),
        ),

        // List of questions
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final q = questions[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: cardBorder),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(14),
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: actionColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: actionColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  title: Text(
                    q.question,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textPrimary,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: cardBorder,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            q.courseId.toUpperCase(),
                            style: TextStyle(color: textSecondary, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            q.subtopicTitle,
                            style: TextStyle(color: textSecondary, fontSize: 11),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF94A3B8)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamScreen(
                          title: 'Soru İnceleme (${index + 1}/${questions.length})',
                          questions: [q],
                        ),
                      ),
                    ).then((_) => _loadData());
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
