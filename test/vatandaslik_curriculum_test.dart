import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/question_model.dart';

void main() {
  group('KPSS Vatandaşlık Müfredat, Anayasa ve İçerik Bütünlüğü Testi', () {
    late List<Question> questions;

    setUpAll(() {
      final file = File('assets/data/vatandaslik_questions.json');
      expect(file.existsSync(), isTrue, reason: 'vatandaslik_questions.json dosyası mevcut olmalıdır.');

      final content = file.readAsStringSync();
      final dynamic decoded = json.decode(content);
      expect(decoded, isA<List>());

      questions = (decoded as List)
          .map((item) => Question.fromJson(item as Map<String, dynamic>, defaultCourseId: 'vatandaslik'))
          .toList();
    });

    test('Mevcut Vatandaşlık Testleri 20 Soru ve Zorluk Standartlarına Uygun Olmalı', () {
      expect(questions.length, equals(2000), reason: 'Tam 2000 soru olmalıdır.');

      final Map<int, List<Question>> testMap = {};
      for (var q in questions) {
        testMap.putIfAbsent(q.testNum, () => []).add(q);
      }

      expect(testMap.length, equals(100), reason: 'Tam 100 test olmalıdır.');

      for (var entry in testMap.entries) {
        final t = entry.key;
        final list = entry.value;
        expect(list.length, equals(20), reason: 'Test $t içinde tam 20 soru olmalıdır.');

        for (int i = 0; i < 20; i++) {
          final q = list[i];
          expect(q.qNum, equals(i + 1), reason: 'Test $t içinde soru sırası ${i + 1} olmalıdır.');

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

    test('Tüm Sorularda 5 Seçenek, Geçerli Cevap Anahtarı, 4 Parçalı Çözüm ve Görseller Doğrulanmalı', () {
      final seenIds = <String>{};
      final seenQuestions = <String>{};

      for (var q in questions) {
        expect(seenIds.add(q.id), isTrue, reason: 'Tekrarlayan id: ${q.id}');
        expect(seenQuestions.add(q.question.trim()), isTrue,
            reason: '${q.id} sorusunun metni başka bir soruyla mükerrerdir!');

        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4), reason: '${q.id} correctIndex 0-4 arasında olmalıdır.');
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue,
            reason: '${q.id} seçeneği doğru harfle başlamalıdır.');

        final sol = q.solution;
        expect(sol.isNotEmpty, isTrue, reason: '${q.id} çözümü boş olamaz.');
        expect(sol.contains('💡 ALTIN BİLGİ'), isTrue,
            reason: '${q.id} çözümünde altın kural bulunmalıdır.');
        expect(sol.contains('🪜 ADIM ADIM ÇÖZÜM'), isTrue,
            reason: '${q.id} çözümünde adım adım analiz bulunmalıdır.');
        expect(sol.contains('⚠️ DİKKAT / ÖSYM TUZAĞI'), isFalse,
            reason: '${q.id} çözümünde dikkat/tuzak uyarısı bulunmamalıdır.');
        expect(sol.contains('⚡ PRATİK YOL / HAFIZA KODU'), isFalse,
            reason: '${q.id} çözümünde pratik hafıza kodu bulunmamalıdır.');

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
