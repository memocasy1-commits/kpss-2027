import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';
import '../models/deneme_model.dart';
import '../data/bomb_game_data.dart';
import '../data/clue_game_data.dart';
import '../data/matching_game_data.dart';

class QuestionService {
  static final QuestionService instance = QuestionService._internal();
  QuestionService._internal();

  final List<Question> _tarihQuestions = [];
  final List<Question> _turkceQuestions = [];
  final List<Question> _matematikQuestions = [];
  final List<Question> _cografyaQuestions = [];
  final List<Question> _vatandaslikQuestions = [];
  final List<Question> _mantikQuestions = [];
  final List<Question> _sayisalMantikQuestions = [];
  final List<DenemeExam> _denemeExams = [];
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  List<DenemeExam> get denemeExams => _denemeExams;
  int get totalTarihCount => _tarihQuestions.length;
  int get totalTurkceCount => _turkceQuestions.length;
  int get totalMatematikCount => _matematikQuestions.length;
  int get totalCografyaCount => _cografyaQuestions.length;
  int get totalVatandaslikCount => _vatandaslikQuestions.length;
  int get totalMantikCount => _mantikQuestions.length;
  int get totalSayisalMantikCount => _sayisalMantikQuestions.length;
  int get totalQuestionCount =>
      _tarihQuestions.length +
      _turkceQuestions.length +
      _matematikQuestions.length +
      _cografyaQuestions.length +
      _vatandaslikQuestions.length +
      _mantikQuestions.length +
      _sayisalMantikQuestions.length;
  int get totalDenemeQuestionCount =>
      _denemeExams.fold<int>(0, (sum, exam) => sum + exam.questions.length);
  int get totalAtolyeQuestionCount {
    int count = 0;
    count += BombGameData.allQuestions.isNotEmpty ? BombGameData.allQuestions.length : 5000;
    count += ClueGameData.allQuestions.isNotEmpty ? ClueGameData.allQuestions.length : 2000;
    count += MatchingGameData.allQuestions.isNotEmpty ? MatchingGameData.allQuestions.length : 3000;
    return count;
  }
  int get grandTotalQuestionCount => 15000;

  int get totalTarihTestCount => getTestsForCourse('tarih').length;
  int get totalTurkceTestCount => getTestsForCourse('turkce').length;
  int get totalMatematikTestCount => getTestsForCourse('matematik').length;
  int get totalCografyaTestCount => getTestsForCourse('cografya').length;
  int get totalVatandaslikTestCount => getTestsForCourse('vatandaslik').length;
  int get totalMantikTestCount => getTestsForCourse('mantik').length;
  int get totalSayisalMantikTestCount => getTestsForCourse('sayisal_mantik').length;
  int get totalCourseTestCount =>
      totalTarihTestCount +
      totalTurkceTestCount +
      totalMatematikTestCount +
      totalCografyaTestCount +
      totalVatandaslikTestCount +
      totalMantikTestCount +
      totalSayisalMantikTestCount;

  static String formatNumber(int n) {
    return n.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  final Map<String, String> _memoryCache = {};

  void setMemoryCache(String course, String jsonContent) {
    _memoryCache[course] = jsonContent;
  }

  Future<void> reloadFromCacheOrAssets() async {
    _isLoaded = false;
    _tarihQuestions.clear();
    _turkceQuestions.clear();
    _matematikQuestions.clear();
    _cografyaQuestions.clear();
    _vatandaslikQuestions.clear();
    _mantikQuestions.clear();
    _sayisalMantikQuestions.clear();
    _denemeExams.clear();
    await loadData();
  }

  Future<String?> _loadRawContent(SharedPreferences prefs, String course, String assetPath) async {
    if (_memoryCache.containsKey(course) && _memoryCache[course]!.isNotEmpty) {
      return _memoryCache[course];
    }
    if (!kIsWeb) {
      final cached = prefs.getString('cached_questions_$course');
      if (cached != null && cached.isNotEmpty) {
        return cached;
      }
    }
    try {
      return await rootBundle.loadString(assetPath);
    } catch (_) {
      try {
        return await rootBundle.loadString('assets/$assetPath');
      } catch (_) {}
    }
    return null;
  }

  Future<void> loadData() async {
    if (_isLoaded) return;
    final prefs = await SharedPreferences.getInstance();

    // 1. Load Tarih (isolated try-catch so failure does not block Turkce or Matematik)
    try {
      final tarihStr = await _loadRawContent(prefs, 'tarih', 'assets/data/tarih_questions.json');
      if (tarihStr != null && tarihStr.isNotEmpty) {
        final dynamic tarihJson = json.decode(tarihStr);
        if (tarihJson is List) {
          _tarihQuestions.clear();
          for (var item in tarihJson) {
            _tarihQuestions.add(Question.fromJson(item, defaultCourseId: 'tarih'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Tarih error: $e');
    }

    // 2. Load Turkce (isolated try-catch)
    try {
      final turkceStr = await _loadRawContent(prefs, 'turkce', 'assets/data/turkce_questions.json');
      if (turkceStr != null && turkceStr.isNotEmpty) {
        final dynamic turkceJson = json.decode(turkceStr);
        if (turkceJson is List) {
          _turkceQuestions.clear();
          for (var item in turkceJson) {
            _turkceQuestions.add(Question.fromJson(item, defaultCourseId: 'turkce'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Turkce error: $e');
    }

    // 3. Load Matematik (isolated try-catch)
    try {
      final matStr = await _loadRawContent(prefs, 'matematik', 'assets/data/matematik_questions.json');
      if (matStr != null && matStr.isNotEmpty) {
        final dynamic matJson = json.decode(matStr);
        if (matJson is List) {
          _matematikQuestions.clear();
          for (var item in matJson) {
            _matematikQuestions.add(Question.fromJson(item, defaultCourseId: 'matematik'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Matematik error: $e');
    }

    // 4. Load Cografya (isolated try-catch)
    try {
      final cogStr = await _loadRawContent(prefs, 'cografya', 'assets/data/cografya_questions.json');
      if (cogStr != null && cogStr.isNotEmpty) {
        final dynamic cogJson = json.decode(cogStr);
        if (cogJson is List) {
          _cografyaQuestions.clear();
          for (var item in cogJson) {
            _cografyaQuestions.add(Question.fromJson(item, defaultCourseId: 'cografya'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Cografya error: $e');
    }

    // 5. Load Vatandaslik (isolated try-catch)
    try {
      final vatStr = await _loadRawContent(prefs, 'vatandaslik', 'assets/data/vatandaslik_questions.json');
      if (vatStr != null && vatStr.isNotEmpty) {
        final dynamic vatJson = json.decode(vatStr);
        if (vatJson is List) {
          _vatandaslikQuestions.clear();
          for (var item in vatJson) {
            _vatandaslikQuestions.add(Question.fromJson(item, defaultCourseId: 'vatandaslik'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Vatandaslik error: $e');
    }

    // 6. Load Denemeler (isolated try-catch)
    try {
      final denemeStr = await _loadRawContent(prefs, 'denemeler', 'assets/data/denemeler.json');
      if (denemeStr != null && denemeStr.isNotEmpty) {
        final dynamic denemeJson = json.decode(denemeStr);
        if (denemeJson is List) {
          _denemeExams.clear();
          for (var item in denemeJson) {
            if (item is Map<String, dynamic>) {
              _denemeExams.add(DenemeExam.fromJson(item));
            }
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Denemeler error: $e');
    }

    // 7. Load Mantik (isolated try-catch)
    try {
      final mantikStr = await _loadRawContent(prefs, 'mantik', 'assets/data/mantik_questions.json');
      if (mantikStr != null && mantikStr.isNotEmpty) {
        final dynamic mantikJson = json.decode(mantikStr);
        if (mantikJson is List) {
          _mantikQuestions.clear();
          for (var item in mantikJson) {
            _mantikQuestions.add(Question.fromJson(item, defaultCourseId: 'mantik'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Mantik error: $e');
    }

    // 8. Load Sayisal Mantik (isolated try-catch)
    try {
      final sayisalStr = await _loadRawContent(prefs, 'sayisal_mantik', 'assets/data/sayisal_mantik_questions.json');
      if (sayisalStr != null && sayisalStr.isNotEmpty) {
        final dynamic sayisalJson = json.decode(sayisalStr);
        if (sayisalJson is List) {
          _sayisalMantikQuestions.clear();
          for (var item in sayisalJson) {
            _sayisalMantikQuestions.add(Question.fromJson(item, defaultCourseId: 'sayisal_mantik'));
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('QuestionService load Sayisal Mantik error: $e');
    }

    try {
      await BombGameData.loadQuestions();
    } catch (_) {}
    try {
      await ClueGameData.loadQuestions();
    } catch (_) {}
    try {
      await MatchingGameData.loadQuestions();
    } catch (_) {}

    _isLoaded = true;
  }

  DenemeExam? getDenemeById(String id) {
    try {
      return _denemeExams.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }

  List<Question> getQuestionsForCourse(String courseId) {
    if (courseId == 'turkce') return _turkceQuestions;
    if (courseId == 'matematik') return _matematikQuestions;
    if (courseId == 'cografya') return _cografyaQuestions;
    if (courseId == 'vatandaslik') return _vatandaslikQuestions;
    if (courseId == 'mantik') return _mantikQuestions;
    if (courseId == 'sayisal_mantik') return _sayisalMantikQuestions;
    return _tarihQuestions;
  }

  List<TestSummary> getTestsForCourse(String courseId) {
    final questions = getQuestionsForCourse(courseId);
    final Map<int, List<Question>> testMap = {};

    for (var q in questions) {
      testMap.putIfAbsent(q.testNum, () => []).add(q);
    }

    final sortedKeys = testMap.keys.toList()..sort();
    return sortedKeys.map((testNum) {
      final qList = testMap[testNum]!;
      String subtopic = qList.isNotEmpty ? qList.first.subtopicTitle.trim() : '';

      final bool isGeneric = subtopic.isEmpty ||
          subtopic == 'Genel' ||
          RegExp(r'^Test\s*\d*$', caseSensitive: false).hasMatch(subtopic);

      if (isGeneric) {
        if (courseId == 'matematik') {
          subtopic = _getMatematikTestTitle(testNum);
        } else if (courseId == 'cografya') {
          subtopic = _getCografyaTestTitle(testNum);
        } else if (courseId == 'vatandaslik') {
          subtopic = _getVatandaslikTestTitle(testNum);
        } else if (courseId == 'mantik') {
          subtopic = _getMantikTestTitle(testNum);
        } else if (courseId == 'sayisal_mantik') {
          subtopic = _getSayisalMantikTestTitle(testNum);
        } else if (courseId == 'tarih') {
          subtopic = _getTarihTestTitle(testNum);
        } else if (courseId == 'turkce') {
          subtopic = _getTurkceTestTitle(testNum);
        } else {
          subtopic = 'Test $testNum';
        }
      }

      // Clean redundant 'Test X: ' or 'Test X - ' prefix if present
      final cleanSubtopic = subtopic.replaceFirst(RegExp(r'^Test\s+\d+[\s:\-–—]+\s*'), '').trim();
      final finalTitle = cleanSubtopic.isNotEmpty ? cleanSubtopic : subtopic;

      return TestSummary(
        courseId: courseId,
        testNum: testNum,
        subtopicTitle: finalTitle,
        questionCount: qList.length,
      );
    }).toList();
  }

  static String _getMatematikTestTitle(int testNum) {
    const Map<int, String> titles = {
      1: "1. Konu: Temel Kavramlar & Sayı Kümeleri",
      2: "1. Konu: Tek - Çift ve Pozitif - Negatif Sayılar",
      3: "1. Konu: Ardışık Sayılar ve Terim Sayısı",
      4: "1. Konu: Asal Sayılar ve Aralarında Asallık",
      5: "1. Konu: Faktöriyel Kavramı ve Sadeleştirme",
      6: "1. Konu: Sayı Basamakları ve Çözümleme I",
      7: "1. Konu: Sayı Basamakları ve Çözümleme II",
      8: "1. Konu: Taban Aritmetiği ve Basamak Değeri",
      9: "1. Konu: Basamak Farkı ve Rakamları Toplamı",
      10: "1. Konu: Temel Kavramlar İleri Düzey Karma",

      11: "2. Konu: Bölme İşlemi ve Kalan Bağıntıları",
      12: "2. Konu: 2, 3, 4, 5, 8, 9, 10 ile Bölünebilme",
      13: "2. Konu: 11, 12, 15, 18 ile Bölünebilme Kuralları",
      14: "2. Konu: 36, 45, 55 ile Bölünebilme ve Kalan Analizi",
      15: "2. Konu: Asal Çarpanlara Ayırma ve Bölen Sayıları",
      16: "2. Konu: Pozitif, Negatif ve Tek/Çift Bölen Sayıları",
      17: "2. Konu: EBOB - EKOK Temel Özellikleri",
      18: "2. Konu: Aralarında Asal Sayılarda EBOB - EKOK",
      19: "2. Konu: EBOB - EKOK Problemleri (Tarla, Kutu, Fayans)",
      20: "2. Konu: Periyodik Tekrar Eden Olaylar ve Nöbet Problemleri",

      21: "3. Konu: Kesir Çeşitleri ve Sadeleştirme",
      22: "3. Konu: Rasyonel Sayılarda Toplama ve Çıkarma",
      23: "3. Konu: Rasyonel Sayılarda Çarpma ve Bölme",
      24: "3. Konu: Merdivenli (Sonsuz) Kesir İşlemleri",
      25: "3. Konu: Kesirlerde Sıralama ve Pay/Payda Eşitleme",
      26: "3. Konu: Ondalık Sayılarda Dört İşlem",
      27: "3. Konu: Devirli Ondalık Sayılar ve Kesre Dönüştürme",
      28: "3. Konu: Devirli Ondalık Sayılarda Dört İşlem",
      29: "3. Konu: Ondalık Sayılarda Sıralama",
      30: "3. Konu: Rasyonel & Ondalık Sayılar İleri Düzey Karma",

      31: "4. Konu: Basit Eşitsizliklerin Temel Özellikleri",
      32: "4. Konu: Aralık Kavramı ve Birinci Dereceden Eşitsizlikler",
      33: "4. Konu: Eşitsizliklerde Taraf Tarafa Toplama ve Çarpma",
      34: "4. Konu: Eşitsizliklerde Kuvvet ve Ters Çevirme",
      35: "4. Konu: İki Değişkenli Eşitsizlik Sistemleri",
      36: "4. Konu: Mutlak Değerin Tanımı ve Temel Özellikleri",
      37: "4. Konu: Mutlak Değerli Denklemler I",
      38: "4. Konu: Mutlak Değerli Denklemler II (|f(x)| = |g(x)|)",
      39: "4. Konu: Mutlak Değerli Eşitsizlikler (|f(x)| < a)",
      40: "4. Konu: Basit Eşitsizlik & Mutlak Değer İleri Düzey Karma",

      41: "5. Konu: Üslü Sayılarda Temel Kurallar ve Negatif Üs",
      42: "5. Konu: Üslü İfadelerde Toplama ve Çıkarma",
      43: "5. Konu: Üslü İfadelerde Çarpma ve Bölme",
      44: "5. Konu: Üslü Denklemler ve Taban Eşitliği",
      45: "5. Konu: a^x = b^y Zincirleme Üslü Sistemler & Eşitsizlikler",
      46: "5. Konu: Köklü Sayı Tanımı ve Kök Dışına Çıkarma",
      47: "5. Konu: Köklü Sayılarda Dört İşlem",
      48: "5. Konu: Paydayı Rasyonel Yapma (Eşlenik Çarpımı)",
      49: "5. Konu: İç İçe Kökler ve Özel Kök Bağıntıları",
      50: "5. Konu: Üslü ve Köklü Sayılar İleri Düzey Karma",

      51: "6. Konu: Ortak Çarpan Parantezine Alma ve Gruplandırma",
      52: "6. Konu: İki Kare Farkı Özdeşliği",
      53: "6. Konu: Tam Kare Açılımları ((a ± b)²)",
      54: "6. Konu: İki Küp Toplamı ve Farkı (a³ ± b³)",
      55: "6. Konu: Rasyonel İfadelerin Sadeleştirilmesi",
      56: "6. Konu: Oran ve Orantının Temel Özellikleri",
      57: "6. Konu: Doğru Orantı ve Uygulamaları",
      58: "6. Konu: Ters Orantı ve Bileşik Orantı",
      59: "6. Konu: Aritmetik, Geometrik ve Harmonik Ortalama",
      60: "6. Konu: Çarpanlara Ayırma & Oran-Orantı Karma",

      61: "7. Konu: Denklem Kurma Problemleri I (Sayı Problemleri)",
      62: "7. Konu: Denklem Kurma Problemleri II (Ayak Sayısı, Kuyruk)",
      63: "7. Konu: Mum, Merdiven ve Tel Kesme Problemleri",
      64: "7. Konu: Kesir Problemleri I (Kalanın Kalanı)",
      65: "7. Konu: Kesir Problemleri II (Su Deposu, Havuz)",
      66: "7. Konu: Yaş Problemleri I (Temel Yaş Bağıntıları)",
      67: "7. Konu: Yaş Problemleri II (Bugünkü Yaş, Yaş Farkı)",
      68: "7. Konu: Yaş Problemleri III (Geçmiş ve Gelecek Kurguları)",
      69: "7. Konu: Sayı & Kesir İleri Düzey Problemler",
      70: "7. Konu: Sayı, Kesir ve Yaş Karma Eleyici Problemler",

      71: "8. Konu: Yüzde Hesapları ve Yüzde Değişimleri",
      72: "8. Konu: Kâr - Zarar Problemleri I (Maliyet, Satış)",
      73: "8. Konu: Kâr - Zarar Problemleri II (İndirim, Zam, Enflasyon)",
      74: "8. Konu: Karışım Problemleri I (Saf Madde, Su Ekleme)",
      75: "8. Konu: Karışım Problemleri II (İki Karışımın Karıştırılması)",
      76: "8. Konu: İşçi Problemleri I (Birim Zamanda Yapılan İş)",
      77: "8. Konu: İşçi Problemleri II (Birlikte Çalışma, İşten Ayrılma)",
      78: "8. Konu: Hareket (Hız) Problemleri I (Zıt ve Aynı Yönlü)",
      79: "8. Konu: Hareket Problemleri II (Tren, Tünel ve Akıntı)",
      80: "8. Konu: Yüzde, Kâr, Karışım ve Hız İleri Düzey Karma",

      81: "9. Konu: Kümelerde Temel Kavramlar ve Alt Küme",
      82: "9. Konu: Kümelerde Kesişim, Birleşim ve Fark İşlemleri",
      83: "9. Konu: Küme Problemleri (Dil, Spor, Gazete)",
      84: "9. Konu: Fonksiyon Tanımı, Değer Bulma ve Tanım Kümesi",
      85: "9. Konu: Özel Fonksiyonlar (Birim, Sabit, Doğrusal, Tek-Çift)",
      86: "9. Konu: Bileşke Fonksiyon ve Ters Fonksiyon",
      87: "9. Konu: Sayma Kuralları ve Permütasyon (P(n, r))",
      88: "9. Konu: Tekrarlı Permütasyon ve Dairesel Dizilim",
      89: "9. Konu: Kombinasyon (C(n, r)) ve Geometrik Kombinasyon",
      90: "9. Konu: Olasılık (Basit ve Koşullu Olasılık)",

      91: "10. Konu: Sayma İlkeleri ve Faktöriyel Kavramı",
      92: "10. Konu: Permütasyon ve Tekrarlı Permütasyon",
      93: "10. Konu: Dairesel Permütasyon ve Özel Sıralamalar",
      94: "10. Konu: Kombinasyon Temel Kavramlar ve Seçme Problemleri",
      95: "10. Konu: Geometrik Kombinasyon (Doğru, Üçgen, Dörtgen Sayısı)",
      96: "10. Konu: Binom Açılımı ve Katsayılar",
      97: "10. Konu: Basit Olasılık ve Ayrık Olaylar",
      98: "10. Konu: Bağımsız ve Koşullu Olasılık (Torba, Zar, Para)",
      99: "10. Konu: İstatistik (Aritmetik Ortalama, Mod, Medyan, Açıklık)",
      100: "10. Konu: Sayma, Olasılık ve İstatistik İleri Düzey Karma",

      101: "11. Konu: Geometri - Doğruda Açılar",
      102: "11. Konu: Geometri - Üçgende Açılar I",
      103: "11. Konu: Geometri - Üçgende Açılar II",
      104: "11. Konu: Geometri - Dik Üçgen ve Pisagor Bağıntısı",
      105: "11. Konu: Geometri - Öklid Bağıntıları ve Özel Açılı Dik Üçgenler",
      106: "11. Konu: Geometri - İkizkenar ve Eşkenar Üçgen",
      107: "11. Konu: Geometri - Açıortay ve Kenarortay Bağıntıları",
      108: "11. Konu: Geometri - Üçgende Benzerlik ve Eşlik I",
      109: "11. Konu: Geometri - Üçgende Benzerlik ve Alan İlişkisi",
      110: "11. Konu: Geometri - Üçgende Alan Bağıntıları",
      111: "11. Konu: Geometri - Çokgenler ve Düzgün Çokgenler",
      112: "11. Konu: Geometri - Dörtgenler ve Yamuk",
      113: "11. Konu: Geometri - Paralelkenar ve Eşkenar Dörtgen",
      114: "11. Konu: Geometri - Dikdörtgen, Kare ve Deltoid",
      115: "11. Konu: Geometri - Çemberde Açılar",
      116: "11. Konu: Geometri - Çemberde Uzunluk ve Teğet Bağıntıları",
      117: "11. Konu: Geometri - Dairede Çevre ve Alan",
      118: "11. Konu: Geometri - Noktanın ve Doğrunun Analitiği",
      119: "11. Konu: Geometri - Analitik Düzlemde Alan ve Simetri",
      120: "11. Konu: Geometri - Katı Cisimler",

      // 12. Konu: PİSA / Yeni Nesil - Matematiksel Okuryazarlık ve Modelleme (Test 121-138)
      121: "12. Konu: PİSA / Yeni Nesil - Gerçek Hayat Modellemesi: Kademeli Tarife & Faturalandırma",
      122: "12. Konu: PİSA / Yeni Nesil - Gerçek Hayat Modellemesi: E-Ticaret, Sepet & İndirim Optimizasyonu",
      123: "12. Konu: PİSA / Yeni Nesil - Finansal Okuryazarlık: Vergi Dilimleri, Faiz & Enflasyon Dinamikleri",
      124: "12. Konu: PİSA / Yeni Nesil - Finansal Okuryazarlık: Bütçe Dağılımı ve Satın Alma Gücü",
      125: "12. Konu: PİSA / Yeni Nesil - Kısıtlı Optimizasyon: Minimum Maliyet ve Rota Kararları",
      126: "12. Konu: PİSA / Yeni Nesil - Kısıtlı Optimizasyon: Kapasite, Zaman ve İş Gücü Verimliliği",
      127: "12. Konu: PİSA / Yeni Nesil - Çift Eksenli Dinamik Veri Analizi: Daire ve Sütun Grafikleri",
      128: "12. Konu: PİSA / Yeni Nesil - Çift Eksenli Dinamik Veri Analizi: Çizgi Grafiği & Trend Dönüşümleri",
      129: "12. Konu: PİSA / Yeni Nesil - Algoritmik Düşünme: Kural Tabanlı Sayı Dönüştürme Sistemleri",
      130: "12. Konu: PİSA / Yeni Nesil - Algoritmik Düşünme: Akış Şeması ve Döngü Simülasyonları",
      131: "12. Konu: PİSA / Yeni Nesil - Pratik Ölçme, Hacim & Karışım Modellemesi",
      132: "12. Konu: PİSA / Yeni Nesil - Olasılık ve Risk Analizi: Günlük Yaşam Karar Ağaçları",
      133: "12. Konu: PİSA / Yeni Nesil - Çok Aşamalı Hız, Hareket ve Enerji Tüketim Modelleri",
      134: "12. Konu: PİSA / Yeni Nesil - Tablo ve Veri Matrisi Yorumlama",
      135: "12. Konu: PİSA / Yeni Nesil - Sayısal Mantık & Örüntü Mühendisliği",
      136: "12. Konu: PİSA / Yeni Nesil - Hibrit Problem Senaryoları",
      137: "12. Konu: PİSA / Yeni Nesil - Matematiksel Okuryazarlık Karma PİSA Simülasyonu I",
      138: "12. Konu: PİSA / Yeni Nesil - Matematiksel Okuryazarlık Karma PİSA Simülasyonu II",
    };
    return titles[testNum] ?? "Matematik Test $testNum";
  }

  static String _getCografyaTestTitle(int testNum) {
    const Map<int, String> titles = {
      1: "1. Konu: Coğrafi Konum ve Koordinat Sistemi",
      2: "1. Konu: Paraleller, Meridyenler ve Matematiksel Konum",
      3: "1. Konu: Yerel Saat, Ulusal Saat ve Boylam Hesapları",
      4: "1. Konu: Dört Mevsim, Bakı ve Güneş Işınlarının Geliş Açısı",
      5: "1. Konu: Türkiye'nin Özel (Göreceli) Konumu ve Boğazlar",
      6: "1. Konu: Kara ve Deniz Sınırları, Sınır Kapıları",
      7: "1. Konu: Türkiye'nin Uç Noktaları ve Jeopolitik Konumu",
      8: "1. Konu: Enerji Koridorları ve Jeopolitik Güç Unsurları",
      9: "1. Konu: Coğrafi Konum ve Koordinat Analizleri",
      10: "1. Konu: Coğrafi Konum & Jeopolitik İleri Düzey Karma",

      11: "2. Konu: Jeolojik Zamanlar ve Türkiye'nin Oluşumu",
      12: "2. Konu: Orojenez (Kıvrım ve Kırık Dağlar)",
      13: "2. Konu: Volkanizma ve Volkanik Şekiller",
      14: "2. Konu: Epirojenez ve Masif Araziler",
      15: "2. Konu: Türkiye'nin Platoları ve Oluşum Türleri",
      16: "2. Konu: Ovalar (Tektonik, Karstik, Delta Ovaları)",
      17: "2. Konu: Karstik Şekiller (Lapya, Dolin, Uvala, Polye, Mağara)",
      18: "2. Konu: Buzul Şekilleri ve Rüzgar Şekilleri",
      19: "2. Konu: Yerşekilleri ve Fay Hatları Analizi",
      20: "2. Konu: Yerşekilleri ve Jeoloji İleri Düzey Karma",

      21: "3. Konu: Sıcaklığı Etkileyen Faktörler ve Sıcaklık Dağılışı",
      22: "3. Konu: Basınç Merkezleri ve Yerel Rüzgarlar (Kayıp Sakal)",
      23: "3. Konu: Föhn Rüzgarı ve Mikroklima Alanları",
      24: "3. Konu: Nemlilik ve Yağış Tipleri (Orografik, Konveksiyonel, Cephesel)",
      25: "3. Konu: Akdeniz ve Karadeniz İklim Tipleri",
      26: "3. Konu: Karasal ve Sert Karasal İklim Tipleri",
      27: "3. Konu: Bitki Örtüsü Kuşakları ve Orman Dağılışı",
      28: "3. Konu: Çalı (Maki, Garig, Psödomaki) ve Bozkır Toplulukları",
      29: "3. Konu: Yağış, İklim ve Bitki Örtüsü Analizi",
      30: "3. Konu: İklim ve Bitki Örtüsü İleri Düzey Karma",

      31: "4. Konu: Akarsularımızın Genel Özellikleri ve Rejimleri",
      32: "4. Konu: Açık ve Kapalı Havzalar, Akarsu Dökülen Denizler",
      33: "4. Konu: Türkiye'nin Gölleri ve Oluşum Nedenleri",
      34: "4. Konu: Kıyı Tipleri (Boyuna, Enine, Dalmaçya, Ria vb.)",
      35: "4. Konu: Zonal, İntrazonal ve Azonal Topraklar",
      36: "4. Konu: Erozyon, Nedenleri ve Önleme Yolları",
      37: "4. Konu: Deprem, Heyelan ve Çığ Afetleri",
      38: "4. Konu: Orman Yangınları, Kuraklık ve Sel/Taşkınlar",
      39: "4. Konu: Su, Toprak ve Afet Analizleri",
      40: "4. Konu: Su, Toprak ve Doğal Afetler İleri Düzey Karma",

      41: "5. Konu: Türkiye'de Nüfus Sayımları ve Nüfus Politikaları",
      42: "5. Konu: Nüfusun Dağılışı ve Yoğunluk Çeşitleri",
      43: "5. Konu: Nüfusun Cinsiyet, Yaş ve Sektörel Yapısı",
      44: "5. Konu: Nüfus Piramitleri ve Demografik Dönüşüm",
      45: "5. Konu: İç Göçler, Nedenleri ve Sonuçları",
      46: "5. Konu: Dış Göçler ve Mevsimlik İşçi Göçleri",
      47: "5. Konu: Şehirleşme ve Fonksiyonlarına Göre Şehirler",
      48: "5. Konu: Kır Yerleşmeleri (Köy ve Köy Altı Yerleşmeleri)",
      49: "5. Konu: Nüfus ve Yerleşme Dağılışı Analizi",
      50: "5. Konu: Nüfus ve Yerleşme İleri Düzey Karma",

      51: "6. Konu: Tarımı Etkileyen Faktörler (Sulama, Gübre, Tohum)",
      52: "6. Konu: Tahıllar ve Baklagiller Yetişme Alanları",
      53: "6. Konu: Endüstri Bitkileri (Pamuk, Tütün, Çay, Şeker Pancarı)",
      54: "6. Konu: Yağ Bitkileri (Zeytin, Ayçiçeği, Mısır, Soya)",
      55: "6. Konu: Meyvecilik ve Sebzecilik (Fındık, İncir, Üzüm, Turunçgil)",
      56: "6. Konu: Küçükbaş Hayvancılık (Koyun, Kıl Keçisi, Tiftik Keçisi)",
      57: "6. Konu: Büyükbaş Hayvancılık ve Mera / Besi Hayvancılığı",
      58: "6. Konu: Kümes Hayvancılığı, Arıcılık ve İpek Böcekçiliği",
      59: "6. Konu: Tarım ve Hayvancılık Üretim Merkezleri",
      60: "6. Konu: Tarım ve Hayvancılık İleri Düzey Karma",

      61: "7. Konu: Demir, Bakır ve Krom Madenleri ve Tesisleri",
      62: "7. Konu: Boksit, Bor Mineralleri ve Kükürt",
      63: "7. Konu: Barit, Fosfat, Mermer ve Diğer Madenler",
      64: "7. Konu: Taş Kömürü ve Linyit Yatakları ve Santralleri",
      65: "7. Konu: Petrol ve Doğal Gaz Rezervleri ve Boru Hatları",
      66: "7. Konu: Hidroelektrik Enerji Potansiyeli ve Barajlar",
      67: "7. Konu: Güneş ve Rüzgar Enerjisi Santralleri",
      68: "7. Konu: Jeotermal Enerji ve Biyokütle / Nükleer Enerji",
      69: "7. Konu: Madenler ve Enerji Santralleri Analizi",
      70: "7. Konu: Madenler ve Enerji Kaynakları İleri Düzey Karma",

      71: "8. Konu: Sanayinin Kuruluş Şartları (Hammadde, Enerji, Pazar)",
      72: "8. Konu: Besin, Tütün ve Dokuma / Tekstil Sanayisi",
      73: "8. Konu: Demir-Çelik ve Metalurji Sanayisi",
      74: "8. Konu: Kimya, Petrol Rafinerileri ve Çimento Sanayisi",
      75: "8. Konu: Otomotiv, Savunma ve Makine Sanayisi",
      76: "8. Konu: Karayolu Ulaşımı ve Geçitler / Tüneller",
      77: "8. Konu: Demiryolu Ulaşımı, Ağı ve Ulaşmayan İller",
      78: "8. Konu: Denizyolu Ulaşımı, Limanlar ve Hinterlant",
      79: "8. Konu: Havayolu Ulaşımı ve Transit Ticaret Koridorları",
      80: "8. Konu: Sanayi ve Ulaşım İleri Düzey Karma",

      81: "9. Konu: İç Ticaret, Ticaret Merkezleri ve Serbest Bölgeler",
      82: "9. Konu: Dış Ticaret (İhracat ve İthalat Ürünleri, Ülkeler)",
      83: "9. Konu: Dış Ticaret Dengesi ve Cari Açık",
      84: "9. Konu: Deniz Turizmi ve Kıyı Merkezleri",
      85: "9. Konu: Kültür, Tarih ve İnanç Turizmi Merkezleri",
      86: "9. Konu: Kış Turizmi ve Kayak Merkezleri",
      87: "9. Konu: Termal (Kaplıca) ve Sağlık / Yayla Turizmi",
      88: "9. Konu: UNESCO Dünya Kültür Mirası Listesindeki Eserlerimiz",
      89: "9. Konu: Turizm Merkezleri ve Kültür Varlıkları",
      90: "9. Konu: Ticaret ve Turizm İleri Düzey Karma",

      91: "10. Konu: GAP (Güneydoğu Anadolu Projesi) ve Hedefleri",
      92: "10. Konu: GAP Kapsamındaki İller, Tarım ve Enerji Etkisi",
      93: "10. Konu: DOKAP (Doğu Karadeniz Projesi) ve Yeşil Yol",
      94: "10. Konu: DAP (Doğu Anadolu Projesi) ve Hayvancılık",
      95: "10. Konu: KOP (Konya Ovası Projesi) ve Mavi Tünel",
      96: "10. Konu: ZBK (Zonguldak-Bartın-Karabük) ve YHGP Projeleri",
      97: "10. Konu: Hava, Su ve Toprak Kirliliği",
      98: "10. Konu: Küresel İklim Değişikliği ve Türkiye'ye Etkileri",
      99: "10. Konu: Bölgesel Projeler ve Çevre Analizleri",
      100: "10. Konu: Bölgesel Projeler ve Çevre İleri Düzey Karma",

      // 11. Konu: Haritalı Coğrafya Özel Soru Bankası (ÖSYM V6 Standartları)
      101: "11. Konu: Haritalı Soru - Delta Ovaları ve Kıyı Birikimi",
      102: "11. Konu: Haritalı Soru - Kıvrım Dağları ve Sıradağlar",
      103: "11. Konu: Haritalı Soru - Akarsu Havzaları ve Drenaj",
      104: "11. Konu: Haritalı Soru - Kırık ve Volkanik Dağlar",
      105: "11. Konu: Haritalı Soru - Platolar ve Aşınım Düzlükleri",
      106: "11. Konu: Haritalı Soru - Doğal Göller ve Oluşum Tipleri",
      107: "11. Konu: Haritalı Soru - Kıyı Tipleri ve Kıyı Şekilleri",
      108: "11. Konu: Haritalı Soru - Karstik Şekiller ve Aşınım-Birikim",
      109: "11. Konu: Haritalı Soru - Rüzgar ve Buzul Şekilleri",
      110: "11. Konu: Haritalı Soru - Türkiye İklimi - Sıcaklık Dağılışı",
      111: "11. Konu: Haritalı Soru - Yağış Dağılışı ve Yağış Rejimleri",
      112: "11. Konu: Haritalı Soru - Basınç Merkezleri ve Yerel Rüzgarlar",
      113: "11. Konu: Haritalı Soru - Bitki Örtüsü Kuşakları ve Dağılışı",
      114: "11. Konu: Haritalı Soru - Toprak Tipleri ve Dağılışı",
      115: "11. Konu: Haritalı Soru - Türkiye'de Doğal Afetler",
      116: "11. Konu: Haritalı Soru - Nüfus Yoğunluğu ve Dağılışı",
      117: "11. Konu: Haritalı Soru - Göç Hareketleri ve Şehirleşme",
      118: "11. Konu: Haritalı Soru - Kırsal Yerleşme ve Mesken Tipleri",
      119: "11. Konu: Haritalı Soru - Tarım Ürünleri - Tahıllar ve Sanayi",
      120: "11. Konu: Haritalı Soru - Tarım Ürünleri - Meyve ve Yağ",
      121: "11. Konu: Haritalı Soru - Hayvancılık Türleri ve Dağılışı",
      122: "11. Konu: Haritalı Soru - Ormancılık ve Su Ürünleri",
      123: "11. Konu: Haritalı Soru - Madenler ve Çıkarım Havzaları",
      124: "11. Konu: Haritalı Soru - Enerji Kaynakları ve Santraller",
      125: "11. Konu: Haritalı Soru - Sanayi Tesisleri ve Dağılım Faktörleri",
      126: "11. Konu: Haritalı Soru - Ulaşım Coğrafyası (Geçitler ve Limanlar)",
      127: "11. Konu: Haritalı Soru - Ticaret ve Sınır Kapıları",
      128: "11. Konu: Haritalı Soru - Turizm Coğrafyası ve UNESCO Mirası",
      129: "11. Konu: Haritalı Soru - Bölgesel Kalkınma Projeleri (GAP, DOKAP, DAP)",
      130: "11. Konu: Haritalı Soru - Jeopolitik Konum, Boğazlar ve Enerji Hatları",
    };
    return titles[testNum] ?? "Coğrafya Test $testNum";
  }

  static String _getVatandaslikTestTitle(int testNum) {
    const Map<int, String> titles = {
      1: "1. Konu: Sosyal Hayatı Düzenleyen Kurallar (Din, Ahlak, Görgü ve Hukuk Kuralları)",
      2: "1. Konu: Hukuk Kurallarının Özellikleri ve Hukuki Yaptırım (Müeyyide) Türleri",
      3: "1. Konu: Hükümsüzlük Türleri (Yokluk, Butlan, Askıda Hükümsüzlük, Fesih ve İptal)",
      4: "1. Konu: Hukukun Kaynakları (Yazılı, Yazısız, Yardımcı Kaynaklar ve Hukuk Boşluğu)",
      5: "1. Konu: Hukuk Sistemleri ve Pozitif / Mevzu / Doğal (İdeal) Hukuk Ayrımı",
      6: "1. Konu: Hukuki Olay, Hukuki Fiil ve Hukuki İşlem Kavramları",
      7: "1. Konu: Hak Kavramı, Hakların Kazanılması, İyiniyet ve Dürüstlük Kuralı",
      8: "1. Konu: Hakların Korunması ve Kişinin Kendi Hakkını Koruması (Meşru Müdafaa, Zaruret, Kuvvet Kullanma)",
      9: "1. Konu: Kişilik Kavramı, Hak ve Fiil Ehliyeti ve Ehliyet Türleri",
      10: "1. Konu: Hukukun Temel Kavramları İleri Düzey Karma ve ÖSYM Sentezi",
      11: "2. Konu: Devletin Unsurları (Millet, Ülke, Egemenlik) ve Egemenlik Türleri",
      12: "2. Konu: Yapılarına Göre Devletler (Basit / Üniter Devlet ve Birleşik / Federal-Konfederal Devlet)",
      13: "2. Konu: Hükümet Sistemleri - I (Kuvvetler Birliği: Meclis Hükümeti, Mutlak Monarşi, Diktatörlük)",
      14: "2. Konu: Hükümet Sistemleri - II (Kuvvetler Ayrılığı: Parlamenter Sistem, Başkanlık ve Yarı Başkanlık)",
      15: "2. Konu: Türkiye'de Hükümet Sistemlerinin Evrimi ve Cumhurbaşkanlığı Hükümet Sistemi",
      16: "2. Konu: Demokrasi Teorisi, Çoğulcu - Çoğunlukçu Demokrasi ve Seçim İlkeleri",
      17: "3. Konu: Osmanlı Anayasal Hareketleri (Sened-i İttifak, Tanzimat ve Islahat Fermanları)",
      18: "3. Konu: 1876 Kanun-i Esasi (I. ve II. Meşrutiyet Dönemleri ve 1909 Değişiklikleri)",
      19: "3. Konu: 1921 Teşkilat-ı Esasiye Kanunu ve 1923 Cumhuriyetin İlanı Değişiklikleri",
      20: "3. Konu: 1924 Anayasası (Özellikleri, Karma Hükümet Sistemi ve Önemli Değişiklikler)",
      21: "3. Konu: 1961 Anayasası (Kuruluşu, Getirdiği Yenilikler ve 1971-1973 Muhtıra Değişiklikleri)",
      22: "3. Konu: 1982 Anayasası'nın İlk Hali, Yapılış Süreci ve 1961 ile Karşılaştırılması",
      23: "3. Konu: 1982 Anayasası'nda Önemli Değişiklikler (1987, 1995, 2001, 2004 ve 2010)",
      24: "3. Konu: 2017 Anayasa Referandumu ve Getirdiği Radikal Yapısal Değişiklikler",
      25: "4. Konu: Devletin Şekli, Cumhuriyetin Nitelikleri ve Değiştirilemez / Teklif Edilemez İlk 3 Madde",
      26: "4. Konu: Başkent, Resmi Dil, Bayrak, İstiklal Marşı ve Egemenliğin Kullanılması",
      27: "4. Konu: Temel Hak ve Hürriyetlerin Niteliği, Sınırlanması ve Güvenceleri (Madde 13)",
      28: "4. Konu: Temel Hak ve Hürriyetlerin Durdurulması Rejimi (Madde 15 - Sert Çekirdek Haklar)",
      29: "4. Konu: Negatif Statü (Kişisel / Koruyucu) Haklar - I (Kişi Dokunulmazlığı, Yaşama, Zorla Çalıştırma Yasağı)",
      30: "4. Konu: Negatif Statü (Kişisel / Koruyucu) Haklar - II (Özel Hayatın Gizliliği, Konut, Haberleşme, Mülkiyet)",
      31: "4. Konu: Pozitif Statü (Sosyal ve Ekonomik / İsteme) Haklar (Eğitim, Sağlık, Çalışma, Sendika, Grev)",
      32: "4. Konu: Aktif Statü (Siyasi / Katılma) Haklar - I (Vatandaşlık, Seçme ve Seçilme, Siyasi Partiler)",
      33: "4. Konu: Aktif Statü (Siyasi / Katılma) Haklar - II (Dilekçe, Bilgi Edinme, Kamu Denetçisine Başvuru)",
      34: "4. Konu: Genel Esaslar ve Temel Haklar İleri Düzey Karma ve ÖSYM Sentezi",
      35: "5. Konu: TBMM'nin Yapısı, Milletvekili Sayısı ve Seçilme Yeterliliği Şartları",
      36: "5. Konu: Seçimlerin Geriye Bırakılması (Ertelenmesi), Yenilenmesi (Erken Seçim) ve Ara Seçim",
      37: "5. Konu: Yasama Dönemi, Yasama Yılı, Toplantı ve Karar Yeter Sayıları",
      38: "5. Konu: Yasama Bağışıklıkları - I (Yasama Sorumsuzluğu / Mutlak Dokunulmazlık)",
      39: "5. Konu: Yasama Bağışıklıkları - II (Yasama Dokunulmazlığı ve Dokunulmazlığın Kaldırılması)",
      40: "5. Konu: Milletvekilliğinin Düşmesi, Sona Ermesi ve İptal Davası Süreci",
      41: "5. Konu: TBMM Başkanlık Divanı, Seçimi, Nitelikleri ve Görev Süresi",
      42: "5. Konu: TBMM'nin Görev ve Yetkileri (Kanun Yapma, Bütçe, Savaş İlanı, Genel Af)",
      43: "5. Konu: Kanun Yapım Süreci, Cumhurbaşkanının İncelemesi, Veto ve Yayımlanma",
      44: "5. Konu: Anayasa Değişikliği Süreci (Teklif, Görüşme, Kabul Çoğunlukları ve Referandum)",
      45: "5. Konu: TBMM'nin Bilgi Edinme ve Denetim Yolları (Yazılı Soru, Meclis Araştırması, Genel Görüşme, Meclis Soruşturması)",
      46: "5. Konu: Yasama Organı İleri Düzey Karma ve ÖSYM Sentezi",
      47: "6. Konu: Cumhurbaşkanlığına Aday Gösterme ve Seçilme Yeterliliği Şartları",
      48: "6. Konu: Cumhurbaşkanlığı Seçim Usulü (İki Turlu Sistem, Seçim Takvimi ve Süreler)",
      49: "6. Konu: Cumhurbaşkanının Yasama ve Yargıya İlişkin Görev ve Yetkileri",
      50: "6. Konu: Cumhurbaşkanının Yürütmeye İlişkin Görev ve Yetkileri (Üst Düzey Yöneticiler, TSK Başkomutanlığı)",
      51: "6. Konu: Cumhurbaşkanlığı Kararnameleri (Olağan CBK'lerin Konusu, Sınırları ve Yargısal Denetimi)",
      52: "6. Konu: Cumhurbaşkanlığı Genelgeleri, Yönetmelikler ve Düzenleyici İşlemler",
      53: "6. Konu: Cumhurbaşkanı Yardımcıları, Bakanlar, Atanmaları ve Görev ve Sorumlulukları",
      54: "6. Konu: Cumhurbaşkanının Cezai Sorumluluğu ve Yüce Divan Süreci (Soruşturma Usulü)",
      55: "6. Konu: Milli Güvenlik Kurulu (MGK) Yapısı, Üyeleri, Gündemi ve Kararlarının Niteliği",
      56: "6. Konu: Devlet Denetleme Kurulu (DDK) Yapısı, Görev Alanı ve İnceleme Yetkileri",
      57: "6. Konu: Olağanüstü Hal (OHAL) Rejimi (İlan Sebepleri, Süresi, TBMM Onayı ve OHAL CBK'leri)",
      58: "6. Konu: Yürütme Organı İleri Düzey Karma ve ÖSYM Sentezi",
      59: "7. Konu: Yargı Bağımsızlığı, Hâkimlik ve Savcılık Teminatı ve Doğal Hâkim İlkesi",
      60: "7. Konu: Hâkimler ve Savcılar Kurulu (HSK) Üye Yapısı, Seçimi, Görevleri ve Kararları",
      61: "7. Konu: Sayıştay ve Yüksek Seçim Kurulu (YSK) Yapısı, Kararlarının Kesinliği",
      62: "7. Konu: Anayasa Mahkemesi - I (Kuruluşu, Üye Sayısı, Seçilme Nitelikleri ve Görev Süresi)",
      63: "7. Konu: Anayasa Mahkemesi - II (Bireysel Başvuru Usulü ve İnceleme Şartları)",
      64: "7. Konu: Anayasa Mahkemesi - III (Soyut Norm Denetimi / İptal Davası Usulü, Süreleri ve Yetkililer)",
      65: "7. Konu: Anayasa Mahkemesi - IV (Somut Norm Denetimi / İtiraz Yolu ve Def'i Şartları)",
      66: "7. Konu: Anayasa Mahkemesi - V (Yüce Divan Yargılaması, Siyasi Parti Kapatma ve Mali Denetim)",
      67: "7. Konu: Yargıtay (Adli Yargı Temyiz Mercii, Üye Seçimi ve Başsavcılık)",
      68: "7. Konu: Danıştay (İdari Yargı Temyiz Mercii, Üye Seçimi ve İlk Derece Mahkemesi Rolü)",
      69: "7. Konu: Uyuşmazlık Mahkemesi (Adli ve İdari Yargı Uyuşmazlıkları ve Çözüm Yolları)",
      70: "7. Konu: Yargı Organı İleri Düzey Karma ve ÖSYM Sentezi",
      71: "8. Konu: İdare Hukukunun Temel İlkeleri (Kanunilik, Düzenlilik, İdarenin Bütünlüğü)",
      72: "8. Konu: İdari Teşkilatın Temel İlkeleri: Yetki Genişliği ve Merkezden Yönetim İlkesi",
      73: "8. Konu: İdari Vesayet ve Hiyerarşi Denetimi Arasındaki Temel Farklar",
      74: "8. Konu: Başkent Teşkilatı (Cumhurbaşkanlığı, Bakanlıklar ve Yardımcı Kuruluşlar: Danıştay, Sayıştay, MGK)",
      75: "8. Konu: Taşra Teşkilatı - I (İl Genel İdaresi: Vali, Yetki Genişliği, Görev ve Yetkileri)",
      76: "8. Konu: Taşra Teşkilatı - II (İl İdare Şube Başkanları, İl İdare Kurulu, İlçe İdaresi ve Kaymakam)",
      77: "8. Konu: Mahalli İdareler - I (İl Özel İdaresi: Vali, İl Genel Meclisi, İl Encümeni)",
      78: "8. Konu: Mahalli İdareler - II (Belediye İdaresi: Belediye Başkanı, Belediye Meclisi, Belediye Encümeni)",
      79: "8. Konu: Mahalli İdareler - III (Büyükşehir Belediyesi: Kuruluş Kriterleri, Organları ve Hizmet Alanı)",
      80: "8. Konu: Mahalli İdareler - IV (Köy İdaresi: Muhtar, İhtiyar Meclisi, Köy Derneği, Salma ve İmece)",
      81: "8. Konu: Hizmet Yerinden Yönetim Kuruluşları, Kamu Kurumu Niteliğindeki Meslek Kuruluşları ve Düzenleyici Kurullar",
      82: "8. Konu: İdari Teşkilat ve Mahalli İdareler İleri Düzey Karma ve ÖSYM Sentezi",
      83: "9. Konu: Kamu Görevlileri ve 657 Sayılı DMK (Memur, Sözleşmeli Personel, İşçi)",
      84: "9. Konu: Devlet Memurluğuna Giriş Şartları, Ödev ve Sorumlulukları ve Yasaklar",
      85: "9. Konu: Devlet Memurlarının Hakları ve Disiplin Cezaları (Uyarma, Kınama, Aylıktan Kesme, Kademe Durdurma, İhraç)",
      86: "9. Konu: Memurluğun Sona Ermesi (Çekilme, Çekilmiş Sayılma, Koşullarda Eksiklik, Emeklilik)",
      87: "9. Konu: İdari İşlemlerin Özellikleri (Tek Taraflılık, İcrailik, Hukuka Uygunluk Karinesi)",
      88: "9. Konu: İdari İşlemin Unsurları (Yetki, Şekil, Sebep, Konu, Amaç) ve Sakatlık Halleri",
      89: "9. Konu: Kamusal Mallar, Kamulaştırma (İstimlak), İstimval ve Geçici İşgal",
      90: "9. Konu: İdarenin Sorumluluğu (Kusur Sorumluluğu, Kusursuz Sorumluluk: Risk ve Fedakarlığın Denkleştirilmesi) ve İptal/Tam Yargı Davaları",
      91: "10. Konu: Birleşmiş Milletler (BM): Kuruluşu, Temel Organları (Genel Kurul, Güvenlik Konseyi) ve Bağlı Kuruluşlar",
      92: "10. Konu: Kuzey Atlantik Antlaşması Örgütü (NATO): Yapısı, Türkiye'nin Üyeliği ve Madde 5",
      93: "10. Konu: Avrupa Birliği (AB): Genişleme Süreci, Kopenhag / Maastricht Kriterleri ve Organları",
      94: "10. Konu: Avrupa Konseyi (AK) ve Avrupa İnsan Hakları Mahkemesi (AİHM) Usulü",
      95: "10. Konu: Bölgesel Kuruluşlar (Türk Devletleri Teşkilatı, KEİ, D-8, İslam İşbirliği Teşkilatı, ŞİÖ)",
      96: "10. Konu: Küresel Ekonomik Kuruluşlar (Dünya Bankası, IMF, OECD, G-20, DTÖ)",
      97: "10. Konu: Türkiye'nin Taraf Olduğu Önemli Uluslararası Anlaşmalar ve Çevre / İnsan Hakları Sözleşmeleri",
      98: "10. Konu: Güncel Hukuki Gelişmeler, Yargı Reformları ve Anayasa Değişikliği Sentezi",
      99: "10. Konu: KPSS Vatandaşlık Büyük Sentez Denemesi - I (Tüm 10 Konu ÖSYM Karması)",
      100: "10. Konu: KPSS Vatandaşlık Büyük Final Denemesi - II (100. Test Özel - Tam ÖSYM Formatı)",
    };
    return titles[testNum] ?? "Vatandaşlık Test $testNum";
  }

  static String _getMantikTestTitle(int testNum) {
    const Map<int, String> titles = {
      // 1. Konu: Sıralama, Yer Değiştirme ve Kat/Sıra Düzeni (Test 1-10)
      1: "1. Konu: Sözel Mantık - Sıralama, Yer Değiştirme ve Kat/Sıra Problemleri",
      2: "1. Konu: Sözel Mantık - Sıralama, Masa ve Oturma Düzeni Senaryoları",
      3: "1. Konu: Sözel Mantık - Apartman ve Kat Dağılımı Mantık Analizi",
      4: "1. Konu: Sözel Mantık - Kuyruk, Yarış ve Öncelik Sıralama Problemleri",
      5: "1. Konu: Sözel Mantık - Yuvarlak ve Dikdörtgen Masa Oturma Planı",
      6: "1. Konu: Sözel Mantık - Gün ve Saat Esaslı Sıralama Kurguları",
      7: "1. Konu: Sözel Mantık - Vardiya ve Sıralı Nöbet Düzeni",
      8: "1. Konu: Sözel Mantık - Adım Adım İlerleme ve Pozisyon Değişimi",
      9: "1. Konu: Sözel Mantık - Sıralamada Kesinlik ve İhtimal Analizleri",
      10: "1. Konu: Sözel Mantık - Sıralama ve Yerleşim İleri Düzey Karma Deneme",

      // 2. Konu: Eşleştirme, Çapraz Tablolar ve İhtimal Ağaçları (Test 11-20)
      11: "2. Konu: Sözel Mantık - Eşleştirme ve Çapraz Tablo Kurma Matrisi",
      12: "2. Konu: Sözel Mantık - Çok Değişkenli Eşleştirme ve İhtimal Ağaçları",
      13: "2. Konu: Sözel Mantık - Otopark ve Katlı Garaj Araç Eşleştirmeleri",
      14: "2. Konu: Sözel Mantık - Mağaza Reyonları, Ürün ve Müşteri Eşleştirmesi",
      15: "2. Konu: Sözel Mantık - Meslek, Şehir ve Görev Çapraz Matrisleri",
      16: "2. Konu: Sözel Mantık - Dil, Ülke ve Sempozyum Katılımcı Dağılımı",
      17: "2. Konu: Sözel Mantık - Üç Değişkenli Karmaşık İhtimal Matrisleri",
      18: "2. Konu: Sözel Mantık - 'En Az / En Çok' Kriterli Eşleştirme Modelleri",
      19: "2. Konu: Sözel Mantık - Koşullu Eşleştirme ve İpuçlarını Ayıklama",
      20: "2. Konu: Sözel Mantık - Eşleştirme ve Matris İleri Düzey Karma Deneme",

      // 3. Konu: Gruplama, Kümeler, Dağılım ve Büyük ÖSYM Sentezi (Test 21-30)
      21: "3. Konu: Sözel Mantık - Gruplama, Kümeler ve Dağılım Problemleri",
      22: "3. Konu: Sözel Mantık - ÖSYM Çıkmış Benzeri Büyük Sentez ve Soru Grupları",
      23: "3. Konu: Sözel Mantık - Proje Grupları ve Takım Seçim Dinamikleri",
      24: "3. Konu: Sözel Mantık - Hastane Nöbet Listesi ve Bölüm Görevlendirmeleri",
      25: "3. Konu: Sözel Mantık - Ders, Eğitmen ve Sınıf Kombinasyon Dağılımı",
      26: "3. Konu: Sözel Mantık - Jüri, Komisyon ve Heyet Belirleme Mantığı",
      27: "3. Konu: Sözel Mantık - Çok Aşamalı Eleme ve Filtreleme Senaryoları",
      28: "3. Konu: Sözel Mantık - Küme Kesişimleri ve Ayrık Küme Dağılımları",
      29: "3. Konu: Sözel Mantık - Büyük Metinli ve 4 Öncüllü ÖSYM Sentez Denemesi - I",
      30: "3. Konu: Sözel Mantık - Sözel Mantık Final ve Ustalık Sentez Denemesi - II",

      // 4. Konu: Sayısal Mantık - Tablo, Grafik ve Veri Analizi (Test 31-40)
      31: "4. Konu: Sayısal Mantık - Tablo, Grafik ve Veri Analizi (Daire, Sütun, Çizgi)",
      32: "4. Konu: Sayısal Mantık - Daire Grafiklerinde Açı ve Yüzde Dönüşümleri",
      33: "4. Konu: Sayısal Mantık - Sütun ve Çubuk Grafiği Karşılaştırmalı Analiz",
      34: "4. Konu: Sayısal Mantık - Çizgi Grafiği, Artış/Azalış Oranları ve Trendler",
      35: "4. Konu: Sayısal Mantık - İkili ve Karma Grafik Dönüşüm Problemleri",
      36: "4. Konu: Sayısal Mantık - Tablo Okuma, Çapraz Veri Toplama ve Ortalama",
      37: "4. Konu: Sayısal Mantık - Kar-Zarar, Maliyet ve Satış Tabloları Yorumlama",
      38: "4. Konu: Sayısal Mantık - Nüfus, Üretim ve Tüketim İstatistiki Veri Analizi",
      39: "4. Konu: Sayısal Mantık - Karmaşık Veri Matrisleri ve Orantı Analizleri",
      40: "4. Konu: Sayısal Mantık - Tablo ve Grafik İleri Düzey ÖSYM Karma Deneme",

      // 5. Konu: Sayısal Mantık - Sihirli Kareler, Sudoku, Sayı Piramitleri ve Sayısal Örüntüler (Test 41-50)
      41: "5. Konu: Sayısal Mantık - Sihirli Kareler ve Toplam Dengesi Modelleri",
      42: "5. Konu: Sayısal Mantık - Sudoku, Kendoku ve Mantıksal Hücre Yerleşimi",
      43: "5. Konu: Sayısal Mantık - Sayı Piramitleri, Pascal ve Katman Toplamları",
      44: "5. Konu: Sayısal Mantık - Sayı Dizileri, Artış Kuralları ve Örüntü Keşfi",
      45: "5. Konu: Sayısal Mantık - Matris İçi İşlemler, Satır-Sütun Bağıntıları",
      46: "5. Konu: Sayısal Mantık - Dairesel Sayı Yerleşimleri ve Kesişen Halka Toplamı",
      47: "5. Konu: Sayısal Mantık - Sayı Üçgenleri, Yıldızlar ve Geometrik Düzenler",
      48: "5. Konu: Sayısal Mantık - Özel Tanımlı Fonksiyonel ve Kural Tabanlı Sayı İşlemleri",
      49: "5. Konu: Sayısal Mantık - Şifrelenmiş Matematiksel Dizilimler ve Kodlar",
      50: "5. Konu: Sayısal Mantık - Sayısal Örüntüler ve Sihirli Matrisler Karma Deneme",

      // 6. Konu: Sayısal Mantık - Şekil Yeteneği, Çarklar, Terazi Dengesi, Rota ve Turnuva (Test 51-60)
      51: "6. Konu: Sayısal Mantık - Şekil Yeteneği, Katlama, Kesme ve Döndürme",
      52: "6. Konu: Sayısal Mantık - Dişli Çarklar, Kasnaklar ve Dönüş Yönü/Tur Sayısı",
      53: "6. Konu: Sayısal Mantık - Eşit Kollu Terazi Dengesi ve Ağırlık Kıyaslama",
      54: "6. Konu: Sayısal Mantık - Yönlendirilmiş Rota, Ağ (Network) ve En Kısa Yol",
      55: "6. Konu: Sayısal Mantık - Lig Puan Durumu, Turnuva Eşleşmesi ve Maç Skoru",
      56: "6. Konu: Sayısal Mantık - Küp Açınımları, Karşı Yüzler ve Zar Problemleri",
      57: "6. Konu: Sayısal Mantık - Akış Şemaları, Algoritmalar ve Döngü Takibi",
      58: "6. Konu: Sayısal Mantık - Strateji, Oyun Teorisi ve Hamle Hesaplama",
      59: "6. Konu: Sayısal Mantık - Büyük Sayısal Mantık Sentez Denemesi - I",
      60: "6. Konu: Sayısal Mantık - KPSS Sözel & Sayısal Mantık Final Büyük Denemesi - II",
    };
    return titles[testNum] ?? "Mantık Test $testNum";
  }

  static String _getSayisalMantikTestTitle(int testNum) {
    const Map<int, String> titles = {
      1: "1. Bölüm: Sayısal Mantık - Sayı Dizileri, Piramitler ve Üçgensel Hücreler",
      2: "1. Bölüm: Sayısal Mantık - Tanımlı Yeni İşlem Makineleri ve Akış Algoritmaları",
      3: "1. Bölüm: Sayısal Mantık - Özel Tanımlı Sayılar ve Sayı Basamağı Oyunları",
      4: "1. Bölüm: Sayısal Mantık - Rekürsif Bağıntılar ve Sayı Örüntüleri",
      5: "1. Bölüm: Sayısal Mantık - Saat, Zaman ve Periyodik Tekrar Problemleri",
      6: "1. Bölüm: Sayısal Mantık - Sayı Çemberleri ve Halka Düzenekleri",
      7: "1. Bölüm: Sayısal Mantık - Kripto Aritmetik ve Harfli İşlem Şifreleri",
      8: "1. Bölüm: Sayısal Mantık - Sayı Doğrusu, Eşitsizlik ve Aralık Mantığı",
      9: "1. Bölüm: Sayısal Mantık - Modüler Kurgular ve Bölünebilme Oyunları",
      10: "1. Bölüm: Sayısal Mantık - İşlem ve Sayı Düzenekleri İleri Karma Deneme",

      11: "2. Bölüm: Sayısal Mantık - Sihirli Kareler ve 3x3 Matris Toplamları",
      12: "2. Bölüm: Sayısal Mantık - Sudoku Kurallı Sayı Yerleştirme Tabloları",
      13: "2. Bölüm: Sayısal Mantık - Eşit Kollu Terazi ve Kütle Denge Sistemleri",
      14: "2. Bölüm: Sayısal Mantık - Kibrit Çöpleri ve Şekil Örüntü Izgaraları",
      15: "2. Bölüm: Sayısal Mantık - Geometrik Hücre Ağları ve Nokta Sayma",
      16: "2. Bölüm: Sayısal Mantık - Çoklu Terazi ve Sembolik Eşitlik Denklemleri",
      17: "2. Bölüm: Sayısal Mantık - Katlama, Kesme ve Simetri Mantığı",
      18: "2. Bölüm: Sayısal Mantık - Tablo İçi Çapraz Çarpım ve Toplam Matrisleri",
      19: "2. Bölüm: Sayısal Mantık - Küp Açınımları ve Zar Yüzeyi Mantığı",
      20: "2. Bölüm: Sayısal Mantık - Şekil Yeteneği ve Denge İleri Karma Deneme",

      21: "3. Bölüm: Sayısal Mantık - Rota, Düğüm ve En Kısa Yol Grafikleri",
      22: "3. Bölüm: Sayısal Mantık - Birbirine Bağlı Çarklar ve Dişli Dönme Turu",
      23: "3. Bölüm: Sayısal Mantık - Daire ve Sütun Grafiği Veri Dönüşümleri",
      24: "3. Bölüm: Sayısal Mantık - Havuz, Dolum ve Seviye Değişim Grafikleri",
      25: "3. Bölüm: Sayısal Mantık - Nim Oyunu ve Taş Alma Strateji Analizi",
      26: "3. Bölüm: Sayısal Mantık - Bilye, Kart ve Para Dağıtım Algoritmaları",
      27: "3. Bölüm: Sayısal Mantık - İki Eksenli Kâr-Zarar ve Üretim Tabloları",
      28: "3. Bölüm: Sayısal Mantık - Mantıksal Optimizasyon ve Kapasite Problemleri",
      29: "3. Bölüm: Sayısal Mantık - Büyük Metinli ÖSYM Sayısal Sentez Denemesi - I",
      30: "3. Bölüm: Sayısal Mantık - Sayısal Mantık Ustalık ve Final Denemesi - II",
    };
    return titles[testNum] ?? "Sayısal Mantık Test $testNum";
  }

  static String _getTarihTestTitle(int testNum) {
    const Map<int, String> titles = {
      1: "Test 1: Orta Asya Kültür Merkezleri, Türklerin İlk Yurdu ve Göçler",
      2: "Test 2: İskitler (Sakalar) ve Asya Hun Devleti - Teoman & Mete Han",
      3: "Test 3: Kavimler Göçü ve Avrupa Hun Devleti (Balamir, Uldız, Attila)",
      4: "Test 4: I. ve II. Göktürk (Kutluk) Devleti & Orhun Abideleri",
      5: "Test 5: Uygur Devleti (Maniheizm, Yerleşik Yaşam, Kültür & Sanat)",
      6: "Test 6: Diğer Türk Devletleri ve Boyları - I (Avar, Hazar, Bulgar, Macar)",
      7: "Test 7: Diğer Türk Devletleri ve Boyları - II (Peçenek, Kıpçak, Oğuz, Karluk, Kırgız, Türgiş)",
      8: "Test 8: İlk Türk Devletlerinde Devlet Teşkilatı, Veraset ve Ordu Yapısı",
      9: "Test 9: Hukuk (Töre), Sosyal Hayat, İnanç ve Din Sistemi",
      10: "Test 10: Dil, Yazı, Edebiyat, Bilim, Sanat ve Genel Tarama",
      11: "Test 11: Türklerin İslamiyet'i Kabulü, Talas Savaşı & Karahanlılar",
      12: "Test 12: Gazneliler Devleti (Alp Tigin, Gazneli Mahmud, Hindistan Seferleri)",
      13: "Test 13: Büyük Selçuklu Devleti Kuruluş & Yükselme (Dandanakan, Pasinler, Bağdat)",
      14: "Test 14: Büyük Selçuklu Devleti Parlak Dönem & Yıkılış (Malazgirt, Melikşah, Nizâmülmülk)",
      15: "Test 15: Mısır'da Kurulan Türk-İslam Devletleri (Tolun, İhşid, Eyyubi, Memlük)",
      16: "Test 16: Diğer Türk-İslam Devletleri (Harzemşahlar, Timurlular, Babürler, Moğol Hanlıkları)",
      17: "Test 17: Türk-İslam Devlet Teşkilatı, Hükümdarlık Alametleri & Saray Teşkilatı",
      18: "Test 18: Ordu Teşkilatı, İkta Sistemi & Toprak Yönetimi",
      19: "Test 19: Hukuk Sistemi, Sosyal Hayat, Vakıf & Eğitim Teşkilatı",
      20: "Test 20: Türk-İslam Bilim İnsanları, Felsefe, Sanat ve Genel Tarama",
      21: "Test 21: Türkiye Selçuklu Devleti Kuruluş Dönemi (Süleyman Şah, I. Kılıçarslan, II. Kılıçarslan)",
      22: "Test 22: Türkiye Selçuklu Devleti Yükselme & Ticaret (Keyhüsrev, Keykavus, Keykubad)",
      23: "Test 23: 1240 Baba İshak İsyanı, 1243 Kösedağ Savaşı ve Moğol Tahakkümü",
      24: "Test 24: II. Dönem Türk Beylikleri - I (Karamanoğulları, Germiyan, Karesi, Candar)",
      25: "Test 25: II. Dönem Türk Beylikleri - II (Aydınoğulları, Saruhan, Menteşe, Dulkadir, Ramazan)",
      26: "Test 26: Türkiye Selçuklularında Devlet Teşkilatı, İdari Yapı ve Denizcilik",
      27: "Test 27: Tasavvuf, Felsefe, Edebiyat ve Alimler (Mevlânâ, Yunus Emre, Hacı Bektaş, Konevi)",
      28: "Test 28: Anadolu Selçuklu ve Beylikler Mimarisi - I (Cami, Medrese, Kümbetler)",
      29: "Test 29: Anadolu Selçuklu ve Beylikler Mimarisi - II (Hanlar, Kervansaraylar, Ahşap Yapılar)",
      30: "Test 30: Türkiye Selçuklu ve Anadolu Beylikleri Genel Tarama ve KPSS Deneme",
      31: "Test 31: Aşiretten Beyliğe, Kayı Boyu ve Osman Gazi Dönemi",
      32: "Test 32: Orhan Gazi Dönemi & Beylikten Devlete Geçiş Teşkilatlanması",
      33: "Test 33: I. Murad (Hüdavendigâr) Dönemi (Sazlıdere, Sırpsındığı, I. Kosova)",
      34: "Test 34: I. Bayezid (Yıldırım) Dönemi (Niğbolu, ATSB, Ankara Savaşı)",
      35: "Test 35: Fetret Devri, Çelebi Mehmet & II. Murad Dönemi (Varna, II. Kosova)",
      36: "Test 36: Fatih Sultan Mehmet - I: İstanbul'un Fethi, Nedenleri ve Sonuçları",
      37: "Test 37: Fatih Sultan Mehmet - II: Fetihler, Teşkilatlanma & Kanunname",
      38: "Test 38: II. Bayezid Dönemi (Cem Sultan Olayı, Şahkulu İsyanı)",
      39: "Test 39: I. Selim (Yavuz) Dönemi: Doğu ve Güney Siyaseti (Çaldıran, Mısır Seferi)",
      40: "Test 40: I. Süleyman (Kanuni) Dönemi ve Yükselme Zirvesi (Preveze, Mohaç, Sokullu)",
      41: "Test 41: Osmanlı Devlet Anlayışı, Hükümdarlık Alametleri & Veraset Değişimleri",
      42: "Test 42: Saray Teşkilatı (Bîrun, Enderun, Harem) ve Saray Görevlileri",
      43: "Test 43: Divan-ı Hümayun ve Seyfiye Sınıfı (Yönetim & Askeriye)",
      44: "Test 44: İlmiye Sınıfı (Din, Adalet, Hukuk ve Eğitim Teşkilatı)",
      45: "Test 45: Kalemiye Sınıfı (Bürokrasi, Diplomasi ve Maliye Teşkilatı)",
      46: "Test 46: Taşra Teşkilatı, Eyalet Türleri ve İdari Birimler",
      47: "Test 47: Ordu Teşkilatı - I: Kapıkulu Ordusu (Piyadeler ve Süvariler)",
      48: "Test 48: Ordu Teşkilatı - II & Donanma: Eyalet Askerleri ve Deniz Teşkilatı",
      49: "Test 49: Toprak Yönetimi, İktisadi Hayat, Maliye, Vergiler ve Lonca",
      50: "Test 50: Hukuk Sistemi, Eğitim, Bilim, Sanat ve Sosyal Hayat",
      51: "Test 51: XVII. Yüzyıl Genel Siyasi Gelişmeler & Duraklamanın İç-Dış Nedenleri",
      52: "Test 52: Osmanlı-İran (Safevi) İlişkileri (Ferhat Paşa, Nasuh Paşa, Serav, Kasr-ı Şirin)",
      53: "Test 53: Osmanlı-Avusturya (Habsburg) İlişkileri (Haçova, Zitvatorok, Vasvar)",
      54: "Test 54: Osmanlı-Lehistan, Venedik & Rusya İlişkileri (Hotin, Bucaş, Girit, Çehrin)",
      55: "Test 55: II. Viyana Kuşatması, Kutsal İttifak Savaşları (1683-1699)",
      56: "Test 56: 1699 Karlofça ve 1700 İstanbul Antlaşmaları ve Önemi",
      57: "Test 57: XVII. Yüzyıl İç İsyanları - I: İstanbul (Yeniçeri / Merkez) İsyanları",
      58: "Test 58: XVII. Yüzyıl İç İsyanları - II: Celali ve Eyalet İsyanları",
      59: "Test 59: XVII. Yüzyıl Islahatları ve Islahatçıları (Genç Osman, IV. Murad, Tarhuncu)",
      60: "Test 60: Köprülüler Dönemi ve XVII. Yüzyıl Genel Tarama & KPSS Deneme",
      61: "Test 61: XVIII. Yüzyıl Başları, Karlofça'yı Telafi Gayretleri, Edirne Olayı ve 1711 Prut Savaşı",
      62: "Test 62: 1715-1718 Osmanlı-Venedik & Avusturya Savaşları ve 1718 Pasarofça Antlaşması",
      63: "Test 63: Lale Devri Islahatları, Kültür, Sanat ve İbrahim Müteferrika",
      64: "Test 64: Patrona Halil İsyanı, I. Mahmud Dönemi, Humbaracı Ahmet Paşa ve Hendesehâne",
      65: "Test 65: 1736-1739 Savaşları, 1739 Belgrad Antlaşması ve 1740 Kapitülasyonları",
      66: "Test 66: 1768-1774 Savaşı, 1770 Çeşme Baskını ve 1774 Küçük Kaynarca Antlaşması",
      67: "Test 67: III. Mustafa ve I. Abdülhamit Islahatları, Esham Sistemi, Baron de Tott",
      68: "Test 68: Kırım'ın Kaybı (Aynalıkavak), 1787-1792 Savaşları, Ziştovi ve Yaş Antlaşmaları",
      69: "Test 69: III. Selim Dönemi ve Nizâm-ı Cedîd Islahatları",
      70: "Test 70: Napolyon'un Mısır İstilası, Akka Zaferi, Kabakçı İsyanı ve XVIII. Yüzyıl Genel Tarama",
      71: "Test 71: II. Mahmud Devri Başları, Sened-i İttifak (1808) ve 1812 Bükreş Antlaşması",
      72: "Test 72: Rum İsyanı, Navarin Baskını (1827) ve 1829 Edirne Antlaşması",
      73: "Test 73: Mısır Meselesi, Kütahya, Hünkâr İskelesi ve Balta Limanı Antlaşması",
      74: "Test 74: Nizip Savaşı, 1840 Londra Antlaşması ve 1841 Londra Boğazlar Sözleşmesi",
      75: "Test 75: II. Mahmud Dönemi Islahatları, Vak'a-i Hayriye ve Teşkilatlanma",
      76: "Test 76: Tanzimat Dönemi Başlangıcı ve 1839 Tanzimat Fermanı",
      77: "Test 77: 1853-1856 Kırım Savaşı, Sinop Baskını, İlk Dış Borç ve Islahat Fermanı",
      78: "Test 78: 1856 Paris Barış Konferansı ve Paris Antlaşması",
      79: "Test 79: Abdülmecid ve Abdülaziz Dönemleri Islahatları, Mecelle ve Kurumlar",
      80: "Test 80: I. Meşrutiyet, Kanun-ı Esasi, 93 Harbi, Berlin Antlaşması ve Genel Tarama",
      81: "Test 81: Reval Görüşmeleri (1908), İttihat ve Terakki ve II. Meşrutiyet'in İlanı",
      82: "Test 82: II. Meşrutiyet Sırasında Yaşanan Toprak Kayıpları (Bulgaristan, Bosna, Girit)",
      83: "Test 83: 31 Mart Vakası (1909), Hareket Ordusu ve II. Abdülhamit'in Tahttan İndirilmesi",
      84: "Test 84: 1909 Kanun-ı Esasi Değişiklikleri, Siyasi Partiler ve Meşrutiyet Dönemi",
      85: "Test 85: Trablusgarp Savaşı (1911-1912) Nedenleri, Gönüllü Subaylar ve Cepheler",
      86: "Test 86: 1912 Uşi Antlaşması, Trablusgarp ve On İki Ada'nın Akıbeti",
      87: "Test 87: I. Balkan Savaşı (1912-1913), İttifak, Kumanova, Lüleburgaz ve Çatalca Savunması",
      88: "Test 88: Bâb-ı Âlî Baskını (1913), Arnavutluk'un Bağımsızlığı ve Londra Antlaşması",
      89: "Test 89: II. Balkan Savaşı, Edirne'nin Kurtarılması, Bükreş, İstanbul ve Atina Antlaşmaları",
      90: "Test 90: Fikir Akımları, Kültür/Medeniyet, Basın, Kadın Hakları ve Genel Tarama",
      91: "Test 91: I. Dünya Savaşı Nedenleri, Bloklaşmalar ve Osmanlı'nın Savaşa Giriş Süreci",
      92: "Test 92: Osmanlı'nın Savaşa Girişinin Etkileri, Cihat İlanı ve Gizli Antlaşmalar",
      93: "Test 93: Kafkas Cephesi, Sarıkamış Harekâtı, 1915 Tehcir Kanunu ve Brest-Litovsk",
      94: "Test 94: Kanal (Süveyş) Cephesi ve 18 Mart 1915 Çanakkale Deniz Zaferi",
      95: "Test 95: Çanakkale Kara Savaşları, Mustafa Kemal'in Rolü ve Savaşın Sonuçları",
      96: "Test 96: Irak Cephesi, Selman-ı Pak ve 1916 Kût'ül-Amâre Zaferi",
      97: "Test 97: Hicaz-Yemen (Medine Müdafaası) ve Suriye-Filistin Cepheleri",
      98: "Test 98: Yardım Cepheleri (Galiçya, Romanya, Makedonya) ve Savaşı Bitiren Gelişmeler",
      99: "Test 99: Mondros Ateşkes Antlaşması (30 Ekim 1918), 7. ve 24. Maddeler ve Önemi",
      100: "Test 100: Mondros Sonrası İlk İşgaller, Mustafa Kemal'in Tepkisi ve Genel Tarama",
      101: "Test 101: Mustafa Kemal'in Samsun'a Çıkışı (19 Mayıs 1919), 9. Ordu Müfettişliği ve Samsun Raporu",
      102: "Test 102: Havza Genelgesi (28 Mayıs 1919), İlk Ulusal Tepki ve Mitingler",
      103: "Test 103: Amasya Genelgesi (22 Haziran 1919), İhtilal Beyannamesi ve Sine-i Millet",
      104: "Test 104: Erzurum Kongresi (23 Temmuz - 7 Ağustos 1919), Temsil Heyeti ve Kararları",
      105: "Test 105: Sivas Kongresi (4-11 Eylül 1919), Cemiyetlerin Birleşmesi ve Ali Galip Olayı",
      106: "Test 106: Amasya Görüşmeleri (20-22 Ekim 1919) ve Temsil Heyeti'nin Ankara'ya Gelişi",
      107: "Test 107: Son Osmanlı Meclis-i Mebusanı ve Misâk-ı Millî Kararları (28 Ocak 1920)",
      108: "Test 108: İstanbul'un Resmen İşgali (16 Mart 1920), Manastırlı Hamdi Bey ve Meclisin Basılması",
      109: "Test 109: I. TBMM'nin Açılışı (23 Nisan 1920), Yapısı, Nitelikleri ve 24 Nisan Önergesi",
      110: "Test 110: İç İsyanlar, Sevr Barış Antlaşması (10 Ağustos 1920) ve Hazırlık Dönemi Genel Tarama",
      111: "Test 111: Doğu Cephesi, Kazım Karabekir ve 1920 Gümrü Barış Antlaşması",
      112: "Test 112: Güney Cephesi, Fransız & Ermeni İşgali, Maraş, Antep ve Urfa Savunmaları",
      113: "Test 113: Kütahya-Eskişehir Muharebeleri, Sakarya'nın Doğusuna Çekiliş ve Maarif Kongresi",
      114: "Test 114: Başkomutanlık Kanunu (5 Ağustos 1921), Tekâlif-i Milliye ve Seferberlik",
      115: "Test 115: Sakarya Meydan Muharebesi (23 Ağustos - 13 Eylül 1921) ve Hatt-ı Müdafaa Doktrini",
      116: "Test 116: Sakarya Zaferi'nin Sonuçları, Kars ve 1921 Ankara Antlaşmaları",
      117: "Test 117: Büyük Taarruz Hazırlıkları, Sad Taarruz Planı ve 26 Ağustos Kocatepe",
      118: "Test 118: Dumlupınar Başkomutanlık Meydan Muharebesi, 9 Eylül İzmir ve Mudanya Mütarekesi",
      119: "Test 119: Saltanatın Kaldırılması (1 Kasım 1922), Vahdettin'in Ayrılışı ve Halifelik",
      120: "Test 120: Lozan Barış Konferansı (24 Temmuz 1923) ve Muharebeler Dönemi Genel Tarama",
      121: "Test 121: Atatürk İlkeleri (6 Temel İlke) ve Bütünleyici İlkeler",
      122: "Test 122: Siyasi Alanda İnkılaplar, Ankara'nın Başkent Oluşu ve 3 Mart 1924 Kanunları",
      123: "Test 123: Hukuk Alanında İnkılaplar, Türk Medeni Kanunu (1926) ve Kadın Hakları",
      124: "Test 124: Eğitim ve Kültür İnkılapları, Harf Devrimi, TTK, TDK ve Üniversite Reformu",
      125: "Test 125: Toplumsal Alanda İnkılaplar, Şapka, Tekke-Zaviye, Ölçüler ve Soyadı Kanunu",
      126: "Test 126: Ekonomi Alanında İnkılaplar, İzmir İktisat Kongresi, Aşar, KİT'ler ve Sanayi Planları",
      127: "Test 127: Denizcilik (Kabotaj), Sağlık, Tarım, Sosyal Hizmetler ve Kurumlar",
      128: "Test 128: Çok Partili Hayat Denemeleri, TCF, Şeyh Sait, SCF, Menemen ve Rejim Olayları",
      129: "Test 129: İzmir Suikastı (1926), İstiklal Mahkemeleri'nin Sonu ve Rejime Tehditler",
      130: "Test 130: Nutuk, Atatürk'ün Eserleri, Vasiyeti, Atatürkçü Düşünce Sistemi ve Genel Tarama",
      131: "Test 131: Atatürk Dönemi Dış Politika İlkeleri, Yabancı Okullar, Dış Borçlar ve Ahali Mübadelesi",
      132: "Test 132: Musul Sorunu, Haliç Konferansı, Brüksel Hattı ve 1926 Ankara Antlaşması",
      133: "Test 133: Milletler Cemiyeti'ne Giriş (1932) ve Balkan Antantı (1934)",
      134: "Test 134: Montrö Boğazlar Sözleşmesi (1936) ve Türk Boğazlar Rejimi",
      135: "Test 135: Sadabat Paktı (8 Temmuz 1937), Ortadoğu Güvenliği ve Doğu Sınırları",
      136: "Test 136: Hatay Sorunu, Hatay Cumhuriyeti ve Hatay'ın Anavatana Katılışı (1936-1939)",
      137: "Test 137: II. Dünya Savaşı (1939-1945), Türkiye'nin Denge Politikası ve Savaş Ekonomisi",
      138: "Test 138: Soğuk Savaş Dönemi, NATO Üyeliği, Kore Savaşı ve Çok Partili Hayata Geçiş",
      139: "Test 139: Kıbrıs Sorunu, EOKA, Kanlı Noel, 1974 Barış Harekâtı, KKTC ve ASALA",
      140: "Test 140: SSCB'nin Dağılması, Türk Cumhuriyetleri, Bosna, Karabağ ve Master Genel Tarama",
    };
    return titles[testNum] ?? "Tarih Test $testNum";
  }

  static String _getTurkceTestTitle(int testNum) {
    const Map<int, String> titles = {
      1: "Test 1: Gerçek (Temel), Yan ve Mecaz Anlam",
      2: "Test 2: Terim Anlam, Somutlaştırma, Soyutlaştırma ve Duyu Aktarımı",
      3: "Test 3: Anlam İlişkileri (Eş Anlam, Yakın Anlam, Zıt Anlam, Sesteşlik)",
      4: "Test 4: Sözcük Öbeklerinde Anlam ve Cümleye Kattığı Anlam",
      5: "Test 5: Deyimler, Anlamları ve Deyim Yanlışlıkları",
      6: "Test 6: Atasözleri, Anlam İlişkileri ve Çelişen Atasözleri",
      7: "Test 7: İkilemeler, Yansıma Sözcükler ve Oluşum Biçimleri",
      8: "Test 8: Dolaylama, Güzel Adlandırma ve Ad Aktarması (Mecazımürsel)",
      9: "Test 9: Söz Sanatları (Teşbih, İstiare, Teşhis, İntak, Tezat, Kinaye, Tariz)",
      10: "Test 10: Sözcükte Anlam Master Genel Tarama ve KPSS Deneme",
      11: "Test 11: Öznel ve Nesnel Anlatımlı Cümleler (Kanıtlanabilirlik)",
      12: "Test 12: Neden-Sonuç (Gerekçeli Yargı) ve Amaç-Sonuç Cümleleri",
      13: "Test 13: Koşul (Şart)-Sonuç ve Karşılaştırma Cümleleri",
      14: "Test 14: Örtülü Anlam, Doğrudan/Dolaylı Anlatım, Üslup ve İçerik",
      15: "Test 15: Cümlenin Anlam Özellikleri - I (Tanım, Varsayım, Olasılık, Tahmin)",
      16: "Test 16: Cümlenin Anlam Özellikleri - II (Eleştiri, Ön Yargı, Aşamalı Durum)",
      17: "Test 17: Cümlede Anlam İlişkileri ve Duygusal Tonlar (Sitem, Yakınma, Pişmanlık)",
      18: "Test 18: Anlatım İlkeleri ve Biçem (Açıklık, Duruluk, Yalınlık, Akıcılık)",
      19: "Test 19: Cümle Tamamlama, Cümle Oluşturma ve Kesin Yargı Çıkarma",
      20: "Test 20: Cümlede Anlam Master Genel Tarama ve KPSS Deneme",
      21: "Test 21: Paragrafta Konu ve Başlık Belirleme",
      22: "Test 22: Paragrafta Ana Düşünce (Ana Fikir) ve Temel İleti",
      23: "Test 23: Paragrafta Yardımcı Düşünceler (Değinilmemiştir / Çıkarılamaz)",
      24: "Test 24: Paragrafta Soruya Karşılık Olma ve Diyalog Tamamlama",
      25: "Test 25: Şiirde Tema, Ana Duygu ve Edebi Düşünce",
      26: "Test 26: Paragrafta Vurgulanan Temel Düşünce ve Çıkarımlar",
      27: "Test 27: Yazarın Bakış Açısı, Tutumu ve Anlatıcı Türleri",
      28: "Test 28: Karakter Özellikleri, Ruhsal Durum ve Kişilik Tahlili",
      29: "Test 29: Yazarın Yakındığı Durum ve Karşı Çıkılan Düşünceler",
      30: "Test 30: Paragrafta Anlam Master Genel Tarama ve KPSS Deneme",
      31: "Test 31: Paragrafı İkiye Bölme ve Akışı Bozan Cümle",
      32: "Test 32: Cümle Yerleştirme ve Paragraf Tamamlama",
      33: "Test 33: Cümlelerin Yerini Değiştirme ve Sıralama",
      34: "Test 34: Anlatım Biçimleri (Açıklama, Tartışma, Öyküleme, Betimleme)",
      35: "Test 35: Düşünceyi Geliştirme Yolları (Tanım, Karşılaştırma, Örnekleme, Tanık Gösterme)",
      36: "Test 36: Duyular, Anlatıcı Türleri ve Anlatım Nitelikleri",
      37: "Test 37: Çoklu / Bağlantılı Paragraf Soruları - I",
      38: "Test 38: Çoklu / Bağlantılı Paragraf Soruları - II",
      39: "Test 39: Paragrafta Mantık, Argümantasyon ve Muhakeme",
      40: "Test 40: Paragrafta Yapı ve Anlatım Master Genel Tarama ve KPSS Deneme",
      41: "Test 41: Ünlü Düşmesi (Hece Düşmesi) ve Aşınma",
      42: "Test 42: Ünlü Daralması ve İstisnaları",
      43: "Test 43: Ünlü Türemesi ve Pekiştirmelerde Ses Olayları",
      44: "Test 44: Ünsüz Benzeşmesi (Sertleşmesi) ve Kuralları",
      45: "Test 45: Ünsüz Yumuşaması (Değişimi) ve Yumuşamaya Aykırılık",
      46: "Test 46: Ünsüz Düşmesi ve Ünsüz Türemesi (İkizleşme)",
      47: "Test 47: Dudak Ünsüzlerinin Benzeşmesi (n-b Değişimi) ve Ulama",
      48: "Test 48: Kaynaştırma Ünsüzleri ve Ses Uyumu Kuralları",
      49: "Test 49: Karışık Ses Olayları ve Metin Taramaları",
      50: "Test 50: Ses Bilgisi Master Genel Tarama ve KPSS Deneme",
      51: "Test 51: Büyük Harflerin Kullanımı - I (Kişi, Unvan, Akrabalık, Hayvan)",
      52: "Test 52: Büyük Harflerin Kullanımı - II (Yer, Coğrafya, Kurum, Kuruluş, Yapı)",
      53: "Test 53: de / da Bağlacı ve Bulunma Durum Ekinin Yazımı",
      54: "Test 54: ki Bağlacı, Sıfat Yapan ve İlgi Zamiri -ki'nin Yazımı",
      55: "Test 55: Sayıların, Saatlerin, Tarihlerin ve mi Soru Ekinin Yazımı",
      56: "Test 56: Kısaltmalar ve Kısaltmalara Gelen Eklerin Yazımı",
      57: "Test 57: Bitişik Yazılan Birleşik Sözcükler ve Ses Olaylı Birleşikler",
      58: "Test 58: Ayrı Yazılan Birleşik Sözcükler ve Özel Kalıplar",
      59: "Test 59: İkilemeler, Pekiştirmeler ve Deyimlerin Yazımı",
      60: "Test 60: Yazım Kuralları Master Genel Tarama ve KPSS Deneme",
      61: "Test 61: Nokta, İki Nokta ve Üç Noktanın Kullanımı",
      62: "Test 62: Virgülün Kullanıldığı Yerler ve Görevleri",
      63: "Test 63: Virgülün Kesinlikle Kullanılmadığı Yerler ve İstisnaları",
      64: "Test 64: Noktalı Virgül ve İki Nokta Ayrımı",
      65: "Test 65: Soru İşareti, Ünlem İşareti ve Kısa Çizgi",
      66: "Test 66: Tırnak İşareti, Tek Tırnak ve Yay Ayraç (Parantez)",
      67: "Test 67: Kesme İşareti ve Kesmeyle Ayrılmayan Ekler",
      68: "Test 68: Metin İçi Boşluk Doldurmalı Noktalama Soruları",
      69: "Test 69: Karma Noktalama Yanlışlıkları ve Tuzak Sorular",
      70: "Test 70: Noktalama İşaretleri Master Genel Tarama ve KPSS Deneme",
      71: "Test 71: Kök Bilgisi (İsim, Fiil, Sesteş ve Ortak Kökler)",
      72: "Test 72: İsimden İsim ve İsimden Fiil Yapım Ekleri",
      73: "Test 73: Fiilden İsim ve Fiilden Fiil Yapım Ekleri",
      74: "Test 74: İsim Çekim Ekleri (Çoğul, Hâl, İyelik ve İlgi Eki)",
      75: "Test 75: Fiil Çekim Ekleri (Kip, Kişi ve Ek Eylem)",
      76: "Test 76: İyelik Eki ile Belirtme Hâl Ekinin Ayrımı (-ı, -i)",
      77: "Test 77: Gövde Kavramı ve Gövdeden Türemiş Sözcükler",
      78: "Test 78: Sözcüğün Yapısı (Basit, Türemiş ve Birleşik Sözcükler)",
      79: "Test 79: Eklerin İşlevleri ve Sözcüğün Yapısal Çözümlemesi",
      80: "Test 80: Sözcükte Yapı Master Genel Tarama ve KPSS Deneme",
      81: "Test 81: İsimler (Adlar) ve İsim Tamlamaları",
      82: "Test 82: Sıfatlar (Ön Adlar) ve Sıfat Tamlamaları",
      83: "Test 83: Zamirler (Adıllar) ve Ek Hâlindeki Zamirler",
      84: "Test 84: Zarflar (Belirteçler) ve Çeşitleri",
      85: "Test 85: Edatlar (İlgeçler) ve Cümleye Kattığı Anlamlar",
      86: "Test 86: Bağlaçlar, Ünlemler ve Ek Eylem",
      87: "Test 87: Eylemsiler (Fiilimsiler) ve Kalıcı İsimler",
      88: "Test 88: Eylemde Çatı - I (Öznesine Göre Eylemler)",
      89: "Test 89: Eylemde Çatı - II (Nesnesine Göre Eylemler)",
      90: "Test 90: Sözcük Türleri ve Eylemler Master Genel Tarama",
      91: "Test 91: Cümlenin Temel ve Yardımcı Ögeleri",
      92: "Test 92: Cümlede Vurgu, Ara Söz ve Öge Bulma Tuzakları",
      93: "Test 93: Cümle Türleri - I (Yüklemin Türüne ve Yerine Göre)",
      94: "Test 94: Cümle Türleri - II (Yapısına Göre Cümleler)",
      95: "Test 95: Anlatım Bozuklukları - I (Anlama Dayalı Bozukluklar)",
      96: "Test 96: Anlatım Bozuklukları - II (Mantık, Çelişki ve Deyim Yanlışları)",
      97: "Test 97: Anlatım Bozuklukları - III (Dil Bilgisine Dayalı Bozukluklar)",
      98: "Test 98: Anlatım Bozuklukları - IV (Öge, Ek ve Yüklem Uyumsuzlukları)",
      99: "Test 99: KPSS Sözel Mantık ve Muhakeme Soruları",
      100: "Test 100: KPSS Türkçe Master Genel Deneme ve Büyük Final",

      // 11. Konu: PİSA / Yeni Nesil - Metin ve Argümantasyon Analizi (Test 101-118)
      101: "Test 101: PİSA / Yeni Nesil - Çoklu Metin ve Argümantasyon Analizi I (Karşıt Görüşler)",
      102: "Test 102: PİSA / Yeni Nesil - Çoklu Metin ve Argümantasyon Analizi II (Ortak ve Ayrışan Yönler)",
      103: "Test 103: PİSA / Yeni Nesil - Bilişsel Öncül ve Örtük Varsayım Çıkarımı",
      104: "Test 104: PİSA / Yeni Nesil - Mantıksal Tutarlılık ve Safsata (Fallacy) Tespiti",
      105: "Test 105: PİSA / Yeni Nesil - Disiplinlerarası Metinler: Nörobilim ve Bilişsel Psikoloji",
      106: "Test 106: PİSA / Yeni Nesil - Disiplinlerarası Metinler: Yapay Zekâ ve Dijital Kültür",
      107: "Test 107: PİSA / Yeni Nesil - Disiplinlerarası Metinler: Ekoloji ve Çevre Etiği",
      108: "Test 108: PİSA / Yeni Nesil - Disiplinlerarası Metinler: Sosyoloji, Mimarlık ve Kent Yaşamı",
      109: "Test 109: PİSA / Yeni Nesil - Durum - İlke Eşleştirme ve Pragmatik Transfer I",
      110: "Test 110: PİSA / Yeni Nesil - Durum - İlke Eşleştirme ve Pragmatik Transfer II",
      111: "Test 111: PİSA / Yeni Nesil - Bilimsel Hipotez ve Deney Doğrulama Paragrafları",
      112: "Test 112: PİSA / Yeni Nesil - Karmaşık Diyalog ve Mülakat Analizi",
      113: "Test 113: PİSA / Yeni Nesil - Karşılaştırmalı Düşünce ve Eleştirel Okuma I",
      114: "Test 114: PİSA / Yeni Nesil - Karşılaştırmalı Düşünce ve Eleştirel Okuma II",
      115: "Test 115: PİSA / Yeni Nesil - Kavram Yoğun Paragraflar ve Sentaks Çözümleme",
      116: "Test 116: PİSA / Yeni Nesil - Üst Düzey Çıkarım ve Yazar Tutumu Analizi",
      117: "Test 117: PİSA / Yeni Nesil - Paragraf Analizi Karma PİSA Simülasyonu I",
      118: "Test 118: PİSA / Yeni Nesil - Paragraf Analizi Karma PİSA Simülasyonu II",
    };
    return titles[testNum] ?? "Türkçe Test $testNum";
  }

  List<Question> getQuestionsForTest(String courseId, int testNum) {
    final questions = getQuestionsForCourse(courseId);
    return questions.where((q) => q.testNum == testNum).toList()
      ..sort((a, b) => a.qNum.compareTo(b.qNum));
  }

  List<Question> getRandomPracticeQuestions({int count = 15, String? courseId}) {
    List<Question> pool = [];
    if (courseId == null) {
      pool = [
        ..._tarihQuestions,
        ..._turkceQuestions,
        ..._matematikQuestions,
        ..._cografyaQuestions,
        ..._vatandaslikQuestions,
        ..._mantikQuestions,
        ..._sayisalMantikQuestions,
      ];
    } else {
      pool = getQuestionsForCourse(courseId);
    }
    pool.shuffle();
    return pool.take(count).toList();
  }

  // Bookmarks & Wrong Questions Storage
  static const String _wrongQuestionsKey = 'kpss_wrong_questions_v1';
  static const String _bookmarkedQuestionsKey = 'kpss_bookmarks_v1';

  Future<void> recordAnswer({
    required Question question,
    required bool isCorrect,
    required int selectedIndex,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // Update wrong questions list
    List<String> wrongIds = prefs.getStringList(_wrongQuestionsKey) ?? [];
    if (!isCorrect) {
      if (!wrongIds.contains(question.id)) {
        wrongIds.add(question.id);
        await prefs.setStringList(_wrongQuestionsKey, wrongIds);
      }
    } else {
      // If solved correctly now, remove from wrong list
      if (wrongIds.contains(question.id)) {
        wrongIds.remove(question.id);
        await prefs.setStringList(_wrongQuestionsKey, wrongIds);
      }
    }

    // Update stats counters
    int totalSolved = prefs.getInt('stat_total_solved') ?? 0;
    int totalCorrect = prefs.getInt('stat_total_correct') ?? 0;
    int totalWrong = prefs.getInt('stat_total_wrong') ?? 0;

    await prefs.setInt('stat_total_solved', totalSolved + 1);
    if (isCorrect) {
      await prefs.setInt('stat_total_correct', totalCorrect + 1);
    } else {
      await prefs.setInt('stat_total_wrong', totalWrong + 1);
    }

    // Update course-specific stats
    final cId = question.courseId;
    final cSolved = prefs.getInt('stat_${cId}_solved') ?? 0;
    await prefs.setInt('stat_${cId}_solved', cSolved + 1);
    if (isCorrect) {
      final cCorrect = prefs.getInt('stat_${cId}_correct') ?? 0;
      await prefs.setInt('stat_${cId}_correct', cCorrect + 1);
    } else {
      final cWrong = prefs.getInt('stat_${cId}_wrong') ?? 0;
      await prefs.setInt('stat_${cId}_wrong', cWrong + 1);
    }

    // Update streak
    await _checkAndUpdateStreak(prefs);

    // Track study time habits
    final hour = DateTime.now().hour;
    if (hour >= 22 || hour < 4) {
      await prefs.setInt('stat_night_solved', (prefs.getInt('stat_night_solved') ?? 0) + 1);
    } else if (hour >= 6 && hour < 9) {
      await prefs.setInt('stat_morning_solved', (prefs.getInt('stat_morning_solved') ?? 0) + 1);
    }
  }

  Future<void> _checkAndUpdateStreak(SharedPreferences prefs) async {
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final lastDateStr = prefs.getString('streak_last_date');
    int streak = prefs.getInt('streak_count') ?? 0;

    if (lastDateStr == null) {
      streak = 1;
      await prefs.setString('streak_last_date', todayStr);
      await prefs.setInt('streak_count', streak);
    } else if (lastDateStr != todayStr) {
      final lastDate = DateTime.tryParse(lastDateStr);
      if (lastDate != null) {
        final diff = DateTime(now.year, now.month, now.day).difference(DateTime(lastDate.year, lastDate.month, lastDate.day)).inDays;
        if (diff == 1) {
          streak += 1;
        } else if (diff > 1) {
          streak = 1;
        }
      } else {
        streak = 1;
      }
      await prefs.setString('streak_last_date', todayStr);
      await prefs.setInt('streak_count', streak);
    }
  }

  Future<Map<String, dynamic>> getStreakData() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final lastDateStr = prefs.getString('streak_last_date');
    int streak = prefs.getInt('streak_count') ?? 0;

    if (lastDateStr != null && lastDateStr != todayStr) {
      final lastDate = DateTime.tryParse(lastDateStr);
      if (lastDate != null) {
        final diff = DateTime(now.year, now.month, now.day).difference(DateTime(lastDate.year, lastDate.month, lastDate.day)).inDays;
        if (diff > 1) {
          streak = 0; // Broken streak
          await prefs.setInt('streak_count', 0);
        }
      }
    }

    return {
      'streak': streak,
      'isTodaySolved': lastDateStr == todayStr,
      'lastDate': lastDateStr ?? '',
    };
  }

  Question getDailyQuestion() {
    final now = DateTime.now();
    final daySeed = now.year * 10000 + now.month * 100 + now.day;
    final all = [
      ..._tarihQuestions,
      ..._turkceQuestions,
      ..._cografyaQuestions,
      ..._vatandaslikQuestions,
      ..._matematikQuestions,
      ..._mantikQuestions,
    ];
    if (all.isEmpty) {
      if (_tarihQuestions.isNotEmpty) return _tarihQuestions.first;
      throw StateError('Soru bankası henüz yüklenmedi.');
    }
    final index = daySeed % all.length;
    return all[index];
  }

  Future<bool> isDailyQuestionSolvedToday() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    return prefs.getString('daily_question_solved_date') == todayStr;
  }

  Future<void> markDailyQuestionSolvedToday() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    await prefs.setString('daily_question_solved_date', todayStr);
    await _checkAndUpdateStreak(prefs);
  }

  Future<List<Question>> getWrongQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> wrongIds = prefs.getStringList(_wrongQuestionsKey) ?? [];
    if (wrongIds.isEmpty) return [];

    final all = [
      ..._tarihQuestions,
      ..._turkceQuestions,
      ..._matematikQuestions,
      ..._cografyaQuestions,
      ..._vatandaslikQuestions,
      ..._mantikQuestions,
      ..._sayisalMantikQuestions,
    ];
    final wrongSet = wrongIds.toSet();
    return all.where((q) => wrongSet.contains(q.id)).toList();
  }

  Future<bool> isBookmarked(String questionId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarks = prefs.getStringList(_bookmarkedQuestionsKey) ?? [];
    return bookmarks.contains(questionId);
  }

  Future<void> toggleBookmark(String questionId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList(_bookmarkedQuestionsKey) ?? [];
    if (bookmarks.contains(questionId)) {
      bookmarks.remove(questionId);
    } else {
      bookmarks.add(questionId);
    }
    await prefs.setStringList(_bookmarkedQuestionsKey, bookmarks);
  }

  Future<List<Question>> getBookmarkedQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> bookmarks = prefs.getStringList(_bookmarkedQuestionsKey) ?? [];
    if (bookmarks.isEmpty) return [];

    final all = [
      ..._tarihQuestions,
      ..._turkceQuestions,
      ..._matematikQuestions,
      ..._cografyaQuestions,
      ..._vatandaslikQuestions,
      ..._mantikQuestions,
      ..._sayisalMantikQuestions,
    ];
    final bSet = bookmarks.toSet();
    return all.where((q) => bSet.contains(q.id)).toList();
  }

  Future<Map<String, int>> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'solved': prefs.getInt('stat_total_solved') ?? 0,
      'correct': prefs.getInt('stat_total_correct') ?? 0,
      'wrong': prefs.getInt('stat_total_wrong') ?? 0,
      'wrongPool': (prefs.getStringList(_wrongQuestionsKey) ?? []).length,
      'bookmarks': (prefs.getStringList(_bookmarkedQuestionsKey) ?? []).length,
    };
  }

  Future<Map<String, Map<String, int>>> getCourseStats() async {
    final prefs = await SharedPreferences.getInstance();
    final courses = ['tarih', 'turkce', 'cografya', 'vatandaslik', 'matematik', 'mantik'];
    final Map<String, Map<String, int>> result = {};

    for (final c in courses) {
      result[c] = {
        'solved': prefs.getInt('stat_${c}_solved') ?? 0,
        'correct': prefs.getInt('stat_${c}_correct') ?? 0,
        'wrong': prefs.getInt('stat_${c}_wrong') ?? 0,
      };
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getTopWeakTopics({int limit = 4}) async {
    final wrongQuestions = await getWrongQuestions();
    if (wrongQuestions.isEmpty) return [];

    final Map<String, int> topicCounts = {};
    final Map<String, String> topicCourseMap = {};

    for (final q in wrongQuestions) {
      final title = q.subtopicTitle.trim().isNotEmpty ? q.subtopicTitle.trim() : q.chapterId;
      topicCounts[title] = (topicCounts[title] ?? 0) + 1;
      topicCourseMap[title] = q.courseId;
    }

    final sortedEntries = topicCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.take(limit).map((e) => {
      'topic': e.key,
      'wrongCount': e.value,
      'courseId': topicCourseMap[e.key] ?? 'tarih',
    }).toList();
  }

  Future<void> clearWrongQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_wrongQuestionsKey);
  }

  Future<void> recordLastStudied({
    required String courseId,
    required String courseTitle,
    required int testNum,
    required String subtopicTitle,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_studied_course_id', courseId);
    await prefs.setString('last_studied_course_title', courseTitle);
    await prefs.setInt('last_studied_test_num', testNum);
    await prefs.setString('last_studied_subtopic', subtopicTitle);
  }

  Future<Map<String, dynamic>> getLastStudied() async {
    final prefs = await SharedPreferences.getInstance();
    final courseId = prefs.getString('last_studied_course_id') ?? 'tarih';
    final courseTitle = prefs.getString('last_studied_course_title') ?? 'Tarih Soru Bankası';
    final testNum = prefs.getInt('last_studied_test_num') ?? 1;
    final subtopic = prefs.getString('last_studied_subtopic') ?? 'İslamiyet Öncesi Türk Tarihi';

    return {
      'courseId': courseId,
      'courseTitle': courseTitle,
      'testNum': testNum,
      'subtopicTitle': subtopic,
    };
  }

  Future<void> clearAllStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('stat_total_solved');
    await prefs.remove('stat_total_correct');
    await prefs.remove('stat_total_wrong');
    await prefs.remove(_wrongQuestionsKey);
    await prefs.remove(_bookmarkedQuestionsKey);
    await prefs.remove('streak_count');
    await prefs.remove('streak_last_date');
    await prefs.remove('daily_question_solved_date');
    await prefs.remove('last_studied_course_id');
    await prefs.remove('last_studied_course_title');
    await prefs.remove('last_studied_test_num');
    await prefs.remove('last_studied_subtopic');

    for (final c in ['tarih', 'turkce', 'cografya', 'vatandaslik', 'matematik', 'mantik']) {
      await prefs.remove('stat_${c}_solved');
      await prefs.remove('stat_${c}_correct');
      await prefs.remove('stat_${c}_wrong');
    }
  }

  List<Question> getAllQuestions() {
    return [
      ..._tarihQuestions,
      ..._turkceQuestions,
      ..._matematikQuestions,
      ..._cografyaQuestions,
      ..._vatandaslikQuestions,
      ..._mantikQuestions,
      ..._sayisalMantikQuestions,
    ];
  }

  List<Question> searchQuestions(String query, {String? courseId, int limit = 60}) {
    final cleanQuery = query.trim().toLowerCase();
    if (cleanQuery.isEmpty) return [];

    final List<Question> source = (courseId != null && courseId != 'all')
        ? getQuestionsForCourse(courseId)
        : getAllQuestions();

    final List<Question> results = [];
    for (final q in source) {
      if (q.question.toLowerCase().contains(cleanQuery) ||
          q.solution.toLowerCase().contains(cleanQuery) ||
          q.options.any((opt) => opt.toLowerCase().contains(cleanQuery))) {
        results.add(q);
        if (results.length >= limit) break;
      }
    }
    return results;
  }
}

