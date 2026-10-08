import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../models/deneme_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../widgets/formatted_question_view.dart';
import '../widgets/solution_card.dart';
import '../widgets/source_page_view.dart';

class MockExamReviewScreen extends StatefulWidget {
  final DenemeResult result;
  final List<Question> questions;

  const MockExamReviewScreen({
    super.key,
    required this.result,
    required this.questions,
  });

  @override
  State<MockExamReviewScreen> createState() => _MockExamReviewScreenState();
}

class _MockExamReviewScreenState extends State<MockExamReviewScreen> {
  int _currentIndex = 0;
  String _filterMode = 'all'; // 'all', 'wrong', 'empty', 'correct'
  double _fontSize = 16.0;

  List<int> get _filteredIndices {
    final List<int> indices = [];
    for (int i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      final isAnswered = widget.result.userAnswers.containsKey(i);
      final isCorrect = isAnswered && widget.result.userAnswers[i] == q.correctIndex;
      final isWrong = isAnswered && widget.result.userAnswers[i] != q.correctIndex;
      final isEmpty = !isAnswered;

      if (_filterMode == 'all') {
        indices.add(i);
      } else if (_filterMode == 'wrong' && isWrong) {
        indices.add(i);
      } else if (_filterMode == 'empty' && isEmpty) {
        indices.add(i);
      } else if (_filterMode == 'correct' && isCorrect) {
        indices.add(i);
      }
    }
    return indices;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final filtered = _filteredIndices;
        if (_currentIndex >= filtered.length && filtered.isNotEmpty) {
          _currentIndex = 0;
        }

        final hasQuestions = filtered.isNotEmpty;
        final int? questionActualIndex = hasQuestions ? filtered[_currentIndex] : null;
        final Question? currentQ = questionActualIndex != null ? widget.questions[questionActualIndex] : null;

        final int? userAnswer = questionActualIndex != null ? widget.result.userAnswers[questionActualIndex] : null;
        final bool isCorrect = currentQ != null && userAnswer != null && userAnswer == currentQ.correctIndex;
        final bool isWrong = currentQ != null && userAnswer != null && userAnswer != currentQ.correctIndex;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.result.denemeTitle} - Çözümler',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (hasQuestions && questionActualIndex != null)
                  Text(
                    'Soru ${questionActualIndex + 1} / ${widget.questions.length} (${_getCourseName(questionActualIndex)})',
                    style: TextStyle(fontSize: 11, color: AppColors.primaryLight, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
            actions: [
              IconButton(
                tooltip: themeMode == ThemeModeType.dark
                    ? 'Gündüz Modu'
                    : (themeMode == ThemeModeType.light
                        ? 'Sepya / Kâğıt Modu'
                        : 'Karanlık Mod'),
                icon: Icon(
                  themeMode == ThemeModeType.dark
                      ? Icons.light_mode_outlined
                      : (themeMode == ThemeModeType.light
                          ? Icons.auto_stories_outlined
                          : Icons.dark_mode_outlined),
                  color: isDark ? const Color(0xFFFBBF24) : AppColors.primary,
                ),
                onPressed: () => ThemeService.instance.toggleTheme(),
              ),
              IconButton(
                icon: Icon(Icons.format_size_rounded, color: AppColors.textSecondary),
                onPressed: () {
                  setState(() {
                    _fontSize = _fontSize >= 19.0 ? 14.0 : _fontSize + 1.5;
                  });
                },
              ),
            ],
          ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.surface,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('all', 'Tümü (${widget.questions.length})'),
                  const SizedBox(width: 8),
                  _buildFilterChip('wrong', 'Yanlışlarım (${widget.result.totalWrong})', color: AppColors.error),
                  const SizedBox(width: 8),
                  _buildFilterChip('empty', 'Boş Bıraktıklarım (${widget.result.totalEmpty})', color: AppColors.textMuted),
                  const SizedBox(width: 8),
                  _buildFilterChip('correct', 'Doğrularım (${widget.result.totalCorrect})', color: AppColors.success),
                ],
              ),
            ),
          ),

          if (!hasQuestions)
            Expanded(
              child: Center(
                child: Text(
                  'Bu filtrede incelenecek soru bulunmamaktadır.',
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
                ),
              ),
            )
          else ...[
            // Question status header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: isCorrect
                  ? AppColors.success.withValues(alpha: 0.12)
                  : isWrong
                      ? AppColors.error.withValues(alpha: 0.12)
                      : AppColors.textMuted.withValues(alpha: 0.1),
              child: Row(
                children: [
                  Icon(
                    isCorrect
                        ? Icons.check_circle_rounded
                        : isWrong
                            ? Icons.cancel_rounded
                            : Icons.help_outline_rounded,
                    color: isCorrect
                        ? AppColors.success
                        : isWrong
                            ? AppColors.error
                            : AppColors.textMuted,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isCorrect
                        ? 'Bu soruyu DOĞRU cevapladınız (+1 Net)'
                        : isWrong
                            ? 'Bu soruyu YANLIŞ cevapladınız (-0.25 Net)'
                            : 'Bu soruyu BOŞ bıraktınız (0 Net)',
                    style: TextStyle(
                      color: isCorrect
                          ? AppColors.success
                          : isWrong
                              ? AppColors.error
                              : AppColors.textMuted,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable question content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtopic title
                    if (currentQ!.subtopicTitle.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: Text(
                          currentQ.subtopicTitle,
                          style: TextStyle(color: AppColors.primaryLight, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
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

                    // Question stem
                    FormattedQuestionView(
                      question: currentQ.question,
                      fontSize: _fontSize,
                      hasVisualDiagram: currentQ.sourceQuestionImages.isNotEmpty,
                    ),
                    const SizedBox(height: 18),

                    // Options list
                    ...List.generate(currentQ.options.length, (optIdx) {
                      final bool isUserChoice = userAnswer == optIdx;
                      final bool isCorrectOption = optIdx == currentQ.correctIndex;

                      Color cardColor = AppColors.surfaceLight;
                      Color borderColor = AppColors.cardBorder;
                      Color textColor = AppColors.textPrimary;
                      Widget? statusIcon;

                      if (isCorrectOption) {
                        cardColor = AppColors.success.withValues(alpha: 0.18);
                        borderColor = AppColors.success;
                        textColor = AppColors.success;
                        statusIcon = const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 22);
                      } else if (isUserChoice) {
                        cardColor = AppColors.error.withValues(alpha: 0.18);
                        borderColor = AppColors.error;
                        textColor = AppColors.error;
                        statusIcon = const Icon(Icons.cancel_rounded, color: AppColors.error, size: 22);
                      }

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor, width: isCorrectOption || isUserChoice ? 2.0 : 1.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: borderColor.withValues(alpha: 0.2),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                String.fromCharCode(65 + optIdx),
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                currentQ.options[optIdx].replaceFirst(RegExp(r'^[A-Ea-e]\)\s*'), ''),
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: _fontSize,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            if (statusIcon != null) ...[
                              const SizedBox(width: 8),
                              statusIcon,
                            ],
                          ],
                        ),
                      );
                    }),

                    const SizedBox(height: 16),

                    // Detailed Solution Card
                    Text(
                      'Çözüm ve Açıklama',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
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

            // Bottom Navigation Bar for Review
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
                      label: const Text('Önceki'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surfaceLight,
                        foregroundColor: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${_currentIndex + 1} / ${filtered.length}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    ElevatedButton.icon(
                      onPressed: _currentIndex < filtered.length - 1
                          ? () => setState(() => _currentIndex++)
                          : null,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                      label: const Text('Sonraki'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
      },
    );
  }

  Widget _buildFilterChip(String mode, String label, {Color? color}) {
    final isSelected = _filterMode == mode;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) {
        if (val) {
          setState(() {
            _filterMode = mode;
            _currentIndex = 0;
          });
        }
      },
      selectedColor: (color ?? AppColors.primary).withValues(alpha: 0.25),
      labelStyle: TextStyle(
        color: isSelected ? (color ?? AppColors.primaryLight) : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontSize: 12,
      ),
      backgroundColor: AppColors.surfaceLight,
    );
  }

  String _getCourseName(int index) {
    if (index < 30) return 'Türkçe';
    if (index < 56) return 'Matematik';
    if (index < 60) return 'Geometri';
    if (index < 87) return 'Tarih';
    if (index < 105) return 'Coğrafya';
    return 'Vatandaşlık & Güncel';
  }
}
