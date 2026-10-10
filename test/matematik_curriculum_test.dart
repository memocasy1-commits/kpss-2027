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

    test('Matematik Müfredatında En Az 2000 Soru ve 100 Test Eksiksiz Bulunmalı', () {
      expect(questions.length, greaterThanOrEqualTo(2000), reason: 'Müfredatta en az 2000 soru olmalıdır.');

      final Map<int, List<Question>> testMap = {};
      for (var q in questions) {
        testMap.putIfAbsent(q.testNum, () => []).add(q);
      }

      expect(testMap.keys.length, greaterThanOrEqualTo(100), reason: 'En az 100 test olmalıdır.');

      for (var entry in testMap.entries) {
        final t = entry.key;
        final list = entry.value;
        expect(list.isNotEmpty, isTrue, reason: 'Test $t boş olmamalıdır.');

        for (int i = 0; i < list.length; i++) {
          final q = list[i];
          expect(q.qNum, equals(i + 1), reason: 'Test $t içinde soru numarası ${i + 1} olmalıdır.');
          expect(['kolay', 'orta', 'zor'].contains(q.difficulty?.toLowerCase()), isTrue,
              reason: 'Test $t Soru ${q.qNum} geçerli bir zorluk seviyesine sahip olmalıdır (kolay/orta/zor).');
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
        expect(sol.trim().length >= 10, isTrue,
            reason: '${q.id} çözümü açıklayıcı matematiksel işlem veya kural içermelidir.');

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
