import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/map_point_game_data.dart';
import '../theme/app_theme.dart';

enum MapGameMode {
  classic,   // 10 Soru
  speedRun,  // Zamana Karşı (60 saniye)
  practice,  // Keşif / Antrenman (Tüm sorular)
}

class MapPointGameScreen extends StatefulWidget {
  final String? initialCategory; // null = 'all', or 'madenler', 'yersekilleri', etc.

  const MapPointGameScreen({super.key, this.initialCategory});

  @override
  State<MapPointGameScreen> createState() => _MapPointGameScreenState();
}

class _MapPointGameScreenState extends State<MapPointGameScreen> with SingleTickerProviderStateMixin {
  late List<MapPointQuestion> _questions;
  int _currentIndex = 0;
  int _totalScore = 0;
  int _combo = 0;
  int _maxCombo = 0;
  double _totalDistanceKm = 0;
  int _exactHits = 0; // <= 75km

  // Selected Category & Mode
  late String _selectedCategory;
  MapGameMode _gameMode = MapGameMode.classic;

  // Missed questions tracker for review
  final List<MapPointQuestion> _missedQuestions = [];

  // Speed Run Timer
  Timer? _speedRunTimer;
  int _remainingSeconds = 60;

  // State for current question
  Offset? _userTapNorm; // (normX, normY) in 0.0..1.0
  bool _hasConfirmed = false;
  double? _lastDistanceKm;
  int _lastScore = 0;
  String _lastFeedback = '';
  Color _lastFeedbackColor = const Color(0xFF10B981);
  bool _showHint = false;
  bool _showCityBorders = false; // Varsayılan: Dilsiz Harita (İl sınırları kapalı, ÖSYM standardı)

  late AnimationController _pulseController;
  final TransformationController _transformController = TransformationController();
  double _currentScale = 1.0;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory ?? 'all';

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _transformController.addListener(() {
      final scale = _transformController.value.getMaxScaleOnAxis();
      if ((scale - _currentScale).abs() > 0.05) {
        setState(() {
          _currentScale = scale;
        });
      }
    });

    _initGame();
  }

  void _initGame({List<MapPointQuestion>? customPool}) {
    _speedRunTimer?.cancel();
    _remainingSeconds = 60;
    _missedQuestions.clear();

    List<MapPointQuestion> pool;
    if (customPool != null && customPool.isNotEmpty) {
      pool = List<MapPointQuestion>.from(customPool);
    } else {
      pool = MapPointGameData.questions;
      if (_selectedCategory != 'all') {
        final filtered = pool.where((q) => q.category == _selectedCategory).toList();
        if (filtered.isNotEmpty) pool = filtered;
      }
    }

    final shuffled = List<MapPointQuestion>.from(pool)..shuffle();

    if (_gameMode == MapGameMode.classic) {
      _questions = shuffled.take(math.min(10, shuffled.length)).toList();
    } else if (_gameMode == MapGameMode.speedRun) {
      _questions = shuffled; // All available for 60s
      _startSpeedRunTimer();
    } else {
      // practice
      _questions = shuffled;
    }

    _currentIndex = 0;
    _totalScore = 0;
    _combo = 0;
    _maxCombo = 0;
    _totalDistanceKm = 0;
    _exactHits = 0;
    _userTapNorm = null;
    _hasConfirmed = false;
    _showHint = false;
    _resetZoom();
  }

  void _startSpeedRunTimer() {
    _remainingSeconds = 60;
    _speedRunTimer?.cancel();
    _speedRunTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() {
          _remainingSeconds = 0;
        });
        _showResultDialog(reason: 'Süre Doldu!');
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _resetZoom() {
    _transformController.value = Matrix4.identity();
    _currentScale = 1.0;
  }

  @override
  void dispose() {
    _speedRunTimer?.cancel();
    _pulseController.dispose();
    _transformController.dispose();
    super.dispose();
  }

  void _onMapTapped(Offset normOffset) {
    if (_hasConfirmed) return;
    HapticFeedback.selectionClick();
    setState(() {
      _userTapNorm = normOffset;
    });
  }

  void _confirmGuess() {
    if (_userTapNorm == null || _hasConfirmed) return;

    final q = _questions[_currentIndex];
    final userLon = MapPointGameData.lonFromNormX(_userTapNorm!.dx);
    final userLat = MapPointGameData.latFromNormY(_userTapNorm!.dy);

    final distanceKm = MapPointGameData.calculateDistanceKm(
      userLat,
      userLon,
      q.targetLat,
      q.targetLon,
    );

    int score = 0;
    String feedback = '';
    Color feedbackColor = const Color(0xFF10B981);

    if (distanceKm <= 35) {
      score = 100;
      feedback = '🎯 TAM İSABET!';
      feedbackColor = const Color(0xFF10B981);
      _combo++;
      _exactHits++;
      HapticFeedback.heavyImpact();
    } else if (distanceKm <= 75) {
      score = 80;
      feedback = '⚡ ÇOK YAKIN!';
      feedbackColor = const Color(0xFF06B6D4);
      _combo++;
      _exactHits++;
      HapticFeedback.mediumImpact();
    } else if (distanceKm <= 150) {
      score = 50;
      feedback = '👍 YAKIN';
      feedbackColor = const Color(0xFFF59E0B);
      _combo = 0;
      _missedQuestions.add(q);
      HapticFeedback.lightImpact();
    } else if (distanceKm <= 260) {
      score = 25;
      feedback = '📍 BİRAZ UZAK';
      feedbackColor = const Color(0xFFF97316);
      _combo = 0;
      _missedQuestions.add(q);
    } else {
      score = 10;
      feedback = '❌ ISKALADIN';
      feedbackColor = const Color(0xFFEF4444);
      _combo = 0;
      _missedQuestions.add(q);
    }

    if (_combo > _maxCombo) _maxCombo = _combo;

    // Combo multiplier bonus
    int multiplier = _combo >= 3 ? 2 : 1;
    final finalScore = score * multiplier;

    setState(() {
      _hasConfirmed = true;
      _lastDistanceKm = distanceKm;
      _lastScore = finalScore;
      _lastFeedback = feedback;
      _lastFeedbackColor = feedbackColor;
      _totalScore += finalScore;
      _totalDistanceKm += distanceKm;
    });
  }

  void _nextQuestion() {
    if (_currentIndex + 1 < _questions.length) {
      setState(() {
        _currentIndex++;
        _userTapNorm = null;
        _hasConfirmed = false;
        _lastDistanceKm = null;
        _showHint = false;
        _resetZoom();
      });
    } else {
      _speedRunTimer?.cancel();
      _showResultDialog();
    }
  }

  void _showResultDialog({String? reason}) {
    final double avgDistance = (_currentIndex + 1) == 0 ? 0 : (_totalDistanceKm / (_currentIndex + 1));
    String title = 'Coğrafya Kâşifi';
    IconData icon = Icons.military_tech_rounded;
    Color iconColor = const Color(0xFF6366F1);

    if (_totalScore >= 800) {
      title = '🏆 Harita Üstadı (Mükemmel)';
      iconColor = const Color(0xFF10B981);
    } else if (_totalScore >= 500) {
      title = '🎖️ KPSS Coğrafya Uzmanı';
      iconColor = const Color(0xFFF59E0B);
    } else {
      title = '🧭 Harita Çırağı';
      iconColor = const Color(0xFF64748B);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        final cardBg = AppColors.card;
        final textPrimary = AppColors.textPrimary;
        final textSecondary = AppColors.textSecondary;

        return AlertDialog(
          backgroundColor: cardBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: iconColor.withValues(alpha: 0.4), width: 2),
                ),
                child: Icon(icon, color: iconColor, size: 34),
              ),
              const SizedBox(height: 12),
              Text(
                reason ?? 'TUR TAMAMLANDI!',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: textPrimary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: iconColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildResultStat('Puan', '$_totalScore', const Color(0xFF6366F1)),
                    Container(width: 1, height: 30, color: AppColors.cardBorder),
                    _buildResultStat('İsabet', '$_exactHits/${_currentIndex + 1}', const Color(0xFF10B981)),
                    Container(width: 1, height: 30, color: AppColors.cardBorder),
                    _buildResultStat('Ort. Sapma', '${avgDistance.round()} km', const Color(0xFFF59E0B)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              if (_missedQuestions.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFEF4444).withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, color: Color(0xFFEF4444), size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${_missedQuestions.length} soruda 75 km üzeri sapma oluştu.',
                          style: const TextStyle(fontSize: 11.5, color: Color(0xFFEF4444), fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
              Text(
                "Harita görsel hafızanızı taze tutmak ÖSYM'nin en az 6 coğrafya sorusunu net kazandırır!",
                style: TextStyle(fontSize: 11.5, color: textSecondary, height: 1.35),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.all(16),
          actions: [
            Column(
              children: [
                if (_missedQuestions.isNotEmpty) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(ctx);
                        final toReview = List<MapPointQuestion>.from(_missedQuestions);
                        setState(() {
                          _initGame(customPool: toReview);
                        });
                      },
                      icon: const Icon(Icons.replay_rounded, size: 16),
                      label: Text(
                        'Kaçırılanları Tekrar Çöz (${_missedQuestions.length})',
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF59E0B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: textPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Atölyeye Dön', style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          setState(() {
                            _initGame();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        child: const Text('Yeniden Oyna', style: TextStyle(fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildResultStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: color)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
      ],
    );
  }

  void _showGameModeBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.cardBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Oyun Modunu Seçin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 14),
              _buildModeOption(
                mode: MapGameMode.classic,
                icon: Icons.military_tech_rounded,
                iconColor: const Color(0xFF6366F1),
                title: 'Klasik Tur (10 Soru)',
                subtitle: 'Süre sınırlaması olmaksızın en yüksek kombo ve puanı yakalayın.',
              ),
              const SizedBox(height: 8),
              _buildModeOption(
                mode: MapGameMode.speedRun,
                icon: Icons.timer_rounded,
                iconColor: const Color(0xFFEF4444),
                title: 'Zamana Karşı (60 Saniye Maratonu)',
                subtitle: '1 dakika içinde olabildiğince çok konumu doğru işaretleyin!',
              ),
              const SizedBox(height: 8),
              _buildModeOption(
                mode: MapGameMode.practice,
                icon: Icons.explore_rounded,
                iconColor: const Color(0xFF10B981),
                title: 'Keşif / Antrenman Modu',
                subtitle: 'Kategorideki tüm soruları limitsiz çözün ve altın bilgileri öğrenin.',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModeOption({
    required MapGameMode mode,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    final isSelected = _gameMode == mode;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (_gameMode != mode) {
          setState(() {
            _gameMode = mode;
            _initGame();
          });
        }
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? iconColor.withValues(alpha: 0.1) : AppColors.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? iconColor : AppColors.cardBorder,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: isSelected ? iconColor : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded, color: iconColor, size: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentIndex];
    final cardBg = AppColors.card;
    final cardBorder = AppColors.cardBorder;
    final textPrimary = AppColors.textPrimary;
    final textSecondary = AppColors.textSecondary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: Border(bottom: BorderSide(color: cardBorder, width: 1)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: const Color(0xFF059669).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(Icons.place_rounded, color: Color(0xFF059669), size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HARİTADA NOKTA ATIŞI',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 0.3),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    _gameMode == MapGameMode.speedRun
                        ? '⏳ $_remainingSeconds sn kaldı • #${_currentIndex + 1}'
                        : '${_currentIndex + 1} / ${_questions.length} Soru',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: _gameMode == MapGameMode.speedRun && _remainingSeconds <= 15
                          ? const Color(0xFFEF4444)
                          : textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // Oyun Modu Değiştir Butonu
          InkWell(
            onTap: _showGameModeBottomSheet,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: cardBorder),
              ),
              child: Row(
                children: [
                  Icon(
                    _gameMode == MapGameMode.speedRun
                        ? Icons.timer_rounded
                        : (_gameMode == MapGameMode.practice
                            ? Icons.explore_rounded
                            : Icons.military_tech_rounded),
                    size: 14,
                    color: const Color(0xFF6366F1),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _gameMode == MapGameMode.speedRun
                        ? '60s'
                        : (_gameMode == MapGameMode.practice ? 'Keşif' : 'Klasik'),
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF6366F1)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Puan & Kombo Rozeti
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                if (_combo >= 2) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFF59E0B)),
                    ),
                    child: Text(
                      '⚡ x${_combo >= 3 ? 2 : 1.5}',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: Color(0xFFF59E0B)),
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF6366F1).withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Color(0xFF6366F1), size: 15),
                      const SizedBox(width: 3),
                      Text(
                        '$_totalScore',
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // İlerleme veya Süre Çubuğu
            if (_gameMode == MapGameMode.speedRun)
              LinearProgressIndicator(
                value: _remainingSeconds / 60.0,
                backgroundColor: cardBorder,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _remainingSeconds <= 15 ? const Color(0xFFEF4444) : const Color(0xFFF59E0B),
                ),
                minHeight: 3,
              )
            else
              LinearProgressIndicator(
                value: (_currentIndex + 1) / _questions.length,
                backgroundColor: cardBorder,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF059669)),
                minHeight: 3,
              ),

            // Kategori Seçici Çubuğu (Yatay Kaydırılabilir Chips Bar)
            _buildCategorySelector(),

            // Soru Başlığı & Kategori (Kompakt ve net)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: cardBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 6,
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
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF059669).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            q.categoryTitle.toUpperCase(),
                            style: const TextStyle(
                              color: Color(0xFF059669),
                              fontSize: 9.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            q.subCategory,
                            style: const TextStyle(
                              color: Color(0xFF6366F1),
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _showHint = !_showHint;
                            });
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline_rounded,
                                  size: 14,
                                  color: _showHint ? const Color(0xFFF59E0B) : textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _showHint ? 'Gizle' : 'İpucu',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: _showHint ? const Color(0xFFF59E0B) : textSecondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      q.question,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                        color: textPrimary,
                        height: 1.25,
                      ),
                    ),
                    if (_showHint) ...[
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF59E0B).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.25)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.info_outline_rounded, size: 13, color: Color(0xFFF59E0B)),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                q.hint,
                                style: const TextStyle(fontSize: 11, color: Color(0xFFD97706), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // İnteraktif Harita Alanı (Zoom, Pan, İl Sınırları, Taşma Korumalı)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double containerW = constraints.maxWidth;
                    final double containerH = constraints.maxHeight;

                    // Harita en/boy oranı: 1800 / 657 = 2.7397
                    const double mapAspect = 1800 / 657;

                    // Pinlerin harita sınırları dışına taşmasını engelleyen iç paylar
                    const double padX = 14.0;
                    const double padY = 24.0;

                    double mapW = containerW - (padX * 2);
                    double mapH = mapW / mapAspect;

                    if (mapH > (containerH - (padY * 2))) {
                      mapH = containerH - (padY * 2);
                      mapW = mapH * mapAspect;
                    }

                    final double canvasW = mapW + (padX * 2);
                    final double canvasH = mapH + (padY * 2);

                    return Stack(
                      children: [
                        // Harita Konteynırı
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF0A101D) : const Color(0xFFE0F2FE),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFBAE6FD),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: InteractiveViewer(
                              transformationController: _transformController,
                              minScale: 1.0,
                              maxScale: 3.5,
                              boundaryMargin: const EdgeInsets.all(50),
                              child: Center(
                                child: SizedBox(
                                  width: canvasW,
                                  height: canvasH,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      // 1. DİLSİZ TÜRKİYE HARİTASI (ÖSYM KPSS Standardı: İl sınırları olmaksızın, kıyı ve göller)
                                      Positioned(
                                        left: padX,
                                        top: padY,
                                        width: mapW,
                                        height: mapH,
                                        child: Image.asset(
                                          _showCityBorders
                                              ? (isDark
                                                  ? 'assets/images/maps/turkiye_siyasi_harita_dark.png'
                                                  : 'assets/images/maps/turkiye_siyasi_harita_light.png')
                                              : (isDark
                                                  ? 'assets/images/maps/turkiye_dilsiz_harita_dark.png'
                                                  : 'assets/images/maps/turkiye_dilsiz_harita_light.png'),
                                          fit: BoxFit.fill,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),

                                      // 2. Çizgi Katmanı (Kullanıcı Dokunuşu ile Gerçek Hedef Arası Kesikli Çizgi)
                                      if (_hasConfirmed && _userTapNorm != null)
                                        CustomPaint(
                                          size: Size(canvasW, canvasH),
                                          painter: DistanceLinePainter(
                                            start: Offset(
                                              padX + _userTapNorm!.dx * mapW,
                                              padY + _userTapNorm!.dy * mapH,
                                            ),
                                            end: Offset(
                                              padX + q.normX * mapW,
                                              padY + q.normY * mapH,
                                            ),
                                            lineColor: _lastFeedbackColor,
                                          ),
                                        ),

                                      // 3. Gerçek Hedef Pini (Onaylandıktan sonra açılır, yukarı taşma korumalı)
                                      if (_hasConfirmed)
                                        Positioned(
                                          left: padX + q.normX * mapW - 14,
                                          top: q.normY < 0.22
                                              ? (padY + q.normY * mapH - 10)
                                              : (padY + q.normY * mapH - 34),
                                          child: _buildTargetPin(q.targetName, showBelow: q.normY < 0.22),
                                        ),

                                      // 4. Kullanıcı Pini
                                      if (_userTapNorm != null)
                                        Positioned(
                                          left: padX + _userTapNorm!.dx * mapW - 14,
                                          top: _userTapNorm!.dy < 0.22
                                              ? (padY + _userTapNorm!.dy * mapH - 10)
                                              : (padY + _userTapNorm!.dy * mapH - 30),
                                          child: _buildUserPin(
                                            _hasConfirmed ? _lastFeedbackColor : const Color(0xFF6366F1),
                                            showBelow: _userTapNorm!.dy < 0.22,
                                          ),
                                        ),

                                      // 5. Dokunma Algılayıcı (GestureDetector - Tam harita koordinatına kilitli)
                                      Positioned(
                                        left: padX,
                                        top: padY,
                                        width: mapW,
                                        height: mapH,
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTapUp: (details) {
                                            final normX = details.localPosition.dx / mapW;
                                            final normY = details.localPosition.dy / mapH;
                                            _onMapTapped(Offset(normX.clamp(0.0, 1.0), normY.clamp(0.0, 1.0)));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Sol Üst: Harita Modu Rozeti / Değiştirici (Dilsiz Harita vs. İl Sınırları)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: InkWell(
                            onTap: () {
                              HapticFeedback.selectionClick();
                              setState(() {
                                _showCityBorders = !_showCityBorders;
                              });
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3.5),
                              decoration: BoxDecoration(
                                color: _showCityBorders
                                    ? const Color(0xFF6366F1).withValues(alpha: 0.9)
                                    : (isDark ? Colors.black : Colors.white).withValues(alpha: 0.78),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _showCityBorders ? const Color(0xFF6366F1) : cardBorder,
                                  width: 0.8,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _showCityBorders ? Icons.map_rounded : Icons.map_outlined,
                                    size: 11,
                                    color: _showCityBorders ? Colors.white : textSecondary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _showCityBorders ? 'İl Sınırları: Açık' : 'Dilsiz Harita',
                                    style: TextStyle(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w700,
                                      color: _showCityBorders ? Colors.white : textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Sağ Üst Bilgi Rozeti
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3.5),
                            decoration: BoxDecoration(
                              color: (isDark ? Colors.black : Colors.white).withValues(alpha: 0.78),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: cardBorder, width: 0.8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.pinch_rounded, size: 11, color: textSecondary),
                                const SizedBox(width: 4),
                                Text(
                                  'Pinch Yakınlaştır',
                                  style: TextStyle(
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w600,
                                    color: textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Sol Alt: Yakınlaştırmayı Sıfırla Butonu
                        if (_currentScale > 1.08)
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _resetZoom();
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.8),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white24),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.zoom_out_map_rounded, color: Colors.white, size: 13),
                                    SizedBox(width: 4),
                                    Text(
                                      '1x Sıfırla',
                                      style: TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // Alt Alan: Sonuç Kartı veya Onay Butonu
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 2, 14, 10),
              child: _hasConfirmed ? _buildFeedbackSection(q) : _buildActionSection(),
            ),
          ],
        ),
      ),
    );
  }

  // Kategori Seçici Barı (Yatay Chip Listesi)
  Widget _buildCategorySelector() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        scrollDirection: Axis.horizontal,
        itemCount: MapPointGameData.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final cat = MapPointGameData.categories[index];
          final isSelected = _selectedCategory == cat.id;

          // Soru sayısı hesapla
          final count = cat.id == 'all'
              ? MapPointGameData.questions.length
              : MapPointGameData.questions.where((q) => q.category == cat.id).length;

          return InkWell(
            onTap: () {
              if (_selectedCategory != cat.id) {
                HapticFeedback.selectionClick();
                setState(() {
                  _selectedCategory = cat.id;
                  _initGame();
                });
              }
            },
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF059669) : AppColors.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? const Color(0xFF059669) : AppColors.cardBorder,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cat.icon, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 5),
                  Text(
                    cat.title,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withValues(alpha: 0.25)
                          : AppColors.cardBorder.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Kullanıcı Pini
  Widget _buildUserPin(Color color, {bool showBelow = false}) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        final scale = 1.0 + (_pulseController.value * 0.15);
        return Transform.scale(
          scale: scale,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showBelow)
                CustomPaint(
                  size: const Size(6, 4),
                  painter: TrianglePointer(color: color, pointingUp: true),
                ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.person_pin_circle_rounded, color: Colors.white, size: 15),
              ),
              if (!showBelow)
                CustomPaint(
                  size: const Size(6, 4),
                  painter: TrianglePointer(color: color),
                ),
            ],
          ),
        );
      },
    );
  }

  // Gerçek Hedef Pini
  Widget _buildTargetPin(String name, {bool showBelow = false}) {
    final badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF10B981),
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9.5,
          fontWeight: FontWeight.w900,
        ),
      ),
    );

    final circle = Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: const Color(0xFF10B981),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withValues(alpha: 0.6),
            blurRadius: 8,
          ),
        ],
      ),
      child: const Icon(Icons.star_rounded, color: Colors.white, size: 16),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!showBelow) ...[
          badge,
          const SizedBox(height: 2),
          circle,
        ] else ...[
          circle,
          const SizedBox(height: 2),
          badge,
        ],
      ],
    );
  }

  // Alt Alan: Henüz Onaylanmadıysa
  Widget _buildActionSection() {
    final bool canConfirm = _userTapNorm != null;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Row(
              children: [
                Icon(
                  canConfirm ? Icons.touch_app_rounded : Icons.info_outline_rounded,
                  size: 16,
                  color: canConfirm ? const Color(0xFF6366F1) : AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    canConfirm
                        ? 'Noktayı belirledin! Şimdi onayla.'
                        : 'Haritada tahmin ettiğin noktaya dokun.',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: canConfirm ? AppColors.textPrimary : AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: canConfirm ? _confirmGuess : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF059669),
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.cardBorder,
            disabledForegroundColor: AppColors.textSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle_rounded, size: 16),
              SizedBox(width: 5),
              Text('Tahmin Et', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
      ],
    );
  }

  // Alt Alan: Onaylandıktan Sonra (Zenginleştirilmiş KPSS Bilgi Kartı)
  Widget _buildFeedbackSection(MapPointQuestion q) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 180),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _lastFeedbackColor.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _lastFeedbackColor.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mesafe & Puan & ÖSYM Frekans Şeridi
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: _lastFeedbackColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  _lastFeedback,
                  style: TextStyle(
                    color: _lastFeedbackColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Fark: ${_lastDistanceKm?.round()} km',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  q.osymFrequency,
                  style: const TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFD97706),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '+$_lastScore Puan',
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF6366F1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Doğru Konum ve Açıklama (Kaydırılabilir İçerik)
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📍 Doğru Konum: ${q.targetName}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    q.explanation,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      height: 1.3,
                    ),
                  ),
                  if (q.keyFacts.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF059669).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF059669).withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.workspace_premium_rounded, size: 12, color: Color(0xFF059669)),
                              SizedBox(width: 4),
                              Text(
                                'KPSS Altın Bilgiler:',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF059669),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          ...q.keyFacts.take(2).map((fact) => Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 10, color: Color(0xFF059669), fontWeight: FontWeight.bold)),
                                    Expanded(
                                      child: Text(
                                        fact,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.textPrimary,
                                          height: 1.25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),

          // Sonraki Soru Butonu
          SizedBox(
            width: double.infinity,
            height: 34,
            child: ElevatedButton.icon(
              onPressed: _nextQuestion,
              icon: const Icon(Icons.arrow_forward_rounded, size: 15),
              label: Text(
                _currentIndex + 1 < _questions.length ? 'Sonraki Konum' : 'Sonuçları Gör',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF059669),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Mesafe Çizgisi Çizici
class DistanceLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color lineColor;

  DistanceLinePainter({
    required this.start,
    required this.end,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor.withValues(alpha: 0.8)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0;
    const double dashSpace = 4.0;
    double dx = end.dx - start.dx;
    double dy = end.dy - start.dy;
    double distance = math.sqrt(dx * dx + dy * dy);
    double unitX = dx / distance;
    double unitY = dy / distance;

    double currentDist = 0.0;
    while (currentDist < distance) {
      double nextDist = math.min(currentDist + dashWidth, distance);
      canvas.drawLine(
        Offset(start.dx + unitX * currentDist, start.dy + unitY * currentDist),
        Offset(start.dx + unitX * nextDist, start.dy + unitY * nextDist),
        paint,
      );
      currentDist += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant DistanceLinePainter oldDelegate) {
    return oldDelegate.start != start || oldDelegate.end != end || oldDelegate.lineColor != lineColor;
  }
}

// Üçgen İşaretçi
class TrianglePointer extends CustomPainter {
  final Color color;
  final bool pointingUp;

  TrianglePointer({required this.color, this.pointingUp = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    if (pointingUp) {
      path.moveTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width / 2, size.height);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TrianglePointer oldDelegate) =>
      oldDelegate.color != color || oldDelegate.pointingUp != pointingUp;
}
