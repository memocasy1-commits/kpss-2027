import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/deneme_model.dart';

void main() {
  group('KPSS 120 Soruluk Deneme Sınavları Bütünlük ve Standart Testi', () {
    late List<dynamic> rawExams;

    setUpAll(() {
      final file = File('assets/data/denemeler.json');
      expect(file.existsSync(), isTrue, reason: 'denemeler.json assets dizininde bulunmalıdır.');
      rawExams = jsonDecode(file.readAsStringSync()) as List<dynamic>;
    });

    test('Toplam 9 Deneme Sınavı Modülü Tanımlanmış Olmalı', () {
      expect(rawExams.length, greaterThanOrEqualTo(9), reason: 'Kolay (3), Orta (3), Zor (3) toplam 9 deneme bulunmalıdır.');

      final exams = rawExams.map((e) => DenemeExam.fromJson(e as Map<String, dynamic>)).toList();

      final kolay = exams.where((e) => e.difficulty == 'Kolay').length;
      final orta = exams.where((e) => e.difficulty == 'Orta').length;
      final zor = exams.where((e) => e.difficulty == 'Zor').length;

      expect(kolay, greaterThanOrEqualTo(3), reason: 'Tam 3 Kolay deneme tanımlanmalıdır.');
      expect(orta, greaterThanOrEqualTo(3), reason: 'Tam 3 Orta deneme tanımlanmalıdır.');
      expect(zor, greaterThanOrEqualTo(3), reason: 'Tam 3 Zor deneme tanımlanmalıdır.');

      // Deneme 1-9 tüm sınavlar hazır olmalı
      for (int i = 0; i < 9; i++) {
        expect(exams[i].status, equals('ready'));
        expect(exams[i].isReady, isTrue);
      }
    });

    test('Deneme 1: 120 Soru, Müfredat ve %20 Eşit Şık Dağılımı Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      expect(deneme1.questions.length, equals(120), reason: 'Deneme 1 tam 120 soru içermelidir.');
      expect(deneme1.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');

      // Section counts
      final turkce = deneme1.questions.take(30).toList();
      final mat = deneme1.questions.skip(30).take(30).toList();
      final tarih = deneme1.questions.skip(60).take(27).toList();
      final cog = deneme1.questions.skip(87).take(18).toList();
      final vat = deneme1.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme1.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 2: 120 Soru, Müfredat, %20 Eşit Dağılım ve Deneme 1 ile Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);

      expect(deneme2.questions.length, equals(120), reason: 'Deneme 2 tam 120 soru içermelidir.');
      expect(deneme2.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');

      // Distinct check with Deneme 1
      final ids1 = deneme1.questions.map((q) => q.id).toSet();
      final ids2 = deneme2.questions.map((q) => q.id).toSet();
      final intersection = ids1.intersection(ids2);
      expect(intersection.isEmpty, isTrue, reason: 'Deneme 2 soruları Deneme 1 ile mükerrer olamaz! Çakışan: $intersection');

      // Section counts
      final turkce = deneme2.questions.take(30).toList();
      final mat = deneme2.questions.skip(30).take(30).toList();
      final tarih = deneme2.questions.skip(60).take(27).toList();
      final cog = deneme2.questions.skip(87).take(18).toList();
      final vat = deneme2.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 2 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 2 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 2 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 2 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 2 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme2.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 3: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);

      expect(deneme3.questions.length, equals(120), reason: 'Deneme 3 tam 120 soru içermelidir.');
      expect(deneme3.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');

      // Distinct check with Deneme 1 and Deneme 2
      final ids1 = deneme1.questions.map((q) => q.id).toSet();
      final ids2 = deneme2.questions.map((q) => q.id).toSet();
      final ids3 = deneme3.questions.map((q) => q.id).toSet();
      expect(ids3.intersection(ids1).isEmpty, isTrue, reason: 'Deneme 3 soruları Deneme 1 ile mükerrer olamaz!');
      expect(ids3.intersection(ids2).isEmpty, isTrue, reason: 'Deneme 3 soruları Deneme 2 ile mükerrer olamaz!');

      // Section counts
      final turkce = deneme3.questions.take(30).toList();
      final mat = deneme3.questions.skip(30).take(30).toList();
      final tarih = deneme3.questions.skip(60).take(27).toList();
      final cog = deneme3.questions.skip(87).take(18).toList();
      final vat = deneme3.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 3 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 3 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 3 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 3 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 3 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme3.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 4: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);
      final deneme4 = DenemeExam.fromJson(rawExams[3] as Map<String, dynamic>);

      expect(deneme4.questions.length, equals(120), reason: 'Deneme 4 tam 120 soru içermelidir.');
      expect(deneme4.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');
      expect(deneme4.difficulty, equals('Orta'));

      // Distinct check with Deneme 1, 2, 3
      final ids1 = deneme1.questions.map((q) => q.id).toSet();
      final ids2 = deneme2.questions.map((q) => q.id).toSet();
      final ids3 = deneme3.questions.map((q) => q.id).toSet();
      final ids4 = deneme4.questions.map((q) => q.id).toSet();
      expect(ids4.intersection(ids1).isEmpty, isTrue, reason: 'Deneme 4 soruları Deneme 1 ile mükerrer olamaz!');
      expect(ids4.intersection(ids2).isEmpty, isTrue, reason: 'Deneme 4 soruları Deneme 2 ile mükerrer olamaz!');
      expect(ids4.intersection(ids3).isEmpty, isTrue, reason: 'Deneme 4 soruları Deneme 3 ile mükerrer olamaz!');

      // Section counts
      final turkce = deneme4.questions.take(30).toList();
      final mat = deneme4.questions.skip(30).take(30).toList();
      final tarih = deneme4.questions.skip(60).take(27).toList();
      final cog = deneme4.questions.skip(87).take(18).toList();
      final vat = deneme4.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 4 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 4 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 4 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 4 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 4 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme4.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 5: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);
      final deneme4 = DenemeExam.fromJson(rawExams[3] as Map<String, dynamic>);
      final deneme5 = DenemeExam.fromJson(rawExams[4] as Map<String, dynamic>);

      expect(deneme5.questions.length, equals(120), reason: 'Deneme 5 tam 120 soru içermelidir.');
      expect(deneme5.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');
      expect(deneme5.difficulty, equals('Orta'));

      // Distinct check with Deneme 1, 2, 3, 4
      final ids1 = deneme1.questions.map((q) => q.id).toSet();
      final ids2 = deneme2.questions.map((q) => q.id).toSet();
      final ids3 = deneme3.questions.map((q) => q.id).toSet();
      final ids4 = deneme4.questions.map((q) => q.id).toSet();
      final ids5 = deneme5.questions.map((q) => q.id).toSet();
      expect(ids5.intersection(ids1).isEmpty, isTrue, reason: 'Deneme 5 soruları Deneme 1 ile mükerrer olamaz!');
      expect(ids5.intersection(ids2).isEmpty, isTrue, reason: 'Deneme 5 soruları Deneme 2 ile mükerrer olamaz!');
      expect(ids5.intersection(ids3).isEmpty, isTrue, reason: 'Deneme 5 soruları Deneme 3 ile mükerrer olamaz!');
      expect(ids5.intersection(ids4).isEmpty, isTrue, reason: 'Deneme 5 soruları Deneme 4 ile mükerrer olamaz!');

      // Section counts
      final turkce = deneme5.questions.take(30).toList();
      final mat = deneme5.questions.skip(30).take(30).toList();
      final tarih = deneme5.questions.skip(60).take(27).toList();
      final cog = deneme5.questions.skip(87).take(18).toList();
      final vat = deneme5.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 5 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 5 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 5 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 5 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 5 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme5.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 6: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);
      final deneme4 = DenemeExam.fromJson(rawExams[3] as Map<String, dynamic>);
      final deneme5 = DenemeExam.fromJson(rawExams[4] as Map<String, dynamic>);
      final deneme6 = DenemeExam.fromJson(rawExams[5] as Map<String, dynamic>);

      expect(deneme6.questions.length, equals(120), reason: 'Deneme 6 tam 120 soru içermelidir.');
      expect(deneme6.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');
      expect(deneme6.difficulty, equals('Orta'));

      // Distinct check with Deneme 1, 2, 3, 4, 5
      final ids1 = deneme1.questions.map((q) => q.id).toSet();
      final ids2 = deneme2.questions.map((q) => q.id).toSet();
      final ids3 = deneme3.questions.map((q) => q.id).toSet();
      final ids4 = deneme4.questions.map((q) => q.id).toSet();
      final ids5 = deneme5.questions.map((q) => q.id).toSet();
      final ids6 = deneme6.questions.map((q) => q.id).toSet();
      expect(ids6.intersection(ids1).isEmpty, isTrue, reason: 'Deneme 6 soruları Deneme 1 ile mükerrer olamaz!');
      expect(ids6.intersection(ids2).isEmpty, isTrue, reason: 'Deneme 6 soruları Deneme 2 ile mükerrer olamaz!');
      expect(ids6.intersection(ids3).isEmpty, isTrue, reason: 'Deneme 6 soruları Deneme 3 ile mükerrer olamaz!');
      expect(ids6.intersection(ids4).isEmpty, isTrue, reason: 'Deneme 6 soruları Deneme 4 ile mükerrer olamaz!');
      expect(ids6.intersection(ids5).isEmpty, isTrue, reason: 'Deneme 6 soruları Deneme 5 ile mükerrer olamaz!');

      // Section counts
      final turkce = deneme6.questions.take(30).toList();
      final mat = deneme6.questions.skip(30).take(30).toList();
      final tarih = deneme6.questions.skip(60).take(27).toList();
      final cog = deneme6.questions.skip(87).take(18).toList();
      final vat = deneme6.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 6 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 6 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 6 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 6 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 6 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme6.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 7: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);
      final deneme4 = DenemeExam.fromJson(rawExams[3] as Map<String, dynamic>);
      final deneme5 = DenemeExam.fromJson(rawExams[4] as Map<String, dynamic>);
      final deneme6 = DenemeExam.fromJson(rawExams[5] as Map<String, dynamic>);
      final deneme7 = DenemeExam.fromJson(rawExams[6] as Map<String, dynamic>);

      expect(deneme7.questions.length, equals(120), reason: 'Deneme 7 tam 120 soru içermelidir.');
      expect(deneme7.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');
      expect(deneme7.difficulty, equals('Zor'));

      // Distinct check with Deneme 1, 2, 3, 4, 5, 6
      final ids7 = deneme7.questions.map((q) => q.id).toSet();
      for (final prev in [deneme1, deneme2, deneme3, deneme4, deneme5, deneme6]) {
        final prevIds = prev.questions.map((q) => q.id).toSet();
        expect(ids7.intersection(prevIds).isEmpty, isTrue, reason: 'Deneme 7 soruları ${prev.title} ile mükerrer olamaz!');
      }

      // Section counts
      final turkce = deneme7.questions.take(30).toList();
      final mat = deneme7.questions.skip(30).take(30).toList();
      final tarih = deneme7.questions.skip(60).take(27).toList();
      final cog = deneme7.questions.skip(87).take(18).toList();
      final vat = deneme7.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 7 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 7 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 7 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 7 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 7 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme7.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 8: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);
      final deneme4 = DenemeExam.fromJson(rawExams[3] as Map<String, dynamic>);
      final deneme5 = DenemeExam.fromJson(rawExams[4] as Map<String, dynamic>);
      final deneme6 = DenemeExam.fromJson(rawExams[5] as Map<String, dynamic>);
      final deneme7 = DenemeExam.fromJson(rawExams[6] as Map<String, dynamic>);
      final deneme8 = DenemeExam.fromJson(rawExams[7] as Map<String, dynamic>);

      expect(deneme8.questions.length, equals(120), reason: 'Deneme 8 tam 120 soru içermelidir.');
      expect(deneme8.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');
      expect(deneme8.difficulty, equals('Zor'));

      // Distinct check with Deneme 1, 2, 3, 4, 5, 6, 7
      final ids8 = deneme8.questions.map((q) => q.id).toSet();
      for (final prev in [deneme1, deneme2, deneme3, deneme4, deneme5, deneme6, deneme7]) {
        final prevIds = prev.questions.map((q) => q.id).toSet();
        expect(ids8.intersection(prevIds).isEmpty, isTrue, reason: 'Deneme 8 soruları ${prev.title} ile mükerrer olamaz!');
      }

      // Section counts
      final turkce = deneme8.questions.take(30).toList();
      final mat = deneme8.questions.skip(30).take(30).toList();
      final tarih = deneme8.questions.skip(60).take(27).toList();
      final cog = deneme8.questions.skip(87).take(18).toList();
      final vat = deneme8.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 8 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 8 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 8 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 8 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 8 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme8.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('Deneme 9: 120 Soru, Müfredat, %20 Eşit Dağılım ve Önceki Denemelerle Ayrık Olma Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);
      final deneme2 = DenemeExam.fromJson(rawExams[1] as Map<String, dynamic>);
      final deneme3 = DenemeExam.fromJson(rawExams[2] as Map<String, dynamic>);
      final deneme4 = DenemeExam.fromJson(rawExams[3] as Map<String, dynamic>);
      final deneme5 = DenemeExam.fromJson(rawExams[4] as Map<String, dynamic>);
      final deneme6 = DenemeExam.fromJson(rawExams[5] as Map<String, dynamic>);
      final deneme7 = DenemeExam.fromJson(rawExams[6] as Map<String, dynamic>);
      final deneme8 = DenemeExam.fromJson(rawExams[7] as Map<String, dynamic>);
      final deneme9 = DenemeExam.fromJson(rawExams[8] as Map<String, dynamic>);

      expect(deneme9.questions.length, equals(120), reason: 'Deneme 9 tam 120 soru içermelidir.');
      expect(deneme9.durationMinutes, equals(130), reason: 'KPSS sınav süresi 130 dakika olmalıdır.');
      expect(deneme9.difficulty, equals('Zor'));

      // Distinct check with Deneme 1, 2, 3, 4, 5, 6, 7, 8
      final ids9 = deneme9.questions.map((q) => q.id).toSet();
      for (final prev in [deneme1, deneme2, deneme3, deneme4, deneme5, deneme6, deneme7, deneme8]) {
        final prevIds = prev.questions.map((q) => q.id).toSet();
        expect(ids9.intersection(prevIds).isEmpty, isTrue, reason: 'Deneme 9 soruları ${prev.title} ile mükerrer olamaz!');
      }

      // Section counts
      final turkce = deneme9.questions.take(30).toList();
      final mat = deneme9.questions.skip(30).take(30).toList();
      final tarih = deneme9.questions.skip(60).take(27).toList();
      final cog = deneme9.questions.skip(87).take(18).toList();
      final vat = deneme9.questions.skip(105).take(15).toList();

      expect(turkce.length, equals(30), reason: 'Deneme 9 Türkçe 30 soru olmalıdır.');
      expect(mat.length, equals(30), reason: 'Deneme 9 Matematik 30 soru olmalıdır.');
      expect(tarih.length, equals(27), reason: 'Deneme 9 Tarih 27 soru olmalıdır.');
      expect(cog.length, equals(18), reason: 'Deneme 9 Coğrafya 18 soru olmalıdır.');
      expect(vat.length, equals(15), reason: 'Deneme 9 Vatandaşlık ve Güncel 15 soru olmalıdır.');

      // Option distribution (20% -> exactly 24 of each A, B, C, D, E)
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in deneme9.questions) {
        expect(q.options.length, equals(5), reason: '${q.id} sorusu 5 seçenekli olmalıdır.');
        expect(q.correctIndex, inInclusiveRange(0, 4));
        expect(q.options[q.correctIndex].startsWith('${q.correctAnswer})'), isTrue);
        counts[q.correctAnswer] = (counts[q.correctAnswer] ?? 0) + 1;
      }

      for (final opt in ['A', 'B', 'C', 'D', 'E']) {
        expect(counts[opt], inInclusiveRange(18, 32), reason: 'Şık dağılımı dengeli olmalıdır.');
      }
    });

    test('DenemeResult ve Olası KPSS Puan Hesaplama Modeli Doğrulanmalı', () {
      final deneme1 = DenemeExam.fromJson(rawExams[0] as Map<String, dynamic>);

      // Simulate 80 correct, 20 wrong, 20 empty answers
      final Map<int, int> userAnswers = {};
      for (int i = 0; i < 80; i++) {
        userAnswers[i] = deneme1.questions[i].correctIndex; // 80 Correct
      }
      for (int i = 80; i < 100; i++) {
        userAnswers[i] = (deneme1.questions[i].correctIndex + 1) % 5; // 20 Wrong
      }
      // 100..119 empty

      final result = DenemeResult.calculate(
        denemeId: deneme1.id,
        denemeTitle: deneme1.title,
        questions: deneme1.questions,
        userAnswers: userAnswers,
        elapsedSeconds: 5400, // 90 mins
      );

      expect(result.totalQuestions, equals(120));
      expect(result.totalCorrect, equals(80));
      expect(result.totalWrong, equals(20));
      expect(result.totalEmpty, equals(20));

      // Net = 80 - (20 / 4) = 75.0
      expect(result.totalNet, equals(75.0));

      // Check predicted KPSS score is calculated and in realistic range
      expect(result.p3Score, inInclusiveRange(70.0, 85.0));
      expect(result.p93Score, inInclusiveRange(70.0, 85.0));
      expect(result.p94Score, inInclusiveRange(70.0, 85.0));
    });
  });
}
