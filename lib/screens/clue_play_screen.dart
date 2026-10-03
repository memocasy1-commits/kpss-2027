import 'dart:math';
import 'package:flutter/material.dart';
import '../data/clue_game_data.dart';
import '../models/clue_game_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class CluePlayScreen extends StatefulWidget {
  final String category; // 'all', 'tarih', 'cografya', 'vatandaslik'

  const CluePlayScreen({super.key, this.category = 'all'});

  @override
  State<CluePlayScreen> createState() => _CluePlayScreenState();
}

class _CluePlayScreenState extends State<CluePlayScreen> {
  static const int _totalRoundQuestions = 10;

  late List<ClueQuestion> _pool;
  late List<ClueQuestion> _roundQuestions;
  int _currentIndex = 0;

  int _revealedClues = 1; // 1, 2, or 3
  String? _selectedOption;
  bool _isAnswered = false;

  int _totalScore = 0;
  int _correctCount = 0;
  int _streak = 0;
  int _maxStreak = 0;
  int _firstClueWins = 0;

  bool _isGameOver = false;

  // Review history
  final List<Map<String, dynamic>> _reviewList = [];

  @override
  void initState() {
    super.initState();
    ClueGameData.loadQuestions().then((_) {
      if (mounted) {
        setState(() {
          _pool = ClueGameData.getQuestions(category: widget.category);
          _startNewRound();
        });
      }
    });
    _pool = ClueGameData.getQuestions(category: widget.category);
    _startNewRound();
  }

  void _startNewRound() {
    final list = List<ClueQuestion>.from(_pool);
    list.shuffle(Random());
    _roundQuestions = list.take(_totalRoundQuestions).toList();
    _currentIndex = 0;
    _totalScore = 0;
    _correctCount = 0;
    _streak = 0;
    _maxStreak = 0;
    _firstClueWins = 0;
    _isGameOver = false;
    _reviewList.clear();
    _resetForNextQuestion();
  }

  void _resetForNextQuestion() {
    _revealedClues = 1;
    _selectedOption = null;
    _isAnswered = false;
  }

  ClueQuestion? get _currentQuestion {
    if (_roundQuestions.isEmpty || _currentIndex >= _roundQuestions.length) {
      return null;
    }
    return _roundQuestions[_currentIndex];
  }

  int get _currentPossiblePoints {
    switch (_revealedClues) {
      case 1:
        return 300;
      case 2:
        return 200;
      case 3:
      default:
        return 100;
    }
  }

  void _revealNextClue() {
    if (_revealedClues < 3 && !_isAnswered) {
      setState(() {
        _revealedClues++;
      });
    }
  }

  void _handleOptionSelect(String option) {
    if (_isAnswered || _currentQuestion == null) return;

    final q = _currentQuestion!;
    final isCorrect = option == q.answer;
    final earnedPoints = isCorrect ? _currentPossiblePoints : 0;

    setState(() {
      _isAnswered = true;
      _selectedOption = option;

      if (isCorrect) {
        _correctCount++;
        _streak++;
        if (_streak > _maxStreak) _maxStreak = _streak;
        if (_revealedClues == 1) _firstClueWins++;

        // Bonus for streak
        final streakBonus = (_streak > 1) ? (_streak - 1) * 20 : 0;
        _totalScore += earnedPoints + streakBonus;
      } else {
        _streak = 0;
      }

      _reviewList.add({
        'question': q,
        'selected': option,
        'isCorrect': isCorrect,
        'earnedPoints': earnedPoints,
        'cluesUsed': _revealedClues,
      });
    });
  }

  void _goToNextQuestion() {
    if (_currentIndex + 1 < _roundQuestions.length) {
      setState(() {
        _currentIndex++;
        _resetForNextQuestion();
      });
    } else {
      setState(() {
        _isGameOver = true;
      });
    }
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
        return const Color(0xFFF59E0B);
    }
  }

  String _getCategoryLabel(String cat) {
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
          body: SafeArea(
            child: _isGameOver
                ? _buildGameOverScreen(isDark, cardBg, cardBorder, textPrimary, textSecondary)
                : _buildPlayScreen(isDark, cardBg, cardBorder, textPrimary, textSecondary),
          ),
        );
      },
    );
  }

  Widget _buildPlayScreen(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    final q = _currentQuestion;
    if (q == null) {
      return Center(
        child: CircularProgressIndicator(color: const Color(0xFFF59E0B)),
      );
    }

    final catColor = _getCategoryColor(q.category);

    return Column(
      children: [
        // Top Navigation & Stats Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: cardBg,
                  foregroundColor: textPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: cardBorder),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Progress Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cardBorder),
                ),
                child: Row(
                  children: [
                    Icon(Icons.format_list_numbered_rounded, size: 16, color: catColor),
                    const SizedBox(width: 6),
                    Text(
                      '${_currentIndex + 1} / $_totalRoundQuestions',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Streak badge
              if (_streak > 1)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_fire_department_rounded, size: 16, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        '$_streak Seri',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              // Total Score badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.stars_rounded, size: 18, color: Color(0xFFF59E0B)),
                    const SizedBox(width: 6),
                    Text(
                      '$_totalScore Puan',
                      style: const TextStyle(
                        color: Color(0xFFF59E0B),
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Linear Progress Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (_currentIndex + 1) / _totalRoundQuestions,
              backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(catColor),
              minHeight: 4,
            ),
          ),
        ),

        // Main Content Area
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mystery Header Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: catColor.withValues(alpha: isDark ? 0.15 : 0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: catColor.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: catColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.help_outline_rounded, color: catColor, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getCategoryLabel(q.category),
                              style: TextStyle(
                                color: catColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.8,
                              ),
                            ),
                            Text(
                              q.title,
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Current potential score
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF0F172A) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: cardBorder),
                        ),
                        child: Text(
                          '+$_currentPossiblePoints P',
                          style: const TextStyle(
                            color: Color(0xFFF59E0B),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // ==========================================
                // 3 CLUES STACK
                // ==========================================
                _buildClueCard(
                  clueNumber: 1,
                  pointsTag: '300 PUAN',
                  clueText: q.clue1,
                  isRevealed: true,
                  isDark: isDark,
                  cardBg: cardBg,
                  cardBorder: cardBorder,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                ),
                const SizedBox(height: 10),

                _buildClueCard(
                  clueNumber: 2,
                  pointsTag: '200 PUAN',
                  clueText: q.clue2,
                  isRevealed: _revealedClues >= 2,
                  onUnlockTap: _revealNextClue,
                  isDark: isDark,
                  cardBg: cardBg,
                  cardBorder: cardBorder,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                ),
                const SizedBox(height: 10),

                _buildClueCard(
                  clueNumber: 3,
                  pointsTag: '100 PUAN',
                  clueText: q.clue3,
                  isRevealed: _revealedClues >= 3,
                  onUnlockTap: _revealNextClue,
                  isDark: isDark,
                  cardBg: cardBg,
                  cardBorder: cardBorder,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                ),
                const SizedBox(height: 18),

                // ==========================================
                // OPTIONS GRID / LIST
                // ==========================================
                Text(
                  'TAHMİNİNİZİ SEÇİN:',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),

                ...q.options.map((opt) {
                  final isSelected = _selectedOption == opt;
                  final isCorrectAnswer = opt == q.answer;

                  Color optBorder = cardBorder;
                  Color optBg = cardBg;
                  Color optText = textPrimary;
                  Widget? iconIndicator;

                  if (_isAnswered) {
                    if (isCorrectAnswer) {
                      optBg = const Color(0xFF10B981).withValues(alpha: 0.15);
                      optBorder = const Color(0xFF10B981);
                      optText = const Color(0xFF10B981);
                      iconIndicator = const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 20);
                    } else if (isSelected) {
                      optBg = const Color(0xFFEF4444).withValues(alpha: 0.15);
                      optBorder = const Color(0xFFEF4444);
                      optText = const Color(0xFFEF4444);
                      iconIndicator = const Icon(Icons.cancel_rounded, color: Color(0xFFEF4444), size: 20);
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: _isAnswered ? null : () => _handleOptionSelect(opt),
                      borderRadius: BorderRadius.circular(16),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: optBg,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: optBorder, width: isSelected || (_isAnswered && isCorrectAnswer) ? 2.0 : 1.2),
                          boxShadow: [
                            if (isSelected || (_isAnswered && isCorrectAnswer))
                              BoxShadow(
                                color: (isCorrectAnswer ? const Color(0xFF10B981) : const Color(0xFFEF4444)).withValues(alpha: 0.18),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                opt,
                                style: TextStyle(
                                  color: optText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            if (iconIndicator != null) iconIndicator,
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                // Solution and Next Button
                if (_isAnswered) ...[
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.lightbulb_rounded, color: Color(0xFFF59E0B), size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'ÖSYM ALTIN BİLGİ:',
                              style: TextStyle(
                                color: isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309),
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          q.explanation,
                          style: TextStyle(
                            color: isDark ? const Color(0xFFF1F5F9) : const Color(0xFF78350F),
                            fontSize: 13,
                            height: 1.45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _goToNextQuestion,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 22),
                      label: Text(
                        _currentIndex + 1 < _roundQuestions.length ? 'Sonraki Gizemli Soru' : 'Sonuçları Gör',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF59E0B),
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shadowColor: const Color(0xFFF59E0B).withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClueCard({
    required int clueNumber,
    required String pointsTag,
    required String clueText,
    required bool isRevealed,
    VoidCallback? onUnlockTap,
    required bool isDark,
    required Color cardBg,
    required Color cardBorder,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    if (!isRevealed) {
      return InkWell(
        onTap: onUnlockTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B).withValues(alpha: 0.6) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardBorder, style: BorderStyle.solid),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lock_rounded, color: Color(0xFFF59E0B), size: 16),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$clueNumber. İpucu (Kilitli)',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Açmak için dokun (Bu ipucunda bilirsen $pointsTag)',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'AÇ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$clueNumber. İPUCU',
                  style: const TextStyle(
                    color: Color(0xFFF59E0B),
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                pointsTag,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            clueText,
            style: TextStyle(
              color: textPrimary,
              fontSize: 13,
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // GAME OVER SCREEN
  // ==========================================
  Widget _buildGameOverScreen(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    final successRate = (_correctCount / _totalRoundQuestions) * 100;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Column(
              children: [
                // Celebration Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF59E0B).withValues(alpha: 0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 44),
                ),
                const SizedBox(height: 16),
                Text(
                  'TUR TAMAMLANDI!',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '3 İpuçlu Gizemli Bilgi Sonuç Analizi',
                  style: TextStyle(color: textSecondary, fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),

                // Score Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: cardBorder),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('TOPLAM PUAN', '$_totalScore', const Color(0xFFF59E0B), isDark),
                          _buildStatItem('BAŞARI', '%${successRate.toInt()}', const Color(0xFF10B981), isDark),
                          _buildStatItem('1. İPUCU', '$_firstClueWins / 10', const Color(0xFF6366F1), isDark),
                          _buildStatItem('EN İYİ SERİ', '$_maxStreak', const Color(0xFFEF4444), isDark),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_rounded, size: 18),
                          label: const Text('Oyunlar Menüsü', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: textPrimary,
                            side: BorderSide(color: cardBorder, width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _startNewRound,
                          icon: const Icon(Icons.refresh_rounded, size: 20),
                          label: const Text('Yeni 10 Soru', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF59E0B),
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shadowColor: const Color(0xFFF59E0B).withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SORU & CEVAP ANALİZİ',
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Review List Items
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final rev = _reviewList[index];
                final q = rev['question'] as ClueQuestion;
                final isCorrect = rev['isCorrect'] as bool;
                final earned = rev['earnedPoints'] as int;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isCorrect ? const Color(0xFF10B981).withValues(alpha: 0.35) : const Color(0xFFEF4444).withValues(alpha: 0.35),
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
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              q.title,
                              style: TextStyle(color: textPrimary, fontSize: 13, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Text(
                            isCorrect ? '+$earned P' : '0 P',
                            style: TextStyle(
                              color: isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444),
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Doğru Cevap: ${q.answer}',
                        style: TextStyle(
                          color: const Color(0xFF10B981),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (!isCorrect)
                        Text(
                          'Sizin Cevabınız: ${rev['selected']}',
                          style: TextStyle(
                            color: const Color(0xFFEF4444),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        q.explanation,
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: _reviewList.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color color, bool isDark) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
