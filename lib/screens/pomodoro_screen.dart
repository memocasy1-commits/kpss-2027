import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/gamification_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import '../services/question_service.dart';
import 'exam_screen.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  static const int _workSeconds = 25 * 60;
  static const int _breakSeconds = 5 * 60;

  bool _isWorkTime = true;
  bool _isRunning = false;
  int _secondsLeft = _workSeconds;
  Timer? _timer;
  int _completedSessions = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_isRunning) return;
    setState(() => _isRunning = true);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
        _isRunning = false;
        HapticFeedback.vibrate();

        if (_isWorkTime) {
          _completedSessions++;
          GamificationService.instance.recordPomodoroCompleted();
          _showSessionCompletedDialog();
        } else {
          _showBreakCompletedDialog();
        }
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _secondsLeft = _isWorkTime ? _workSeconds : _breakSeconds;
    });
  }

  void _switchMode(bool toWork) {
    _timer?.cancel();
    setState(() {
      _isWorkTime = toWork;
      _isRunning = false;
      _secondsLeft = toWork ? _workSeconds : _breakSeconds;
    });
  }

  void _showSessionCompletedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.celebration_rounded, color: Color(0xFFF59E0B)),
            SizedBox(width: 8),
            Text('Tebrikler! 🎉', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          '25 dakikalık odaklanma seansını başarıyla tamamladın! Şimdi 5 dakikalık hak ettiğin bir mola verme zamanı.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _switchMode(false);
              _startTimer();
            },
            child: const Text('Molayı Başlat (5 dk)', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showBreakCompletedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.bolt_rounded, color: Color(0xFF4F46E5)),
            SizedBox(width: 8),
            Text('Mola Bitti! ⚡', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          'Zihnini tazeledin. Yeni bir soru çözme ve çalışma maratonuna hazır mısın?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _switchMode(true);
            },
            child: const Text('Hazırım, Çalışmaya Dön', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    final mins = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final secs = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
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

        final totalTarget = _isWorkTime ? _workSeconds : _breakSeconds;
        final double progress = 1.0 - (_secondsLeft / totalTarget);
        final Color activeColor = _isWorkTime ? const Color(0xFFEF4444) : const Color(0xFF10B981);

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              'Pomodoro Odak Zamanlayıcısı',
              style: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                // Mode Toggle Tabs
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: cardBorder),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _switchMode(true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: _isWorkTime ? const Color(0xFFEF4444) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '🎯 Odak Seansı (25 dk)',
                              style: TextStyle(
                                color: _isWorkTime ? Colors.white : textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _switchMode(false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: !_isWorkTime ? const Color(0xFF10B981) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '☕ Mola (5 dk)',
                              style: TextStyle(
                                color: !_isWorkTime ? Colors.white : textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),

                // Big Circular Timer
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 240,
                      height: 240,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 12,
                        backgroundColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                        valueColor: AlwaysStoppedAnimation<Color>(activeColor),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _formatTime(_secondsLeft),
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _isWorkTime ? 'DİKKATİNİ TOPLA' : 'DERİN NEFES AL',
                          style: TextStyle(
                            color: activeColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 36),

                // Control Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: _resetTimer,
                      icon: const Icon(Icons.replay_rounded),
                      iconSize: 28,
                      tooltip: 'Sıfırla',
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _isRunning ? _pauseTimer : _startTimer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: activeColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 28),
                          const SizedBox(width: 8),
                          Text(
                            _isRunning ? 'Duraklat' : 'Başlat',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Completed Counter Banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cardBorder),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.check_circle_outline_rounded, color: Color(0xFFEF4444), size: 24),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tamamlanan Seanslar',
                              style: TextStyle(color: textSecondary, fontSize: 12),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$_completedSessions Seans Odaklanıldı',
                              style: TextStyle(color: textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Quick Practice Shortcut
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      final qList = QuestionService.instance.getRandomPracticeQuestions(count: 15);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ExamScreen(
                            title: 'Odak Testi (15 Soru)',
                            questions: qList,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.flash_on_rounded, color: Color(0xFFF59E0B)),
                    label: const Text('Bu Seans İçin 15 Soru Çöz'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      side: BorderSide(color: cardBorder),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
