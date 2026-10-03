import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../services/settings_service.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import '../screens/exam_screen.dart';

class HomeDailyQuestionWidget extends StatefulWidget {
  final bool isDark;
  const HomeDailyQuestionWidget({super.key, required this.isDark});

  @override
  State<HomeDailyQuestionWidget> createState() => _HomeDailyQuestionWidgetState();
}

class _HomeDailyQuestionWidgetState extends State<HomeDailyQuestionWidget> {
  Question? _question;
  int? _selectedIndex;
  bool _isAnswered = false;
  bool _isExpandedSolution = false;

  @override
  void initState() {
    super.initState();
    _fetchRandomQuestion();
  }

  void _fetchRandomQuestion() {
    final list = QuestionService.instance.getRandomPracticeQuestions(count: 1);
    if (list.isNotEmpty) {
      setState(() {
        _question = list.first;
        _selectedIndex = null;
        _isAnswered = false;
        _isExpandedSolution = false;
      });
    }
  }

  void _handleOptionSelect(int index) {
    if (_isAnswered || _question == null) return;

    if (SettingsService.instance.hapticFeedback) {
      HapticFeedback.lightImpact();
    }

    final isCorrect = (index == _question!.correctIndex);

    setState(() {
      _selectedIndex = index;
      _isAnswered = true;
      _isExpandedSolution = true;
    });

    QuestionService.instance.recordAnswer(
      question: _question!,
      isCorrect: isCorrect,
      selectedIndex: index,
    );
  }

  Color _getCourseColor(String courseId) {
    switch (courseId) {
      case 'tarih':
        return const Color(0xFFEF4444);
      case 'cografya':
        return const Color(0xFF10B981);
      case 'vatandaslik':
        return const Color(0xFF8B5CF6);
      case 'turkce':
        return const Color(0xFF3B82F6);
      case 'matematik':
        return const Color(0xFFF59E0B);
      case 'mantik':
      case 'sayisal_mantik':
        return const Color(0xFF06B6D4);
      default:
        return const Color(0xFF6366F1);
    }
  }

  String _getCourseTitle(String courseId) {
    switch (courseId) {
      case 'tarih':
        return 'TARİH';
      case 'cografya':
        return 'COĞRAFYA';
      case 'vatandaslik':
        return 'VATANDAŞLIK';
      case 'turkce':
        return 'TÜRKÇE';
      case 'matematik':
        return 'MATEMATİK & GEO';
      case 'mantik':
        return 'SÖZEL MANTIK';
      case 'sayisal_mantik':
        return 'SAYISAL MANTIK';
      default:
        return 'KPSS';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_question == null) {
      return const SizedBox.shrink();
    }

    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeModeType.dark;
        final isSepia = themeMode == ThemeModeType.sepia;
        final cardBg = AppColors.card;
        final cardBorder = AppColors.cardBorder;
        final textPrimary = AppColors.textPrimary;
        final textSecondary = AppColors.textSecondary;
        final courseColor = _getCourseColor(_question!.courseId);

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _isAnswered
                  ? (_selectedIndex == _question!.correctIndex
                      ? const Color(0xFF10B981)
                      : const Color(0xFFEF4444).withValues(alpha: 0.6))
                  : cardBorder,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.35)
                    : (isSepia ? const Color(0xFF78350F).withValues(alpha: 0.08) : courseColor.withValues(alpha: 0.08)),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          // 1. Üst Başlık & Kontroller
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 10),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: courseColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: courseColor.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.bolt_rounded, size: 14, color: courseColor),
                      const SizedBox(width: 4),
                      Text(
                        _getCourseTitle(_question!.courseId),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: courseColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Hızlı Soru Pratiği',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                  ),
                ),
                const Spacer(),
                // Yenile Butonu
                IconButton(
                  tooltip: 'Başka Soru Getir',
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.refresh_rounded, size: 20),
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  onPressed: _fetchRandomQuestion,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: cardBorder),

          // 2. Soru Metni
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Text(
              _question!.question,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.45,
                color: textPrimary,
              ),
            ),
          ),

          // 3. Seçenekler (A, B, C, D, E)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: List.generate(_question!.options.length, (index) {
                final optionText = _question!.options[index];
                final isSelected = (_selectedIndex == index);
                final isCorrect = (index == _question!.correctIndex);

                Color optBg = isDark
                    ? const Color(0xFF0F172A)
                    : (isSepia ? const Color(0xFFF3EBD8) : const Color(0xFFF8FAFC));
                Color optBorder = isDark
                    ? const Color(0xFF3B4D66)
                    : (isSepia ? const Color(0xFFDDD2BC) : const Color(0xFFE2E8F0));
                Color optTextColor = textPrimary;
                Widget? statusIcon;

                if (_isAnswered) {
                  if (isCorrect) {
                    optBg = const Color(0xFF10B981).withValues(alpha: isDark ? 0.25 : 0.15);
                    optBorder = const Color(0xFF10B981);
                    optTextColor = const Color(0xFF10B981);
                    statusIcon = const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 18);
                  } else if (isSelected) {
                    optBg = const Color(0xFFEF4444).withValues(alpha: isDark ? 0.25 : 0.15);
                    optBorder = const Color(0xFFEF4444);
                    optTextColor = const Color(0xFFEF4444);
                    statusIcon = const Icon(Icons.cancel_rounded, color: Color(0xFFEF4444), size: 18);
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () => _handleOptionSelect(index),
                    borderRadius: BorderRadius.circular(12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: optBg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: optBorder, width: isSelected || (_isAnswered && isCorrect) ? 1.5 : 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              optionText,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: (isSelected || (_isAnswered && isCorrect)) ? FontWeight.w700 : FontWeight.w500,
                                color: optTextColor,
                              ),
                            ),
                          ),
                          if (statusIcon != null) ...[
                            const SizedBox(width: 8),
                            statusIcon,
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // 4. Çözüm Kartı (Cevaplandıktan Sonra Açılır)
          if (_isAnswered && _isExpandedSolution) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : (isSepia ? const Color(0xFFF3EBD8) : const Color(0xFFF1F5F9)),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isDark
                        ? const Color(0xFF3B4D66)
                        : (isSepia ? const Color(0xFFDDD2BC) : const Color(0xFFCBD5E1)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _selectedIndex == _question!.correctIndex ? Icons.stars_rounded : Icons.info_outline_rounded,
                          size: 18,
                          color: _selectedIndex == _question!.correctIndex ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _selectedIndex == _question!.correctIndex
                              ? 'Tebrikler! Doğru Cevap: ${_question!.correctAnswer}'
                              : 'Doğru Cevap: ${_question!.correctAnswer}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: _selectedIndex == _question!.correctIndex ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _question!.solution,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 9),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                            label: const Text('Sonraki Soru', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                            onPressed: _fetchRandomQuestion,
                          ),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: textSecondary,
                            side: BorderSide(color: cardBorder),
                            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          icon: const Icon(Icons.open_in_new_rounded, size: 15),
                          label: const Text('Tam Mod', style: TextStyle(fontSize: 12)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ExamScreen(
                                  title: '${_getCourseTitle(_question!.courseId)} Pratiği',
                                  questions: [_question!],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
      },
    );
  }
}
