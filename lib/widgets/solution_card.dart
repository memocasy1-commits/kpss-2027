import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import 'source_page_view.dart';
import 'math_rich_text.dart';

class SolutionCard extends StatelessWidget {
  final String correctAnswer;
  final String subtopicTitle;
  final String solutionText;
  final String? difficulty;
  final List<String> sourceImages;

  const SolutionCard({
    super.key,
    required this.correctAnswer,
    required this.subtopicTitle,
    required this.solutionText,
    this.difficulty,
    this.sourceImages = const [],
  });

  Color _getDifficultyColor(String diff, bool isDark) {
    final d = diff.toLowerCase();
    if (d.contains('kolay')) return isDark ? const Color(0xFF10B981) : const Color(0xFF059669);
    if (d.contains('orta')) return isDark ? const Color(0xFFF59E0B) : const Color(0xFFD97706);
    if (d.contains('zor')) return isDark ? const Color(0xFFEF4444) : const Color(0xFFDC2626);
    return isDark ? AppColors.accent : const Color(0xFF0891B2);
  }

  IconData _getDifficultyIcon(String diff) {
    final d = diff.toLowerCase();
    if (d.contains('kolay')) return Icons.bolt_outlined;
    if (d.contains('orta')) return Icons.trending_up_rounded;
    if (d.contains('zor')) return Icons.local_fire_department_rounded;
    return Icons.star_rounded;
  }

  @override
  Widget build(BuildContext context) {
    if (solutionText.trim().isEmpty && sourceImages.isEmpty) {
      return const SizedBox.shrink();
    }

    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final isDark = AppColors.isDarkMode;
        final isOled = AppColors.isOledMode;
        final cardBg = AppColors.card;
        final cardBorder = isDark
            ? const Color(0xFFF59E0B).withValues(alpha: 0.35)
            : const Color(0xFFF59E0B).withValues(alpha: 0.45);
        final cardShadow = isOled
            ? const BoxShadow(color: Colors.transparent)
            : (isDark
                ? BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                : BoxShadow(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.07),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ));

        final answerColor = isDark ? AppColors.warning : const Color(0xFFB45309);
        final answerBg = isDark
            ? AppColors.warning.withValues(alpha: 0.15)
            : const Color(0xFFFEF3C7);
        final answerIconColor = isDark ? AppColors.warning : const Color(0xFFD97706);

        final subtopicBg = isDark
            ? AppColors.surfaceLight.withValues(alpha: 0.4)
            : const Color(0xFFF1F5F9);
        final subtopicTextColor = isDark
            ? AppColors.textSecondary
            : const Color(0xFF475569);

        final dividerColor = isDark ? const Color(0xFF233247) : const Color(0xFFE2E8F0);

        return Container(
          margin: const EdgeInsets.only(top: 14, bottom: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardBorder, width: 1.2),
            boxShadow: [cardShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with Icon, Correct Answer and Difficulty
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: answerBg,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.lightbulb_rounded, color: answerIconColor, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'DOĞRU CEVAP: $correctAnswer',
                    style: TextStyle(
                      color: answerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  if (difficulty != null && difficulty!.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getDifficultyColor(difficulty!, isDark).withValues(alpha: isDark ? 0.15 : 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _getDifficultyColor(difficulty!, isDark).withValues(alpha: isDark ? 0.45 : 0.4),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getDifficultyIcon(difficulty!),
                            size: 13,
                            color: _getDifficultyColor(difficulty!, isDark),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            difficulty!.toUpperCase(),
                            style: TextStyle(
                              color: _getDifficultyColor(difficulty!, isDark),
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              if (subtopicTitle.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: subtopicBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    subtopicTitle,
                    style: TextStyle(
                      color: subtopicTextColor,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Divider(color: dividerColor, height: 1),
              const SizedBox(height: 14),

              // Solution figure (if any)
              if (sourceImages.isNotEmpty) ...[
                SourcePageView(images: sourceImages, label: 'Çözüm Şekli / Şeması'),
                const SizedBox(height: 14),
              ],
              _buildStructuredSolution(solutionText, isDark),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStructuredSolution(String text, bool isDark) {
    final sections = _parseSolutionSections(text);
    if (sections.length <= 1 && sections.first.type == _SectionType.normal) {
      return MathRichText(
        text: text,
        selectable: true,
        style: TextStyle(
          color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
          fontSize: 14.5,
          height: 1.55,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((s) => _buildSectionWidget(s, isDark)).toList(),
    );
  }

  Widget _buildSectionWidget(_ParsedSection section, bool isDark) {
    switch (section.type) {
      case _SectionType.formula:
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF1E1B4B).withValues(alpha: 0.6)
                : const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? const Color(0xFF6366F1).withValues(alpha: 0.4)
                  : const Color(0xFFC7D2FE),
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.menu_book_rounded,
                color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5),
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MathRichText(
                  text: section.content,
                  selectable: true,
                  style: TextStyle(
                    color: isDark ? const Color(0xFFE0E7FF) : const Color(0xFF312E81),
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );

      case _SectionType.trap:
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF451A03).withValues(alpha: 0.6)
                : const Color(0xFFFFFBEB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? const Color(0xFFF59E0B).withValues(alpha: 0.4)
                  : const Color(0xFFFDE68A),
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706),
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MathRichText(
                  text: section.content,
                  selectable: true,
                  style: TextStyle(
                    color: isDark ? const Color(0xFFFEF3C7) : const Color(0xFF78350F),
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );

      case _SectionType.pratik:
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF064E3B).withValues(alpha: 0.6)
                : const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? const Color(0xFF10B981).withValues(alpha: 0.4)
                  : const Color(0xFFA7F3D0),
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.bolt_rounded,
                color: isDark ? const Color(0xFF34D399) : const Color(0xFF059669),
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MathRichText(
                  text: section.content,
                  selectable: true,
                  style: TextStyle(
                    color: isDark ? const Color(0xFFD1FAE5) : const Color(0xFF065F46),
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );

      case _SectionType.ignored:
        return const SizedBox.shrink();

      case _SectionType.normal:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: MathRichText(
            text: section.content,
            selectable: true,
            style: TextStyle(
              color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
              fontSize: 14.5,
              height: 1.55,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
    }
  }

  List<_ParsedSection> _parseSolutionSections(String fullText) {
    final lines = fullText.split('\n');
    final List<_ParsedSection> sections = [];
    _SectionType currentType = _SectionType.normal;
    final buffer = StringBuffer();

    void flush() {
      if (buffer.isNotEmpty) {
        if (currentType != _SectionType.ignored) {
          sections.add(_ParsedSection(type: currentType, content: buffer.toString().trim()));
        }
        buffer.clear();
      }
    }

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.startsWith('💡 ALTIN') || trimmed.startsWith('💡 KURAL') || trimmed.startsWith('💡 FORMÜL') || trimmed.startsWith('💡 BİLGİ')) {
        flush();
        currentType = _SectionType.formula;
        buffer.writeln(line);
      } else if (trimmed.startsWith('⚠️ DİKKAT') || trimmed.startsWith('⚠️ ÖSYM TUZAĞI') || trimmed.startsWith('⚠️ TUZAK')) {
        flush();
        currentType = _SectionType.trap;
        buffer.writeln(line);
      } else if (trimmed.startsWith('⚡ PRATİK YOL') || trimmed.startsWith('⚡ TEST TEKNİĞİ') || trimmed.startsWith('⚡ KESTİRME') || trimmed.startsWith('⚡ HAFIZA KODU')) {
        flush();
        currentType = _SectionType.pratik;
        buffer.writeln(line);
      } else if (trimmed.startsWith('🪜 ADIM ADIM') || trimmed.startsWith('🔍 ÇÖZÜM:') || trimmed.startsWith('Doğru cevap') || trimmed.startsWith('DOĞRU CEVAP')) {
        flush();
        currentType = _SectionType.normal;
        buffer.writeln(line);
      } else if (currentType != _SectionType.ignored) {
        buffer.writeln(line);
      }
    }
    flush();

    return sections.isEmpty
        ? [_ParsedSection(type: _SectionType.normal, content: fullText)]
        : sections;
  }
}

enum _SectionType { normal, formula, trap, pratik, ignored }

class _ParsedSection {
  final _SectionType type;
  final String content;

  _ParsedSection({required this.type, required this.content});
}
