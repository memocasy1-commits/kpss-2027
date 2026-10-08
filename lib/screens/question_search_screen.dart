import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../widgets/formatted_question_view.dart';
import '../widgets/solution_card.dart';

class QuestionSearchScreen extends StatefulWidget {
  const QuestionSearchScreen({super.key});

  @override
  State<QuestionSearchScreen> createState() => _QuestionSearchScreenState();
}

class _QuestionSearchScreenState extends State<QuestionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCourse = 'all';
  List<Question> _results = [];
  bool _hasSearched = false;

  final List<Map<String, String>> _courses = [
    {'id': 'all', 'name': 'Tüm Dersler'},
    {'id': 'tarih', 'name': 'Tarih'},
    {'id': 'cografya', 'name': 'Coğrafya'},
    {'id': 'vatandaslik', 'name': 'Vatandaşlık'},
    {'id': 'turkce', 'name': 'Türkçe'},
    {'id': 'matematik', 'name': 'Matematik'},
    {'id': 'mantik', 'name': 'Sözel Mantık'},
    {'id': 'sayisal_mantik', 'name': 'Sayısal Mantık'},
  ];

  void _onSearchChanged(String val) {
    if (val.trim().isEmpty) {
      setState(() {
        _results = [];
        _hasSearched = false;
      });
      return;
    }

    final found = QuestionService.instance.searchQuestions(
      val,
      courseId: _selectedCourse == 'all' ? null : _selectedCourse,
      limit: 60,
    );

    setState(() {
      _results = found;
      _hasSearched = true;
    });
  }

  void _showQuestionDetail(Question q, bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final bg = isDark ? const Color(0xFF0F172A) : Colors.white;
        final textPrimary = isDark ? Colors.white : const Color(0xFF0F172A);

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
              child: Column(
                children: [
                  Container(
                    width: 44,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2563EB).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${_getCourseLabel(q.courseId)} • Test ${q.testNum} • Soru ${q.qNum}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        FormattedQuestionView(
                          question: q.question,
                        ),
                        const SizedBox(height: 16),
                        ...List.generate(q.options.length, (idx) {
                          final isCorrect = idx == q.correctIndex;
                          final letter = String.fromCharCode(65 + idx);
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: isCorrect
                                  ? const Color(0xFF10B981).withValues(alpha: isDark ? 0.2 : 0.12)
                                  : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isCorrect
                                    ? const Color(0xFF10B981)
                                    : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: isCorrect ? const Color(0xFF10B981) : Colors.grey.shade400,
                                  child: Text(
                                    letter,
                                    style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    q.options[idx].replaceFirst(RegExp(r'^\s*\(?[A-Ea-e][\)\.\-\:]\s*'), ''),
                                    style: TextStyle(
                                      color: textPrimary,
                                      fontSize: 13.5,
                                      fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (isCorrect)
                                  const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 18),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 12),
                        SolutionCard(
                          correctAnswer: q.correctAnswer,
                          subtopicTitle: q.subtopicTitle,
                          solutionText: q.solution,
                          sourceImages: q.sourceSolutionImages,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _getCourseLabel(String id) {
    switch (id) {
      case 'tarih':
        return 'Tarih';
      case 'cografya':
        return 'Coğrafya';
      case 'vatandaslik':
        return 'Vatandaşlık';
      case 'turkce':
        return 'Türkçe';
      case 'matematik':
        return 'Matematik';
      case 'mantik':
        return 'Sözel Mantık';
      case 'sayisal_mantik':
        return 'Sayısal Mantık';
      default:
        return 'KPSS';
    }
  }

  Color _getCourseColor(String id) {
    switch (id) {
      case 'tarih':
        return const Color(0xFFB45309);
      case 'cografya':
        return const Color(0xFF047857);
      case 'vatandaslik':
        return const Color(0xFF1D4ED8);
      case 'turkce':
        return const Color(0xFF6D28D9);
      case 'matematik':
        return const Color(0xFFD97706);
      case 'mantik':
        return const Color(0xFF475569);
      case 'sayisal_mantik':
        return const Color(0xFF0284C7);
      default:
        return const Color(0xFF2563EB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
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
            titleSpacing: 0,
            title: Text(
              '15.000 Soru İçi Akıllı Arama',
              style: TextStyle(
                color: textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            shape: Border(bottom: BorderSide(color: borderColor, width: 1)),
          ),
          body: Column(
            children: [
              // 1. Arama Çubuğu
              Container(
                color: surfaceBg,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  style: TextStyle(color: textPrimary, fontSize: 14.5),
                  decoration: InputDecoration(
                    hintText: 'Kavram, terim, soru veya çözüm metni ara...',
                    hintStyle: TextStyle(color: textSecondary, fontSize: 13.5),
                    prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF2563EB)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 20),
                            onPressed: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
                    ),
                  ),
                ),
              ),

              // 2. Ders Filtre Chip'leri
              Container(
                color: surfaceBg,
                height: 48,
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: _courses.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (ctx, idx) {
                    final item = _courses[idx];
                    final isSel = _selectedCourse == item['id'];
                    return ChoiceChip(
                      label: Text(item['name']!),
                      selected: isSel,
                      onSelected: (sel) {
                        setState(() {
                          _selectedCourse = item['id']!;
                        });
                        if (_searchController.text.isNotEmpty) {
                          _onSearchChanged(_searchController.text);
                        }
                      },
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
                        color: isSel ? Colors.white : textSecondary,
                      ),
                      selectedColor: const Color(0xFF2563EB),
                      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isSel ? const Color(0xFF2563EB) : borderColor,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 3. Sonuç Listesi / Bilgi Alanı
              Expanded(
                child: !_hasSearched
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.manage_search_rounded, size: 64, color: textSecondary.withValues(alpha: 0.4)),
                            const SizedBox(height: 12),
                            Text(
                              '15.000 Soru Arşivinde Arama Yapın',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: textPrimary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Örn: "Malazgirt", "TÜFE", "Kuvvetler Ayrılığı", "Alüvyal"',
                              style: TextStyle(fontSize: 13, color: textSecondary),
                            ),
                          ],
                        ),
                      )
                    : _results.isEmpty
                        ? Center(
                            child: Text(
                              'Aranan ifadeye uygun soru bulunamadı.',
                              style: TextStyle(fontSize: 14, color: textSecondary),
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(16),
                            physics: const BouncingScrollPhysics(),
                            itemCount: _results.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (ctx, idx) {
                              final q = _results[idx];
                              final courseColor = _getCourseColor(q.courseId);

                              return InkWell(
                                onTap: () => _showQuestionDetail(q, isDark),
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
                                              color: courseColor.withValues(alpha: 0.15),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              '${_getCourseLabel(q.courseId)} • Test ${q.testNum} • Soru ${q.qNum}',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: courseColor,
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.arrow_forward_ios_rounded, size: 13, color: textSecondary),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        q.question,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          height: 1.4,
                                          color: textPrimary,
                                        ),
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
        );
      },
    );
  }
}
