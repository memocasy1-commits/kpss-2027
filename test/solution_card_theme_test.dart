import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/widgets/solution_card.dart';
import 'package:kpss_soru_bankasi/services/theme_service.dart';
import 'package:kpss_soru_bankasi/theme/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SolutionCard renders properly in Dark Mode', (tester) async {
    ThemeService.instance.isDarkNotifier.value = true;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: SolutionCard(
              correctAnswer: 'A',
              subtopicTitle: 'Test 1: Orta Asya Kültür Merkezleri',
              solutionText: '💡 ALTIN BİLGİ / TARİHİ KURAL:\nAnav Kültürü en eski kültürdür.\n\n🪜 ADIM ADIM ÇÖZÜM:\nDoğru cevap A seçeneğidir.',
              difficulty: 'orta',
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('DOĞRU CEVAP: A'), findsOneWidget);
    expect(find.text('Test 1: Orta Asya Kültür Merkezleri'), findsOneWidget);
    expect(find.text('ORTA'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('SolutionCard renders properly in Light Mode', (tester) async {
    ThemeService.instance.isDarkNotifier.value = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: SolutionCard(
              correctAnswer: 'A',
              subtopicTitle: 'Test 1: Orta Asya Kültür Merkezleri',
              solutionText: '💡 ALTIN BİLGİ / TARİHİ KURAL:\nAnav Kültürü en eski kültürdür.\n\n⚠️ DİKKAT:\nÖSYM bu ayrımı sık sorar.\n\n⚡ PRATİK YOL:\nKelimeleri eşleştir.\n\n🪜 ADIM ADIM ÇÖZÜM:\nDoğru cevap A seçeneğidir.',
              difficulty: 'zor',
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('DOĞRU CEVAP: A'), findsOneWidget);
    expect(find.text('ZOR'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('SolutionCard renders properly in OLED Mode', (tester) async {
    ThemeService.instance.isDarkNotifier.value = true;
    AppColors.currentMode = ThemeModeType.oled;
    ThemeService.instance.modeNotifier.value = ThemeModeType.oled;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.oledTheme,
        home: const Scaffold(
          body: SingleChildScrollView(
            child: SolutionCard(
              correctAnswer: 'C',
              subtopicTitle: 'Test 2: İslamiyet Öncesi Türk Devletleri',
              solutionText: '💡 ALTIN BİLGİ:\nUygurlar yerleşik hayata geçen ilk Türk devletidir.\n\n🪜 ADIM ADIM ÇÖZÜM:\nDoğru cevap C seçeneğidir.',
              difficulty: 'kolay',
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('DOĞRU CEVAP: C'), findsOneWidget);
    expect(find.text('KOLAY'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
