import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kpss_soru_bankasi/services/gamification_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('GamificationService & Badges Tests', () {
    test('getAllBadges returns extended set of badges with tiers and XP', () async {
      final badges = await GamificationService.instance.getAllBadges();
      expect(badges.length, greaterThanOrEqualTo(30));

      for (final b in badges) {
        expect(b.id.isNotEmpty, isTrue);
        expect(b.title.isNotEmpty, isTrue);
        expect(b.description.isNotEmpty, isTrue);
        expect(b.target, greaterThan(0));
        expect(b.xpReward, greaterThan(0));
        expect(b.tierName.isNotEmpty, isTrue);
      }
    });

    test('summary reflects unlocked badges and computes user level accurately', () async {
      SharedPreferences.setMockInitialValues({
        'stat_total_solved': 500, // Unlocks first_step (50 XP), solved_50 (100 XP), solved_250 (250 XP), solved_500 (500 XP) -> 900 XP
        'streak_count': 7,        // Unlocks streak_3 (150 XP), streak_7 (350 XP) -> 500 XP
        'stat_tarih_correct': 60, // Unlocks tarih_master (250 XP) -> 250 XP
      });

      final summary = await GamificationService.instance.getSummary();

      expect(summary.unlockedCount, greaterThanOrEqualTo(7));
      expect(summary.totalXp, greaterThanOrEqualTo(1650));
      expect(summary.level, greaterThanOrEqualTo(4));
      expect(summary.levelTitle.isNotEmpty, isTrue);
      expect(summary.levelProgress, inInclusiveRange(0.0, 1.0));
    });

    test('recordGamePlayed and recordPerfectTest update stored preferences', () async {
      final service = GamificationService.instance;

      await service.recordGamePlayed('map');
      await service.recordGamePlayed('map');
      await service.recordPerfectTest();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getInt('stat_game_map_played'), equals(2));
      expect(prefs.getInt('stat_perfect_tests'), equals(1));
    });
  });
}
