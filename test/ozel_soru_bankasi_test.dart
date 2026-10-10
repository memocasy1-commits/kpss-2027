import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Özel Soru Bankası Veritabanı ve Bütünlük Testleri', () {
    late Map<String, dynamic> data;

    setUpAll(() {
      final file = File('assets/data/ozel_soru_bankasi.json');
      expect(file.existsSync(), isTrue, reason: 'ozel_soru_bankasi.json dosyası mevcut olmalıdır.');
      final content = file.readAsStringSync();
      data = json.decode(content);
    });

    test('Banka genel sayaçları ve kategori sayısı doğrulanmalı', () {
      expect(data['title'], equals('ÖZEL SORU BANKASI'));
      expect(data['totalCategories'], equals(7));
      expect(data['totalBooks'], equals(68));
      expect(data['grandTotalQuestions'], equals(7199));

      final categories = data['categories'] as List;
      expect(categories.length, equals(7));
    });

    test('Tüm kategoriler, kitaplar ve 7.199 soru eksiksiz doğrulanmalı', () {
      final categories = data['categories'] as List;
      int calculatedTotalQuestions = 0;
      int calculatedTotalBooks = 0;

      for (var cat in categories) {
        expect(cat['id'], isNotEmpty);
        expect(cat['name'], isNotEmpty);
        final books = cat['books'] as List;
        calculatedTotalBooks += books.length;

        for (var book in books) {
          expect(book['title'], isNotEmpty);
          final questions = book['questions'] as List;
          expect(questions.length, greaterThan(0));
          calculatedTotalQuestions += questions.length;

          for (var q in questions) {
            expect(q['id'], isNotEmpty);
            expect(q['question'], isNotEmpty);
            final options = q['options'] as List;
            expect(options.length, equals(5));
            expect(q['correctAnswer'], isIn(['A', 'B', 'C', 'D', 'E']));
            expect(q['correctIndex'], inInclusiveRange(0, 4));
            expect(q['solution'], isNotNull);
          }
        }
      }

      expect(calculatedTotalBooks, equals(68));
      expect(calculatedTotalQuestions, equals(7199));
    });
  });
}
