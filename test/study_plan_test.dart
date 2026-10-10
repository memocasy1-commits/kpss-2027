import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/study_plan_model.dart';
import 'package:kpss_soru_bankasi/services/study_plan_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Study Plan Model & Serialization Tests', () {
    test('StudyPlanGoal JSON roundtrip', () {
      final goal = StudyPlanGoal(
        targetScore: 85,
        totalDays: 60,
        dailyHours: 4.0,
        level: StudyLevel.intermediate,
        focusAreas: ['matematik', 'tarih'],
        reminderEnabled: true,
        reminderTimes: ['09:00', '20:00'],
      );

      final json = goal.toJson();
      final parsed = StudyPlanGoal.fromJson(json);

      expect(parsed.targetScore, equals(85));
      expect(parsed.totalDays, equals(60));
      expect(parsed.dailyHours, equals(4.0));
      expect(parsed.level, equals(StudyLevel.intermediate));
      expect(parsed.focusAreas, contains('matematik'));
      expect(parsed.reminderEnabled, isTrue);
      expect(parsed.reminderTimes.length, equals(2));
    });

    test('DailyMissionItem JSON roundtrip & toggle', () {
      final item = DailyMissionItem(
        id: 'm_1',
        dayNumber: 1,
        title: 'Tarih Modül 1',
        subtitle: 'İslamiyet Öncesi',
        type: MissionType.lecture,
        targetKey: 'tarih_m1',
        estimatedMinutes: 30,
      );

      expect(item.isCompleted, isFalse);
      expect(item.completedAt, isNull);

      item.isCompleted = true;
      item.completedAt = DateTime.now();

      final json = item.toJson();
      final parsed = DailyMissionItem.fromJson(json);

      expect(parsed.id, equals('m_1'));
      expect(parsed.isCompleted, isTrue);
      expect(parsed.type, equals(MissionType.lecture));
      expect(parsed.estimatedMinutes, equals(30));
    });
  });

  group('StudyPlanService Algorithmic Generation Tests', () {
    test('Generate 60-day plan with 3-phase pedagogical pacing', () async {
      final service = StudyPlanService.instance;
      await service.init();

      final goal = StudyPlanGoal(
        targetScore: 90,
        totalDays: 60,
        dailyHours: 6.0,
        level: StudyLevel.advanced,
      );

      final plan = await service.generatePlan(goal);

      expect(plan.totalDays, equals(60));
      expect(plan.days.length, equals(60));

      // Phase validation
      final phase1Days = plan.days.where((d) => d.phaseNumber == 1).toList();
      final phase2Days = plan.days.where((d) => d.phaseNumber == 2).toList();
      final phase3Days = plan.days.where((d) => d.phaseNumber == 3).toList();

      expect(phase1Days.length, equals(30)); // 50%
      expect(phase2Days.length, equals(18)); // 30%
      expect(phase3Days.length, equals(12)); // 20%

      // Interleaving check: Faz 1'deki her günde birden fazla farklı görev türü olmalı
      for (final day in phase1Days) {
        expect(day.missions.length, greaterThanOrEqualTo(3));
        final types = day.missions.map((m) => m.type).toSet();
        expect(types.length, greaterThanOrEqualTo(2), reason: 'Aynı günde tek ders bloklanmamalı, serpiştirilmeli');
      }

      // Faz 3'te deneme sınavı görevleri bulunmalı
      final phase3Denemes = phase3Days
          .expand((d) => d.missions)
          .where((m) => m.type == MissionType.deneme)
          .toList();
      expect(phase3Denemes, isNotEmpty, reason: 'Faz 3 sınav kondisyon denemeleri içermelidir');
    });

    test('Mission toggle updates day and plan overall progress', () async {
      final service = StudyPlanService.instance;
      await service.init();

      final goal = StudyPlanGoal(
        targetScore: 80,
        totalDays: 30,
        dailyHours: 2.0,
        level: StudyLevel.beginner,
      );

      final plan = await service.generatePlan(goal);
      final firstMission = plan.days.first.missions.first;

      expect(firstMission.isCompleted, isFalse);
      expect(plan.completedMissionsCount, equals(0));

      await service.toggleMission(firstMission.id);

      expect(firstMission.isCompleted, isTrue);
      expect(plan.completedMissionsCount, equals(1));
      expect(plan.overallProgress, greaterThan(0.0));
    });

    test('Elastic rebalance redistributes missed missions into future days', () async {
      final service = StudyPlanService.instance;
      await service.init();

      final goal = StudyPlanGoal(
        targetScore: 85,
        totalDays: 30,
        dailyHours: 4.0,
        level: StudyLevel.intermediate,
      );

      final plan = await service.generatePlan(goal);

      // Simüle et: Gün 1'in görevleri tamamlanmadı ve şu an Gün 3'teyiz
      // days[0].dayNumber = 1, currentDay = 3
      final day1Missions = plan.days[0].missions;
      expect(day1Missions.every((m) => !m.isCompleted), isTrue);

      // Rebalance çağrısı (Gün 3'e gelindiği simülasyonu)
      final redistributed = await service.rebalancePlan(forceCurrentDay: 3);

      expect(redistributed, greaterThan(0), reason: 'Aksatılan görevler geleceğe dağıtılmalı');
      expect(plan.lastRebalancedAt, isNotNull);
    });
  });
}
