import 'package:flutter/material.dart';

enum MissionType {
  lecture,
  test,
  mathLab,
  spacedRepetition,
  deneme,
  pomodoro;

  String get label {
    switch (this) {
      case MissionType.lecture:
        return 'Konu Anlatımı';
      case MissionType.test:
        return 'Soru Çözümü';
      case MissionType.mathLab:
        return 'Matematik Atölyesi';
      case MissionType.spacedRepetition:
        return 'Hafıza Tekrarı';
      case MissionType.deneme:
        return 'Deneme Sınavı';
      case MissionType.pomodoro:
        return 'Odak Seansı';
    }
  }

  IconData get icon {
    switch (this) {
      case MissionType.lecture:
        return Icons.menu_book_rounded;
      case MissionType.test:
        return Icons.quiz_rounded;
      case MissionType.mathLab:
        return Icons.science_rounded;
      case MissionType.spacedRepetition:
        return Icons.all_inclusive_rounded;
      case MissionType.deneme:
        return Icons.timer_outlined;
      case MissionType.pomodoro:
        return Icons.hourglass_top_rounded;
    }
  }

  Color get color {
    switch (this) {
      case MissionType.lecture:
        return const Color(0xFF3B82F6); // Blue
      case MissionType.test:
        return const Color(0xFF10B981); // Emerald
      case MissionType.mathLab:
        return const Color(0xFF8B5CF6); // Violet
      case MissionType.spacedRepetition:
        return const Color(0xFFF59E0B); // Amber
      case MissionType.deneme:
        return const Color(0xFFEF4444); // Red
      case MissionType.pomodoro:
        return const Color(0xFFEC4899); // Pink
    }
  }
}

enum StudyLevel {
  beginner,
  intermediate,
  advanced;

  String get label {
    switch (this) {
      case StudyLevel.beginner:
        return 'Temel (Sıfırdan)';
      case StudyLevel.intermediate:
        return 'Orta Seviye';
      case StudyLevel.advanced:
        return 'İleri (Hız & Net Artırma)';
    }
  }

  String get description {
    switch (this) {
      case StudyLevel.beginner:
        return 'Konu anlatımı %45, Soru bankası %40, Tekrar %15';
      case StudyLevel.intermediate:
        return 'Konu anlatımı %25, Soru bankası %50, Tekrar & Hata %25';
      case StudyLevel.advanced:
        return 'Konu özeti %10, Soru & Deneme %70, Leitner Hata Avı %20';
    }
  }
}

class StudyPlanGoal {
  final int targetScore; // 75, 80, 85, 90
  final int totalDays; // 30, 60, 90, 120, 180
  final double dailyHours; // 2.0, 4.0, 6.0, 8.0
  final StudyLevel level;
  final List<String> focusAreas; // 'matematik', 'tarih', 'turkce', 'cografya', 'vatandaslik'
  final bool reminderEnabled;
  final List<String> reminderTimes; // ['09:00', '14:30', '20:00']

  StudyPlanGoal({
    required this.targetScore,
    required this.totalDays,
    required this.dailyHours,
    required this.level,
    this.focusAreas = const ['matematik', 'tarih', 'turkce', 'cografya', 'vatandaslik'],
    this.reminderEnabled = true,
    this.reminderTimes = const ['09:00', '14:00', '20:00'],
  });

  Map<String, dynamic> toJson() => {
        'targetScore': targetScore,
        'totalDays': totalDays,
        'dailyHours': dailyHours,
        'level': level.name,
        'focusAreas': focusAreas,
        'reminderEnabled': reminderEnabled,
        'reminderTimes': reminderTimes,
      };

  factory StudyPlanGoal.fromJson(Map<String, dynamic> json) => StudyPlanGoal(
        targetScore: json['targetScore'] as int? ?? 85,
        totalDays: json['totalDays'] as int? ?? 60,
        dailyHours: (json['dailyHours'] as num?)?.toDouble() ?? 4.0,
        level: StudyLevel.values.firstWhere(
          (e) => e.name == json['level'],
          orElse: () => StudyLevel.intermediate,
        ),
        focusAreas: (json['focusAreas'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
            ['matematik', 'tarih', 'turkce', 'cografya', 'vatandaslik'],
        reminderEnabled: json['reminderEnabled'] as bool? ?? true,
        reminderTimes: (json['reminderTimes'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
            ['09:00', '14:00', '20:00'],
      );
}

class DailyMissionItem {
  final String id;
  final int dayNumber;
  final String title;
  final String subtitle;
  final MissionType type;
  final String targetKey; // course, testId, mathLabTopicNum, or moduleId
  final int estimatedMinutes;
  bool isCompleted;
  DateTime? completedAt;

  DailyMissionItem({
    required this.id,
    required this.dayNumber,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.targetKey,
    required this.estimatedMinutes,
    this.isCompleted = false,
    this.completedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'dayNumber': dayNumber,
        'title': title,
        'subtitle': subtitle,
        'type': type.name,
        'targetKey': targetKey,
        'estimatedMinutes': estimatedMinutes,
        'isCompleted': isCompleted,
        'completedAt': completedAt?.toIso8601String(),
      };

  factory DailyMissionItem.fromJson(Map<String, dynamic> json) => DailyMissionItem(
        id: json['id'] as String,
        dayNumber: json['dayNumber'] as int? ?? 1,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String? ?? '',
        type: MissionType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => MissionType.test,
        ),
        targetKey: json['targetKey'] as String? ?? '',
        estimatedMinutes: json['estimatedMinutes'] as int? ?? 30,
        isCompleted: json['isCompleted'] as bool? ?? false,
        completedAt: json['completedAt'] != null ? DateTime.tryParse(json['completedAt'] as String) : null,
      );
}

class StudyDay {
  final int dayNumber;
  final DateTime date;
  final int phaseNumber; // 1, 2, 3
  final List<DailyMissionItem> missions;
  String? reflectionNote;

  StudyDay({
    required this.dayNumber,
    required this.date,
    required this.phaseNumber,
    required this.missions,
    this.reflectionNote,
  });

  bool get isCompleted => missions.isNotEmpty && missions.every((m) => m.isCompleted);
  int get completedCount => missions.where((m) => m.isCompleted).length;
  double get progress => missions.isEmpty ? 0.0 : completedCount / missions.length;

  Map<String, dynamic> toJson() => {
        'dayNumber': dayNumber,
        'date': date.toIso8601String(),
        'phaseNumber': phaseNumber,
        'missions': missions.map((m) => m.toJson()).toList(),
        'reflectionNote': reflectionNote,
      };

  factory StudyDay.fromJson(Map<String, dynamic> json) => StudyDay(
        dayNumber: json['dayNumber'] as int? ?? 1,
        date: DateTime.tryParse(json['date'] as String? ?? '') ?? DateTime.now(),
        phaseNumber: json['phaseNumber'] as int? ?? 1,
        missions: (json['missions'] as List<dynamic>?)
                ?.map((e) => DailyMissionItem.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        reflectionNote: json['reflectionNote'] as String?,
      );
}

class StudyPlan {
  final String id;
  final DateTime createdAt;
  final StudyPlanGoal goal;
  final List<StudyDay> days;
  DateTime? lastRebalancedAt;

  StudyPlan({
    required this.id,
    required this.createdAt,
    required this.goal,
    required this.days,
    this.lastRebalancedAt,
  });

  int get totalDays => goal.totalDays;

  int get currentDayNumber {
    final now = DateTime.now();
    final diff = now.difference(DateTime(createdAt.year, createdAt.month, createdAt.day)).inDays + 1;
    return diff.clamp(1, totalDays);
  }

  StudyDay get currentStudyDay {
    final idx = (currentDayNumber - 1).clamp(0, days.length - 1);
    return days[idx];
  }

  int get totalMissionsCount => days.fold<int>(0, (sum, d) => sum + d.missions.length);
  int get completedMissionsCount =>
      days.fold<int>(0, (sum, d) => sum + d.missions.where((m) => m.isCompleted).length);

  double get overallProgress =>
      totalMissionsCount == 0 ? 0.0 : (completedMissionsCount / totalMissionsCount);

  int get currentPhaseNumber => currentStudyDay.phaseNumber;

  String get phaseName {
    switch (currentPhaseNumber) {
      case 1:
        return 'Faz 1: Kavramsal İnşa & Temel';
      case 2:
        return 'Faz 2: Entegrasyon & Soru Fırtınası';
      case 3:
        return 'Faz 3: Deneme Kondisyonu & Şok Tekrar';
      default:
        return 'Faz 1: Kavramsal İnşa';
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'goal': goal.toJson(),
        'days': days.map((d) => d.toJson()).toList(),
        'lastRebalancedAt': lastRebalancedAt?.toIso8601String(),
      };

  factory StudyPlan.fromJson(Map<String, dynamic> json) => StudyPlan(
        id: json['id'] as String,
        createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
        goal: StudyPlanGoal.fromJson(json['goal'] as Map<String, dynamic>),
        days: (json['days'] as List<dynamic>?)
                ?.map((e) => StudyDay.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        lastRebalancedAt: json['lastRebalancedAt'] != null
            ? DateTime.tryParse(json['lastRebalancedAt'] as String)
            : null,
      );
}
