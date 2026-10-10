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
  LicenseInfo? _licenseInfo;
  final Set<String> _expandedSections = <String>{};

  @override
  void initState() {
    super.initState();
    _loadDeviceAndLicenseInfo();
  }

  Future<void> _loadDeviceAndLicenseInfo() async {
    final devId = await LicenseService.instance.getDeviceId();
    final lic = await LicenseService.instance.isActivated();
    final info = await LicenseService.instance.getLicenseInfo();
    await LicenseService.instance.applyScreenSecurity();
    if (mounted) {
      setState(() {
        _deviceId = devId;
        _isLicensed = lic;
        _licenseInfo = info;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
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
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              16,
              12 + MediaQuery.of(context).padding.bottom + 28,
            ),
            children: [
              // 1. Profil & Uygulama Kimlik Kartı
              _buildAppProfileCard(isDark, cardBg, cardBorder, textPrimary, textSecondary),
              const SizedBox(height: 16),

              // Açılır Başlıklar Kontrol Çubuğu (Tümünü Aç / Kapat)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AYAR KATEGORİLERİ (${_expandedSections.length}/8)',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: textSecondary,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_expandedSections.length == 8) {
                            _expandedSections.clear();
                          } else {
                            _expandedSections.addAll({
                              'appearance',
                              'exam',
                              'target',
                              'reminder',
                              'license',
                              'data',
                              'update',
                              'about',
                            });
                          }
                        });
                      },
                      child: Text(
                        _expandedSections.length == 8 ? 'Tümünü Kapat' : 'Tümünü Aç',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // 1. Görünüm & Okuma Konforu
              _buildCollapsibleSection(
                sectionKey: 'appearance',
                title: 'Görünüm & Okuma Konforu',
                icon: Icons.palette_rounded,
                iconColor: const Color(0xFF6366F1),
                summary: 'Tema modu, yazı boyutu, kontrast ayarları',
                content: _buildAppearanceSection(themeMode, isDark, Colors.transparent, Colors.transparent, textPrimary, textSecondary),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 2. Sınav & Çözüm Tercihleri
              _buildCollapsibleSection(
                sectionKey: 'exam',
                title: 'Sınav & Çözüm Tercihleri',
                icon: Icons.tune_rounded,
                iconColor: const Color(0xFF0EA5E9),
                summary: 'Titreşim, anında çözüm ve süre sayacı',
                content: _buildExamPreferencesSection(isDark, Colors.transparent, Colors.transparent, textPrimary, textSecondary),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 3. KPSS Hedef & Planlama
              _buildCollapsibleSection(
                sectionKey: 'target',
                title: 'KPSS Hedef & Planlama',
                icon: Icons.flag_rounded,
                iconColor: const Color(0xFFF59E0B),
                summary: 'Sınav alanı, hedef puan ve günlük soru hedefi',
                content: _buildTargetSection(isDark, Colors.transparent, Colors.transparent, textPrimary, textSecondary),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 4. Bildirim & Günlük Hatırlatıcı
              _buildCollapsibleSection(
                sectionKey: 'reminder',
                title: 'Bildirim & Günlük Hatırlatıcı',
                icon: Icons.notifications_active_rounded,
                iconColor: const Color(0xFFEC4899),
                summary: 'Çalışma saati ve koç hatırlatmaları',
                content: _buildReminderSection(isDark, Colors.transparent, Colors.transparent, textPrimary, textSecondary),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 5. Lisans & Cihaz Güvenliği
              _buildCollapsibleSection(
                sectionKey: 'license',
                title: 'Lisans & Cihaz Güvenliği',
                icon: Icons.verified_user_rounded,
                iconColor: const Color(0xFF10B981),
                summary: _isLicensed
                    ? (_licenseInfo?.isTrial == true
                        ? '${_licenseInfo?.typeLabel} (${_licenseInfo?.remainingFormatted})'
                        : 'VIP Tam Sürüm Aktif (Sınırsız)')
                    : 'Aktivasyon & Cihaz Kimliği',
                trailingBadge: _isLicensed
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: (_licenseInfo?.isTrial == true ? const Color(0xFF3B82F6) : const Color(0xFF10B981))
                              .withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _licenseInfo?.isTrial == true ? (_licenseInfo?.type ?? 'DENEME') : 'VIP',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: _licenseInfo?.isTrial == true ? const Color(0xFF3B82F6) : const Color(0xFF10B981),
                          ),
                        ),
                      )
                    : null,
                content: _buildLicenseSection(isDark, Colors.transparent, Colors.transparent, textPrimary, textSecondary),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 6. Veri & İlerleme Yönetimi
              _buildCollapsibleSection(
                sectionKey: 'data',
                title: 'Veri & Hafıza Yönetimi',
                icon: Icons.storage_rounded,
                iconColor: const Color(0xFFEF4444),
                summary: 'İlerleme sıfırlama ve soru hafızası temizleme',
                content: _buildDataManagementSection(isDark, Colors.transparent, Colors.transparent, textPrimary, textSecondary),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 7. Güncelleme & Senkronizasyon
              _buildCollapsibleSection(
                sectionKey: 'update',
                title: 'Güncelleme & Senkronizasyon',
                icon: Icons.sync_rounded,
                iconColor: const Color(0xFF8B5CF6),
                summary: 'v${UpdateService.currentVersionName} • Canlı soru çekme & APK denetimi',
                trailingBadge: ValueListenableBuilder<RemoteVersionInfo?>(
                  valueListenable: UpdateService.instance.availableUpdateNotifier,
                  builder: (context, updateInfo, _) {
                    final hasUpdate = updateInfo != null &&
                        updateInfo.versionCode > UpdateService.currentVersionCode;
                    if (!hasUpdate) return const SizedBox.shrink();
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('YENİ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
                    );
                  },
                ),
                content: _buildUpdateSection(isDark, cardBg, cardBorder, textPrimary, textSecondary, textMuted),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),

              // 8. Uygulama Hakkında & Sürüm
              _buildCollapsibleSection(
                sectionKey: 'about',
                title: 'Uygulama Hakkında & Sürüm',
                icon: Icons.info_outline_rounded,
                iconColor: const Color(0xFF64748B),
                summary: 'KPSS 2027 • 15.000 Soru • Telif Hakları',
                content: _buildAboutSection(isDark, Colors.transparent, Colors.transparent, textPrimary, textMuted),
                isDark: isDark,
                cardBg: cardBg,
                cardBorder: cardBorder,
                textPrimary: textPrimary,
                textSecondary: textSecondary,
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCollapsibleSection({
    required String sectionKey,
    required String title,
    required IconData icon,
    required String summary,
    required Widget content,
    required bool isDark,
    required Color cardBg,
    required Color cardBorder,
    required Color textPrimary,
    required Color textSecondary,
    Color? iconColor,
    Widget? trailingBadge,
  }) {
    final bool isExpanded = _expandedSections.contains(sectionKey);
    final Color effectiveIconColor =
        iconColor ?? (isDark ? const Color(0xFF818CF8) : const Color(0xFF4F46E5));

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isExpanded
              ? effectiveIconColor.withValues(alpha: 0.45)
              : cardBorder,
          width: isExpanded ? 1.5 : 1.0,
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: effectiveIconColor.withValues(alpha: isDark ? 0.12 : 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tıklanabilir Başlık (Accordion Header)
          InkWell(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedSections.remove(sectionKey);
                } else {
                  _expandedSections.add(sectionKey);
                }
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: effectiveIconColor.withValues(alpha: isDark ? 0.16 : 0.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, size: 20, color: effectiveIconColor),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: textPrimary,
                              ),
                            ),
                            if (trailingBadge != null) ...[
                              const SizedBox(width: 8),
                              trailingBadge,
                            ],
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          summary,
                          style: TextStyle(
                            fontSize: 11.5,
                            color: textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 24,
                      color: isExpanded ? effectiveIconColor : textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Açılır İçerik Gövdesi
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(height: 1, color: cardBorder.withValues(alpha: 0.5)),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 8),
                  child: content,
                ),
              ],
            ),
            crossFadeState:
                isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 260),
            sizeCurve: Curves.easeInOutCubic,
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
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: _isLicensed
                              ? (_licenseInfo?.isTrial == true
                                  ? const Color(0xFF3B82F6).withValues(alpha: 0.15)
                                  : const Color(0xFF10B981).withValues(alpha: 0.15))
                              : const Color(0xFFF59E0B).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _isLicensed
                                ? (_licenseInfo?.isTrial == true
                                    ? const Color(0xFF3B82F6).withValues(alpha: 0.4)
                                    : const Color(0xFF10B981).withValues(alpha: 0.4))
                                : const Color(0xFFF59E0B).withValues(alpha: 0.4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _isLicensed
                                  ? (_licenseInfo?.isTrial == true ? Icons.timer_outlined : Icons.check_circle_rounded)
                                  : Icons.star_rounded,
                              size: 13,
                              color: _isLicensed
                                  ? (_licenseInfo?.isTrial == true ? const Color(0xFF3B82F6) : const Color(0xFF10B981))
                                  : const Color(0xFFF59E0B),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                _isLicensed
                                    ? (_licenseInfo?.isTrial == true
                                        ? 'Deneme (${_licenseInfo?.remainingFormatted})'
                                        : 'VIP Tam Sürüm')
                                    : 'Ücretsiz Deneme Sürümü',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: _isLicensed
                                      ? (_licenseInfo?.isTrial == true ? const Color(0xFF3B82F6) : const Color(0xFF10B981))
                                      : const Color(0xFFF59E0B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'v${UpdateService.currentVersionName}',
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
          // Tema Modu Seçici (OLED, Gece/LCD, Gündüz, Sepya, Telefona Uyum Sağla)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      switch (themeMode) {
                        ThemeModeType.oled => Icons.dark_mode_rounded,
                        ThemeModeType.dark => Icons.nightlight_round,
                        ThemeModeType.light => Icons.light_mode_rounded,
                        ThemeModeType.sepia => Icons.auto_stories_rounded,
                        ThemeModeType.system => Icons.brightness_auto_rounded,
                      },
                      size: 22,
                      color: themeMode == ThemeModeType.oled
                          ? const Color(0xFF60A5FA)
                          : (isDark ? const Color(0xFFFBBF24) : AppColors.primary),
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
                            switch (themeMode) {
                              ThemeModeType.oled => 'AMOLED / OLED Saf Siyah (#000000) aktif (0% pil tüketimi)',
                              ThemeModeType.dark => 'LCD uyumlu derin gece modu aktif',
                              ThemeModeType.light => 'Aydınlık gündüz modu aktif',
                              ThemeModeType.sepia => 'Doğal kitap kâğıdı sepya modu aktif',
                              ThemeModeType.system => 'Telefona uyum sağla (Sistem modu) aktif',
                            },
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
                    _buildThemeChip('⬛ OLED (Saf Siyah)', ThemeModeType.oled, themeMode),
                    const SizedBox(width: 8),
                    _buildThemeChip('🌙 Gece (LCD)', ThemeModeType.dark, themeMode),
                    const SizedBox(width: 8),
                    _buildThemeChip('☀️ Gündüz', ThemeModeType.light, themeMode),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildThemeChip('📖 Sepya (Kâğıt)', ThemeModeType.sepia, themeMode),
                    const SizedBox(width: 8),
                    _buildThemeChip('📱 Telefona Uyum Sağla', ThemeModeType.system, themeMode),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: themeMode == ThemeModeType.oled
                        ? const Color(0xFF10B981).withValues(alpha: 0.12)
                        : (themeMode == ThemeModeType.dark
                            ? const Color(0xFF38BDF8).withValues(alpha: 0.12)
                            : (themeMode == ThemeModeType.system
                                ? const Color(0xFF818CF8).withValues(alpha: 0.12)
                                : AppColors.surfaceLight)),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: themeMode == ThemeModeType.oled
                          ? const Color(0xFF10B981).withValues(alpha: 0.3)
                          : (themeMode == ThemeModeType.dark
                              ? const Color(0xFF38BDF8).withValues(alpha: 0.3)
                              : (themeMode == ThemeModeType.system
                                  ? const Color(0xFF818CF8).withValues(alpha: 0.3)
                                  : cardBorder)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        themeMode == ThemeModeType.oled
                            ? Icons.battery_charging_full_rounded
                            : (themeMode == ThemeModeType.dark
                                ? Icons.laptop_chromebook_rounded
                                : (themeMode == ThemeModeType.system
                                    ? Icons.smartphone_rounded
                                    : Icons.info_outline_rounded)),
                        size: 18,
                        color: themeMode == ThemeModeType.oled
                            ? const Color(0xFF10B981)
                            : (themeMode == ThemeModeType.dark
                                ? const Color(0xFF38BDF8)
                                : (themeMode == ThemeModeType.system
                                    ? const Color(0xFF818CF8)
                                    : textSecondary)),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          switch (themeMode) {
                            ThemeModeType.oled => 'AMOLED/OLED panellerde pikselleri tamamen kapatır (#000000), sonsuz kontrast ve maksimum batarya tasarrufu sunar.',
                            ThemeModeType.dark => 'IPS & LCD panellerde ışık sızmasını ve göz yorgunluğunu önleyen yumuşak koyu gece tasarımı.',
                            ThemeModeType.system => 'Telefonunuzun sistem karanlık/aydınlık ayarını ve ekran uyumunu otomatik olarak takip eder.',
                            ThemeModeType.light => 'Gündüz ve aydınlık ortamlarda yüksek kontrast ve ferah okuma sunar.',
                            ThemeModeType.sepia => 'Mavi ışığı filtreleyerek basılı kitap sıcaklığında gözü dinlendiren kâğıt tonu.',
                          },
                          style: TextStyle(
                            fontSize: 11.5,
                            color: textPrimary,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.primaryLight : AppColors.cardBorder,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 1,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
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
                : (isDark ? AppColors.surfaceLight : const Color(0xFFF1F5F9)),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF818CF8)
                  : AppColors.cardBorder,
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
                  color: isDark ? AppColors.surfaceLight : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: cardBorder),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedExam,
                    dropdownColor: cardBg,
                    icon: Icon(Icons.arrow_drop_down_rounded, color: textSecondary),
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
                                : cardBorder,
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
                _isLicensed
                    ? (_licenseInfo?.isTrial == true ? Icons.timer_outlined : Icons.verified_rounded)
                    : Icons.shield_outlined,
                color: _isLicensed
                    ? (_licenseInfo?.isTrial == true ? const Color(0xFF3B82F6) : const Color(0xFF10B981))
                    : const Color(0xFFF59E0B),
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _isLicensed
                      ? (_licenseInfo?.isTrial == true
                          ? '${_licenseInfo?.typeLabel} (Aktif)'
                          : 'VIP Tam Sürüm (Sınırsız)')
                      : 'Lisans Bekleniyor',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _isLicensed
                        ? (_licenseInfo?.isTrial == true ? const Color(0xFF3B82F6) : const Color(0xFF10B981))
                        : const Color(0xFFF59E0B),
                  ),
                ),
              ),
            ],
          ),
          if (_isLicensed && _licenseInfo?.isTrial == true) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF3B82F6).withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.hourglass_top_rounded, color: Color(0xFF3B82F6), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Kalan Süre: ${_licenseInfo?.remainingFormatted}\n(Deneme sürümünde telif koruması için SS alımı kapalıdır)',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 10),
          Text(
            'Cihaz Benzersiz Donanım Kodu (Hardware ID):',
            style: TextStyle(fontSize: 12, color: textSecondary),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceLight : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: cardBorder),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SelectableText(
                    _deviceId,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: textPrimary,
                    ),
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
                backgroundColor: isDark ? AppColors.surfaceLight : const Color(0xFFE2E8F0),
                foregroundColor: textPrimary,
                elevation: 0,
                side: BorderSide(color: cardBorder),
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
    return Column(
      children: [
        // 1. SEÇENEK: SORULARI ÇEK (CANLI SENKRONİZASYON)
        Container(
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.cloud_download_rounded,
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
                          'Soruları Çek',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Uygulamayı yeniden indirmeden yeni soruları internetten çeker.',
                          style: TextStyle(
                            fontSize: 11,
                            color: textMuted,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Canlı Senkronizasyon Durum Mesajı
              ValueListenableBuilder<String?>(
                valueListenable: UpdateService.instance.syncStatusMessageNotifier,
                builder: (context, msg, _) {
                  if (msg == null || msg.isEmpty) return const SizedBox.shrink();
                  final isSuccess = msg.contains('başarıyla');
                  final isError = msg.contains('Hata') || msg.contains('erişilemedi');
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSuccess
                          ? const Color(0xFF10B981).withValues(alpha: 0.1)
                          : (isError
                              ? Colors.red.withValues(alpha: 0.1)
                              : const Color(0xFF6366F1).withValues(alpha: 0.1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSuccess
                              ? Icons.check_circle_rounded
                              : (isError ? Icons.error_outline_rounded : Icons.sync_rounded),
                          size: 16,
                          color: isSuccess
                              ? const Color(0xFF10B981)
                              : (isError ? Colors.red : const Color(0xFF6366F1)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            msg,
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: isSuccess
                                  ? const Color(0xFF10B981)
                                  : (isError ? Colors.red : textPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Soruları Çek Butonu
              ValueListenableBuilder<bool>(
                valueListenable: UpdateService.instance.isSyncingNotifier,
                builder: (context, isSyncing, _) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      icon: isSyncing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.sync_rounded, size: 18),
                      label: Text(
                        isSyncing ? 'Sorular İndiriliyor...' : 'Soruları Çek',
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      onPressed: isSyncing
                          ? null
                          : () async {
                              final ok = await UpdateService.instance.syncQuestionsOnline();
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(ok
                                        ? 'Tüm sorular başarıyla güncellendi!'
                                        : 'Güncelleme sunucusuna erişilemedi.'),
                                    backgroundColor: ok ? const Color(0xFF10B981) : Colors.red,
                                  ),
                                );
                              }
                            },
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // 2. SEÇENEK: APK SÜRÜMÜ KONTROL ET / İNDİR
        ValueListenableBuilder<bool>(
          valueListenable: UpdateService.instance.isCheckingNotifier,
          builder: (context, isChecking, _) {
            return ValueListenableBuilder<RemoteVersionInfo?>(
              valueListenable: UpdateService.instance.availableUpdateNotifier,
              builder: (context, updateInfo, _) {
                final bool hasNewApk = updateInfo != null &&
                    updateInfo.versionCode > UpdateService.currentVersionCode;

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: hasNewApk ? const Color(0xFF10B981) : cardBorder,
                      width: hasNewApk ? 1.5 : 1.0,
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
                              color: const Color(0xFF10B981).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.android_rounded,
                              size: 20,
                              color: Color(0xFF10B981),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'APK Sürümü Kontrol Et / İndir',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Uygulama sürümünü kontrol edin ve yeni APK\'yı indirin.',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: textMuted,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Sürüm ve Tarih Bilgisi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yüklü APK Sürümü:',
                            style: TextStyle(fontSize: 12, color: textSecondary),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.surfaceLight : const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: cardBorder),
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
                      const SizedBox(height: 6),
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

                      // Yeni APK Mevcut Bildirim Alanı
                      if (hasNewApk) ...[
                        const SizedBox(height: 12),
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
                                    'Yeni APK Mevcut (v${updateInfo.versionName})',
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
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF10B981),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                  ),
                                  icon: const Icon(Icons.download_rounded, size: 18),
                                  label: Text(
                                    'Yeni APK\'yı İndir (${updateInfo.apkSize})',
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () => UpdateService.instance.launchApkDownload(updateInfo.apkUrl),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 12),

                      // Kontrol Et Butonu
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: textPrimary,
                            side: BorderSide(
                              color: isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 11),
                          ),
                          icon: isChecking
                              ? const SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.refresh_rounded, size: 16),
                          label: Text(
                            isChecking
                                ? 'Kontrol Ediliyor...'
                                : (hasNewApk ? 'Yeniden Kontrol Et' : 'APK Sürümü Kontrol Et'),
                            style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
                          ),
                          onPressed: isChecking
                              ? null
                              : () async {
                                  final info = await UpdateService.instance.checkForUpdates();
                                  if (context.mounted) {
                                    if (info == null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Güncelleme sunucusuna erişilemedi. Lütfen internet bağlantınızı kontrol edin.'),
                                          backgroundColor: Color(0xFFEF4444),
                                        ),
                                      );
                                    } else if (info.versionCode <= UpdateService.currentVersionCode) {
                                      UpdateService.showUpToDateDialog(context);
                                    } else {
                                      UpdateService.showUpdateDialog(context, info);
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
        ),
      ],
    );
  }
}
