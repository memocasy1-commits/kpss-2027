import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/matching_game_data.dart';
import 'package:kpss_soru_bankasi/models/matching_game_model.dart';

void main() {
  group('KPSS Eğitici Oyunlar - Kavram & Eser Eşleştirme Veri ve Bütünlük Testleri', () {
    late List<MatchingItem> fileQuestions;

    setUpAll(() {
      final file = File('assets/data/matching_questions.json');
      expect(file.existsSync(), isTrue, reason: 'matching_questions.json dosyası mevcut olmalı');
      final content = file.readAsStringSync();
      final List<dynamic> jsonList = jsonDecode(content);
      fileQuestions = jsonList.map((e) => MatchingItem.fromJson(e)).toList();
    });

    test('Kavram & Eser Eşleştirme soru havuzu tam olarak 3000 soru/çift içermeli', () {
      expect(fileQuestions.length, equals(3000), reason: 'Soru havuzu 3000 olmalı');
    });

    test('Sorular Tarih, Coğrafya ve Vatandaşlık derslerini dengeli kapsamalı', () {
      final tarihCount = fileQuestions.where((q) => q.category.toLowerCase() == 'tarih').length;
      final cografyaCount = fileQuestions.where((q) => q.category.toLowerCase() == 'cografya').length;
      final vatandaslikCount = fileQuestions.where((q) => q.category.toLowerCase() == 'vatandaslik').length;

      expect(tarihCount, equals(1100), reason: 'Tarih soru sayısı 1100 olmalı');
      expect(cografyaCount, equals(950), reason: 'Coğrafya soru sayısı 950 olmalı');
      expect(vatandaslikCount, equals(950), reason: 'Vatandaşlık soru sayısı 950 olmalı');
      expect(tarihCount + cografyaCount + vatandaslikCount, equals(3000));
    });

    test('Tüm soruların ID\'leri benzersiz (unique) olmalı', () {
      final ids = fileQuestions.map((q) => q.id).toSet();
      expect(ids.length, equals(3000), reason: 'Tüm ID\'ler benzersiz olmalı');
    });

    test('Tüm eşleştirme soru promptları benzersiz (unique) olmalı', () {
      final prompts = fileQuestions.map((q) => q.prompt.trim()).toSet();
      expect(prompts.length, equals(3000), reason: 'Tüm promptlar benzersiz olmalı');
    });

    test('Her eşleştirme kartında geçerli prompt, eşleşme ve altın bilgi bulunmalı', () {
      for (final q in fileQuestions) {
        expect(q.id.isNotEmpty, isTrue);
        expect(q.prompt.trim().length >= 10, isTrue, reason: '${q.id} prompt çok kısa');
        expect(q.match.trim().length >= 2, isTrue, reason: '${q.id} match çok kısa');
        expect(q.explanation.trim().length >= 10, isTrue, reason: '${q.id} açıklama çok kısa');
        expect(q.prompt.trim() != q.match.trim(), isTrue, reason: '${q.id} prompt ve match aynı olamaz');
      }
    });

    test('MatchingGameData filtreleme metodu ders bazlı doğru alt küme döndürmeli', () {
      final tarihFallback = MatchingGameData.getQuestions(category: 'tarih');
      expect(tarihFallback.isNotEmpty, isTrue);
      for (final q in tarihFallback) {
        expect(q.category, equals('tarih'));
      }

      final cografyaFallback = MatchingGameData.getQuestions(category: 'cografya');
      expect(cografyaFallback.isNotEmpty, isTrue);
      for (final q in cografyaFallback) {
        expect(q.category, equals('cografya'));
      }

      final vatandaslikFallback = MatchingGameData.getQuestions(category: 'vatandaslik');
      expect(vatandaslikFallback.isNotEmpty, isTrue);
      for (final q in vatandaslikFallback) {
        expect(q.category, equals('vatandaslik'));
      }
    });
  });
}
