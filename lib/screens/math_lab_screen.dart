import 'package:flutter/material.dart';
import '../data/math_lab/konu1_temel_kavramlar_data.dart';
import '../data/math_lab/konu2_bolme_ebob_ekok_data.dart';
import '../data/math_lab/konu3_rasyonel_sayilar_data.dart';
import '../data/math_lab/konu4_esitsizlik_mutlak_deger_data.dart';
import '../data/math_lab/konu5_uslu_koklu_data.dart';
import '../data/math_lab/konu6_carpanlara_ayirma_data.dart';
import '../data/math_lab/konu7_oran_oranti_data.dart';
import '../data/math_lab/konu8_denklem_cozme_data.dart';
import '../data/math_lab/konu9_sayi_kesir_yas_data.dart';
import '../data/math_lab/konu10_yuzde_kar_karisim_data.dart';
import '../data/math_lab/konu11_hiz_isci_data.dart';
import '../data/math_lab/konu12_kumeler_fonksiyonlar_data.dart';
import '../data/math_lab/konu13_olasilik_permutasyon_data.dart';
import '../data/math_lab/konu14_sayisal_mantik_grafik_data.dart';
import '../data/math_lab/math_lab_models.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';

class MathLabScreen extends StatefulWidget {
  final int initialTopicNumber;

  const MathLabScreen({super.key, this.initialTopicNumber = 1});

  @override
  State<MathLabScreen> createState() => _MathLabScreenState();
}

class _MathLabScreenState extends State<MathLabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<MathLabTopic> _allTopics = [
    Konu1TemelKavramlarData.topic,
    Konu2BolmeEbobEkokData.topic,
    Konu3RasyonelSayilarData.topic,
    Konu4EsitsizlikMutlakDegerData.topic,
    Konu5UsluKokluData.topic,
    Konu6CarpanlaraAyirmaData.topic,
    Konu7OranOrantiData.topic,
    Konu8DenklemCozmeData.topic,
    Konu9SayiKesirYasData.topic,
    Konu10YuzdeKarKarisimData.topic,
    Konu11HizIsciData.topic,
    Konu12KumelerFonksiyonlarData.topic,
    Konu13OlasilikPermutasyonData.topic,
    Konu14SayisalMantikGrafikData.topic,
  ];

  late int _selectedTopicNumber;

  MathLabTopic get _currentTopic => _allTopics.firstWhere(
        (t) => t.topicNumber == _selectedTopicNumber,
        orElse: () => _allTopics.first,
      );

  // --- KONU 1 SİMÜLATÖR DURUMLARI ---
  int _sliderA = 8;
  int _sliderB = 9;
  int _sliderC = 0;
  bool _isAOdd = true;
  bool _isBOdd = false;
  int _digitA = 7;
  int _digitB = 2;
  int _seqCount = 5;
  int _seqSum = 85;

  // --- KONU 2 SİMÜLATÖR DURUMLARI ---
  int _ebobNumA = 24;
  int _ebobNumB = 36;
  bool _isEbobProblemMode = true; // true: EBOB (Ağaç/Bölme), false: EKOK (Zil/Katlanma)
  int _pbsSelectedNumber = 120; // 72, 120, 180, 360
  int _selectedDivRule = 36; // 36, 45, 15, 12
  int _remA = 4;
  int _remB = 7;

  // --- KONU 3 SİMÜLATÖR DURUMLARI ---
  bool _fractionsEquated = false;
  int _ladderStep = 0; // 0..3
  bool _decimalsExpanded = false;
  bool _isSortBasit = true; // true: Basit Kesir, false: Bileşik Kesir

  // --- KONU 4 SİMÜLATÖR DURUMLARI ---
  int _ineqFactor = -2; // -3, -2, -1, 1, 2, 3
  double _aSquareVal = 0.5; // a² < a testi (-1.5 .. 2.0)
  double _absValX = 1.0; // |x - 3| + |x + 5| için x konumu (-7.0 .. 6.0)

  // --- KONU 5 SİMÜLATÖR DURUMLARI ---
  int _powerBase = -2; // -3, -2, -1, 1, 2, 3
  int _powerExp = 4; // 0, 1, 2, 3, 4
  int _nestedRootM = 5; // 5, 4, 3, 6
  int _nestedRootN = 2; // 2, 1, 3
  bool _nestedRootIsPlus = true; // true (+), false (-)
  int _conjA = 5; // √5
  int _conjB = 2; // √2
  int _conjK = 6; // 6 / (√5 - √2)

  // --- KONU 6 SİMÜLATÖR DURUMLARI ---
  int _sqDiffA = 5; // a (3..8)
  int _sqDiffB = 2; // b (1..a-1)
  int _recipK = 4; // x + 1/x = k (3..7)
  int _factorM = 3; // (x + m)(x + n) için m (-5..5)
  int _factorN = -2; // (x + m)(x + n) için n (-5..5)

  // --- KONU 7 SİMÜLATÖR DURUMLARI ---
  int _propX = 4; // 1..10
  int _ratioCommonB1 = 3; // a/b = 2/3
  int _ratioCommonB2 = 5; // b/c = 5/4
  int _jobW1 = 6;
  int _jobH1 = 8;
  int _jobD1 = 10;
  int _jobDone1 = 40;
  int _jobW2 = 4;
  int _jobH2 = 6;
  int _jobD2 = 15;

  // --- KONU 8 SİMÜLATÖR DURUMLARI ---
  int _k8EqA = 3;
  int _k8EqB = 6;
  int _k8EqC = 21;
  int _k8SysPreset = 0;

  // --- KONU 9 SİMÜLATÖR DURUMLARI ---
  int _k9WireCut = 20;
  final int _k9WireLen = 120;
  final int _k9AgeMom = 36;
  final int _k9AgeKid = 10;
  int _k9AgeYears = 5;

  // --- KONU 10 SİMÜLATÖR DURUMLARI ---
  final double _k10Cost = 200.0;
  double _k10ProfitPct = 30.0;
  double _k10DiscountPct = 20.0;
  final double _k10MixM1 = 40.0;
  double _k10MixR1 = 20.0;
  final double _k10MixM2 = 60.0;
  double _k10MixR2 = 50.0;

  // --- KONU 11 SİMÜLATÖR DURUMLARI ---
  double _k11SpeedA = 60.0;
  double _k11SpeedB = 90.0;
  final double _k11Dist = 450.0;
  bool _k11IsOpposite = true;
  int _k11WorkerDays1 = 6;
  int _k11WorkerDays2 = 12;

  // --- KONU 12 SİMÜLATÖR DURUMLARI ---
  int _k12SetA = 18;
  int _k12SetB = 14;
  int _k12SetIntersect = 6;
  final int _k12FuncA = 2;
  final int _k12FuncB = 3;
  int _k12FuncX = 4;

  // --- KONU 13 SİMÜLATÖR DURUMLARI ---
  int _k13N = 5;
  int _k13R = 3;
  int _k13TargetDiceSum = 7;

  // --- KONU 14 SİMÜLATÖR DURUMLARI ---
  final int _k14Total = 720;
  int _k14AngleA = 120;
  int _k14AngleB = 90;
  int _k14ClockHour = 3;
  int _k14ClockMinute = 40;

  // --- Sokratik Quiz Durumları ---
  int _currentProblemIndex = 0;
  final Map<String, int> _problemStepProgress = {};
  final Map<String, int?> _userStepSelections = {};
  final Map<String, bool> _stepAnsweredCorrectly = {};

  // --- Hata Avcısı Durumları ---
  int _currentTrapIndex = 0;
  int? _selectedTrapStepIndex;
  bool _trapFeedbackVisible = false;

  @override
  void initState() {
    super.initState();
    _selectedTopicNumber = widget.initialTopicNumber;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _switchTopic(int topicNum) {
    setState(() {
      _selectedTopicNumber = topicNum;
      _currentProblemIndex = 0;
      _currentTrapIndex = 0;
      _selectedTrapStepIndex = null;
      _trapFeedbackVisible = false;
    });
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  int _lcm(int a, int b) {
    if (a == 0 || b == 0) return 0;
    return (a * b) ~/ _gcd(a, b);
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
        final Color brandColor = _currentTopic.themeColor;

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
                    color: brandColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: brandColor.withValues(alpha: 0.3)),
                  ),
                  child: Icon(_currentTopic.icon, color: brandColor, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Matematik Atölyesi',
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Konu $_selectedTopicNumber: ${_currentTopic.title}',
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              // Konu Değiştirici Buton
              PopupMenuButton<int>(
                tooltip: 'Konu Değiştir',
                icon: Icon(Icons.menu_book_rounded, color: brandColor),
                onSelected: _switchTopic,
                itemBuilder: (context) => _allTopics.map((topic) {
                  final isSelected = topic.topicNumber == _selectedTopicNumber;
                  return PopupMenuItem<int>(
                    value: topic.topicNumber,
                    child: Row(
                      children: [
                        Icon(topic.icon, color: topic.themeColor, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Konu ${topic.topicNumber}: ${topic.title}',
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? topic.themeColor : null,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(Icons.check, color: topic.themeColor, size: 16),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(88),
              child: Column(
                children: [
                  // Konu Seçim Şeridi
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _allTopics.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, idx) {
                        final top = _allTopics[idx];
                        final isSel = top.topicNumber == _selectedTopicNumber;
                        return ChoiceChip(
                          avatar: Icon(top.icon, size: 14, color: isSel ? Colors.white : top.themeColor),
                          label: Text(
                            'Konu ${top.topicNumber}: ${top.title}',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: isSel ? FontWeight.bold : FontWeight.w600,
                              color: isSel ? Colors.white : textPrimary,
                            ),
                          ),
                          selected: isSel,
                          selectedColor: top.themeColor,
                          backgroundColor: cardBg,
                          side: BorderSide(color: isSel ? top.themeColor : borderColor),
                          onSelected: (_) => _switchTopic(top.topicNumber),
                        );
                      },
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: brandColor,
                    unselectedLabelColor: textSecondary,
                    indicatorColor: brandColor,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                    tabs: const [
                      Tab(icon: Icon(Icons.tune_rounded, size: 18), text: 'Simülatörler'),
                      Tab(icon: Icon(Icons.alt_route_rounded, size: 18), text: 'Sokratik Çözücü'),
                      Tab(icon: Icon(Icons.crisis_alert_rounded, size: 18), text: 'Hata Avcısı'),
                      Tab(icon: Icon(Icons.flash_on_rounded, size: 18), text: 'Altın Taktikler'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildSimulatorsTab(cardBg, borderColor, textPrimary, textSecondary, brandColor),
              _buildSocraticTab(cardBg, borderColor, textPrimary, textSecondary, brandColor),
              _buildTrapHunterTab(cardBg, borderColor, textPrimary, textSecondary, brandColor),
              _buildGoldenTacticsTab(cardBg, borderColor, textPrimary, textSecondary, brandColor),
            ],
          ),
        );
      },
    );
  }

  // =========================================================================
  // SİMÜLATÖRLER SEKME YÖNLENDİRİCİSİ (KONU 1 - 14)
  // =========================================================================
  Widget _buildSimulatorsTab(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    switch (_selectedTopicNumber) {
      case 1:
        return _buildTopic1Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 2:
        return _buildTopic2Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 3:
        return _buildTopic3Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 4:
        return _buildTopic4Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 5:
        return _buildTopic5Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 6:
        return _buildTopic6Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 7:
        return _buildTopic7Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 8:
        return _buildTopic8Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 9:
        return _buildTopic9Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 10:
        return _buildTopic10Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 11:
        return _buildTopic11Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 12:
        return _buildTopic12Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 13:
        return _buildTopic13Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      case 14:
        return _buildTopic14Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
      default:
        return _buildTopic1Simulators(cardBg, borderColor, textPrimary, textSecondary, brandColor);
    }
  }

  // =========================================================================
  // KONU 1 SİMÜLATÖRLERİ
  // =========================================================================
  Widget _buildTopic1Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Temel Kavramlar & Sayı Kümeleri Laboratuvarı',
          subtitle: 'Değerleri kaydırarak ve düğmelere dokunarak formüllerin arkasındaki mantığı keşfedin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: Katsayı & Rakam Optimizatörü
        _buildSectionCard(
          title: '1. Katsayı & Değer Optimizasyonu: 3a + 5b - 2c',
          subtitle: 'Katsayısı büyük olana büyük, negatif katsayılıya en küçük rakamı ver!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      'İşlem: 3·($_sliderA) + 5·($_sliderB) - 2·($_sliderC)',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '= ${(3 * _sliderA)} + ${(5 * _sliderB)} - ${(2 * _sliderC)} = ',
                          style: TextStyle(color: textSecondary, fontSize: 13),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: brandColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${(3 * _sliderA) + (5 * _sliderB) - (2 * _sliderC)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _buildNumberSlider('a Katsayısı (+3a):', _sliderA, (val) => setState(() => _sliderA = val), textPrimary, textSecondary),
              _buildNumberSlider('b Katsayısı (+5b - EN BÜYÜK POZİTİF):', _sliderB, (val) => setState(() => _sliderB = val), textPrimary, textSecondary),
              _buildNumberSlider('c Katsayısı (-2c - ÇIKARILAN TERİM):', _sliderC, (val) => setState(() => _sliderC = val), textPrimary, textSecondary),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: brandColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        setState(() {
                          _sliderB = 9;
                          _sliderA = 8;
                          _sliderC = 0;
                        });
                      },
                      icon: const Icon(Icons.arrow_upward_rounded, size: 16),
                      label: const Text('En Büyük Değer (Maksimum)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.redAccent),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        setState(() {
                          _sliderB = 0;
                          _sliderA = 1;
                          _sliderC = 9;
                        });
                      },
                      icon: const Icon(Icons.arrow_downward_rounded, size: 16, color: Colors.redAccent),
                      label: const Text('En Küçük Değer (Minimum)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.redAccent)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: Teklik - Çiftlik Parite Çarkı
        _buildSectionCard(
          title: '2. Teklik - Çiftlik Parite Çarkı',
          subtitle: 'Çift sayı ile çarpılan her tam sayı çift olur; tek çarpan gizemini keşfet!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: Text('a: ${_isAOdd ? "TEK (T)" : "ÇİFT (Ç)"}'),
                      selected: true,
                      selectedColor: _isAOdd ? Colors.orange.withValues(alpha: 0.2) : Colors.blue.withValues(alpha: 0.2),
                      side: BorderSide(color: _isAOdd ? Colors.orange : Colors.blue),
                      onSelected: (_) => setState(() => _isAOdd = !_isAOdd),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: Text('b: ${_isBOdd ? "TEK (T)" : "ÇİFT (Ç)"}'),
                      selected: true,
                      selectedColor: _isBOdd ? Colors.orange.withValues(alpha: 0.2) : Colors.blue.withValues(alpha: 0.2),
                      side: BorderSide(color: _isBOdd ? Colors.orange : Colors.blue),
                      onSelected: (_) => setState(() => _isBOdd = !_isBOdd),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildParityRow('a + b', (_isAOdd != _isBOdd) ? 'TEK' : 'ÇİFT', textPrimary, textSecondary),
              _buildParityRow('a · b', (_isAOdd && _isBOdd) ? 'TEK' : 'ÇİFT', textPrimary, textSecondary),
              _buildParityRow('2a + b (2a daima ÇİFT!)', _isBOdd ? 'TEK' : 'ÇİFT', textPrimary, textSecondary, highlight: true),
              _buildParityRow('a² + 3', _isAOdd ? 'ÇİFT (T² + T = Ç)' : 'TEK (Ç² + T = T)', textPrimary, textSecondary),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: AB - BA Basamak Sihirbazı
        _buildSectionCard(
          title: '3. İki Basamaklı Basamak Sihirbazı',
          subtitle: 'AB - BA daima 9\'un katıdır; AB + BA daima 11\'in katıdır!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('A Rakamı: $_digitA', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
                      Slider(
                        value: _digitA.toDouble(),
                        min: 1,
                        max: 9,
                        divisions: 8,
                        onChanged: (v) => setState(() => _digitA = v.toInt()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('B Rakamı: $_digitB', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
                      Slider(
                        value: _digitB.toDouble(),
                        min: 1,
                        max: 9,
                        divisions: 8,
                        onChanged: (v) => setState(() => _digitB = v.toInt()),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      'Sayılar: AB = $_digitA$_digitB  ve  BA = $_digitB$_digitA',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: textPrimary),
                    ),
                    const Divider(height: 16),
                    Text(
                      'AB - BA = ($_digitA$_digitB - $_digitB$_digitA) = ${(_digitA * 10 + _digitB) - (_digitB * 10 + _digitA)}',
                      style: TextStyle(fontWeight: FontWeight.w700, color: brandColor),
                    ),
                    Text(
                      '= 9 · (A - B) = 9 · ($_digitA - $_digitB) = ${9 * (_digitA - _digitB)}  ✓ 9\'un tam katı!',
                      style: const TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'AB + BA = ($_digitA$_digitB + $_digitB$_digitA) = ${(_digitA * 10 + _digitB) + (_digitB * 10 + _digitA)}',
                      style: TextStyle(fontWeight: FontWeight.w700, color: textPrimary),
                    ),
                    Text(
                      '= 11 · (A + B) = 11 · ($_digitA + $_digitB) = ${11 * (_digitA + _digitB)}  ✓ 11\'in tam katı!',
                      style: const TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 4: Ardışık Sayılar ve Ortanca Terim
        _buildSectionCard(
          title: '4. Ardışık Sayılar: Ortanca Terim Taktik Motoru',
          subtitle: 'Terim sayısı tek ise: Toplam / Terim Sayısı = Ortanca Terim!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terim Sayısı: $_seqCount adet ardışık TEK sayı', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
              Row(
                children: [3, 5, 7].map((count) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8, top: 4),
                    child: ChoiceChip(
                      label: Text('$count Terim'),
                      selected: _seqCount == count,
                      onSelected: (_) {
                        setState(() {
                          _seqCount = count;
                          _seqSum = count * 17;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Toplam: $_seqSum', style: TextStyle(fontSize: 13, color: textSecondary)),
                    const SizedBox(height: 4),
                    Text(
                      'Ortanca Terim = Toplam / $_seqCount = $_seqSum / $_seqCount = ${_seqSum ~/ _seqCount}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: brandColor, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_seqCount, (index) {
                        final median = _seqSum ~/ _seqCount;
                        final offset = index - (_seqCount ~/ 2);
                        final val = median + (offset * 2);
                        final isMedian = offset == 0;

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: isMedian ? brandColor : cardBg,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isMedian ? brandColor : borderColor,
                              width: isMedian ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '$val',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: isMedian ? Colors.white : textPrimary,
                                ),
                              ),
                              if (isMedian)
                                const Text(
                                  'ORTANCA',
                                  style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 2 SİMÜLATÖRLERİ (BÖLÜNEBİLME, ASALLAR VE EBOB - EKOK)
  // =========================================================================
  Widget _buildTopic2Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final ebobVal = _gcd(_ebobNumA, _ebobNumB);
    final ekokVal = _lcm(_ebobNumA, _ebobNumB);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Bölünebilme & EBOB - EKOK Laboratuvarı',
          subtitle: 'Bütünden parçaya EBOB, parçadan bütüne EKOK ve bileşik bölünebilme kurallarını canlı test edin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: EBOB vs. EKOK Görsel Karar Motoru & Çarpım Özdeşliği
        _buildSectionCard(
          title: '1. EBOB vs. EKOK Karar Motoru & Çarpım Kanıtı',
          subtitle: 'a · b = EBOB(a, b) · EKOK(a, b) kuralı ve problem ayrımı',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sayı Girişleri / Slider
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. Sayı (a): $_ebobNumA', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
                        Slider(
                          value: _ebobNumA.toDouble(),
                          min: 6,
                          max: 60,
                          divisions: 27,
                          onChanged: (v) => setState(() => _ebobNumA = v.toInt()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2. Sayı (b): $_ebobNumB', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
                        Slider(
                          value: _ebobNumB.toDouble(),
                          min: 6,
                          max: 60,
                          divisions: 27,
                          onChanged: (v) => setState(() => _ebobNumB = v.toInt()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Canlı Hesaplama Kartı
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('EBOB (En Büyük Ortak Bölen)', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.blue)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                              child: Text('$ebobVal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.blue)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('EKOK (En Küçük Ortak Kat)', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.purple)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(color: Colors.purple.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                              child: Text('$ekokVal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.purple)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    Text(
                      'Çarpım Kanıtı: a · b = $_ebobNumA · $_ebobNumB = ${_ebobNumA * _ebobNumB}',
                      style: TextStyle(fontWeight: FontWeight.w700, color: textPrimary, fontSize: 12.5),
                    ),
                    Text(
                      'EBOB · EKOK = $ebobVal · $ekokVal = ${ebobVal * ekokVal}  ✓ (Her zaman eşittir!)',
                      style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Problem Ayrımı Dokunsal Butonları
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Bütünden Parçaya (EBOB)', style: TextStyle(fontSize: 11)),
                      selected: _isEbobProblemMode,
                      selectedColor: Colors.blue.withValues(alpha: 0.2),
                      side: const BorderSide(color: Colors.blue),
                      onSelected: (_) => setState(() => _isEbobProblemMode = true),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Parçadan Bütüne (EKOK)', style: TextStyle(fontSize: 11)),
                      selected: !_isEbobProblemMode,
                      selectedColor: Colors.purple.withValues(alpha: 0.2),
                      side: const BorderSide(color: Colors.purple),
                      onSelected: (_) => setState(() => _isEbobProblemMode = false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _isEbobProblemMode ? Colors.blue.withValues(alpha: 0.08) : Colors.purple.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _isEbobProblemMode ? Colors.blue : Colors.purple),
                ),
                child: Row(
                  children: [
                    Icon(_isEbobProblemMode ? Icons.content_cut_rounded : Icons.extension_rounded,
                        color: _isEbobProblemMode ? Colors.blue : Colors.purple, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _isEbobProblemMode
                            ? 'Örnek: $_ebobNumA m ve $_ebobNumB m tarlanın çevresine eşit aralıklarla ağaç dikme veya çuvalları eş poşetlere bölme. Aralık = EBOB = $ebobVal m.'
                            : 'Örnek: Biri $_ebobNumA saatte, diğeri $_ebobNumB saatte bir nöbet tutan iki doktor veya çalan iki zil. Tekrar birlikte buluşma süresi = EKOK = $ekokVal saat!',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: Asal Çarpanlara Ayırma & Pozitif Bölen Sayısı (PBS) Fabrikası
        _buildSectionCard(
          title: '2. Asal Çarpan & Pozitif Bölen Sayısı (PBS) Fabrikası',
          subtitle: 'Üsleri 1 artırıp çarparak tüm bölenleri, tek ve çift bölenleri hesaplayın',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bir Sayı Seçin:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Row(
                children: [72, 120, 180, 360].map((numVal) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text('$numVal'),
                      selected: _pbsSelectedNumber == numVal,
                      onSelected: (_) => setState(() => _pbsSelectedNumber = numVal),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),

              // Dinamik Asal Analiz Panosu
              _buildPbsCard(_pbsSelectedNumber, borderColor, textPrimary, textSecondary),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: Bileşik Bölünebilme Kuralı Çözücüsü
        _buildSectionCard(
          title: '3. Bileşik Bölünebilme Kuralı Çözücüsü',
          subtitle: 'Önce son basamağı (4, 5) sabitle, sonra rakamlar toplamını (3, 9) çöz!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [36, 45, 15, 12].map((ruleVal) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text('$ruleVal'),
                      selected: _selectedDivRule == ruleVal,
                      onSelected: (_) => setState(() => _selectedDivRule = ruleVal),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seçilen Kural: $_selectedDivRule ile Tam Bölünebilme',
                      style: TextStyle(fontWeight: FontWeight.w900, color: brandColor, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _selectedDivRule == 36
                          ? '• Aralarında asal çarpanlar: 4 ve 9.\n• 1. Adım: ÖNCE 4 kuralı (Son iki basamak 4\'ün katı olmalı).\n• 2. Adım: EN SON 9 kuralı (Rakamlar toplamı 9\'un katı olmalı).'
                          : (_selectedDivRule == 45
                              ? '• Aralarında asal çarpanlar: 5 ve 9.\n• 1. Adım: ÖNCE 5 kuralı (Son basamak 0 veya 5 olmalı).\n• 2. Adım: EN SON 9 kuralı (Rakamlar toplamı 9\'un katı olmalı).'
                              : (_selectedDivRule == 15
                                  ? '• Aralarında asal çarpanlar: 3 ve 5.\n• 1. Adım: ÖNCE 5 kuralı (Son basamak 0 veya 5 olmalı).\n• 2. Adım: EN SON 3 kuralı (Rakamlar toplamı 3\'ün katı olmalı).'
                                  : '• Aralarında asal çarpanlar: 3 ve 4.\n• 1. Adım: ÖNCE 4 kuralı (Son iki basamak 4\'ün katı olmalı).\n• 2. Adım: EN SON 3 kuralı (Rakamlar toplamı 3\'ün katı olmalı).')),
                      style: TextStyle(fontSize: 12.5, color: textPrimary, height: 1.45),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 4: Kalan Aritmetiği Sihirbazı
        _buildSectionCard(
          title: '4. Kalan Aritmetiği Sihirbazı: A² + 2AB + B mod 9',
          subtitle: 'Sayıların kendileri yerine kalanları formülde doğrudan yerine yaz!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('A\'nın Kalanı: $_remA', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
                        Slider(
                          value: _remA.toDouble(),
                          min: 0,
                          max: 8,
                          divisions: 8,
                          onChanged: (v) => setState(() => _remA = v.toInt()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('B\'nin Kalanı: $_remB', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
                        Slider(
                          value: _remB.toDouble(),
                          min: 0,
                          max: 8,
                          divisions: 8,
                          onChanged: (v) => setState(() => _remB = v.toInt()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      'A² + 2AB + B = ($_remA)² + 2·($_remA)·($_remB) + ($_remB)',
                      style: TextStyle(fontWeight: FontWeight.w700, color: textPrimary, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '= ${(_remA * _remA)} + ${2 * _remA * _remB} + $_remB = ${(_remA * _remA) + (2 * _remA * _remB) + _remB}',
                      style: TextStyle(color: textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        '9 ile Bölümünden Kalan = ${((_remA * _remA) + (2 * _remA * _remB) + _remB) % 9}',
                        style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPbsCard(int numVal, Color borderColor, Color textPrimary, Color textSecondary) {
    String factorization = '';
    int pbs = 0;
    int tekCount = 0;
    int ciftCount = 0;

    if (numVal == 72) {
      factorization = '2³ · 3²';
      pbs = (3 + 1) * (2 + 1); // 12
      tekCount = 2 + 1; // 3
      ciftCount = pbs - tekCount; // 9
    } else if (numVal == 120) {
      factorization = '2³ · 3¹ · 5¹';
      pbs = (3 + 1) * (1 + 1) * (1 + 1); // 16
      tekCount = (1 + 1) * (1 + 1); // 4
      ciftCount = pbs - tekCount; // 12
    } else if (numVal == 180) {
      factorization = '2² · 3² · 5¹';
      pbs = (2 + 1) * (2 + 1) * (1 + 1); // 18
      tekCount = (2 + 1) * (1 + 1); // 6
      ciftCount = pbs - tekCount; // 12
    } else {
      factorization = '2³ · 3² · 5¹';
      pbs = (3 + 1) * (2 + 1) * (1 + 1); // 24
      tekCount = (2 + 1) * (1 + 1); // 6
      ciftCount = pbs - tekCount; // 18
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$numVal = $factorization', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: textPrimary)),
          const Divider(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Toplam Pozitif Bölen Sayısı (PBS):', style: TextStyle(fontSize: 12.5, color: textPrimary)),
              Text('$pbs adet', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.indigo)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tek Bölen Sayısı (2 çarpanı atılır):', style: TextStyle(fontSize: 12.5, color: textSecondary)),
              Text('$tekCount adet', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.orange)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Çift Bölen Sayısı (Tüm - Tek):', style: TextStyle(fontSize: 12.5, color: textPrimary)),
              Text('$ciftCount adet', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // KONU 3 SİMÜLATÖRLERİ (RASYONEL SAYILAR VE ONDALIK AÇILIMLAR)
  // =========================================================================
  Widget _buildTopic3Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Rasyonel Sayılar & Ondalık Açılımlar Laboratuvarı',
          subtitle: 'Kesir dilimlerini görselleştirin, merdivenli kesirleri basamak basamak çözün ve virgülleri kaydırın.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: Kesir Çubuğu Dilimleme & Payda Eşitleme
        _buildSectionCard(
          title: '1. Kesir Çubuğu Dilimleme & Payda Eşitleme (1/2 + 1/3)',
          subtitle: 'Farklı dilim boyutları toplanamaz! Paydaları eşitleyerek (EKOK=6) ortak dilimlere bölün.',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Farklı Dilimler (1/2 + 1/3)', style: TextStyle(fontSize: 11)),
                      selected: !_fractionsEquated,
                      onSelected: (_) => setState(() => _fractionsEquated = false),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Paydaları Eşitle (3/6 + 2/6 = 5/6)', style: TextStyle(fontSize: 11)),
                      selected: _fractionsEquated,
                      selectedColor: Colors.green.withValues(alpha: 0.2),
                      side: const BorderSide(color: Colors.green),
                      onSelected: (_) => setState(() => _fractionsEquated = true),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              Text(
                _fractionsEquated ? '1. Kesir: 1/2 = 3/6 (3 dilim)' : '1. Kesir: 1/2 (2 eş parçadan 1\'i)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: textPrimary),
              ),
              const SizedBox(height: 4),
              _buildFractionBar(
                totalParts: _fractionsEquated ? 6 : 2,
                shadedParts: _fractionsEquated ? 3 : 1,
                barColor: Colors.blue,
                borderColor: borderColor,
              ),
              const SizedBox(height: 10),

              Text(
                _fractionsEquated ? '2. Kesir: 1/3 = 2/6 (2 dilim)' : '2. Kesir: 1/3 (3 eş parçadan 1\'i)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: textPrimary),
              ),
              const SizedBox(height: 4),
              _buildFractionBar(
                totalParts: _fractionsEquated ? 6 : 3,
                shadedParts: _fractionsEquated ? 2 : 1,
                barColor: Colors.orange,
                borderColor: borderColor,
              ),
              const SizedBox(height: 12),

              if (_fractionsEquated) ...[
                const Divider(height: 16),
                const Text('TOPLAM ÇUBUK: 3/6 + 2/6 = 5/6 (6 parçadan 5\'i boyalı!)', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 13)),
                const SizedBox(height: 4),
                _buildFractionBar(
                  totalParts: 6,
                  shadedParts: 5,
                  barColor: Colors.green,
                  borderColor: borderColor,
                ),
              ] else
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                  child: const Text('⚠️ Dikkat: Dilim boyutları eşit olmadan (yarım dilim ile üçte bir dilim) toplama yapılamaz! "Paydaları Eşitle"ye dokunun.', style: TextStyle(fontSize: 11.5, color: Colors.amber, fontWeight: FontWeight.w600)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: Merdivenli Kesir Basamak Tırmanıcısı
        _buildSectionCard(
          title: '2. Merdivenli Kesir Tırmanıcısı: 1 + [ 1 / (1 - 1/3) ]',
          subtitle: 'İçten dışa, dipten tepeye adım adım tırmanın!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      _ladderStep == 0
                          ? 'İfade: 1 + 1 / (1 - 1/3)'
                          : (_ladderStep == 1
                              ? '1. Adım: En alttaki (1 - 1/3) = 2/3 ⇒ İfade: 1 + 1 / (2/3)'
                              : (_ladderStep == 2
                                  ? '2. Adım: 1 / (2/3) ters çevrilir ⇒ 3/2 ⇒ İfade: 1 + 3/2'
                                  : '3. Adım: 1 + 3/2 = 5/2 (veya 2,5)  ✓ SONUÇ!')),
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: _ladderStep == 3 ? Colors.green : textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_ladderStep < 3) _ladderStep++;
                        });
                      },
                      icon: const Icon(Icons.arrow_upward_rounded, size: 18),
                      label: Text(_ladderStep < 3 ? '${_ladderStep + 1}. Adımı Çöz' : 'Tamamlandı!'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () => setState(() => _ladderStep = 0),
                    child: const Text('Başa Dön', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: Ondalık Virgül Kaydırma Laboratuvarı
        _buildSectionCard(
          title: '3. Ondalık Virgül Kaydırma: (0,004/0,02) + (0,15/0,005) - (0,8/0,04)',
          subtitle: 'Virgülden sonraki basamakları sıfırla eşitle, virgülleri tek hamlede sil!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Basamakları Sıfırla Eşitle & Virgülleri At', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                value: _decimalsExpanded,
                onChanged: (v) => setState(() => _decimalsExpanded = v),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!_decimalsExpanded) ...[
                      Text('• Terim 1: 0,004 / 0,02', style: TextStyle(color: textPrimary, fontSize: 13)),
                      Text('• Terim 2: 0,15 / 0,005', style: TextStyle(color: textPrimary, fontSize: 13)),
                      Text('• Terim 3: 0,8 / 0,04', style: TextStyle(color: textPrimary, fontSize: 13)),
                    ] else ...[
                      const Text('• 0,004 / 0,020 = 4 / 20 = 1 / 5 = 0,2', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 13)),
                      const Text('• 0,150 / 0,005 = 150 / 5 = 30', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 13)),
                      const Text('• 0,80 / 0,04 = 80 / 4 = 20', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 13)),
                      const Divider(height: 16),
                      const Text('Sonuç: 0,2 + 30 - 20 = 10,2  (veya 51/5)  ✓', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 14)),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 4: Farkı Eşit Kesir Sıralama Sihirbazı
        _buildSectionCard(
          title: '4. Farkı Eşit Kesir Sıralama Sihirbazı (1 Bütüne Yakınlık)',
          subtitle: 'Basit kesirde büyük terimli 1\'e daha yakın; bileşik kesirde küçük terimli 1\'den daha uzaktır!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Basit Kesirler (Fark = 2)', style: TextStyle(fontSize: 11)),
                      selected: _isSortBasit,
                      onSelected: (_) => setState(() => _isSortBasit = true),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Bileşik Kesirler (Fark = 1)', style: TextStyle(fontSize: 11)),
                      selected: !_isSortBasit,
                      onSelected: (_) => setState(() => _isSortBasit = false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isSortBasit
                          ? 'Kesirler: 21/23, 41/43, 81/83 (Fark = 2)'
                          : 'Kesirler: 3/2, 10/9, 100/99 (Fark = 1)',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: textPrimary),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _isSortBasit
                          ? '• 1 bütüne tamamlanmak için eksik kalan paylar: 2/23 > 2/43 > 2/83\'tür.\n• 81/83 kesrinin eksiği en küçük olduğundan 1 bütüne EN YAKINDIR!\n• Sıralama: 21/23 < 41/43 < 81/83  (Büyük sayılı olan BÜYÜKTÜR!)'
                          : '• 1 bütünden fazlalıklar: 1/2 (0,5) > 1/9 (0,11) > 1/99 (0,01)\'dir.\n• 3/2 kesrinin fazlalığı en büyük olduğundan 1 bütünden EN BÜYÜKTÜR!\n• Sıralama: 100/99 < 10/9 < 3/2  (Küçük sayılı olan BÜYÜKTÜR!)',
                      style: TextStyle(fontSize: 12.5, color: textPrimary, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFractionBar({
    required int totalParts,
    required int shadedParts,
    required Color barColor,
    required Color borderColor,
  }) {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: List.generate(totalParts, (index) {
          final isShaded = index < shadedParts;
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isShaded ? barColor.withValues(alpha: 0.7) : Colors.transparent,
                border: Border(
                  right: index < totalParts - 1 ? BorderSide(color: borderColor, width: 0.8) : BorderSide.none,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // =========================================================================
  // KONU 4 SİMÜLATÖRLERİ (BASİT EŞİTSİZLİKLER VE MUTLAK DEĞER)
  // =========================================================================
  Widget _buildTopic4Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Basit Eşitsizlikler & Mutlak Değer Laboratuvarı',
          subtitle: 'Negatif çarpanla yön değiştirmeyi, kare alma sıfır tuzağını, a² < a şifresini ve mutlak değer mesafesini canlı test edin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: Negatif Çarpanla Yön Değiştirme
        _buildSectionCard(
          title: '1. Negatif Çarpan & Yön Değiştirme Laboratuvarı',
          subtitle: 'Eşitsizliği negatif sayıyla çarpınca ibre yön değiştirir (< iken > olur)!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Çarpılan / Bölünen Sayı (k):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Row(
                children: [-3, -2, -1, 1, 2, 3].map((factor) {
                  final isNeg = factor < 0;
                  final isSel = _ineqFactor == factor;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text(factor > 0 ? '+$factor' : '$factor'),
                      selected: isSel,
                      selectedColor: isNeg ? Colors.red.withValues(alpha: 0.25) : Colors.green.withValues(alpha: 0.25),
                      side: BorderSide(color: isSel ? (isNeg ? Colors.red : Colors.green) : borderColor),
                      onSelected: (_) => setState(() => _ineqFactor = factor),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    const Text('Başlangıç Eşitsizliği:  x < 4', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(
                      'İşlem: Her tarafı ($_ineqFactor) ile çarp',
                      style: TextStyle(color: textSecondary, fontSize: 12.5),
                    ),
                    const Divider(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sonuç:  ${_ineqFactor}x  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textPrimary)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _ineqFactor < 0 ? Colors.red : Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _ineqFactor < 0 ? '>' : '<',
                            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Text('  ${_ineqFactor * 4}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textPrimary)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _ineqFactor < 0
                          ? '⚠️ DİKKAT: Negatif çarpan ($_ineqFactor) eşitsizliği TERS ÇEVİRDİ (< iken > oldu)!'
                          : '✓ Pozitif çarpan ($_ineqFactor) yönü KORUDU (< olarak kaldı).',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _ineqFactor < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: Kare Alma ve Sıfır Tuzağı
        _buildSectionCard(
          title: '2. Kare Alma & "Sıfır Tuzağı" Simülatörü (-3 < x < 5)',
          subtitle: 'Aralıkta 0 varsa karesinin alt sınırı DAİMA 0\'dır (0 ≤ x²)!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Aralık: -3 < x < 5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textPrimary)),
                    const SizedBox(height: 4),
                    const Text('• 0 sayısı bu aralığın İÇİNDEDİR: -3 < 0 < 5', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600, fontSize: 12.5)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('(-3)² = 9', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 2),
                            const Text('(Uç Nokta)', style: TextStyle(fontSize: 10, color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                              child: const Text('0² = 0', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.green)),
                            ),
                            const SizedBox(height: 2),
                            const Text('(En Küçük Değer!)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                              child: const Text('5² = 25', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue)),
                            ),
                            const SizedBox(height: 2),
                            const Text('(Maksimum Üst Sınır)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue)),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 18),
                    const Text('x² Değer Aralığı: 0 ≤ x² < 25 yani [0, 25)', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 14)),
                    const SizedBox(height: 4),
                    const Text('❌ ÖSYM Tuzağı: 9 < x² < 25 demek en yaygın hatadır!', style: TextStyle(fontSize: 11.5, color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: a² < a ÖSYM Şifre Çözücüsü
        _buildSectionCard(
          title: '3. a² < a ÖSYM Şifre Çözücüsü',
          subtitle: 'Karesi kendisinden küçük olan sayılar YALNIZCA (0, 1) aralığındadır!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('a Sayısı: ${_aSquareVal.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
              Slider(
                value: _aSquareVal,
                min: -1.0,
                max: 2.0,
                divisions: 30,
                onChanged: (v) => setState(() => _aSquareVal = v),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('a = ${_aSquareVal.toStringAsFixed(2)}  ve  a² = ${(_aSquareVal * _aSquareVal).toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w800, color: textPrimary, fontSize: 13.5)),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: (_aSquareVal > 0 && _aSquareVal < 1) ? Colors.green.withValues(alpha: 0.15) : Colors.red.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        (_aSquareVal > 0 && _aSquareVal < 1)
                            ? '✓ a² < a ŞARTINI SAĞLAR! (0 < a < 1 Pozitif Basit Kesir)'
                            : '✗ a² < a SAĞLANMAZ! (a² ≥ a)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (_aSquareVal > 0 && _aSquareVal < 1) ? Colors.green : Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 4: Mutlak Değer Sayı Doğrusu Mesafe Modeli
        _buildSectionCard(
          title: '4. Mutlak Değer Sayı Doğrusu Mesafe Modeli: |x - 3| + |x + 5|',
          subtitle: 'Kritik noktalar (-5 ve 3) arasındaki mesafe sabittir ve en küçük değer 8\'dir!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('x Konumu: ${_absValX.toStringAsFixed(1)}', style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary)),
              Slider(
                value: _absValX,
                min: -7.0,
                max: 5.0,
                divisions: 24,
                onChanged: (v) => setState(() => _absValX = v),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      '|x - 3| + |x + 5| = |${(_absValX - 3).toStringAsFixed(1)}| + |${(_absValX + 5).toStringAsFixed(1)}|',
                      style: TextStyle(fontWeight: FontWeight.w700, color: textPrimary, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '= ${(_absValX - 3).abs().toStringAsFixed(1)} + ${(_absValX + 5).abs().toStringAsFixed(1)} = ${((_absValX - 3).abs() + (_absValX + 5).abs()).toStringAsFixed(1)}',
                      style: TextStyle(color: textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: (_absValX >= -5 && _absValX <= 3) ? Colors.amber.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        (_absValX >= -5 && _absValX <= 3)
                            ? '🎯 MİNİMUM SABİT DEĞER: 8 (x noktası -5 ile 3 arasındadır)'
                            : 'Mesafe Büyüdü: ${((_absValX - 3).abs() + (_absValX + 5).abs()).toStringAsFixed(1)} > 8',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: (_absValX >= -5 && _absValX <= 3) ? Colors.amber.shade900 : textPrimary,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 5 SİMÜLATÖRLERİ (ÜSLÜ VE KÖKLÜ SAYILAR)
  // =========================================================================
  Widget _buildTopic5Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    // Sim 1: Kuvvet hesapları
    final int withParen = _powerBase == 0 && _powerExp == 0 ? 1 : _calcPower(_powerBase, _powerExp);
    final int withoutParen = _powerBase < 0
        ? -_calcPower(_powerBase.abs(), _powerExp)
        : _calcPower(_powerBase, _powerExp);

    // Sim 2: İç içe kök
    final int rootA = _nestedRootM + _nestedRootN;
    final int rootB = _nestedRootM * _nestedRootN;

    // Sim 3: Eşlenik
    final int denom = _conjA - _conjB;
    final bool canSimplify = denom != 0 && (_conjK % denom == 0);
    final int simplifiedK = denom != 0 ? _conjK ~/ denom : 1;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Üslü & Köklü Sayılar Laboratuvarı',
          subtitle: 'Parantezli (-a)ⁿ ile -aⁿ farkını, √(A ± 2√B) iç içe kök formülünü ve eşlenikle payda kurtarmayı canlı test edin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: Parantez ve Çift Kuvvet Cetveli
        _buildSectionCard(
          title: '1. Parantezli vs. Parantezsiz Çift Kuvvet Cetveli',
          subtitle: 'Parantez varsa eksi yutulur (+), parantez yoksa kare sadece sayıya aittir (-)!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Taban Sayı (a):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Row(
                children: [-3, -2, -1, 1, 2, 3].map((b) {
                  final isSel = _powerBase == b;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text('$b'),
                      selected: isSel,
                      selectedColor: b < 0 ? Colors.red.withValues(alpha: 0.25) : Colors.indigo.withValues(alpha: 0.25),
                      side: BorderSide(color: isSel ? (b < 0 ? Colors.red : Colors.indigo) : borderColor),
                      onSelected: (_) => setState(() => _powerBase = b),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Text('Kuvvet / Üs (n):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Row(
                children: [0, 1, 2, 3, 4].map((e) {
                  final isSel = _powerExp == e;
                  final isEven = e % 2 == 0;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text('$e ${isEven ? "(Çift)" : "(Tek)"}'),
                      selected: isSel,
                      selectedColor: isEven ? Colors.amber.withValues(alpha: 0.3) : Colors.blue.withValues(alpha: 0.2),
                      side: BorderSide(color: isSel ? Colors.amber.shade800 : borderColor),
                      onSelected: (_) => setState(() => _powerExp = e),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: withParen > 0 ? Colors.green.withValues(alpha: 0.12) : Colors.red.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: withParen > 0 ? Colors.green : Colors.red),
                            ),
                            child: Column(
                              children: [
                                const Text('PARANTEZLİ:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  '($_powerBase)${_toSuperscript(_powerExp)} = $withParen',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: withParen > 0 ? Colors.green.shade800 : Colors.red.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: withoutParen > 0 ? Colors.green.withValues(alpha: 0.12) : Colors.red.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: withoutParen > 0 ? Colors.green : Colors.red),
                            ),
                            child: Column(
                              children: [
                                const Text('PARANTEZSİZ:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  _powerBase < 0 ? '-${_powerBase.abs()}${_toSuperscript(_powerExp)} = $withoutParen' : '$_powerBase${_toSuperscript(_powerExp)} = $withoutParen',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: withoutParen > 0 ? Colors.green.shade800 : Colors.red.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (_powerBase < 0 && _powerExp % 2 == 0)
                            ? Colors.red.withValues(alpha: 0.08)
                            : Colors.blue.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        (_powerBase < 0 && _powerExp % 2 == 0)
                            ? '⚠️ DİKKAT: Üs çift olduğunda parantezli ($_powerBase)${_toSuperscript(_powerExp)} = +$withParen (Pozitif) iken parantezsiz -${_powerBase.abs()}${_toSuperscript(_powerExp)} = $withoutParen (Negatif) kalır!'
                            : 'Bilgi: Üs tek olduğunda veya taban pozitif olduğunda işaretler aynı kalır.',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: (_powerBase < 0 && _powerExp % 2 == 0) ? Colors.red.shade900 : textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: √(A ± 2√B) Sihirli Kök Çözücü
        _buildSectionCard(
          title: '2. √(A ± 2√B) İç İçe Sihirli Kök Çözücü',
          subtitle: 'm · n = B ve m + n = A şartı sağlanırsa kök açılımı √m ± √n olur!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Çarpan Çifti (m > n):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  {'m': 5, 'n': 2},
                  {'m': 4, 'n': 3},
                  {'m': 3, 'n': 1},
                  {'m': 7, 'n': 5},
                ].map((pair) {
                  final isSel = _nestedRootM == pair['m'] && _nestedRootN == pair['n'];
                  return ChoiceChip(
                    label: Text('m=${pair['m']}, n=${pair['n']}  (A=${pair['m']! + pair['n']!}, B=${pair['m']! * pair['n']!})'),
                    selected: isSel,
                    selectedColor: brandColor.withValues(alpha: 0.25),
                    side: BorderSide(color: isSel ? brandColor : borderColor),
                    onSelected: (_) => setState(() {
                      _nestedRootM = pair['m']!;
                      _nestedRootN = pair['n']!;
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('İşaret:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('+ (Toplam)'),
                    selected: _nestedRootIsPlus,
                    selectedColor: Colors.teal.withValues(alpha: 0.25),
                    onSelected: (_) => setState(() => _nestedRootIsPlus = true),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('- (Fark)'),
                    selected: !_nestedRootIsPlus,
                    selectedColor: Colors.deepOrange.withValues(alpha: 0.25),
                    onSelected: (_) => setState(() => _nestedRootIsPlus = false),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      'İfade:  √($rootA ${_nestedRootIsPlus ? "+" : "-"} 2√$rootB)',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: brandColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'm + n = $_nestedRootM + $_nestedRootN = $rootA   ve   m · n = $_nestedRootM · $_nestedRootN = $rootB',
                      style: TextStyle(color: textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '🎯 SONUÇ:  √$_nestedRootM ${_nestedRootIsPlus ? "+" : "-"} √$_nestedRootN',
                        style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '📌 Çıkarma olduğunda daima büyük olan √$_nestedRootM başa yazılır (Kök asla negatif olamaz!).',
                      style: TextStyle(fontSize: 11, color: textSecondary, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: Eşlenik ile Payda Kurtarma
        _buildSectionCard(
          title: '3. Eşlenik ile Payda Kurtarma Simülatörü',
          subtitle: 'Paydadaki (√a - √b) kökünden kurtulmak için kesir (√a + √b) ile genişletilir!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Örnek Kesir Seçimi:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  {'k': 6, 'a': 5, 'b': 2},
                  {'k': 4, 'a': 7, 'b': 3},
                  {'k': 2, 'a': 3, 'b': 1},
                ].map((item) {
                  final isSel = _conjK == item['k'] && _conjA == item['a'] && _conjB == item['b'];
                  return ChoiceChip(
                    label: Text('${item['k']} / (√${item['a']} - √${item['b']})'),
                    selected: isSel,
                    selectedColor: brandColor.withValues(alpha: 0.25),
                    side: BorderSide(color: isSel ? brandColor : borderColor),
                    onSelected: (_) => setState(() {
                      _conjK = item['k']!;
                      _conjA = item['a']!;
                      _conjB = item['b']!;
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Adım (Eşlenikle Genişletme):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: brandColor)),
                    const SizedBox(height: 2),
                    Text('Pay ve paydayı (√$_conjA + √$_conjB) ile çarparız.', style: TextStyle(fontSize: 12.5, color: textPrimary)),
                    const SizedBox(height: 8),
                    Text('2. Adım (İki Kare Farkı Payda):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: brandColor)),
                    const SizedBox(height: 2),
                    Text('(√$_conjA - √$_conjB)(√$_conjA + √$_conjB) = ($_conjA - $_conjB) = $denom', style: TextStyle(fontSize: 12.5, color: textPrimary)),
                    const SizedBox(height: 8),
                    Text('3. Adım (Sadeleştirme & Sonuç):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: brandColor)),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        canSimplify
                            ? (simplifiedK == 1 ? '🎯 SONUÇ: √$_conjA + √$_conjB' : '🎯 SONUÇ: $simplifiedK(√$_conjA + √$_conjB)')
                            : '🎯 SONUÇ: ($_conjK(√$_conjA + √$_conjB)) / $denom',
                        style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.indigo, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _calcPower(int base, int exp) {
    if (exp == 0) return 1;
    int res = 1;
    for (int i = 0; i < exp; i++) {
      res *= base;
    }
    return res;
  }

  String _toSuperscript(int n) {
    const digits = {'0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴'};
    return digits[n.toString()] ?? '^$n';
  }

  // =========================================================================
  // KONU 6 SİMÜLATÖRLERİ (ÇARPANLARA AYIRMA VE ÖZDEŞLİKLER)
  // =========================================================================
  Widget _buildTopic6Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    // Sim 1: İki kare farkı
    final int sqA = _sqDiffA * _sqDiffA;
    final int sqB = _sqDiffB * _sqDiffB;
    final int diffDirect = sqA - sqB;
    final int diffFactored = (_sqDiffA - _sqDiffB) * (_sqDiffA + _sqDiffB);

    // Sim 2: x + 1/x = k
    final int kSq = _recipK * _recipK;
    final int xSqPlusRecip = kSq - 2;
    final int xMinusRecipSq = kSq - 4;
    final int xCubePlusRecip = _recipK * _recipK * _recipK - 3 * _recipK;

    // Sim 3: (x + m)(x + n)
    final int coeffB = _factorM + _factorN;
    final int constC = _factorM * _factorN;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Çarpanlara Ayırma & Özdeşlikler Laboratuvarı',
          subtitle: 'İki kare farkını, x + 1/x karesel kestirmelerini ve (x+m)(x+n) çarpan eşleştirmesini canlı deneyimleyin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: İki Kare Farkı
        _buildSectionCard(
          title: '1. İki Kare Farkı Cetveli: a² - b² = (a - b)(a + b)',
          subtitle: 'Kareleri alıp çıkarmak yerine, farkları ile toplamlarını çarpmak saniyeler kazandırır!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. Sayı (a):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
                        const SizedBox(height: 4),
                        Row(
                          children: [4, 5, 6, 7, 8].map((val) {
                            final isSel = _sqDiffA == val;
                            return Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: ChoiceChip(
                                label: Text('$val'),
                                selected: isSel,
                                selectedColor: brandColor.withValues(alpha: 0.25),
                                side: BorderSide(color: isSel ? brandColor : borderColor),
                                onSelected: (_) => setState(() {
                                  _sqDiffA = val;
                                  if (_sqDiffB >= _sqDiffA) _sqDiffB = _sqDiffA - 1;
                                }),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2. Sayı (b < a):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
                  const SizedBox(height: 4),
                  Row(
                    children: [1, 2, 3, 4].where((v) => v < _sqDiffA).map((val) {
                      final isSel = _sqDiffB == val;
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: ChoiceChip(
                          label: Text('$val'),
                          selected: isSel,
                          selectedColor: Colors.deepOrange.withValues(alpha: 0.25),
                          side: BorderSide(color: isSel ? Colors.deepOrange : borderColor),
                          onSelected: (_) => setState(() => _sqDiffB = val),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Text('KARE ALARAK:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  '$_sqDiffA² - $_sqDiffB²\n= $sqA - $sqB\n= $diffDirect',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w800, color: textPrimary, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Text('ÖZDEŞLİKLE:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  '($_sqDiffA - $_sqDiffB) · ($_sqDiffA + $_sqDiffB)\n= ${_sqDiffA - _sqDiffB} · ${_sqDiffA + _sqDiffB}\n= $diffFactored',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.teal.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '🎯 KPSS TÜYOSU: 105² - 95² gibi büyük sayılarda (105-95)(105+95) = 10 · 200 = 2000 işlemi saniyeler sürer!',
                        style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: x + 1/x = k
        _buildSectionCard(
          title: '2. x + 1/x = k Karesel Kestirme Laboratuvarı',
          subtitle: 'Kare alınca ortadaki 2 · x · (1/x) daima sabit 2 çıkar!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('k Değeri (x + 1/x = k):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Row(
                children: [3, 4, 5, 6, 7].map((val) {
                  final isSel = _recipK == val;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text('k = $val'),
                      selected: isSel,
                      selectedColor: brandColor.withValues(alpha: 0.25),
                      side: BorderSide(color: isSel ? brandColor : borderColor),
                      onSelected: (_) => setState(() => _recipK = val),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('KARE AÇILIMI:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5)),
                          const SizedBox(height: 4),
                          Text(
                            '(x + 1/x)² = x² + 2 · x · (1/x) + 1/x² = x² + 2 + 1/x²',
                            style: TextStyle(color: textPrimary, fontSize: 12.5),
                          ),
                          Text(
                            'k² = $_recipK² = $kSq   ⟹   x² + 1/x² = $kSq - 2 = $xSqPlusRecip',
                            style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.indigo, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amber.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Text('(x - 1/x)²', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                const SizedBox(height: 2),
                                Text(
                                  'k² - 4 = $xMinusRecipSq',
                                  style: TextStyle(fontWeight: FontWeight.w900, color: Colors.amber.shade900, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Text('x³ + 1/x³', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                const SizedBox(height: 2),
                                Text(
                                  'k³ - 3k = $xCubePlusRecip',
                                  style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.purple, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: x² + bx + c Çarpan Eşleştirici
        _buildSectionCard(
          title: '3. x² + bx + c = (x + m)(x + n) Çarpan Eşleştirici',
          subtitle: 'm · n = c (çarpım) ve m + n = b (toplam) şartını sağlayan iki sayıyı bulun!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Çarpan Çifti Seçimi (m, n):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  {'m': 3, 'n': -2},
                  {'m': 4, 'n': -5},
                  {'m': 2, 'n': 3},
                  {'m': -3, 'n': -4},
                  {'m': 5, 'n': -1},
                ].map((pair) {
                  final isSel = _factorM == pair['m'] && _factorN == pair['n'];
                  return ChoiceChip(
                    label: Text('m=${pair['m']}, n=${pair['n']}'),
                    selected: isSel,
                    selectedColor: brandColor.withValues(alpha: 0.25),
                    side: BorderSide(color: isSel ? brandColor : borderColor),
                    onSelected: (_) => setState(() {
                      _factorM = pair['m']!;
                      _factorN = pair['n']!;
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      'İfade:  x² ${coeffB >= 0 ? "+ $coeffB" : "- ${coeffB.abs()}"}x ${constC >= 0 ? "+ $constC" : "- ${constC.abs()}"}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: brandColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'm · n = $_factorM · ($_factorN) = $constC (Sabit Terim)\nm + n = $_factorM + ($_factorN) = $coeffB (x Katsayısı)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '🎯 ÇARPANLAR: (x ${_factorM >= 0 ? "+ $_factorM" : "- ${_factorM.abs()}"})(x ${_factorN >= 0 ? "+ $_factorN" : "- ${_factorN.abs()}"})',
                        style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 7 SİMÜLATÖRLERİ (ORAN - ORANTI)
  // =========================================================================
  Widget _buildTopic7Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    // Sim 1: Doğru vs Ters Orantı
    final int directY = 3 * _propX;
    final double inverseY = 24.0 / _propX;

    // Sim 2: Ortak Harf Eşitleme
    final int lcmB = _lcm(_ratioCommonB1, _ratioCommonB2);
    final int mult1 = lcmB ~/ _ratioCommonB1;
    final int mult2 = lcmB ~/ _ratioCommonB2;
    final int aK = 2 * mult1;
    final int bK = lcmB;
    final int cK = 4 * mult2;
    final int minSum = aK + bK + cK;

    // Sim 3: Bileşik Orantı
    final int denom1 = _jobW1 * _jobH1 * _jobD1;
    final int denom2 = _jobW2 * _jobH2 * _jobD2;
    final double calcDone2 = denom1 != 0 ? (_jobDone1 * denom2) / denom1 : 0.0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Oran - Orantı Laboratuvarı',
          subtitle: 'Doğru vs. ters orantı davranışını, ortak harf katsayı senkronizasyonunu ve bileşik iş formülünü canlı test edin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 1: Doğru vs. Ters Orantı
        _buildSectionCard(
          title: '1. Doğru Orantı (y/x = k) vs. Ters Orantı (x · y = k)',
          subtitle: 'Doğru orantıda x arttıkça y artar; ters orantıda x arttıkça y azalır!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Değişken Sayı (x):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Row(
                children: [1, 2, 3, 4, 6, 8, 12].map((val) {
                  final isSel = _propX == val;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text('x=$val'),
                      selected: isSel,
                      selectedColor: brandColor.withValues(alpha: 0.25),
                      side: BorderSide(color: isSel ? brandColor : borderColor),
                      onSelected: (_) => setState(() => _propX = val),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Column(
                              children: [
                                const Text('DOĞRU ORANTI (y = 3x)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green)),
                                const SizedBox(height: 4),
                                Text(
                                  'y = 3 · $_propX = $directY',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.green),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Bölüm Sabit: $directY / $_propX = 3',
                                  style: TextStyle(fontSize: 10.5, color: textSecondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.deepOrange),
                            ),
                            child: Column(
                              children: [
                                const Text('TERS ORANTI (x · y = 24)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                                const SizedBox(height: 4),
                                Text(
                                  'y = 24 / $_propX = ${inverseY.toStringAsFixed(1)}',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.deepOrange),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Çarpım Sabit: $_propX · ${inverseY.toStringAsFixed(1)} = 24',
                                  style: TextStyle(fontSize: 10.5, color: textSecondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '💡 ÖSYM KODU: İşçi sayısı arttıkça bitirme günü AZALIR (Ters Orantı). Çalışma saati arttıkça üretilen parça ARTAR (Doğru Orantı).',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 2: Ortak Harf Katsayı Senkronizörü
        _buildSectionCard(
          title: '2. Ortak Harf Katsayı Senkronizörü: a/b & b/c',
          subtitle: 'Her iki orandaki ortak b sayısını EKOK\'ta eşitleyip tek k orantı sabitine bağlayın!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oran Çifti Seçimi:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  {'b1': 3, 'b2': 5, 'label': 'a/b = 2/3  ve  b/c = 5/4'},
                  {'b1': 4, 'b2': 2, 'label': 'a/b = 3/4  ve  b/c = 2/5'},
                  {'b1': 2, 'b2': 3, 'label': 'a/b = 1/2  ve  b/c = 3/4'},
                ].map((item) {
                  final isSel = _ratioCommonB1 == item['b1'] && _ratioCommonB2 == item['b2'];
                  return ChoiceChip(
                    label: Text(item['label'] as String),
                    selected: isSel,
                    selectedColor: brandColor.withValues(alpha: 0.25),
                    side: BorderSide(color: isSel ? brandColor : borderColor),
                    onSelected: (_) => setState(() {
                      _ratioCommonB1 = item['b1'] as int;
                      _ratioCommonB2 = item['b2'] as int;
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ortak Harf: b (1. oranda $_ratioCommonB1\'in katı, 2. oranda $_ratioCommonB2\'nin katı)',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textPrimary),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'EKOK($_ratioCommonB1, $_ratioCommonB2) = $lcmB  ⟹  b = ${lcmB}k olarak eşitlenir.',
                      style: TextStyle(color: brandColor, fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('🎯 EŞİTLENMİŞ KATSAYILAR:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.teal.shade900)),
                          const SizedBox(height: 4),
                          Text('a = ${aK}k   |   b = ${bK}k   |   c = ${cK}k', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.teal)),
                          const SizedBox(height: 4),
                          Text('Pozitif Tam Sayı Minimum Toplam (k=1): $minSum', style: TextStyle(fontSize: 11.5, color: textPrimary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // SİMÜLASYON 3: Bileşik Orantı "Yapılan İş" Formülü
        _buildSectionCard(
          title: '3. Bileşik Orantı "Yapılan İş" Formülü',
          subtitle: '(1. İş) / (1. Diğer Veriler) = (2. İş) / (2. Diğer Veriler)',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hazır Senaryolar:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textPrimary)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  {'w1': 6, 'h1': 8, 'd1': 10, 'done1': 40, 'w2': 4, 'h2': 6, 'd2': 15, 'label': 'Halı: 6 işçi 40m² ➔ 4 işçi ? m²'},
                  {'w1': 5, 'h1': 6, 'd1': 12, 'done1': 60, 'w2': 10, 'h2': 4, 'd2': 9, 'label': 'Parça: 5 işçi 60 adet ➔ 10 işçi ? adet'},
                  {'w1': 8, 'h1': 5, 'd1': 6, 'done1': 20, 'w2': 4, 'h2': 6, 'd2': 10, 'label': 'Masa: 8 usta 20 masa ➔ 4 usta ? masa'},
                ].map((s) {
                  final isSel = _jobW1 == s['w1'] && _jobDone1 == s['done1'];
                  return ChoiceChip(
                    label: Text(s['label'] as String),
                    selected: isSel,
                    selectedColor: brandColor.withValues(alpha: 0.25),
                    side: BorderSide(color: isSel ? brandColor : borderColor),
                    onSelected: (_) => setState(() {
                      _jobW1 = s['w1'] as int;
                      _jobH1 = s['h1'] as int;
                      _jobD1 = s['d1'] as int;
                      _jobDone1 = s['done1'] as int;
                      _jobW2 = s['w2'] as int;
                      _jobH2 = s['h2'] as int;
                      _jobD2 = s['d2'] as int;
                    }),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      '1. Durum: $_jobW1 işçi, günde $_jobH1 saat, $_jobD1 gün  ⟹  $_jobDone1 birim iş',
                      style: TextStyle(fontSize: 12.5, color: textSecondary),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '2. Durum: $_jobW2 işçi, günde $_jobH2 saat, $_jobD2 gün  ⟹  X birim iş',
                      style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: textPrimary),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$_jobDone1 / ($_jobW1 · $_jobH1 · $_jobD1) = X / ($_jobW2 · $_jobH2 · $_jobD2)',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$_jobDone1 / $denom1 = X / $denom2',
                            style: TextStyle(color: textSecondary, fontSize: 12),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '🎯 ÇÖZÜM: X = ${calcDone2.toStringAsFixed(0)} birim iş üretilir.',
                            style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.indigo, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 8 SİMÜLATÖRLERİ: BİRİNCİ DERECEDEN DENKLEMLER
  // =========================================================================
  Widget _buildTopic8Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final diff = _k8EqC - _k8EqB;
    final hasUniqueSolution = _k8EqA != 0;
    final xVal = hasUniqueSolution ? (diff / _k8EqA) : 0.0;
    final isInfinite = _k8EqA == 0 && diff == 0;

    final sysPresets = [
      {'eq1': '2x + y = 10', 'eq2': 'x - y = 2', 'elim': 'Taraf tarafa topla: (2x+x) + (y-y) = 10+2 ⟹ 3x = 12', 'x': '4', 'y': '2'},
      {'eq1': '3x + 2y = 13', 'eq2': 'x + 2y = 7', 'elim': '2. denklemi (-) ile çarp ve topla: 2x = 6', 'x': '3', 'y': '2'},
      {'eq1': 'x + y = 15', 'eq2': 'x - y = 5', 'elim': 'Taraf tarafa topla: 2x = 20 ⟹ x = 10', 'x': '10', 'y': '5'},
    ];
    final curSys = sysPresets[_k8SysPreset];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Birinci Dereceden Denklemler Laboratuvarı',
          subtitle: 'Katsayıları değiştirerek tek ve iki bilinmeyenli denklem çözüm mantığını keşfedin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Tek Bilinmeyenli Denklem: ax + b = c',
          subtitle: 'Adım adım bilinmeyeni yalnız bırakma',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Katsayı a: $_k8EqA', _k8EqA.clamp(0, 9), (v) => setState(() => _k8EqA = v), textPrimary, textSecondary),
              _buildNumberSlider('Sabit b: $_k8EqB', _k8EqB.clamp(0, 9), (v) => setState(() => _k8EqB = v), textPrimary, textSecondary),
              _buildNumberSlider('Eşitlik c: $_k8EqC', _k8EqC.clamp(0, 9), (v) => setState(() => _k8EqC = v), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Denklem: ${_k8EqA}x + ($_k8EqB) = $_k8EqC', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 6),
                    Text('1. Adım: ${_k8EqA}x = $_k8EqC - ($_k8EqB) ⟹ ${_k8EqA}x = $diff', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text(
                      !hasUniqueSolution
                          ? (isInfinite ? '🎯 Sonsuz Çözüm (0 = 0, Ç = R)' : '⚠️ Çözüm Kümesi Boş Küme (Ç = ∅)')
                          : '🎯 ÇÖZÜM: x = ${xVal.toStringAsFixed(2).replaceAll('.00', '')}',
                      style: TextStyle(fontWeight: FontWeight.w900, color: brandColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. İki Bilinmeyenli Sistemde Yok Etme Metodu',
          subtitle: 'Taraf tarafa toplama ile değişken eleme',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                children: List.generate(sysPresets.length, (i) {
                  return ChoiceChip(
                    label: Text('Örnek ${i + 1}'),
                    selected: _k8SysPreset == i,
                    onSelected: (s) => setState(() => _k8SysPreset = i),
                  );
                }),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Denklem: ${curSys['eq1']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    Text('2. Denklem: ${curSys['eq2']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const Divider(height: 16),
                    Text('⚡ ${curSys['elim']}', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text('🎯 KÖKLER: x = ${curSys['x']}, y = ${curSys['y']}', style: TextStyle(fontWeight: FontWeight.w900, color: brandColor, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 9 SİMÜLATÖRLERİ: SAYI, KESİR VE YAŞ PROBLEMLERİ
  // =========================================================================
  Widget _buildTopic9Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final shift = _k9WireCut / 2.0;
    final origMid = _k9WireLen / 2.0;
    final newMid = (_k9WireLen - _k9WireCut) / 2.0;

    final diffAge = _k9AgeMom - _k9AgeKid;
    final momFuture = _k9AgeMom + _k9AgeYears;
    final kidFuture = _k9AgeKid + _k9AgeYears;
    final futureDiff = momFuture - kidFuture;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Sayı, Kesir ve Yaş Problemleri Laboratuvarı',
          subtitle: 'Tel kesme kayması ve yaş farkının zamanla değişmezliğini keşfedin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Tel Kesme & Orta Nokta Kayma Kanunu',
          subtitle: 'Orta nokta daima kesilen parçanın YARISI kadar ters yöne kayar!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Kesilen Parça: $_k9WireCut cm', (_k9WireCut ~/ 5).clamp(0, 9), (v) => setState(() => _k9WireCut = (v * 5).clamp(5, 50)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Toplam Tel: $_k9WireLen cm | Kesilen: $_k9WireCut cm', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 6),
                    Text('İlk Orta Nokta: ${origMid.toStringAsFixed(1)} cm | Yeni Orta Nokta: ${newMid.toStringAsFixed(1)} cm', style: TextStyle(color: textSecondary, fontSize: 12)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '🎯 KAYMA MİKTARI: $_k9WireCut / 2 = ${shift.toStringAsFixed(1)} cm',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.teal, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. Yaş Problemleri: "Yaş Farkı Asla Değişmez"',
          subtitle: 'Kaç yıl geçerse geçsin aradaki yaş farkı sabittir',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Geçen Yıl: +$_k9AgeYears yıl', _k9AgeYears.clamp(0, 9), (v) => setState(() => _k9AgeYears = v.clamp(1, 20)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Şimdiki Yaşlar: Anne $_k9AgeMom, Çocuk $_k9AgeKid ⟹ Fark = $diffAge', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text('$_k9AgeYears Yıl Sonra: Anne $momFuture, Çocuk $kidFuture ⟹ Fark = $futureDiff', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 8),
                    Text('💡 Yaş oranı ($momFuture/$kidFuture = ${(momFuture / kidFuture).toStringAsFixed(2)}) değişir, ancak FARK ($futureDiff) DAİMA KORUNUR!', style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.indigo, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 10 SİMÜLATÖRLERİ: YÜZDE, KÂR - ZARAR VE KARIŞIM
  // =========================================================================
  Widget _buildTopic10Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final tagPrice = _k10Cost * (1 + _k10ProfitPct / 100.0);
    final finalSalePrice = tagPrice * (1 - _k10DiscountPct / 100.0);
    final netProfit = finalSalePrice - _k10Cost;
    final netProfitPct = (netProfit / _k10Cost) * 100.0;

    final totalMass = _k10MixM1 + _k10MixM2;
    final finalRate = totalMass > 0 ? ((_k10MixM1 * _k10MixR1 + _k10MixM2 * _k10MixR2) / totalMass) : 0.0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Yüzde, Kâr - Zarar ve Karışım Laboratuvarı',
          subtitle: 'Ardışık kâr-indirim ve karışım oran formüllerini test edin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Maliyet ⟹ Etiket Fiyatı ⟹ İndirimli Satış',
          subtitle: 'İndirim etiket fiyatı üzerinden yapılır, maliyete geri dönmez!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Kâr Yüzdesi: %${_k10ProfitPct.toInt()}', (_k10ProfitPct ~/ 10).clamp(0, 9), (v) => setState(() => _k10ProfitPct = (v * 10.0).clamp(10, 80)), textPrimary, textSecondary),
              _buildNumberSlider('İndirim: %${_k10DiscountPct.toInt()}', (_k10DiscountPct ~/ 10).clamp(0, 9), (v) => setState(() => _k10DiscountPct = (v * 10.0).clamp(0, 50)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Maliyet: ${_k10Cost.toStringAsFixed(0)} TL', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    Text('Etiket Fiyatı (%${_k10ProfitPct.toInt()} kârla): ${tagPrice.toStringAsFixed(1)} TL', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    Text('İndirimli Fiyat (%${_k10DiscountPct.toInt()} indirimle): ${finalSalePrice.toStringAsFixed(1)} TL', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: (netProfit >= 0 ? Colors.green : Colors.red).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        netProfit >= 0
                            ? '🎯 NET KÂR: %${netProfitPct.toStringAsFixed(1)} (+${netProfit.toStringAsFixed(1)} TL)'
                            : '⚠️ NET ZARAR: %${(-netProfitPct).toStringAsFixed(1)} (${netProfit.toStringAsFixed(1)} TL)',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900, color: netProfit >= 0 ? Colors.green : Colors.red, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. Karışım Denklemi: (M₁·Y₁ + M₂·Y₂) / (M₁ + M₂)',
          subtitle: 'Farklı tuz oranlarındaki iki karışımı birleştirme',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('1. Karışım Tuz: %${_k10MixR1.toInt()}', (_k10MixR1 ~/ 10).clamp(0, 9), (v) => setState(() => _k10MixR1 = (v * 10.0).clamp(0, 90)), textPrimary, textSecondary),
              _buildNumberSlider('2. Karışım Tuz: %${_k10MixR2.toInt()}', (_k10MixR2 ~/ 10).clamp(0, 9), (v) => setState(() => _k10MixR2 = (v * 10.0).clamp(0, 90)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('1. Kap: ${_k10MixM1.toInt()} gr (%${_k10MixR1.toInt()} tuz) | 2. Kap: ${_k10MixM2.toInt()} gr (%${_k10MixR2.toInt()} tuz)', style: TextStyle(color: textSecondary, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text('Toplam Kütle: ${totalMass.toInt()} gr', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 6),
                    Text('🎯 SON TUZ ORANI: %${finalRate.toStringAsFixed(1)}', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.amber, fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 11 SİMÜLATÖRLERİ: HIZ VE İŞÇİ PROBLEMLERİ
  // =========================================================================
  Widget _buildTopic11Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final speedSum = _k11SpeedA + _k11SpeedB;
    final speedDiff = (_k11SpeedB - _k11SpeedA).abs();
    final effectiveSpeed = _k11IsOpposite ? speedSum : speedDiff;
    final timeHours = effectiveSpeed > 0 ? (_k11Dist / effectiveSpeed) : 0.0;

    final jointDays = (_k11WorkerDays1 * _k11WorkerDays2) / (_k11WorkerDays1 + _k11WorkerDays2);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Hız ve İşçi Problemleri Laboratuvarı',
          subtitle: 'Karşılaşma süresi ve işçilerin birlikte iş bitirme hızını anında görün.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Karşılaşma & Yakalama Simülatörü',
          subtitle: 'Zıt yönde hızlar toplanır, aynı yönde çıkarılır',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('Zıt Yönlü (Karşılaşma)'),
                    selected: _k11IsOpposite,
                    onSelected: (s) => setState(() => _k11IsOpposite = true),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Aynı Yönlü (Yakalama)'),
                    selected: !_k11IsOpposite,
                    onSelected: (s) => setState(() => _k11IsOpposite = false),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildNumberSlider('A Aracı Hızı: ${_k11SpeedA.toInt()} km/s', (_k11SpeedA ~/ 20).clamp(0, 9), (v) => setState(() => _k11SpeedA = (v * 20.0).clamp(20, 120)), textPrimary, textSecondary),
              _buildNumberSlider('B Aracı Hızı: ${_k11SpeedB.toInt()} km/s', (_k11SpeedB ~/ 20).clamp(0, 9), (v) => setState(() => _k11SpeedB = (v * 20.0).clamp(20, 140)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Mesafe: ${_k11Dist.toInt()} km | Etkin Hız: ${effectiveSpeed.toInt()} km/sa', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text(
                      effectiveSpeed > 0
                          ? '🎯 SÜRE: t = ${_k11Dist.toInt()} / ${effectiveSpeed.toInt()} = ${timeHours.toStringAsFixed(1)} Saat'
                          : '⚠️ Hızlar eşit olduğu için arkadaki öndekini ASLA yakalayamaz!',
                      style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.blue, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. İşçi Problemleri: Birlikte Çalışma Kuralı',
          subtitle: '1/A + 1/B = 1/T ⟹ T = (A·B) / (A + B)',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('1. İşçi Süresi: $_k11WorkerDays1 gün', _k11WorkerDays1.clamp(0, 9), (v) => setState(() => _k11WorkerDays1 = v.clamp(2, 30)), textPrimary, textSecondary),
              _buildNumberSlider('2. İşçi Süresi: $_k11WorkerDays2 gün', _k11WorkerDays2.clamp(0, 9), (v) => setState(() => _k11WorkerDays2 = v.clamp(2, 30)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('1 günde yapılan iş: 1/$_k11WorkerDays1 + 1/$_k11WorkerDays2', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text('🎯 BİRLİKTE BİTİRME SÜRESİ: ${jointDays.toStringAsFixed(1)} Gün', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.teal, fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 12 SİMÜLATÖRLERİ: KÜMELER VE FONKSİYONLAR
  // =========================================================================
  Widget _buildTopic12Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final actualIntersect = _k12SetIntersect.clamp(0, _k12SetA < _k12SetB ? _k12SetA : _k12SetB);
    final onlyA = _k12SetA - actualIntersect;
    final onlyB = _k12SetB - actualIntersect;
    final unionCount = _k12SetA + _k12SetB - actualIntersect;

    final fxVal = _k12FuncA * _k12FuncX + _k12FuncB;
    final invFxVal = _k12FuncA != 0 ? ((fxVal - _k12FuncB) / _k12FuncA) : 0.0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Kümeler ve Fonksiyonlar Laboratuvarı',
          subtitle: 'Venn şeması birleşim formülü ve ters fonksiyon makinelerini deneyimleyin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Kümelerin Birleşimi: s(A ∪ B) = s(A) + s(B) - s(A ∩ B)',
          subtitle: 'Kesişim iki kez sayılmaması için bir kez çıkarılır',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('s(A): $_k12SetA', (_k12SetA ~/ 3).clamp(0, 9), (v) => setState(() => _k12SetA = (v * 3).clamp(6, 30)), textPrimary, textSecondary),
              _buildNumberSlider('s(B): $_k12SetB', (_k12SetB ~/ 3).clamp(0, 9), (v) => setState(() => _k12SetB = (v * 3).clamp(6, 30)), textPrimary, textSecondary),
              _buildNumberSlider('Kesişim s(A ∩ B): $actualIntersect', actualIntersect.clamp(0, 9), (v) => setState(() => _k12SetIntersect = v.clamp(0, 15)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Yalnız A: $onlyA | Kesişim: $actualIntersect | Yalnız B: $onlyB', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text('🎯 s(A ∪ B) = $_k12SetA + $_k12SetB - $actualIntersect = $unionCount', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.purple, fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. Fonksiyon Makinesi: f(x) = ${_k12FuncA}x + ($_k12FuncB)',
          subtitle: 'Giriş ⟹ Çıkış ve Ters Fonksiyon Denetimi',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Girdi x: $_k12FuncX', _k12FuncX.clamp(0, 9), (v) => setState(() => _k12FuncX = v.clamp(1, 10)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('f($_k12FuncX) = $_k12FuncA · $_k12FuncX + ($_k12FuncB) = $fxVal', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 6),
                    Text('Ters Fonksiyon: f⁻¹(y) = (y - ($_k12FuncB)) / $_k12FuncA', style: TextStyle(color: textSecondary, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text('🎯 TEST: f⁻¹($fxVal) = ${invFxVal.toInt()} (Girdi Doğrulandı!)', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.indigo, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 13 SİMÜLATÖRLERİ: PERMÜTASYON, KOMBİNASYON VE OLASILIK
  // =========================================================================
  Widget _buildTopic13Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    int fact(int n) => n <= 1 ? 1 : n * fact(n - 1);
    final nVal = _k13N.clamp(1, 7);
    final rVal = _k13R.clamp(1, nVal);
    final permVal = fact(nVal) ~/ fact(nVal - rVal);
    final combVal = permVal ~/ fact(rVal);

    final diceCombos = {
      2: ['(1,1)'],
      3: ['(1,2)', '(2,1)'],
      4: ['(1,3)', '(2,2)', '(3,1)'],
      5: ['(1,4)', '(2,3)', '(3,2)', '(4,1)'],
      6: ['(1,5)', '(2,4)', '(3,3)', '(4,2)', '(5,1)'],
      7: ['(1,6)', '(2,5)', '(3,4)', '(4,3)', '(5,2)', '(6,1)'],
      8: ['(2,6)', '(3,5)', '(4,4)', '(5,3)', '(6,2)'],
      9: ['(3,6)', '(4,5)', '(5,4)', '(6,3)'],
      10: ['(4,6)', '(5,5)', '(6,4)'],
      11: ['(5,6)', '(6,5)'],
      12: ['(6,6)'],
    };
    final pairs = diceCombos[_k13TargetDiceSum] ?? [];
    final probPct = (pairs.length / 36.0) * 100.0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Permütasyon, Kombinasyon ve Olasılık Laboratuvarı',
          subtitle: 'Sıralama (P) ile Seçme (C) farkını ve 2 zar olasılık dağılımını inceleyin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Sıralama P(n,r) vs. Seçme C(n,r)',
          subtitle: 'Permütasyonda sıra önemlidir; kombinasyonda sıra önemsizdir',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Eleman Sayısı (n): $nVal', nVal.clamp(0, 9), (v) => setState(() => _k13N = v.clamp(2, 7)), textPrimary, textSecondary),
              _buildNumberSlider('Seçilen (r): $rVal', rVal.clamp(0, 9), (v) => setState(() => _k13R = v.clamp(1, nVal)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('⚡ Permütasyon (Dizilim): P($nVal, $rVal) = $permVal', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 4),
                    Text('🎯 Kombinasyon (Grup): C($nVal, $rVal) = $combVal', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.pink, fontSize: 15)),
                    const SizedBox(height: 6),
                    Text('Fark: P($nVal, $rVal) = C($nVal, $rVal) · $rVal! ($combVal · ${fact(rVal)} = $permVal)', style: TextStyle(color: textSecondary, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. İki Zar Atıldığında Toplamın $_k13TargetDiceSum Olma Olasılığı',
          subtitle: 'Örnek Uzay: 6 · 6 = 36 Durum',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: List.generate(11, (i) {
                  final sum = i + 2;
                  return ChoiceChip(
                    label: Text('Toplam $sum'),
                    selected: _k13TargetDiceSum == sum,
                    onSelected: (s) => setState(() => _k13TargetDiceSum = sum),
                  );
                }),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('İstenen Durumlar (${pairs.length} adet): ${pairs.join(", ")}', style: TextStyle(color: textSecondary, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text('🎯 OLASILIK: ${pairs.length} / 36 = %${probPct.toStringAsFixed(1)}', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.deepOrange, fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // KONU 14 SİMÜLATÖRLERİ: SAYISAL MANTIK VE GRAFİK YORUMLAMA
  // =========================================================================
  Widget _buildTopic14Simulators(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final angleC = 360 - (_k14AngleA + _k14AngleB);
    final countA = (_k14Total * _k14AngleA) / 360.0;
    final countB = (_k14Total * _k14AngleB) / 360.0;
    final countC = (_k14Total * angleC) / 360.0;

    final diffAngle = ((11 * _k14ClockMinute - 60 * _k14ClockHour).abs()) / 2.0;
    final smallAngle = diffAngle > 180 ? (360 - diffAngle) : diffAngle;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          brandColor: brandColor,
          title: 'Sayısal Mantık ve Grafik Yorumlama Laboratuvarı',
          subtitle: '360° daire grafiği oranlaması ve akrep-yelkovan açı formülünü keşfedin.',
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '1. Daire Grafiği 360° Dağılım Modeli',
          subtitle: 'Her derece = (Toplam Miktar / 360) adet',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('A Dilimi Açısı: $_k14AngleA°', (_k14AngleA ~/ 20).clamp(0, 9), (v) => setState(() => _k14AngleA = (v * 20).clamp(40, 200)), textPrimary, textSecondary),
              _buildNumberSlider('B Dilimi Açısı: $_k14AngleB°', (_k14AngleB ~/ 20).clamp(0, 9), (v) => setState(() => _k14AngleB = (v * 20).clamp(30, 360 - _k14AngleA - 20)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Toplam: $_k14Total kişi/ürün | C Dilimi Açısı: $angleC°', style: TextStyle(color: textSecondary, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text('A: ${countA.toInt()} adet (%${((_k14AngleA / 360) * 100).toStringAsFixed(1)})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
                    Text('B: ${countB.toInt()} adet (%${((_k14AngleB / 360) * 100).toStringAsFixed(1)})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
                    Text('C: ${countC.toInt()} adet (%${((angleC / 360) * 100).toStringAsFixed(1)})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),
                    const SizedBox(height: 6),
                    Text('🎯 1° Açı Başına Miktar: ${(_k14Total / 360.0).toStringAsFixed(2)} birim', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.blueGrey, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildSectionCard(
          title: '2. Saat - Açı Formülü: |(11·Dakika - 60·Saat) / 2|',
          subtitle: 'Saat ${_k14ClockHour.toString().padLeft(2, '0')}:${_k14ClockMinute.toString().padLeft(2, '0')} iken Akrep ile Yelkovan Arasındaki Dar Açı',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          brandColor: brandColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNumberSlider('Saat: $_k14ClockHour', _k14ClockHour.clamp(0, 9), (v) => setState(() => _k14ClockHour = v.clamp(1, 12)), textPrimary, textSecondary),
              _buildNumberSlider('Dakika: $_k14ClockMinute', (_k14ClockMinute ~/ 5).clamp(0, 9), (v) => setState(() => _k14ClockMinute = (v * 5).clamp(0, 55)), textPrimary, textSecondary),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text('Açı Formülü: |11 · $_k14ClockMinute - 60 · $_k14ClockHour| / 2', style: TextStyle(color: textSecondary, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text('🎯 DAR AÇI: ${smallAngle.toStringAsFixed(1)}°', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.indigo, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('(Geniş Açı: ${(360 - smallAngle).toStringAsFixed(1)}°)', style: TextStyle(color: textSecondary, fontSize: 11.5)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // SEKME 2: SOKRATİK ADIM ADIM ÇÖZÜCÜ


  // =========================================================================
  Widget _buildSocraticTab(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final problems = _currentTopic.socraticProblems;
    final problem = problems[_currentProblemIndex];
    final currentStepIdx = _problemStepProgress[problem.id] ?? 0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Örnek ${problem.id.split('_').last.replaceAll('p', '')} / ${problems.length}',
              style: TextStyle(fontWeight: FontWeight.w800, color: brandColor, fontSize: 13),
            ),
            Row(
              children: [
                IconButton(
                  tooltip: 'Önceki Soru',
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: _currentProblemIndex > 0
                      ? () => setState(() => _currentProblemIndex--)
                      : null,
                ),
                IconButton(
                  tooltip: 'Sonraki Soru',
                  icon: const Icon(Icons.chevron_right_rounded),
                  onPressed: _currentProblemIndex < problems.length - 1
                      ? () => setState(() => _currentProblemIndex++)
                      : null,
                ),
              ],
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 1.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: brandColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  problem.examYear,
                  style: TextStyle(color: brandColor, fontSize: 10.5, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                problem.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: textPrimary),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Text(
                  problem.rawQuestion,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    color: textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        ...problem.steps.asMap().entries.map((entry) {
          final stepIdx = entry.key;
          final step = entry.value;
          final isUnlocked = stepIdx <= currentStepIdx;
          final isCurrent = stepIdx == currentStepIdx;
          final selectionKey = '${problem.id}_$stepIdx';
          final selectedOption = _userStepSelections[selectionKey];
          final isCorrect = _stepAnsweredCorrectly[selectionKey] ?? false;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isUnlocked ? cardBg : cardBg.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isCurrent
                    ? brandColor
                    : (isCorrect ? Colors.green.withValues(alpha: 0.5) : borderColor),
                width: isCurrent ? 2 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isCorrect
                            ? Colors.green
                            : (isUnlocked ? brandColor : Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isCorrect
                            ? const Icon(Icons.check, size: 14, color: Colors.white)
                            : Text(
                                '${step.stepNumber}',
                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        step.title,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: isUnlocked ? textPrimary : textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                if (isUnlocked) ...[
                  const SizedBox(height: 10),
                  Text(
                    step.prompt,
                    style: TextStyle(fontSize: 13, color: textPrimary, height: 1.35),
                  ),
                  const SizedBox(height: 10),

                  ...step.options.asMap().entries.map((optEntry) {
                    final optIdx = optEntry.key;
                    final optText = optEntry.value;
                    final isOptSelected = selectedOption == optIdx;
                    final isRightChoice = step.correctOptionIndex == optIdx;

                    Color optBg = Colors.black.withValues(alpha: 0.03);
                    Color optBorder = borderColor;

                    if (selectedOption != null) {
                      if (isRightChoice) {
                        optBg = Colors.green.withValues(alpha: 0.12);
                        optBorder = Colors.green;
                      } else if (isOptSelected && !isRightChoice) {
                        optBg = Colors.red.withValues(alpha: 0.12);
                        optBorder = Colors.red;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: InkWell(
                        onTap: selectedOption == null
                            ? () {
                                setState(() {
                                  _userStepSelections[selectionKey] = optIdx;
                                  if (optIdx == step.correctOptionIndex) {
                                    _stepAnsweredCorrectly[selectionKey] = true;
                                    if (stepIdx + 1 > (_problemStepProgress[problem.id] ?? 0)) {
                                      _problemStepProgress[problem.id] = stepIdx + 1;
                                    }
                                  } else {
                                    _stepAnsweredCorrectly[selectionKey] = false;
                                  }
                                });
                              }
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: optBg,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: optBorder),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selectedOption != null
                                    ? (isRightChoice
                                        ? Icons.check_circle_rounded
                                        : (isOptSelected ? Icons.cancel_rounded : Icons.circle_outlined))
                                    : Icons.circle_outlined,
                                size: 16,
                                color: selectedOption != null
                                    ? (isRightChoice ? Colors.green : (isOptSelected ? Colors.red : textSecondary))
                                    : textSecondary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  optText,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: isOptSelected ? FontWeight.w700 : FontWeight.w500,
                                    color: textPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  if (selectedOption != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isCorrect
                            ? Colors.green.withValues(alpha: 0.08)
                            : Colors.red.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step.explanation,
                            style: TextStyle(fontSize: 12, color: textPrimary),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            step.goldenTactic,
                            style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Colors.indigo),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ],
            ),
          );
        }),

        if (currentStepIdx >= problem.steps.length)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              children: [
                const Icon(Icons.stars_rounded, color: Colors.green, size: 30),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tebrikler! Sokratik Adımları Tamamladınız!',
                        style: TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 13.5),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        problem.finalAnswerSummary,
                        style: TextStyle(fontSize: 12, color: textPrimary, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // =========================================================================
  // SEKME 3: HATA AVCISI (SPOT THE TRAP)
  // =========================================================================
  Widget _buildTrapHunterTab(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final traps = _currentTopic.trapScenarios;
    final trap = traps[_currentTrapIndex];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.red.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              const Icon(Icons.crisis_alert_rounded, color: Colors.red, size: 26),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hata Avcısı (ÖSYM Çeldiricisi)',
                      style: TextStyle(color: textPrimary, fontWeight: FontWeight.w900, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Öğrencinin çözümünde ilk hatayı yaptığı adımı bul ve tuzağı deşifre et!',
                      style: TextStyle(color: textSecondary, fontSize: 11.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Senaryo ${_currentTrapIndex + 1} / ${traps.length}', style: TextStyle(fontWeight: FontWeight.bold, color: brandColor)),
            Row(
              children: [
                IconButton(
                  tooltip: 'Önceki',
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: _currentTrapIndex > 0
                      ? () => setState(() {
                            _currentTrapIndex--;
                            _selectedTrapStepIndex = null;
                            _trapFeedbackVisible = false;
                          })
                      : null,
                ),
                IconButton(
                  tooltip: 'Sonraki',
                  icon: const Icon(Icons.chevron_right_rounded),
                  onPressed: _currentTrapIndex < traps.length - 1
                      ? () => setState(() {
                            _currentTrapIndex++;
                            _selectedTrapStepIndex = null;
                            _trapFeedbackVisible = false;
                          })
                      : null,
                ),
              ],
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Soru:', style: TextStyle(color: textSecondary, fontSize: 11, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(
                trap.questionText,
                style: TextStyle(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 13.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        Text(
          'ÖĞRENCİNİN ÇÖZÜM ADIMLARI (Hatalı Adıma Dokunun):',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: textSecondary, letterSpacing: 0.5),
        ),
        const SizedBox(height: 8),

        ...trap.studentSteps.asMap().entries.map((entry) {
          final stepIdx = entry.key;
          final stepText = entry.value;
          final isSelected = _selectedTrapStepIndex == stepIdx;
          final isWrongStep = stepIdx == trap.wrongStepIndex;

          Color stepBg = cardBg;
          Color stepBorder = borderColor;

          if (_trapFeedbackVisible) {
            if (isWrongStep) {
              stepBg = Colors.red.withValues(alpha: 0.12);
              stepBorder = Colors.red;
            } else if (isSelected && !isWrongStep) {
              stepBg = Colors.grey.withValues(alpha: 0.1);
            }
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedTrapStepIndex = stepIdx;
                  _trapFeedbackVisible = true;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: stepBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: stepBorder, width: isSelected ? 1.8 : 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      _trapFeedbackVisible
                          ? (isWrongStep
                              ? Icons.dangerous_rounded
                              : (isSelected ? Icons.cancel_outlined : Icons.check_circle_outline))
                          : Icons.radio_button_unchecked,
                      color: _trapFeedbackVisible
                          ? (isWrongStep ? Colors.red : (isSelected ? Colors.grey : Colors.green))
                          : textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        stepText,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),

        if (_trapFeedbackVisible) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _selectedTrapStepIndex == trap.wrongStepIndex
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.amber.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _selectedTrapStepIndex == trap.wrongStepIndex ? Colors.green : Colors.amber,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _selectedTrapStepIndex == trap.wrongStepIndex
                          ? Icons.verified_rounded
                          : Icons.info_rounded,
                      color: _selectedTrapStepIndex == trap.wrongStepIndex ? Colors.green : Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _selectedTrapStepIndex == trap.wrongStepIndex
                          ? 'Tebrikler! Tuzağı Başarıyla Tespit Ettin!'
                          : 'Hata ${trap.wrongStepIndex + 1}. Adımdaydı!',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        color: _selectedTrapStepIndex == trap.wrongStepIndex ? Colors.green : Colors.amber.shade900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(trap.mistakeExplanation, style: TextStyle(fontSize: 12.5, color: textPrimary)),
                const Divider(height: 16),
                Text('Doğru Çözüm: ${trap.correctSolution}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: textPrimary)),
                const SizedBox(height: 4),
                Text('🎯 ÖSYM Kuralı: ${trap.trapRule}', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11.5, color: Colors.indigo)),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // =========================================================================
  // SEKME 4: ALTIN TAKTİKLER & ÖZET (CHEAT SHEET)
  // =========================================================================
  Widget _buildGoldenTacticsTab(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    if (_selectedTopicNumber == 14) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Daire Grafiğinde Tam Açı 360° Kanunudur",
            rule: "Tüm miktar daima 360 dereceye karşılık gelir. Her dilimin miktarı (Toplam · Açı) / 360 formülüyle tek hamlede bulunur.",
            trap: "Daire grafiğini %100 kabul edip 100 üzerinden orantı kurmaya çalışmak en yaygın dikkatsizlik hatasıdır!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "Saat-Açı Formülü: |(11·Dakika - 60·Saat) / 2|",
            rule: "Akrep ile yelkovan arasındaki dar açı daima bu mutlak değerli formülle hesaplanır. Çıkan sonuç 180°den büyükse 360°tan çıkarılarak dar açı bulunur.",
            trap: "Saat 3:40 olduğunda akrebin tam 3 üzerinde durduğunu sanmayın; akrep de yelkovan ilerledikçe dakikada 0.5° kayar!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "Tablo Doldurmada En Belirgin Hücreden Başla",
            rule: "Sayısal mantık tablolarında satır veya sütununda en az bilinmeyen olan (veya tek boşluğu olan) hücreden çözüme başlanır.",
            trap: "Birden çok ihtimalin olduğu karmaşık hücrelerle boğuşarak vakit kaybetmeyin.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "Terazi ve Denge Sorularında Ortakları Ele",
            rule: "İki kefede de bulunan aynı cisimleri denklem gibi eleyip kalanların sade ağırlık oranını bulun.",
            trap: "Rastgele sayılar denemek yerine sembolleri harflendirip (A, B, C) cebirsel denklem gibi sadeleştirin.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Örüntü ve Dizi Sorularında Periyodu (Mod) Yakala",
            rule: "Tekrarlayan şekil veya sayı dizilerinde periyodun kaç adımda bir başa döndüğünü bulup kalana (mod) bakın.",
            trap: "Periyot 4 ise 75. terim için 75'i 4'e bölün; kalan 3 olduğu için doğrudan 3. terimi alın!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 13) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Permütasyon Sıralar, Kombinasyon Seçer",
            rule: "Sıra önemliyse (şifre, kürsü, dizilim) Permütasyon P(n,r); sıra önemsiz sadece grup önemliyse (takım, heyet) Kombinasyon C(n,r) kullanılır.",
            trap: "3 kişi arasından 2 kişilik temsilci grubu seçilirken permütasyon değil KOMBİNASYON C(3,2) uygulanır!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "Olasılık = İstenen Durum / Tüm Olası Durumlar",
            rule: "Olasılık hesabında paydaya evrensel kümedeki tüm çıktı sayısı, paya ise soru kökündeki şartı sağlayan çıktı sayısı yazılır.",
            trap: "Tüm durumları hesaplarken örnek uzayı eksik saymak veya kısıtlamaları unutmak soruyu götürür.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "\"En Az Bir\" Görünce Tümleyen Kestirmesini Uygula",
            rule: "Soruda \"en az bir tanesi...\" diyorsa; İstenen Olasılık = 1 - P(Hiçbiri Olmama Durumu) kestirmesini kullanın.",
            trap: "Tek tek 1 tanesi, 2 tanesi, 3 tanesi diye toplayarak sayfalar dolusu işlem yapmayın; 1'den \"hiçbiri\" durumunu çıkarın!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "Bağımsız Olaylarda Olasılıklar Çarpılır",
            rule: "Birbirini etkilemeyen olayların birlikte gerçekleşme olasılığı tek tek olasılıklarının çarpımına eşittir: P(A ∩ B) = P(A) · P(B).",
            trap: "Madeni paranın tura gelmesi ile zarın 6 gelmesi birbirinden bağımsızdır; toplanmaz, çarpılır: (1/2) · (1/6) = 1/12.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Tekrarlı Permütasyonda Özdeş Terimler Bölünür",
            rule: "Aynı harf veya nesneler varsa toplam faktöriyel, tekrarlayanların faktöriyellerine bölünür: n! / (n₁! · n₂!).",
            trap: "Özdeş nesnelerin kendi aralarındaki yer değiştirmeleri yeni bir dizilim oluşturmaz!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 12) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Birleşim Formülü: s(A ∪ B) = s(A) + s(B) - s(A ∩ B)",
            rule: "Kesişim bölgesi hem A'da hem B'de sayıldığı için birleşimi bulurken bir defa çıkarılmak zorundadır.",
            trap: "Kesişimi çıkarmayı unutup s(A)+s(B) yazmak en sık yapılan temel küme hatasıdır.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "Alt Küme Sayısı 2ⁿ, Öz Alt Küme 2ⁿ - 1",
            rule: "n elemanlı bir kümenin tüm alt kümeleri 2ⁿ adettir. Kendisi hariç alt kümeleri (öz alt küme) 2ⁿ - 1 adettir.",
            trap: "Boş küme her kümenin alt kümesidir; 0 elemanlı alt küme 1 tanedir (C(n,0)=1).",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "Doğrusal Fonksiyonun Tersi: f(x) = ax + b ⟹ f⁻¹(x) = (x - b) / a",
            rule: "İşlemleri tersine çevirin: Artı b eksi b'ye, çarpı a bölü a'ya dönüşür.",
            trap: "f(a) = b ise f⁻¹(b) = a kuralını kullanarak denklem çözmeden kökü yerine koyabilirsiniz!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "Bileşke Fonksiyon İçten Dışa Hesaplanır",
            rule: "(f ∘ g)(x) = f(g(x)) demektir. Daima en içteki g(x)'ten başlanır ve çıkan sonuç f'e girdi yapılır.",
            trap: "(f ∘ g) ile (g ∘ f) genellikle birbirine EŞİT DEĞİLDİR; sırayı karıştırmayın!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Sabit Fonksiyon Şifresi: x'li Terimler Yoktur",
            rule: "f(x) = c sabit fonksiyonunda x'in katsayıları sıfırlanır. f(x) = (ax+b)/(cx+d) sabit ise a/c = b/d = k olur.",
            trap: "Sabit fonksiyonda f(100) de f(1) de aynı c değerine eşittir.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 11) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Zıt Yönlü Karşılaşmada Hızlar Toplanır",
            rule: "Birbirine doğru hareket eden araçlarda kapatılan mesafe hızlar toplamı ile zamanın çarpımıdır: x = (v₁ + v₂) · t.",
            trap: "Araçlar zıt yönde gidiyor diye hızları birbirinden çıkarmayın; aralarındaki mesafe hızlar toplamı kadar hızla erir!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "Aynı Yönlü Yakalamada Hızlar Çıkarılır",
            rule: "Arkadaki hızlı aracın öndekini yakalaması hız farkına bağlıdır: x = (v₂ - v₁) · t.",
            trap: "Arkadaki araç daha yavaşsa yakalama asla gerçekleşemez; soru boş kümedir.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "Ortalama Hız Aritmetik Ortalama DEĞİLDİR!",
            rule: "Ortalama Hız = (Toplam Alınan Yol) / (Toplam Geçen Süre).",
            trap: "Gidiş 60, dönüş 40 km/s olduğunda (60+40)/2 = 50 yazmak ölümcül ÖSYM tuzağıdır! Doğrusu 2·60·40 / (60+40) = 48 km/s'dir.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "İşçi Problemlerinde 1 Günde Yapılan İşi Bul",
            rule: "A işi a günde, B işi b günde bitiriyorsa 1 günde 1/a + 1/b iş yapılır. Birlikte bitirme süresi: T = (a·b) / (a + b).",
            trap: "İşçilerin gün sayılarını doğrudan toplamayın (a + b günde bitmez, tek başlarına yaptıklarından daha kısa sürede biter!).",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Tren - Tünel Problemlerinde Yol = Tren + Tünel",
            rule: "Bir trenin bir tüneli tamamen geçmesi için trenin son vagonunun da tünelden çıkması gerekir: Yol = Tren Boyu + Tünel Boyu.",
            trap: "Trenin kendi boyunu yola eklemeyi unutursanız mesafe eksik çıkar ve cevap yanlış olur.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 10) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Yüzde Sorularında Maliyete 100x De",
            rule: "Maliyeti veya başlangıç değerini bilmediğiniz yüzde problemlerinde değere 100x diyerek işlem yapın; tüm kesirlerden kurtulun.",
            trap: "x diyerek kesirli sayılarla boğuşmak yerine 100x demek zam ve indirimleri anında tam sayı yapar.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "%20 Zam Üzerine %20 İndirim Maliyete Döndürmez!",
            rule: "100 TL maliyetli ürüne %20 zam yapılırsa 120 TL olur. 120 TL üzerinden %20 indirim yapılırsa (24 TL indirim) fiyat 96 TL'ye düşer (%4 ZARAR).",
            trap: "Zam ve indirim yüzdeleri eşit diye maliyetin değişmeyeceğini zannetmek en klasik KPSS tuzağıdır.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "Karışım Formülü: M₁·Y₁ + M₂·Y₂ = (M₁ + M₂)·Y_son",
            rule: "Karışımlarda madde miktarı ile yüzde çarpımlarının toplamı, son karışım miktarı ile son yüzdenin çarpımına daima eşittir.",
            trap: "Saf su eklenirse yüzdesi %0, saf tuz/şeker eklenirse yüzdesi %100 alınmalıdır!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "Su Buharlaştırıldığında Eksi İşareti Konur",
            rule: "Karışımdan su buharlaştırılıyorsa: M₁·Y₁ - M_su·0 = (M₁ - M_su)·Y_son formülü uygulanır.",
            trap: "Buharlaşan madde sadece sudur; tuz veya şeker buharlaşmaz, dolayısıyla tuz oranı artar.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Enflasyon - Maaş - Alım Gücü Tuzağı",
            rule: "Ürün fiyatına ve maaşa ayrı ayrı 100x ve 100y verip yıl sonu oranlarını kıyaslayın: Alım Gücü = Yeni Maaş / Yeni Fiyat.",
            trap: "Enflasyon %50 iken maaşa %50 zam gelirse alım gücü DEĞİŞMEZ; zam enflasyondan azsa alım gücü azalır.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 9) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Kesir Problemlerinde Paydaların EKOK'unu Bütüne Ata",
            rule: "Bir paranın 1/3'ü sonra kalanın 1/4'ü harcanıyorsa paranın tamamına 3 ile 4'ün EKOK'u olan 12x deyin.",
            trap: "Bütüne x derseniz kesirlerle toplama yaparken işlem hatası yapma riskiniz 10 katına çıkar.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "Tel Kesme Kanunu: Kayma = Kesilen / 2",
            rule: "Bir telin bir ucundan x cm kesilirse orta nokta KESİLENİN YARISI kadar (x/2) diğer uca doğru kayar.",
            trap: "Orta noktanın x kadar kayacağını zannetmeyin; iki uçtan da kesilirse kayma |x - y| / 2 kadardır.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "İki Kişi Arasındaki Yaş Farkı Zamanla Asla Değişmez",
            rule: "Kaç yıl geçerse geçsin kardeşlerin veya anne ile çocuğun yaş farkı daima sabittir.",
            trap: "Yıllar geçtikçe yaş oranları değişir fakat fark daima aynı kalır; denklemi yaş farkı üzerinden kurmak soruyu saniyeler içinde çözer.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "Sıra Problemleri: Baştan + Sondan - 1 = Toplam",
            rule: "Bir kişi kuyrukta baştan n., sondan m. sıradaysa kuyruktaki kişi sayısı n + m - 1'dir.",
            trap: "O kişiyi hem baştan hem sondan saydığınız için 1 çıkarmayı unutursanız cevabı 1 fazla bulursunuz.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Adım Problemleri: Net İlerleme Periyodu",
            rule: "5 ileri 2 geri atan kişi 7 adımda 3 adım ilerler. Toplam adım sayısını 7'ye bölüp kalanı ayrıca ekleyin.",
            trap: "Kalan adımları doğrudan eklerken geriye adım düşüp düşmediğine dikkat edin.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 8) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: "1",
            title: "Sonsuz Çözüm Şartı: 0·x = 0",
            rule: "ax + b = 0 denkleminde çözüm kümesinin tüm gerçel sayılar (sonsuz) olması için x'in katsayısı ve sabit terim aynı anda sıfır olmalıdır: a = 0 ve b = 0.",
            trap: "Sadece a = 0 yapıp b'yi unutursanız denklem 0 = b (b≠0) olur ve çözüm kümesi boş küme çıkar!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "2",
            title: "Boş Küme Şartı: 0·x = c (c ≠ 0)",
            rule: "ax + b = 0 denkleminde çözüm olmaması için bilinmeyenin katsayısı sıfır olmalı, fakat sabit terim sıfır olmamalıdır: a = 0 ve b ≠ 0.",
            trap: "Her iki tarafın da sıfır olması sonsuz çözümdür; boş küme olması için sol taraf 0x iken sağ taraf sıfırdan farklı bir sayı kalmalıdır.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "3",
            title: "Paydayı Sıfır Yapan Kök Çözüm Kümesine ALINAMAZ!",
            rule: "Rasyonel denklemleri çözerken bulduğunuz x kökü paydayı sıfır yapıyorsa (tanımsızlık) o kök elenir ve çözüm kümesine dahil edilmez.",
            trap: "Tüm işlemleri doğru yapıp bulduğunuz kökü doğrudan işaretlemek KPSS'de en acımasız tuzaktır; kökü mutlaka paydada test edin!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "4",
            title: "Tam Karelerin Toplamı Sıfırsa İkisi de Sıfırdır",
            rule: "(A)² + (B)² = 0 ise A = 0 ve B = 0 olmak zorundadır. Çünkü gerçel sayılarda hiçbir sayının karesi negatif olamaz.",
            trap: "Biri pozitif diğeri negatif olup birbirini götüremez; bu kuralı gördüğünüz anda parantez içlerini tek tek sıfıra eşitleyin.",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: "5",
            title: "Üç Bilinmeyenli Sistemde İsteneni Tek Hamlede Yakala",
            rule: "x + y + z istendiğinde üç denklemi taraf tarafa topladığınızda veya uygun katsayıyla çarptığınızda x, y, z katsayıları eşitleniyorsa tek hamlede bölebilirsiniz.",
            trap: "x, y ve z'yi tek tek bulmaya çalışarak sayfalarca işlem yapmayın; ÖSYM denklemleri özel olarak kurgular!",
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }
    if (_selectedTopicNumber == 7) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: '1',
            title: 'Ortak Harf Gördüğün An EKOK\'ta Eşitle',
            rule: 'İkili oranlarda (a/b ve b/c) ortak değişken b\'nin karşısındaki sayılar EKOK\'ta eşitlenir ve tüm sistem tek bir k orantı sabitine bağlanır.',
            trap: 'b\'yi eşitlemeden a=2, b=3, c=5 diyerek toplamak en sık düşülen acemi tuzağıdır! b aynı anda iki farklı değer alamaz.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '2',
            title: 'Ters Orantıda Çarpım Sabittir: Çapraz Kat Verme',
            rule: 'Ters orantıda değişkenlerin çarpımı sabittir: 2x = 3y = 6k ⟹ x = 3k, y = 2k. Küçük sayıya BÜYÜK kat düşer!',
            trap: 'Ters orantı dendiğinde doğru orantı gibi x=2k, y=3k katı verirseniz küçük çocuğa az pay düşer ve soru tamamen yanlış çıkar!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '3',
            title: 'Orantı Sabiti: Toplamda k Değişmez, Çarpımda kⁿ Olur',
            rule: 'a/b = c/d = k iken pay ve payda aynı katsayılarla toplanırsa sabit DEĞİŞMEZ: (a+c)/(b+d) = k. Ancak çarpılırsa (a·c)/(b·d) = k² olur.',
            trap: 'Çarpma işleminde de sonucun k kalacağını zannetmek ÖSYM\'nin en sevdiği şaşırtmacadır!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '4',
            title: 'Bileşik Orantı: (1. İş / 1. Diğerleri) = (2. İş / 2. Diğerleri)',
            rule: 'Karmaşık işçi-zaman problemlerinde sadece "yapılan asıl işi" (halı, fidan, duvar) paya yazın; geri kalan tüm verileri (işçi, gün, saat) paydaya çarpım olarak yazın.',
            trap: 'İşçi sayısını veya günü paya yazmayın; iş sadece ortaya çıkan mamul veya üründür!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '5',
            title: 'AO = GO Şifresi: Sayılar Birbirine Eşittir',
            rule: 'Pozitif gerçel sayılarda Aritmetik Ortalama ≥ Geometrik Ortalama\'dır. Eşitlik (AO = GO) YALNIZCA sayılar birbirine eşit olduğunda (a = b) sağlanır.',
            trap: 'Soru kökünde "AO = GO olduğuna göre" cümlesini gördüğünüz anda hiç denklem kurmadan sayıları birbirine eşitleyin (a = b)!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 6) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: '1',
            title: '(a ± b)² Açılımında Ortadaki 2ab Hayatidir',
            rule: '(a + b)² = a² + 2ab + b² ve (a - b)² = a² - 2ab + b². Birinci ile ikincinin çarpımının iki katı (2ab) asla unutulamaz!',
            trap: '(x + 5)² ifadesini x² + 25 yazıp ortadaki 10x terimini yutmak en klasik KPSS puan kaybıdır!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '2',
            title: 'a² - b² = (a - b)(a + b) İki Kare Farkı Kraldır',
            rule: 'İki terimin kareleri farkı, terimlerin farkı ile toplamının çarpımına eşittir. Büyük sayılarda kare almak yerine bu kural uygulanır.',
            trap: '(a - b)² (tam kare) ile a² - b² (iki kare farkı) kesinlikle aynı şey değildir! İkisini birbirine karıştırmayın.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '3',
            title: 'x + 1/x = k ⟹ x² + 1/x² = k² - 2 Kestirmesi',
            rule: 'x ile 1/x çarpımı 1 olduğu için karesi alındığında ortadaki terim sabit 2 kalır: x² + 1/x² = k² - 2.',
            trap: 'Eğer x - 1/x = k verilirse kare açılımından ortada -2 kalır ve karşıya geçince x² + 1/x² = k² + 2 olur (İşarete dikkat!).',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '4',
            title: 'Arada Toplama Varken Asla Sadeleştirme Yapılamaz',
            rule: 'Sadeleştirme YALNIZCA çarpım durumundaki çarpanlar arasında yapılabilir. Önce ortak paranteze veya çarpanlarına ayırın.',
            trap: '(x² + 4) / (x + 2) kesrinde x² ile x\'i, 4 ile 2\'yi tek tek sadeleştirmek tamamen yanlıştır; x² + 4 çarpanlarına ayrılamaz!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '5',
            title: 'Tam Kareler Negatif Olamaz: Minimum Değer Kestirmesi',
            rule: 'Gerçel sayılarda (A)² ≥ 0 olduğundan çok değişkenli ifadelerin en küçük değerini bulmak için ifade tam karelere tamamlanır.',
            trap: 'x² - 6x + y² + 4y + 20 gibi ifadelerde rastgele değer denemeyin; (x - 3)² + (y + 2)² + 7 yazın ve minimum değerin 7 olduğunu hemen görün!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 5) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: '1',
            title: 'Parantez Hayat Kurtarır: (-a)²ⁿ vs. -a²ⁿ',
            rule: 'Parantezli negatif sayının çift kuvveti POZİTİFTİR: (-2)⁴ = +16. Parantezsiz ifadede çift kuvvet sadece sayıya aittir: -2⁴ = -16.',
            trap: 'Soru çözerken -3² ifadesini +9 almak en yaygın KPSS tuzağıdır! Parantez yoksa -3² = -9\'dur.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '2',
            title: 'Çift Dereceli Kök Mutlak Değerle Çıkar: √(x²) = |x|',
            rule: 'Çift dereceli kök dışına terimler KESİNLİKLE mutlak değerle çıkar: √(x²) = |x|. Tek dereceli kök ise işaretini korur: ³√(x³) = x.',
            trap: 'x < 0 iken √(x²) = x yazmayın! x negatif olduğu için dışarı önüne eksi alarak |x| = -x çıkar.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '3',
            title: 'Aᴮ = 1 Denkleminin 3 Kritik Şartı',
            rule: '1) Üs sıfır olmalıdır (B = 0 ve A ≠ 0). 2) Taban 1 olmalıdır (A = 1). 3) Taban -1 ve Üs ÇİFT TAM SAYI olmalıdır (A = -1 ve B çift).',
            trap: 'Tabanı -1 yapan x kökünü bulunca hemen cevaba eklemeyin; o x değerinin üssü ÇİFT yapıp yapmadığını mutlaka kontrol edin!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '4',
            title: 'Kök İçinde Toplama Kök Dışına Dağıtılamaz',
            rule: '√(a + b) ≠ √a + √b ve √(a² + b²) ≠ a + b. Toplama veya çıkarma işlemi önce kök içinde bitirilmeli, ardından kök alınmalıdır.',
            trap: '√(16 + 9) = √16 + √9 = 4 + 3 = 7 DEĞİLDİR! √(16 + 9) = √25 = 5\'tir.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '5',
            title: '√(A ± 2√B) İç İçe Kök Kestirmesi',
            rule: 'Çarpımları B, toplamları A olan m > n sayıları için √(A ± 2√B) = √m ± √n olur.',
            trap: 'İçteki kökün önünde mutlaka 2 katsayısı bulunmalıdır! Çıkarma yaparken daima büyük kök başa yazılır (Kök sonucu negatif olamaz).',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 4) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: '1',
            title: 'Negatif Çarpanla Yön Değiştirme',
            rule: 'Eşitsizliğin her iki tarafı negatif bir sayıyla çarpılır veya bölünürse eşitsizlik KESİNLİKLE yön değiştirir (< iken > olur).',
            trap: 'İşareti bilinmeyen bir harfle (x) eşitsizliğin her iki tarafını çarpmayın veya sadeleştirmeyin! İşaret bilinmeden yön tayini yapılamaz.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '2',
            title: 'Kare Almada Sıfır (0) Tuzağı',
            rule: 'Aralık sıfırı (0) kapsıyorsa (örn: -3 < x < 5), x² alt sınırı daima 0\'dır ve eşittir: 0 ≤ x² < 25. Üst sınır ise uç noktaların karelerinden büyük olanıdır.',
            trap: 'Alt sınırın da karesini alıp (-3)² = 9 diyerek 9 < x² < 25 yazmak KPSS\'de en çok puan kaybettiren klasik tuzaktır!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '3',
            title: 'ÖSYM Şifresi: a² < a ⟺ 0 < a < 1',
            rule: 'Karesi kendisinden küçük olan sayılar KESİNLİKLE 0 ile 1 arasındaki pozitif basit kesirlerdir (Örn: (1/2)² = 1/4 < 1/2).',
            trap: 'Soruda "a² < a" ifadesini gördüğünüz anda değer aralığı olarak 0 < a < 1 yazın; test için mutlaka 1/2 gibi bir değer verin.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '4',
            title: 'Gerçel Sayı vs. Tam Sayı Ayrımı',
            rule: '"x, y gerçel (reel) sayı" deniyorsa değer SEÇİLEMEZ; eşitsizlikler taraf tarafa toplanıp/genişletilerek aralık bulunur. "Tam sayı" deniyorsa doğrudan en uygun değerler SEÇİLİR.',
            trap: 'Gerçel sayı dediğinde değer seçerseniz aradaki rasyonel sayıların oluşturacağı en büyük veya en küçük uç değerleri kaçırırsınız!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '5',
            title: '|x - a| + |x - b| Minimum Değer Kestirmesi',
            rule: 'İki mutlak değerin toplamının alabileceği EN KÜÇÜK değer, kritik noktaların (içini 0 yapan x = a veya x = b) yerine yazılmasıyla bulunur ve daima |a - b|\'dir.',
            trap: 'Uzun uzun tablo yapmaya gerek yoktur. Bir kökü sıfırlayıp diğerinde yerine koymak saniyeler içinde doğru cevabı verir!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 3) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: '1',
            title: 'Basit Kesir Tanımı ve Negatif Bölge',
            rule: '|Pay| < |Payda| olmalıdır: -Payda < Pay < Payda (-1 ile +1 arası).',
            trap: 'Negatif basit kesirleri unutmayın! 0 da bir basit kesirdir (0/4 = 0).',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '2',
            title: 'Negatif Tam Sayılı Kesir Parantezi',
            rule: '-A b/c kesrinde eksi işareti hem tama hem kesre aittir: -(A + b/c).',
            trap: '-2 tam 1/3 ifadesini -2 + 1/3 = -5/3 olarak çözmek en yaygın ÖSYM hatasıdır! Doğrusu -7/3\'tür.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '3',
            title: 'Virgül Kaydırma Kestirmesi',
            rule: 'Ondalık bölmelerde basamak sayısı az olan tarafa sıfır ekleyip virgülleri tamamen kaldırın.',
            trap: 'Kesre çevirip ters çevirmekle zaman kaybetmeyin: 0,8 / 0,04 = 80 / 4 = 20!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '4',
            title: 'Devreden 9 İse Önceki Basamak Büyür',
            rule: 'Devreden rakam 9 ise bir önceki basamak 1 artırılır ve 9 atılır: 0,9̅ = 1; 2,39̅ = 2,4.',
            trap: 'Paydaya konulan 9 ve 0\'lar SADECE virgülden sonraki basamaklara aittir!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '5',
            title: 'Farkı Eşit Kesir Sıralaması (1 Bütüne Yakınlık)',
            rule: 'Farkı eşit basit kesirlerde terimleri büyük olan 1\'e yakındır ve BÜYÜKTÜR (81/83 > 21/23). Bileşik kesirlerde ise terimleri küçük olan BÜYÜKTÜR (3/2 > 100/99).',
            trap: 'Basit kesir kuralını bileşik kesirde uygulamayın! 3/2 = 1,5 iken 100/99 = 1,01\'dir.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    if (_selectedTopicNumber == 2) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTacticCard(
            number: '1',
            title: 'Kalan Daima Bölenden Küçüktür (0 ≤ K < B)',
            rule: 'A = B · C + K bölme işleminde kalan K, bölenden (B) KESİNLİKLE küçük olmalıdır.',
            trap: 'Bir sayının 12 ile bölümünden kalan en fazla 11 olabilir; 12 veya daha büyük olamaz!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '2',
            title: 'Bileşik Bölünebilmede Sıralama Kuralı',
            rule: '36, 45, 15 gibi bileşik bölünebilmelerde DAİMA ÖNCE son basamağı bağlayan kural (4, 5), EN SON rakamlar toplamı (3, 9) incelenir.',
            trap: 'Önce 9 kuralını uygulamaya kalkarsanız birden fazla bilinmeyenin içinde kaybolursunuz!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '3',
            title: 'EBOB vs. EKOK Ayırımı (Bütün vs. Parça)',
            rule: 'Büyük parçaları eşit küçük parçalara bölüyorsak EBOB (Ağaç dikme, poşetleme). Küçük parçalar birleşip büyüyorsa EKOK (Ziller, nöbetler).',
            trap: 'Tarlanın çevresine ağaç dikme probleminde EKOK alınmaz! Aralıklar küçük parçadır, EBOB kullanılır: Çevre / EBOB.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '4',
            title: 'İki Sayının Çarpımı = EBOB · EKOK',
            rule: 'Pozitif tam sayılarda a · b = EBOB(a, b) · EKOK(a, b) daima geçerlidir.',
            trap: 'Sayılar aralarında asal ise EBOB = 1 ve EKOK = a · b olur.',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
          _buildTacticCard(
            number: '5',
            title: 'Kalan Aritmetiği Kestirmesi',
            rule: 'Cebirsel ifadenin bölümünden kalanı bulurken harflerin yerine doğrudan verilen kalanlar yazılabilir.',
            trap: 'Çıkan sonucu tekrar bölen sayıya (mod) bölmeyi unutmayın!',
            cardBg: cardBg,
            borderColor: borderColor,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
          ),
        ],
      );
    }

    // Konu 1 Taktikleri
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTacticCard(
          number: '1',
          title: 'Sıfırın (0) Nötr Kimliği',
          rule: '0 sayısı Doğal Sayıdır (N) ve Tam Sayıdır (Z); ancak İŞARETSİZDİR (Pozitif veya Negatif DEĞİLDİR!).',
          trap: 'Soru kökünde "pozitif tam sayı" dediğinde 0 veremezsiniz; "doğal sayı" dediğinde en küçük değer olarak mutlaka 0\'ı deneyin!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        _buildTacticCard(
          number: '2',
          title: 'Çift Katsayı Bilinmeyeni Gizler',
          rule: '2x, 4y, 6z gibi çift sayı ile çarpılan her terimin sonucu KESİNLİKLE ÇİFTTİR.',
          trap: '2x çift diye x\'in kendisi çift olmak zorunda DEĞİLDİR (x tek de olsa 2x çifttir). x hakkında kesin hüküm kurulamaz!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        _buildTacticCard(
          number: '3',
          title: 'Çift Kuvvet Domino Taşıdır',
          rule: 'x ≠ 0 olmak üzere x², x⁴, x⁶ terimleri daima POZİTİFTİR (+).',
          trap: 'İşaret sorularında çözüme daima ÇİFT KUVVETİN olduğu eşitsizlikten başlayın ve o terimi parmağınızla kapatın!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        _buildTacticCard(
          number: '4',
          title: 'AB - BA = 9(A - B) Sihirbazı',
          rule: 'İki basamaklı sayıların farkı daima 9\'un katıdır (AB - BA = 9(A-B)). Toplamı ise daima 11\'in katıdır (AB + BA = 11(A+B)).',
          trap: 'BA iki basamaklı sayı dendiğinde B ≠ 0 olmalıdır. B=0 tuzağına düşmeyin!',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        _buildTacticCard(
          number: '5',
          title: 'Ortanca Terim Kısayolu',
          rule: 'Ardışık terimlerin sayısı TEK ise; Toplam / Terim Sayısı = ORTANCA TERİM.',
          trap: 'Ardışık tek sayılar 1\'er değil 2\'şer 2\'şer artar: x, x+2, x+4...',
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
      ],
    );
  }

  // --- YARDIMCI WIDGET'LAR ---
  Widget _buildInfoBanner({
    required Color brandColor,
    required String title,
    required String subtitle,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: brandColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: brandColor.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(Icons.lightbulb_rounded, color: brandColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(color: textSecondary, fontSize: 11.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String subtitle,
    required Widget child,
    required Color cardBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color brandColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: textPrimary)),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 11.5, color: textSecondary)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _buildNumberSlider(
    String label,
    int value,
    ValueChanged<int> onChanged,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: textSecondary),
          ),
        ),
        Expanded(
          child: Slider(
            value: value.toDouble(),
            min: 0,
            max: 9,
            divisions: 9,
            label: '$value',
            onChanged: (v) => onChanged(v.toInt()),
          ),
        ),
        Container(
          width: 28,
          alignment: Alignment.center,
          child: Text(
            '$value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildParityRow(
    String expr,
    String result,
    Color textPrimary,
    Color textSecondary, {
    bool highlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            expr,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
              color: highlight ? Colors.indigo : textPrimary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: highlight ? Colors.indigo.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              result,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: highlight ? Colors.indigo : textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTacticCard({
    required String number,
    required String title,
    required String rule,
    required String trap,
    required Color cardBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  color: Color(0xFF0284C7),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: textPrimary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '📌 Kural: $rule',
            style: TextStyle(fontSize: 12.5, color: textPrimary, height: 1.35),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'ÖSYM Tuzağı: $trap',
                    style: const TextStyle(fontSize: 11.5, color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
