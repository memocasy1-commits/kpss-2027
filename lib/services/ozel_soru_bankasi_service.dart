import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class OzelBook {
  final int bookId;
  final int bookNum;
  final String title;
  final String topic;
  final int questionCount;
  final List<Question> questions;

  OzelBook({
    required this.bookId,
    required this.bookNum,
    required this.title,
    required this.topic,
    required this.questionCount,
    required this.questions,
  });

  factory OzelBook.fromJson(Map<String, dynamic> json, String courseId) {
    final rawQuestions = json['questions'] as List? ?? [];
    final questionsList = rawQuestions
        .map((q) => Question.fromJson(Map<String, dynamic>.from(q), defaultCourseId: courseId))
        .toList();

    return OzelBook(
      bookId: json['bookId'] is int ? json['bookId'] : int.tryParse(json['bookId'].toString()) ?? 0,
      bookNum: json['bookNum'] ?? 0,
      title: json['title'] ?? '',
      topic: json['topic'] ?? '',
      questionCount: json['questionCount'] ?? questionsList.length,
      questions: questionsList,
    );
  }
}

class OzelCategory {
  final String id;
  final String name;
  final String icon;
  final int color;
  final int bookCount;
  final int totalQuestions;
  final List<OzelBook> books;

  OzelCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.bookCount,
    required this.totalQuestions,
    required this.books,
  });

  factory OzelCategory.fromJson(Map<String, dynamic> json) {
    final catId = json['id'] ?? '';
    final rawBooks = json['books'] as List? ?? [];
    final booksList = rawBooks
        .map((b) => OzelBook.fromJson(Map<String, dynamic>.from(b), catId))
        .toList();

    return OzelCategory(
      id: catId,
      name: json['name'] ?? '',
      icon: json['icon'] ?? 'book',
      color: json['color'] is int ? json['color'] : int.tryParse(json['color'].toString()) ?? 0xFF4F46E5,
      bookCount: json['bookCount'] ?? booksList.length,
      totalQuestions: json['totalQuestions'] ?? booksList.fold<int>(0, (sum, b) => sum + b.questionCount),
      books: booksList,
    );
  }
}

class OzelSoruBankasiService {
  static final OzelSoruBankasiService instance = OzelSoruBankasiService._internal();
  OzelSoruBankasiService._internal();

  bool _isLoaded = false;
  List<OzelCategory> _categories = [];
  int _grandTotalQuestions = 0;
  int _totalBooks = 0;

  bool get isLoaded => _isLoaded;
  List<OzelCategory> get categories => _categories;
  int get grandTotalQuestions => _grandTotalQuestions;
  int get totalBooks => _totalBooks;

  Future<void> loadData() async {
    if (_isLoaded) return;
    try {
      final jsonString = await rootBundle.loadString('assets/data/ozel_soru_bankasi.json');
      final data = json.decode(jsonString);

      _grandTotalQuestions = data['grandTotalQuestions'] ?? 0;
      _totalBooks = data['totalBooks'] ?? 0;

      final catList = (data['categories'] as List? ?? [])
          .map((c) => OzelCategory.fromJson(Map<String, dynamic>.from(c)))
          .toList();

      _categories = catList;
      _isLoaded = true;
    } catch (e) {
      // Fallback veya hata yönetimi
      _categories = [];
      _isLoaded = false;
    }
  }

  OzelCategory? getCategoryById(String id) {
    try {
      return _categories.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}
