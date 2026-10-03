import 'question_model.dart';

class DenemeExam {
  final String id;
  final String title;
  final String subtitle;
  final String difficulty;
  final int questionCount;
  final int durationMinutes;
  final String status; // 'ready' or 'locked'
  final String badgeColor;
  final String description;
  final List<Question> questions;

  bool get isReady => status == 'ready';

  DenemeExam({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.difficulty,
    required this.questionCount,
    required this.durationMinutes,
    required this.status,
    required this.badgeColor,
    required this.description,
    required this.questions,
  });

  factory DenemeExam.fromJson(Map<String, dynamic> json) {
    List<Question> qList = [];
    if (json['questions'] is List) {
      for (var item in json['questions']) {
        if (item is Map<String, dynamic>) {
          qList.add(Question.fromJson(item, defaultCourseId: item['courseId'] ?? 'tarih'));
        }
      }
    }

    return DenemeExam(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? 'KPSS Deneme Sınavı',
      subtitle: json['subtitle']?.toString() ?? '',
      difficulty: json['difficulty']?.toString() ?? 'Kolay',
      questionCount: json['questionCount'] is int ? json['questionCount'] : 120,
      durationMinutes: json['durationMinutes'] is int ? json['durationMinutes'] : 130,
      status: json['status']?.toString() ?? 'locked',
      badgeColor: json['badgeColor']?.toString() ?? '#10B981',
      description: json['description']?.toString() ?? '',
      questions: qList,
    );
  }
}

class CourseExamResult {
  final String courseName;
  final int totalQuestions;
  final int correct;
  final int wrong;
  final int empty;
  final double net;

  CourseExamResult({
    required this.courseName,
    required this.totalQuestions,
    required this.correct,
    required this.wrong,
    required this.empty,
    required this.net,
  });
}

class DenemeResult {
  final String denemeId;
  final String denemeTitle;
  final int elapsedSeconds;
  final int totalQuestions;
  final int totalCorrect;
  final int totalWrong;
  final int totalEmpty;
  final double totalNet;
  final double gyNet;
  final double gkNet;
  final double p3Score;
  final double p93Score;
  final double p94Score;
  final List<CourseExamResult> courseResults;
  final Map<int, int> userAnswers; // {questionIndex: chosenOptionIndex}

  DenemeResult({
    required this.denemeId,
    required this.denemeTitle,
    required this.elapsedSeconds,
    required this.totalQuestions,
    required this.totalCorrect,
    required this.totalWrong,
    required this.totalEmpty,
    required this.totalNet,
    required this.gyNet,
    required this.gkNet,
    required this.p3Score,
    required this.p93Score,
    required this.p94Score,
    required this.courseResults,
    required this.userAnswers,
  });

  static DenemeResult calculate({
    required String denemeId,
    required String denemeTitle,
    required List<Question> questions,
    required Map<int, int> userAnswers,
    required int elapsedSeconds,
  }) {
    int totalCorrect = 0;
    int totalWrong = 0;
    int totalEmpty = 0;

    // Course tracking:
    // Türkçe: 0..29 (30 Soru)
    // Matematik: 30..55 (26 Soru)
    // Geometri: 56..59 (4 Soru)
    // Tarih: 60..86 (27 Soru)
    // Coğrafya: 87..104 (18 Soru)
    // Vatandaşlık: 105..119 (15 Soru)
    int turkceD = 0, turkceY = 0, turkceB = 0;
    int matD = 0, matY = 0, matB = 0;
    int geomD = 0, geomY = 0, geomB = 0;
    int tarihD = 0, tarihY = 0, tarihB = 0;
    int cogD = 0, cogY = 0, cogB = 0;
    int vatD = 0, vatY = 0, vatB = 0;

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final isAnswered = userAnswers.containsKey(i);
      final isCorrect = isAnswered && userAnswers[i] == q.correctIndex;
      final isWrong = isAnswered && userAnswers[i] != q.correctIndex;
      final isEmpty = !isAnswered;

      if (isCorrect) totalCorrect++;
      if (isWrong) totalWrong++;
      if (isEmpty) totalEmpty++;

      if (i < 30) {
        if (isCorrect) {
          turkceD++;
        } else if (isWrong) {
          turkceY++;
        } else {
          turkceB++;
        }
      } else if (i < 56) {
        if (isCorrect) {
          matD++;
        } else if (isWrong) {
          matY++;
        } else {
          matB++;
        }
      } else if (i < 60) {
        if (isCorrect) {
          geomD++;
        } else if (isWrong) {
          geomY++;
        } else {
          geomB++;
        }
      } else if (i < 87) {
        if (isCorrect) {
          tarihD++;
        } else if (isWrong) {
          tarihY++;
        } else {
          tarihB++;
        }
      } else if (i < 105) {
        if (isCorrect) {
          cogD++;
        } else if (isWrong) {
          cogY++;
        } else {
          cogB++;
        }
      } else {
        if (isCorrect) {
          vatD++;
        } else if (isWrong) {
          vatY++;
        } else {
          vatB++;
        }
      }
    }

    final double turkceNet = turkceD - (turkceY / 4.0);
    final double matNet = matD - (matY / 4.0);
    final double geomNet = geomD - (geomY / 4.0);
    final double tarihNet = tarihD - (tarihY / 4.0);
    final double cogNet = cogD - (cogY / 4.0);
    final double vatNet = vatD - (vatY / 4.0);

    final double gyNet = (turkceD + matD + geomD) - ((turkceY + matY + geomY) / 4.0);
    final double gkNet = (tarihD + cogD + vatD) - ((tarihY + cogY + vatY) / 4.0);
    final double totalNet = (totalCorrect - (totalWrong / 4.0)).clamp(0.0, 120.0);

    // KPSS Puan Hesaplama Modeli (ÖSYM Standart Sapma ve Ağırlıklı Puan Simülasyonu)
    // Lisans (P3): GY (0.50) + GK (0.50)
    double p3 = 40.0 + (gyNet * 0.495) + (gkNet * 0.505);
    if (totalNet >= 119.0) p3 = 100.0;
    p3 = p3.clamp(40.0, 100.0);

    // Önlisans (P93): GY (0.50) + GK (0.50)
    double p93 = 40.5 + (gyNet * 0.505) + (gkNet * 0.495);
    if (totalNet >= 119.0) p93 = 100.0;
    p93 = p93.clamp(40.0, 100.0);

    // Ortaöğretim (P94):
    double p94 = 41.0 + (gyNet * 0.50) + (gkNet * 0.49);
    if (totalNet >= 119.0) p94 = 100.0;
    p94 = p94.clamp(40.0, 100.0);

    final courseResults = [
      CourseExamResult(courseName: 'Türkçe', totalQuestions: 30, correct: turkceD, wrong: turkceY, empty: turkceB, net: turkceNet),
      CourseExamResult(courseName: 'Matematik', totalQuestions: 26, correct: matD, wrong: matY, empty: matB, net: matNet),
      CourseExamResult(courseName: 'Geometri', totalQuestions: 4, correct: geomD, wrong: geomY, empty: geomB, net: geomNet),
      CourseExamResult(courseName: 'Tarih', totalQuestions: 27, correct: tarihD, wrong: tarihY, empty: tarihB, net: tarihNet),
      CourseExamResult(courseName: 'Coğrafya', totalQuestions: 18, correct: cogD, wrong: cogY, empty: cogB, net: cogNet),
      CourseExamResult(courseName: 'Vatandaşlık & Güncel', totalQuestions: 15, correct: vatD, wrong: vatY, empty: vatB, net: vatNet),
    ];

    return DenemeResult(
      denemeId: denemeId,
      denemeTitle: denemeTitle,
      elapsedSeconds: elapsedSeconds,
      totalQuestions: questions.length,
      totalCorrect: totalCorrect,
      totalWrong: totalWrong,
      totalEmpty: totalEmpty,
      totalNet: double.parse(totalNet.toStringAsFixed(2)),
      gyNet: double.parse(gyNet.toStringAsFixed(2)),
      gkNet: double.parse(gkNet.toStringAsFixed(2)),
      p3Score: double.parse(p3.toStringAsFixed(2)),
      p93Score: double.parse(p93.toStringAsFixed(2)),
      p94Score: double.parse(p94.toStringAsFixed(2)),
      courseResults: courseResults,
      userAnswers: userAnswers,
    );
  }
}
