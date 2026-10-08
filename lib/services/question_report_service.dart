import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionReport {
  final String questionId;
  final String courseId;
  final String reason;
  final String userNote;
  final String createdAt;

  const QuestionReport({
    required this.questionId,
    required this.courseId,
    required this.reason,
    required this.userNote,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'courseId': courseId,
    'reason': reason,
    'userNote': userNote,
    'createdAt': createdAt,
  };

  factory QuestionReport.fromJson(Map<String, dynamic> json) => QuestionReport(
    questionId: json['questionId'] as String? ?? '',
    courseId: json['courseId'] as String? ?? '',
    reason: json['reason'] as String? ?? '',
    userNote: json['userNote'] as String? ?? '',
    createdAt: json['createdAt'] as String? ?? '',
  );
}

class QuestionReportService {
  static final QuestionReportService instance = QuestionReportService._internal();
  QuestionReportService._internal();

  static const String _storageKey = 'reported_questions_history';

  Future<void> submitReport({
    required String questionId,
    required String courseId,
    required String reason,
    String userNote = '',
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existingJsonList = prefs.getStringList(_storageKey) ?? [];

      final report = QuestionReport(
        questionId: questionId,
        courseId: courseId,
        reason: reason,
        userNote: userNote.trim(),
        createdAt: DateTime.now().toIso8601String(),
      );

      existingJsonList.add(jsonEncode(report.toJson()));
      await prefs.setStringList(_storageKey, existingJsonList);
    } catch (_) {
      // SharedPreferences failure fallback
    }
  }

  Future<List<QuestionReport>> getAllReports() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getStringList(_storageKey) ?? [];
      return list
          .map((item) => QuestionReport.fromJson(jsonDecode(item) as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }
}
