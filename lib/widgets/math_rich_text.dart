import 'package:flutter/material.dart';

/// A rich mathematical typography widget that automatically parses and renders
/// mathematical formulas, vertical fractions (rasyonel sayılar), exponents (üslü sayılar),
/// square roots (köklü sayılar), and mathematical operators in ÖSYM exam quality.
class MathRichText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool selectable;

  const MathRichText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    final effectiveStyle = defaultStyle.merge(style);
    final double baseFontSize = effectiveStyle.fontSize ?? 15.0;
    final Color textColor = effectiveStyle.color ?? Colors.black87;

    final spans = MathSpanBuilder.buildSpans(
      text: text,
      baseStyle: effectiveStyle,
      baseFontSize: baseFontSize,
      textColor: textColor,
    );

    final textSpan = TextSpan(children: spans, style: effectiveStyle);

    if (selectable) {
      return SelectableText.rich(
        textSpan,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    }

    return Text.rich(
      textSpan,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Helper class that parses raw text and produces InlineSpans with
/// real vertical fractions, superscripts, roots, and math symbols.
class MathSpanBuilder {
  static List<InlineSpan> buildSpans({
    required String text,
    required TextStyle baseStyle,
    required double baseFontSize,
    required Color textColor,
  }) {
    if (text.isEmpty) return [];

    final List<InlineSpan> result = [];

    // Master Regex for Math Expressions:
    // 1. LaTeX fraction: \frac{a}{b} or frac{a}{b}
    // 2. Parenthesized fraction: (a/b) where a and b are algebraic expressions or numbers
    // 3. Standalone simple fraction: e.g. " 3/4 ", " 12/5 ", " a/b ", "-1/2" (not dates like 24/09/2026 or URLs)
    // 4. Exponents: e.g. x^2, 2^10, a^(n+1), b²
    // 5. Square roots: \sqrt{x}, sqrt(x), √(x)
    // 6. Bold/Italic markdown tokens
    final RegExp mathTokenRegex = RegExp(
      r'\\?frac\{([^{}]+)\}\{([^{}]+)\}|' // 1, 2: \frac{num}{den}
      r'(\b\d+\s+)?\(([A-Za-z0-9_\+\-\*\s\.\,\!·√²³⁴⁵⁶⁷⁸⁹ⁿ\^\(\)]+)\/([A-Za-z0-9_\+\-\*\s\.\,\!·√²³⁴⁵⁶⁷⁸⁹ⁿ\^\(\)]+)\)|' // 3, 4, 5: mixed or (num/den) with factorials, roots, powers
      r'(?<![\w\/\d])(-?\b\d+)\/(\d+\b)(?![\w\/\d])|' // 6, 7: simple standalone numeric fraction: 3/4, -1/2
      r'(?<![\w\/\d])([a-zA-Z])\/([a-zA-Z])(?![\w\/\d])|' // 8, 9: simple variable fraction: a/b, x/y
      r'\\?sqrt\{([^{}]+)\}|sqrt\(([^()]+)\)|√\(([^()]+)\)|√([A-Za-z0-9]+)|' // 10, 11, 12, 13: square root
      r'([A-Za-z0-9\)])\^\{([^{}]+)\}|([A-Za-z0-9\)])\^(-?[A-Za-z0-9]+)|' // 14, 15, 16, 17: exponent base^exp including negative
      r'<b>(.*?)<\/b>|<strong>(.*?)<\/strong>|(\*\*(.*?)\*\*)|' // 18, 19, 20, 21: bold
      r'<i>(.*?)<\/i>|<em>(.*?)<\/em>|(\*(.*?)\*)', // 22, 23, 24, 25: italic
      caseSensitive: false,
    );

    int lastIndex = 0;

    for (final match in mathTokenRegex.allMatches(text)) {
      if (match.start > lastIndex) {
        final plainText = text.substring(lastIndex, match.start);
        result.add(TextSpan(text: formatMathSymbols(plainText), style: baseStyle));
      }

      if (match.group(1) != null && match.group(2) != null) {
        // \frac{num}{den}
        result.add(buildFractionWidgetSpan(
          numerator: match.group(1)!,
          denominator: match.group(2)!,
          baseFontSize: baseFontSize,
          textColor: textColor,
          baseStyle: baseStyle,
        ));
      } else if (match.group(4) != null && match.group(5) != null) {
        // (num/den) with optional mixed whole number: group(3)
        final whole = match.group(3)?.trim();
        if (whole != null && whole.isNotEmpty) {
          result.add(TextSpan(
            text: '$whole ',
            style: baseStyle.copyWith(fontWeight: FontWeight.w600),
          ));
        }
        result.add(buildFractionWidgetSpan(
          numerator: match.group(4)!,
          denominator: match.group(5)!,
          baseFontSize: baseFontSize,
          textColor: textColor,
          baseStyle: baseStyle,
        ));
      } else if (match.group(6) != null && match.group(7) != null) {
        // 3/4 or -1/2
        result.add(buildFractionWidgetSpan(
          numerator: match.group(6)!,
          denominator: match.group(7)!,
          baseFontSize: baseFontSize,
          textColor: textColor,
          baseStyle: baseStyle,
        ));
      } else if (match.group(8) != null && match.group(9) != null) {
        // a/b or x/y
        result.add(buildFractionWidgetSpan(
          numerator: match.group(8)!,
          denominator: match.group(9)!,
          baseFontSize: baseFontSize,
          textColor: textColor,
          baseStyle: baseStyle,
        ));
      } else if (match.group(10) != null ||
          match.group(11) != null ||
          match.group(12) != null ||
          match.group(13) != null) {
        // Square root: \sqrt{...} or sqrt(...) or √(x)
        final inner = match.group(10) ??
            match.group(11) ??
            match.group(12) ??
            match.group(13)!;
        result.add(buildSquareRootWidgetSpan(
          inner: inner,
          baseFontSize: baseFontSize,
          textColor: textColor,
          baseStyle: baseStyle,
        ));
      } else if ((match.group(14) != null && match.group(15) != null) ||
          (match.group(16) != null && match.group(17) != null)) {
        // Exponent: base^exp
        final base = match.group(14) ?? match.group(16)!;
        final exp = match.group(15) ?? match.group(17)!;
        result.add(TextSpan(text: base, style: baseStyle));
        result.add(WidgetSpan(
          alignment: PlaceholderAlignment.top,
          child: Padding(
            padding: const EdgeInsets.only(left: 1.0, bottom: 6.0),
            child: Text(
              exp,
              style: baseStyle.copyWith(
                fontSize: (baseFontSize * 0.72).clamp(9.0, 13.0),
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ));
      } else if (match.group(18) != null ||
          match.group(19) != null ||
          match.group(21) != null) {
        // Bold
        final boldContent = match.group(18) ?? match.group(19) ?? match.group(21)!;
        result.addAll(buildSpans(
          text: boldContent,
          baseStyle: baseStyle.copyWith(fontWeight: FontWeight.w700),
          baseFontSize: baseFontSize,
          textColor: textColor,
        ));
      } else if (match.group(22) != null ||
          match.group(23) != null ||
          match.group(25) != null) {
        // Italic
        final italicContent = match.group(22) ?? match.group(23) ?? match.group(25)!;
        result.addAll(buildSpans(
          text: italicContent,
          baseStyle: baseStyle.copyWith(fontStyle: FontStyle.italic),
          baseFontSize: baseFontSize,
          textColor: textColor,
        ));
      }

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      final remaining = text.substring(lastIndex);
      result.add(TextSpan(text: formatMathSymbols(remaining), style: baseStyle));
    }

    return result;
  }

  /// Converts common ascii and LaTeX symbols to beautiful Unicode math operators
  static String formatMathSymbols(String input) {
    return input
        .replaceAll('<=', ' ≤ ')
        .replaceAll('>=', ' ≥ ')
        .replaceAll('!=', ' ≠ ')
        .replaceAll('+-', ' ± ')
        .replaceAll('-+', ' ∓ ')
        .replaceAll('->', ' → ')
        .replaceAll('=>', ' ⇒ ')
        .replaceAll(r'\cdot', '·')
        .replaceAll(r'\times', '×')
        .replaceAll(r'\le', '≤')
        .replaceAll(r'\ge', '≥')
        .replaceAll(r'\neq', '≠')
        .replaceAll(r'\pm', '±')
        .replaceAll(r'\mp', '∓')
        .replaceAll(r'\approx', '≈')
        .replaceAll(r'\equiv', '≡')
        .replaceAll(r'\infty', '∞')
        .replaceAll(r'\pi', 'π')
        .replaceAll(r'\alpha', 'α')
        .replaceAll(r'\beta', 'β')
        .replaceAll(r'\theta', 'θ')
        .replaceAll(' * ', ' · ')
        .replaceAll('*', '·');
  }

  /// Builds a real vertical fraction with horizontal bar, perfectly aligned
  static WidgetSpan buildFractionWidgetSpan({
    required String numerator,
    required String denominator,
    required double baseFontSize,
    required Color textColor,
    required TextStyle baseStyle,
  }) {
    String numStr = numerator.trim();
    String denStr = denominator.trim();
    bool isNegative = false;

    if (numStr.startsWith('-')) {
      isNegative = true;
      numStr = numStr.substring(1).trim();
    }

    final double fractionFontSize = (baseFontSize * 0.85).clamp(11.0, 15.0);

    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 1.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isNegative)
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Text(
                  '−',
                  style: baseStyle.copyWith(
                    fontSize: baseFontSize,
                    fontWeight: FontWeight.w700,
                    color: textColor,
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
                    padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 0.5),
                    child: Text(
                      numStr,
                      style: baseStyle.copyWith(
                        fontSize: fractionFontSize,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Kesir Çizgisi (Fraction Divider Bar)
                  Container(
                    height: 1.4,
                    color: textColor.withValues(alpha: 0.85),
                    margin: const EdgeInsets.symmetric(vertical: 1.2),
                  ),
                  // Payda (Denominator)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 0.5),
                    child: Text(
                      denStr,
                      style: baseStyle.copyWith(
                        fontSize: fractionFontSize,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a square root symbol with overline covering the radicand
  static WidgetSpan buildSquareRootWidgetSpan({
    required String inner,
    required double baseFontSize,
    required Color textColor,
    required TextStyle baseStyle,
  }) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '√',
              style: baseStyle.copyWith(
                fontSize: baseFontSize * 1.15,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: textColor.withValues(alpha: 0.85),
                    width: 1.3,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(top: 1.5, left: 1.5, right: 2.5),
              child: Text(
                inner.trim(),
                style: baseStyle.copyWith(
                  fontSize: baseFontSize * 0.92,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
