import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/question_model.dart';

void main() {
  group('KPSS Coğrafya Müfredat, Harita ve İçerik Bütünlüğü Testi', () {
    late List<Question> questions;

    setUpAll(() {
      final file = File('assets/data/cografya_questions.json');
      expect(file.existsSync(), isTrue, reason: 'cografya_questions.json dosyası mevcut olmalıdır.');

      final content = file.readAsStringSync();
      final dynamic decoded = json.decode(content);
      expect(decoded, isA<List>());

      questions = (decoded as List)
          .map((item) => Question.fromJson(item as Map<String, dynamic>, defaultCourseId: 'cografya'))
          .toList();
    });

    test('Coğrafya Testleri Soru Sayısı ve Zorluk Standartlarına Uygun Olmalı', () {
      expect(questions.isNotEmpty, isTrue, reason: 'Coğrafya soru havuzu boş olamaz.');

      final Map<int, List<Question>> testMap = {};
      for (var q in questions) {
        testMap.putIfAbsent(q.testNum, () => []).add(q);
      }

      for (var entry in testMap.entries) {
        final t = entry.key;
        final list = entry.value;
        final expectedCount = (t <= 100) ? 20 : 10;
        expect(list.length, equals(expectedCount),
            reason: 'Test $t içinde tam $expectedCount soru olmalıdır.');

        for (int i = 0; i < expectedCount; i++) {
          final q = list[i];
          expect(q.qNum, equals(i + 1),
              reason: 'Test $t içinde soru sırası ${i + 1} olmalıdır.');

          expect(['kolay', 'orta', 'zor'].contains(q.difficulty?.toLowerCase()), isTrue,
              reason: 'Test $t Soru ${q.qNum} geçerli bir zorluk seviyesine sahip olmalıdır (kolay/orta/zor).');
        }
      }
    });

    test('Tüm Sorularda 5 Seçenek, Geçerli Cevap Anahtarı, Çözüm ve Görseller Doğrulanmalı', () {
      final seenIds = <String>{};
      final seenQuestions = <String>{};

      for (var q in questions) {
        expect(seenIds.add(q.id), isTrue, reason: 'Tekrarlayan id: ${q.id}');
        expect(seenQuestions.add(q.question.trim()), isTrue,
            reason: '${q.id} sorusunun metni başka bir soruyla mükerrerdir!');

        expect(q.options.length, equals(5),
            reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4),
            reason: '${q.id} correctIndex 0-4 arasında olmalıdır.');
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue,
            reason: '${q.id} seçeneği doğru harfle başlamalıdır.');

        final sol = q.solution;
        expect(sol.isNotEmpty, isTrue, reason: '${q.id} çözümü boş olamaz.');
        expect(sol.contains('💡 ALTIN BİLGİ'), isTrue,
            reason: '${q.id} çözümünde altın bilgi kuralı bulunmalıdır.');

        // Görsel doğrulaması: Görsel yolu belirtilmişse dosyanın varlığı doğrulanır
        for (var imgPath in q.sourceQuestionImages) {
          if (imgPath.isNotEmpty) {
            final imgFile = File(imgPath);
            expect(imgFile.existsSync(), isTrue,
                reason: '${q.id} görsel dosyası ($imgPath) mevcut olmalıdır.');
          }
        }
      }
    });
  });
}
