import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/chronology_data.dart';

void main() {
  group('KPSS Eğitici Oyunlar - Zaman Tüneli Veri & Mekanik Testleri', () {
    test('3 Genel Kültür dersi (Tarih, Coğrafya, Vatandaşlık) mevcut olmalı, Türkçe olmamalı', () {
      final categories = ChronologyData.levels.map((l) => l.category.toLowerCase()).toSet();
      expect(categories.contains('tarih'), isTrue, reason: 'Tarih dersi eksik');
      expect(categories.contains('cografya'), isTrue, reason: 'Coğrafya dersi eksik');
      expect(categories.contains('vatandaslik'), isTrue, reason: 'Vatandaşlık dersi eksik');
      expect(categories.contains('turkce'), isFalse, reason: 'Türkçe kaldırılmış olmalı');
    });

    test('Her seviyede en az 4 olay/eser bulunmalı ve sıralama tam olmalı', () {
      for (final level in ChronologyData.levels) {
        expect(level.items.length, greaterThanOrEqualTo(4),
            reason: '${level.id} seviyesinde en az 4 eleman olmalı.');

        // sortOrder 1'den başlayıp ardışık artmalı
        final orders = level.items.map((it) => it.sortOrder).toList();
        for (int i = 0; i < orders.length; i++) {
          expect(orders[i], equals(i + 1),
              reason: '${level.id} içindeki item #${i + 1} sortOrder=${i + 1} olmalıdır.');
        }

        // Başlıklar, açıklamalar ve altın bilgiler dolu olmalı
        for (final item in level.items) {
          expect(item.title.trim().isNotEmpty, isTrue, reason: '${item.id} başlığı boş');
          expect(item.yearOrEra.trim().isNotEmpty, isTrue, reason: '${item.id} tarihi boş');
          expect(item.detail.trim().isNotEmpty, isTrue, reason: '${item.id} açıklaması/altın bilgisi boş');
        }
      }
    });

    test('Tüm kart ID\'leri ve seviye ID\'leri benzersiz (unique) olmalı', () {
      final levelIds = <String>{};
      final itemIds = <String>{};

      for (final level in ChronologyData.levels) {
        expect(levelIds.add(level.id), isTrue, reason: 'Mükerrer Seviye ID: ${level.id}');
        for (final item in level.items) {
          expect(itemIds.add(item.id), isTrue, reason: 'Mükerrer Kart ID: ${item.id}');
        }
      }
    });

    test('Zaman Tüneli tam olarak 40 seviye ve 200 soru/kart içermeli', () {
      expect(ChronologyData.levels.length, equals(40),
          reason: 'Toplam 40 seviye bulunmalıdır.');

      final totalItems = ChronologyData.levels.fold<int>(0, (sum, lvl) => sum + lvl.items.length);
      expect(totalItems, equals(200),
          reason: 'Toplam kart/soru sayısı tam 200 olmalıdır.');

      final tarihLevels = ChronologyData.levels.where((l) => l.category == 'tarih').toList();
      final cogLevels = ChronologyData.levels.where((l) => l.category == 'cografya').toList();
      final vatLevels = ChronologyData.levels.where((l) => l.category == 'vatandaslik').toList();

      expect(tarihLevels.length, equals(20), reason: 'Tarih 20 seviye olmalıdır.');
      expect(cogLevels.length, equals(10), reason: 'Coğrafya 10 seviye olmalıdır.');
      expect(vatLevels.length, equals(10), reason: 'Vatandaşlık 10 seviye olmalıdır.');

      expect(tarihLevels.fold<int>(0, (s, l) => s + l.items.length), equals(100),
          reason: 'Tarih tam 100 kart olmalıdır.');
      expect(cogLevels.fold<int>(0, (s, l) => s + l.items.length), equals(50),
          reason: 'Coğrafya tam 50 kart olmalıdır.');
      expect(vatLevels.fold<int>(0, (s, l) => s + l.items.length), equals(50),
          reason: 'Vatandaşlık tam 50 kart olmalıdır.');
    });
  });
}
