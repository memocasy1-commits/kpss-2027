import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/bomb_game_data.dart';

void main() {
  group('KPSS Eğitici Oyunlar - 60 Saniye Bilgi Bombası Veri Testleri', () {
    test('Sorular Tarih, Coğrafya ve Vatandaşlık derslerini kapsamalı', () {
      final categories = BombGameData.allQuestions.map((q) => q.category.toLowerCase()).toSet();
      expect(categories.contains('tarih'), isTrue, reason: 'Tarih soruları eksik');
      expect(categories.contains('cografya'), isTrue, reason: 'Coğrafya soruları eksik');
      expect(categories.contains('vatandaslik'), isTrue, reason: 'Vatandaşlık soruları eksik');
    });

    test('Tüm önermelerin başlığı ve altın bilgi açıklamaları dolu olmalı', () {
      for (final q in BombGameData.allQuestions) {
        expect(q.id.isNotEmpty, isTrue);
        expect(q.statement.trim().isNotEmpty, isTrue, reason: '${q.id} önermesi boş');
        expect(q.explanation.trim().isNotEmpty, isTrue, reason: '${q.id} açıklaması boş');
      }
    });

    test('Ders filtresi ile doğru alt küme gelmeli', () {
      final tarihList = BombGameData.getQuestions(category: 'tarih');
      expect(tarihList.isNotEmpty, isTrue);
      for (final q in tarihList) {
        expect(q.category, equals('tarih'));
      }

      final cografyaList = BombGameData.getQuestions(category: 'cografya');
      expect(cografyaList.isNotEmpty, isTrue);
      for (final q in cografyaList) {
        expect(q.category, equals('cografya'));
      }

      final vatandaslikList = BombGameData.getQuestions(category: 'vatandaslik');
      expect(vatandaslikList.isNotEmpty, isTrue);
      for (final q in vatandaslikList) {
        expect(q.category, equals('vatandaslik'));
      }
    });
  });
}
