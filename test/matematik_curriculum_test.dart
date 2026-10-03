import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/question_model.dart';

void main() {
  group('KPSS Matematik & Geometri Müfredat ve İçerik Bütünlüğü Testi', () {
    late List<Question> questions;

    setUpAll(() {
      final file = File('assets/data/matematik_questions.json');
      expect(file.existsSync(), isTrue, reason: 'matematik_questions.json dosyası mevcut olmalıdır.');

      final content = file.readAsStringSync();
      final dynamic decoded = json.decode(content);
      expect(decoded, isA<List>());

      questions = (decoded as List)
          .map((item) => Question.fromJson(item as Map<String, dynamic>, defaultCourseId: 'matematik'))
          .toList();
    });

    test('Konu 1 - Konu 10 için 2000 Soru ve 100 Test Eksiksiz Bulunmalı', () {
      expect(questions.length, equals(2000), reason: '1. - 10. Konu için tam 2000 soru olmalıdır.');

      final Map<int, List<Question>> testMap = {};
      for (var q in questions) {
        testMap.putIfAbsent(q.testNum, () => []).add(q);
      }

      expect(testMap.keys.length, equals(100), reason: '1. - 10. Konu için tam 100 test olmalıdır.');

      for (int t = 1; t <= 100; t++) {
        final list = testMap[t];
        expect(list, isNotNull, reason: 'Test $t mevcut olmalıdır.');
        expect(list!.length, equals(20), reason: 'Test $t içinde tam 20 soru olmalıdır.');


        // Test question number sequence and difficulty distribution
        for (int i = 0; i < 20; i++) {
          final q = list[i];
          expect(q.qNum, equals(i + 1), reason: 'Test $t içinde soru numarası ${i + 1} olmalıdır.');

          if (q.qNum <= 7) {
            expect(q.difficulty?.toLowerCase(), equals('kolay'), reason: 'Test $t Soru ${q.qNum} kolay olmalıdır.');
          } else if (q.qNum <= 14) {
            expect(q.difficulty?.toLowerCase(), equals('orta'), reason: 'Test $t Soru ${q.qNum} orta olmalıdır.');
          } else {
            expect(q.difficulty?.toLowerCase(), equals('zor'), reason: 'Test $t Soru ${q.qNum} zor olmalıdır.');
          }
        }
      }
    });

    test('Tüm Sorularda 5 Seçenek, Geçerli Doğru Cevap ve Zengin Çözüm Formatı Doğrulanmalı', () {
      for (var q in questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4), reason: '${q.id} correctIndex 0-4 arasında olmalıdır.');
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue,
            reason: '${q.id} seçeneği doğru harfle başlamalıdır.');

        final sol = q.solution;
        expect(sol.isNotEmpty, isTrue, reason: '${q.id} çözümü boş olamaz.');
        expect(sol.contains('💡 ALTIN FORMÜL / KURAL'), isTrue,
            reason: '${q.id} çözümünde altın formül bulunmalıdır.');
        expect(sol.contains('🪜 ADIM ADIM ÇÖZÜM'), isTrue,
            reason: '${q.id} çözümünde adım adım çözüm bulunmalıdır.');
        expect(sol.contains('⚠️ DİKKAT / ÖSYM TUZAĞI'), isFalse,
            reason: '${q.id} çözümünde dikkat/tuzak uyarısı bulunmamalıdır.');
        expect(sol.contains('⚡ PRATİK YOL / TEST TEKNİĞİ'), isFalse,
            reason: '${q.id} çözümünde pratik test tekniği bulunmamalıdır.');

        if (q.sourceQuestionImages.isNotEmpty) {
          for (final imgPath in q.sourceQuestionImages) {
            final imgFile = File(imgPath);
            expect(imgFile.existsSync(), isTrue, reason: '${q.id} görseli ($imgPath) diskte bulunmalıdır.');
          }
        }
      }
    });
  });
}
