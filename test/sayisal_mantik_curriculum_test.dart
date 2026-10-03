import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sayısal Mantık 600 Soru ve %30 Görsel Doğrulama Testi', () {
    late List<dynamic> questions;

    setUpAll(() {
      final file = File('assets/data/sayisal_mantik_questions.json');
      expect(file.existsSync(), isTrue, reason: 'sayisal_mantik_questions.json dosyası mevcut olmalıdır.');
      final content = file.readAsStringSync();
      questions = jsonDecode(content) as List<dynamic>;
    });

    test('Toplam soru sayısı tam olarak 600 olmalıdır', () {
      expect(questions.length, equals(600));
    });

    test('Görsel/Şema/Tablo soru sayısı tam olarak 180 (%30.0) olmalıdır', () {
      final visualQuestions = questions.where((q) => q['isVisual'] == true).toList();
      expect(visualQuestions.length, equals(180),
          reason: '600 sorunun tam olarak %30u (180 soru) görsel/vektörel/şema içermelidir.');

      final nonVisualQuestions = questions.where((q) => q['isVisual'] == false).toList();
      expect(nonVisualQuestions.length, equals(420));
    });

    test('Şık dağılımı tam dengeli (A:120, B:120, C:120, D:120, E:120) olmalıdır', () {
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in questions) {
        final ans = q['correctAnswer'] as String;
        counts[ans] = (counts[ans] ?? 0) + 1;
      }

      expect(counts['A'], equals(120), reason: 'A şıkkı 120 adet olmalıdır.');
      expect(counts['B'], equals(120), reason: 'B şıkkı 120 adet olmalıdır.');
      expect(counts['C'], equals(120), reason: 'C şıkkı 120 adet olmalıdır.');
      expect(counts['D'], equals(120), reason: 'D şıkkı 120 adet olmalıdır.');
      expect(counts['E'], equals(120), reason: 'E şıkkı 120 adet olmalıdır.');
    });

    test('30 testin her birinde 20 soru olmalıdır', () {
      final testCounts = <int, int>{};
      for (final q in questions) {
        final tNum = q['testNum'] as int;
        testCounts[tNum] = (testCounts[tNum] ?? 0) + 1;
      }

      expect(testCounts.length, equals(30));
      for (int i = 1; i <= 30; i++) {
        expect(testCounts[i], equals(20), reason: 'Test $i 20 sorudan oluşmalıdır.');
      }
    });

    test('3 Ana Bölümün her birinde eşit görsel dağılımı (60 görsel / 140 sözel) bulunmalıdır', () {
      final b1Visual = questions.where((q) => q['chapterId'] == 'sayisal_bolum1' && q['isVisual'] == true).length;
      final b2Visual = questions.where((q) => q['chapterId'] == 'sayisal_bolum2' && q['isVisual'] == true).length;
      final b3Visual = questions.where((q) => q['chapterId'] == 'sayisal_bolum3' && q['isVisual'] == true).length;

      expect(b1Visual, equals(60), reason: 'Bölüm 1 (Test 1-10) 60 görsel soru içermelidir.');
      expect(b2Visual, equals(60), reason: 'Bölüm 2 (Test 11-20) 60 görsel soru içermelidir.');
      expect(b3Visual, equals(60), reason: 'Bölüm 3 (Test 21-30) 60 görsel soru içermelidir.');
    });

    test('Her sorunun 5 şıkkı ve detaylı çözümü olmalıdır', () {
      for (final q in questions) {
        final options = q['options'] as List;
        expect(options.length, equals(5), reason: '${q['id']} 5 seçeneğe sahip olmalıdır.');
        final sol = q['solution'] as String;
        expect(sol.trim().isNotEmpty, isTrue, reason: '${q['id']} çözüm açıklaması boş olamaz.');
        expect(q['correctAnswer'], isIn(['A', 'B', 'C', 'D', 'E']));
      }
    });
  });
}
