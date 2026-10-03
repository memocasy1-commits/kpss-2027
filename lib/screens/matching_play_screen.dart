import 'dart:math';
import 'package:flutter/material.dart';
import '../data/matching_game_data.dart';
import '../models/matching_game_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class MatchingPlayScreen extends StatefulWidget {
  final String category; // 'all', 'tarih', 'cografya', 'vatandaslik'

  const MatchingPlayScreen({super.key, this.category = 'all'});

  @override
  State<MatchingPlayScreen> createState() => _MatchingPlayScreenState();
}

class _MatchingPlayScreenState extends State<MatchingPlayScreen> {
  static const int _pairsPerRound = 4;
  static const int _totalRounds = 5; // 20 pairs total per full game session

  late List<MatchingItem> _pool;
  int _currentRound = 1;

  // Active round items
  late List<MatchingItem> _currentPairs;
  late List<MatchingItem> _leftItems;
  late List<String> _rightMatches;

  // Selection & Match tracking
  MatchingItem? _selectedLeft;
  String? _selectedRight;

  final Set<String> _matchedPromptIds = {};
  final Set<String> _matchedAnswers = {};

  bool _isRoundCompleted = false;
  bool _isGameOver = false;

  // Feedback states
  bool _isErrorAnimation = false;

  // Scoring
  int _totalScore = 0;
  int _streak = 0;
  int _maxStreak = 0;
  int _totalMatchesCount = 0;

  // Review history
  final List<MatchingItem> _sessionReview = [];

  @override
  void initState() {
    super.initState();
    MatchingGameData.loadQuestions().then((_) {
      if (mounted) {
        setState(() {
          _pool = MatchingGameData.getQuestions(category: widget.category);
          _startNewGame();
        });
      }
    });
    _pool = MatchingGameData.getQuestions(category: widget.category);
    _startNewGame();
  }

  void _startNewGame() {
    final list = List<MatchingItem>.from(_pool);
    list.shuffle(Random());
    _pool = list;
    _currentRound = 1;
    _totalScore = 0;
    _streak = 0;
    _maxStreak = 0;
    _totalMatchesCount = 0;
    _isGameOver = false;
    _sessionReview.clear();
    _startRound();
  }

  void _startRound() {
    final startIndex = (_currentRound - 1) * _pairsPerRound;
    if (startIndex + _pairsPerRound > _pool.length) {
      _pool.shuffle(Random());
    }

    _currentPairs = _pool.skip(startIndex % (_pool.length - _pairsPerRound)).take(_pairsPerRound).toList();

    _leftItems = List<MatchingItem>.from(_currentPairs)..shuffle(Random());
    _rightMatches = _currentPairs.map((p) => p.match).toList()..shuffle(Random());

    _selectedLeft = null;
    _selectedRight = null;
    _matchedPromptIds.clear();
    _matchedAnswers.clear();
    _isRoundCompleted = false;
    _isErrorAnimation = false;
  }

  void _handleLeftTap(MatchingItem item) {
    if (_matchedPromptIds.contains(item.id) || _isErrorAnimation || _isRoundCompleted) return;

    setState(() {
      _selectedLeft = item;
    });

    _checkMatch();
  }

  void _handleRightTap(String matchStr) {
    if (_matchedAnswers.contains(matchStr) || _isErrorAnimation || _isRoundCompleted) return;

    setState(() {
      _selectedRight = matchStr;
    });

    _checkMatch();
  }

  void _checkMatch() {
    if (_selectedLeft == null || _selectedRight == null) return;

    final left = _selectedLeft!;
    final right = _selectedRight!;

    if (left.match == right) {
      // Correct Match!
      setState(() {
        _matchedPromptIds.add(left.id);
        _matchedAnswers.add(right);
        _totalMatchesCount++;
        _streak++;
        if (_streak > _maxStreak) _maxStreak = _streak;

        final streakBonus = (_streak > 1) ? (_streak - 1) * 25 : 0;
        _totalScore += 100 + streakBonus;

        if (!_sessionReview.any((r) => r.id == left.id)) {
          _sessionReview.add(left);
        }

        _selectedLeft = null;
        _selectedRight = null;

        // Check if all 4 pairs matched in this round
        if (_matchedPromptIds.length == _pairsPerRound) {
          _isRoundCompleted = true;
        }
      });
    } else {
      // Wrong Match
      setState(() {
        _isErrorAnimation = true;
        _streak = 0;
      });

      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _selectedLeft = null;
            _selectedRight = null;
            _isErrorAnimation = false;
          });
        }
      });
    }
  }

  void _nextRound() {
    if (_currentRound < _totalRounds) {
      setState(() {
        _currentRound++;
        _startRound();
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
        return const Color(0xFF10B981);
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
    final catColor = _getCategoryColor(widget.category);

    return Column(
      children: [
        // Header Bar
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
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cardBorder),
                ),
                child: Row(
                  children: [
                    Icon(Icons.layers_rounded, size: 16, color: catColor),
                    const SizedBox(width: 6),
                    Text(
                      'Tur $_currentRound / $_totalRounds',
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
              if (_streak > 1)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF059669)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.bolt_rounded, size: 16, color: Colors.white),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.stars_rounded, size: 18, color: Color(0xFF10B981)),
                    const SizedBox(width: 6),
                    Text(
                      '$_totalScore Puan',
                      style: const TextStyle(
                        color: Color(0xFF10B981),
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
              value: (_matchedPromptIds.length) / _pairsPerRound,
              backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(catColor),
              minHeight: 4,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Hint Instruction Banner
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: catColor.withValues(alpha: isDark ? 0.12 : 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: catColor.withValues(alpha: 0.25)),
            ),
            child: Row(
              children: [
                Icon(Icons.touch_app_rounded, size: 16, color: catColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Sol taraftan bir kavram seçin, ardından sağdaki doğru eşleşmesine dokunun.',
                    style: TextStyle(
                      color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: catColor.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_matchedPromptIds.length} / 4',
                    style: TextStyle(
                      color: catColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Main Matching Columns
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              children: [
                // 4 Interactive Rows
                for (int i = 0; i < _pairsPerRound; i++) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column Item (Prompt)
                      Expanded(
                        child: _buildLeftCard(
                          item: _leftItems[i],
                          isDark: isDark,
                          cardBg: cardBg,
                          cardBorder: cardBorder,
                          textPrimary: textPrimary,
                          catColor: catColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Right Column Item (Match)
                      Expanded(
                        child: _buildRightCard(
                          matchStr: _rightMatches[i],
                          isDark: isDark,
                          cardBg: cardBg,
                          cardBorder: cardBorder,
                          textPrimary: textPrimary,
                          catColor: catColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],

                // Round Completed Banner & Explanations
                if (_isRoundCompleted) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withValues(alpha: isDark ? 0.15 : 0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.35)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.celebration_rounded, color: Color(0xFF10B981), size: 22),
                            const SizedBox(width: 8),
                            const Text(
                              'TEBRİKLER! TÜM ÇİFTLER EŞLEŞTİ',
                              style: TextStyle(
                                color: Color(0xFF10B981),
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Golden Explanations of all 4 pairs
                        ..._currentPairs.map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('💡 ', style: TextStyle(fontSize: 12)),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: textPrimary,
                                          fontSize: 12,
                                          height: 1.4,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '${p.match}: ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF10B981),
                                            ),
                                          ),
                                          TextSpan(text: p.explanation),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _nextRound,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 22),
                      label: Text(
                        _currentRound < _totalRounds ? 'Sonraki Tura Geç (Yeni 4 Çift)' : 'Sonuçları Gör',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shadowColor: const Color(0xFF10B981).withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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

  Widget _buildLeftCard({
    required MatchingItem item,
    required bool isDark,
    required Color cardBg,
    required Color cardBorder,
    required Color textPrimary,
    required Color catColor,
  }) {
    final isMatched = _matchedPromptIds.contains(item.id);
    final isSelected = _selectedLeft?.id == item.id;
    final isError = _isErrorAnimation && isSelected;

    Color border = cardBorder;
    Color bg = cardBg;
    Color textColor = textPrimary;

    if (isMatched) {
      bg = const Color(0xFF10B981).withValues(alpha: isDark ? 0.15 : 0.08);
      border = const Color(0xFF10B981).withValues(alpha: 0.4);
      textColor = const Color(0xFF10B981);
    } else if (isError) {
      bg = const Color(0xFFEF4444).withValues(alpha: isDark ? 0.2 : 0.1);
      border = const Color(0xFFEF4444);
      textColor = const Color(0xFFEF4444);
    } else if (isSelected) {
      bg = catColor.withValues(alpha: isDark ? 0.2 : 0.12);
      border = catColor;
      textColor = catColor;
    }

    return InkWell(
      onTap: () => _handleLeftTap(item),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        constraints: const BoxConstraints(minHeight: 80),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: border,
            width: isSelected || isMatched ? 1.8 : 1.2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: catColor.withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.prompt,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: isSelected || isMatched ? FontWeight.w800 : FontWeight.w600,
                      height: 1.35,
                    ),
                  ),
                ),
                if (isMatched)
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 16),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightCard({
    required String matchStr,
    required bool isDark,
    required Color cardBg,
    required Color cardBorder,
    required Color textPrimary,
    required Color catColor,
  }) {
    final isMatched = _matchedAnswers.contains(matchStr);
    final isSelected = _selectedRight == matchStr;
    final isError = _isErrorAnimation && isSelected;

    Color border = cardBorder;
    Color bg = cardBg;
    Color textColor = textPrimary;

    if (isMatched) {
      bg = const Color(0xFF10B981).withValues(alpha: isDark ? 0.15 : 0.08);
      border = const Color(0xFF10B981).withValues(alpha: 0.4);
      textColor = const Color(0xFF10B981);
    } else if (isError) {
      bg = const Color(0xFFEF4444).withValues(alpha: isDark ? 0.2 : 0.1);
      border = const Color(0xFFEF4444);
      textColor = const Color(0xFFEF4444);
    } else if (isSelected) {
      bg = catColor.withValues(alpha: isDark ? 0.2 : 0.12);
      border = catColor;
      textColor = catColor;
    }

    return InkWell(
      onTap: () => _handleRightTap(matchStr),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        constraints: const BoxConstraints(minHeight: 80),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: border,
            width: isSelected || isMatched ? 1.8 : 1.2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: catColor.withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    matchStr,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: isSelected || isMatched ? FontWeight.w800 : FontWeight.w700,
                      height: 1.35,
                    ),
                  ),
                ),
                if (isMatched)
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 16),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // GAME OVER SUMMARY SCREEN
  // ==========================================
  Widget _buildGameOverScreen(
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF059669)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withValues(alpha: 0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 44),
                ),
                const SizedBox(height: 16),
                Text(
                  'OYUN BİTTİ!',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Kavram & Eser Eşleştirme Başarı Karnesi',
                  style: TextStyle(color: textSecondary, fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),

                // Stats Card
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('TOPLAM PUAN', '$_totalScore', const Color(0xFF10B981), isDark),
                      _buildStatItem('EŞLEŞEN ÇİFT', '$_totalMatchesCount', const Color(0xFF6366F1), isDark),
                      _buildStatItem('EN İYİ SERİ', '$_maxStreak', const Color(0xFFEF4444), isDark),
                      _buildStatItem('TAMAMLANAN', '$_totalRounds Tur', const Color(0xFFF59E0B), isDark),
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
                          onPressed: _startNewGame,
                          icon: const Icon(Icons.refresh_rounded, size: 20),
                          label: const Text('Yeni 20 Çift', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shadowColor: const Color(0xFF10B981).withValues(alpha: 0.4),
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
                    'ÖĞRENİLEN KAVRAMLAR VE ALTIN BİLGİLER',
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

        // Session Review List
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = _sessionReview[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: cardBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981).withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.check_rounded, color: Color(0xFF10B981), size: 16),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.prompt,
                                  style: TextStyle(color: textPrimary, fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.match,
                                  style: const TextStyle(
                                    color: Color(0xFF10B981),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.explanation,
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 11,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: _sessionReview.length,
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
