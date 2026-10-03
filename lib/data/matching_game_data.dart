import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/matching_game_model.dart';

class MatchingGameData {
  static List<MatchingItem> _loadedQuestions = [];
  static bool _isLoaded = false;

  static Future<void> loadQuestions() async {
    if (_isLoaded && _loadedQuestions.isNotEmpty) return;
    try {
      String? jsonStr;
      try {
        jsonStr = await rootBundle.loadString('assets/data/matching_questions.json');
      } catch (_) {
        try {
          jsonStr = await rootBundle.loadString('assets/assets/data/matching_questions.json');
        } catch (_) {}
      }
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final List<dynamic> list = json.decode(jsonStr);
        _loadedQuestions = list.map((item) => MatchingItem.fromJson(item)).toList();
        _isLoaded = true;
      }
    } catch (_) {}
  }

  static List<MatchingItem> get allQuestions =>
      _loadedQuestions.isNotEmpty ? _loadedQuestions : _fallbackQuestions;

  static List<MatchingItem> getQuestions({String category = 'all'}) {
    final list = allQuestions;
    if (category == 'all') {
      return List<MatchingItem>.from(list);
    }
    return list.where((q) => q.category.toLowerCase() == category.toLowerCase()).toList();
  }

  static const List<MatchingItem> _fallbackQuestions = [
    MatchingItem(
      id: 'match_fb_01',
      category: 'tarih',
      prompt: 'Kutadgu Bilig (Mutluluk Veren Bilgi)',
      match: 'Yusuf Has Hacip',
      explanation: 'Kutadgu Bilig, Karahanlılar döneminde Yusuf Has Hacip tarafından yazılan ilk Türkçe İslami eser ve siyasetnamedir.',
    ),
    MatchingItem(
      id: 'match_fb_02',
      category: 'tarih',
      prompt: 'Divânu Lugâti\'t-Türk (İlk Türkçe Sözlük)',
      match: 'Kaşgarlı Mahmud',
      explanation: 'Kaşgarlı Mahmud tarafından Abbasi halifesine sunulan ilk Türkçe sözlük ve Türk dünyası haritasını içeren eserdir.',
    ),
    MatchingItem(
      id: 'match_fb_03',
      category: 'cografya',
      prompt: 'Bor Mineralleri (Dünya rezervinin %73\'ü)',
      match: 'Balıkesir (Bigadiç) & Eskişehir (Kırka)',
      explanation: 'Türkiye bor rezervlerinde dünya lideridir. Bigadiç, Susurluk, Emet ve Kırka başlıca çıkarım merkezleridir.',
    ),
    MatchingItem(
      id: 'match_fb_04',
      category: 'vatandaslik',
      prompt: 'Bireysel Başvuruları Karara Bağlama & Norm Denetimi',
      match: 'Anayasa Mahkemesi',
      explanation: 'Anayasa Mahkemesi 15 üyeden oluşur ve temel hak ihlallerine ilişkin bireysel başvuruları karara bağlar.',
    ),
  ];
}
