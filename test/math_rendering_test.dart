import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/widgets/math_rich_text.dart';
import 'package:kpss_soru_bankasi/widgets/option_card.dart';
import 'package:kpss_soru_bankasi/widgets/formatted_question_view.dart';
import 'package:kpss_soru_bankasi/widgets/solution_card.dart';

void main() {
  group('KPSS Matematiksel İfade ve Rasyonel Sayı Dizgi Testleri', () {
    testWidgets('MathRichText rasyonel sayıları (kesirleri) dikey kesir çizgisiyle render etmeli', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MathRichText(
              text: 'x + (y/z) = (47/5) eşitliğini sağlayan en küçük değer?',
            ),
          ),
        ),
      );

      // Verify that the text renders and contains the numbers
      expect(find.byType(MathRichText), findsOneWidget);
      expect(find.text('47'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('y'), findsOneWidget);
      expect(find.text('z'), findsOneWidget);
    });

    testWidgets('OptionCard şıklarında rasyonel kesirler (örn: A) 12/5) dikey kesir olarak render edilmeli', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OptionCard(
              label: 'A',
              text: '12/5',
              state: OptionState.defaultState,
            ),
          ),
        ),
      );

      expect(find.byType(OptionCard), findsOneWidget);
      expect(find.byType(MathRichText), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('FormattedQuestionView soru metnindeki a = 4 + (36/b) ifadesini dikey kesir olarak göstermeli', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FormattedQuestionView(
              question: 'a ve b pozitif tam sayıdır.\n\na = 4 + (36/b)\n\n**Buna göre kaç farklı a değeri vardır?**',
            ),
          ),
        ),
      );

      expect(find.byType(FormattedQuestionView), findsOneWidget);
      expect(find.text('36'), findsOneWidget);
      expect(find.text('b'), findsOneWidget);
    });

    testWidgets('SolutionCard çözüm adımlarındaki kesirleri ve formülleri MathRichText ile göstermeli', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SolutionCard(
              correctAnswer: 'B',
              subtopicTitle: 'Rasyonel Sayılar',
              solutionText: '💡 ALTIN FORMÜL:\n47/5 = 9 + (2/5)\n\n🪜 ADIM ADIM ÇÖZÜM:\n1. 47/5 kesrini tam sayılı kesir yapalım.',
            ),
          ),
        ),
      );

      expect(find.byType(SolutionCard), findsOneWidget);
      expect(find.text('47'), findsWidgets);
      expect(find.text('5'), findsWidgets);
    });
  });
}
