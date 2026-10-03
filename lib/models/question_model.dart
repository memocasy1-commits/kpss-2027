class Question {
  final String id;
  final String courseId;
  final int testNum;
  final int qNum;
  final String chapterId;
  final String subtopicId;
  final String subtopicTitle;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String correctAnswer;
  final String solution;
  final String? difficulty;
  final List<String> sourceQuestionImages;
  final List<String> sourceSolutionImages;

  Question({
    required this.id,
    required this.courseId,
    required this.testNum,
    required this.qNum,
    required this.chapterId,
    required this.subtopicId,
    required this.subtopicTitle,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.correctAnswer,
    required this.solution,
    this.difficulty,
    this.sourceQuestionImages = const [],
    this.sourceSolutionImages = const [],
  });

  factory Question.fromJson(Map<String, dynamic> json, {String defaultCourseId = 'tarih'}) {
    // Parse options safely (supports both List and Map)
    List<String> parsedOptions = [];
    if (json['options'] is List) {
      parsedOptions = (json['options'] as List).map((e) => e.toString().trim()).toList();
    } else if (json['options'] is Map) {
      final optMap = json['options'] as Map;
      for (var k in ['A', 'B', 'C', 'D', 'E']) {
        if (optMap.containsKey(k)) {
          final val = optMap[k].toString().trim();
          parsedOptions.add(val.startsWith('$k)') ? val : '$k) $val');
        }
      }
      if (parsedOptions.isEmpty) {
        parsedOptions = optMap.values.map((e) => e.toString().trim()).toList();
      }
    }

    // Determine correctIndex and correctAnswer (normalized to A, B, C, D, E)
    int cIndex = 0;
    String cAnswer = (json['correctAnswer'] ?? 'A').toString().trim().toUpperCase();
    if (json['correctIndex'] is int) {
      cIndex = json['correctIndex'];
      if (cIndex >= 0 && cIndex < 5) {
        cAnswer = String.fromCharCode(65 + cIndex);
      }
    } else if (cAnswer.isNotEmpty && cAnswer.length == 1 && cAnswer.codeUnitAt(0) >= 65 && cAnswer.codeUnitAt(0) <= 69) {
      cIndex = cAnswer.codeUnitAt(0) - 65;
    } else if (cAnswer.isNotEmpty) {
      // Roman numerals fallback
      const romanMap = {'I': 0, 'II': 1, 'III': 2, 'IV': 3, 'V': 4};
      if (romanMap.containsKey(cAnswer)) {
        cIndex = romanMap[cAnswer]!;
        cAnswer = String.fromCharCode(65 + cIndex);
      }
    }

    final testNumVal = json['testNum'] is int ? json['testNum'] : int.tryParse(json['testNum']?.toString() ?? '1') ?? 1;
    int? parsedQNum;
    if (json['qNum'] != null) {
      parsedQNum = json['qNum'] is int ? json['qNum'] : int.tryParse(json['qNum'].toString());
    }
    if (parsedQNum == null) {
      final idStr = json['id']?.toString() ?? '';
      final match = RegExp(r'_q(\d+)').firstMatch(idStr);
      if (match != null) {
        parsedQNum = int.tryParse(match.group(1)!);
      }
    }
    final qNumVal = parsedQNum ?? 1;
    final course = json['courseId']?.toString() ?? defaultCourseId;
    String? diff = json['difficulty']?.toString();
    if (diff == null && (course == 'matematik' || course == 'cografya' || course == 'vatandaslik' || course == 'mantik')) {
      if (qNumVal <= 7) {
        diff = 'Kolay';
      } else if (qNumVal <= 14) {
        diff = 'Orta';
      } else {
        diff = 'Zor';
      }
    }

    // Images fallback: if sourceQuestionImages is empty but image is present, use it
    List<String> qImages = [];
    if (json['sourceQuestionImages'] is List && (json['sourceQuestionImages'] as List).isNotEmpty) {
      qImages = List<String>.from(json['sourceQuestionImages']);
    } else if (json['image'] != null && json['image'].toString().trim().isNotEmpty) {
      qImages = [json['image'].toString().trim()];
    }

    return Question(
      id: json['id']?.toString() ?? 'q_${testNumVal}_$qNumVal',
      courseId: course,
      testNum: testNumVal,
      qNum: qNumVal,
      chapterId: json['chapterId']?.toString() ?? '',
      subtopicId: json['subtopicId']?.toString() ?? '',
      subtopicTitle: json['subtopicTitle']?.toString() ??
          json['subtopic']?.toString() ??
          json['topic']?.toString() ??
          'Test $testNumVal',
      question: (json['question'] ?? json['questionText'])?.toString() ?? '',
      options: parsedOptions,
      correctIndex: cIndex,
      correctAnswer: cAnswer.isNotEmpty ? cAnswer : String.fromCharCode(65 + cIndex),
      solution: json['solution']?.toString() ?? '',
      difficulty: diff,
      sourceQuestionImages: qImages,
      sourceSolutionImages: List<String>.from(json['sourceSolutionImages'] ?? const []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'testNum': testNum,
      'qNum': qNum,
      'chapterId': chapterId,
      'subtopicId': subtopicId,
      'subtopicTitle': subtopicTitle,
      'question': question,
      'options': options,
      'correctIndex': correctIndex,
      'correctAnswer': correctAnswer,
      'solution': solution,
      'difficulty': difficulty,
      'sourceQuestionImages': sourceQuestionImages,
      'sourceSolutionImages': sourceSolutionImages,
    };
  }
}

class TestSummary {
  final String courseId;
  final int testNum;
  final String subtopicTitle;
  final int questionCount;
  final int correctCount;
  final int wrongCount;
  final bool isCompleted;

  TestSummary({
    required this.courseId,
    required this.testNum,
    required this.subtopicTitle,
    required this.questionCount,
    this.correctCount = 0,
    this.wrongCount = 0,
    this.isCompleted = false,
  });
}
