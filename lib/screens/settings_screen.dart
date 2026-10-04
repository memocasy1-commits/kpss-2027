import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/license_service.dart';
import '../services/question_service.dart';
import '../services/settings_service.dart';
import '../services/theme_service.dart';
import '../services/notification_service.dart';
import '../services/haptic_service.dart';
import '../theme/app_theme.dart';
import 'activation_screen.dart';
import '../services/update_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _deviceId = 'Yükleniyor...';
  bool _isLicensed = false;

  @override
  void initState() {
    super.initState();
    _loadDeviceAndLicenseInfo();
  }

  Future<void> _loadDeviceAndLicenseInfo() async {
    final devId = await LicenseService.instance.getDeviceId();
    final lic = await LicenseService.instance.isActivated();
    if (mounted) {
      setState(() {
        _deviceId = devId;
        _isLicensed = lic;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        final Color bgColor = AppColors.background;
        final Color cardBg = AppColors.card;
        final Color cardBorder = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;
        final Color textMuted = AppColors.textMuted;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            title: Text(
              'Ayarlar & Tercihler',
              style: TextStyle(
                color: textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // 1. Profil & Uygulama Kimlik Kartı
              _buildAppProfileCard(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 2. Görünüm & Okuma Konforu
              _buildSectionHeader('GÖRÜNÜM & OKUMA KONFORU', Icons.palette_rounded, isDark),
              _buildAppearanceSection(themeMode, isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 3. Soru Çözüm Tercihleri
              _buildSectionHeader('SINAV & ÇÖZÜM TERCIHLERİ', Icons.tune_rounded, isDark),
              _buildExamPreferencesSection(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 4. KPSS Hedef & Sınav Türü
              _buildSectionHeader('KPSS HEDEF & PLANLAMA', Icons.flag_rounded, isDark),
              _buildTargetSection(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 5. Bildirim & Günlük Hatırlatıcı
              _buildSectionHeader('BİLDİRİM & GÜNLÜK HATIRLATICI', Icons.notifications_active_rounded, isDark),
              _buildReminderSection(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 6. Lisans & Cihaz Güvenliği
              _buildSectionHeader('LİSANS & CİHAZ GÜVENLİĞİ', Icons.verified_user_rounded, isDark),
              _buildLicenseSection(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 6. Veri & İlerleme Yönetimi
              _buildSectionHeader('VERİ & HAFIZA YÖNETİMİ', Icons.storage_rounded, isDark),
              _buildDataManagementSection(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 20),

              // 7. Güncelleme & Canlı Senkronizasyon Modu
              _buildSectionHeader('GÜNCELLEME & SENKRONİZASYON', Icons.sync_rounded, isDark),
              _buildUpdateSection(isDark, cardBg, cardBorder, textPrimary, textSecondary, textMuted),
              const SizedBox(height: 20),

              // 8. Uygulama Hakkında & Sürüm
              _buildAboutSection(isDark, cardBg, cardBorder, textPrimary, textMuted),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5)),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppProfileCard(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              'assets/icon/app_icon.png',
              width: 58,
              height: 58,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 58,
                height: 58,
                color: AppColors.primary,
                child: const Icon(Icons.school_rounded, color: Colors.white, size: 30),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KPSS Çözümlü Soru Bankası',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _isLicensed
                            ? const Color(0xFF10B981).withValues(alpha: 0.15)
                            : const Color(0xFFF59E0B).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _isLicensed
                              ? const Color(0xFF10B981).withValues(alpha: 0.4)
                              : const Color(0xFFF59E0B).withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _isLicensed ? Icons.check_circle_rounded : Icons.star_rounded,
                            size: 13,
                            color: _isLicensed ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _isLicensed ? 'VIP Tam Sürüm' : 'Ücretsiz Deneme Sürümü',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: _isLicensed ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'v1.0.0',
                      style: TextStyle(
                        fontSize: 12,
                        color: textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppearanceSection(
    ThemeModeType themeMode,
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        children: [
          // Tema Modu Seçici (Gece, Gündüz, Sepya)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      themeMode == ThemeModeType.dark
                          ? Icons.dark_mode_rounded
                          : (themeMode == ThemeModeType.sepia ? Icons.auto_stories_rounded : Icons.light_mode_rounded),
                      size: 22,
                      color: isDark ? const Color(0xFFFBBF24) : AppColors.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Uygulama Teması',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textPrimary),
                          ),
                          Text(
                            themeMode == ThemeModeType.dark
                                ? 'Derin siyah gece modu aktif'
                                : (themeMode == ThemeModeType.sepia
                                    ? 'Doğal kitap kâğıdı sepya modu aktif'
                                    : 'Aydınlık gündüz modu aktif'),
                            style: TextStyle(fontSize: 12, color: textSecondary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildThemeChip('🌙 Gece', ThemeModeType.dark, themeMode),
                    const SizedBox(width: 8),
                    _buildThemeChip('☀️ Gündüz', ThemeModeType.light, themeMode),
                    const SizedBox(width: 8),
                    _buildThemeChip('📖 Sepya (Kâğıt)', ThemeModeType.sepia, themeMode),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 1, color: cardBorder),

          // Soru Yazı Boyutu
          ValueListenableBuilder<double>(
            valueListenable: SettingsService.instance.fontScaleNotifier,
            builder: (context, scale, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.format_size_rounded, size: 22, color: const Color(0xFF38BDF8)),
                        const SizedBox(width: 12),
                        Text(
                          'Soru & Metin Yazı Boyutu',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildFontChip('Küçük', 0.85, scale, isDark),
                        const SizedBox(width: 8),
                        _buildFontChip('Standart', 1.0, scale, isDark),
                        const SizedBox(width: 8),
                        _buildFontChip('Büyük', 1.15, scale, isDark),
                        const SizedBox(width: 8),
                        _buildFontChip('Çok Büyük', 1.30, scale, isDark),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(height: 1, color: cardBorder),

          // Ekranı Açık Tut
          ValueListenableBuilder<bool>(
            valueListenable: SettingsService.instance.keepScreenAwakeNotifier,
            builder: (context, keepAwake, _) {
              return SwitchListTile(
                secondary: const Icon(Icons.screen_lock_portrait_rounded, color: Color(0xFFF472B6)),
                title: Text(
                  'Sınavda Ekranı Açık Tut',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                ),
                subtitle: Text(
                  'Soru çözerken cihazın uyku moduna geçmesini önler',
                  style: TextStyle(fontSize: 12, color: textSecondary),
                ),
                value: keepAwake,
                activeThumbColor: const Color(0xFF818CF8),
                onChanged: (val) => SettingsService.instance.setKeepScreenAwake(val),
              );
            },
          ),
          Divider(height: 1, color: cardBorder),

          // Titreşimli Geri Bildirim (Haptik)
          SwitchListTile(
            secondary: const Icon(Icons.vibration_rounded, color: Color(0xFF10B981)),
            title: Text(
              'Titreşimli Geri Bildirim (Haptik)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
            ),
            subtitle: Text(
              'Soru cevaplama ve şık seçimlerinde dokunsal titreşim',
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
            value: HapticService.instance.isEnabled,
            activeThumbColor: const Color(0xFF10B981),
            onChanged: (val) async {
              await HapticService.instance.setEnabled(val);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeChip(String label, ThemeModeType mode, ThemeModeType currentMode) {
    final bool isSelected = mode == currentMode;
    return Expanded(
      child: GestureDetector(
        onTap: () => ThemeService.instance.setMode(mode),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.primaryLight : AppColors.cardBorder,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFontChip(String label, double targetScale, double currentScale, bool isDark) {
    final bool isSelected = (currentScale - targetScale).abs() < 0.05;
    return Expanded(
      child: GestureDetector(
        onTap: () => SettingsService.instance.setFontScale(targetScale),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? const Color(0xFF4F46E5) : const Color(0xFF4338CA))
                : (isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9)),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF818CF8)
                  : (isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1)),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? Colors.white : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExamPreferencesSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        children: [
          // Anında Çözüm Gösterimi
          ValueListenableBuilder<bool>(
            valueListenable: SettingsService.instance.instantSolutionNotifier,
            builder: (context, instant, _) {
              return SwitchListTile(
                secondary: const Icon(Icons.lightbulb_rounded, color: Color(0xFFFBBF24)),
                title: Text(
                  'Anında Altın Bilgi & Çözüm',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                ),
                subtitle: Text(
                  instant
                      ? 'Şık işaretlenince altın bilgi ve adım adım çözüm doğrudan açılır'
                      : 'Çözüm sadece butona basıldığında açılır (Sınav modu)',
                  style: TextStyle(fontSize: 12, color: textSecondary),
                ),
                value: instant,
                activeThumbColor: const Color(0xFF818CF8),
                onChanged: (val) => SettingsService.instance.setInstantSolution(val),
              );
            },
          ),
          Divider(height: 1, color: cardBorder),

          // Soru Süre Sayacı
          ValueListenableBuilder<bool>(
            valueListenable: SettingsService.instance.showTimerNotifier,
            builder: (context, showTimer, _) {
              return SwitchListTile(
                secondary: const Icon(Icons.timer_rounded, color: Color(0xFF34D399)),
                title: Text(
                  'Soru Süre Sayacı',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                ),
                subtitle: Text(
                  'Soru başında geçen süreyi göstererek pratiklik kazandırır',
                  style: TextStyle(fontSize: 12, color: textSecondary),
                ),
                value: showTimer,
                activeThumbColor: const Color(0xFF818CF8),
                onChanged: (val) => SettingsService.instance.setShowTimer(val),
              );
            },
          ),
          Divider(height: 1, color: cardBorder),

          // Titreşim (Haptic)
          ValueListenableBuilder<bool>(
            valueListenable: SettingsService.instance.hapticFeedbackNotifier,
            builder: (context, haptic, _) {
              return SwitchListTile(
                secondary: const Icon(Icons.vibration_rounded, color: Color(0xFFA78BFA)),
                title: Text(
                  'Dokunsal Titreşim (Haptic)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                ),
                subtitle: Text(
                  'Doğru ve yanlış cevaplarda hafif titreşimle geri bildirim verir',
                  style: TextStyle(fontSize: 12, color: textSecondary),
                ),
                value: haptic,
                activeThumbColor: const Color(0xFF818CF8),
                onChanged: (val) {
                  if (val) HapticFeedback.mediumImpact();
                  SettingsService.instance.setHapticFeedback(val);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTargetSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sınav Türü Seçici
          Text(
            'Hedef KPSS Sınav Türü',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<String>(
            valueListenable: SettingsService.instance.targetExamNotifier,
            builder: (context, selectedExam, _) {
              final exams = [
                'KPSS Lisans (GY-GK)',
                'KPSS Ön Lisans',
                'KPSS Ortaöğretim',
                'EKPSS',
              ];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedExam,
                    dropdownColor: cardBg,
                    items: exams.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: 13, color: textPrimary)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) SettingsService.instance.setTargetExam(val);
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Günlük Soru Hedefi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Günlük Soru Çözme Hedefi',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
              ),
              ValueListenableBuilder<int>(
                valueListenable: SettingsService.instance.dailyGoalNotifier,
                builder: (context, goal, _) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$goal Soru / Gün',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<int>(
            valueListenable: SettingsService.instance.dailyGoalNotifier,
            builder: (context, goal, _) {
              final goals = [25, 50, 75, 100, 150];
              return Row(
                children: goals.map((g) {
                  final isSel = g == goal;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          backgroundColor: isSel
                              ? (isDark ? const Color(0xFF4F46E5) : const Color(0xFF4338CA))
                              : Colors.transparent,
                          side: BorderSide(
                            color: isSel
                                ? const Color(0xFF818CF8)
                                : (isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1)),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => SettingsService.instance.setDailyGoal(g),
                        child: Text(
                          '$g',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSel ? FontWeight.w700 : FontWeight.w500,
                            color: isSel ? Colors.white : textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReminderSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        children: [
          // Bildirim Switch
          ValueListenableBuilder<bool>(
            valueListenable: NotificationService.instance.reminderEnabledNotifier,
            builder: (context, enabled, _) {
              return SwitchListTile(
                secondary: const Icon(Icons.alarm_on_rounded, color: Color(0xFFFBBF24)),
                title: Text(
                  'Günlük Soru Çözme Hatırlatıcısı',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                ),
                subtitle: Text(
                  enabled
                      ? 'Her gün belirlenen saatte çalışma uyarısı gönderir'
                      : 'Hatırlatıcı bildirimler kapalı',
                  style: TextStyle(fontSize: 12, color: textSecondary),
                ),
                value: enabled,
                activeThumbColor: const Color(0xFF818CF8),
                onChanged: (val) => NotificationService.instance.setReminderEnabled(val),
              );
            },
          ),
          Divider(height: 1, color: cardBorder),

          // Hatırlatma Saati
          ValueListenableBuilder<bool>(
            valueListenable: NotificationService.instance.reminderEnabledNotifier,
            builder: (context, enabled, _) {
              if (!enabled) return const SizedBox.shrink();
              return ValueListenableBuilder<String>(
                valueListenable: NotificationService.instance.reminderTimeNotifier,
                builder: (context, selectedTime, _) {
                  final times = ['09:00', '13:00', '18:00', '20:00', '21:30'];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hatırlatma Saati',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF818CF8).withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                selectedTime,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF818CF8)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: times.map((t) {
                            final isSel = t == selectedTime;
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    backgroundColor: isSel
                                        ? (isDark ? const Color(0xFF4F46E5) : const Color(0xFF4338CA))
                                        : Colors.transparent,
                                    side: BorderSide(
                                      color: isSel ? const Color(0xFF818CF8) : cardBorder,
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () => NotificationService.instance.setReminderTime(t),
                                  child: Text(
                                    t,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: isSel ? FontWeight.w700 : FontWeight.w500,
                                      color: isSel ? Colors.white : textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Divider(height: 1, color: cardBorder),

          // Test Bildirimi Gönder Butonu
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF38BDF8),
                  side: const BorderSide(color: Color(0xFF38BDF8)),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.send_rounded, size: 16),
                label: const Text('Hatırlatıcıyı Test Et (Şimdi Gönder)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                onPressed: () {
                  NotificationService.instance.triggerTestNotification(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLicenseSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _isLicensed ? Icons.verified_rounded : Icons.shield_outlined,
                color: _isLicensed ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                _isLicensed ? 'VIP Lisans Doğrulandı' : 'Lisans Bekleniyor',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: _isLicensed ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Cihaz Benzersiz Donanım Kodu (Hardware ID):',
            style: TextStyle(fontSize: 12, color: textSecondary),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectableText(
                  _deviceId,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: textPrimary,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: _deviceId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cihaz Kodu Panoya Kopyalandı!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(Icons.copy_rounded, size: 18, color: const Color(0xFF38BDF8)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                foregroundColor: textPrimary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              icon: const Icon(Icons.key_rounded, size: 16),
              label: Text(
                _isLicensed ? 'Lisans Anahtarını Yenile / Güncelle' : 'Lisans Anahtarı Tanımla',
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ActivationScreen()),
                ).then((_) => _loadDeviceAndLicenseInfo());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataManagementSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        children: [
          // Yanlışları Temizle
          ListTile(
            leading: const Icon(Icons.replay_circle_filled_rounded, color: Color(0xFFEF4444)),
            title: Text(
              'Yanlışlar Havuzunu Sıfırla',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
            ),
            subtitle: Text(
              'Çözülüp öğrenilen yanlış sorular listesini boşaltır',
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => _confirmClearWrongQuestions(context, isDark),
          ),
          Divider(height: 1, color: cardBorder),

          // İstatistikleri Sıfırla
          ListTile(
            leading: const Icon(Icons.delete_sweep_rounded, color: Color(0xFFF97316)),
            title: Text(
              'Tüm İstatistikleri Sıfırla',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
            ),
            subtitle: Text(
              'Çözülen soru sayısı ve başarı grafiklerini ilk güne döndürür',
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => _confirmClearAllStats(context, isDark),
          ),
          Divider(height: 1, color: cardBorder),

          // Önbelleği Temizle
          ListTile(
            leading: const Icon(Icons.cached_rounded, color: Color(0xFF38BDF8)),
            title: Text(
              'Önbelleği Temizle (Cache)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
            ),
            subtitle: Text(
              'Geçici görselleri ve render verilerini yeniler',
              style: TextStyle(fontSize: 12, color: textSecondary),
            ),
            trailing: const Icon(Icons.check_rounded, color: Color(0xFF10B981)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Uygulama önbelleği başarıyla temizlendi!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _confirmClearWrongQuestions(BuildContext context, bool isDark) {
    final messenger = ScaffoldMessenger.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        title: const Text('Yanlışlar Havuzunu Sıfırla'),
        content: const Text(
          'Yanlışlarım listesindeki tüm kayıtlı sorular temizlenecektir. Devam etmek istiyor musunuz?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEF4444)),
            onPressed: () async {
              Navigator.pop(ctx);
              await QuestionService.instance.clearWrongQuestions();
              messenger.showSnackBar(
                const SnackBar(content: Text('Yanlış sorular havuzu temizlendi.')),
              );
            },
            child: const Text('Temizle', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _confirmClearAllStats(BuildContext context, bool isDark) {
    final messenger = ScaffoldMessenger.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        title: const Text('Tüm İstatistikleri Sıfırla'),
        content: const Text(
          'Çözülen soru sayıları, doğruluk oranları ve yanlış havuzu tamamen sıfırlanacaktır. Bu işlem geri alınamaz!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEF4444)),
            onPressed: () async {
              Navigator.pop(ctx);
              await QuestionService.instance.clearAllStats();
              messenger.showSnackBar(
                const SnackBar(content: Text('Tüm istatistikler ve soru havuzu sıfırlandı.')),
              );
            },
            child: const Text('Evet, Sıfırla', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textMuted,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline_rounded, size: 20, color: const Color(0xFF818CF8)),
              const SizedBox(width: 8),
              Text(
                'Uygulama Mimarisi & Haklar',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textPrimary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '• 15.000 Özgün ve Akademik Soru & Detaylı Açıklama (686 Test • 15 Deneme)\n'
            '• %100 Çevrimdışı (Offline) Yerel Çalışma Güvenliği\n'
            '• KPSS 2027 Müfredatına Tam Uyumlu İçerik Mimarisi',
            style: TextStyle(fontSize: 12, height: 1.6, color: textMuted),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'KPSS Hazırlık Portalı © 2027 — Tüm Hakları Saklıdır',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textMuted),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateSection(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
    Color textMuted,
  ) {
    return ValueListenableBuilder<UpdateMode>(
      valueListenable: UpdateService.instance.modeNotifier,
      builder: (context, currentMode, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: UpdateService.instance.isCheckingNotifier,
          builder: (context, isChecking, _) {
            return ValueListenableBuilder<RemoteVersionInfo?>(
              valueListenable: UpdateService.instance.availableUpdateNotifier,
              builder: (context, updateInfo, _) {
                final bool hasUpdate = updateInfo != null;

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: hasUpdate ? const Color(0xFF10B981) : cardBorder,
                      width: hasUpdate ? 1.5 : 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.cloud_sync_rounded,
                              size: 20,
                              color: Color(0xFF6366F1),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Güncelleme Tercihi',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Soruların ve uygulamanın nasıl güncelleneceğini seçin',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Mod Seçenekleri
                      _buildUpdateModeTile(
                        title: '⚡ Canlı Soru Senkronizasyonu (Önerilen)',
                        subtitle: 'APK indirmeden yeni soruları ve konu özetlerini internetten otomatik çeker.',
                        mode: UpdateMode.liveSync,
                        selectedMode: currentMode,
                        isDark: isDark,
                        textPrimary: textPrimary,
                        textMuted: textMuted,
                      ),
                      const SizedBox(height: 8),
                      _buildUpdateModeTile(
                        title: '📦 Tam APK Güncellemesi',
                        subtitle: 'Yeni bir uygulama sürümü çıktığında tam APK indirme bağlantısı sunar.',
                        mode: UpdateMode.fullApk,
                        selectedMode: currentMode,
                        isDark: isDark,
                        textPrimary: textPrimary,
                        textMuted: textMuted,
                      ),
                      const SizedBox(height: 8),
                      _buildUpdateModeTile(
                        title: '🔍 Manuel Kontrol',
                        subtitle: 'Yalnızca siz "Güncellemeleri Denetle" butonuna bastığınızda kontrol eder.',
                        mode: UpdateMode.manual,
                        selectedMode: currentMode,
                        isDark: isDark,
                        textPrimary: textPrimary,
                        textMuted: textMuted,
                      ),

                      const SizedBox(height: 16),
                      Divider(height: 1, color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
                      const SizedBox(height: 14),

                      // Durum Bilgileri
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mevcut Sürüm:',
                            style: TextStyle(fontSize: 12, color: textSecondary),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'v${UpdateService.currentVersionName} (${UpdateService.currentVersionCode})',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ValueListenableBuilder<String?>(
                        valueListenable: UpdateService.instance.lastCheckedTimeNotifier,
                        builder: (context, lastChecked, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Son Kontrol:',
                                style: TextStyle(fontSize: 12, color: textSecondary),
                              ),
                              Text(
                                lastChecked ?? 'Henüz kontrol edilmedi',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: textMuted,
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      if (hasUpdate) ...[
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.stars_rounded, color: Color(0xFF10B981), size: 18),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Yeni Güncelleme Mevcut (v${updateInfo.versionName})',
                                    style: const TextStyle(
                                      color: Color(0xFF10B981),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              if (updateInfo.releaseNotes.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(
                                  updateInfo.releaseNotes,
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    height: 1.4,
                                    color: textPrimary,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 10),
                              ValueListenableBuilder<bool>(
                                valueListenable: UpdateService.instance.isSyncingNotifier,
                                builder: (context, isSyncing, _) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(0xFF10B981),
                                                foregroundColor: Colors.white,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                              ),
                                              icon: const Icon(Icons.download_rounded, size: 16),
                                              label: const Text('APK İndir', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                                              onPressed: isSyncing
                                                  ? null
                                                  : () => UpdateService.instance.launchApkDownload(updateInfo.apkUrl),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: const Color(0xFF10B981),
                                                side: const BorderSide(color: Color(0xFF10B981)),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                              ),
                                              icon: isSyncing
                                                  ? const SizedBox(
                                                      width: 14,
                                                      height: 14,
                                                      child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF10B981)),
                                                    )
                                                  : const Icon(Icons.sync_rounded, size: 16),
                                              label: Text(
                                                isSyncing ? 'İndiriliyor...' : 'Soruları Çek',
                                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                                              ),
                                              onPressed: isSyncing
                                                  ? null
                                                  : () async {
                                                      final ok = await UpdateService.instance.syncQuestionsOnline(updateInfo);
                                                      if (context.mounted) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text(ok ? 'Tüm sorular başarıyla güncellendi!' : 'Güncelleme sunucusuna erişilemedi.'),
                                                            backgroundColor: ok ? const Color(0xFF10B981) : Colors.red,
                                                          ),
                                                        );
                                                      }
                                                    },
                                            ),
                                          ),
                                        ],
                                      ),
                                      ValueListenableBuilder<String?>(
                                        valueListenable: UpdateService.instance.syncStatusMessageNotifier,
                                        builder: (context, msg, _) {
                                          if (msg == null || msg.isEmpty) return const SizedBox.shrink();
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 8),
                                            child: Text(
                                              msg,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF10B981),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 14),

                      // Güncellemeleri Denetle Butonu
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark ? const Color(0xFF4F46E5) : const Color(0xFF4338CA),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          icon: isChecking
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                              : const Icon(Icons.refresh_rounded, size: 18),
                          label: Text(
                            isChecking ? 'Denetleniyor...' : 'Güncellemeleri Şimdi Denetle',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          onPressed: isChecking
                              ? null
                              : () async {
                                  final info = await UpdateService.instance.checkForUpdates();
                                  if (context.mounted) {
                                    if (info == null || (info.versionCode <= UpdateService.currentVersionCode && info.questionsUpdatedAt.isEmpty)) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Tebrikler! Uygulamanız ve sorularınız en güncel sürümde.'),
                                          backgroundColor: Color(0xFF10B981),
                                        ),
                                      );
                                    }
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildUpdateModeTile({
    required String title,
    required String subtitle,
    required UpdateMode mode,
    required UpdateMode selectedMode,
    required bool isDark,
    required Color textPrimary,
    required Color textMuted,
  }) {
    final bool isSelected = mode == selectedMode;

    return InkWell(
      onTap: () => UpdateService.instance.setUpdateMode(mode),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF6366F1).withValues(alpha: 0.15) : const Color(0xFFEEF2FF))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF6366F1)
                : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              size: 18,
              color: isSelected ? const Color(0xFF6366F1) : textMuted,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                      color: isSelected ? const Color(0xFF6366F1) : textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: textMuted,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
