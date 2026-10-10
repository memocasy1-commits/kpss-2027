import 'package:flutter/material.dart';

/// KPSS Matematik Özel Tipografik İfade ve Dikey Kesir Render Motoru
///
/// Metin içerisindeki tüm matematiksel kesirleri (basit, bileşik, parantezli),
/// köklü ifadeleri, devirli sayıları ve üslü gösterimleri gerçek bir
/// ders kitabı / ÖSYM sınavı kalitesinde dikey tipografiyle render eder.
class MathExpressionWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  const MathExpressionWidget({
    super.key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return _buildRichText(context, text, style);
  }

  /// Dışarıdan statik olarak InlineSpan listesi veya Widget üretmek için metod
  static Widget format(
    String text, {
    required TextStyle style,
    TextAlign textAlign = TextAlign.start,
  }) {
    return MathExpressionWidget(
      text: text,
      style: style,
      textAlign: textAlign,
    );
  }

  static const Map<String, String> _superscriptMap = {
    '0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴',
    '5': '⁵', '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹',
    '+': '⁺', '-': '⁻', '=': '⁼', '(': '⁽', ')': '⁾',
    'a': 'ᵃ', 'b': 'ᵇ', 'c': 'ᶜ', 'd': 'ᵈ', 'e': 'ᵉ',
    'k': 'ᵏ', 'm': 'ᵐ', 'n': 'ⁿ', 'p': 'ᵖ', 'r': 'ʳ',
    's': 'ˢ', 't': 'ᵗ', 'x': 'ˣ', 'y': 'ʸ', 'z': 'ᶻ',
  };

  /// Matematiksel sembol, üslü sayı ve köklü ifade Unicode normalizasyonu
  static String normalizeMathText(String input) {
    if (input.isEmpty) return input;
    String s = input;

    // 1. Semboller
    s = s.replaceAll(r'\pm', '±').replaceAll('+/-', '±');
    s = s.replaceAll('<=', '≤').replaceAll('>=', '≥');
    s = s.replaceAll(r'\le', '≤').replaceAll(r'\ge', '≥');
    s = s.replaceAll('!=', '≠').replaceAll(r'\neq', '≠');
    s = s.replaceAll(r'\times', '×').replaceAll(r'\cdot', '·');

    // 2. Köklü İfadeler: \sqrt{x} veya sqrt(x)
    s = s.replaceAllMapped(RegExp(r'\\?sqrt\{([^}]+)\}'), (m) => '√(${m.group(1)})');
    s = s.replaceAllMapped(RegExp(r'\bsqrt\(([^)]+)\)'), (m) => '√(${m.group(1)})');

    // 3. Çarpma Noktası (sayı * sayı veya değişken * değişken)
    s = s.replaceAllMapped(RegExp(r'(?<=\d|[a-zA-Z])\s*\*\s*(?=\d|[a-zA-Z(])'), (m) => ' · ');

    // 4. Parantezli Üsler: x^(2n+1) -> x²ⁿ⁺¹
    s = s.replaceAllMapped(RegExp(r'\^\(([-+0-9a-zA-Z]+)\)'), (m) {
      final exp = m.group(1)!;
      return exp.split('').map((c) => _superscriptMap[c] ?? c).join();
    });

    // 5. Standart Üsler: 2^10, x^2, a^n, 10^-3
    s = s.replaceAllMapped(RegExp(r'\^(-?[0-9]+|[a-zA-Z])'), (m) {
      final exp = m.group(1)!;
      return exp.split('').map((c) => _superscriptMap[c] ?? c).join();
    });

    return s;
  }

  static const String _turkishChars = r'a-zA-Z0-9çğıöşüÇĞİÖŞÜ_';

  static final Set<String> _nonMathWords = {
    'km/sa', 'm/sn', 'm/s', 've/veya', 'kâr/zarar', 'kar/zarar', 'tl/ay', 'kg/sa', 'sayfa/sa',
    'tl', 'ay', 'yıl', 'gün', 'saat', 'dk', 'sn'
  };

  static final Set<String> _allowedLetterVariables = {
    'a', 'b', 'c', 'd', 'e', 'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'x', 'y', 'z',
    'ab', 'ba', 'xy', 'yx', 'mn', 'nm'
  };

  static Widget _buildRichText(BuildContext context, String rawText, TextStyle baseStyle) {
    final text = normalizeMathText(rawText);

    // 1. (pay) / (payda)
    // 2. (pay) / payda
    // 3. pay / (payda)
    // 4. a/b, 3/4, 2x/3, -5/7, 99/100
    final fracRegex = RegExp(
      r'(?:\(([^()\/]+)\)\s*\/\s*\(([^()\/]+)\))' // (a + b) / (c + d)
      r'|(?:\(([^()\/]+)\)\s*\/\s*([a-zA-Z0-9·\s]+))' // (a + b) / c
      r'|(?:([a-zA-Z0-9·\s]+)\s*\/\s*\(([^()\/]+)\))' // a / (b + c)
      '|(?<![$_turkishChars\\/])(-?(?:\\d+[a-zA-Z]*|[a-zA-Z]{1,2}))\\s*\\/\\s*((?:\\d+[a-zA-Z]*|[a-zA-Z]{1,2}))(?![$_turkishChars\\/])', // 3/4, 2x/3, a/b
    );

    if (!fracRegex.hasMatch(text)) {
      return Text(
        text,
        style: baseStyle,
        textAlign: TextAlign.start,
      );
    }

    final spans = <InlineSpan>[];
    int lastEnd = 0;

    for (final match in fracRegex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: baseStyle,
        ));
      }

      String numStr = '';
      String denStr = '';

      final matchedRaw = match.group(0)?.toLowerCase().trim() ?? '';
      if (_nonMathWords.contains(matchedRaw)) {
        spans.add(TextSpan(text: match.group(0), style: baseStyle));
        lastEnd = match.end;
        continue;
      }

      if (match.group(1) != null && match.group(2) != null) {
        // (pay) / (payda)
        numStr = match.group(1)!.trim();
        denStr = match.group(2)!.trim();
      } else if (match.group(3) != null && match.group(4) != null) {
        // (pay) / payda
        numStr = match.group(3)!.trim();
        denStr = match.group(4)!.trim();
      } else if (match.group(5) != null && match.group(6) != null) {
        // pay / (payda)
        numStr = match.group(5)!.trim();
        denStr = match.group(6)!.trim();
      } else if (match.group(7) != null && match.group(8) != null) {
        // a / b
        numStr = match.group(7)!.trim();
        denStr = match.group(8)!.trim();

        // 1808/1876 gibi 4 basamaklı yıl aralıklarını kesir yapma
        if (RegExp(r'^(?:18|19|20)\d{2}$').hasMatch(numStr) &&
            RegExp(r'^(?:18|19|20)\d{2}$').hasMatch(denStr)) {
          spans.add(TextSpan(text: match.group(0), style: baseStyle));
          lastEnd = match.end;
          continue;
        }

        // Eğer iki tarafta da rakam yoksa (örn: a/b, x/y), sadece geçerli matematik değişkenlerine izin ver
        final bool numHasDigit = RegExp(r'\d').hasMatch(numStr);
        final bool denHasDigit = RegExp(r'\d').hasMatch(denStr);
        if (!numHasDigit && !denHasDigit) {
          final cleanNum = numStr.replaceAll('-', '').toLowerCase();
          final cleanDen = denStr.toLowerCase();
          if (!_allowedLetterVariables.contains(cleanNum) || !_allowedLetterVariables.contains(cleanDen)) {
            spans.add(TextSpan(text: match.group(0), style: baseStyle));
            lastEnd = match.end;
            continue;
          }
        }
      }

      final bool isNegative = numStr.startsWith('-');
      if (isNegative) {
        numStr = numStr.substring(1).trim();
      }

      final double fontSize = baseStyle.fontSize ?? 14.0;
      final Color color = baseStyle.color ?? Colors.black;

      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isNegative)
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: baseStyle.fontWeight ?? FontWeight.w700,
                        color: color,
                        height: 1.0,
                      ),
                    ),
                  ),
                IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Pay (Numerator)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.5),
                        child: Text(
                          numStr,
                          style: TextStyle(
                            fontSize: fontSize * (numStr.length > 3 ? 0.72 : 0.76),
                            fontWeight: FontWeight.w700,
                            color: color,
                            height: 1.05,
                          ),
                        ),
                      ),
                      // Kesir Çizgisi (Fraction Bar)
                      Container(
                        height: 1.3,
                        margin: const EdgeInsets.symmetric(vertical: 2.2),
                        color: color.withValues(alpha: 0.9),
                      ),
                      // Payda (Denominator)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.5),
                        child: Text(
                          denStr,
                          style: TextStyle(
                            fontSize: fontSize * (denStr.length > 3 ? 0.72 : 0.76),
                            fontWeight: FontWeight.w700,
                            color: color,
                            height: 1.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: baseStyle,
      ));
    }

    return Text.rich(
      TextSpan(children: spans),
      style: baseStyle,
      textAlign: TextAlign.start,
    );
  }
}
