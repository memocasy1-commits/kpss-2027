import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/question_model.dart';

void main() {
  test('Türkçe Tüm Konular (1-10. Konular + PİSA, 118 Test, 2350 Soru) Eksiksiz ve Hatasız Doğrulanmalı', () {
    final file = File('assets/data/turkce_questions.json');
    expect(file.existsSync(), isTrue, reason: 'turkce_questions.json bulunamadı');

    final rawList = jsonDecode(file.readAsStringSync()) as List;
    expect(rawList.length, 2350, reason: 'Toplam Türkçe soru sayısı 2350 olmalı');

    final questions = rawList.map((e) => Question.fromJson(e, defaultCourseId: 'turkce')).toList();
    final ids = <String>{};
    final testCountMap = <int, int>{};
    final chapterCountMap = <String, int>{};

    for (final q in questions) {
      expect(ids.add(q.id), isTrue, reason: 'Tekrarlanan ID: ${q.id}');
      expect(q.courseId, 'turkce');
      expect(q.testNum, inInclusiveRange(1, 118), reason: '${q.id} testNum 1-118 arası olmalı');
      expect(q.qNum, inInclusiveRange(1, 20), reason: '${q.id} qNum 1-20 arası olmalı');

      expect(q.options.length, 5, reason: '${q.id} 5 şık içermeli');
      expect(q.correctIndex, inInclusiveRange(0, 4), reason: '${q.id} correctIndex 0-4 arası olmalı');
      expect(q.correctAnswer, 'ABCDE'[q.correctIndex], reason: '${q.id} correctAnswer eşleşmeli');

      expect(q.options[q.correctIndex].startsWith(q.correctAnswer), isTrue,
          reason: '${q.id} doğru şık ${q.correctAnswer} ile başlamalı');

      expect(q.question.trim().length, greaterThan(20), reason: '${q.id} soru metni yeterince detaylı olmalı');
      expect(q.solution.trim().length, greaterThan(35), reason: '${q.id} çözüm açıklaması detaylı ve öğretici olmalı');

      testCountMap[q.testNum] = (testCountMap[q.testNum] ?? 0) + 1;
      chapterCountMap[q.chapterId] = (chapterCountMap[q.chapterId] ?? 0) + 1;
    }

    expect(testCountMap.length, 118, reason: 'Tam olarak 118 test bulunmalı');
    for (int t = 1; t <= 100; t++) {
      expect(testCountMap[t], 20, reason: 'Test $t tam olarak 20 soru içermeli');
    }

    expect(chapterCountMap['turkce_sozcukte_anlam'], 200, reason: 'Konu 1 200 soru olmalı');
    expect(chapterCountMap['turkce_cumlede_anlam'], 200, reason: 'Konu 2 200 soru olmalı');
    expect(chapterCountMap['turkce_paragrafta_anlam'], 200, reason: 'Konu 3 200 soru olmalı');
    expect(chapterCountMap['turkce_paragrafta_yapi'], 200, reason: 'Konu 4 200 soru olmalı');
    expect(chapterCountMap['turkce_ses_bilgisi'], 200, reason: 'Konu 5 200 soru olmalı');
    expect(chapterCountMap['turkce_yazim_kurallari'], 200, reason: 'Konu 6 200 soru olmalı');
    expect(chapterCountMap['turkce_noktalama_isaretleri'], 200, reason: 'Konu 7 200 soru olmalı');
    expect(chapterCountMap['turkce_sozcukte_yapi'], 200, reason: 'Konu 8 200 soru olmalı');
    expect(chapterCountMap['turkce_sozcuk_turleri'], 200, reason: 'Konu 9 200 soru olmalı');
    expect(chapterCountMap['turkce_cumle_ve_mantik'], 200, reason: 'Konu 10 200 soru olmalı');
    expect(chapterCountMap['turkce_pisa_argumantasyon'], 350, reason: 'Konu 11 PİSA 350 soru olmalı');
  });
}
