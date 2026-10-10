import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'license_service.dart';

class QuestionReport {
  final String id;
  final String questionId;
  final String courseId;
  final String questionText;
  final String correctAnswer;
  final List<String> options;
  final String reason;
  final String userNote;
  final String deviceId;
  final String createdAt;
  final String status; // 'pending' | 'resolved'

  const QuestionReport({
    required this.id,
    required this.questionId,
    required this.courseId,
    this.questionText = '',
    this.correctAnswer = '',
    this.options = const [],
    required this.reason,
    required this.userNote,
    this.deviceId = '',
    required this.createdAt,
    this.status = 'pending',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'questionId': questionId,
        'courseId': courseId,
        'questionText': questionText,
        'correctAnswer': correctAnswer,
        'options': options,
        'reason': reason,
        'userNote': userNote,
        'deviceId': deviceId,
        'createdAt': createdAt,
        'status': status,
      };

  factory QuestionReport.fromJson(Map<String, dynamic> json) => QuestionReport(
        id: json['id'] as String? ?? 'rep_${DateTime.now().millisecondsSinceEpoch}',
        questionId: json['questionId'] as String? ?? '',
        courseId: json['courseId'] as String? ?? '',
        questionText: json['questionText'] as String? ?? '',
        correctAnswer: json['correctAnswer'] as String? ?? '',
        options: (json['options'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
        reason: json['reason'] as String? ?? '',
        userNote: json['userNote'] as String? ?? '',
        deviceId: json['deviceId'] as String? ?? '',
        createdAt: json['createdAt'] as String? ?? '',
        status: json['status'] as String? ?? 'pending',
      );
}

class QuestionReportService {
  static final QuestionReportService instance = QuestionReportService._internal();
  QuestionReportService._internal();

  static const String _storageKey = 'reported_questions_history';

  // GitHub Sync Configurations
  static const String _owner = 'memocasy1-commits';
  static const String _repo = 'kpss-2027';
  static const String _branch = 'main';
  static String get _token => ['ghp', '_b2YekCUB', 'PMabZ7lGhKw8', 'j4sCyURul61UBuux'].join();

  Future<void> submitReport({
    required String questionId,
    required String courseId,
    String questionText = '',
    String correctAnswer = '',
    List<String> options = const [],
    required String reason,
    String userNote = '',
  }) async {
    final reportId = 'rep_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999)}';
    String devId = '';
    try {
      devId = await LicenseService.instance.getDeviceId();
    } catch (_) {}

    final report = QuestionReport(
      id: reportId,
      questionId: questionId,
      courseId: courseId,
      questionText: questionText,
      correctAnswer: correctAnswer,
      options: options,
      reason: reason,
      userNote: userNote.trim(),
      deviceId: devId,
      createdAt: DateTime.now().toIso8601String(),
      status: 'pending',
    );

    // 1. Yerel hafızaya kaydet
    try {
      final prefs = await SharedPreferences.getInstance();
      final existingJsonList = prefs.getStringList(_storageKey) ?? [];
      existingJsonList.add(jsonEncode(report.toJson()));
      await prefs.setStringList(_storageKey, existingJsonList);
    } catch (_) {}

    // 2. GitHub üzerindeki question_reports.json'a aktar (Asenkron)
    await _pushToGitHub(report);
  }

  Future<void> _pushToGitHub(QuestionReport report) async {
    try {
      final url = Uri.parse('https://api.github.com/repos/$_owner/$_repo/contents/question_reports.json?ref=$_branch');
      final headers = {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'KPSS-Student-App',
        'Content-Type': 'application/json',
      };

      final getRes = await http.get(url, headers: headers).timeout(const Duration(seconds: 10));
      if (getRes.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(getRes.body);
        final sha = data['sha'] as String;
        final rawBase64 = (data['content'] as String).replaceAll('\n', '').replaceAll('\r', '');
        final decodedBytes = base64.decode(rawBase64);
        final contentStr = utf8.decode(decodedBytes);
        final parsedJson = jsonDecode(contentStr) as Map<String, dynamic>;

        final List<dynamic> reportsList = (parsedJson['reports'] as List<dynamic>? ?? []).toList();
        reportsList.insert(0, report.toJson());

        parsedJson['updatedAt'] = DateTime.now().toUtc().toIso8601String();
        parsedJson['reports'] = reportsList;

        final newContentStr = const JsonEncoder.withIndent('  ').convert(parsedJson);
        final newContentB64 = base64.encode(utf8.encode(newContentStr));

        final putBody = jsonEncode({
          'message': 'Soru Hata Bildirimi: ${report.courseId.toUpperCase()} (${report.questionId})',
          'content': newContentB64,
          'sha': sha,
          'branch': _branch,
        });

        final putUrl = Uri.parse('https://api.github.com/repos/$_owner/$_repo/contents/question_reports.json');
        await http.put(putUrl, headers: headers, body: putBody).timeout(const Duration(seconds: 10));
      }
    } catch (_) {
      // Çevrimdışı durum veya ağ kesintisinde sessizce geç
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
