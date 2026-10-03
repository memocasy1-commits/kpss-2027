import 'dart:async';
import 'package:flutter/material.dart';
import '../data/bomb_game_data.dart';
import '../models/bomb_game_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class BombPlayScreen extends StatefulWidget {
  final String category; // 'all', 'tarih', 'cografya', 'vatandaslik'

  const BombPlayScreen({super.key, this.category = 'all'});

  @override
  State<BombPlayScreen> createState() => _BombPlayScreenState();
}

class _BombPlayScreenState extends State<BombPlayScreen> {
  late List<BombQuestion> _questions;
  int _currentIndex = 0;
  int _secondsLeft = 60;
  Timer? _timer;

  int _score = 0;
  int _correctCount = 0;
  int _wrongCount = 0;
  int _combo = 0;
  int _maxCombo = 0;

  bool _isGameOver = false;
  Color? _feedbackColor;

  // Track answered questions for review
  final List<Map<String, dynamic>> _answeredReview = [];

  @override
  void initState() {
    super.initState();
    BombGameData.loadQuestions().then((_) {
      if (mounted) {
        setState(() {
          _questions = BombGameData.getQuestions(category: widget.category);
        });
      }
    });
    _startNewGame();
  }

  void _startNewGame() {
    _questions = BombGameData.getQuestions(category: widget.category);
    _currentIndex = 0;
    _secondsLeft = 60;
    _score = 0;
    _correctCount = 0;
    _wrongCount = 0;
    _combo = 0;
    _maxCombo = 0;
    _isGameOver = false;
    _feedbackColor = null;
    _answeredReview.clear();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_secondsLeft <= 1) {
        _timer?.cancel();
        setState(() {
          _secondsLeft = 0;
          _isGameOver = true;
        });
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleAnswer(bool userAnswer) {
    if (_isGameOver || _currentIndex >= _questions.length) return;

    final q = _questions[_currentIndex];
    final isCorrect = (userAnswer == q.isTrue);

    setState(() {
      if (isCorrect) {
        _combo++;
        if (_combo > _maxCombo) _maxCombo = _combo;
        final comboBonus = (_combo - 1) * 10;
        _score += (100 + comboBonus);
        _correctCount++;
        _feedbackColor = const Color(0xFF10B981).withValues(alpha: 0.25);
      } else {
        _combo = 0;
        _wrongCount++;
        _feedbackColor = const Color(0xFFEF4444).withValues(alpha: 0.25);
      }

      _answeredReview.add({
        'question': q,
        'userAnswer': userAnswer,
        'isCorrect': isCorrect,
      });

      // Clear visual feedback shortly
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          setState(() {
            _feedbackColor = null;
          });
        }
      });

      // Move to next question or loop questions
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
      } else {
        // If run out of questions, shuffle and continue
        _questions = BombGameData.getQuestions(category: widget.category);
        _currentIndex = 0;
      }
    });
  }

  Color _getCategoryColor(String cat) {
    switch (cat.toLowerCase()) {
      case 'tarih':
        return const Color(0xFFD97706);
      case 'cografya':
        return const Color(0xFF059669);
      case 'vatandaslik':
        return const Color(0xFF7C3AED);
      default:
        return const Color(0xFF6366F1);
    }
  }

  String _getCategoryName(String cat) {
    switch (cat.toLowerCase()) {
      case 'tarih':
        return 'TARİH';
      case 'cografya':
        return 'COĞRAFYA';
      case 'vatandaslik':
        return 'VATANDAŞLIK';
      default:
        return 'GENEL KÜLTÜR';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        final bgColor = AppColors.background;
        final cardBg = AppColors.card;
        final cardBorder = AppColors.cardBorder;
        final textPrimary = AppColors.textPrimary;
        final textSecondary = AppColors.textSecondary;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              color: textPrimary,
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              '60 Saniye Bilgi Bombası',
              style: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.w800),
            ),
            actions: [
              IconButton(
                tooltip: 'Yeniden Başlat',
                icon: const Icon(Icons.refresh_rounded),
                color: textPrimary,
                onPressed: () {
                  _timer?.cancel();
                  _startNewGame();
                },
              ),
            ],
          ),
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            color: _feedbackColor ?? Colors.transparent,
            child: SafeArea(
              child: _isGameOver
                  ? _buildGameOverView(isDark, cardBg, cardBorder, textPrimary, textSecondary)
                  : _buildActiveGameView(isDark, cardBg, cardBorder, textPrimary, textSecondary),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActiveGameView(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    final currentQ = _questions[_currentIndex];
    final catColor = _getCategoryColor(currentQ.category);
    final catName = _getCategoryName(currentQ.category);

    final timerColor = _secondsLeft <= 10
        ? const Color(0xFFEF4444)
        : (_secondsLeft <= 25 ? const Color(0xFFF59E0B) : const Color(0xFF10B981));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          // Timer and Score Status Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: cardBorder, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Timer Badge
                    Row(
                      children: [
                        Icon(Icons.timer_rounded, color: timerColor, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          '$_secondsLeft sn',
                          style: TextStyle(
                            color: timerColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    // Combo Badge
                    if (_combo > 1)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.4)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.local_fire_department_rounded, color: Color(0xFFF59E0B), size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '$_combo x Kombo!',
                              style: const TextStyle(
                                color: Color(0xFFF59E0B),
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Score Badge
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('PUAN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: textSecondary)),
                        Text(
                          '$_score',
                          style: const TextStyle(
                            color: Color(0xFF6366F1),
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Timer Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: _secondsLeft / 60.0,
                    backgroundColor: cardBorder,
                    valueColor: AlwaysStoppedAnimation<Color>(timerColor),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Question Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: cardBorder, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: catColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school_rounded, size: 14, color: catColor),
                      const SizedBox(width: 5),
                      Text(
                        catName,
                        style: TextStyle(
                          color: catColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  currentQ.statement,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Bu önerme doğru mu, yanlış mı?',
                  style: TextStyle(color: textSecondary, fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Big Action Buttons: DOĞRU / YANLIŞ
          Row(
            children: [
              // YANLIŞ BUTONU (Kırmızı)
              Expanded(
                child: SizedBox(
                  height: 72,
                  child: ElevatedButton(
                    onPressed: () => _handleAnswer(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: const Color(0xFFEF4444).withValues(alpha: 0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close_rounded, size: 28),
                        SizedBox(width: 8),
                        Text(
                          'YANLIŞ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // DOĞRU BUTONU (Yeşil)
              Expanded(
                child: SizedBox(
                  height: 72,
                  child: ElevatedButton(
                    onPressed: () => _handleAnswer(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: const Color(0xFF10B981).withValues(alpha: 0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_rounded, size: 28),
                        SizedBox(width: 8),
                        Text(
                          'DOĞRU',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildGameOverView(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    final totalAnswered = _correctCount + _wrongCount;
    final accuracy = totalAnswered > 0 ? ((_correctCount / totalAnswered) * 100).toStringAsFixed(0) : '0';

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Result Header Banner
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEF4444), Color(0xFFDC2626), Color(0xFFB91C1C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(Icons.timer_off_rounded, color: Colors.white, size: 48),
                const SizedBox(height: 8),
                const Text(
                  'SÜRE DOLDU!',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1),
                ),
                const SizedBox(height: 4),
                Text(
                  '60 saniye boyunca harika bir mücadele verdin.',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 13),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.stars_rounded, color: Colors.amberAccent, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Toplam Skor: $_score Puan',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Stats Grid
          Row(
            children: [
              _buildStatCard('Doğru', '$_correctCount', const Color(0xFF10B981), cardBg, cardBorder, textSecondary),
              const SizedBox(width: 10),
              _buildStatCard('Yanlış', '$_wrongCount', const Color(0xFFEF4444), cardBg, cardBorder, textSecondary),
              const SizedBox(width: 10),
              _buildStatCard('Başarı', '%$accuracy', const Color(0xFF6366F1), cardBg, cardBorder, textSecondary),
              const SizedBox(width: 10),
              _buildStatCard('Maks Kombo', '${_maxCombo}x', const Color(0xFFF59E0B), cardBg, cardBorder, textSecondary),
            ],
          ),
          const SizedBox(height: 24),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Oyunlar Menüsü'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: textPrimary,
                    side: BorderSide(color: cardBorder, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _startNewGame,
                  icon: const Icon(Icons.replay_rounded),
                  label: const Text('Tekrar Oyna'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          // Question Review Section
          Row(
            children: [
              const Icon(Icons.menu_book_rounded, color: Color(0xFF6366F1), size: 20),
              const SizedBox(width: 8),
              Text(
                'SORU VE ALTIN BİLGİ ANALİZİ (${_answeredReview.length} Soru)',
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _answeredReview.length,
            itemBuilder: (context, index) {
              final item = _answeredReview[index];
              final BombQuestion q = item['question'] as BombQuestion;
              final bool isCorrect = item['isCorrect'] as bool;
              final bool userAns = item['userAnswer'] as bool;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isCorrect
                        ? const Color(0xFF10B981).withValues(alpha: 0.4)
                        : const Color(0xFFEF4444).withValues(alpha: 0.4),
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                          color: isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444),
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isCorrect ? 'DOĞRU CEVAPLADIN' : 'HATALI CEVAPLADIN (Cevabın: ${userAns ? 'Doğru' : 'Yanlış'})',
                          style: TextStyle(
                            color: isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(q.category).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _getCategoryName(q.category),
                            style: TextStyle(
                              color: _getCategoryColor(q.category),
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      q.statement,
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '💡 ${q.explanation}',
                        style: TextStyle(
                          color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                          fontSize: 11,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    Color color,
    Color cardBg,
    Color cardBorder,
    Color textSecondary,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardBorder, width: 1.2),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: TextStyle(color: textSecondary, fontSize: 10, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
