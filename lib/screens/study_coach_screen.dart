import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/study_plan_model.dart';
import '../services/study_plan_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'lecture_hub_screen.dart';
import 'math_lab_screen.dart';
import 'pomodoro_screen.dart';
import 'soru_bankalari_screen.dart';
import 'spaced_repetition_screen.dart';
import 'deneme_list_screen.dart';
import 'test_list_screen.dart';

class StudyCoachScreen extends StatefulWidget {
  const StudyCoachScreen({super.key});

  @override
  State<StudyCoachScreen> createState() => _StudyCoachScreenState();
}

class _StudyCoachScreenState extends State<StudyCoachScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  // Plan Sihirbazı Durumları
  int _wizardTargetScore = 85;
  int _wizardTotalDays = 60;
  double _wizardDailyHours = 4.0;
  StudyLevel _wizardLevel = StudyLevel.intermediate;
  bool _wizardReminderEnabled = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initService();
  }

  Future<void> _initService() async {
    await StudyPlanService.instance.init();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _createPlan() async {
    setState(() => _isLoading = true);
    final goal = StudyPlanGoal(
      targetScore: _wizardTargetScore,
      totalDays: _wizardTotalDays,
      dailyHours: _wizardDailyHours,
      level: _wizardLevel,
      reminderEnabled: _wizardReminderEnabled,
    );
    await StudyPlanService.instance.generatePlan(goal);
    setState(() => _isLoading = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎯 Harika! Kişiselleştirilmiş KPSS Planın Oluşturuldu!'),
          backgroundColor: Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _rebalancePlan() async {
    final redistributed = await StudyPlanService.instance.rebalancePlan();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            redistributed > 0
                ? '⚖️ Plan Dengelendi! $redistributed eksik görev sonraki günlere paylaştırıldı.'
                : '✅ Harikasın! Bekleyen eksik görev bulunmuyor, planın tıkırında!',
          ),
          backgroundColor: const Color(0xFF6366F1),
          behavior: SnackBarBehavior.floating,
        ),
      );
      setState(() {});
    }
  }

  void _sendNotificationTest() async {
    await StudyPlanService.instance.triggerDailyNotificationNow();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🔔 Bildirim çubuğuna hatırlatma başarıyla gönderildi!'),
          backgroundColor: Color(0xFF38BDF8),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _navigateToMission(DailyMissionItem mission) {
    Widget destination;
    switch (mission.type) {
      case MissionType.lecture:
        destination = const LectureHubScreen();
        break;
      case MissionType.test:
        if (mission.targetKey == 'mini_deneme' || mission.targetKey.contains('deneme')) {
          destination = const DenemeListScreen();
        } else if (['tarih', 'turkce', 'matematik', 'cografya', 'vatandaslik'].contains(mission.targetKey)) {
          destination = TestListScreen(courseId: mission.targetKey, courseTitle: '${mission.targetKey.toUpperCase()} Soru Bankası');
        } else {
          destination = const SoruBankalariScreen();
        }
        break;
      case MissionType.mathLab:
        final topicNum = int.tryParse(mission.targetKey) ?? 1;
        destination = MathLabScreen(initialTopicNumber: topicNum);
        break;
      case MissionType.spacedRepetition:
        destination = const SpacedRepetitionScreen();
        break;
      case MissionType.deneme:
        destination = const DenemeListScreen();
        break;
      case MissionType.pomodoro:
        destination = const PomodoroScreen();
        break;
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
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
        const Color brandColor = Color(0xFF6366F1); // Indigo

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
                  child: const Icon(Icons.psychology_rounded, color: brandColor, size: 22),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Akıllı Planlama Koçu',
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Kişisel Çalışma Takvimi & Hatırlatıcı',
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
              IconButton(
                tooltip: 'Bildirim Gönder (Test)',
                icon: const Icon(Icons.notifications_active_rounded, color: Color(0xFFFBBF24)),
                onPressed: _sendNotificationTest,
              ),
            ],
            bottom: StudyPlanService.instance.hasActivePlan
                ? TabBar(
                    controller: _tabController,
                    labelColor: brandColor,
                    unselectedLabelColor: textSecondary,
                    indicatorColor: brandColor,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                    tabs: const [
                      Tab(icon: Icon(Icons.today_rounded, size: 18), text: 'Bugün'),
                      Tab(icon: Icon(Icons.alt_route_rounded, size: 18), text: 'Yol Haritası'),
                      Tab(icon: Icon(Icons.tune_rounded, size: 18), text: 'Ayarlar'),
                    ],
                  )
                : null,
          ),
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : (!StudyPlanService.instance.hasActivePlan
                  ? _buildWizardView(cardBg, borderColor, textPrimary, textSecondary, brandColor)
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildTodayView(cardBg, borderColor, textPrimary, textSecondary, brandColor),
                        _buildTimelineView(cardBg, borderColor, textPrimary, textSecondary, brandColor),
                        _buildSettingsView(cardBg, borderColor, textPrimary, textSecondary, brandColor),
                      ],
                    )),
        );
      },
    );
  }

  // =========================================================================
  // 1. PLAN OLUŞTURMA SİHİRBAZI (WIZARD)
  // =========================================================================
  Widget _buildWizardView(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Bilgilendirme Bannerı
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: brandColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: brandColor.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              Icon(Icons.auto_awesome_rounded, color: brandColor, size: 32),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hedefine Özel Dinamik Planlayıcı',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.5, color: textPrimary),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Hedef puanına ve kalan sürene göre her gün çözmen gereken soru ve konuları dengeli biçimde planlar.',
                      style: TextStyle(fontSize: 12, color: textSecondary, height: 1.3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // ADIM 1: Hedef Puan
        Text('1. Hedeflediğin KPSS Puanı', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: textPrimary)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [75, 80, 85, 90, 95].map((score) {
            final isSel = _wizardTargetScore == score;
            return ChoiceChip(
              label: Text('$score+ Puan'),
              selected: isSel,
              selectedColor: brandColor.withValues(alpha: 0.2),
              onSelected: (_) => setState(() => _wizardTargetScore = score),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),

        // ADIM 2: Kalan Süre
        Text('2. Sınava Kalan Süre / Hazırlık Süresi: $_wizardTotalDays Gün', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: textPrimary)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            {'d': 30, 'l': '30 Gün (Şok Kampı)'},
            {'d': 60, 'l': '60 Gün (Hızlandırılmış)'},
            {'d': 90, 'l': '90 Gün (Standart)'},
            {'d': 120, 'l': '120 Gün (Tam Döngü)'},
          ].map((item) {
            final days = item['d'] as int;
            final isSel = _wizardTotalDays == days;
            return ChoiceChip(
              label: Text(item['l'] as String),
              selected: isSel,
              selectedColor: brandColor.withValues(alpha: 0.2),
              onSelected: (_) => setState(() => _wizardTotalDays = days),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),

        // ADIM 3: Günlük Saat
        Text('3. Günde Ayırabileceğin Zaman: ${_wizardDailyHours.toInt()} Saat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: textPrimary)),
        Slider(
          value: _wizardDailyHours,
          min: 2.0,
          max: 8.0,
          divisions: 3,
          label: '${_wizardDailyHours.toInt()} Saat',
          onChanged: (v) => setState(() => _wizardDailyHours = v),
        ),
        const SizedBox(height: 14),

        // ADIM 4: Başlangıç Seviyesi
        Text('4. Mevcut Durumun', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: textPrimary)),
        const SizedBox(height: 8),
        Column(
          children: StudyLevel.values.map((lvl) {
            final isSel = _wizardLevel == lvl;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: isSel ? brandColor.withValues(alpha: 0.1) : cardBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isSel ? brandColor : borderColor),
              ),
              child: ListTile(
                title: Text(lvl.label, style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary, fontSize: 13)),
                subtitle: Text(lvl.description, style: TextStyle(fontSize: 11.5, color: textSecondary)),
                trailing: isSel ? Icon(Icons.check_circle_rounded, color: brandColor) : null,
                onTap: () => setState(() => _wizardLevel = lvl),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),

        // Oluştur Butonu
        ElevatedButton.icon(
          onPressed: _createPlan,
          icon: const Icon(Icons.rocket_launch_rounded),
          label: const Text('Dinamik Planımı Oluştur', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
          style: ElevatedButton.styleFrom(
            backgroundColor: brandColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // 2. BUGÜNÜN KOÇ GÖREVLERİ (TODAY VIEW)
  // =========================================================================
  Widget _buildTodayView(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final plan = StudyPlanService.instance.currentPlan!;
    final day = plan.currentStudyDay;
    final totalMissions = day.missions.length;
    final completedMissions = day.completedCount;
    final progress = day.progress;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // İlerleme & Faz Kartı
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor, width: 1.2),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GÜN ${day.dayNumber} / ${plan.totalDays}',
                        style: TextStyle(fontWeight: FontWeight.w900, color: brandColor, fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        plan.phaseName,
                        style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary, fontSize: 13),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Hedef: ${plan.goal.targetScore}+',
                      style: const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF10B981), fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.black.withValues(alpha: 0.05),
                  valueColor: AlwaysStoppedAnimation<Color>(brandColor),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bugünkü İlerleme: $completedMissions / $totalMissions Görev',
                    style: TextStyle(fontSize: 12, color: textSecondary, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '%${(progress * 100).toInt()} Tamamlandı',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: brandColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Koç Tavsiyesi
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: brandColor.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: brandColor.withValues(alpha: 0.2)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.lightbulb_rounded, color: Color(0xFFFBBF24), size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  day.phaseNumber == 1
                      ? '💡 Faz 1: Kavramsal temeli inşa ediyoruz. Sayısal ve sözel modülleri ardışık çalışarak zihinsel yorgunluğu önle.'
                      : (day.phaseNumber == 2
                          ? '⚡ Faz 2: Soru maratonundayız. Çözemediğin her soruyu mutlaka çözüm adımıyla incele ve Leitner kutusuna at.'
                          : '🏆 Faz 3: Sınav provası dönemi. Süre kontrolüne dikkat et, deneme netlerini düzenli kaydet!'),
                  style: TextStyle(fontSize: 12, color: textPrimary, height: 1.35),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Başlık
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Günün Görevleri', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: textPrimary)),
            TextButton.icon(
              onPressed: _rebalancePlan,
              icon: const Icon(Icons.balance_rounded, size: 16),
              label: const Text('Dengele', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Görev Kartları Listesi
        ...day.missions.map((mission) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: mission.isCompleted ? const Color(0xFF10B981) : borderColor,
                width: mission.isCompleted ? 1.5 : 1.0,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              leading: GestureDetector(
                onTap: () async {
                  HapticFeedback.lightImpact();
                  await StudyPlanService.instance.toggleMission(mission.id);
                  setState(() {});
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: mission.isCompleted
                        ? const Color(0xFF10B981)
                        : mission.type.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    mission.isCompleted ? Icons.check_rounded : mission.type.icon,
                    color: mission.isCompleted ? Colors.white : mission.type.color,
                    size: 20,
                  ),
                ),
              ),
              title: Text(
                mission.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                  color: textPrimary,
                  decoration: mission.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text(
                '${mission.type.label} • ~${mission.estimatedMinutes} dk\n${mission.subtitle}',
                style: TextStyle(fontSize: 11.5, color: textSecondary, height: 1.3),
              ),
              trailing: ElevatedButton(
                onPressed: () => _navigateToMission(mission),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mission.type.color.withValues(alpha: 0.15),
                  foregroundColor: mission.type.color,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Başla', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5)),
              ),
            ),
          );
        }),
      ],
    );
  }

  // =========================================================================
  // 3. YOL HARİTASI & TAKVİM (TIMELINE VIEW)
  // =========================================================================
  Widget _buildTimelineView(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    final plan = StudyPlanService.instance.currentPlan!;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Pedagojik Faz Dağılımı', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: textPrimary)),
        const SizedBox(height: 12),

        _buildPhaseCard(
          phaseNum: '1',
          title: 'Kavramsal İnşa & Temel',
          subtitle: '54 Konu anlatımı modülü, temel soru testleri ve Math Lab (1-7)',
          percent: '1. - ${(plan.totalDays * 0.5).toInt()}. Günler',
          color: const Color(0xFF3B82F6),
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        _buildPhaseCard(
          phaseNum: '2',
          title: 'Entegrasyon & Soru Fırtınası',
          subtitle: 'Yoğun soru çözümü, Math Lab problemleri (8-14) ve Leitner hafıza temizliği',
          percent: '${(plan.totalDays * 0.5).toInt() + 1}. - ${(plan.totalDays * 0.8).toInt()}. Günler',
          color: const Color(0xFF8B5CF6),
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),
        _buildPhaseCard(
          phaseNum: '3',
          title: 'Deneme Kondisyonu & Şok Tekrar',
          subtitle: '120 Soruluk tam denemeler, son düzlük anayasa & güncel bilgiler taraması',
          percent: '${(plan.totalDays * 0.8).toInt() + 1}. - ${plan.totalDays}. Günler',
          color: const Color(0xFFEF4444),
          cardBg: cardBg,
          borderColor: borderColor,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
        ),

        const SizedBox(height: 20),
        Text('Günlük İlerleme Çizelgesi', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: textPrimary)),
        const SizedBox(height: 10),

        // Gün listesi özeti
        ...plan.days.take(20).map((d) {
          final isCurrent = d.dayNumber == plan.currentDayNumber;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isCurrent ? brandColor.withValues(alpha: 0.12) : cardBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isCurrent ? brandColor : borderColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Gün ${d.dayNumber}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: isCurrent ? brandColor : textPrimary, fontSize: 13),
                    ),
                    if (isCurrent) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: brandColor, borderRadius: BorderRadius.circular(4)),
                        child: const Text('BUGÜN', style: TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ],
                ),
                Text(
                  '${d.completedCount} / ${d.missions.length} Görev',
                  style: TextStyle(fontSize: 12, color: textSecondary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPhaseCard({
    required String phaseNum,
    required String title,
    required String subtitle,
    required String percent,
    required Color color,
    required Color cardBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: Center(
              child: Text(phaseNum, style: TextStyle(fontWeight: FontWeight.w900, color: color, fontSize: 14)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: textPrimary)),
                    Text(percent, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
                  ],
                ),
                const SizedBox(height: 3),
                Text(subtitle, style: TextStyle(fontSize: 11.5, color: textSecondary, height: 1.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // 4. PLAN AYARLARI (SETTINGS VIEW)
  // =========================================================================
  Widget _buildSettingsView(
    Color cardBg,
    Color borderColor,
    Color textPrimary,
    Color textSecondary,
    Color brandColor,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bildirim & Hatırlatıcı', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textPrimary)),
              const SizedBox(height: 10),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Gün İçi Hatırlatmalar', style: TextStyle(fontSize: 13, color: textPrimary)),
                subtitle: Text('Sistem bildirim çubuğunda günün görevlerini anımsatır', style: TextStyle(fontSize: 11.5, color: textSecondary)),
                value: _wizardReminderEnabled,
                activeTrackColor: brandColor,
                onChanged: (v) => setState(() => _wizardReminderEnabled = v),
              ),
              const Divider(height: 20),
              ElevatedButton.icon(
                onPressed: _sendNotificationTest,
                icon: const Icon(Icons.send_rounded, size: 16),
                label: const Text('Şimdi Bildirim Gönder (Test)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandColor.withValues(alpha: 0.15),
                  foregroundColor: brandColor,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 42),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Planı Sıfırla / Yeniden Başlat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textPrimary)),
              const SizedBox(height: 6),
              Text(
                'Mevcut planını silip yeni bir hedef veya süre ile sıfırdan plan oluşturabilirsin.',
                style: TextStyle(fontSize: 12, color: textSecondary),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () async {
                  await StudyPlanService.instance.deletePlan();
                  setState(() {});
                },
                icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
                label: const Text('Mevcut Planı Sil ve Yeni Plan Yap', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  minimumSize: const Size(double.infinity, 42),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
