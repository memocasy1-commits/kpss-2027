import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/clue_game_model.dart';

class ClueGameData {
  static List<ClueQuestion> _loadedQuestions = [];
  static bool _isLoaded = false;

  static Future<void> loadQuestions() async {
    if (_isLoaded && _loadedQuestions.isNotEmpty) return;
    try {
      String? jsonStr;
      try {
        jsonStr = await rootBundle.loadString('assets/data/clue_questions.json');
      } catch (_) {
        try {
          jsonStr = await rootBundle.loadString('assets/assets/data/clue_questions.json');
        } catch (_) {}
      }
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final List<dynamic> list = json.decode(jsonStr);
        _loadedQuestions = list.map((item) => ClueQuestion.fromJson(item)).toList();
        _isLoaded = true;
      }
    } catch (_) {}
  }

  static List<ClueQuestion> get allQuestions =>
      _loadedQuestions.isNotEmpty ? _loadedQuestions : _fallbackQuestions;

  static List<ClueQuestion> getQuestions({String category = 'all'}) {
    final list = allQuestions;
    if (category == 'all') {
      return List<ClueQuestion>.from(list);
    }
    return list.where((q) => q.category.toLowerCase() == category.toLowerCase()).toList();
  }

  static const List<ClueQuestion> _fallbackQuestions = [
    ClueQuestion(
      id: 'clue_fb_01',
      category: 'tarih',
      title: '🔍 Gizemli Antlaşma / Pakt',
      clue1: 'Türkiye Büyük Millet Meclisi Hükümeti ile İtilaf Devletleri arasında İsviçre\'de müzakere edilmiştir.',
      clue2: '24 Temmuz 1923 tarihinde imzalanmış ve kapitülasyonları kesin olarak kaldırmıştır.',
      clue3: 'Yeni Türk Devleti\'nin uluslararası alanda hukuki ve siyasi bağımsızlığını tescilleyen kurucu belgedir.',
      options: ['Lozan Barış Antlaşması', 'Gümrü Antlaşması', 'Mudanya Ateşkesi', 'Kars Antlaşması'],
      answer: 'Lozan Barış Antlaşması',
      explanation: 'Lozan Barış Antlaşması 24 Temmuz 1923\'te imzalanmış, Misak-ı Milli hedeflerinin büyük kısmını gerçekleştirerek kapitülasyonları lağvetmiştir.',
    ),
    ClueQuestion(
      id: 'clue_fb_02',
      category: 'cografya',
      title: '🔍 Gizemli Dağ / Zirve',
      clue1: 'Doğu Anadolu Bölgesi\'nde Van Gölü havzasının kuzeydoğusunda yükselen sönmüş bir volkandır.',
      clue2: '5.137 metre yüksekliği ile Türkiye\'nin ve Avrupa kıtasının en yüksek noktasıdır.',
      clue3: 'Zirvesinde Türkiye\'nin en büyük takke buzulu yer alır ve Nuh\'un Gemisi efsanesine konu olmuştur.',
      options: ['Ağrı Dağı', 'Erciyes Dağı', 'Süphan Dağı', 'Cilo Dağı'],
      answer: 'Ağrı Dağı',
      explanation: 'Ağrı Dağı 5.137 metrelik yüksekliği ile Türkiye\'nin en yüksek zirvesidir ve üzerinde kalıcı takke buzulu barındırır.',
    ),
    ClueQuestion(
      id: 'clue_fb_03',
      category: 'vatandaslik',
      title: '🔍 Gizemli Yargı Organı',
      clue1: 'İlk kez 1961 Anayasası ile Türk hukuk sistemine dahil edilmiş bir yüksek mahkemedir.',
      clue2: '15 üyeden oluşur ve üyeleri 12 yıl süreyle bir kez seçilir.',
      clue3: 'Kanunların ve Cumhurbaşkanlığı kararnamelerinin Anayasaya uygunluğunu denetler, bireysel başvuruları karara bağlar.',
      options: ['Anayasa Mahkemesi', 'Danıştay', 'Yargıtay', 'Sayıştay'],
      answer: 'Anayasa Mahkemesi',
      explanation: 'Anayasa Mahkemesi 15 üyeden oluşur (3 TBMM, 12 Cumhurbaşkanı). Norm denetimi ve bireysel başvuruları inceler.',
    ),
  ];
}
