import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KPSS Sözel Mantık Müfredat, Çeşitlilik ve Bütünlük Testleri', () {
    late List<dynamic> questions;

    setUpAll(() {
      final file = File('assets/data/mantik_questions.json');
      expect(file.existsSync(), isTrue, reason: 'mantik_questions.json bulunamadı');
      final content = file.readAsStringSync();
      questions = jsonDecode(content) as List<dynamic>;
    });

    test('Toplam 600 Sözel Mantık sorusu eksiksiz bulunmalı', () {
      expect(questions.length, equals(600));
    });

    test('30 Testin her birinde tam olarak 20 soru bulunmalı', () {
      final testCounts = <int, int>{};
      for (final q in questions) {
        final tNum = q['testNum'] as int;
        testCounts[tNum] = (testCounts[tNum] ?? 0) + 1;
      }
      expect(testCounts.length, equals(30));
      for (int t = 1; t <= 30; t++) {
        expect(testCounts[t], equals(20), reason: 'Test $t soru sayısı 20 değil');
      }
    });

    test('Seçenek dağılımı kusursuz dengeli olmalı (Her harften tam 120 adet)', () {
      final counts = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
      for (final q in questions) {
        final ans = q['correctAnswer'] as String;
        expect(counts.containsKey(ans), isTrue);
        counts[ans] = counts[ans]! + 1;
      }
      expect(counts['A'], equals(120));
      expect(counts['B'], equals(120));
      expect(counts['C'], equals(120));
      expect(counts['D'], equals(120));
      expect(counts['E'], equals(120));
    });

    test('Her soruda 5 benzersiz seçenek, geçerli indeks ve zengin çözüm formatı olmalı', () {
      for (final q in questions) {
        final opts = (q['options'] as List).map((e) => e.toString()).toList();
        expect(opts.length, equals(5));
        expect(opts.toSet().length, equals(5), reason: '${q['id']} içinde mükerrer seçenek var');
        
        final cIdx = q['correctIndex'] as int;
        final cAns = q['correctAnswer'] as String;
        expect(cIdx, inInclusiveRange(0, 4));
        expect(cAns.codeUnitAt(0) - 65, equals(cIdx));

        final sol = q['solution'] as String;
        expect(sol.contains('DOĞRU CEVAP:'), isTrue);
        expect(sol.contains('💡 ALTIN BİLGİ / MANTIK TABLOSU:'), isTrue);
        expect(sol.contains('🪜 ADIM ADIM ÇÖZÜM:'), isTrue);
      }
    });

    test('Her senaryonun 3. sorusu (I, II, III) formatında olmalı', () {
      int q3Count = 0;
      for (final q in questions) {
        final qNum = q['qNum'] as int;
        if (qNum % 4 == 3) {
          q3Count++;
          final text = q['questionText'] as String;
          expect(text.contains('I.') && text.contains('II.') && text.contains('III.'), isTrue,
              reason: '${q['id']} 3. soru olmasına rağmen I-II-III formatında değil');
        }
      }
      expect(q3Count, equals(150), reason: 'Tam 150 senaryonun 3. sorusu doğrulanmalı');
    });

    test('Soruların tam olarak %30\'u (180 soru / 45 senaryo) Tablolu / Şekilli / Şematik olmalı', () {
      final visualQuestions = questions.where((q) => q['isVisual'] == true).toList();
      expect(visualQuestions.length, equals(180), reason: 'Görsel/tablolu soru sayısı tam 180 (600\'ün %30\'u) olmalı');
      expect((visualQuestions.length / questions.length) * 100, equals(30.0));

      // Her 3 ana başlığın her birinde tam 15'er görsel senaryo (60'ar soru) bulunmalı
      final topicVisualCounts = <String, int>{};
      for (final q in visualQuestions) {
        final topic = q['chapterId'] as String;
        topicVisualCounts[topic] = (topicVisualCounts[topic] ?? 0) + 1;
      }
      expect(topicVisualCounts['mantik_bolum1'], equals(60), reason: 'Sıralama (Bölüm 1) konusunda 60 görsel soru (15 senaryo) olmalı');
      expect(topicVisualCounts['mantik_bolum2'], equals(60), reason: 'Eşleştirme (Bölüm 2) konusunda 60 görsel soru (15 senaryo) olmalı');
      expect(topicVisualCounts['mantik_bolum3'], equals(60), reason: 'Gruplama (Bölüm 3) konusunda 60 görsel soru (15 senaryo) olmalı');

      // Görsel sorular tablo/şema karakterleri (kutu çizgileri, oklar, soru işaretleri) içermeli
      for (final q in visualQuestions) {
        final text = q['questionText'] as String;
        final hasBox = text.contains('┌') || text.contains('│') || text.contains('+---') || text.contains('|') || text.contains('──►') || text.contains('➔') || text.contains('====');
        expect(hasBox, isTrue, reason: '${q['id']} görsel soru olarak işaretlenmiş fakat tablo/şema öğesi içermiyor');
      }
    });
  });
}
