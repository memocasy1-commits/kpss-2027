import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/study_plan_model.dart';
import 'notification_service.dart';

class StudyPlanService {
  static final StudyPlanService instance = StudyPlanService._internal();
  StudyPlanService._internal();

  static const String _storageKey = 'kpss_active_study_plan_v2';
  StudyPlan? _currentPlan;
  bool _isLoaded = false;

  final ValueNotifier<StudyPlan?> planNotifier = ValueNotifier<StudyPlan?>(null);

  bool get isLoaded => _isLoaded;
  bool get hasActivePlan => _currentPlan != null;
  StudyPlan? get currentPlan => _currentPlan;

  Future<void> init() async {
    if (_isLoaded) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_storageKey);
      if (raw != null && raw.isNotEmpty) {
        final decoded = json.decode(raw) as Map<String, dynamic>;
        _currentPlan = StudyPlan.fromJson(decoded);
        planNotifier.value = _currentPlan;
      }
    } catch (e) {
      debugPrint('Error loading StudyPlan: $e');
      _currentPlan = null;
    }
    _isLoaded = true;
  }

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (_currentPlan != null) {
        await prefs.setString(_storageKey, json.encode(_currentPlan!.toJson()));
      } else {
        await prefs.remove(_storageKey);
      }
      planNotifier.value = _currentPlan;
    } catch (e) {
      debugPrint('Error saving StudyPlan: $e');
    }
  }

  /// Akademik literatüre (Zimmerman SRL, Cepeda Spacing, Rohrer Interleaving) dayalı
  /// optimal ve adaptif çalışma planı oluşturur.
  Future<StudyPlan> generatePlan(StudyPlanGoal goal) async {
    final now = DateTime.now();
    final int totalDays = goal.totalDays.clamp(14, 365);
    final int phase1Days = (totalDays * 0.50).round().clamp(7, totalDays);
    final int phase2Days = (totalDays * 0.30).round().clamp(4, totalDays - phase1Days);
    // Kalan günler Faz 3

    final List<StudyDay> days = [];

    // Müfredat Veri Katalogları
    final verbalLectures = [
      {'title': 'Tarih Modül 1: İslamiyet Öncesi Türk Tarihi', 'sub': 'Siyasi Tarih, Hükümdarlar ve Teşkilat', 'key': 'tarih_m1'},
      {'title': 'Türkçe Modül 1: Sözcükte ve Cümlede Anlam', 'sub': 'Bağlam, Deyim/Atasözü ve Çıkarım', 'key': 'turkce_m1'},
      {'title': 'Coğrafya Modül 1: Türkiye\'nin Coğrafi Konumu', 'sub': 'Matematik & Özel Konum, Saat Dilimleri', 'key': 'cografya_m1'},
      {'title': 'Tarih Modül 2: İlk Türk-İslam Devletleri', 'sub': 'Karahanlılar, Gazneliler, Selçuklular', 'key': 'tarih_m2'},
      {'title': 'Vatandaşlık Modül 1: Temel Hukuk Kavramları', 'sub': 'Hukukun Dalları, Haklar ve Ehliyet', 'key': 'vatandaslik_m1'},
      {'title': 'Türkçe Modül 2: Paragrafta Ana & Yardımcı Düşünce', 'sub': 'Hızlı Okuma ve Çeldirici Eleme', 'key': 'turkce_m2'},
      {'title': 'Tarih Modül 3: Osmanlı Kuruluş ve Yükselme', 'sub': 'Padişahlar, Fetihler ve Devlet Teşkilatı', 'key': 'tarih_m3'},
      {'title': 'Coğrafya Modül 2: Türkiye\'nin Yer Şekilleri', 'sub': 'Dağlar, Platolar, Ovalar ve Jeomorfoloji', 'key': 'cografya_m2'},
      {'title': 'Vatandaşlık Modül 2: Devlet Biçimleri ve Anayasa', 'sub': 'Kuvvetler Ayrılığı ve Anayasa Tarihi', 'key': 'vatandaslik_m2'},
      {'title': 'Tarih Modül 4: Osmanlı Kültür ve Medeniyeti', 'sub': 'Divan-ı Hümayun, Tımar ve İlmiye', 'key': 'tarih_m4'},
      {'title': 'Türkçe Modül 3: Ses Bilgisi ve Yazım Kuralları', 'sub': 'TDK 2026/2027 İmla Standartları', 'key': 'turkce_m3'},
      {'title': 'Coğrafya Modül 3: Türkiye\'nin İklimi ve Bitki Örtüsü', 'sub': 'Basınç Merkezleri, Yağış ve Topraklar', 'key': 'cografya_m3'},
      {'title': 'Tarih Modül 5: 20. Yüzyıl Başlarında Osmanlı', 'sub': 'Trablusgarp, Balkan ve 1. Dünya Savaşı', 'key': 'tarih_m5'},
      {'title': 'Vatandaşlık Modül 3: 1982 Anayasası Temel Esaslar', 'sub': 'Cumhuriyetin Nitelikleri ve Değiştirilemez Maddeler', 'key': 'vatandaslik_m3'},
      {'title': 'Tarih Modül 6: Milli Mücadele Hazırlık Dönemi', 'sub': 'Kongreler, Genelgeler ve Misak-ı Milli', 'key': 'tarih_m6'},
      {'title': 'Coğrafya Modül 4: Nüfus, Yerleşme ve Göç', 'sub': 'Demografik Yapı ve Şehirleşme', 'key': 'cografya_m4'},
      {'title': 'Tarih Modül 7: Muharebeler ve Lozan Barış Antlaşması', 'sub': 'Doğu, Güney, Batı Cepheleri ve Antlaşmalar', 'key': 'tarih_m7'},
      {'title': 'Vatandaşlık Modül 4: Temel Hak ve Hürriyetler', 'sub': 'Kişi, Sosyal ve Siyasi Haklar', 'key': 'vatandaslik_m4'},
      {'title': 'Tarih Modül 8: Atatürk İlke ve İnkılapları', 'sub': 'Siyasi, Hukuki ve Sosyal Devrimler', 'key': 'tarih_m8'},
      {'title': 'Coğrafya Modül 5: Tarım, Hayvancılık ve Ormancılık', 'sub': 'Ürün Dağılımı ve GAP/DAP Projeleri', 'key': 'cografya_m5'},
      {'title': 'Tarih Modül 9: Çağdaş Türk ve Dünya Tarihi', 'sub': 'Soğuk Savaş, Yumuşama ve Küreselleşme', 'key': 'tarih_m9'},
      {'title': 'Vatandaşlık Modül 5: Yasama (TBMM)', 'sub': 'Milletvekilliği, Kanun Yapımı ve Denetim', 'key': 'vatandaslik_m5'},
    ];

    int missionCounter = 1;

    for (int dayIdx = 1; dayIdx <= totalDays; dayIdx++) {
      final date = now.add(Duration(days: dayIdx - 1));
      int phase = 1;
      if (dayIdx > phase1Days + phase2Days) {
        phase = 3;
      } else if (dayIdx > phase1Days) {
        phase = 2;
      }

      final List<DailyMissionItem> dayMissions = [];

      if (phase == 1) {
        // --- FAZ 1: KAVRAMSAL İNŞA & TEMEL (%50 Süre) ---
        // Kural: Çaprazlama (Interleaving) -> 1 Sözel Modül + 1 Soru Testi + 1 Math Lab Temel Konusu
        final lecture = verbalLectures[(dayIdx - 1) % verbalLectures.length];
        dayMissions.add(DailyMissionItem(
          id: 'm_${missionCounter++}',
          dayNumber: dayIdx,
          title: lecture['title']!,
          subtitle: lecture['sub']!,
          type: MissionType.lecture,
          targetKey: lecture['key']!,
          estimatedMinutes: 30,
        ));

        // İlgili dersten 20-30 soru çözümü
        final courseCode = lecture['key']!.split('_').first;
        dayMissions.add(DailyMissionItem(
          id: 'm_${missionCounter++}',
          dayNumber: dayIdx,
          title: '${courseCode.toUpperCase()} Soru Çözümü (Test ${(dayIdx % 10) + 1})',
          subtitle: 'Kavram pekiştirme ve aktif hatırlama (20 Soru)',
          type: MissionType.test,
          targetKey: courseCode,
          estimatedMinutes: 25,
        ));

        // Math Lab Temel Konuları (1 - 7)
        final mathTopic = ((dayIdx - 1) % 7) + 1;
        dayMissions.add(DailyMissionItem(
          id: 'm_${missionCounter++}',
          dayNumber: dayIdx,
          title: 'Matematik Atölyesi: Konu $mathTopic Simülatörü',
          subtitle: 'Sokratik çözücü ve ÖSYM tuzak avcısı',
          type: MissionType.mathLab,
          targetKey: mathTopic.toString(),
          estimatedMinutes: 25,
        ));

        // Zaman kısıtına göre ek Leitner hafıza tekrarı
        if (goal.dailyHours >= 4.0 || dayIdx % 3 == 0) {
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: 'Leitner Spaced Repetition Tekrarı',
            subtitle: 'Önceki günlerde yanlış yapılan soruları erit',
            type: MissionType.spacedRepetition,
            targetKey: 'leitner_box',
            estimatedMinutes: 20,
          ));
        }

        // 6+ saat çalışanlara Pomodoro odak bloğu
        if (goal.dailyHours >= 6.0) {
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: '2 Blok Pomodoro Derinleşme Seansı',
            subtitle: 'Zayıf hissettiğin alanda 50 dk kesintisiz çalışma',
            type: MissionType.pomodoro,
            targetKey: 'pomodoro',
            estimatedMinutes: 50,
          ));
        }
      } else if (phase == 2) {
        // --- FAZ 2: ENTEGRASYON & SORU FIRTINASI (%30 Süre) ---
        // Kural: Yoğun Soru Çözümü + Math Lab Problemleri (8 - 14) + Sayısal/Sözel Mantık
        final courseCycle = ['matematik', 'tarih', 'turkce', 'cografya', 'vatandaslik', 'sayisal_mantik', 'mantik'];
        final currentCourse = courseCycle[(dayIdx - 1) % courseCycle.length];

        dayMissions.add(DailyMissionItem(
          id: 'm_${missionCounter++}',
          dayNumber: dayIdx,
          title: '${currentCourse.toUpperCase()} Hız Testi (Test ${(dayIdx % 15) + 1})',
          subtitle: 'Süre tutarak 25 soru çözüm maratonu',
          type: MissionType.test,
          targetKey: currentCourse,
          estimatedMinutes: 30,
        ));

        // Math Lab Problemleri (8 - 14)
        final mathTopic = (((dayIdx - phase1Days - 1) % 7) + 8).clamp(8, 14);
        dayMissions.add(DailyMissionItem(
          id: 'm_${missionCounter++}',
          dayNumber: dayIdx,
          title: 'Math Lab Problem Atölyesi: Konu $mathTopic',
          subtitle: 'KPSS denklem, yüzde, hız ve sayısal mantık simülatörü',
          type: MissionType.mathLab,
          targetKey: mathTopic.toString(),
          estimatedMinutes: 25,
        ));

        // Hata havuzu & Spaced repetition
        dayMissions.add(DailyMissionItem(
          id: 'm_${missionCounter++}',
          dayNumber: dayIdx,
          title: 'Hata Avı: Yanlış Soru Havuzu Taraması',
          subtitle: 'Leitner Kutu 1 ve Kutu 2 sorularını kalıcı hafızaya taşı',
          type: MissionType.spacedRepetition,
          targetKey: 'leitner_box',
          estimatedMinutes: 25,
        ));

        // Haftada 1 Mini Alan Denemesi (Pazar günleri veya her 7 günde bir)
        if (dayIdx % 7 == 0 || goal.dailyHours >= 4.0) {
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: 'Mini Alan Denemesi (30 Soru)',
            subtitle: 'Genel Yetenek / Genel Kültür zamanlı tarama',
            type: MissionType.test,
            targetKey: 'mini_deneme',
            estimatedMinutes: 35,
          ));
        }
      } else {
        // --- FAZ 3: DENEME KONDİSYONU & ŞOK REFLÜKS (%20 Süre) ---
        // Kural: 120 Soruluk Gerçek Zamanlı Denemeler + Sıfır Fire Hata Analizi
        final isDenemeDay = dayIdx % 2 != 0;

        if (isDenemeDay) {
          final examNum = (((dayIdx - phase1Days - phase2Days) ~/ 2) % 10) + 1;
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: '120 Soruluk Tam Deneme Sınavı (Deneme $examNum)',
            subtitle: '130 Dakika ÖSYM sınav kondisyonu ve net ölçümü',
            type: MissionType.deneme,
            targetKey: 'deneme_$examNum',
            estimatedMinutes: 130,
          ));
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: 'Deneme Analizi & Hata Notları',
            subtitle: 'Yanlış ve boş soruların video/çözüm incelemesi',
            type: MissionType.spacedRepetition,
            targetKey: 'deneme_review',
            estimatedMinutes: 30,
          ));
        } else {
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: 'Kritik ÖSYM Nokta Atışı Taraması',
            subtitle: 'En çok soru çıkan 5 çekirdek konudan karma test',
            type: MissionType.test,
            targetKey: 'karma_tarama',
            estimatedMinutes: 40,
          ));
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: 'Son Düzlük: Leitner Kutu 3 & 4 Teyidi',
            subtitle: 'Tüm derslerden zor soruların son kontrolü',
            type: MissionType.spacedRepetition,
            targetKey: 'leitner_box',
            estimatedMinutes: 25,
          ));
          dayMissions.add(DailyMissionItem(
            id: 'm_${missionCounter++}',
            dayNumber: dayIdx,
            title: 'Güncel Bilgiler & Anayasa Revizyonu',
            subtitle: 'Son 1 yılın olayları ve kritik hukuk maddeleri',
            type: MissionType.lecture,
            targetKey: 'vatandaslik_m5',
            estimatedMinutes: 20,
          ));
        }
      }

      days.add(StudyDay(
        dayNumber: dayIdx,
        date: date,
        phaseNumber: phase,
        missions: dayMissions,
      ));
    }

    final plan = StudyPlan(
      id: 'plan_${now.millisecondsSinceEpoch}',
      createdAt: now,
      goal: goal,
      days: days,
    );

    _currentPlan = plan;
    await _save();

    // İlk koç bildirimini gönder
    await NotificationService.instance.showSystemNotification(
      title: '🎯 KPSS Çalışma Koçun Hazırlandı!',
      body: '${goal.totalDays} günlük dinamik planın devrede. Hedef: ${goal.targetScore}+ Puan!',
      id: 110,
    );

    return plan;
  }

  /// Belirtilen görevi tamamlandı / tamamlanmadı olarak işaretler
  Future<void> toggleMission(String missionId) async {
    if (_currentPlan == null) return;
    for (final day in _currentPlan!.days) {
      for (final m in day.missions) {
        if (m.id == missionId) {
          m.isCompleted = !m.isCompleted;
          m.completedAt = m.isCompleted ? DateTime.now() : null;
          await _save();
          return;
        }
      }
    }
  }

  /// Elastik Yeniden Dengeleme (Elastic Replanning / Rebalance):
  /// Kullanıcı bazı günleri aksattıysa, geriye kalan eksik görevleri
  /// gelecekteki günlere bilişsel yük sınırlarını aşmadan eşitçe yayar.
  Future<int> rebalancePlan({int? forceCurrentDay}) async {
    if (_currentPlan == null) return 0;
    final int currentDay = forceCurrentDay ?? _currentPlan!.currentDayNumber;
    final List<DailyMissionItem> missedMissions = [];

    // Geçmiş günlerdeki tamamlanmamış görevleri topla
    for (final day in _currentPlan!.days) {
      if (day.dayNumber < currentDay) {
        for (final m in day.missions) {
          if (!m.isCompleted) {
            missedMissions.add(m);
          }
        }
      }
    }

    if (missedMissions.isEmpty) return 0;

    // Kalan günlere dengeli dağıt (Bugünden son güne kadar)
    final futureDays = _currentPlan!.days.where((d) => d.dayNumber >= currentDay).toList();
    if (futureDays.isEmpty) return 0;

    int redistributed = 0;
    int dayCursor = 0;

    for (final missed in missedMissions) {
      final targetDay = futureDays[dayCursor % futureDays.length];
      // Eğer hedef günde zaten benzer bir görev yoksa ve 6 görevi geçmiyorsa ekle
      if (targetDay.missions.length < 6) {
        targetDay.missions.add(DailyMissionItem(
          id: '${missed.id}_rebal',
          dayNumber: targetDay.dayNumber,
          title: '🔄 [Telafi] ${missed.title}',
          subtitle: missed.subtitle,
          type: missed.type,
          targetKey: missed.targetKey,
          estimatedMinutes: (missed.estimatedMinutes * 0.8).round(),
        ));
        missed.isCompleted = true; // Eski günün ceza yükünü kaldır
        redistributed++;
      }
      dayCursor++;
    }

    _currentPlan!.lastRebalancedAt = DateTime.now();
    await _save();

    // Sistem bildirim çubuğunda başarı bildirimi
    await NotificationService.instance.showSystemNotification(
      title: '⚖️ Planın Otomatik Dengelendi!',
      body: '$redistributed eksik görev gelecekteki günlere yayıldı. Stres yok, hedef net!',
      id: 112,
    );

    return redistributed;
  }

  /// Planı sıfırlar / siler
  Future<void> deletePlan() async {
    _currentPlan = null;
    await _save();
  }

  /// Günün hatırlatmasını anında test amaçlı veya periyodik olarak tetikler
  Future<void> triggerDailyNotificationNow() async {
    if (_currentPlan == null) return;
    final day = _currentPlan!.currentStudyDay;
    final remaining = day.missions.where((m) => !m.isCompleted).length;

    await NotificationService.instance.showSystemNotification(
      title: '🎯 KPSS Koçu: Günün Planı Seni Bekliyor!',
      body: remaining > 0
          ? 'Bugün tamamlanması gereken $remaining görevin var. Hedefe 1 adım daha yaklaş!'
          : 'Tebrikler! Bugünün tüm görevlerini başarıyla tamamladın! 🏆',
      id: 115,
    );
  }
}
