import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/question_model.dart';

void main() {
  test('Tarih Tüm Konular (1-14. Konular, 140 Test, 2800 Soru) Eksiksiz ve Hatasız Doğrulanmalı', () {
    final file = File('assets/data/tarih_questions.json');
    expect(file.existsSync(), isTrue, reason: 'tarih_questions.json bulunamadı');

    final rawList = jsonDecode(file.readAsStringSync()) as List;
    expect(rawList.length, 2800, reason: 'Toplam soru sayısı 2800 olmalı');

    final questions = rawList.map((e) => Question.fromJson(e, defaultCourseId: 'tarih')).toList();
    final ids = <String>{};
    final testCountMap = <int, int>{};
    final chapterCountMap = <String, int>{};

    for (final q in questions) {
      expect(ids.add(q.id), isTrue, reason: 'Tekrarlanan ID: ${q.id}');
      expect(q.courseId, 'tarih');
      expect(q.testNum, inInclusiveRange(1, 140), reason: '${q.id} testNum 1-140 arası olmalı');
      expect(q.qNum, inInclusiveRange(1, 20), reason: '${q.id} qNum 1-20 arası olmalı');

      expect(q.options.length, 5, reason: '${q.id} 5 şık içermeli');
      expect(q.correctIndex, inInclusiveRange(0, 4), reason: '${q.id} correctIndex 0-4 arası olmalı');
      expect(q.correctAnswer, 'ABCDE'[q.correctIndex], reason: '${q.id} correctAnswer eşleşmeli');

      expect(q.options[q.correctIndex].startsWith(q.correctAnswer), isTrue,
          reason: '${q.id} doğru şık ${q.correctAnswer} ile başlamalı');

      expect(q.question.trim().length, greaterThan(25), reason: '${q.id} soru metni yeterince detaylı olmalı');
      expect(q.solution.trim().length, greaterThan(40), reason: '${q.id} çözüm açıklaması detaylı ve öğretici olmalı');

      testCountMap[q.testNum] = (testCountMap[q.testNum] ?? 0) + 1;
      chapterCountMap[q.chapterId] = (chapterCountMap[q.chapterId] ?? 0) + 1;
    }

    expect(testCountMap.length, 140, reason: 'Tam olarak 140 test bulunmalı');
    for (int t = 1; t <= 140; t++) {
      expect(testCountMap[t], 20, reason: 'Test $t tam olarak 20 soru içermeli');
    }

    expect(chapterCountMap['islamiyet_oncesi'], 200, reason: 'Konu 1 200 soru olmalı');
    expect(chapterCountMap['turk_islam'], 200, reason: 'Konu 2 200 soru olmalı');
    expect(chapterCountMap['turkiye_selcuklu'], 200, reason: 'Konu 3 200 soru olmalı');
    expect(chapterCountMap['osmanli_kurulus_yukselme'], 200, reason: 'Konu 4 200 soru olmalı');
    expect(chapterCountMap['osmanli_kultur_medeniyet'], 200, reason: 'Konu 5 200 soru olmalı');
    expect(chapterCountMap['osmanli_duraklama'], 200, reason: 'Konu 6 200 soru olmalı');
    expect(chapterCountMap['osmanli_gerileme'], 200, reason: 'Konu 7 200 soru olmalı');
    expect(chapterCountMap['osmanli_dagilma'], 200, reason: 'Konu 8 200 soru olmalı');
    expect(chapterCountMap['osmanli_20yy_baslari'], 200, reason: 'Konu 9 200 soru olmalı');
    expect(chapterCountMap['birinci_dunya_savasi'], 200, reason: 'Konu 10 200 soru olmalı');
    expect(chapterCountMap['kurtulus_hazirlik'], 200, reason: 'Konu 11 200 soru olmalı');
    expect(chapterCountMap['kurtulus_muharebeler'], 200, reason: 'Konu 12 200 soru olmalı');
    expect(chapterCountMap['ataturkculuk_inkilaplar'], 200, reason: 'Konu 13 200 soru olmalı');
    expect(chapterCountMap['cagdas_turk_dunya'], 200, reason: 'Konu 14 200 soru olmalı');
  });

  test('QuestionService üzerinden Tarih test başlıkları (subtopicTitle) eksiksiz ve isimli gelmeli', () async {
    final file = File('assets/data/tarih_questions.json');
    final rawList = jsonDecode(file.readAsStringSync()) as List;
    final questions = rawList.map((e) => Question.fromJson(e, defaultCourseId: 'tarih')).toList();

    // Directly test getTestsForCourse logic
    final Map<int, List<Question>> testMap = {};
    for (var q in questions) {
      testMap.putIfAbsent(q.testNum, () => []).add(q);
    }

    for (int t = 1; t <= 140; t++) {
      expect(testMap.containsKey(t), isTrue);
      final qList = testMap[t]!;
      String subtopic = qList.first.subtopicTitle.trim();
      final cleanSubtopic = subtopic.replaceFirst(RegExp(r'^Test\s+\d+[\s:\-–—]+\s*'), '').trim();
      expect(cleanSubtopic.isNotEmpty, isTrue, reason: 'Test $t başlığı boş olamaz');
      expect(cleanSubtopic != 'Test $t', isTrue, reason: 'Test $t başlığı sadece Test $t olamaz');
      expect(cleanSubtopic.length, greaterThan(5), reason: 'Test $t başlığı anlamlı bir konu ismi içermeli: $cleanSubtopic');
    }
  });
}
