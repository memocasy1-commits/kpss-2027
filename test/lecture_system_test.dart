import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/cografya_lecture_data.dart';
import 'package:kpss_soru_bankasi/data/matematik_lecture_data.dart';
import 'package:kpss_soru_bankasi/data/tarih_lecture_data.dart';
import 'package:kpss_soru_bankasi/data/turkce_lecture_data.dart';
import 'package:kpss_soru_bankasi/data/vatandaslik_lecture_data.dart';
import 'package:kpss_soru_bankasi/models/lecture_model.dart';
import 'package:kpss_soru_bankasi/screens/lecture_hub_screen.dart';
import 'package:kpss_soru_bankasi/screens/lecture_topics_screen.dart';
import 'package:kpss_soru_bankasi/screens/lecture_detail_screen.dart';

void main() {
  group('KPSS Türkçe, Tarih, Vatandaşlık ve Coğrafya İnteraktif Konu Anlatımı Sistemi Testleri', () {
    test('Matematik konu anlatım veritabanı 12 modül ve zengin formül/çözüm içermeli', () {
      final topics = MatematikLectureData.topics;
      expect(topics.length, 12);

      for (final topic in topics) {
        expect(topic.title.isNotEmpty, isTrue);
        expect(topic.sections.isNotEmpty, isTrue);
        expect(topic.estimatedMinutes, greaterThan(0));
        expect(topic.startTestNum, greaterThan(0));
        expect(topic.endTestNum, greaterThanOrEqualTo(topic.startTestNum));

        // Her modül genel bakış veya formül, tuzak veya kural içermeli
        final hasOverviewOrFormula = topic.sections.any((s) => s.type == LectureSectionType.overview || s.type == LectureSectionType.formula);
        final hasWarning = topic.sections.any((s) => s.type == LectureSectionType.warning || s.osymTrap != null || s.goldenRule != null);
        final hasQuiz = topic.sections.any((s) => s.type == LectureSectionType.interactiveQuiz || (s.quizzes != null && s.quizzes!.isNotEmpty));

        expect(hasOverviewOrFormula, isTrue, reason: '${topic.title} genel bakış veya formül içermelidir.');
        expect(hasWarning, isTrue, reason: '${topic.title} altın kural/tuzak içermelidir.');
        expect(hasQuiz, isTrue, reason: '${topic.title} interaktif quiz içermelidir.');
      }
    });

    test('Türkçe konu anlatım veritabanı 10 modül ve zengin içerik içermeli', () {
      final topics = TurkceLectureData.topics;
      expect(topics.length, 10);

      for (final topic in topics) {
        expect(topic.title.isNotEmpty, isTrue);
        expect(topic.sections.isNotEmpty, isTrue);
        expect(topic.estimatedMinutes, greaterThan(0));
        expect(topic.startTestNum, greaterThan(0));
        expect(topic.endTestNum, greaterThanOrEqualTo(topic.startTestNum));
      }
    });

    test('Tarih konu anlatım veritabanı 14 modül ve askeri haritalar içermeli', () {
      final topics = TarihLectureData.topics;
      expect(topics.length, 14);

      for (final topic in topics) {
        expect(topic.title.isNotEmpty, isTrue);
        expect(topic.sections.isNotEmpty, isTrue);
        expect(topic.estimatedMinutes, greaterThan(0));
        expect(topic.startTestNum, greaterThan(0));
        expect(topic.endTestNum, greaterThanOrEqualTo(topic.startTestNum));
      }

      // Konu 10 (I. Dünya Savaşı) askeri cepheler haritası içermeli
      final dunyaSavasi = topics.firstWhere((t) => t.id == 'tarih_birinci_dunya_savasi');
      final hasDunyaSavasiMap = dunyaSavasi.sections.any((s) => s.mapData != null);
      expect(hasDunyaSavasiMap, isTrue, reason: 'I. Dünya Savaşı askeri harita içermelidir.');

      // Konu 12 (Kurtuluş Savaşı Muharebeler) askeri cepheler haritası içermeli
      final kurtulusSavasi = topics.firstWhere((t) => t.id == 'tarih_kurtulus_savasi_muharebeler');
      final hasKurtulusMap = kurtulusSavasi.sections.any((s) => s.mapData != null);
      expect(hasKurtulusMap, isTrue, reason: 'Kurtuluş Savaşı askeri harekât haritası içermelidir.');
    });

    testWidgets('LectureHubScreen sorunsuz render olmalı ve dersleri listelemeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: LectureHubScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('KONU ANLATIMI & KÜTÜPHANE'), findsOneWidget);
      expect(find.text('Türkçe'), findsOneWidget);
      expect(find.text('Tarih'), findsOneWidget);
      expect(find.text('Coğrafya'), findsOneWidget);
    });

    testWidgets('LectureTopicsScreen Tarih 14 modülü listelemeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 3000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final course = TarihLectureData.courseInfo;
      await tester.pumpWidget(
        MaterialApp(
          home: LectureTopicsScreen(course: course),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('İslamiyet Öncesi'), findsAtLeastNWidgets(1));
      expect(find.textContaining('I. Dünya Savaşı'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Kurtuluş Savaşı'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Atatürkçülük'), findsAtLeastNWidgets(1));
    });

    testWidgets('LectureTopicsScreen Vatandaşlık 9 modülü listelemeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 3000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final course = VatandaslikLectureData.courseInfo;
      await tester.pumpWidget(
        MaterialApp(
          home: LectureTopicsScreen(course: course),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Temel Hukuk Bilgisi'), findsAtLeastNWidgets(1));
      expect(find.textContaining('1982 Anayasası'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Yasama'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Yürütme'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Yargı'), findsAtLeastNWidgets(1));
      expect(find.textContaining('İdare Hukuku'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Güncel'), findsAtLeastNWidgets(1));
    });

    testWidgets('LectureTopicsScreen Matematik 12 modülü listelemeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 3000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final course = MatematikLectureData.courseInfo;
      await tester.pumpWidget(
        MaterialApp(
          home: LectureTopicsScreen(course: course),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Temel Kavramlar'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Bölünebilme Kuralları'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Rasyonel Sayılar'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Üslü ve Köklü'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Problemleri'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Geometri'), findsAtLeastNWidgets(1));
    });

    testWidgets('LectureTopicsScreen Türkçe 10 modülü listelemeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 3000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final course = TurkceLectureData.courseInfo;
      await tester.pumpWidget(
        MaterialApp(
          home: LectureTopicsScreen(course: course),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Sözcükte Anlam'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Cümlede Anlam'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Paragrafta'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Ses Bilgisi'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Yazım Kuralları'), findsAtLeastNWidgets(1));
    });

    testWidgets('LectureTopicsScreen Coğrafya 11 modülü listelemeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 3000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final course = CografyaLectureData.courseInfo;
      await tester.pumpWidget(
        MaterialApp(
          home: LectureTopicsScreen(course: course),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Coğrafi Konum'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Yerşekilleri'), findsAtLeastNWidgets(1));
      expect(find.textContaining('İklim'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Nüfus'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Tarım'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Madenler'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Ulaşım'), findsAtLeastNWidgets(1));
    });

    testWidgets('LectureDetailScreen Coğrafya Harita ve Lejantı render edilmeli', (tester) async {
      tester.view.physicalSize = const Size(1080, 4000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final topic = CografyaLectureData.topics.firstWhere((t) => t.id == 'cografya_konum_jeopolitik');
      await tester.pumpWidget(
        MaterialApp(
          home: LectureDetailScreen(
            topic: topic,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Coğrafya harita atlası bileşenlerinin render edildiğini doğrula
      expect(find.textContaining('TÜRKİYE\'NİN SINIRLARI'), findsOneWidget);
      expect(find.text('COĞRAFİ ANALİZ VE HARİTA LEJANTI'), findsOneWidget);
      expect(find.textContaining('Kapıkule'), findsAtLeastNWidgets(1));
      expect(find.textContaining('Habur'), findsAtLeastNWidgets(1));
    });
  });
}
