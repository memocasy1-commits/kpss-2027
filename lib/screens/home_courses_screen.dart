import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/license_service.dart';
import '../services/question_service.dart';
import 'activation_screen.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../widgets/app_drawer.dart';
import '../widgets/exit_confirmation_dialog.dart';
import 'soru_bankalari_screen.dart';
import 'deneme_list_screen.dart';
import 'settings_screen.dart';
import 'wrong_questions_screen.dart';
import 'stats_screen.dart';
import 'exam_screen.dart';
import '../services/security_service.dart';
import 'question_search_screen.dart';
import 'spaced_repetition_screen.dart';
import 'games_hub_screen.dart';
import 'lecture_hub_screen.dart';
import '../services/update_service.dart';
import '../services/study_plan_service.dart';
import 'study_coach_screen.dart';
import '../services/daily_motivation_service.dart';
import '../widgets/daily_motivation_dialog.dart';

class HomeCoursesScreen extends StatefulWidget {
  const HomeCoursesScreen({super.key});

  @override
  State<HomeCoursesScreen> createState() => _HomeCoursesScreenState();
}

class _HomeCoursesScreenState extends State<HomeCoursesScreen> {
  Map<String, int> _stats = {'solved': 0, 'correct': 0, 'wrong': 0, 'wrongPool': 0};
  Map<String, dynamic> _lastStudied = {};
  Map<String, dynamic> _streakData = {'streak': 0, 'solvedToday': false};
  bool _isLoading = true;
  bool _isUpdateBannerDismissed = false;
  static bool _hasShownUpdateDialogInSession = false;

  Timer? _revocationTimer;

  static const List<Map<String, String>> _dailyTips = [
    {
      'tag': 'VATANDAŞLIK',
      'tip': 'Anayasa Mahkemesi üyeleri 12 yıllığına seçilir; bir kimse iki defa AYM üyesi seçilemez.'
    },
    {
      'tag': 'TARİH',
      'tip': 'Divanü Lügati\'t-Türk, Kaşgarlı Mahmud tarafından Abbasi Halifesi el-Muktedî\'ye sunulmuş ilk Türkçe sözlüktür.'
    },
    {
      'tag': 'COĞRAFYA',
      'tip': 'Türkiye\'de rüzgâr erozyonu en fazla İç Anadolu ve Güneydoğu\'da; su erozyonu ise Karadeniz ve Akdeniz\'dedir.'
    },
    {
      'tag': 'TÜRKÇE',
      'tip': 'Fiilimsiler fiil çekim eklerini alamaz; yan cümlecik kurarak temel cümlenin bir ögesi olurlar.'
    },
    {
      'tag': 'TARİH',
      'tip': 'Osmanlı\'da ilk resmî gazete Takvim-i Vekayi, ilk yarı resmî gazete Ceride-i Havadis\'tir.'
    },
    {
      'tag': 'VATANDAŞLIK',
      'tip': 'TBMM seçimleri 5 yılda bir yapılır; savaş sebebiyle ertelemeye yalnızca TBMM 1 yıl süreyle karar verebilir.'
    },
    {
      'tag': 'COĞRAFYA',
      'tip': 'Kuzey Anadolu Dağları ve Toroslar orojenez (kıvrılma), Ege dağları ise kırılma (horst-graben) ile oluşmuştur.'
    },
    {
      'tag': 'TÜRKÇE',
      'tip': 'Açık yapıt ve polifoni (çokseslilik) kavramları; metnin tek bir anlama değil, okurun yorumuna açık olduğunu savunur.'
    },
  ];

  Map<String, String> get _currentDailyTip {
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    return _dailyTips[dayOfYear % _dailyTips.length];
  }

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
    _setupUpdateListener();
    _setupRevocationListener();
    _checkDailyMotivation();
  }

  void _setupRevocationListener() {
    LicenseService.instance.licenseRevokedNotifier.addListener(_onLicenseRevokedChanged);
    // Açılışta uzaktan iptal listesini hemen kontrol et
    LicenseService.instance.checkRevocation();
    // Arka planda 2 dakikada bir düzenli kontrol sağla
    _revocationTimer = Timer.periodic(const Duration(minutes: 2), (_) {
      LicenseService.instance.checkRevocation();
    });
  }

  void _onLicenseRevokedChanged() {
    if (LicenseService.instance.licenseRevokedNotifier.value && mounted) {
      _handleRevokedUI();
    }
  }

  void _handleRevokedUI() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: const [
              Icon(Icons.block_rounded, color: Color(0xFFEF4444), size: 28),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Lisansınız İptal Edildi',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                ),
              ),
            ],
          ),
          content: const Text(
            'Bu cihazın lisansı yönetici tarafından iptal edilmiştir.\n\nUygulamayı kullanabilmek için lütfen yönetici ile iletişime geçip yeni bir lisans anahtarı edininiz.',
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const ActivationScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF4444),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Lisans Ekranına Dön', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _checkDailyMotivation() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final shouldShow = await DailyMotivationService.instance.shouldShowDailyQuote();
      if (shouldShow && mounted) {
        final info = UpdateService.instance.availableUpdateNotifier.value;
        final bool hasNewApk = info != null && info.versionCode > UpdateService.currentVersionCode;
        if (!hasNewApk) {
          DailyMotivationDialog.show(context);
        }
      }
    });
  }

  void _setupUpdateListener() {
    UpdateService.instance.availableUpdateNotifier.addListener(_onUpdateAvailableChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndPromptUpdate(UpdateService.instance.availableUpdateNotifier.value);
    });
  }

  void _onUpdateAvailableChanged() {
    final info = UpdateService.instance.availableUpdateNotifier.value;
    _checkAndPromptUpdate(info);
  }

  void _checkAndPromptUpdate(RemoteVersionInfo? info) {
    if (!mounted || info == null) return;
    final bool hasNewApk = info.versionCode > UpdateService.currentVersionCode;
    if (hasNewApk && !_hasShownUpdateDialogInSession) {
      _hasShownUpdateDialogInSession = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          UpdateService.showUpdateDialog(context, info);
        }
      });
    }
  }

  @override
  void dispose() {
    _revocationTimer?.cancel();
    LicenseService.instance.licenseRevokedNotifier.removeListener(_onLicenseRevokedChanged);
    UpdateService.instance.availableUpdateNotifier.removeListener(_onUpdateAvailableChanged);
    super.dispose();
  }

  Future<void> _loadDashboardData() async {
    final s = await QuestionService.instance.getStats();
    final last = await QuestionService.instance.getLastStudied();
    final streak = await QuestionService.instance.getStreakData();
    if (mounted) {
      setState(() {
        _stats = s;
        _lastStudied = last;
        _streakData = streak;
        _isLoading = false;
      });
    }
  }

  int _calculateDaysLeft() {
    final now = DateTime.now();
    DateTime examDate = DateTime(2027, 7, 18);
    if (now.isAfter(examDate)) {
      examDate = DateTime(2028, 7, 18);
    }
    final difference = examDate.difference(now).inDays;
    return difference > 0 ? difference : 0;
  }

  void _resumeLastStudied() async {
    final courseId = _lastStudied['courseId'] as String? ?? 'tarih';
    final courseTitle = _lastStudied['courseTitle'] as String? ?? 'Tarih Soru Bankası';
    final testNum = _lastStudied['testNum'] as int? ?? 1;

    final canAccess = await SecurityService.instance.canAccessTest(testNum);
    if (!canAccess) {
      if (mounted) {
        SecurityService.instance.showLicenseLockDialog(
          context: context,
          featureTitle: '$courseTitle - Test $testNum',
          onActivated: _loadDashboardData,
        );
      }
      return;
    }

    final questions = QuestionService.instance.getQuestionsForTest(courseId, testNum);
    if (questions.isNotEmpty) {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ExamScreen(
              title: '$courseTitle - Test $testNum',
              questions: questions,
            ),
          ),
        ).then((_) => _loadDashboardData());
      }
    } else {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SoruBankalariScreen()),
        ).then((_) => _loadDashboardData());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final Color bgColor = AppColors.background;
        final Color surfaceBg = AppColors.surface;
        final Color borderColor = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;
        final Color brandNavy = AppColors.primary;

        final int wrongCount = _stats['wrongPool'] ?? 0;
        final int solved = _stats['solved'] ?? 0;
        final int correct = _stats['correct'] ?? 0;
        final int daysLeft = _calculateDaysLeft();
        final int streak = _streakData['streak'] as int? ?? 0;
        final double accuracy = solved > 0 ? ((correct / solved) * 100) : 0.0;
        final dailyTip = _currentDailyTip;

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            final shouldExit = await ExitConfirmationDialog.show(context);
            if (shouldExit) {
              SystemNavigator.pop();
            }
          },
          child: Scaffold(
            backgroundColor: bgColor,
            drawer: const AppDrawer(),
            appBar: AppBar(
              backgroundColor: surfaceBg,
              elevation: 0,
              leading: Builder(
                builder: (ctx) => IconButton(
                  tooltip: 'Menü',
                  icon: Icon(Icons.menu_rounded, color: textPrimary, size: 24),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
              titleSpacing: 0,
              shape: Border(bottom: BorderSide(color: borderColor, width: 1)),
              title: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: surfaceBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor),
                    ),
                    child: Icon(Icons.school_outlined, color: brandNavy, size: 19),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'KPSS AKADEMİ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Çalışma Masası & Performans',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                // Tema Döngüsü: Gece / Gündüz / Sepya (Kâğıt Modu)
                IconButton(
                  tooltip: themeMode == ThemeModeType.dark
                      ? 'Gündüz Modu'
                      : (themeMode == ThemeModeType.light
                          ? 'Sepya / Kâğıt Modu'
                          : 'Karanlık Mod'),
                  icon: Icon(
                    themeMode == ThemeModeType.dark
                        ? Icons.light_mode_outlined
                        : (themeMode == ThemeModeType.light
                            ? Icons.auto_stories_outlined
                            : Icons.dark_mode_outlined),
                    color: textSecondary,
                    size: 21,
                  ),
                  onPressed: () => ThemeService.instance.toggleTheme(),
                ),
                IconButton(
                  tooltip: '15.000 Soru İçi Arama',
                  icon: Icon(Icons.search_rounded, color: textSecondary, size: 22),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuestionSearchScreen()),
                    );
                  },
                ),
                // Yeni Güncelleme Rozet Butonu
                ValueListenableBuilder<RemoteVersionInfo?>(
                  valueListenable: UpdateService.instance.availableUpdateNotifier,
                  builder: (context, updateInfo, _) {
                    final hasUpdate = updateInfo != null &&
                        updateInfo.versionCode > UpdateService.currentVersionCode;
                    if (!hasUpdate) return const SizedBox.shrink();
                    return IconButton(
                      tooltip: 'Yeni Güncelleme Mevcut: v${updateInfo.versionName} (${updateInfo.apkSize})',
                      icon: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.system_update_rounded, color: Color(0xFF10B981), size: 22),
                          Positioned(
                            right: -2,
                            top: -2,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF10B981),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => UpdateService.showUpdateDialog(context, updateInfo),
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Sistem & Ayarlar',
                  icon: Icon(Icons.settings_outlined, color: textSecondary, size: 21),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    ).then((_) => _loadDashboardData());
                  },
                ),
                const SizedBox(width: 4),
              ],
            ),
            body: _isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                : RefreshIndicator(
                    onRefresh: _loadDashboardData,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.fromLTRB(
                        16.0,
                        16.0,
                        16.0,
                        16.0 + MediaQuery.of(context).padding.bottom + 28.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 0. BÖLÜM: YENİ GÜNCELLEME BİLDİRİM KARTI
                          ValueListenableBuilder<RemoteVersionInfo?>(
                            valueListenable: UpdateService.instance.availableUpdateNotifier,
                            builder: (context, updateInfo, _) {
                              final hasUpdate = updateInfo != null &&
                                  updateInfo.versionCode > UpdateService.currentVersionCode;
                              if (!hasUpdate || _isUpdateBannerDismissed) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: _buildUpdateNotificationBanner(
                                  updateInfo: updateInfo,
                                  isDark: themeMode.isDark,
                                  textPrimary: textPrimary,
                                  textSecondary: textSecondary,
                                ),
                              );
                            },
                          ),

                          // 1. BÖLÜM: 2027 KPSS HEDEF & PERFORMANS KARTI (GÜNÜN HAP BİLGİSİ İLE)
                          _buildCountdownCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                            brandNavy: brandNavy,
                            daysLeft: daysLeft,
                            solved: solved,
                            accuracy: accuracy,
                            streak: streak,
                            dailyTip: dailyTip,
                          ),
                          const SizedBox(height: 14),

                          // 2. BÖLÜM: "KALDIĞIN YERDEN DEVAM ET" KARTI
                          _buildResumeCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                            brandNavy: brandNavy,
                            onTap: _resumeLastStudied,
                          ),
                          const SizedBox(height: 14),

                          // 2.5 BÖLÜM: AKILLI PLANLAMA KOÇU ÖZET KARTI
                          _buildStudyCoachCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                          ),
                          const SizedBox(height: 20),

                          // 3. BÖLÜM: TEMEL ÇALIŞMA ALANLARI (2 BÜYÜK PRESTİJLİ KART)
                          Text(
                            'TEMEL ÇALIŞMA ALANLARI',
                            style: TextStyle(
                              color: themeMode.isDark
                                  ? const Color(0xFFA5B4FC)
                                  : (themeMode == ThemeModeType.sepia
                                      ? const Color(0xFF92400E)
                                      : const Color(0xFF475569)),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Kart 1: Modüler Soru Bankaları
                          _buildMajorActionCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                            accentColor: AppColors.courseBlue,
                            icon: Icons.menu_book_outlined,
                            badge: '${QuestionService.formatNumber(QuestionService.instance.totalQuestionCount)} SORU • ${QuestionService.instance.totalCourseTestCount} TEST',
                            title: 'Modüler Soru Bankaları',
                            subtitle: 'Tarih, Coğrafya, Vatandaşlık, Türkçe, Matematik ve Mantık müfredatı.',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SoruBankalariScreen()),
                              ).then((_) => _loadDashboardData());
                            },
                          ),
                          const SizedBox(height: 12),

                          // Kart 2: 120 Soruluk ÖSYM Denemeleri
                          _buildMajorActionCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                            accentColor: AppColors.courseGreen,
                            icon: Icons.assignment_outlined,
                            badge: '${QuestionService.instance.denemeExams.length} DENEME • ${QuestionService.formatNumber(QuestionService.instance.totalDenemeQuestionCount)} SORU',
                            title: 'ÖSYM Deneme Sınavları',
                            subtitle: '120 Soru ve 130 Dakika tam zamanlı ÖSYM sınav simülasyonu ve puan karnesi.',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const DenemeListScreen()),
                              ).then((_) => _loadDashboardData());
                            },
                          ),
                          const SizedBox(height: 12),

                          // Kart 3: İnteraktif Konu Anlatımı & Kütüphane
                          _buildMajorActionCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                            accentColor: const Color(0xFF0284C7),
                            icon: Icons.import_contacts_rounded,
                            badge: 'TÜRKÇE AKTİF • 10 KONU MODÜLÜ',
                            title: 'İnteraktif Konu Anlatımı',
                            subtitle: 'ÖSYM tuzakları, altın kurallar, karşılaştırma tabloları ve test entegrasyonu.',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const LectureHubScreen()),
                              ).then((_) => _loadDashboardData());
                            },
                          ),
                          const SizedBox(height: 22),

                          // 4. BÖLÜM: HIZLI DURUM VE TELAFİ ŞERİDİ (3 FERAH KART)
                          Text(
                            'HIZLI DURUM & TELAFİ',
                            style: TextStyle(
                              color: themeMode.isDark
                                  ? const Color(0xFFA5B4FC)
                                  : (themeMode == ThemeModeType.sepia
                                      ? const Color(0xFF92400E)
                                      : const Color(0xFF475569)),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Row(
                            children: [
                              // Hata Defteri
                              Expanded(
                                child: _buildStatusCard(
                                  surfaceBg: surfaceBg,
                                  borderColor: borderColor,
                                  textPrimary: textPrimary,
                                  textSecondary: textSecondary,
                                  title: 'Hata Defteri',
                                  subtitle: wrongCount > 0 ? '$wrongCount Hata' : 'Hata Yok',
                                  icon: Icons.fact_check_outlined,
                                  iconColor: const Color(0xFFEF4444),
                                  badgeColor: wrongCount > 0 ? const Color(0xFFEF4444) : const Color(0xFF10B981),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const WrongQuestionsScreen()),
                                    ).then((_) => _loadDashboardData());
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),

                              // Eksik & Net Analizi
                              Expanded(
                                child: _buildStatusCard(
                                  surfaceBg: surfaceBg,
                                  borderColor: borderColor,
                                  textPrimary: textPrimary,
                                  textSecondary: textSecondary,
                                  title: 'Net Analizi',
                                  subtitle: solved > 0 ? '%${accuracy.toStringAsFixed(0)} Başarı' : 'Karne',
                                  icon: Icons.analytics_outlined,
                                  iconColor: AppColors.courseBlue,
                                  badgeColor: AppColors.courseBlue,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const StatsScreen()),
                                    ).then((_) => _loadDashboardData());
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),

                              // Hafıza Tekrarı (Leitner)
                              Expanded(
                                child: _buildStatusCard(
                                  surfaceBg: surfaceBg,
                                  borderColor: borderColor,
                                  textPrimary: textPrimary,
                                  textSecondary: textSecondary,
                                  title: 'Hafıza Tekrarı',
                                  subtitle: 'Aralıklı Tekrar',
                                  icon: Icons.psychology_rounded,
                                  iconColor: const Color(0xFF0D9488),
                                  badgeColor: const Color(0xFF0D9488),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const SpacedRepetitionScreen()),
                                    ).then((_) => _loadDashboardData());
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // 5. BÖLÜM: HAFIZA VE PRATİK ATÖLYESİ KARTI
                          _buildMajorActionCard(
                            surfaceBg: surfaceBg,
                            borderColor: borderColor,
                            textPrimary: textPrimary,
                            textSecondary: textSecondary,
                            accentColor: const Color(0xFF6D28D9),
                            icon: Icons.extension_outlined,
                            badge: '5 ZİHİN EGZERSİZİ • 5.000+ KART',
                            title: 'Hafıza & Pratik Atölyesi',
                            subtitle: 'Dilsiz harita nokta atışı, kronoloji, 3 ipuçlu bilgi, kavram eşleştirme ve 60 sn bomba.',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const GamesHubScreen()),
                              ).then((_) => _loadDashboardData());
                            },
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  // --- KART YAPILANDIRICILARI ---

  Widget _buildUpdateNotificationBanner({
    required RemoteVersionInfo updateInfo,
    required bool isDark,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF064E3B), const Color(0xFF065F46)]
              : [const Color(0xFFD1FAE5), const Color(0xFFA7F3D0)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF10B981).withValues(alpha: 0.7),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withValues(alpha: isDark ? 0.3 : 0.15),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF10B981).withValues(alpha: 0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YENİ GÜNCELLEME MEVCUT! (v${updateInfo.versionName})',
                      style: TextStyle(
                        color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF047857),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Yeni sürüm hazır • Boyut: ${updateInfo.apkSize}',
                      style: TextStyle(
                        color: isDark ? Colors.white70 : const Color(0xFF065F46),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: isDark ? Colors.white70 : const Color(0xFF065F46),
                ),
                tooltip: 'Bildirimi Gizle',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  setState(() {
                    _isUpdateBannerDismissed = true;
                  });
                },
              ),
            ],
          ),
          if (updateInfo.releaseNotes.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              updateInfo.releaseNotes,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                color: isDark ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF1F2937),
                height: 1.35,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: const Icon(Icons.download_rounded, size: 17),
                  label: Text(
                    'APK İndir (${updateInfo.apkSize})',
                    style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800),
                  ),
                  onPressed: () => UpdateService.instance.launchApkDownload(updateInfo.apkUrl),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? Colors.white : const Color(0xFF047857),
                  side: BorderSide(
                    color: isDark ? const Color(0xFF34D399) : const Color(0xFF059669),
                    width: 1.2,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                ),
                onPressed: () => UpdateService.showUpdateDialog(context, updateInfo),
                child: const Text(
                  'Detaylar',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownCard({
    required Color surfaceBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color brandNavy,
    required int daysLeft,
    required int solved,
    required double accuracy,
    required int streak,
    required Map<String, String> dailyTip,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: brandNavy.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: brandNavy.withValues(alpha: 0.2)),
                      ),
                      child: Icon(Icons.event_available_outlined, color: brandNavy, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2027 KPSS LİSANS HEDEFİ',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Hedefe $daysLeft Gün Kaldı',
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🔥', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 4),
                    Text(
                      '$streak Gün Seri',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('ÇÖZÜLEN', '$solved Soru', textPrimary, textSecondary),
                Container(height: 22, width: 1, color: borderColor),
                _buildStatColumn(
                  'BAŞARI ORANI',
                  solved > 0 ? '%${accuracy.toStringAsFixed(1)}' : '%0',
                  textPrimary,
                  textSecondary,
                ),
                Container(height: 22, width: 1, color: borderColor),
                _buildStatColumn('HEDEF NET', '85+ Net', brandNavy, textSecondary),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Günün Hap Bilgisi & İlham Şeridi (Dokununca Günün Sözü & Tavsiyesi açılır)
          InkWell(
            onTap: () => DailyMotivationDialog.show(context),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: brandNavy.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: brandNavy.withValues(alpha: 0.15)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: brandNavy,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      dailyTip['tag'] ?? 'BİLGİ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      dailyTip['tip'] ?? '',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.35,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.auto_awesome_rounded, size: 14, color: brandNavy.withValues(alpha: 0.7)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color valColor, Color textSecondary) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: textSecondary,
            fontSize: 9.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: valColor,
            fontSize: 13.5,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildResumeCard({
    required Color surfaceBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color brandNavy,
    required VoidCallback onTap,
  }) {
    final hasData = _lastStudied.isNotEmpty && _lastStudied['courseTitle'] != null;
    final courseTitle = hasData ? _lastStudied['courseTitle'] as String : 'Tarih Soru Bankası';
    final testNum = hasData ? _lastStudied['testNum'] as int : 1;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: surfaceBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFF047857).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF047857).withValues(alpha: 0.25)),
              ),
              child: const Icon(Icons.play_arrow_rounded, color: Color(0xFF047857), size: 26),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KALDIĞIN YERDEN DEVAM ET',
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$courseTitle • Test $testNum',
                    style: TextStyle(
                      color: textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: brandNavy,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Başlat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMajorActionCard({
    required Color surfaceBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color accentColor,
    required IconData icon,
    required String badge,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: surfaceBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: accentColor.withValues(alpha: 0.35), width: 1.2),
              ),
              child: Icon(icon, color: accentColor, size: 26),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: accentColor.withValues(alpha: 0.35), width: 1),
                    ),
                    child: Text(
                      badge,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      color: textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right_rounded, color: textSecondary, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard({
    required Color surfaceBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color badgeColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: surfaceBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: textPrimary,
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                color: badgeColor,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildStudyCoachCard({
    required Color surfaceBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    final hasPlan = StudyPlanService.instance.hasActivePlan;
    final plan = StudyPlanService.instance.currentPlan;

    return Container(
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF6366F1).withValues(alpha: 0.35), width: 1.2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StudyCoachScreen()),
            ).then((_) => setState(() {}));
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF6366F1).withValues(alpha: 0.25)),
                  ),
                  child: const Icon(Icons.psychology_rounded, color: Color(0xFF6366F1), size: 26),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Akıllı Planlama Koçu',
                              style: TextStyle(
                                color: textPrimary,
                                fontWeight: FontWeight.w900,
                                fontSize: 13.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              hasPlan ? 'AKTİF' : 'YENİ',
                              style: const TextStyle(
                                color: Color(0xFF6366F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 9.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        hasPlan
                            ? 'Hedef: ${plan!.goal.targetScore}+ Puan • Gün ${plan.currentDayNumber}/${plan.totalDays} • ${plan.currentStudyDay.completedCount}/${plan.currentStudyDay.missions.length} Görev'
                            : 'Hedefine göre günlük soru ve konu programı',
                        style: TextStyle(color: textSecondary, fontSize: 11.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Color(0xFF6366F1), size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
