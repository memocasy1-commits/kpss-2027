import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/question_model.dart';

class PdfService {
  PdfService._();
  static final PdfService instance = PdfService._();

  static pw.Font? _cachedFontRegular;
  static pw.Font? _cachedFontBold;

  static Future<pw.Font> _getFontRegular() async {
    if (_cachedFontRegular != null) return _cachedFontRegular!;
    try {
      final bytes = await rootBundle.load('assets/fonts/roboto-regular.ttf');
      _cachedFontRegular = pw.Font.ttf(bytes);
      return _cachedFontRegular!;
    } catch (e) {
      debugPrint('Local font regular load failed: $e, trying fallback');
      try {
        final font = await PdfGoogleFonts.robotoRegular();
        _cachedFontRegular = font;
        return font;
      } catch (_) {
        return pw.Font.helvetica();
      }
    }
  }

  static Future<pw.Font> _getFontBold() async {
    if (_cachedFontBold != null) return _cachedFontBold!;
    try {
      final bytes = await rootBundle.load('assets/fonts/roboto-bold.ttf');
      _cachedFontBold = pw.Font.ttf(bytes);
      return _cachedFontBold!;
    } catch (e) {
      debugPrint('Local font bold load failed: $e, trying fallback');
      try {
        final font = await PdfGoogleFonts.robotoBold();
        _cachedFontBold = font;
        return font;
      } catch (_) {
        return pw.Font.helveticaBold();
      }
    }
  }

  // Regex to remove all Unicode emoji & pictograph blocks that are missing in standard font
  static final RegExp _emojiRegex = RegExp(
    r'[\u{1F000}-\u{1FAFF}\u{2600}-\u{27BF}\u{FE00}-\u{FE0F}\u{1F900}-\u{1F9FF}\u{200D}]',
    unicode: true,
  );

  // Mathematical, symbol and emoji translation dictionary for universal PDF compatibility
  static final Map<String, String> _symbolMap = {
    // Emojis & Pictographs
    '💡': '', '🪜': '', '📌': '', '🎯': '', '⭐': '', '🔑': '',
    '⚖️': '', '⚖': '', '🧠': '', '⚡': '', '🔥': '', '✅': '',
    '❌': '', '🔍': '', '📚': '', '📐': '', '🏛️': '', '🏛': '',
    '🗺️': '', '🗺': '', '🏷️': '', '🏷': '', '📝': '', '🏆': '',
    '👑': '', '💎': '', '☕': '', '🎉': '', '🚀': '', '📖': '',
    '**': '', '*': '',

    // Blackboard bold number sets
    'ℕ': 'N', 'ℤ': 'Z', 'ℚ': 'Q', 'ℝ': 'R', 'ℂ': 'C',

    // Arrows
    '⇒': ' => ', '→': ' -> ', '←': ' <- ', '↔': ' <-> ',
    '⇔': ' <=> ', '↳': ' -> ', '➔': ' -> ',

    // Comparisons & Operators
    '≤': '<=', '≥': '>=', '≠': '!=', '≈': '~=', '≡': '==',
    '±': '+/-', '×': ' x ', '÷': ' / ', '·': '.', '•': '-',
    '√': 'kök', '∞': 'sonsuz', 'π': 'pi', '∠': 'açı', '°': '°',
    '⊕': '(+)', '⊗': '(x)',

    // Sets & Logic
    '∈': ' elemanıdır ', '∉': ' elemanı değildir ',
    '∩': ' kesişim ', '∪': ' birleşim ',
    '⊂': ' alt kümesidir ', '⊆': ' alt kümesidir ',
    '∅': '{}',

    // Greek letters
    'α': 'alfa', 'β': 'beta', 'θ': 'teta', 'λ': 'lambda',

    // Subscripts
    '₀': '0', '₁': '1', '₂': '2', '₃': '3', '₄': '4',
    '₅': '5', '₆': '6', '₇': '7', '₈': '8', '₉': '9',
    'ₙ': 'n', '₊': '+', '₋': '-',

    // Superscripts
    '⁰': '^0', '¹': '^1', '²': '^2', '³': '^3', '⁴': '^4',
    '⁵': '^5', '⁶': '^6', '⁷': '^7', '⁸': '^8', '⁹': '^9',
    '⁻': '^-', '⁺': '^+', 'ⁿ': '^n', 'ˣ': '^x', 'ʸ': '^y',

    // Quotes & Dashes
    '’': "'", '‘': "'", '“': '"', '”': '"',
    '—': '-', '–': '-',

    // Box drawing & Geometric shapes
    '─': '-', '│': '|', '┼': '+', '┴': '+', '┬': '+',
    '┐': '+', '┌': '+', '├': '+', '┘': '+', '└': '+', '┤': '+',
    '►': '>', '◄': '<', '■': '*', '▼': 'v', '▲': '^', '●': '*',
  };

  /// Cleans markdown tags, emojis, and non-printable Unicode symbols that cause 'tofu' (box with X)
  static String sanitizeText(String text) {
    if (text.isEmpty) return '';
    String result = text;

    _symbolMap.forEach((key, val) {
      if (result.contains(key)) {
        result = result.replaceAll(key, val);
      }
    });

    // Remove any remaining untranslated emojis
    result = result.replaceAll(_emojiRegex, '');

    // Clean leading whitespace from lines where emoji was removed (e.g. " ALTIN BİLGİ" -> "ALTIN BİLGİ")
    return result
        .split('\n')
        .map((line) => line.trimLeft())
        .join('\n')
        .trim();
  }

  Future<void> exportQuestionsAsPdf({
    required BuildContext context,
    required String title,
    required List<Question> questions,
    bool includeSolutions = true,
  }) async {
    // Show loading indicator
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
            ),
            SizedBox(width: 12),
            Text('PDF hazırlanıyor, lütfen bekleyin...'),
          ],
        ),
        duration: Duration(seconds: 2),
      ),
    );

    try {
      final doc = pw.Document();

      // Load Turkish-compatible fonts directly from local assets (100% offline & fast)
      final fontRegular = await _getFontRegular();
      final fontBold = await _getFontBold();

      final cleanTitle = sanitizeText(title);

      // Page theme with margins and font
      final pageTheme = pw.PageTheme(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        theme: pw.ThemeData.withFont(
          base: fontRegular,
          bold: fontBold,
        ),
      );

      // 1. Sorular Sayfaları (MultiPage)
      doc.addPage(
        pw.MultiPage(
          pageTheme: pageTheme,
          header: (pw.Context ctx) => _buildPdfHeader(cleanTitle, questions.length, ctx.pageNumber),
          footer: (pw.Context ctx) => _buildPdfFooter(ctx.pageNumber, ctx.pagesCount),
          build: (pw.Context ctx) {
            return [
              pw.SizedBox(height: 10),
              ...questions.asMap().entries.map((entry) {
                final int idx = entry.key + 1;
                final Question q = entry.value;
                return _buildPdfQuestionItem(idx, q);
              }),
            ];
          },
        ),
      );

      // 2. Cevap Anahtarı Sayfası
      doc.addPage(
        pw.Page(
          pageTheme: pageTheme,
          build: (pw.Context ctx) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildPdfHeader('$cleanTitle - CEVAP ANAHTARI', questions.length, ctx.pageNumber),
                pw.SizedBox(height: 16),
                pw.Text(
                  'CEVAP ANAHTARI',
                  style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
                ),
                pw.SizedBox(height: 12),
                pw.Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: questions.asMap().entries.map((entry) {
                    final idx = entry.key + 1;
                    final q = entry.value;
                    return pw.Container(
                      width: 80,
                      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.grey300),
                        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
                        color: PdfColors.grey100,
                      ),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('$idx.', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                          pw.Text(
                            q.correctAnswer,
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 12,
                              color: PdfColors.indigo700,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                pw.Spacer(),
                _buildPdfFooter(ctx.pageNumber, 1),
              ],
            );
          },
        ),
      );

      // 3. Detaylı Çözümler (Opsiyonel)
      if (includeSolutions) {
        doc.addPage(
          pw.MultiPage(
            pageTheme: pageTheme,
            header: (pw.Context ctx) => _buildPdfHeader('$cleanTitle - DETAYLI ÇÖZÜMLER', questions.length, ctx.pageNumber),
            footer: (pw.Context ctx) => _buildPdfFooter(ctx.pageNumber, ctx.pagesCount),
            build: (pw.Context ctx) {
              return [
                pw.SizedBox(height: 10),
                pw.Text(
                  'DETAYLI ÇÖZÜMLER VE ALTIN BİLGİ REHBERİ',
                  style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
                ),
                pw.SizedBox(height: 12),
                ...questions.asMap().entries.map((entry) {
                  final idx = entry.key + 1;
                  final q = entry.value;
                  final cleanSubtopic = sanitizeText(q.subtopicTitle);
                  final cleanSolution = sanitizeText(q.solution);

                  return pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 12),
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey300),
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                      color: PdfColors.grey50,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Container(
                              padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: const pw.BoxDecoration(
                                color: PdfColors.indigo700,
                                borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
                              ),
                              child: pw.Text(
                                'Soru $idx',
                                style: const pw.TextStyle(color: PdfColors.white, fontSize: 10),
                              ),
                            ),
                            pw.SizedBox(width: 8),
                            pw.Text(
                              'Doğru Cevap: ${q.correctAnswer}',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11, color: PdfColors.green800),
                            ),
                            pw.Spacer(),
                            if (cleanSubtopic.isNotEmpty)
                              pw.Text(
                                cleanSubtopic,
                                style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
                              ),
                          ],
                        ),
                        pw.SizedBox(height: 6),
                        pw.Text(
                          cleanSolution,
                          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey800, lineSpacing: 2),
                        ),
                      ],
                    ),
                  );
                }),
              ];
            },
          ),
        );
      }

      // Preview & Print / Share Dialog
      final sanitizedFilename = cleanTitle.replaceAll(RegExp(r'[^\w\s-]'), '').replaceAll(' ', '_');
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save(),
        name: 'kpss_$sanitizedFilename.pdf',
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF oluşturulurken hata oluştu: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  static pw.Widget _buildPdfHeader(String title, int questionCount, int pageNumber) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 8),
      margin: const pw.EdgeInsets.only(bottom: 12),
      decoration: const pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(color: PdfColors.indigo800, width: 1.5)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'KPSS SORU BANKASI',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
              ),
              pw.Text(
                title,
                style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
              ),
            ],
          ),
          pw.Text(
            '$questionCount Soru • ÖSYM Formatı',
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildPdfFooter(int pageNumber, int totalPages) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(top: 6),
      margin: const pw.EdgeInsets.only(top: 8),
      decoration: const pw.BoxDecoration(
        border: pw.Border(top: pw.BorderSide(color: PdfColors.grey300, width: 0.5)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('KPSS Hazırlık Portalı • Çevrimdışı Soru Bankası', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
          pw.Text('Sayfa $pageNumber', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
        ],
      ),
    );
  }

  static pw.Widget _buildPdfQuestionItem(int idx, Question q) {
    final cleanQuestion = sanitizeText(q.question);

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 14),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                width: 22,
                height: 22,
                alignment: pw.Alignment.center,
                decoration: const pw.BoxDecoration(
                  color: PdfColors.indigo800,
                  borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
                ),
                child: pw.Text(
                  '$idx',
                  style: const pw.TextStyle(color: PdfColors.white, fontSize: 10),
                ),
              ),
              pw.SizedBox(width: 8),
              pw.Expanded(
                child: pw.Text(
                  cleanQuestion,
                  style: pw.TextStyle(fontSize: 10.5, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 6),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 30),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: q.options.map((opt) {
                final cleanOpt = sanitizeText(opt);
                return pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 3),
                  child: pw.Text(
                    cleanOpt,
                    style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey800),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
