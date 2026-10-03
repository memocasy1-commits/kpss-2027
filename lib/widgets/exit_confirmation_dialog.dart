import 'package:flutter/material.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  /// Şık ve animasyonlu çıkış onay diyaloğunu açar.
  /// Çıkış onaylandıysa `true`, iptal edildiyse `false` döner.
  static Future<bool> show(BuildContext context) async {
    final result = await showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'ExitConfirmation',
      barrierColor: Colors.black.withValues(alpha: 0.65),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (ctx, anim1, anim2) => const ExitConfirmationDialog(),
      transitionBuilder: (ctx, anim, secondaryAnim, child) {
        final curvedValue = CurvedAnimation(
          parent: anim,
          curve: Curves.easeOutBack,
        ).value;
        return Transform.scale(
          scale: 0.85 + (0.15 * curvedValue),
          child: Opacity(
            opacity: anim.value.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        final Color surfaceBg = AppColors.surface;
        final Color borderColor = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;
        final Color cardInnerBg = AppColors.background;

        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 380),
            decoration: BoxDecoration(
              color: surfaceBg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: borderColor, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. ÜST İKON ROZETİ (GLOW EFEKTLİ)
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.35),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 18),

                // 2. BAŞLIK
                Text(
                  'Uygulamadan Çıkılsın mı?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 8),

                // 3. AÇIKLAMA / MOTİVASYON
                Text(
                  'Bugünkü KPSS çalışma hedeflerinizi tamamlamadan ayrılmak üzeresiniz. Tüm ilerlemeniz ve istatistikleriniz otomatik olarak kaydedildi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 16),

                // 4. KÜÇÜK DURUM & İSTATİSTİK ŞERİDİ
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: cardInnerBg,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: borderColor, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMiniBadge(
                        icon: Icons.local_fire_department_rounded,
                        iconColor: const Color(0xFFF97316),
                        title: 'Günlük Seri',
                        value: 'Korumada',
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: borderColor,
                      ),
                      _buildMiniBadge(
                        icon: Icons.library_books_rounded,
                        iconColor: const Color(0xFF2563EB),
                        title: 'Soru Havuzu',
                        value: '${QuestionService.formatNumber(QuestionService.instance.grandTotalQuestionCount)} Soru',
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: borderColor,
                      ),
                      _buildMiniBadge(
                        icon: Icons.cloud_done_rounded,
                        iconColor: const Color(0xFF10B981),
                        title: 'Veri Kaydı',
                        value: '%100 Güvenli',
                        textPrimary: textPrimary,
                        textSecondary: textSecondary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // 5. BİRİNCİL BUTON: "ÇALIŞMAYA DEVAM ET" (VURGULU)
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      shadowColor: const Color(0xFF2563EB).withValues(alpha: 0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow_rounded, size: 22),
                        SizedBox(width: 8),
                        Text(
                          'Çalışmaya Devam Et',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // 6. İKİNCİL BUTON: "UYGULAMADAN ÇIK"
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: OutlinedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                      foregroundColor: isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                      side: BorderSide(
                        color: isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.power_settings_new_rounded,
                          size: 18,
                          color: isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Uygulamadan Çık',
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            color: isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMiniBadge({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: iconColor),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w800,
            color: textPrimary,
          ),
        ),
      ],
    );
  }
}
