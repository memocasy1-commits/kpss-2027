import 'package:flutter/material.dart';
import '../models/game_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class ChronologyPlayScreen extends StatefulWidget {
  final ChronologyLevel level;

  const ChronologyPlayScreen({super.key, required this.level});

  @override
  State<ChronologyPlayScreen> createState() => _ChronologyPlayScreenState();
}

class _ChronologyPlayScreenState extends State<ChronologyPlayScreen> {
  late List<ChronologyItem> _currentList;
  bool _isSubmitted = false;
  bool _isSuccess = false;
  int _score = 0;
  int _moves = 0;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    // Shuffle the items until it's not accidentally identical to the solution
    List<ChronologyItem> shuffled = List.from(widget.level.items);
    int attempts = 0;
    do {
      shuffled.shuffle();
      attempts++;
    } while (_isAlreadyCorrect(shuffled) && attempts < 10);

    setState(() {
      _currentList = shuffled;
      _isSubmitted = false;
      _isSuccess = false;
      _moves = 0;
      _score = 0;
    });
  }

  bool _isAlreadyCorrect(List<ChronologyItem> list) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].id != widget.level.items[i].id) {
        return false;
      }
    }
    return true;
  }

  void _onReorderItem(int oldIndex, int newIndex) {
    if (_isSubmitted) return; // Locked after submitting
    setState(() {
      final item = _currentList.removeAt(oldIndex);
      _currentList.insert(newIndex, item);
      _moves++;
    });
  }

  void _checkOrder() {
    bool correct = true;
    int correctCount = 0;

    for (int i = 0; i < _currentList.length; i++) {
      if (_currentList[i].id == widget.level.items[i].id) {
        correctCount++;
      } else {
        correct = false;
      }
    }

    // Score based on accuracy and move count
    int calculatedScore = (correctCount * 20);
    if (correct) {
      calculatedScore += 50; // Completion bonus
      if (_moves <= widget.level.items.length + 1) {
        calculatedScore += 30; // Efficiency bonus
      }
    }

    setState(() {
      _isSubmitted = true;
      _isSuccess = correct;
      _score = calculatedScore;
    });

    if (correct) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return ValueListenableBuilder<ThemeModeType>(
          valueListenable: ThemeService.instance.modeNotifier,
          builder: (context, themeMode, _) {
            final cardBg = AppColors.card;
            final textCol = AppColors.textPrimary;
            final textSecondary = AppColors.textSecondary;

            return AlertDialog(
              backgroundColor: cardBg,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: Row(
                children: [
                  const Icon(Icons.celebration_rounded, color: AppColors.warning, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Tebrikler! Kusursuz!',
                    style: TextStyle(color: textCol, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tüm olayları eksiksiz bir şekilde kronolojik sıraya dizdiniz.',
                    style: TextStyle(color: textSecondary),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text('Kazanılan Puan', style: TextStyle(fontSize: 11, color: AppColors.success)),
                            Text('+$_score', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.success)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Hamle Sayısı', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                            Text('$_moves Hamle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textCol)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.pop(context);
                  },
                  child: const Text('Bölüm Listesi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    _resetGame();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  child: const Text('Tekrar Oyna', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final bgColor = AppColors.background;
        final textPrimary = AppColors.textPrimary;
        final textSecondary = AppColors.textSecondary;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              widget.level.title,
              style: TextStyle(color: textPrimary, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                tooltip: 'Sıfırla / Karıştır',
                icon: const Icon(Icons.refresh_rounded),
                onPressed: _resetGame,
              ),
              IconButton(
                tooltip: themeMode == ThemeModeType.dark
                    ? 'Gündüz Modu'
                    : (themeMode == ThemeModeType.light
                        ? 'Sepya / Kâğıt Modu'
                        : 'Karanlık Mod'),
                icon: Icon(
                  themeMode == ThemeModeType.dark
                      ? Icons.light_mode_outlined
                      : (themeMode == ThemeModeType.light
                          ? Icons.auto_stories_outlined
                          : Icons.dark_mode_outlined),
                  color: isDark ? const Color(0xFFFBBF24) : AppColors.primary,
                ),
                onPressed: () => ThemeService.instance.toggleTheme(),
              ),
            ],
          ),
          body: Column(
            children: [
              // Instruction Banner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.cardBorder,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.swap_vert_rounded, color: AppColors.primaryLight, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.level.description,
                            style: TextStyle(color: textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Kartların sağındaki ikondan tutup yukarı/aşağı sürükleyiniz.',
                            style: TextStyle(color: textSecondary, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$_moves Hamle',
                        style: TextStyle(color: AppColors.primaryLight, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),

              // Reorderable Timeline List
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: _currentList.length,
                    onReorderItem: _onReorderItem,
                    itemBuilder: (context, index) {
                      final item = _currentList[index];
                      final bool isCorrectPosition = _isSubmitted && item.id == widget.level.items[index].id;
                      final bool isWrongPosition = _isSubmitted && item.id != widget.level.items[index].id;

                      return _buildTimelineItem(
                        key: ValueKey(item.id),
                        item: item,
                        index: index,
                        isDark: isDark,
                        isCorrect: isCorrectPosition,
                        isWrong: isWrongPosition,
                      );
                    },
                  ),
                ),
              ),

              // Submit / Control Button Bar
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF0F172A) : Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: isDark ? const Color(0xFF2E3D52) : const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (_isSubmitted && !_isSuccess)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _resetGame,
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Tekrar Sırala'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                        ),
                      if (_isSubmitted && !_isSuccess) const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _isSubmitted && _isSuccess ? () => Navigator.pop(context) : _checkOrder,
                          icon: Icon(
                            _isSubmitted && _isSuccess ? Icons.check_circle_rounded : Icons.task_alt_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            _isSubmitted
                                ? (_isSuccess ? 'Tamamlandı! (Geri Dön)' : 'Kontrol Edildi')
                                : 'Sıralamayı Kontrol Et',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isSubmitted
                                ? (_isSuccess ? AppColors.success : AppColors.primary)
                                : AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimelineItem({
    required Key key,
    required ChronologyItem item,
    required int index,
    required bool isDark,
    required bool isCorrect,
    required bool isWrong,
  }) {
    Color cardBg = AppColors.card;
    Color borderColor = AppColors.cardBorder;
    Color stepBadgeBg = AppColors.primary.withValues(alpha: 0.15);
    Color stepBadgeText = AppColors.primaryLight;

    if (isCorrect) {
      cardBg = AppColors.success.withValues(alpha: isDark ? 0.12 : 0.08);
      borderColor = AppColors.success;
      stepBadgeBg = AppColors.success;
      stepBadgeText = Colors.white;
    } else if (isWrong) {
      cardBg = AppColors.error.withValues(alpha: isDark ? 0.12 : 0.08);
      borderColor = AppColors.error.withValues(alpha: 0.7);
      stepBadgeBg = AppColors.error;
      stepBadgeText = Colors.white;
    }

    final textPrimary = isDark ? Colors.white : const Color(0xFF0F172A);

    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: isCorrect || isWrong ? 1.8 : 1.2),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.25)
                : const Color(0xFF64748B).withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sequence Number Badge
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: stepBadgeBg,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: stepBadgeText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Information & Title
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      if (_isSubmitted)
                        Icon(
                          isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                          color: isCorrect ? AppColors.success : AppColors.error,
                          size: 20,
                        ),
                    ],
                  ),
                  if (_isSubmitted) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: (isCorrect ? AppColors.success : AppColors.error).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 11,
                            color: isCorrect ? AppColors.success : AppColors.error,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            item.yearOrEra,
                            style: TextStyle(
                              color: isCorrect ? AppColors.success : AppColors.error,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark ? const Color(0xFF2E3D52) : const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Text(
                        '💡 Altın Bilgi: ${item.detail}',
                        style: TextStyle(
                          color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                          fontSize: 11,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 10),

            // Drag handle icon
            if (!_isSubmitted)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Icon(
                  Icons.drag_indicator_rounded,
                  color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
