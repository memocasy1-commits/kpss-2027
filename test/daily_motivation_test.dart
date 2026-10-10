import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kpss_soru_bankasi/services/daily_motivation_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('DailyMotivationService Tests', () {
    test('allQuotes collection is populated with valid authors and quotes', () {
      final service = DailyMotivationService.instance;
      expect(service.allQuotes.length, greaterThanOrEqualTo(30));

      for (final q in service.allQuotes) {
        expect(q.id, greaterThan(0));
        expect(q.quote.isNotEmpty, isTrue);
        expect(q.author.isNotEmpty, isTrue);
        expect(q.authorTitle.isNotEmpty, isTrue);
        expect(q.category.isNotEmpty, isTrue);
        expect(q.actionTip.isNotEmpty, isTrue);
      }
    });

    test('getTodayQuote returns consistent deterministic quote for a given date', () {
      final service = DailyMotivationService.instance;
      final date1 = DateTime(2027, 4, 15);
      final date2 = DateTime(2027, 4, 15);

      final quote1 = service.getTodayQuote(date: date1);
      final quote2 = service.getTodayQuote(date: date2);

      expect(quote1.id, equals(quote2.id));
      expect(quote1.author, equals(quote2.author));
    });

    test('getRandomQuote returns a quote from the valid collection', () {
      final service = DailyMotivationService.instance;
      final quote = service.getRandomQuote();
      expect(service.allQuotes.any((q) => q.id == quote.id), isTrue);
    });

    test('shouldShowDailyQuote returns true on first launch of the day and false after marking as shown', () async {
      final service = DailyMotivationService.instance;

      // First check: no previous date recorded -> should show
      final initialCheck = await service.shouldShowDailyQuote();
      expect(initialCheck, isTrue);

      // Mark as shown today
      await service.markQuoteAsShownToday();

      // Second check: already shown today -> should NOT show
      final afterShownCheck = await service.shouldShowDailyQuote();
      expect(afterShownCheck, isFalse);
    });

    test('setDailyMotivationEnabled toggles whether quote is shown', () async {
      final service = DailyMotivationService.instance;

      expect(await service.isDailyMotivationEnabled(), isTrue);

      await service.setDailyMotivationEnabled(false);
      expect(await service.isDailyMotivationEnabled(), isFalse);
      expect(await service.shouldShowDailyQuote(), isFalse);

      await service.setDailyMotivationEnabled(true);
      expect(await service.isDailyMotivationEnabled(), isTrue);
    });
  });
}
