import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/daily_motivation_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class DailyMotivationDialog extends StatefulWidget {
  final MotivationalQuote? initialQuote;

  const DailyMotivationDialog({super.key, this.initialQuote});

  static Future<void> show(BuildContext context, {MotivationalQuote? quote}) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => DailyMotivationDialog(initialQuote: quote),
    );
  }

  @override
  State<DailyMotivationDialog> createState() => _DailyMotivationDialogState();
}

class _DailyMotivationDialogState extends State<DailyMotivationDialog> with SingleTickerProviderStateMixin {
  late MotivationalQuote _currentQuote;
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _currentQuote = widget.initialQuote ?? DailyMotivationService.instance.getTodayQuote();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );

    _animController.forward();
    DailyMotivationService.instance.markQuoteAsShownToday();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final Color cardBg = isDark ? const Color(0xFF1E293B) : Colors.white;
        final Color borderColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
        final Color textPrimary = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
        final Color textSecondary = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          elevation: 0,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 380),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: borderColor, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 18, 22, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Üst Başlık & Kapatma Butonu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.auto_awesome_rounded, color: Color(0xFF6366F1), size: 16),
                              const SizedBox(width: 6),
                              Text(
                                'GÜNÜN SÖZÜ',
                                style: TextStyle(
                                  color: textSecondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                            icon: Icon(Icons.close_rounded, color: textSecondary, size: 18),
                            tooltip: 'Kapat',
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Söz Metni
                      Text(
                        '“${_currentQuote.quote}”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                          height: 1.45,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Yazar & Unvan
                      Text(
                        '— ${_currentQuote.author}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (_currentQuote.authorTitle.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          _currentQuote.authorTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),

                      // Sade 'Devam Et / Başla' Butonu
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Başla',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
