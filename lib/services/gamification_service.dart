import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum BadgeTier { bronze, silver, gold, diamond }

class BadgeItem {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String category;
  final int target;
  final int current;
  final bool isUnlocked;
  final BadgeTier tier;
  final int xpReward;
  final String howToUnlock;

  const BadgeItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.category,
    required this.target,
    required this.current,
    required this.isUnlocked,
    this.tier = BadgeTier.bronze,
    this.xpReward = 50,
    this.howToUnlock = '',
  });

  double get progressRatio => target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;
  int get progressPercent => (progressRatio * 100).toInt();

  String get tierName {
    switch (tier) {
      case BadgeTier.bronze:
        return 'Bronz';
      case BadgeTier.silver:
        return 'Gümüş';
      case BadgeTier.gold:
        return 'Altın';
      case BadgeTier.diamond:
        return 'Elmas';
    }
  }

  Color get tierColor {
    switch (tier) {
      case BadgeTier.bronze:
        return const Color(0xFFCD7F32);
      case BadgeTier.silver:
        return const Color(0xFF94A3B8);
      case BadgeTier.gold:
        return const Color(0xFFF59E0B);
      case BadgeTier.diamond:
        return const Color(0xFF06B6D4);
    }
  }
}

class GamificationSummary {
  final int totalXp;
  final int level;
  final String levelTitle;
  final int unlockedCount;
  final int totalCount;
  final int currentLevelXp;
  final int nextLevelXp;
  final double levelProgress;

  const GamificationSummary({
    required this.totalXp,
    required this.level,
    required this.levelTitle,
    required this.unlockedCount,
    required this.totalCount,
    required this.currentLevelXp,
    required this.nextLevelXp,
    required this.levelProgress,
  });
}

class GamificationService {
  GamificationService._();
  static final GamificationService instance = GamificationService._();

  Future<List<BadgeItem>> getAllBadges() async {
    final prefs = await SharedPreferences.getInstance();

    final totalSolved = prefs.getInt('stat_total_solved') ?? 0;
    final streak = prefs.getInt('streak_count') ?? 0;
    final pomodoroSessions = prefs.getInt('pomodoro_completed_sessions') ?? 0;

    final tarihCorrect = prefs.getInt('stat_tarih_correct') ?? 0;
    final turkceCorrect = prefs.getInt('stat_turkce_correct') ?? 0;
    final cografyaCorrect = prefs.getInt('stat_cografya_correct') ?? 0;
    final vatandaslikCorrect = prefs.getInt('stat_vatandaslik_correct') ?? 0;
    final matematikCorrect = prefs.getInt('stat_matematik_correct') ?? 0;
    final mantikCorrect = prefs.getInt('stat_mantik_correct') ?? 0;

    final nightSolved = prefs.getInt('stat_night_solved') ?? 0;
    final morningSolved = prefs.getInt('stat_morning_solved') ?? 0;
    final perfectTests = prefs.getInt('stat_perfect_tests') ?? 0;

    final mapGames = prefs.getInt('stat_game_map_played') ?? 0;
    final matchingGames = prefs.getInt('stat_game_matching_played') ?? 0;
    final bombGames = prefs.getInt('stat_game_bomb_played') ?? 0;
    final clueGames = prefs.getInt('stat_game_clue_played') ?? 0;

    return [
      // 1. GENEL BAŞARILAR
      BadgeItem(
        id: 'first_step',
        title: 'İlk Kıvılcım',
        description: 'İlk KPSS sorunu çöz ve hedefe doğru ilk adımını at.',
        icon: Icons.flag_rounded,
        color: const Color(0xFF3B82F6),
        category: 'Genel',
        tier: BadgeTier.bronze,
        xpReward: 50,
        howToUnlock: 'Herhangi bir branştan en az 1 soru çöz.',
        target: 1,
        current: totalSolved,
        isUnlocked: totalSolved >= 1,
      ),
      BadgeItem(
        id: 'solved_50',
        title: 'Isınma Seansı',
        description: 'Toplam 50 soruyu tamamla ve soru çözme hızını artır.',
        icon: Icons.bolt_rounded,
        color: const Color(0xFFEAB308),
        category: 'Genel',
        tier: BadgeTier.bronze,
        xpReward: 100,
        howToUnlock: 'Toplamda 50 soru çöz.',
        target: 50,
        current: totalSolved,
        isUnlocked: totalSolved >= 50,
      ),
      BadgeItem(
        id: 'solved_250',
        title: 'Soru Canavarı',
        description: 'Toplam 250 soruyu geride bırak.',
        icon: Icons.rocket_launch_rounded,
        color: const Color(0xFF8B5CF6),
        category: 'Genel',
        tier: BadgeTier.silver,
        xpReward: 250,
        howToUnlock: 'Toplamda 250 soru çöz.',
        target: 250,
        current: totalSolved,
        isUnlocked: totalSolved >= 250,
      ),
      BadgeItem(
        id: 'solved_500',
        title: 'Soru Avcısı',
        description: '500 soru barajını aşarak istikrarlı ilerlemeni kanıtla.',
        icon: Icons.military_tech_rounded,
        color: const Color(0xFF10B981),
        category: 'Genel',
        tier: BadgeTier.silver,
        xpReward: 500,
        howToUnlock: 'Toplamda 500 soru çöz.',
        target: 500,
        current: totalSolved,
        isUnlocked: totalSolved >= 500,
      ),
      BadgeItem(
        id: 'solved_1000',
        title: 'KPSS Efsanesi',
        description: 'Toplam 1.000 soruyu başarıyla çöz ve zirveye yaklaş.',
        icon: Icons.workspace_premium_rounded,
        color: const Color(0xFFEC4899),
        category: 'Genel',
        tier: BadgeTier.gold,
        xpReward: 1000,
        howToUnlock: 'Toplamda 1.000 soru çöz.',
        target: 1000,
        current: totalSolved,
        isUnlocked: totalSolved >= 1000,
      ),
      BadgeItem(
        id: 'solved_2500',
        title: 'Üstat Adayı',
        description: '2.500 soru çözerek ÖSYM soru havuzunun büyük kısmına hakim ol.',
        icon: Icons.diamond_rounded,
        color: const Color(0xFF6366F1),
        category: 'Genel',
        tier: BadgeTier.gold,
        xpReward: 2500,
        howToUnlock: 'Toplamda 2.500 soru çöz.',
        target: 2500,
        current: totalSolved,
        isUnlocked: totalSolved >= 2500,
      ),
      BadgeItem(
        id: 'solved_5000',
        title: 'KPSS Mareşali',
        description: 'Tam 5.000 soruyu tamamlayarak KPSS efsaneleri arasına katıl.',
        icon: Icons.stars_rounded,
        color: const Color(0xFF06B6D4),
        category: 'Genel',
        tier: BadgeTier.diamond,
        xpReward: 5000,
        howToUnlock: 'Toplamda 5.000 soru çöz.',
        target: 5000,
        current: totalSolved,
        isUnlocked: totalSolved >= 5000,
      ),

      // 2. DİSİPLİN & SERİ
      BadgeItem(
        id: 'streak_3',
        title: 'İstikrar Işığı',
        description: '3 gün aralıksız soru çözerek öğrenme zinciri kur.',
        icon: Icons.local_fire_department_rounded,
        color: const Color(0xFFF97316),
        category: 'Disiplin',
        tier: BadgeTier.bronze,
        xpReward: 150,
        howToUnlock: 'Aralıksız 3 gün boyunca her gün en az 1 soru çöz.',
        target: 3,
        current: streak,
        isUnlocked: streak >= 3,
      ),
      BadgeItem(
        id: 'streak_7',
        title: 'Haftalık Şampiyon',
        description: 'Tam 7 gün boyunca günlük soru zincirini hiç koparma.',
        icon: Icons.whatshot_rounded,
        color: const Color(0xFFEF4444),
        category: 'Disiplin',
        tier: BadgeTier.silver,
        xpReward: 350,
        howToUnlock: 'Aralıksız 7 günlük çalışma serisine ulaş.',
        target: 7,
        current: streak,
        isUnlocked: streak >= 7,
      ),
      BadgeItem(
        id: 'streak_14',
        title: 'İki Haftalık Çelik İrade',
        description: '14 gün boyunca hiç ara vermeden her gün çalış.',
        icon: Icons.shield_rounded,
        color: const Color(0xFFD97706),
        category: 'Disiplin',
        tier: BadgeTier.gold,
        xpReward: 700,
        howToUnlock: 'Aralıksız 14 günlük çalışma serisine ulaş.',
        target: 14,
        current: streak,
        isUnlocked: streak >= 14,
      ),
      BadgeItem(
        id: 'streak_30',
        title: 'Demir İrade',
        description: 'Tam 30 gün boyunca her gün çalışarak kırılması zor bir rekor kır.',
        icon: Icons.military_tech_rounded,
        color: const Color(0xFF0284C7),
        category: 'Disiplin',
        tier: BadgeTier.diamond,
        xpReward: 1500,
        howToUnlock: 'Aralıksız 30 günlük çalışma serisine ulaş.',
        target: 30,
        current: streak,
        isUnlocked: streak >= 30,
      ),
      BadgeItem(
        id: 'night_owl',
        title: 'Gece Kuşu',
        description: 'Gece 22:00 - 04:00 saatleri arasında soru çözerek azmini göster.',
        icon: Icons.nightlight_round,
        color: const Color(0xFF6366F1),
        category: 'Disiplin',
        tier: BadgeTier.silver,
        xpReward: 200,
        howToUnlock: 'Gece 22:00 ile 04:00 arasında en az 20 soru çöz.',
        target: 20,
        current: nightSolved,
        isUnlocked: nightSolved >= 20,
      ),
      BadgeItem(
        id: 'early_bird',
        title: 'Sabah Güneşi',
        description: 'Sabah 06:00 - 09:00 saatleri arasında güne zinde başla.',
        icon: Icons.wb_sunny_rounded,
        color: const Color(0xFFF59E0B),
        category: 'Disiplin',
        tier: BadgeTier.silver,
        xpReward: 200,
        howToUnlock: 'Sabah 06:00 ile 09:00 arasında en az 20 soru çöz.',
        target: 20,
        current: morningSolved,
        isUnlocked: morningSolved >= 20,
      ),

      // 3. BRANŞ HAKİMİYETİ (DERSLER)
      BadgeItem(
        id: 'tarih_master',
        title: 'Tarih Fatihi',
        description: 'Tarih dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.history_edu_rounded,
        color: const Color(0xFFD97706),
        category: 'Dersler',
        tier: BadgeTier.silver,
        xpReward: 250,
        howToUnlock: 'Tarih dersinden 50 doğru yap.',
        target: 50,
        current: tarihCorrect,
        isUnlocked: tarihCorrect >= 50,
      ),
      BadgeItem(
        id: 'tarih_grandmaster',
        title: 'Tarih Ordinaryüsü',
        description: 'Tarih dersinden 200 doğru yaparak tarihi baştan yaz.',
        icon: Icons.auto_stories_rounded,
        color: const Color(0xFFB45309),
        category: 'Dersler',
        tier: BadgeTier.gold,
        xpReward: 600,
        howToUnlock: 'Tarih dersinden 200 doğru yap.',
        target: 200,
        current: tarihCorrect,
        isUnlocked: tarihCorrect >= 200,
      ),
      BadgeItem(
        id: 'cografya_master',
        title: 'Mekanın Efendisi',
        description: 'Coğrafya dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.public_rounded,
        color: const Color(0xFF059669),
        category: 'Dersler',
        tier: BadgeTier.silver,
        xpReward: 250,
        howToUnlock: 'Coğrafya dersinden 50 doğru yap.',
        target: 50,
        current: cografyaCorrect,
        isUnlocked: cografyaCorrect >= 50,
      ),
      BadgeItem(
        id: 'cografya_grandmaster',
        title: 'Harita Piri',
        description: 'Coğrafya dersinden 200 doğru yaparak Türkiye haritasını ezberle.',
        icon: Icons.map_rounded,
        color: const Color(0xFF047857),
        category: 'Dersler',
        tier: BadgeTier.gold,
        xpReward: 600,
        howToUnlock: 'Coğrafya dersinden 200 doğru yap.',
        target: 200,
        current: cografyaCorrect,
        isUnlocked: cografyaCorrect >= 200,
      ),
      BadgeItem(
        id: 'vatandaslik_master',
        title: 'Anayasa Bilgesi',
        description: 'Vatandaşlık dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.gavel_rounded,
        color: const Color(0xFF2563EB),
        category: 'Dersler',
        tier: BadgeTier.silver,
        xpReward: 250,
        howToUnlock: 'Vatandaşlık dersinden 50 doğru yap.',
        target: 50,
        current: vatandaslikCorrect,
        isUnlocked: vatandaslikCorrect >= 50,
      ),
      BadgeItem(
        id: 'vatandaslik_grandmaster',
        title: 'Hukuk Dehası',
        description: 'Vatandaşlık dersinden 200 doğru yaparak mevzuata hükmet.',
        icon: Icons.balance_rounded,
        color: const Color(0xFF1D4ED8),
        category: 'Dersler',
        tier: BadgeTier.gold,
        xpReward: 600,
        howToUnlock: 'Vatandaşlık dersinden 200 doğru yap.',
        target: 200,
        current: vatandaslikCorrect,
        isUnlocked: vatandaslikCorrect >= 200,
      ),
      BadgeItem(
        id: 'turkce_master',
        title: 'Dil Ustası',
        description: 'Türkçe dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.menu_book_rounded,
        color: const Color(0xFF7C3AED),
        category: 'Dersler',
        tier: BadgeTier.silver,
        xpReward: 250,
        howToUnlock: 'Türkçe dersinden 50 doğru yap.',
        target: 50,
        current: turkceCorrect,
        isUnlocked: turkceCorrect >= 50,
      ),
      BadgeItem(
        id: 'turkce_grandmaster',
        title: 'Paragraf Şövalyesi',
        description: 'Türkçe dersinden 200 doğru yaparak paragrafları saniyeler içinde çöz.',
        icon: Icons.spellcheck_rounded,
        color: const Color(0xFF6D28D9),
        category: 'Dersler',
        tier: BadgeTier.gold,
        xpReward: 600,
        howToUnlock: 'Türkçe dersinden 200 doğru yap.',
        target: 200,
        current: turkceCorrect,
        isUnlocked: turkceCorrect >= 200,
      ),
      BadgeItem(
        id: 'matematik_master',
        title: 'Sayıların Efendisi',
        description: 'Matematik dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.calculate_rounded,
        color: const Color(0xFF0891B2),
        category: 'Dersler',
        tier: BadgeTier.silver,
        xpReward: 250,
        howToUnlock: 'Matematik dersinden 50 doğru yap.',
        target: 50,
        current: matematikCorrect,
        isUnlocked: matematikCorrect >= 50,
      ),
      BadgeItem(
        id: 'matematik_grandmaster',
        title: 'Rasyonel Dahi',
        description: 'Matematik dersinden 200 doğru ile sayısal mantığı fetheyle.',
        icon: Icons.functions_rounded,
        color: const Color(0xFF0E7490),
        category: 'Dersler',
        tier: BadgeTier.gold,
        xpReward: 600,
        howToUnlock: 'Matematik dersinden 200 doğru yap.',
        target: 200,
        current: matematikCorrect,
        isUnlocked: matematikCorrect >= 200,
      ),
      BadgeItem(
        id: 'mantik_master',
        title: 'Strateji Dehası',
        description: 'Mantık bölümünden 30 soruyu doğru yanıtla.',
        icon: Icons.psychology_rounded,
        color: const Color(0xFF9333EA),
        category: 'Dersler',
        tier: BadgeTier.silver,
        xpReward: 200,
        howToUnlock: 'Mantık bölümünden 30 doğru yap.',
        target: 30,
        current: mantikCorrect,
        isUnlocked: mantikCorrect >= 30,
      ),
      BadgeItem(
        id: 'mantik_grandmaster',
        title: 'Analitik Zeka',
        description: 'Mantık bölümünden 100 doğru ile tablo ve akış şemalarını ustalıkla çöz.',
        icon: Icons.schema_rounded,
        color: const Color(0xFF7E22CE),
        category: 'Dersler',
        tier: BadgeTier.gold,
        xpReward: 500,
        howToUnlock: 'Mantık bölümünden 100 doğru yap.',
        target: 100,
        current: mantikCorrect,
        isUnlocked: mantikCorrect >= 100,
      ),

      // 4. ZEKA OYUNLARI & ETKİNLİKLER
      BadgeItem(
        id: 'game_map',
        title: 'Harita Kâşifi',
        description: 'Harita işaretleme oyununu başarıyla oyna ve şehirleri tanı.',
        icon: Icons.explore_rounded,
        color: const Color(0xFF10B981),
        category: 'Oyunlar',
        tier: BadgeTier.silver,
        xpReward: 150,
        howToUnlock: 'Harita işaretleme oyununda en az 3 oyun oyna.',
        target: 3,
        current: mapGames,
        isUnlocked: mapGames >= 3,
      ),
      BadgeItem(
        id: 'game_matching',
        title: 'Kavram Ustası',
        description: 'Kavram eşleştirme oyununda kavram ve tanımları hafızana kazı.',
        icon: Icons.view_carousel_rounded,
        color: const Color(0xFF8B5CF6),
        category: 'Oyunlar',
        tier: BadgeTier.silver,
        xpReward: 150,
        howToUnlock: 'Kavram eşleştirme oyununda en az 3 oyun oyna.',
        target: 3,
        current: matchingGames,
        isUnlocked: matchingGames >= 3,
      ),
      BadgeItem(
        id: 'game_bomb',
        title: 'Bomba İmha Uzmanı',
        description: 'Zaman bombalı sınav modunda geri sayım bitmeden soruları çöz.',
        icon: Icons.timer_3_rounded,
        color: const Color(0xFFEF4444),
        category: 'Oyunlar',
        tier: BadgeTier.silver,
        xpReward: 150,
        howToUnlock: 'Zaman bombası modunda en az 3 seansı tamamla.',
        target: 3,
        current: bombGames,
        isUnlocked: bombGames >= 3,
      ),
      BadgeItem(
        id: 'game_clue',
        title: 'İpucu Dedektifi',
        description: 'Kelime ve kavram ipucu oyununda gizli tarihi figürleri çöz.',
        icon: Icons.search_rounded,
        color: const Color(0xFFF59E0B),
        category: 'Oyunlar',
        tier: BadgeTier.silver,
        xpReward: 150,
        howToUnlock: 'İpucu oyununda en az 3 gizemi çöz.',
        target: 3,
        current: clueGames,
        isUnlocked: clueGames >= 3,
      ),

      // 5. ODAK & POMODORO
      BadgeItem(
        id: 'pomodoro_hero',
        title: 'Odak Ustası',
        description: 'En az 1 tam Pomodoro (25 dk) çalışma seansını tamamla.',
        icon: Icons.timer_rounded,
        color: const Color(0xFFE11D48),
        category: 'Odak',
        tier: BadgeTier.bronze,
        xpReward: 100,
        howToUnlock: 'Pomodoro sayacında 1 seansı tamamla.',
        target: 1,
        current: pomodoroSessions,
        isUnlocked: pomodoroSessions >= 1,
      ),
      BadgeItem(
        id: 'pomodoro_master',
        title: 'Maraton Odaklanması',
        description: 'Toplam 5 Pomodoro seansı tamamlayarak disiplinini kanıtla.',
        icon: Icons.hourglass_top_rounded,
        color: const Color(0xFFBE185D),
        category: 'Odak',
        tier: BadgeTier.silver,
        xpReward: 300,
        howToUnlock: 'Toplamda 5 Pomodoro seansını tamamla.',
        target: 5,
        current: pomodoroSessions,
        isUnlocked: pomodoroSessions >= 5,
      ),
      BadgeItem(
        id: 'pomodoro_zen',
        title: 'Derin Çalışma Gurusu',
        description: 'Tam 15 Pomodoro seansı ile dikkat dağınıklığını tamamen yen.',
        icon: Icons.self_improvement_rounded,
        color: const Color(0xFF9F1239),
        category: 'Odak',
        tier: BadgeTier.gold,
        xpReward: 750,
        howToUnlock: 'Toplamda 15 Pomodoro seansını tamamla.',
        target: 15,
        current: pomodoroSessions,
        isUnlocked: pomodoroSessions >= 15,
      ),

      // 6. KUSURSUZLUK
      BadgeItem(
        id: 'perfect_test',
        title: 'Kusursuz 20\'de 20',
        description: 'Herhangi bir KPSS testini hiç yanlış yapmadan tamamla.',
        icon: Icons.star_border_purple500_rounded,
        color: const Color(0xFFEAB308),
        category: 'Genel',
        tier: BadgeTier.gold,
        xpReward: 400,
        howToUnlock: 'Bir testte 20 sorunun tamamını doğru çöz.',
        target: 1,
        current: perfectTests,
        isUnlocked: perfectTests >= 1,
      ),
    ];
  }

  /// Calculates user level, total XP, and progress
  Future<GamificationSummary> getSummary() async {
    final badges = await getAllBadges();
    int totalXp = 0;
    int unlockedCount = 0;

    for (final b in badges) {
      if (b.isUnlocked) {
        totalXp += b.xpReward;
        unlockedCount++;
      }
    }

    // Every 500 XP is 1 level
    const int xpPerLevel = 500;
    final int level = 1 + (totalXp ~/ xpPerLevel);
    final int currentLevelXp = totalXp % xpPerLevel;
    final int nextLevelXp = xpPerLevel;
    final double levelProgress = currentLevelXp / nextLevelXp;

    String levelTitle = 'Yeni Başlayan Aday';
    if (level >= 15) {
      levelTitle = 'KPSS Başmüfettişi & Ordinaryüs';
    } else if (level >= 10) {
      levelTitle = 'KPSS Üstadı & Derece Adayı';
    } else if (level >= 7) {
      levelTitle = 'Kıdemli Soru Avcısı';
    } else if (level >= 4) {
      levelTitle = 'Azimli KPSS Savaşçısı';
    } else if (level >= 2) {
      levelTitle = 'Çalışkan Öğrenci';
    }

    return GamificationSummary(
      totalXp: totalXp,
      level: level,
      levelTitle: levelTitle,
      unlockedCount: unlockedCount,
      totalCount: badges.length,
      currentLevelXp: currentLevelXp,
      nextLevelXp: nextLevelXp,
      levelProgress: levelProgress,
    );
  }

  Future<void> recordPomodoroCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('pomodoro_completed_sessions') ?? 0;
    await prefs.setInt('pomodoro_completed_sessions', count + 1);
  }

  Future<void> recordGamePlayed(String gameType) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'stat_game_${gameType}_played';
    final count = prefs.getInt(key) ?? 0;
    await prefs.setInt(key, count + 1);
  }

  Future<void> recordPerfectTest() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('stat_perfect_tests') ?? 0;
    await prefs.setInt('stat_perfect_tests', count + 1);
  }
}
