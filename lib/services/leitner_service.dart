import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';
import 'question_service.dart';

class LeitnerCard {
  final String questionId;
  int box; // 1, 2, 3, 4
  DateTime nextReviewDate;
  DateTime lastReviewDate;
  int reviewCount;
  int consecutiveCorrect;

  LeitnerCard({
    required this.questionId,
    required this.box,
    required this.nextReviewDate,
    required this.lastReviewDate,
    this.reviewCount = 0,
    this.consecutiveCorrect = 0,
  });

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'box': box,
        'nextReviewDate': nextReviewDate.toIso8601String(),
        'lastReviewDate': lastReviewDate.toIso8601String(),
        'reviewCount': reviewCount,
        'consecutiveCorrect': consecutiveCorrect,
      };

  factory LeitnerCard.fromJson(Map<String, dynamic> json) => LeitnerCard(
        questionId: json['questionId'] as String,
        box: json['box'] as int? ?? 1,
        nextReviewDate: DateTime.tryParse(json['nextReviewDate'] as String? ?? '') ?? DateTime.now(),
        lastReviewDate: DateTime.tryParse(json['lastReviewDate'] as String? ?? '') ?? DateTime.now(),
        reviewCount: json['reviewCount'] as int? ?? 0,
        consecutiveCorrect: json['consecutiveCorrect'] as int? ?? 0,
      );
}

class LeitnerService {
  static final LeitnerService instance = LeitnerService._internal();
  LeitnerService._internal();

  static const String _storageKey = 'kpss_leitner_cards_v1';
  Map<String, LeitnerCard> _cards = {};
  bool _isLoaded = false;

  Future<void> init() async {
    if (_isLoaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw != null && raw.isNotEmpty) {
      try {
        final decoded = json.decode(raw) as Map<String, dynamic>;
        _cards = decoded.map((k, v) => MapEntry(k, LeitnerCard.fromJson(v as Map<String, dynamic>)));
      } catch (e) {
        _cards = {};
      }
    }
    _isLoaded = true;
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final map = _cards.map((k, v) => MapEntry(k, v.toJson()));
    await prefs.setString(_storageKey, json.encode(map));
  }

  /// Yanlış yapılan veya öğrenilmek istenen bir soruyu Leitner Kutusuna ekler
  Future<void> addOrUpdateQuestion(String questionId, {bool resetToBox1 = true}) async {
    await init();
    final now = DateTime.now();
    if (_cards.containsKey(questionId)) {
      if (resetToBox1) {
        _cards[questionId]!.box = 1;
        _cards[questionId]!.consecutiveCorrect = 0;
        _cards[questionId]!.nextReviewDate = now.add(const Duration(days: 1));
      }
    } else {
      _cards[questionId] = LeitnerCard(
        questionId: questionId,
        box: 1,
        nextReviewDate: now.add(const Duration(days: 1)),
        lastReviewDate: now,
      );
    }
    await _save();
  }

  /// Kullanıcı tekrar oturumunda soruyu cevapladığında
  Future<void> recordReview(String questionId, bool isCorrect) async {
    await init();
    final now = DateTime.now();
    final card = _cards[questionId] ??
        LeitnerCard(
          questionId: questionId,
          box: 1,
          nextReviewDate: now,
          lastReviewDate: now,
        );

    card.lastReviewDate = now;
    card.reviewCount++;

    if (isCorrect) {
      card.consecutiveCorrect++;
      if (card.box < 4) {
        card.box++;
      }
      // Kutuya göre bir sonraki tekrar aralığı:
      // Kutu 1 -> 1 gün sonra
      // Kutu 2 -> 3 gün sonra
      // Kutu 3 -> 7 gün sonra
      // Kutu 4 -> 15 gün sonra (Kalıcı hafıza)
      int daysToAdd = 1;
      if (card.box == 2) daysToAdd = 3;
      if (card.box == 3) daysToAdd = 7;
      if (card.box == 4) daysToAdd = 15;

      card.nextReviewDate = now.add(Duration(days: daysToAdd));
    } else {
      // Hatalı cevapta Kutu 1'e geri döner
      card.consecutiveCorrect = 0;
      card.box = 1;
      card.nextReviewDate = now.add(const Duration(days: 1));
    }

    _cards[questionId] = card;
    await _save();
  }

  /// Bugün tekrar edilmesi gereken soruları getirir
  Future<List<Question>> getDueQuestions() async {
    await init();
    final now = DateTime.now();
    final dueIds = _cards.entries
        .where((e) => e.value.nextReviewDate.isBefore(now) || e.value.nextReviewDate.isAtSameMomentAs(now))
        .map((e) => e.key)
        .toSet();

    if (dueIds.isEmpty) return [];

    final all = QuestionService.instance.getQuestionsForCourse('tarih') +
        QuestionService.instance.getQuestionsForCourse('turkce') +
        QuestionService.instance.getQuestionsForCourse('matematik') +
        QuestionService.instance.getQuestionsForCourse('cografya') +
        QuestionService.instance.getQuestionsForCourse('vatandaslik') +
        QuestionService.instance.getQuestionsForCourse('mantik') +
        QuestionService.instance.getQuestionsForCourse('sayisal_mantik');

    return all.where((q) => dueIds.contains(q.id)).toList();
  }

  /// Tüm Leitner istatistiklerini getirir
  Future<Map<String, int>> getStats() async {
    await init();
    final now = DateTime.now();
    int b1 = 0, b2 = 0, b3 = 0, b4 = 0;
    int due = 0;

    for (final c in _cards.values) {
      if (c.box == 1) b1++;
      if (c.box == 2) b2++;
      if (c.box == 3) b3++;
      if (c.box >= 4) b4++;
      if (c.nextReviewDate.isBefore(now)) due++;
    }

    return {
      'box1': b1,
      'box2': b2,
      'box3': b3,
      'box4': b4,
      'total': _cards.length,
      'due': due,
    };
  }

  bool isInLeitner(String questionId) {
    return _cards.containsKey(questionId);
  }

  int getQuestionBox(String questionId) {
    return _cards[questionId]?.box ?? 0;
  }
}
