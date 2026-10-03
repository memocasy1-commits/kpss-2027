import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'question_service.dart';

class QuestionNote {
  final String questionId;
  final String content;
  final DateTime updatedAt;

  QuestionNote({
    required this.questionId,
    required this.content,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'content': content,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory QuestionNote.fromJson(Map<String, dynamic> json) => QuestionNote(
        questionId: json['questionId'] as String,
        content: json['content'] as String? ?? '',
        updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ?? DateTime.now(),
      );
}

class NotesService {
  static final NotesService instance = NotesService._internal();
  NotesService._internal();

  static const String _storageKey = 'kpss_user_question_notes_v1';
  Map<String, QuestionNote> _notes = {};
  bool _isLoaded = false;

  Future<void> init() async {
    if (_isLoaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw != null && raw.isNotEmpty) {
      try {
        final decoded = json.decode(raw) as Map<String, dynamic>;
        _notes = decoded.map((k, v) => MapEntry(k, QuestionNote.fromJson(v as Map<String, dynamic>)));
      } catch (e) {
        _notes = {};
      }
    }
    _isLoaded = true;
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final map = _notes.map((k, v) => MapEntry(k, v.toJson()));
    await prefs.setString(_storageKey, json.encode(map));
  }

  Future<String?> getNote(String questionId) async {
    await init();
    return _notes[questionId]?.content;
  }

  Future<void> saveNote(String questionId, String content) async {
    await init();
    final trimmed = content.trim();
    if (trimmed.isEmpty) {
      _notes.remove(questionId);
    } else {
      _notes[questionId] = QuestionNote(
        questionId: questionId,
        content: trimmed,
        updatedAt: DateTime.now(),
      );
    }
    await _save();
  }

  Future<void> deleteNote(String questionId) async {
    await init();
    _notes.remove(questionId);
    await _save();
  }

  Future<List<Map<String, dynamic>>> getAllNotesWithQuestions() async {
    await init();
    if (_notes.isEmpty) return [];

    final all = QuestionService.instance.getQuestionsForCourse('tarih') +
        QuestionService.instance.getQuestionsForCourse('turkce') +
        QuestionService.instance.getQuestionsForCourse('matematik') +
        QuestionService.instance.getQuestionsForCourse('cografya') +
        QuestionService.instance.getQuestionsForCourse('vatandaslik') +
        QuestionService.instance.getQuestionsForCourse('mantik') +
        QuestionService.instance.getQuestionsForCourse('sayisal_mantik');

    final qMap = {for (final q in all) q.id: q};

    final List<Map<String, dynamic>> result = [];
    for (final entry in _notes.entries) {
      final q = qMap[entry.key];
      if (q != null) {
        result.add({
          'question': q,
          'note': entry.value,
        });
      }
    }

    result.sort((a, b) => (b['note'] as QuestionNote).updatedAt.compareTo((a['note'] as QuestionNote).updatedAt));
    return result;
  }

  Future<int> getNotesCount() async {
    await init();
    return _notes.length;
  }
}
