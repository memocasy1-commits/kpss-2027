import 'package:flutter/material.dart';
import '../services/gamification_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key});

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  List<BadgeItem> _badges = [];
  bool _isLoading = true;
  String _selectedCategory = 'Tümü';

  @override
  void initState() {
    super.initState();
    _loadBadges();
  }

  Future<void> _loadBadges() async {
    setState(() => _isLoading = true);
    final list = await GamificationService.instance.getAllBadges();
    if (mounted) {
      setState(() {
        _badges = list;
        _isLoading = false;
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

        final int unlockedCount = _badges.where((b) => b.isUnlocked).length;
        final double overallProgress = _badges.isNotEmpty ? unlockedCount / _badges.length : 0.0;

        final categories = ['Tümü', 'Genel', 'Dersler', 'Odak'];
        final filteredBadges = _selectedCategory == 'Tümü'
            ? _badges
            : _badges.where((b) => b.category == _selectedCategory).toList();

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              'Başarılarım & Rozetler',
              style: TextStyle(color: textPrimary, fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          body: _isLoading
              ? Center(child: CircularProgressIndicator(color: AppColors.primary))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Progress Banner
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF312E81), Color(0xFF4338CA), Color(0xFF6366F1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
                              ),
                              child: const Icon(Icons.military_tech_rounded, color: Color(0xFFFBBF24), size: 36),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$unlockedCount / ${_badges.length} Rozet Açıldı',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: LinearProgressIndicator(
                                      value: overallProgress,
                                      minHeight: 8,
                                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFBBF24)),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '%${(overallProgress * 100).toInt()} Tamamlandı • Başarılarınla motive ol!',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.85),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Category Filter Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((cat) {
                            final isSel = _selectedCategory == cat;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                label: Text(cat),
                                selected: isSel,
                                onSelected: (sel) {
                                  if (sel) setState(() => _selectedCategory = cat);
                                },
                                selectedColor: AppColors.primary,
                                backgroundColor: cardBg,
                                labelStyle: TextStyle(
                                  color: isSel ? Colors.white : textSecondary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: isSel ? AppColors.primary : cardBorder),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Badges Grid
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredBadges.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.82,
                        ),
                        itemBuilder: (context, index) {
                          final b = filteredBadges[index];
                          return _buildBadgeCard(b, isDark, cardBg, cardBorder, textPrimary, textSecondary);
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildBadgeCard(
    BadgeItem b,
    bool isDark,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: b.isUnlocked ? b.color.withValues(alpha: 0.5) : cardBorder,
          width: b.isUnlocked ? 1.5 : 1,
        ),
        boxShadow: [
          if (b.isUnlocked)
            BoxShadow(
              color: b.color.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: b.isUnlocked
                  ? b.color.withValues(alpha: 0.18)
                  : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
              shape: BoxShape.circle,
              border: Border.all(
                color: b.isUnlocked ? b.color : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Icon(
              b.icon,
              color: b.isUnlocked ? b.color : (isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8)),
              size: 26,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            b.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: b.isUnlocked ? textPrimary : textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            b.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textSecondary,
              fontSize: 11,
              height: 1.25,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          if (b.isUnlocked)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: b.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_rounded, color: b.color, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Kazanıldı',
                    style: TextStyle(color: b.color, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          else ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: b.progressRatio,
                minHeight: 5,
                backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                valueColor: AlwaysStoppedAnimation<Color>(b.color),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${b.current}/${b.target} (${b.progressPercent}%)',
              style: TextStyle(color: textSecondary, fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }
}
