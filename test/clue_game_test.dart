import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/clue_game_data.dart';
import 'package:kpss_soru_bankasi/models/clue_game_model.dart';

void main() {
  group('KPSS Eğitici Oyunlar - 3 İpuçlu Gizemli Bilgi Veri ve Bütünlük Testleri', () {
    late List<ClueQuestion> fileQuestions;

    setUpAll(() {
      final file = File('assets/data/clue_questions.json');
      expect(file.existsSync(), isTrue, reason: 'clue_questions.json dosyası mevcut olmalı');
      final content = file.readAsStringSync();
      final List<dynamic> jsonList = jsonDecode(content);
      fileQuestions = jsonList.map((e) => ClueQuestion.fromJson(e)).toList();
    });

    test('3 İpuçlu Gizemli Bilgi soru havuzu tam olarak 2000 soru içermeli', () {
      expect(fileQuestions.length, equals(2000), reason: 'Soru havuzu 2000 olmalı');
    });

    test('Sorular Tarih, Coğrafya ve Vatandaşlık derslerini dengeli kapsamalı', () {
      final tarihCount = fileQuestions.where((q) => q.category.toLowerCase() == 'tarih').length;
      final cografyaCount = fileQuestions.where((q) => q.category.toLowerCase() == 'cografya').length;
      final vatandaslikCount = fileQuestions.where((q) => q.category.toLowerCase() == 'vatandaslik').length;

      expect(tarihCount, equals(700), reason: 'Tarih soru sayısı 700 olmalı');
      expect(cografyaCount, equals(650), reason: 'Coğrafya soru sayısı 650 olmalı');
      expect(vatandaslikCount, equals(650), reason: 'Vatandaşlık soru sayısı 650 olmalı');
      expect(tarihCount + cografyaCount + vatandaslikCount, equals(2000));
    });

    test('Tüm soruların ID\'leri benzersiz (unique) olmalı', () {
      final ids = fileQuestions.map((q) => q.id).toSet();
      expect(ids.length, equals(2000), reason: 'Tüm ID\'ler benzersiz olmalı');
    });

    test('Her soruda 3 kademeli ipucu ve 4 geçerli seçenek bulunmalı', () {
      for (final q in fileQuestions) {
        expect(q.id.isNotEmpty, isTrue);
        expect(q.title.trim().isNotEmpty, isTrue, reason: '${q.id} başlığı boş');
        expect(q.clue1.trim().length >= 15, isTrue, reason: '${q.id} 1. ipucu yetersiz');
        expect(q.clue2.trim().length >= 15, isTrue, reason: '${q.id} 2. ipucu yetersiz');
        expect(q.clue3.trim().length >= 15, isTrue, reason: '${q.id} 3. ipucu yetersiz');
        expect(q.options.length, equals(4), reason: '${q.id} seçenek sayısı 4 olmalı');
        expect(q.options.contains(q.answer), isTrue, reason: '${q.id} cevabı seçenekler arasında olmalı');
        expect(q.explanation.trim().isNotEmpty, isTrue, reason: '${q.id} açıklaması boş');
      }
    });

    test('ClueGameData filtreleme metodu ders bazlı doğru alt küme döndürmeli', () {
      final tarihFallback = ClueGameData.getQuestions(category: 'tarih');
      expect(tarihFallback.isNotEmpty, isTrue);
      for (final q in tarihFallback) {
        expect(q.category, equals('tarih'));
      }

      final cografyaFallback = ClueGameData.getQuestions(category: 'cografya');
      expect(cografyaFallback.isNotEmpty, isTrue);
      for (final q in cografyaFallback) {
        expect(q.category, equals('cografya'));
      }

      final vatandaslikFallback = ClueGameData.getQuestions(category: 'vatandaslik');
      expect(vatandaslikFallback.isNotEmpty, isTrue);
      for (final q in vatandaslikFallback) {
        expect(q.category, equals('vatandaslik'));
      }
    });
  });
}
