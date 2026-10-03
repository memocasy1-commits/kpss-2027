import 'package:flutter/material.dart';

enum LectureSectionType {
  overview,
  formula,
  warning,
  comparison,
  ruleList,
  interactiveQuiz,
}

class LectureCourse {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final int totalTopics;
  final int availableTopics;
  final bool isAvailable;
  final String badgeText;

  const LectureCourse({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.totalTopics,
    required this.availableTopics,
    required this.isAvailable,
    required this.badgeText,
  });
}

class LectureTopic {
  final String id;
  final String courseId;
  final int order;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String testRange;
  final int startTestNum;
  final int endTestNum;
  final int estimatedMinutes;
  final List<LectureSection> sections;

  const LectureTopic({
    required this.id,
    required this.courseId,
    required this.order,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.testRange,
    required this.startTestNum,
    required this.endTestNum,
    required this.estimatedMinutes,
    required this.sections,
  });
}

class LectureSection {
  final String title;
  final LectureSectionType type;
  final String? leadText;
  final List<String> bulletPoints;
  final String? goldenRule;
  final String? osymTrap;
  final List<ComparisonRow>? comparisonRows;
  final String? leftHeader;
  final String? rightHeader;
  final List<LectureInteractiveQuiz>? quizzes;
  final LectureMapData? mapData;
  final String? imageAssetPath;
  final String? imageCaption;
  final String? secondImageAssetPath;
  final String? secondImageCaption;

  const LectureSection({
    required this.title,
    required this.type,
    this.leadText,
    this.bulletPoints = const [],
    this.goldenRule,
    this.osymTrap,
    this.comparisonRows,
    this.leftHeader,
    this.rightHeader,
    this.quizzes,
    this.mapData,
    this.imageAssetPath,
    this.imageCaption,
    this.secondImageAssetPath,
    this.secondImageCaption,
  });
}

class LectureMapData {
  final String title;
  final String subtitle;
  final String mapId;
  final String? imageAssetPath;
  final String? mapSource;
  final List<MapLegendItem> legends;
  final List<MapFrontItem> points;
  final String? historicalNote;

  const LectureMapData({
    required this.title,
    required this.subtitle,
    required this.mapId,
    this.imageAssetPath,
    this.mapSource,
    required this.legends,
    required this.points,
    this.historicalNote,
  });
}

class MapLegendItem {
  final String label;
  final String symbol;
  final String description;

  const MapLegendItem({
    required this.label,
    required this.symbol,
    required this.description,
  });
}

class MapFrontItem {
  final String name;
  final String category; // 'Taarruz Cephesi', 'Savunma Cephesi', 'Yardım Cephesi', 'Muharebe Alanı'
  final String commander;
  final String keyEvent;
  final String outcome;

  const MapFrontItem({
    required this.name,
    required this.category,
    required this.commander,
    required this.keyEvent,
    required this.outcome,
  });
}

class ComparisonRow {
  final String correct;
  final String wrong;
  final String? note;

  const ComparisonRow({
    required this.correct,
    required this.wrong,
    this.note,
  });
}

class LectureInteractiveQuiz {
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String ruleTag;
  final String? imageAssetPath;

  const LectureInteractiveQuiz({
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.ruleTag,
    this.imageAssetPath,
  });
}

