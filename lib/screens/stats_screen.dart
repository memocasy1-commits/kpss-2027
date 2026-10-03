import 'package:flutter/material.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';
import 'settings_screen.dart';
import 'badges_screen.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  Map<String, int> _stats = {
    'solved': 0,
    'correct': 0,
    'wrong': 0,
    'wrongPool': 0,
    'bookmarks': 0,
  };
  Map<String, Map<String, int>> _courseStats = {};
  List<Map<String, dynamic>> _weakTopics = [];
  Map<String, dynamic> _streakData = {'streak': 0, 'isTodaySolved': false};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllStats();
  }

  Future<void> _loadAllStats() async {
    setState(() => _isLoading = true);
    final s = await QuestionService.instance.getStats();
    final cs = await QuestionService.instance.getCourseStats();
    final wt = await QuestionService.instance.getTopWeakTopics(limit: 4);
    final stk = await QuestionService.instance.getStreakData();

    if (mounted) {
      setState(() {
        _stats = s;
        _courseStats = cs;
        _weakTopics = wt;
        _streakData = stk;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final Color bgColor = AppColors.background;
        final Color cardBg = AppColors.card;
        final Color cardBorder = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;

        final int solved = _stats['solved'] ?? 0;
        final int correct = _stats['correct'] ?? 0;
        final int wrong = _stats['wrong'] ?? 0;
        final double accuracy = solved > 0 ? (correct / solved) * 100 : 0.0;
        final double net = (correct - (wrong / 4.0)).clamp(0.0, 9999.0);

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
              'Gelişim & Eksik Analizi',
              style: TextStyle(color: textPrimary, fontSize: 19, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                tooltip: 'Başarı Rozetleri',
                icon: const Icon(Icons.military_tech_rounded, color: Color(0xFFF59E0B)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BadgesScreen()),
                  );
                },
              ),
              IconButton(
                tooltip: 'Ayarlar',
                icon: Icon(Icons.settings_rounded, color: textSecondary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  ).then((_) => _loadAllStats());
                },
              ),
            ],
          ),
          body: _isLoading
              ? Center(child: CircularProgressIndicator(color: AppColors.primary))
              : RefreshIndicator(
                  onRefresh: _loadAllStats,
                  color: AppColors.primary,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Accuracy & Streak Banner
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF312E81), Color(0xFF4338CA), Color(0xFF6366F1)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'GENEL BAŞARI & NET',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              '%${accuracy.toStringAsFixed(1)}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 34,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              'Net: ${net.toStringAsFixed(2)}',
                                              style: const TextStyle(
                                                color: Color(0xFFFBBF24),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '$solved Soru Çözüldü • 4 Yanlış 1 Doğruyu Götürür',
                                          style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.local_fire_department_rounded, color: Color(0xFFF97316), size: 30),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${_streakData['streak']} Gün',
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                        ),
                                        const Text(
                                          'Seri',
                                          style: TextStyle(color: Colors.white70, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Metric Counters Grid
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                cardBg: cardBg,
                                cardBorder: cardBorder,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                                title: 'Doğru',
                                value: '$correct',
                                icon: Icons.check_circle_rounded,
                                iconColor: AppColors.success,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                cardBg: cardBg,
                                cardBorder: cardBorder,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                                title: 'Yanlış',
                                value: '$wrong',
                                icon: Icons.cancel_rounded,
                                iconColor: AppColors.error,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                cardBg: cardBg,
                                cardBorder: cardBorder,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                                title: 'Hata Havuzu',
                                value: '${_stats['wrongPool']}',
                                icon: Icons.warning_amber_rounded,
                                iconColor: AppColors.warning,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildMetricCard(
                                cardBg: cardBg,
                                cardBorder: cardBorder,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                                title: 'Yıldızlılar',
                                value: '${_stats['bookmarks']}',
                                icon: Icons.star_rounded,
                                iconColor: const Color(0xFFEAB308),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // ZAYIF KONULAR & EKSİK RADARI
                        Text(
                          'Eksik Tespiti (En Çok Yanlış Yapılan Konular)',
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (_weakTopics.isEmpty)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: cardBorder),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 28),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Harika! Hata havuzunda bekleyen konu bulunmuyor. Soru çözmeye devam ettikçe eksiklerin burada listelenecek.',
                                    style: TextStyle(color: textSecondary, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          ..._weakTopics.map((item) {
                            final topic = item['topic'] as String;
                            final wrongCount = item['wrongCount'] as int;
                            final courseId = item['courseId'] as String;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: cardBg,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.error.withValues(alpha: 0.25)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.error.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.priority_high_rounded, color: AppColors.error, size: 20),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          topic,
                                          style: TextStyle(
                                            color: textPrimary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '$wrongCount Yanlış Soru • $courseId'.toUpperCase(),
                                          style: const TextStyle(color: AppColors.error, fontSize: 11, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final wrongList = await QuestionService.instance.getWrongQuestions();
                                      final topicQuestions = wrongList
                                          .where((q) => q.subtopicTitle.trim() == topic || q.chapterId == topic)
                                          .toList();
                                      if (context.mounted && topicQuestions.isNotEmpty) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ExamScreen(
                                              title: '$topic (Tekrar)',
                                              questions: topicQuestions,
                                            ),
                                          ),
                                        ).then((_) => _loadAllStats());
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.error,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                    child: const Text('Pekiştir'),
                                  ),
                                ],
                              ),
                            );
                          }),
                        const SizedBox(height: 24),

                        // DERS BAZINDA PERFORMANS ÇUBUKLARI
                        Text(
                          'Ders Bazında Başarı Oranları',
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildCourseBar('Tarih', 'tarih', const Color(0xFFD97706), cardBg, cardBorder, textPrimary, textSecondary),
                        _buildCourseBar('Türkçe', 'turkce', const Color(0xFF7C3AED), cardBg, cardBorder, textPrimary, textSecondary),
                        _buildCourseBar('Coğrafya', 'cografya', const Color(0xFF059669), cardBg, cardBorder, textPrimary, textSecondary),
                        _buildCourseBar('Vatandaşlık', 'vatandaslik', const Color(0xFF2563EB), cardBg, cardBorder, textPrimary, textSecondary),
                        _buildCourseBar('Matematik', 'matematik', const Color(0xFF0891B2), cardBg, cardBorder, textPrimary, textSecondary),
                        _buildCourseBar('Mantık', 'mantik', const Color(0xFF9333EA), cardBg, cardBorder, textPrimary, textSecondary),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildMetricCard({
    required Color cardBg,
    required Color cardBorder,
    required Color textPrimary,
    required Color textSecondary,
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(color: textSecondary, fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseBar(
    String courseName,
    String courseKey,
    Color color,
    Color cardBg,
    Color cardBorder,
    Color textPrimary,
    Color textSecondary,
  ) {
    final cData = _courseStats[courseKey] ?? {'solved': 0, 'correct': 0, 'wrong': 0};
    final int solved = cData['solved'] ?? 0;
    final int correct = cData['correct'] ?? 0;
    final double ratio = solved > 0 ? (correct / solved) : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseName,
                style: TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                solved > 0 ? '%${(ratio * 100).toInt()} ($correct/$solved Doğru)' : 'Henüz Soru Çözülmedi',
                style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: cardBorder,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
