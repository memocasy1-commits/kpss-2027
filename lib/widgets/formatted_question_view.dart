import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import 'math_rich_text.dart';

/// A rich, typography-faithful widget that renders exam question stems
/// exactly like authentic printed KPSS books.
///
/// Features:
/// - Single, unified question presentation (no artificial separate tables)
/// - Authentic Roman numeral premise lists (I., II., III., IV.) on separate lines,
///   cleanly aligned on the left, matching official printed KPSS exams
/// - Underlined target words with Roman numeral badges in passages
/// - Bold question prompt (Soru Kökü) positioned directly below premises
/// - Bullet items: •, -
class FormattedQuestionView extends StatelessWidget {
  final String question;
  final double fontSize;
  final bool hasVisualDiagram;

  const FormattedQuestionView({
    super.key,
    required this.question,
    this.fontSize = 16.0,
    this.hasVisualDiagram = false,
  });

  @override
  Widget build(BuildContext context) {
    // Split the raw question into passage/premises and question stem (soru kökü)
    final ParsedQuestion parsed = _parseQuestion(question);

    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        final bool isSepia = themeMode == ThemeModeType.sepia;

        final Color cardBg = AppColors.card;
        final Color readingBoxBg = isDark
            ? const Color(0xFF1E293B)
            : (isSepia ? const Color(0xFFF3EBD8) : const Color(0xFFF1F5F9));

        return SelectionArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.cardBorder,
                width: 1.2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Passage / Context / Premises (Dedicated Reading Box)
                if (parsed.passage.isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: readingBoxBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.cardBorder.withValues(alpha: 0.7),
                        width: 1.0,
                      ),
                    ),
                    child: _buildPassageContent(context, parsed.passage),
                  ),
                  if (parsed.prompt.isNotEmpty) const SizedBox(height: 14),
                ],

                // Soru Kökü (Prompt) - Bold, high-contrast, authentic exam typography
                if (parsed.prompt.isNotEmpty)
                  _buildPromptText(context, parsed.prompt),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Parses the question text into passage (including premises) and question prompt.
  ParsedQuestion _parseQuestion(String raw) {
    String text = raw.trim();

    String passage = '';
    String prompt = '';

    // Check if there is an explicit Soru: separator (e.g. "<b>Soru:</b> ...")
    final soruMatch = RegExp(r'\n\s*(<b>|\*\*)*Soru:?(<\/b>|\*\*)*\s*', caseSensitive: false).firstMatch(text);
    if (soruMatch != null) {
      passage = text.substring(0, soruMatch.start).trim();
      prompt = text.substring(soruMatch.end).trim();
    } else {
      // Check for markdown bold prompt: **...** at the end
      final RegExp boldPattern = RegExp(r'\*\*([^*]+)\*\*\s*$');
      final matchBold = boldPattern.firstMatch(text);
      if (matchBold != null) {
        prompt = matchBold.group(1)!.trim();
        passage = text.substring(0, matchBold.start).trim();
      } else {
      // Look for explicit double newlines separating passage from prompt
      final List<String> paragraphs = text.split(RegExp(r'\n\s*\n'));
      if (paragraphs.length >= 2) {
        final lastPara = paragraphs.last.trim();
        if (_looksLikePrompt(lastPara)) {
          passage = paragraphs.sublist(0, paragraphs.length - 1).join('\n\n').trim();
          prompt = lastPara;
        }
      }

      if (prompt.isEmpty) {
        // Look for prompt indicator keywords in text
        final RegExp promptKeywords = RegExp(
          r'(\n|^)(Bu parçad[a-z]*|Bu dizelerd[a-z]*|Bu cüml[a-z]*|Aşağıdaki[a-z]*|Yukarıdaki[a-z]*|Yukarıda verilenlerden|Buna göre|Hangisi[a-z]*|Parçadaki numaralanmış|Verilen[a-z]*).*?\?',
          caseSensitive: false,
          dotAll: true,
        );

        final m = promptKeywords.firstMatch(text);
        if (m != null && m.start > 0) {
          passage = text.substring(0, m.start).trim();
          prompt = text.substring(m.start).trim();
        } else if (_looksLikePrompt(text)) {
          passage = '';
          prompt = text;
        } else {
          passage = text;
          prompt = '';
        }
      }
    }
  }

  return ParsedQuestion(
      passage: passage,
      prompt: prompt,
    );
  }

  bool _looksLikePrompt(String s) {
    if (s.endsWith('?') || s.endsWith('?**') || s.endsWith('?_')) return true;
    final lower = s.toLowerCase();
    return lower.startsWith('bu parça') ||
        lower.startsWith('bu dize') ||
        lower.startsWith('bu cümle') ||
        lower.startsWith('aşağıdaki') ||
        lower.startsWith('yukarıdaki') ||
        lower.startsWith('yukarıda') ||
        lower.startsWith('buna göre') ||
        lower.contains('hangisidir?') ||
        lower.contains('söylenemez?') ||
        lower.contains('yanlıştır?') ||
        lower.contains('ulaşılamaz?') ||
        lower.contains('değildir?') ||
        lower.contains('farklıdır?');
  }

  /// Builds the passage content, respecting lines, Roman numeral premises, rich formatting,
  /// and specialized ASCII/Unicode diagrams, floor plans, and matrix tables.
  Widget _buildPassageContent(BuildContext context, String passage) {
    final List<String> lines = passage.split('\n');
    final List<Widget> lineWidgets = [];

    int i = 0;
    while (i < lines.length) {
      final line = lines[i].trim();
      if (line.isEmpty) {
        lineWidgets.add(const SizedBox(height: 8));
        i++;
        continue;
      }

      // Check for code block or table/diagram lines
      final bool isTableOrDiagramStart = line.startsWith('```') ||
          line.startsWith('┌') ||
          line.startsWith('├') ||
          line.startsWith('│') ||
          line.startsWith('└') ||
          line.startsWith('+---') ||
          (line.startsWith('|') && line.endsWith('|')) ||
          line.startsWith('[ŞEMA]') ||
          line.startsWith('[TABLO]') ||
          line.startsWith('[YERLEŞİM]') ||
          line.startsWith('[ROTA]');

      if (isTableOrDiagramStart) {
        List<String> diagramLines = [];
        bool isFenced = line.startsWith('```');
        if (isFenced) {
          i++; // Skip opening ```
          while (i < lines.length && !lines[i].trim().startsWith('```')) {
            diagramLines.add(lines[i]);
            i++;
          }
          if (i < lines.length && lines[i].trim().startsWith('```')) {
            i++; // Skip closing ```
          }
        } else {
          while (i < lines.length) {
            final cur = lines[i].trim();
            if (cur.isEmpty) break;
            if (cur.startsWith('┌') ||
                cur.startsWith('├') ||
                cur.startsWith('│') ||
                cur.startsWith('└') ||
                cur.startsWith('+---') ||
                (cur.startsWith('|') && cur.endsWith('|')) ||
                cur.startsWith('[') ||
                cur.contains('──►') ||
                cur.contains('├──────') ||
                cur.contains('➔') ||
                cur.startsWith('•') == false && (cur.contains('│') || cur.contains('|'))) {
              diagramLines.add(lines[i]);
              i++;
            } else {
              break;
            }
          }
        }

        if (diagramLines.isNotEmpty) {
          if (!hasVisualDiagram) {
            lineWidgets.add(_buildDiagramCard(context, diagramLines.join('\n')));
          }
          continue;
        }
      }

      // Check for ÖSYM scenario instruction header: e.g. "1 - 4. Soruları..." or "(1-4) Soruları..."
      final cleanTextOnly = line.replaceAll(RegExp(r'<[^>]*>'), '').trim();
      final isScenarioHeader = RegExp(r'^\s*(\d+\s*[-–—]\s*\d+|\(\d+\s*[-–—]\s*\d+\))\.\s*Sorular', caseSensitive: false).hasMatch(cleanTextOnly);
      if (isScenarioHeader) {
        lineWidgets.add(
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.35), width: 1.2),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline_rounded, color: AppColors.primaryLight, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    cleanTextOnly,
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: fontSize * 0.88,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        i++;
        continue;
      }

      // Check for numbered premise line: e.g. "I. ...", "II. ...", "IV. ..."
      final matchRomanLine = RegExp(r'^(I|II|III|IV|V|VI|VII|VIII|IX|X)\.\s*(.*)$').firstMatch(line);
      if (matchRomanLine != null) {
        final roman = matchRomanLine.group(1)!;
        final content = matchRomanLine.group(2)!;
        lineWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  child: Text(
                    '$roman.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                Expanded(
                  child: _buildRichLine(context, content),
                ),
              ],
            ),
          ),
        );
        i++;
        continue;
      }

      // Check for bullet items: e.g. "• ..." or "- ..."
      if (line.startsWith('•') || line.startsWith('-')) {
        final content = line.substring(1).trim();
        lineWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7.0, right: 8.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: _buildRichLine(context, content),
                ),
              ],
            ),
          ),
        );
        i++;
        continue;
      }

      // Normal passage line or verse
      lineWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: _buildRichLine(context, line),
        ),
      );
      i++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lineWidgets,
    );
  }

  /// Builds a dedicated, responsive diagram/table card with horizontal scroll and monospaced typography
  Widget _buildDiagramCard(BuildContext context, String code) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Detect diagram type for chip badge
    String badgeTitle = "MANTIK ŞEMASI / YERLEŞİM";
    IconData badgeIcon = Icons.schema_rounded;
    if (code.contains('TERAZİ') || code.contains('Terazi') || code.contains('▲') || code.contains('■')) {
      badgeTitle = "DENGE / TERAZİ ŞEMASI";
      badgeIcon = Icons.balance_rounded;
    } else if (code.contains('Çark') || code.contains('ÇARK') || code.contains('Dişli') || code.contains('DİŞLİ')) {
      badgeTitle = "ÇARK & DİŞLİ MEKANİZMASI";
      badgeIcon = Icons.settings_suggest_rounded;
    } else if (code.contains('GİRİŞ') || code.contains('Akış') || code.contains('ÇIKIŞ') || code.contains('Adım')) {
      badgeTitle = "İŞLEM MAKİNESİ / AKIŞ ŞEMASI";
      badgeIcon = Icons.account_tree_rounded;
    } else if (code.contains('Izgara') || code.contains('Çöp') || code.contains('Kibrit')) {
      badgeTitle = "ŞEKİL ÖRÜNTÜSÜ / KİBRİT IZGARASI";
      badgeIcon = Icons.grid_on_rounded;
    } else if (code.contains('Sihirli') || code.contains('Matris') || code.contains('┌───────┬───────┬───────┐')) {
      badgeTitle = "SAYISAL MATRİS / SİHİRLİ KARE";
      badgeIcon = Icons.grid_4x4_rounded;
    } else if (code.contains('Doğu') || code.contains('Batı') || code.contains('Kat') || code.contains('Daire')) {
      badgeTitle = "YERLEŞİM / KAT PLANI";
      badgeIcon = Icons.apartment_rounded;
    } else if (code.contains('Koltuk') || code.contains('Cam') || code.contains('Koridor') || code.contains('Masa')) {
      badgeTitle = "OTURMA / VAGON PLANI";
      badgeIcon = Icons.event_seat_rounded;
    } else if (code.contains('➔') || code.contains('──►') || code.contains('Durak') || code.contains('Rota') || code.contains('km')) {
      badgeTitle = "GÜZERGAH / ROTA AKIŞ ŞEMASI";
      badgeIcon = Icons.alt_route_rounded;
    } else if (code.contains('|') || code.contains('Kontenjan') || code.contains('Grup') || code.contains('Branş') || code.contains('Üretim')) {
      badgeTitle = "VERİ & EŞLEŞTİRME TABLOSU";
      badgeIcon = Icons.table_chart_rounded;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF131822) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryLight.withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Badge
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Icon(badgeIcon, size: 15, color: AppColors.primaryLight),
                const SizedBox(width: 6),
                Text(
                  badgeTitle,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        code.trim(),
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: (fontSize * 0.82).clamp(11.0, 14.5),
                          height: 1.38,
                          fontWeight: FontWeight.w600,
                          color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a single line of rich text, parsing:
  /// - `<u>word</u> (I)` -> underlined word with Roman numeral directly BELOW it
  /// - `<u>word</u>` -> underlined word
  /// - `(I)`, `(II)` -> Roman numeral badge
  /// - `<b>word</b>`, `<strong>word</strong>`, `**word**` -> bold
  /// - `<i>word</i>`, `<em>word</em>`, `*word*` -> italic
  Widget _buildRichLine(BuildContext context, String text, {bool bold = false}) {
    final List<InlineSpan> spans = [];

    final RegExp tokenRegex = RegExp(
      r'\\?frac\{([^{}]+)\}\{([^{}]+)\}|' // 1, 2: \frac{num}{den}
      r'(\b\d+\s+)?\(([A-Za-z0-9_\+\-\*\s\.\,]+)\/([A-Za-z0-9_\+\-\*\s\.\,]+)\)|' // 3, 4, 5: (num/den)
      r'(?<![\w\/\d])(-?\b\d+)\/(\d+\b)(?![\w\/\d])|' // 6, 7: simple 3/4
      r'(?<![\w\/\d])([a-zA-Z])\/([a-zA-Z])(?![\w\/\d])|' // 8, 9: simple a/b
      r'\\?sqrt\{([^{}]+)\}|sqrt\(([^()]+)\)|√\(([^()]+)\)|√([A-Za-z0-9]+)|' // 10, 11, 12, 13: square root
      r'([A-Za-z0-9\)])\^\{([^{}]+)\}|([A-Za-z0-9\)])\^([A-Za-z0-9]+)|' // 14, 15, 16, 17: exponent
      r'<u>(.*?)<\/u>\s*\(([IVX]+)\)|'    // 18, 19: <u>word</u> (ROMAN)
      r'\(([IVX]+)\)\s*<u>(.*?)<\/u>|'    // 20, 21: (ROMAN) <u>word</u>
      r'<u>(.*?)\s*\(([IVX]+)\)<\/u>|'    // 22, 23: <u>word (ROMAN)</u>
      r'(\(([IVX]+)\))|'                  // 24, 25: (ROMAN) standalone
      r'<u>(.*?)<\/u>|'                   // 26: <u>word</u> standalone
      r'<b>(.*?)<\/b>|'                   // 27: <b>bold</b>
      r'<strong>(.*?)<\/strong>|'         // 28: <strong>bold</strong>
      r'(\*\*(.*?)\*\*)|'                 // 29, 30: **bold**
      r'<i>(.*?)<\/i>|'                   // 31: <i>italic</i>
      r'<em>(.*?)<\/em>|'                 // 32: <em>italic</em>
      r'(\*(.*?)\*)',                     // 33, 34: *italic*
      caseSensitive: false,
    );

    int lastIndex = 0;
    for (final match in tokenRegex.allMatches(text)) {
      if (match.start > lastIndex) {
        final plainText = text.substring(lastIndex, match.start);
        spans.add(TextSpan(
          text: _formatMathSymbols(plainText),
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: fontSize,
            height: 1.55,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          ),
        ));
      }

      if (match.group(1) != null && match.group(2) != null) {
        // \frac{num}{den}
        spans.add(_buildFractionSpan(match.group(1)!, match.group(2)!, bold: bold));
      } else if (match.group(4) != null && match.group(5) != null) {
        // (num/den) with optional mixed number
        final whole = match.group(3)?.trim();
        if (whole != null && whole.isNotEmpty) {
          spans.add(TextSpan(
            text: '$whole ',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: fontSize,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
            ),
          ));
        }
        spans.add(_buildFractionSpan(match.group(4)!, match.group(5)!, bold: bold));
      } else if (match.group(6) != null && match.group(7) != null) {
        // 3/4 or -1/2
        spans.add(_buildFractionSpan(match.group(6)!, match.group(7)!, bold: bold));
      } else if (match.group(8) != null && match.group(9) != null) {
        // a/b or x/y
        spans.add(_buildFractionSpan(match.group(8)!, match.group(9)!, bold: bold));
      } else if (match.group(10) != null ||
          match.group(11) != null ||
          match.group(12) != null ||
          match.group(13) != null) {
        // Square root
        final inner = match.group(10) ?? match.group(11) ?? match.group(12) ?? match.group(13)!;
        spans.add(MathSpanBuilder.buildSquareRootWidgetSpan(
          inner: inner,
          baseFontSize: fontSize,
          textColor: AppColors.textPrimary,
          baseStyle: TextStyle(fontSize: fontSize, color: AppColors.textPrimary),
        ));
      } else if ((match.group(14) != null && match.group(15) != null) ||
          (match.group(16) != null && match.group(17) != null)) {
        // Exponent: base^exp
        final base = match.group(14) ?? match.group(16)!;
        final exp = match.group(15) ?? match.group(17)!;
        spans.add(TextSpan(
          text: base,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          ),
        ));
        spans.add(WidgetSpan(
          alignment: PlaceholderAlignment.top,
          child: Padding(
            padding: const EdgeInsets.only(left: 1.0, bottom: 6.0),
            child: Text(
              exp,
              style: TextStyle(
                fontSize: (fontSize * 0.72).clamp(9.0, 13.0),
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ));
      } else if (match.group(18) != null && match.group(19) != null) {
        // <u>word</u> (ROMAN) -> Render word with Roman numeral underneath
        spans.add(_buildUnderlinedWordWithRomanBelow(match.group(18)!, match.group(19)!.toUpperCase()));
      } else if (match.group(20) != null && match.group(21) != null) {
        // (ROMAN) <u>word</u> -> Render word with Roman numeral underneath
        spans.add(_buildUnderlinedWordWithRomanBelow(match.group(21)!, match.group(20)!.toUpperCase()));
      } else if (match.group(22) != null && match.group(23) != null) {
        // <u>word (ROMAN)</u> -> Render word with Roman numeral underneath
        spans.add(_buildUnderlinedWordWithRomanBelow(match.group(22)!, match.group(23)!.toUpperCase()));
      } else if (match.group(25) != null) {
        // Standalone Roman badge: (I), (II), etc.
        spans.add(_buildRomanBadgeSpan(match.group(25)!.toUpperCase()));
      } else if (match.group(26) != null) {
        // Standalone underlined word: <u>...</u>
        spans.add(TextSpan(
          text: match.group(26)!,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryLight,
            decorationThickness: 2.0,
          ),
        ));
      } else if (match.group(27) != null) {
        // <b>...</b>
        spans.add(TextSpan(
          text: match.group(27)!,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ));
      } else if (match.group(28) != null) {
        // <strong>...</strong>
        spans.add(TextSpan(
          text: match.group(28)!,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ));
      } else if (match.group(30) != null) {
        // Bold: **...**
        spans.add(TextSpan(
          text: match.group(30)!,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ));
      } else if (match.group(31) != null || match.group(32) != null || match.group(34) != null) {
        // Italic: <i>, <em> or *...*
        final italicText = match.group(31) ?? match.group(32) ?? match.group(34)!;
        spans.add(TextSpan(
          text: italicText,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: fontSize,
            fontStyle: FontStyle.italic,
          ),
        ));
      }

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: _formatMathSymbols(text.substring(lastIndex)),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: fontSize,
          height: 1.55,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
        ),
      ));
    }

    final bool hasUnderlinedRoman = text.contains('<u>') && RegExp(r'\([IVX]+\)', caseSensitive: false).hasMatch(text);
    final double lineSpacing = hasUnderlinedRoman ? 1.95 : 1.55;

    return Text.rich(
      TextSpan(children: spans),
      style: TextStyle(fontSize: fontSize, height: lineSpacing),
    );
  }

  /// Builds an authentic exam typography widget where the Roman numeral
  /// appears centered DIRECTLY UNDERNEATH the underlined word, exactly like
  /// printed KPSS books.
  InlineSpan _buildUnderlinedWordWithRomanBelow(String rawWord, String roman) {
    // Separate trailing punctuation if inside the word
    String word = rawWord.trim();
    String trailingPunct = '';
    final punctMatch = RegExp(r'([.,;:!]+)$').firstMatch(word);
    if (punctMatch != null) {
      trailingPunct = punctMatch.group(1)!;
      word = word.substring(0, punctMatch.start).trim();
    }

    final widgetSpan = WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 1.5, top: 1.0, bottom: 2.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Underlined target word
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textPrimary,
                    width: 1.8,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                word,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  height: 1.15,
                ),
              ),
            ),
            const SizedBox(height: 2.0),
            // Roman numeral centered directly below the underlined word
            Text(
              roman,
              style: TextStyle(
                color: AppColors.primaryLight,
                fontSize: fontSize * 0.74,
                fontWeight: FontWeight.w800,
                fontFamily: 'Inter',
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );

    if (trailingPunct.isNotEmpty) {
      return TextSpan(
        children: [
          widgetSpan,
          TextSpan(
            text: trailingPunct,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    }

    return widgetSpan;
  }

  /// Builds a prominent, stylish badge for standalone inline Roman numerals like `(I)`, `(II)`
  InlineSpan _buildRomanBadgeSpan(String roman) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Container(
        margin: const EdgeInsets.only(left: 3, right: 5, bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.primaryLight.withValues(alpha: 0.6),
            width: 1.0,
          ),
        ),
        child: Text(
          roman,
          style: TextStyle(
            color: AppColors.primaryLight,
            fontSize: fontSize * 0.76,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  /// Builds a real mathematical vertical fraction (numerator over denominator with fraction line)
  InlineSpan _buildFractionSpan(String numerator, String denominator, {bool bold = false}) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                numerator.trim(),
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize * 0.92,
                  fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                height: 1.5,
                color: AppColors.primaryLight,
              ),
              Text(
                denominator.trim(),
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize * 0.92,
                  fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatMathSymbols(String input) => MathSpanBuilder.formatMathSymbols(input);

  /// Builds the bold question prompt (Soru Kökü), matching authentic printed KPSS book typography
  Widget _buildPromptText(BuildContext context, String prompt) {
    String cleanPrompt = prompt.trim();
    cleanPrompt = cleanPrompt.replaceAll(RegExp(r'^(<b>|\*\*|\s)*Soru:?\s*(<\/b>|\*\*|\s)*', caseSensitive: false), '');
    if (cleanPrompt.startsWith('**') && cleanPrompt.endsWith('**')) {
      cleanPrompt = cleanPrompt.substring(2, cleanPrompt.length - 2).trim();
    }
    if (cleanPrompt.startsWith('<b>') && cleanPrompt.endsWith('</b>')) {
      cleanPrompt = cleanPrompt.substring(3, cleanPrompt.length - 4).trim();
    }

    return _buildRichLine(context, cleanPrompt, bold: true);
  }
}

class ParsedQuestion {
  final String passage;
  final String prompt;

  ParsedQuestion({
    required this.passage,
    required this.prompt,
  });
}
