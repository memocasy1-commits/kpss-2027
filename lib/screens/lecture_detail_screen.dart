import 'package:flutter/material.dart';
import '../models/lecture_model.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';
import '../widgets/math_expression_widget.dart';

enum LectureViewMode {
  stream, // Geniş, ferah akordeon liste
  focus,  // Tek tek odaklanan kart / slayt modu
}

class LectureDetailScreen extends StatefulWidget {
  final LectureTopic topic;

  const LectureDetailScreen({super.key, required this.topic});

  @override
  State<LectureDetailScreen> createState() => _LectureDetailScreenState();
}

class _LectureDetailScreenState extends State<LectureDetailScreen> {
  double _fontScale = 1.0;
  LectureViewMode _viewMode = LectureViewMode.stream;
  int _currentFocusIndex = 0;
  late final PageController _pageController;

  // Filtreleme: 'all', 'formula', 'warning', 'comparison', 'interactiveQuiz'
  String _selectedFilter = 'all';

  // Quiz durumları: quizKey -> selectedOptionIndex
  final Map<String, int?> _quizUserSelections = {};

  // Açık olan akordeon başlıkları (varsayılan: ilk 2'si açık)
  final Set<int> _expandedSections = {0, 1};

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _increaseFont() {
    if (_fontScale < 1.35) setState(() => _fontScale += 0.1);
  }

  void _decreaseFont() {
    if (_fontScale > 0.85) setState(() => _fontScale -= 0.1);
  }

  void _startTopicTest() {
    final List<Question> questions = QuestionService.instance.getQuestionsForTest(
      widget.topic.courseId,
      widget.topic.startTestNum,
    );

    if (questions.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ExamScreen(
            title: '${widget.topic.title} - Test ${widget.topic.startTestNum}',
            questions: questions,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${widget.topic.title} için test soruları hazırlanıyor.'),
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }

  List<LectureSection> get _filteredSections {
    if (_selectedFilter == 'all') return widget.topic.sections;
    if (_selectedFilter == 'formula') {
      return widget.topic.sections
          .where((s) => s.type == LectureSectionType.formula || s.goldenRule != null)
          .toList();
    }
    if (_selectedFilter == 'warning') {
      return widget.topic.sections
          .where((s) => s.type == LectureSectionType.warning || s.osymTrap != null)
          .toList();
    }
    if (_selectedFilter == 'comparison') {
      return widget.topic.sections
          .where((s) => s.type == LectureSectionType.comparison || (s.comparisonRows != null && s.comparisonRows!.isNotEmpty))
          .toList();
    }
    if (_selectedFilter == 'interactiveQuiz') {
      return widget.topic.sections
          .where((s) => s.type == LectureSectionType.interactiveQuiz || (s.quizzes != null && s.quizzes!.isNotEmpty))
          .toList();
    }
    return widget.topic.sections;
  }

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
        final Color topicColor = widget.topic.color;

        final sections = _filteredSections;

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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.topic.title,
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '${widget.topic.testRange} • ${widget.topic.estimatedMinutes} dk Okuma',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            actions: [
              // Görünüm Modu Değiştirici (Akış vs. Odak Kartı)
              Tooltip(
                message: _viewMode == LectureViewMode.stream ? 'Odak / Kart Moduna Geç' : 'Geniş Akış Moduna Geç',
                child: IconButton(
                  icon: Icon(
                    _viewMode == LectureViewMode.stream ? Icons.view_carousel_rounded : Icons.view_agenda_rounded,
                    color: topicColor,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _viewMode = _viewMode == LectureViewMode.stream
                          ? LectureViewMode.focus
                          : LectureViewMode.stream;
                    });
                  },
                ),
              ),

              // Yazı Boyutu Butonları
              IconButton(
                tooltip: 'Yazıyı Küçült',
                icon: Icon(Icons.zoom_out_rounded, color: textSecondary, size: 20),
                onPressed: _decreaseFont,
              ),
              IconButton(
                tooltip: 'Yazıyı Büyüt',
                icon: Icon(Icons.zoom_in_rounded, color: textSecondary, size: 20),
                onPressed: _increaseFont,
              ),
              const SizedBox(width: 4),
            ],
          ),
          body: Column(
            children: [
              // ÜST FİLTRE VE MOD SEÇİM ÇUBUĞU
              _buildTopFilterBar(surfaceBg, borderColor, topicColor, textPrimary, textSecondary),

              // ANA İÇERİK (AKORDEON AKIŞ VEYA ODAK KARTLARI)
              Expanded(
                child: sections.isEmpty
                    ? _buildEmptyState(textSecondary)
                    : (_viewMode == LectureViewMode.stream
                        ? _buildStreamView(sections, cardBg, borderColor, textPrimary, textSecondary, topicColor)
                        : _buildFocusView(sections, cardBg, borderColor, textPrimary, textSecondary, topicColor)),
              ),
            ],
          ),
          bottomNavigationBar: _buildBottomBar(surfaceBg, borderColor, topicColor, textPrimary, textSecondary),
        );
      },
    );
  }

  // ----------------------------------------------------
  // ÜST FİLTRE & KATEGORİ ÇUBUĞU
  // ----------------------------------------------------
  Widget _buildTopFilterBar(
    Color surfaceBg,
    Color borderColor,
    Color topicColor,
    Color textPrimary,
    Color textSecondary,
  ) {
    final filters = [
      {'key': 'all', 'label': 'Tüm Konu', 'icon': Icons.list_alt_rounded},
      {'key': 'formula', 'label': '💡 Formüller', 'icon': Icons.lightbulb_rounded},
      {'key': 'warning', 'label': '⚠️ ÖSYM Tuzakları', 'icon': Icons.warning_amber_rounded},
      {'key': 'comparison', 'label': '⚖️ Karşılaştırma', 'icon': Icons.compare_arrows_rounded},
      {'key': 'interactiveQuiz', 'label': '🎯 Sınav Simülasyonu', 'icon': Icons.quiz_rounded},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: surfaceBg,
        border: Border(bottom: BorderSide(color: borderColor, width: 1)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: filters.map((f) {
            final isSelected = _selectedFilter == f['key'];
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedFilter = f['key'] as String;
                    _currentFocusIndex = 0;
                  });
                },
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? topicColor : topicColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? topicColor : borderColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    f['label'] as String,
                    style: TextStyle(
                      color: isSelected ? Colors.white : textPrimary,
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // GÖRÜNÜM 1: FERAH AKORDEON & AKIŞ MODU
  // ----------------------------------------------------
  Widget _buildStreamView(
    List<LectureSection> sections,
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color topicColor,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      physics: const BouncingScrollPhysics(),
      itemCount: sections.length + 1, // +1 for Action Banner
      itemBuilder: (context, index) {
        if (index == sections.length) {
          return _buildActionBanner(
            topicColor: topicColor,
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          );
        }

        final section = sections[index];
        final isExpanded = _expandedSections.contains(index);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Material(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isExpanded ? topicColor.withValues(alpha: 0.4) : borderColor,
                  width: isExpanded ? 1.4 : 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
              initiallyExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  if (expanded) {
                    _expandedSections.add(index);
                  } else {
                    _expandedSections.remove(index);
                  }
                });
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
              leading: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: _getSectionTypeColor(section.type).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getSectionTypeIcon(section.type),
                  color: _getSectionTypeColor(section.type),
                  size: 20,
                ),
              ),
              title: Text(
                section.title,
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 15 * _fontScale,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  _getSectionTypeBadge(section.type),
                  style: TextStyle(
                    color: _getSectionTypeColor(section.type),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              children: [
                const SizedBox(height: 8),
                _buildSectionBody(section, cardBg, borderColor, textPrimary, textSecondary, topicColor),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
}

  // ----------------------------------------------------
  // GÖRÜNÜM 2: ODAK & KART KART İLERLEME MODU (PAGEVIEW)
  // ----------------------------------------------------
  Widget _buildFocusView(
    List<LectureSection> sections,
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color topicColor,
  ) {
    return Column(
      children: [
        // İlerleme Çubuğu ve İndikatör
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bölüm ${_currentFocusIndex + 1} / ${sections.length}',
                style: TextStyle(
                  color: topicColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              Row(
                children: List.generate(
                  sections.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    width: _currentFocusIndex == i ? 18 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentFocusIndex == i ? topicColor : borderColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Kaydırılabilir Odak Kartı
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: sections.length,
            onPageChanged: (i) => setState(() => _currentFocusIndex = i),
            itemBuilder: (context, index) {
              final section = sections[index];
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: topicColor.withValues(alpha: 0.3), width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getSectionTypeColor(section.type).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(_getSectionTypeIcon(section.type), color: _getSectionTypeColor(section.type), size: 14),
                                const SizedBox(width: 5),
                                Text(
                                  _getSectionTypeBadge(section.type),
                                  style: TextStyle(
                                    color: _getSectionTypeColor(section.type),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        section.title,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 18 * _fontScale,
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionBody(section, cardBg, borderColor, textPrimary, textSecondary, topicColor),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Önceki / Sonraki Kart Butonları
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _currentFocusIndex > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  icon: const Icon(Icons.arrow_back_rounded, size: 18),
                  label: const Text('Önceki'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: borderColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _currentFocusIndex < sections.length - 1
                      ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: const Text('Sonraki'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: topicColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------
  // BÖLÜM İÇERİK GÖVDESİ (GENİŞ, FERAH, NEFES ALAN DÜZEN)
  // ----------------------------------------------------
  Widget _buildSectionBody(
    LectureSection section,
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color topicColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // GİRİŞ AÇIKLAMASI
        if (section.leadText != null && section.leadText!.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: topicColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: topicColor.withValues(alpha: 0.15)),
            ),
            child: _buildMathRichText(
              section.leadText!,
              TextStyle(
                color: textPrimary,
                fontSize: 14 * _fontScale,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // 🗺️ ASKERİ TARİHİ HARİTA (SİYAH-BEYAZ ŞEMATİK CEPHE HARİTASI)
        if (section.mapData != null) ...[
          _buildBattleMap(section.mapData!, cardBg, borderColor, textPrimary, textSecondary, topicColor),
          const SizedBox(height: 18),
        ],

        // 🖼️ KONU ANLATIMI EĞİTİCİ ŞEKİL & DİYAGRAM KARTI
        if (section.imageAssetPath != null) ...[
          _buildSingleDiagramCard(context, section.imageAssetPath!, section.imageCaption, cardBg, borderColor, textPrimary, textSecondary, topicColor),
          const SizedBox(height: 18),
        ],

        // 🖼️ İKİNCİ GÖRSEL / HARİTA KARTI (PORTRE & HARİTA BİRLİKTE OLAN BÖLÜMLER İÇİN)
        if (section.secondImageAssetPath != null) ...[
          _buildSingleDiagramCard(context, section.secondImageAssetPath!, section.secondImageCaption, cardBg, borderColor, textPrimary, textSecondary, topicColor),
          const SizedBox(height: 18),
        ],

        // MADDE MADDE BİLGİ BLOKLARI (HER BİRİ AYRI FERAH KUTUDA)
        if (section.bulletPoints.isNotEmpty) ...[
          ...section.bulletPoints.map((bp) {
            final isExample = bp.trim().startsWith('📝') || bp.contains('ÇÖZÜMLÜ ÖRNEK') || bp.contains('ÖĞRETİCİ ÖRNEK');
            if (isExample) {
              return _buildInstructiveExampleCard(bp, textPrimary, textSecondary, topicColor, borderColor, _fontScale, cardBg);
            }

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor, width: 0.8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!bp.trim().startsWith('•') && !bp.trim().startsWith('▸') && !bp.trim().startsWith('◆') && !bp.trim().startsWith('🌊') && !bp.trim().startsWith('🚫') && !bp.trim().startsWith('📌')) ...[
                    Container(
                      margin: EdgeInsets.only(top: 6 * _fontScale),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: topicColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: _buildBulletContent(bp, textPrimary, topicColor, _fontScale),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 8),
        ],

        // 💡 ALTIN KURAL / FORMÜL KARTI (FERAH SARI/KEHRİBAR)
        if (section.goldenRule != null) ...[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7).withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFD97706), width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lightbulb_rounded, color: Color(0xFFD97706), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'ALTIN KURAL & FORMÜL',
                      style: TextStyle(
                        color: const Color(0xFFB45309),
                        fontSize: 12.5 * _fontScale,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildMathRichText(
                  section.goldenRule!,
                  TextStyle(
                    color: textPrimary,
                    fontSize: 13.5 * _fontScale,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],

        // ⚠️ ÖSYM TUZAĞI (KIRMIZI/TURUNCU UYARI BLOKU)
        if (section.osymTrap != null) ...[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFEE2E2).withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFDC2626), width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Color(0xFFDC2626), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'ÖSYM ÇELDİRİCİSİ & TUZAK',
                      style: TextStyle(
                        color: const Color(0xFFDC2626),
                        fontSize: 12.5 * _fontScale,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildMathRichText(
                  section.osymTrap!,
                  TextStyle(
                    color: textPrimary,
                    fontSize: 13.5 * _fontScale,
                    height: 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],

        // ⚖️ KARŞILAŞTIRMA TABLOSU (DOĞRU / YANLIŞ KARTLARI)
        if (section.comparisonRows != null && section.comparisonRows!.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            '⚖️ Doğru / Yanlış Karşılaştırma Analizi',
            style: TextStyle(
              color: textPrimary,
              fontSize: 14 * _fontScale,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          ...section.comparisonRows!.map((row) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.background.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildMathRichText(
                          row.correct,
                          TextStyle(
                            color: const Color(0xFF059669),
                            fontSize: 13.5 * _fontScale,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.cancel_rounded, color: Color(0xFFEF4444), size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildMathRichText(
                          row.wrong,
                          TextStyle(
                            color: const Color(0xFFDC2626),
                            fontSize: 13.5 * _fontScale,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (row.note != null) ...[
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: _buildMathRichText(
                        '💡 ${row.note!}',
                        TextStyle(
                          color: textSecondary,
                          fontSize: 12 * _fontScale,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],

        // 🎯 İNTERAKTİF TEST (MİNİ SINAV)
        if (section.quizzes != null && section.quizzes!.isNotEmpty) ...[
          const SizedBox(height: 14),
          ...section.quizzes!.asMap().entries.map((entry) {
            final qIdx = entry.key;
            final quiz = entry.value;
            final quizKey = '${section.title}_$qIdx';
            final selectedOpt = _quizUserSelections[quizKey];
            final bool isAnswered = selectedOpt != null;

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: topicColor.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: topicColor.withValues(alpha: 0.3), width: 1.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: topicColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Hemen Kendini Sına',
                          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: topicColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          quiz.ruleTag,
                          style: TextStyle(color: topicColor, fontSize: 10.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (quiz.imageAssetPath != null && quiz.imageAssetPath!.isNotEmpty) ...[
                    _buildExampleDiagramWidget(quiz.imageAssetPath!, context, _fontScale, AppColors.isDarkMode),
                    const SizedBox(height: 12),
                  ],
                  _buildMathRichText(
                    quiz.prompt,
                    TextStyle(
                      color: textPrimary,
                      fontSize: 14 * _fontScale,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...quiz.options.asMap().entries.map((optEntry) {
                    final optIdx = optEntry.key;
                    final optText = optEntry.value;

                    Color optBg = cardBg;
                    Color optBorder = borderColor;
                    Color optTextColor = textPrimary;

                    if (isAnswered) {
                      if (optIdx == quiz.correctIndex) {
                        optBg = const Color(0xFF10B981).withValues(alpha: 0.15);
                        optBorder = const Color(0xFF10B981);
                        optTextColor = const Color(0xFF059669);
                      } else if (optIdx == selectedOpt) {
                        optBg = const Color(0xFFEF4444).withValues(alpha: 0.15);
                        optBorder = const Color(0xFFEF4444);
                        optTextColor = const Color(0xFFDC2626);
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: isAnswered
                            ? null
                            : () => setState(() => _quizUserSelections[quizKey] = optIdx),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: optBg,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: optBorder, width: isAnswered && optIdx == quiz.correctIndex ? 1.5 : 1),
                          ),
                          child: Row(
                            children: [
                              Text(
                                String.fromCharCode(65 + optIdx),
                                style: TextStyle(
                                  color: optTextColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13 * _fontScale,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: _buildMathRichText(
                                  optText,
                                  TextStyle(
                                    color: optTextColor,
                                    fontSize: 13 * _fontScale,
                                    fontWeight: isAnswered && optIdx == quiz.correctIndex ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  if (isAnswered) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: selectedOpt == quiz.correctIndex
                            ? const Color(0xFF10B981).withValues(alpha: 0.1)
                            : const Color(0xFFEF4444).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _buildMathRichText(
                        quiz.explanation,
                        TextStyle(
                          color: textPrimary,
                          fontSize: 12.5 * _fontScale,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ],
    );
  }

  // ----------------------------------------------------
  // 🖼️ KONU ANLATIMI EĞİTİCİ ŞEKİL & DİYAGRAM GÖRSELLEŞTİRİCİSİ
  // ----------------------------------------------------
  Widget _buildSingleDiagramCard(
    BuildContext context,
    String imagePath,
    String? caption,
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color topicColor,
  ) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Görsel Başlığı / Çerçeve
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              constraints: const BoxConstraints(minHeight: 180, maxHeight: 320),
              child: Stack(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () => _openFullScreenDiagramModal(context, imagePath, caption),
                      child: InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 4.5,
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.broken_image_rounded, color: Colors.white54, size: 36),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Görsel yüklenemedi: $imagePath',
                                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => _openFullScreenDiagramModal(context, imagePath, caption),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.72),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white24, width: 0.8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.zoom_in_rounded, color: Colors.white, size: 14),
                              SizedBox(width: 4),
                              Text('Tam Ekran İncele', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (caption != null && caption.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: topicColor.withValues(alpha: 0.05),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                border: Border(
                  top: BorderSide(color: borderColor.withValues(alpha: 0.6)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Icon(Icons.insights_rounded, size: 16, color: topicColor),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      caption,
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 12 * _fontScale,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                        height: 1.4,
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

  void _openFullScreenDiagramModal(BuildContext context, String imagePath, String? caption) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.94),
      builder: (BuildContext ctx) {
        final TransformationController transformCtrl = TransformationController();
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Stack(
            children: [
              Positioned.fill(
                child: InteractiveViewer(
                  transformationController: transformCtrl,
                  minScale: 0.8,
                  maxScale: 6.0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.85),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.photo_size_select_actual_outlined, color: Colors.amber, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          caption ?? 'Detaylı İnceleme',
                          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.small(
                      heroTag: 'diag_zoom_in',
                      backgroundColor: Colors.black87,
                      child: const Icon(Icons.zoom_in, color: Colors.white),
                      onPressed: () {
                        transformCtrl.value = Matrix4.copy(transformCtrl.value)..scaleByDouble(1.3, 1.3, 1.0, 1.0);
                      },
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton.small(
                      heroTag: 'diag_zoom_out',
                      backgroundColor: Colors.black87,
                      child: const Icon(Icons.zoom_out, color: Colors.white),
                      onPressed: () {
                        transformCtrl.value = Matrix4.copy(transformCtrl.value)..scaleByDouble(0.77, 0.77, 1.0, 1.0);
                      },
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton.small(
                      heroTag: 'diag_zoom_reset',
                      backgroundColor: Colors.black87,
                      child: const Icon(Icons.refresh, color: Colors.white),
                      onPressed: () {
                        transformCtrl.value = Matrix4.identity();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ----------------------------------------------------
  // 🗺️ ASKERİ TARİHİ HARİTA GÖRSELLEŞTİRİCİSİ & TARİH ATLASI
  // ----------------------------------------------------
  Widget _buildBattleMap(
    LectureMapData mapData,
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color topicColor,
  ) {
    final bool isCografya = widget.topic.id.startsWith('cografya') ||
        (mapData.mapSource?.toLowerCase().contains('cografyaharita') ?? false) ||
        (mapData.mapSource?.contains('Coğrafya') ?? false) ||
        (mapData.mapSource?.contains('HGM') ?? false) ||
        (mapData.mapSource?.contains('MTA') ?? false) ||
        (mapData.mapSource?.contains('MGM') ?? false) ||
        (mapData.mapSource?.contains('TÜİK') ?? false);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black87, width: 1.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. HARİTA ÜST BAŞLIĞI
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Icon(isCografya ? Icons.map_rounded : Icons.explore_rounded, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mapData.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        mapData.subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (mapData.imageAssetPath != null)
                  IconButton(
                    tooltip: 'Tam Ekran Atlas',
                    onPressed: () => _openFullScreenMapModal(context, mapData),
                    icon: const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 22),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.navigation_rounded, color: Colors.white, size: 12),
                      SizedBox(width: 4),
                      Text('K', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. GERÇEK TARİHİ HARİTA GÖRSELİ (INTERAKTİF CANVAS)
          if (mapData.imageAssetPath != null) ...[
            Container(
              color: const Color(0xFF0F172A),
              child: Stack(
                children: [
                  ClipRect(
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 240, maxHeight: 340),
                      width: double.infinity,
                      child: InteractiveViewer(
                        clipBehavior: Clip.hardEdge,
                        minScale: 1.0,
                        maxScale: 4.5,
                        child: Center(
                          child: Image.asset(
                            mapData.imageAssetPath!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.broken_image_rounded, color: Colors.white54, size: 36),
                                      SizedBox(height: 8),
                                      Text(
                                        'Harita görseli yüklenemedi',
                                        style: TextStyle(color: Colors.white70, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Yakınlaştırma ve Tam Ekran Rozetleri
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => _openFullScreenMapModal(context, mapData),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.75),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white30),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.zoom_in_rounded, color: Colors.white, size: 15),
                                SizedBox(width: 4),
                                Text(
                                  'Tam Ekran Atlas',
                                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Çift Parmakla Kaydırma İpucu
                  Positioned(
                    bottom: 8,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pinch_rounded, color: Colors.white70, size: 13),
                          SizedBox(width: 5),
                          Text(
                            'İki parmakla yakınlaştırın & kaydırın',
                            style: TextStyle(color: Colors.white70, fontSize: 10.5, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Harita Kaynak ve İnceleme Çubuğu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withValues(alpha: 0.95),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFF334155), width: 1),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_balance_rounded, size: 13, color: Color(0xFF94A3B8)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      mapData.mapSource ?? 'Tarihî Askerî Harekât Haritası / Atlas Kaynaklı',
                      style: const TextStyle(
                        color: Color(0xFFCBD5E1),
                        fontSize: 10.5,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => _openFullScreenMapModal(context, mapData),
                    icon: const Icon(Icons.open_in_full_rounded, size: 13, color: Color(0xFF38BDF8)),
                    label: const Text(
                      'Büyüt',
                      style: TextStyle(color: Color(0xFF38BDF8), fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // 3. ŞEMATİK CEPHE YERLEŞİM ŞABLONU & DETAYLAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BAŞLIK BİLGİ ŞERİDİ
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: isCografya
                        ? const Color(0xFF0284C7).withValues(alpha: 0.1)
                        : const Color(0xFFB45309).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isCografya
                          ? const Color(0xFF0284C7).withValues(alpha: 0.3)
                          : const Color(0xFFB45309).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isCografya ? Icons.explore_rounded : Icons.military_tech_rounded,
                        size: 18,
                        color: isCografya ? const Color(0xFF0284C7) : const Color(0xFFB45309),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          isCografya
                              ? 'COĞRAFİ ANALİZ, HARİTA LEJANTI VE ÖSYM ODAKLARI'
                              : 'ASKERİ HAREKÂT VE CEPHE ANALİZİ',
                          style: TextStyle(
                            color: isCografya ? const Color(0xFF0369A1) : const Color(0xFF92400E),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isCografya ? const Color(0xFF0284C7) : const Color(0xFFB45309),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'ÖSYM Rehberi',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                // LEJANT (AÇIKLAMA TABLOSU VE KARTLAR)
                if (mapData.legends.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: AppColors.background.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor, width: 0.9),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(isCografya ? Icons.layers_rounded : Icons.military_tech_rounded,
                                size: 15, color: textPrimary),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                isCografya ? 'COĞRAFİ ANALİZ VE HARİTA LEJANTI' : 'ASKERİ HAREKÂT LEJANTI',
                                style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ...mapData.legends.map((l) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: borderColor.withValues(alpha: 0.6), width: 0.8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.03),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E293B),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    l.symbol,
                                    style: const TextStyle(
                                      color: Color(0xFF38BDF8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l.label,
                                        style: TextStyle(
                                          color: textPrimary,
                                          fontSize: 12.5 * _fontScale,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      if (l.description.isNotEmpty) ...[
                                        const SizedBox(height: 3),
                                        Text(
                                          l.description,
                                          style: TextStyle(
                                            color: textSecondary,
                                            fontSize: 11.5 * _fontScale,
                                            height: 1.35,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                // CEPHE / STRATEJİK ODAK KARTLARI LİSTESİ
                if (mapData.points.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(isCografya ? Icons.near_me_rounded : Icons.flag_rounded,
                          size: 15, color: textPrimary),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          isCografya
                              ? 'KRİTİK COĞRAFİ ODAKLAR VE MEKÂNSAL VERİLER'
                              : 'HAREKÂT BÖLGELERİ VE CEPHE AYRINTILARI',
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 11.5,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: borderColor.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${mapData.points.length} Odak',
                          style: TextStyle(color: textSecondary, fontSize: 10.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...mapData.points.map((p) {
                    final bool isAttack = p.category.contains('Taarruz');
                    final bool isDefense = p.category.contains('Savunma');

                    Color badgeBg = isAttack
                        ? Colors.black87
                        : (isDefense ? const Color(0xFF334155) : const Color(0xFF64748B));

                    if (isCografya) {
                      final cLower = p.category.toLowerCase();
                      if (cLower.contains('işlek') || cLower.contains('zirve') || cLower.contains('lider') || cLower.contains('kalbi')) {
                        badgeBg = const Color(0xFF0369A1);
                      } else if (cLower.contains('demiryolu') || cLower.contains('transit') || cLower.contains('ulaşım')) {
                        badgeBg = const Color(0xFF0D9488);
                      } else if (cLower.contains('volkan') || cLower.contains('genç') || cLower.contains('enerji')) {
                        badgeBg = const Color(0xFFD97706);
                      } else if (cLower.contains('kapalı') || cLower.contains('afet') || cLower.contains('tehlike')) {
                        badgeBg = const Color(0xFFDC2626);
                      } else {
                        badgeBg = const Color(0xFF475569);
                      }
                    }

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor, width: 1.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (p.category.isNotEmpty) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              margin: const EdgeInsets.only(bottom: 6),
                              decoration: BoxDecoration(
                                color: badgeBg,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                p.category.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                          Text(
                            p.name,
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 14 * _fontScale,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (p.commander.isNotEmpty) ...[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        isCografya ? Icons.place_rounded : Icons.person_rounded,
                                        size: 13,
                                        color: isCografya ? const Color(0xFF0284C7) : textSecondary,
                                      ),
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: isCografya ? 'Konum / İl / Bölge: ' : 'Komutan / Önemli İsim: ',
                                    style: TextStyle(color: textSecondary, fontSize: 12 * _fontScale, fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: p.commander,
                                    style: TextStyle(color: textPrimary, fontSize: 12 * _fontScale, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: isCografya ? 'Coğrafi Oluşum & Nitelik: ' : 'Kilit Gelişme: ',
                                  style: TextStyle(color: textSecondary, fontSize: 12 * _fontScale, fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: p.keyEvent,
                                  style: TextStyle(color: textPrimary, fontSize: 12 * _fontScale, height: 1.4),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: isCografya
                                  ? const Color(0xFF0284C7).withValues(alpha: 0.08)
                                  : borderColor.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isCografya
                                    ? const Color(0xFF0284C7).withValues(alpha: 0.25)
                                    : borderColor.withValues(alpha: 0.5),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  isCografya ? Icons.lightbulb_rounded : Icons.flag_rounded,
                                  size: 15,
                                  color: isCografya ? const Color(0xFF0284C7) : const Color(0xFFB45309),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    isCografya ? '🎯 ÖSYM Sınav Sorusu & Taktik: ${p.outcome}' : 'Sonuç & Antlaşma: ${p.outcome}',
                                    style: TextStyle(
                                      color: textPrimary,
                                      fontSize: 11.5 * _fontScale,
                                      fontWeight: FontWeight.w700,
                                      height: 1.35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],

                // ÖSYM KRİTİK ÇIKMIŞ SORU & HARİTA ANALİZ SENTEZİ
                if (mapData.historicalNote != null && mapData.historicalNote!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isCografya
                            ? [const Color(0xFFF0FDF4), const Color(0xFFE0F2FE)]
                            : [const Color(0xFFFEF3C7), const Color(0xFFFDE68A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isCografya
                            ? const Color(0xFF0284C7).withValues(alpha: 0.4)
                            : const Color(0xFFD97706).withValues(alpha: 0.4),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.auto_awesome_rounded,
                              color: isCografya ? const Color(0xFF0284C7) : const Color(0xFFB45309),
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                isCografya
                                    ? 'ÖSYM ÇIKMIŞ SORU VE HARİTA ANALİZ SENTEZİ'
                                    : 'TARİHÎ ANALİZ VE STRATEJİK DEĞERLENDİRME',
                                style: TextStyle(
                                  color: isCografya ? const Color(0xFF0369A1) : const Color(0xFF92400E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mapData.historicalNote!,
                          style: TextStyle(
                            color: const Color(0xFF1E293B),
                            fontSize: 12 * _fontScale,
                            height: 1.45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // 🔍 TAM EKRAN ATLAS MODALI (YÜKSEK ÇÖZÜNÜRLÜKLÜ DETAYLI İNCELEME)
  // ----------------------------------------------------
  void _openFullScreenMapModal(BuildContext context, LectureMapData mapData) {
    if (mapData.imageAssetPath == null) return;

    final bool isCografya = widget.topic.id.startsWith('cografya') ||
        (mapData.mapSource?.toLowerCase().contains('cografyaharita') ?? false) ||
        (mapData.mapSource?.contains('Coğrafya') ?? false) ||
        (mapData.mapSource?.contains('HGM') ?? false) ||
        (mapData.mapSource?.contains('MTA') ?? false) ||
        (mapData.mapSource?.contains('MGM') ?? false) ||
        (mapData.mapSource?.contains('TÜİK') ?? false);

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.94),
      builder: (BuildContext ctx) {
        final TransformationController transformCtrl = TransformationController();

        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: const Color(0xFF0B132B),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // 1. Zoomlanabilir Harita Görseli (Ultra HD Canvas)
                  InteractiveViewer(
                    transformationController: transformCtrl,
                    minScale: 0.6,
                    maxScale: 8.0,
                    boundaryMargin: const EdgeInsets.all(200),
                    child: Center(
                      child: Image.asset(
                        mapData.imageAssetPath!,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),

                  // 2. Üst Bar: Başlık, Bilgi & Kapatma Butonu
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.88),
                            Colors.black.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0284C7).withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0xFF38BDF8).withValues(alpha: 0.4)),
                            ),
                            child: Icon(
                              isCografya ? Icons.map_rounded : Icons.explore_rounded,
                              color: const Color(0xFF38BDF8),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        mapData.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      margin: const EdgeInsets.only(left: 8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF10B981),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'HD Master',
                                        style: TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  mapData.subtitle,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            tooltip: 'Yakınlaştırmayı Sıfırla',
                            icon: const Icon(Icons.restart_alt_rounded, color: Colors.white),
                            onPressed: () {
                              setModalState(() {
                                transformCtrl.value = Matrix4.identity();
                              });
                            },
                          ),
                          IconButton(
                            tooltip: 'Kapat',
                            icon: const Icon(Icons.close_rounded, color: Colors.white, size: 26),
                            onPressed: () => Navigator.of(ctx).pop(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 3. Sağ Yan: Hızlı Zoom Butonları (+ / - / Reset)
                  Positioned(
                    right: 16,
                    bottom: 80,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton.small(
                          heroTag: 'zoom_in_btn',
                          backgroundColor: const Color(0xFF1E293B).withValues(alpha: 0.9),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            setModalState(() {
                              transformCtrl.value = Matrix4.copy(transformCtrl.value)..scaleByDouble(1.4, 1.4, 1.0, 1.0);
                            });
                          },
                          child: const Icon(Icons.add_rounded, size: 20),
                        ),
                        const SizedBox(height: 8),
                        FloatingActionButton.small(
                          heroTag: 'zoom_out_btn',
                          backgroundColor: const Color(0xFF1E293B).withValues(alpha: 0.9),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            setModalState(() {
                              transformCtrl.value = Matrix4.copy(transformCtrl.value)..scaleByDouble(0.7, 0.7, 1.0, 1.0);
                            });
                          },
                          child: const Icon(Icons.remove_rounded, size: 20),
                        ),
                      ],
                    ),
                  ),

                  // 4. Alt Bar: İpucu, Kaynak ve Lejant Butonu
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.9),
                            Colors.black.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.touch_app_rounded, color: Colors.white70, size: 16),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              "Çift parmakla 8 kata kadar yakınlaştırabilir, basılı tutarak serbestçe gezinebilirsiniz.",
                              style: TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: ctx,
                                backgroundColor: const Color(0xFF0F172A),
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                builder: (bCtx) {
                                  return DraggableScrollableSheet(
                                    initialChildSize: 0.65,
                                    minChildSize: 0.4,
                                    maxChildSize: 0.92,
                                    expand: false,
                                    builder: (context, scrollController) {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                                        child: ListView(
                                          controller: scrollController,
                                          children: [
                                            Center(
                                              child: Container(
                                                width: 40,
                                                height: 4,
                                                margin: const EdgeInsets.only(bottom: 14),
                                                decoration: BoxDecoration(
                                                  color: Colors.white30,
                                                  borderRadius: BorderRadius.circular(2),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    isCografya
                                                        ? 'Coğrafi Harita Analizi ve Lejant'
                                                        : 'Askerî Harekât Lejantı & Notlar',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.close, color: Colors.white70),
                                                  onPressed: () => Navigator.pop(bCtx),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            if (mapData.legends.isNotEmpty) ...[
                                              const Text(
                                                'LEJANT VE SEMBOLLER',
                                                style: TextStyle(
                                                  color: Color(0xFF38BDF8),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              ...mapData.legends.map((l) {
                                                return Container(
                                                  margin: const EdgeInsets.only(bottom: 8),
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF1E293B),
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.white12),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        l.symbol,
                                                        style: const TextStyle(
                                                          color: Color(0xFF38BDF8),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              l.label,
                                                              style: const TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            if (l.description.isNotEmpty) ...[
                                                              const SizedBox(height: 2),
                                                              Text(
                                                                l.description,
                                                                style: const TextStyle(
                                                                  color: Colors.white70,
                                                                  fontSize: 11.5,
                                                                ),
                                                              ),
                                                            ],
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ],
                                            if (mapData.points.isNotEmpty) ...[
                                              const SizedBox(height: 14),
                                              Text(
                                                isCografya ? 'KRİTİK ODAKLAR VE DETAYLAR' : 'CEPHE DETAYLARI',
                                                style: const TextStyle(
                                                  color: Color(0xFF38BDF8),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              ...mapData.points.map((p) {
                                                return Container(
                                                  margin: const EdgeInsets.only(bottom: 8),
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF1E293B),
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.white12),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        p.name,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        p.keyEvent,
                                                        style: const TextStyle(color: Colors.white70, fontSize: 11.5),
                                                      ),
                                                      if (p.outcome.isNotEmpty) ...[
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          '🎯 ÖSYM Püf Noktası: ${p.outcome}',
                                                          style: const TextStyle(
                                                            color: Color(0xFFFBBF24),
                                                            fontSize: 11,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ],
                                            if (mapData.historicalNote != null) ...[
                                              const SizedBox(height: 14),
                                              Container(
                                                padding: const EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF0369A1).withValues(alpha: 0.2),
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: const Color(0xFF38BDF8).withValues(alpha: 0.4)),
                                                ),
                                                child: Text(
                                                  mapData.historicalNote!,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11.5,
                                                    height: 1.4,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.menu_book_rounded, size: 15),
                            label: const Text('Lejant & Analiz Paneli', style: TextStyle(fontSize: 11.5)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0284C7),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // ----------------------------------------------------
  // ALT EYLEM KARTI (TESTE GEÇİŞ)
  // ----------------------------------------------------
  Widget _buildActionBanner({
    required Color topicColor,
    required Color cardBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.quiz_outlined, color: topicColor, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Konuyu Pekiştirin: Soru Bankası Testleri',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 15 * _fontScale,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Bu konuya ait ${widget.topic.testRange} testlerini çözerek öğrendiğiniz kuralları hemen pekiştirin.',
            style: TextStyle(color: textSecondary, fontSize: 13 * _fontScale, height: 1.5),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _startTopicTest,
              icon: const Icon(Icons.play_circle_fill_rounded, size: 22),
              label: Text(
                'Testi Çöz (${widget.topic.testRange.split(' ')[0]} ${widget.topic.startTestNum})',
                style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: topicColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // ALT SABİT BAR
  // ----------------------------------------------------
  Widget _buildBottomBar(
    Color surfaceBg,
    Color borderColor,
    Color topicColor,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: surfaceBg,
        border: Border(top: BorderSide(color: borderColor, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.topic.testRange,
                    style: TextStyle(color: textPrimary, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '20\'şer Soruluk ÖSYM Formatı',
                    style: TextStyle(color: textSecondary, fontSize: 11),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: _startTopicTest,
              icon: const Icon(Icons.rocket_launch_rounded, size: 18),
              label: const Text('Testi Başlat'),
              style: ElevatedButton.styleFrom(
                backgroundColor: topicColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(Color textSecondary) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.filter_list_off_rounded, size: 48, color: textSecondary),
          const SizedBox(height: 12),
          Text(
            'Bu filtrede içerik bulunamadı.',
            style: TextStyle(color: textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Yardımcı İkon & Renk Fonksiyonları
  Color _getSectionTypeColor(LectureSectionType type) {
    switch (type) {
      case LectureSectionType.formula:
        return const Color(0xFFD97706);
      case LectureSectionType.warning:
        return const Color(0xFFDC2626);
      case LectureSectionType.comparison:
        return const Color(0xFF0D9488);
      case LectureSectionType.interactiveQuiz:
        return const Color(0xFF7C3AED);
      default:
        return const Color(0xFF0284C7);
    }
  }

  IconData _getSectionTypeIcon(LectureSectionType type) {
    switch (type) {
      case LectureSectionType.formula:
        return Icons.functions_rounded;
      case LectureSectionType.warning:
        return Icons.warning_amber_rounded;
      case LectureSectionType.comparison:
        return Icons.compare_arrows_rounded;
      case LectureSectionType.interactiveQuiz:
        return Icons.quiz_rounded;
      default:
        return Icons.menu_book_rounded;
    }
  }

  String _getSectionTypeBadge(LectureSectionType type) {
    switch (type) {
      case LectureSectionType.formula:
        return 'FORMÜL & KURAL';
      case LectureSectionType.warning:
        return 'ÖSYM TUZAĞI';
      case LectureSectionType.comparison:
        return 'KARŞILAŞTIRMA';
      case LectureSectionType.interactiveQuiz:
        return 'MİNİ PRATİK';
      default:
        return 'TEMEL BİLGİ';
    }
  }

  Widget _buildInstructiveExampleCard(
    String bp,
    Color textPrimary,
    Color textSecondary,
    Color topicColor,
    Color borderColor,
    double fontScale,
    Color cardBg,
  ) {
    String raw = bp.trim();
    String questionPart = raw;
    String? solutionPart;
    String? tipPart;

    if (raw.contains('💡 ÇÖZÜM:') || raw.contains('💡 Çözüm:')) {
      final splitSol = raw.split(RegExp(r'💡\s*ÇÖZÜM:', caseSensitive: false));
      questionPart = splitSol[0].trim();
      String remaining = splitSol[1].trim();

      if (remaining.contains('🎯 PRATİK İPUCU:') ||
          remaining.contains('🎯 Pratik İpucu:') ||
          remaining.contains('🎯 TAKTİK:') ||
          remaining.contains('🎯 Taktik:')) {
        final splitTip = remaining.split(RegExp(
            r'🎯\s*(?:PRATİK İPUCU|Pratik İpucu|TAKTİK|Taktik):',
            caseSensitive: false));
        solutionPart = splitTip[0].trim();
        tipPart = splitTip[1].trim();
      } else {
        solutionPart = remaining;
      }
    } else if (raw.contains('🎯 PRATİK İPUCU:') || raw.contains('🎯 TAKTİK:')) {
      final splitTip = raw.split(RegExp(
          r'🎯\s*(?:PRATİK İPUCU|Pratik İpucu|TAKTİK|Taktik):',
          caseSensitive: false));
      questionPart = splitTip[0].trim();
      tipPart = splitTip[1].trim();
    }

    String cleanQuestion = questionPart.replaceFirst(
        RegExp(r'^[📝✍️📌💡🔹]?\s*(?:ÖĞRETİCİ\s+)?(?:ÇÖZÜMLÜ\s+)?(?:ÖRNEK|Örnek)(?:\s*\([^)]*\))?\s*\d*:\s*',
            caseSensitive: false),
        '').trim();
    if (cleanQuestion.isEmpty) cleanQuestion = questionPart;

    String? diagramPath;
    final figMatch = RegExp(r'\[(?:ŞEKİL|GÖRSEL|SEKIL):\s*([^\]]+)\]', caseSensitive: false).firstMatch(cleanQuestion);
    if (figMatch != null) {
      diagramPath = figMatch.group(1)?.trim();
      cleanQuestion = cleanQuestion.replaceAll(figMatch.group(0)!, '').trim();
    }

    final isDark = AppColors.isDarkMode;
    final exampleBg = isDark ? const Color(0xFF1E2238) : const Color(0xFFF6F8FE);
    final exampleBorder = isDark
        ? const Color(0xFF6366F1).withValues(alpha: 0.45)
        : const Color(0xFFC7D2FE);
    final solutionBg = isDark ? const Color(0xFF161928) : const Color(0xFFFFFFFF);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: exampleBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: exampleBorder, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: topicColor.withValues(alpha: 0.12),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
              border: Border(bottom: BorderSide(color: exampleBorder.withValues(alpha: 0.6))),
            ),
            child: Row(
              children: [
                Icon(Icons.edit_note_rounded, color: topicColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'ÇÖZÜMLÜ ÖRNEK',
                  style: TextStyle(
                    color: topicColor,
                    fontSize: 11.5 * fontScale,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: topicColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'ÖSYM Tipi',
                    style: TextStyle(
                      color: topicColor,
                      fontSize: 10 * fontScale,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Geometrik Çizim / Şekil (varsa)
                if (diagramPath != null && diagramPath.isNotEmpty) ...[
                  _buildExampleDiagramWidget(diagramPath, context, fontScale, isDark),
                  const SizedBox(height: 10),
                ],

                // Soru Metni
                _buildMathRichText(
                  cleanQuestion,
                  TextStyle(
                    color: textPrimary,
                    fontSize: 14 * fontScale,
                    height: 1.55,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Çözüm Bölümü
                if (solutionPart != null && solutionPart.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: solutionBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.check_circle_outline_rounded,
                                color: Color(0xFF10B981), size: 16),
                            const SizedBox(width: 6),
                            Text(
                              'ADIM ADIM ÇÖZÜM',
                              style: TextStyle(
                                color: const Color(0xFF059669),
                                fontSize: 11 * fontScale,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildMathRichText(
                          solutionPart,
                          TextStyle(
                            color: textPrimary,
                            fontSize: 13.5 * fontScale,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // Pratik İpucu / Sınav Taktiği
                if (tipPart != null && tipPart.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7).withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFF59E0B).withValues(alpha: 0.5)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(Icons.lightbulb_rounded,
                              color: Color(0xFFD97706), size: 15),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildMathRichText(
                            'Taktik: $tipPart',
                            TextStyle(
                              color: isDark ? const Color(0xFFFDE68A) : const Color(0xFF92400E),
                              fontSize: 12.5 * fontScale,
                              height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleDiagramWidget(
    String imagePath,
    BuildContext context,
    double fontScale,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: () => _openFullScreenDiagramModal(context, imagePath, 'Geometri Şekli'),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        constraints: const BoxConstraints(maxHeight: 250),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2235) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? const Color(0xFF3B4261) : const Color(0xFFCBD5E1),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: isDark ? const Color(0xFF282E47) : const Color(0xFFEEF2F6),
              child: Row(
                children: [
                  const Icon(Icons.architecture_rounded, size: 14, color: Color(0xFF4F46E5)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Geometri Çizimi (Büyütmek için dokunun)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.5 * fontScale,
                        fontWeight: FontWeight.w700,
                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.zoom_in_rounded, size: 16, color: Color(0xFF4F46E5)),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) => Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Text(
                      'Çizim yüklenemedi: $imagePath',
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletContent(String bp, Color textPrimary, Color topicColor, double fontScale) {
    final cleanBp = bp.replaceAll('**', '');
    final lines = cleanBp.split('\n');

    if (lines.length == 1) {
      final line = lines[0].trim();
      final isHeading = line.startsWith('▸') || line.startsWith('◆');
      return _buildMathRichText(
        line,
        TextStyle(
          color: isHeading ? topicColor : textPrimary,
          fontSize: (isHeading ? 14.5 : 13.5) * fontScale,
          height: 1.6,
          fontWeight: isHeading ? FontWeight.w700 : FontWeight.w400,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        final trimmed = line.trim();
        final isHeading = trimmed.startsWith('▸') || trimmed.startsWith('◆');
        final isAlert = trimmed.startsWith('⚠️') || trimmed.startsWith('💡') || trimmed.startsWith('📌');

        return Padding(
          padding: EdgeInsets.only(bottom: isHeading ? 6.0 : 3.0),
          child: _buildMathRichText(
            line,
            TextStyle(
              color: isHeading ? topicColor : textPrimary,
              fontSize: (isHeading ? 14.5 : 13.5) * fontScale,
              height: 1.6,
              fontWeight: isHeading
                  ? FontWeight.w700
                  : (isAlert ? FontWeight.w600 : FontWeight.w400),
            ),
          ),
        );
      }).toList(),
    );
  }

  bool get _isMathCourse =>
      widget.topic.courseId == 'matematik' ||
      widget.topic.courseId == 'sayisal_mantik';

  /// Matematiksel kesir ifadelerini dikey kesir (pay, kesir çizgisi, payda)
  /// formatında zengin metin olarak çizen yardımcı fonksiyon
  Widget _buildMathRichText(String text, TextStyle baseStyle) {
    if (!_isMathCourse) {
      return Text(
        text,
        style: baseStyle,
        textAlign: TextAlign.start,
      );
    }
    return MathExpressionWidget(
      text: text,
      style: baseStyle,
    );
  }
}
