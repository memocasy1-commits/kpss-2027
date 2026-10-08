import 'package:flutter/material.dart';
import '../data/chronology_data.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'bomb_play_screen.dart';
import 'chronology_play_screen.dart';
import 'clue_play_screen.dart';
import 'matching_play_screen.dart';
import 'map_point_game_screen.dart';

class GamesHubScreen extends StatefulWidget {
  const GamesHubScreen({super.key});

  @override
  State<GamesHubScreen> createState() => _GamesHubScreenState();
}

class _GamesHubScreenState extends State<GamesHubScreen> {
  String _selectedCategory = 'all'; // 'all', 'tarih', 'cografya', 'vatandaslik'

  final List<Map<String, dynamic>> _categories = [
    {
      'id': 'all',
      'label': 'Tüm Dersler (Karma)',
      'shortLabel': 'Tümü',
      'icon': Icons.all_inclusive_rounded,
      'color': const Color(0xFF6366F1),
    },
    {
      'id': 'tarih',
      'label': 'Tarih',
      'shortLabel': 'Tarih',
      'icon': Icons.history_edu_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'id': 'cografya',
      'label': 'Coğrafya',
      'shortLabel': 'Coğrafya',
      'icon': Icons.public_rounded,
      'color': const Color(0xFF059669),
    },
    {
      'id': 'vatandaslik',
      'label': 'Vatandaşlık & Güncel',
      'shortLabel': 'Vatandaşlık',
      'icon': Icons.gavel_rounded,
      'color': const Color(0xFF7C3AED),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final Color bgColor = AppColors.background;
        final Color surfaceBg = AppColors.surface;
        final Color cardBg = AppColors.card;
        final Color borderColor = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;
        final Color brandPurple = const Color(0xFF6D28D9);

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: surfaceBg,
            elevation: 0,
            leading: IconButton(
              tooltip: 'Geri Dön',
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: textPrimary, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            titleSpacing: 0,
            shape: Border(bottom: BorderSide(color: borderColor, width: 1)),
            title: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: brandPurple.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: brandPurple.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.extension_rounded, color: brandPurple, size: 20),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HAFIZA & PRATİK ATÖLYESİ',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      'Zihin Egzersizleri & Hızlı Pekiştirme',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
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
                  color: textSecondary,
                  size: 21,
                ),
                onPressed: () => ThemeService.instance.toggleTheme(),
              ),
              const SizedBox(width: 4),
            ],
          ),
          body: SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 36),
              children: [
                // 1. HERO BANNER: ATÖLYE VİTRİNİ
                _buildHeroBanner(
                  cardBg: cardBg,
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  brandColor: brandPurple,
                ),
                const SizedBox(height: 18),

                // 2. DERS ODAĞI FİLTRESİ
                _buildCourseFilterSection(
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  cardBg: cardBg,
                ),
                const SizedBox(height: 20),

                // 3. EGZERSİZ MODÜLLERİ (4 ADET PRESTİJLİ KART)
                // MODÜL 1: 60 SANİYE BİLGİ BOMBASI
                _buildExerciseCard(
                  context: context,
                  cardBg: cardBg,
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  accentColor: const Color(0xFFE11D48), // Rose Crimson
                  icon: Icons.timer_outlined,
                  tag: 'HIZ & REFLEKS',
                  title: '60 Saniye Bilgi Bombası',
                  description: 'Zamana karşı yarışarak seri Doğru/Yanlış önermelerini yanıtlayın. Bilgiyi zihninizden anında geri çağırma refleksinizi zirveye taşıyın.',
                  highlights: const ['60 Saniye', 'Seri D/Y', 'Kombo Katlayıcı', 'Altın Bilgiler'],
                  buttonLabel: 'Egzersizi Başlat',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BombPlayScreen(category: _selectedCategory),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // MODÜL 2: 3 İPUÇLU GİZEMLİ BİLGİ
                _buildExerciseCard(
                  context: context,
                  cardBg: cardBg,
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  accentColor: const Color(0xFFD97706), // Warm Amber
                  icon: Icons.lightbulb_outline_rounded,
                  tag: 'TÜMDENGELİM & ÇAĞRIŞIM',
                  title: '3 İpuçlu Gizemli Bilgi',
                  description: 'Kademeli ipuçlarıyla gizlenen tarihi şahsiyeti, olayı veya coğrafi unsuru keşfedin. Ne kadar erken bilirseniz o kadar yüksek puan kazanırsınız.',
                  highlights: const ['3 Kademeli İpucu', '2.000 Soru', '300 / 200 / 100 Puan', 'Tümdengelim'],
                  buttonLabel: 'Gizemi Çözmeye Başla',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CluePlayScreen(category: _selectedCategory),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // MODÜL 3: KAVRAM & ESER EŞLEŞTİRME
                _buildExerciseCard(
                  context: context,
                  cardBg: cardBg,
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  accentColor: const Color(0xFF059669), // Emerald
                  icon: Icons.compare_arrows_rounded,
                  tag: 'GÖRSEL HAFIZA & AĞ',
                  title: 'Kavram & Eser Eşleştirme',
                  description: 'Eser-Yazar, Antlaşma-Önem, Maden-Şehir ve Anayasal kavramları eşleştirin. Bilgiler arasındaki mantıksal ağları güçlendirin.',
                  highlights: const ['4\'lü Kart Grupları', '3.000+ Eşleşme Çifti', 'Hızlı Eşleme', 'Pekiştirme'],
                  buttonLabel: 'Eşleştirmeye Başla',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MatchingPlayScreen(category: _selectedCategory),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // MODÜL 4: ZAMAN TÜNELİ (KRONOLOJİ SIRALAMA)
                _buildExerciseCard(
                  context: context,
                  cardBg: cardBg,
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  accentColor: const Color(0xFF4F46E5), // Indigo
                  icon: Icons.timeline_rounded,
                  tag: 'TARİHİ DİZİLİM & AKIŞ',
                  title: 'Zaman Tüneli (Kronoloji)',
                  description: 'Tarihi dönüm noktalarını, padişahları, savaşları ve anayasal süreçleri sürükleyip bırakarak kronolojik zaman çizgisine dizin.',
                  highlights: const ['40 Kademeli Seviye', '200+ Tarihi Olay', 'Sürükle & Sırala', 'Dönem Analizi'],
                  buttonLabel: 'Seviye Seç ve Sırala',
                  onTap: () => _openChronologyLevelPicker(context, cardBg, borderColor, textPrimary, textSecondary),
                ),
                const SizedBox(height: 16),

                // MODÜL 5: HARİTADA NOKTA ATIŞI (KPSS GEOGUESSR)
                _buildExerciseCard(
                  context: context,
                  cardBg: cardBg,
                  borderColor: borderColor,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  accentColor: const Color(0xFF0D9488), // Teal
                  icon: Icons.place_rounded,
                  tag: 'HARİTA & MEKÂNSAL HAFIZA',
                  title: 'Haritada Nokta Atışı',
                  description: 'Dilsiz Türkiye haritası üzerinde madenleri, ovaları, deltaları, barajları ve sanayi merkezlerini parmağınızla nokta atışı bularak en yüksek puanı toplayın.',
                  highlights: const ['Dilsiz Harita', 'Km Mesafe Ölçer', '30+ KPSS Noktası', 'GeoGuessr Modu'],
                  buttonLabel: 'Haritada Keşfe Başla',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MapPointGameScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- 1. HERO BANNER ---
  Widget _buildHeroBanner({
    required Color cardBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color brandColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: brandColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: brandColor.withValues(alpha: 0.25)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome_rounded, color: brandColor, size: 13),
                    const SizedBox(width: 5),
                    Text(
                      'ZİHİN PERFORMANSI',
                      style: TextStyle(
                        color: brandColor,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                '5 Pratik Modülü',
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Ezberleme, Kalıcı Hafızaya Kazı!',
            style: TextStyle(
              color: textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Soru çözümlerinden sonra bilgilerin zihinde oturmasını sağlayan dinamik pratikler. Hızlı düşünme, mekânsal harita hafızası ve kronolojik kavrayışı pekiştirin.',
            style: TextStyle(
              color: textSecondary,
              fontSize: 12.5,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          // Mini özellik hapları
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _buildMiniChip(Icons.place_rounded, 'Dilsiz Harita', textSecondary, borderColor),
              _buildMiniChip(Icons.bolt_rounded, 'Refleks & Hız', textSecondary, borderColor),
              _buildMiniChip(Icons.psychology_outlined, 'Tümdengelim', textSecondary, borderColor),
              _buildMiniChip(Icons.hub_outlined, 'Kavram Ağları', textSecondary, borderColor),
              _buildMiniChip(Icons.access_time_rounded, 'Kronoloji', textSecondary, borderColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniChip(IconData icon, String text, Color textColor, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // --- 2. DERS ODAĞI FİLTRESİ ---
  Widget _buildCourseFilterSection({
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color cardBg,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'DERS VE ALAN ODAĞI',
              style: TextStyle(
                color: textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              'Soruları filtreler',
              style: TextStyle(
                color: textSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: _categories.map((cat) {
              final isSelected = _selectedCategory == cat['id'];
              final Color catColor = cat['color'] as Color;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = cat['id'] as String;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                    decoration: BoxDecoration(
                      color: isSelected ? catColor : cardBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? catColor : borderColor,
                        width: 1.2,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: catColor.withValues(alpha: 0.28),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          cat['icon'] as IconData,
                          size: 15,
                          color: isSelected ? Colors.white : catColor,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          cat['label'] as String,
                          style: TextStyle(
                            color: isSelected ? Colors.white : textPrimary,
                            fontSize: 12.5,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // --- 3. PREMİUM EGZERSİZ KARTI ---
  Widget _buildExerciseCard({
    required BuildContext context,
    required Color cardBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color accentColor,
    required IconData icon,
    required String tag,
    required String title,
    required String description,
    required List<String> highlights,
    required String buttonLabel,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Üst Başlık & İkon & Rozet
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: accentColor.withValues(alpha: 0.25)),
                      ),
                      child: Icon(icon, color: accentColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                    color: accentColor,
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF10B981).withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.25)),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 10),
                                    SizedBox(width: 4),
                                    Text(
                                      'AKTİF',
                                      style: TextStyle(
                                        color: Color(0xFF10B981),
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            title,
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 16.5,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Açıklama Metni
                Text(
                  description,
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 12.5,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 14),

                // Özellik Şeridi (Highlights)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor, width: 0.8),
                  ),
                  child: Text(
                    highlights.join('  •  '),
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Aksiyon Butonu
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    icon: const Icon(Icons.play_arrow_rounded, size: 20),
                    label: Text(
                      buttonLabel,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 4. KRONOLOJİ SEVİYE SEÇİCİ BOTTOM SHEET ---
  void _openChronologyLevelPicker(
    BuildContext context,
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
  ) {
    final availableLevels = _selectedCategory == 'all'
        ? ChronologyData.levels
        : ChronologyData.levels.where((l) => l.category == _selectedCategory).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: cardBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Icon(Icons.timeline_rounded, color: Color(0xFF4F46E5), size: 18),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zaman Tüneli - Seviye Seçimi',
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Olayları kronolojik sıraya göre düzenleyin',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_rounded, color: textSecondary, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                if (availableLevels.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        'Bu ders kategorisinde şu an kronoloji seviyesi bulunmamaktadır.',
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )
                else
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: availableLevels.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final lvl = availableLevels[index];
                        return ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: borderColor),
                          ),
                          tileColor: AppColors.background.withValues(alpha: 0.5),
                          leading: CircleAvatar(
                            radius: 17,
                            backgroundColor: const Color(0xFF4F46E5).withValues(alpha: 0.15),
                            foregroundColor: const Color(0xFF4F46E5),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                            ),
                          ),
                          title: Text(
                            lvl.title,
                            style: TextStyle(
                              color: textPrimary,
                              fontWeight: FontWeight.w800,
                              fontSize: 13.5,
                            ),
                          ),
                          subtitle: Text(
                            '${lvl.category.toUpperCase()} • ${lvl.difficulty} • ${lvl.items.length} Olay',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 11.5,
                            ),
                          ),
                          trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF4F46E5), size: 20),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChronologyPlayScreen(level: lvl),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
