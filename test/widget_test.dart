import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/main.dart';

void main() {
  testWidgets('App basic smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KpssSoruBankasiApp());
    expect(find.byType(KpssSoruBankasiApp), findsOneWidget);
  });
}
