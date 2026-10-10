import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/daily_motivation_service.dart';
import '../services/haptic_service.dart';
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
  bool _copied = false;

  @override
  void initState() {
    super.initState();
    _currentQuote = widget.initialQuote ?? DailyMotivationService.instance.getTodayQuote();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
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

  void _nextQuote() {
    HapticFeedback.selectionClick();
    setState(() {
      _currentQuote = DailyMotivationService.instance.getRandomQuote();
      _copied = false;
    });
    _animController.forward(from: 0.3);
  }

  void _copyQuote() {
    HapticService.instance.success();
    final text = '"${_currentQuote.quote}"\n— ${_currentQuote.author} (${_currentQuote.authorTitle})\n\nKPSS Soru Bankası & Akıllı Koç';
    Clipboard.setData(ClipboardData(text: text));
    setState(() => _copied = true);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle_rounded, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text('Söz panoya kopyalandı!'),
          ],
        ),
        backgroundColor: const Color(0xFF10B981),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
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
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          elevation: 0,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 440),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: borderColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6366F1).withValues(alpha: isDark ? 0.3 : 0.18),
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Top Header: Badge & Close Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.auto_awesome_rounded, color: Color(0xFFFDE047), size: 14),
                                  const SizedBox(width: 5),
                                  Text(
                                    _currentQuote.category.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              visualDensity: VisualDensity.compact,
                              icon: Icon(Icons.close_rounded, color: textSecondary, size: 20),
                              tooltip: 'Kapat',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Glowing Emblem
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6366F1).withValues(alpha: 0.45),
                                blurRadius: 18,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.format_quote_rounded,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Title
                        Text(
                          'Günün İlhamı & Başarı Sözü',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Quote Text
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '“${_currentQuote.quote}”',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 16.5,
                              fontWeight: FontWeight.w800,
                              height: 1.5,
                              letterSpacing: 0.2,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Author Card
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person_pin_rounded,
                                color: const Color(0xFF6366F1),
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _currentQuote.author,
                                      style: TextStyle(
                                        color: textPrimary,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      _currentQuote.authorTitle,
                                      style: TextStyle(
                                        color: textSecondary,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w500,
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
                        const SizedBox(height: 16),

                        // KPSS Daily Action Tip Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF59E0B).withValues(alpha: isDark ? 0.12 : 0.08),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xFFF59E0B).withValues(alpha: isDark ? 0.35 : 0.25),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(Icons.lightbulb_rounded, color: Color(0xFFF59E0B), size: 18),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'GÜNÜN KPSS TAVSİYESİ',
                                      style: TextStyle(
                                        color: Color(0xFFF59E0B),
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      _currentQuote.actionTip,
                                      style: TextStyle(
                                        color: textPrimary,
                                        fontSize: 12,
                                        height: 1.35,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Action Buttons
                        Row(
                          children: [
                            // Next Quote Button
                            IconButton.outlined(
                              onPressed: _nextQuote,
                              icon: const Icon(Icons.shuffle_rounded, size: 20),
                              tooltip: 'Farklı Söz Göster',
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: borderColor),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.all(12),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // Copy Quote Button
                            IconButton.outlined(
                              onPressed: _copyQuote,
                              icon: Icon(_copied ? Icons.check_rounded : Icons.copy_rounded, size: 20),
                              tooltip: 'Sözü Kopyala',
                              color: _copied ? const Color(0xFF10B981) : textSecondary,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: borderColor),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.all(12),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // Primary 'Güne Başla' Button
                            Expanded(
                              child: Container(
                                height: 46,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    HapticFeedback.selectionClick();
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  icon: const Icon(Icons.bolt_rounded, color: Colors.white, size: 18),
                                  label: const Text(
                                    'Güne Başla & Çöz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
