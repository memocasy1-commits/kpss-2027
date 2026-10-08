import 'package:flutter/material.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../screens/test_list_screen.dart';
import '../screens/soru_bankalari_screen.dart';
import '../screens/deneme_list_screen.dart';
import '../screens/wrong_questions_screen.dart';
import '../screens/stats_screen.dart';
import '../screens/badges_screen.dart';
import '../screens/pomodoro_screen.dart';
import '../screens/games_hub_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/question_search_screen.dart';
import '../screens/starred_questions_screen.dart';
import '../screens/spaced_repetition_screen.dart';
import '../screens/lecture_hub_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = AppColors.isDarkMode;
        final Color drawerBg = AppColors.background;
        final Color headerBg = AppColors.surface;
        final Color borderColor = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;
        final Color brandBlue = AppColors.courseBlue;

        return Drawer(
          backgroundColor: drawerBg,
          child: Column(
            children: [
              // 1. KURUMSAL HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                decoration: BoxDecoration(
                  color: headerBg,
                  border: Border(bottom: BorderSide(color: borderColor, width: 1.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFEEF2F6),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: Icon(Icons.school_outlined, color: brandBlue, size: 26),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'KPSS AKADEMİ',
                                style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '2027 Sınav Arşivi & Kütüphane',
                                style: TextStyle(
                                  color: textSecondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.verified_outlined, size: 14, color: brandBlue),
                          const SizedBox(width: 6),
                          Text(
                            '${QuestionService.formatNumber(QuestionService.instance.grandTotalQuestionCount)} Soru • %100 Çevrimdışı',
                            style: TextStyle(
                              color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0369A1),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 2. KAYDIRILABİLİR MENÜ LİSTESİ
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // GRUP 1: MODÜLER DERSLER
                    _buildSectionHeader('MODÜLER DERS KÜTÜPHANESİ', textSecondary),
                    _buildDrawerItem(
                      icon: Icons.account_balance_outlined,
                      color: const Color(0xFFB45309),
                      title: 'Tarih Soru Bankası',
                      subtitle: '${QuestionService.instance.totalTarihTestCount} Test • ${QuestionService.formatNumber(QuestionService.instance.totalTarihCount)} Soru',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TestListScreen(
                              courseId: 'tarih',
                              courseTitle: 'Tarih Soru Bankası',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.public_outlined,
                      color: const Color(0xFF047857),
                      title: 'Coğrafya Soru Bankası',
                      subtitle: '${QuestionService.instance.totalCografyaTestCount} Test • ${QuestionService.formatNumber(QuestionService.instance.totalCografyaCount)} Soru',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TestListScreen(
                              courseId: 'cografya',
                              courseTitle: 'Coğrafya Soru Bankası',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.gavel_outlined,
                      color: const Color(0xFF1D4ED8),
                      title: 'Vatandaşlık Soru Bankası',
                      subtitle: '${QuestionService.instance.totalVatandaslikTestCount} Test • ${QuestionService.formatNumber(QuestionService.instance.totalVatandaslikCount)} Soru',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TestListScreen(
                              courseId: 'vatandaslik',
                              courseTitle: 'Vatandaşlık Soru Bankası',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.menu_book_outlined,
                      color: const Color(0xFF6D28D9),
                      title: 'Türkçe Soru Bankası',
                      subtitle: '${QuestionService.instance.totalTurkceTestCount} Test • ${QuestionService.formatNumber(QuestionService.instance.totalTurkceCount)} Soru',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TestListScreen(
                              courseId: 'turkce',
                              courseTitle: 'Türkçe Soru Bankası',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.calculate_outlined,
                      color: const Color(0xFF0369A1),
                      title: 'Matematik & Geometri',
                      subtitle: '${QuestionService.instance.totalMatematikTestCount} Test • ${QuestionService.formatNumber(QuestionService.instance.totalMatematikCount)} Soru',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TestListScreen(
                              courseId: 'matematik',
                              courseTitle: 'Matematik & Geometri',
                            ),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.psychology_outlined,
                      color: const Color(0xFF475569),
                      title: 'Mantık Soru Bankası',
                      subtitle: '${QuestionService.instance.totalMantikTestCount + QuestionService.instance.totalSayisalMantikTestCount} Test • ${QuestionService.formatNumber(QuestionService.instance.totalMantikCount + QuestionService.instance.totalSayisalMantikCount)} Soru',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TestListScreen(
                              courseId: 'mantik',
                              courseTitle: 'Mantık Soru Bankası',
                            ),
                          ),
                        );
                      },
                    ),

                    const Divider(height: 24, indent: 16, endIndent: 16),

                    // GRUP 2: SINAV & SİMÜLASYON
                    _buildSectionHeader('SINAV SİMÜLASYONU & ARŞİV', textSecondary),
                    _buildDrawerItem(
                      icon: Icons.assignment_outlined,
                      color: const Color(0xFF047857),
                      title: 'ÖSYM 120 Soruluk Denemeler',
                      subtitle: '${QuestionService.instance.denemeExams.length} Deneme • 130 Dakika • Optik & Karne',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const DenemeListScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.folder_copy_outlined,
                      color: const Color(0xFF1E3A8A),
                      title: 'Tüm Soru Bankaları Arşivi',
                      subtitle: 'Ders ve test fihristi',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SoruBankalariScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.menu_book_rounded,
                      color: const Color(0xFF0284C7),
                      title: 'Konu Anlatımı Klasörü',
                      subtitle: 'Türkçe modülleri, taktikler & interaktif quiz',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LectureHubScreen()),
                        );
                      },
                    ),

                    const Divider(height: 24, indent: 16, endIndent: 16),

                    // GRUP 2.5: AKILLI ÇALIŞMA ARAÇLARI
                    _buildSectionHeader('AKILLI ÇALIŞMA ARAÇLARI', textSecondary),
                    _buildDrawerItem(
                      icon: Icons.search_rounded,
                      color: const Color(0xFF2563EB),
                      title: '15.000 Soru İçi Arama',
                      subtitle: 'Kavram, terim ve anahtar kelime',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const QuestionSearchScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.star_rounded,
                      color: const Color(0xFFD97706),
                      title: 'Yıldızlı Sorular & Notlarım',
                      subtitle: 'Favori sorular ve özel çalışma notları',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const StarredQuestionsScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.psychology_rounded,
                      color: const Color(0xFF0D9488),
                      title: 'Aralıklı Tekrar (Leitner)',
                      subtitle: 'Bilimsel 4 kademeli hafıza kutusu',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SpacedRepetitionScreen()),
                        );
                      },
                    ),

                    const Divider(height: 24, indent: 16, endIndent: 16),

                    // GRUP 3: GELİŞİM & DİSİPLİN
                    _buildSectionHeader('KİŞİSEL GELİŞİM & TELAFİ', textSecondary),
                    _buildDrawerItem(
                      icon: Icons.fact_check_outlined,
                      color: const Color(0xFFDC2626),
                      title: 'Hata Defterim',
                      subtitle: 'Yanlış ve boş bırakılan sorular',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const WrongQuestionsScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.analytics_outlined,
                      color: const Color(0xFF2563EB),
                      title: 'Eksik & Başarı Analizi',
                      subtitle: 'Ders bazlı karne ve zayıf konular',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const StatsScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.timer_outlined,
                      color: const Color(0xFFE11D48),
                      title: 'Pomodoro Odak Sayacı',
                      subtitle: '25 dk çalışma + 5 dk mola seansı',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PomodoroScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.military_tech_outlined,
                      color: const Color(0xFFD97706),
                      title: 'Başarı Rozetleri',
                      subtitle: '14 Hedef ve kazanım durumu',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const BadgesScreen()),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.extension_outlined,
                      color: const Color(0xFF6D28D9),
                      title: 'Hafıza & Pratik Atölyesi',
                      subtitle: 'Kronoloji, eşleştirme ve bilgi oyunları',
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const GamesHubScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // 3. ALT FOOTER PANELİ
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: headerBg,
                  border: Border(top: BorderSide(color: borderColor, width: 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SettingsScreen()),
                        );
                      },
                      icon: Icon(Icons.settings_outlined, size: 18, color: textSecondary),
                      label: Text(
                        'Ayarlar',
                        style: TextStyle(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    IconButton(
                      tooltip: switch (themeMode) {
                        ThemeModeType.oled => 'Açık Gündüz Modu',
                        ThemeModeType.dark => 'OLED / AMOLED Siyahı',
                        ThemeModeType.light => 'Sepya / Kâğıt Modu',
                        ThemeModeType.sepia => 'Telefona Uyum Sağla',
                        ThemeModeType.system => 'Koyu Gece Modu',
                      },
                      icon: Icon(
                        switch (themeMode) {
                          ThemeModeType.oled => Icons.dark_mode_rounded,
                          ThemeModeType.dark => Icons.nightlight_round,
                          ThemeModeType.light => Icons.light_mode_outlined,
                          ThemeModeType.sepia => Icons.auto_stories_outlined,
                          ThemeModeType.system => Icons.brightness_auto_outlined,
                        },
                        color: textSecondary,
                        size: 20,
                      ),
                      onPressed: () => ThemeService.instance.toggleTheme(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title, Color textColor) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 6),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required Color textPrimary,
    required Color textSecondary,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
      title: Text(
        title,
        style: TextStyle(color: textPrimary, fontSize: 13, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: textSecondary, fontSize: 10.5),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 12, color: textSecondary.withValues(alpha: 0.6)),
      onTap: onTap,
    );
  }
}
