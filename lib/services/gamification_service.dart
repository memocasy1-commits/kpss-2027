import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  });

  double get progressRatio => target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;
  int get progressPercent => (progressRatio * 100).toInt();
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

    return [
      // Genel Başarılar
      BadgeItem(
        id: 'first_step',
        title: 'İlk Kıvılcım',
        description: 'İlk KPSS sorunu çöz ve hedefe doğru ilk adımını at.',
        icon: Icons.flag_rounded,
        color: const Color(0xFF3B82F6),
        category: 'Genel',
        target: 1,
        current: totalSolved,
        isUnlocked: totalSolved >= 1,
      ),
      BadgeItem(
        id: 'streak_3',
        title: 'İstikrar Işığı',
        description: '3 gün aralıksız soru çözerek öğrenme zinciri kur.',
        icon: Icons.local_fire_department_rounded,
        color: const Color(0xFFF97316),
        category: 'Genel',
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
        category: 'Genel',
        target: 7,
        current: streak,
        isUnlocked: streak >= 7,
      ),
      BadgeItem(
        id: 'solved_50',
        title: 'Isınma Seansı',
        description: 'Toplam 50 soruyu tamamla ve soru çözme hızını artır.',
        icon: Icons.bolt_rounded,
        color: const Color(0xFFEAB308),
        category: 'Genel',
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
        target: 250,
        current: totalSolved,
        isUnlocked: totalSolved >= 250,
      ),
      BadgeItem(
        id: 'solved_1000',
        title: 'KPSS Efsanesi',
        description: 'Toplam 1.000 soruyu başarıyla çöz ve zirveye yaklaş.',
        icon: Icons.workspace_premium_rounded,
        color: const Color(0xFFEC4899),
        category: 'Genel',
        target: 1000,
        current: totalSolved,
        isUnlocked: totalSolved >= 1000,
      ),

      // Ders Başarıları
      BadgeItem(
        id: 'tarih_master',
        title: 'Tarih Fatihi',
        description: 'Tarih dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.history_edu_rounded,
        color: const Color(0xFFD97706),
        category: 'Dersler',
        target: 50,
        current: tarihCorrect,
        isUnlocked: tarihCorrect >= 50,
      ),
      BadgeItem(
        id: 'cografya_master',
        title: 'Mekanın Efendisi',
        description: 'Coğrafya dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.public_rounded,
        color: const Color(0xFF059669),
        category: 'Dersler',
        target: 50,
        current: cografyaCorrect,
        isUnlocked: cografyaCorrect >= 50,
      ),
      BadgeItem(
        id: 'vatandaslik_master',
        title: 'Anayasa Bilgesi',
        description: 'Vatandaşlık dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.gavel_rounded,
        color: const Color(0xFF2563EB),
        category: 'Dersler',
        target: 50,
        current: vatandaslikCorrect,
        isUnlocked: vatandaslikCorrect >= 50,
      ),
      BadgeItem(
        id: 'turkce_master',
        title: 'Dil Ustası',
        description: 'Türkçe dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.menu_book_rounded,
        color: const Color(0xFF7C3AED),
        category: 'Dersler',
        target: 50,
        current: turkceCorrect,
        isUnlocked: turkceCorrect >= 50,
      ),
      BadgeItem(
        id: 'matematik_master',
        title: 'Sayıların Efendisi',
        description: 'Matematik dersinden 50 soruyu doğru yanıtla.',
        icon: Icons.calculate_rounded,
        color: const Color(0xFF0891B2),
        category: 'Dersler',
        target: 50,
        current: matematikCorrect,
        isUnlocked: matematikCorrect >= 50,
      ),
      BadgeItem(
        id: 'mantik_master',
        title: 'Strateji Dehası',
        description: 'Mantık bölümünden 30 soruyu doğru yanıtla.',
        icon: Icons.psychology_rounded,
        color: const Color(0xFF9333EA),
        category: 'Dersler',
        target: 30,
        current: mantikCorrect,
        isUnlocked: mantikCorrect >= 30,
      ),

      // Odak & Çalışma
      BadgeItem(
        id: 'pomodoro_hero',
        title: 'Odak Ustası',
        description: 'En az 1 tam Pomodoro (25 dk) çalışma seansını tamamla.',
        icon: Icons.timer_rounded,
        color: const Color(0xFFE11D48),
        category: 'Odak',
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
        target: 5,
        current: pomodoroSessions,
        isUnlocked: pomodoroSessions >= 5,
      ),
    ];
  }

  Future<void> recordPomodoroCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('pomodoro_completed_sessions') ?? 0;
    await prefs.setInt('pomodoro_completed_sessions', count + 1);
  }
}
