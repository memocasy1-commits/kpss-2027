import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  GamificationSummary? _summary;
  bool _isLoading = true;
  String _selectedCategory = 'Tümü';
  bool _onlyUnlocked = false;

  @override
  void initState() {
    super.initState();
    _loadBadges();
  }

  Future<void> _loadBadges() async {
    setState(() => _isLoading = true);
    final list = await GamificationService.instance.getAllBadges();
    final summary = await GamificationService.instance.getSummary();
    if (mounted) {
      setState(() {
        _badges = list;
        _summary = summary;
        _isLoading = false;
      });
    }
  }

  void _showBadgeDetail(BadgeItem b) {
    HapticFeedback.selectionClick();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _BadgeDetailSheet(badge: b),
    );
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

        final categories = ['Tümü', 'Genel', 'Disiplin', 'Dersler', 'Oyunlar', 'Odak'];

        var filteredBadges = _selectedCategory == 'Tümü'
            ? _badges
            : _badges.where((b) => b.category == _selectedCategory).toList();

        if (_onlyUnlocked) {
          filteredBadges = filteredBadges.where((b) => b.isUnlocked).toList();
        }

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              'Başarılarım & Rozetler',
              style: TextStyle(color: textPrimary, fontSize: 19, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                tooltip: _onlyUnlocked ? 'Tüm Rozetleri Göster' : 'Sadece Kazanılanları Göster',
                icon: Icon(
                  _onlyUnlocked ? Icons.filter_alt_rounded : Icons.filter_alt_outlined,
                  color: _onlyUnlocked ? AppColors.primary : textSecondary,
                ),
                onPressed: () {
                  HapticFeedback.selectionClick();
                  setState(() => _onlyUnlocked = !_onlyUnlocked);
                },
              ),
            ],
          ),
          body: _isLoading
              ? Center(child: CircularProgressIndicator(color: AppColors.primary))
              : RefreshIndicator(
                  onRefresh: _loadBadges,
                  color: AppColors.primary,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Level & XP Hero Banner
                        if (_summary != null) _buildLevelBanner(_summary!, isDark),
                        const SizedBox(height: 18),

                        // 2. Category Filter Chips
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
                                    if (sel) {
                                      HapticFeedback.selectionClick();
                                      setState(() => _selectedCategory = cat);
                                    }
                                  },
                                  selectedColor: AppColors.primary,
                                  backgroundColor: cardBg,
                                  labelStyle: TextStyle(
                                    color: isSel ? Colors.white : textSecondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.5,
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
                        const SizedBox(height: 16),

                        // Section Count Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$_selectedCategory Rozetleri (${filteredBadges.length})',
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '${_badges.where((b) => b.isUnlocked).length}/${_badges.length} Kazanıldı',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Badges Grid
                        if (filteredBadges.isEmpty)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: cardBorder),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.military_tech_outlined, size: 48, color: textSecondary),
                                const SizedBox(height: 10),
                                Text(
                                  'Bu kategoride henüz kazanılmış rozet yok.',
                                  style: TextStyle(color: textSecondary, fontSize: 13, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        else
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
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildLevelBanner(GamificationSummary s, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1B4B), Color(0xFF312E81), Color(0xFF4338CA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4338CA).withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Level Badge Circle
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF59E0B).withValues(alpha: 0.45),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'SEVİYE',
                        style: TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '${s.level}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Title and XP
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.levelTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${s.totalXp} XP',
                            style: const TextStyle(
                              color: Color(0xFFFDE047),
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            '${s.unlockedCount} / ${s.totalCount} Rozet',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Level Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: s.levelProgress,
              minHeight: 7,
              backgroundColor: Colors.white.withValues(alpha: 0.18),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFDE047)),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sonraki Seviyeye: ${s.nextLevelXp - s.currentLevelXp} XP kaldı',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 11),
              ),
              Text(
                '%${(s.levelProgress * 100).toInt()}',
                style: const TextStyle(color: Color(0xFFFDE047), fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
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
    return InkWell(
      onTap: () => _showBadgeDetail(b),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: b.isUnlocked ? b.color.withValues(alpha: 0.55) : cardBorder,
            width: b.isUnlocked ? 1.5 : 1,
          ),
          boxShadow: [
            if (b.isUnlocked)
              BoxShadow(
                color: b.color.withValues(alpha: 0.18),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top Tier Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: b.tierColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    b.tierName,
                    style: TextStyle(
                      color: b.tierColor,
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Text(
                  '+${b.xpReward} XP',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 9.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Emblem Icon
            Container(
              width: 48,
              height: 48,
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
                size: 24,
              ),
            ),
            const SizedBox(height: 8),

            // Badge Title
            Text(
              b.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: b.isUnlocked ? textPrimary : textSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),

            // Description
            Expanded(
              child: Text(
                b.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 10.5,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),

            // Bottom Progress or Status
            if (b.isUnlocked)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: b.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle_rounded, color: b.color, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      'Kazanıldı',
                      style: TextStyle(color: b.color, fontSize: 10.5, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            else ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: b.progressRatio,
                  minHeight: 4,
                  backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                  valueColor: AlwaysStoppedAnimation<Color>(b.color),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${b.current}/${b.target} (%${b.progressPercent})',
                style: TextStyle(color: textSecondary, fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BadgeDetailSheet extends StatelessWidget {
  final BadgeItem badge;

  const _BadgeDetailSheet({required this.badge});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final Color cardBg = isDark ? const Color(0xFF1E293B) : Colors.white;
        final Color textPrimary = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
        final Color textSecondary = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
        final Color borderColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);

        return Container(
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sheet Handle
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Glowing Badge Circle
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: badge.isUnlocked
                      ? badge.color.withValues(alpha: 0.18)
                      : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: badge.isUnlocked ? badge.color : Colors.transparent,
                    width: 2.5,
                  ),
                  boxShadow: [
                    if (badge.isUnlocked)
                      BoxShadow(
                        color: badge.color.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                  ],
                ),
                child: Icon(
                  badge.icon,
                  size: 42,
                  color: badge.isUnlocked ? badge.color : (isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8)),
                ),
              ),
              const SizedBox(height: 14),

              // Tier & Category Chips
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: badge.tierColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${badge.tierName} Rozet',
                      style: TextStyle(color: badge.tierColor, fontSize: 11.5, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '+${badge.xpReward} XP',
                      style: const TextStyle(color: Color(0xFF6366F1), fontSize: 11.5, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Title
              Text(
                badge.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),

              // Description
              Text(
                badge.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),

              // Requirement Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline_rounded, size: 16, color: Color(0xFF6366F1)),
                        const SizedBox(width: 6),
                        const Text(
                          'NASIL KAZANILIR?',
                          style: TextStyle(
                            color: Color(0xFF6366F1),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      badge.howToUnlock.isNotEmpty ? badge.howToUnlock : badge.description,
                      style: TextStyle(color: textPrimary, fontSize: 12.5, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Progress Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'İlerleme: ${badge.current} / ${badge.target}',
                    style: TextStyle(color: textSecondary, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '%${badge.progressPercent}',
                    style: TextStyle(color: badge.color, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: badge.progressRatio,
                  minHeight: 8,
                  backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                  valueColor: AlwaysStoppedAnimation<Color>(badge.color),
                ),
              ),
              const SizedBox(height: 22),

              // Close Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text(
                    'Kapat & Devam Et',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
