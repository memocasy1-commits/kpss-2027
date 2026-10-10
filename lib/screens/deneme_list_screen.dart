import 'package:flutter/material.dart';
import '../models/deneme_model.dart';
import '../services/question_service.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import '../services/security_service.dart';
import 'mock_exam_screen.dart';

class DenemeListScreen extends StatefulWidget {
  const DenemeListScreen({super.key});

  @override
  State<DenemeListScreen> createState() => _DenemeListScreenState();
}

class _DenemeListScreenState extends State<DenemeListScreen> {
  String _selectedFilter = 'Tümü'; // 'Tümü', 'Kolay', 'Orta', 'Zor'

  @override
  Widget build(BuildContext context) {
    final exams = QuestionService.instance.denemeExams;
    final filteredExams = _selectedFilter == 'Tümü'
        ? exams
        : exams.where((e) => e.difficulty == _selectedFilter).toList();

    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode.isDark;
        final Color bgColor = AppColors.background;
        final Color textPrimary = AppColors.textPrimary;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            titleSpacing: 0,
            title: Text(
              'KPSS Denemeleri',
              style: TextStyle(
                color: textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                  color: isDark ? const Color(0xFFFBBF24) : AppColors.primary,
                ),
                onPressed: () => ThemeService.instance.toggleTheme(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: const EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.assignment_rounded, color: AppColors.primaryLight, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${exams.length} Deneme',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KPSS Official Exam Standard Banner
                _buildOfficialInfoBanner(isDark),
                const SizedBox(height: 20),

                // Difficulty Filters
                Row(
                  children: [
                    _buildFilterChip('Tümü', isDark: isDark, count: exams.length),
                    const SizedBox(width: 8),
                    _buildFilterChip('Kolay', isDark: isDark, count: exams.where((e) => e.difficulty == 'Kolay').length, color: const Color(0xFF10B981)),
                    const SizedBox(width: 8),
                    _buildFilterChip('Orta', isDark: isDark, count: exams.where((e) => e.difficulty == 'Orta').length, color: const Color(0xFFF59E0B)),
                    const SizedBox(width: 8),
                    _buildFilterChip('Zor', isDark: isDark, count: exams.where((e) => e.difficulty == 'Zor' || e.difficulty == 'Çok Zor').length, color: const Color(0xFFEF4444)),
                  ],
                ),
                const SizedBox(height: 16),

                // Exam Cards List
                ...filteredExams.map((exam) => _buildExamCard(context, exam, isDark)),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOfficialInfoBanner(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(
                colors: [Color(0xFF1E1B4B), Color(0xFF312E81)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : const LinearGradient(
                colors: [Color(0xFFEEF2FF), Color(0xFFE0E7FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? AppColors.primary.withValues(alpha: 0.4) : const Color(0xFFC7D2FE),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.primary.withValues(alpha: 0.2)
                : const Color(0xFF6366F1).withValues(alpha: 0.1),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.primary.withValues(alpha: 0.2)
                      : AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.verified_rounded,
                  color: isDark ? AppColors.primaryLight : const Color(0xFF4F46E5),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birebir ÖSYM KPSS Simülasyonu',
                      style: TextStyle(
                        color: isDark ? Colors.white : const Color(0xFF1E1B4B),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '120 Soru • 130 Dakika • 4 Yanlış 1 Doğruyu Götürür',
                      style: TextStyle(
                        color: isDark ? AppColors.textSecondary : const Color(0xFF4338CA),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Divider(color: isDark ? const Color(0xFF4338CA) : const Color(0xFFC7D2FE), height: 1),
          const SizedBox(height: 12),
          // Subject breakdown tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: const [
              _SubjectPill(title: 'Türkçe', count: '30 Soru', color: Color(0xFF0D9488)),
              _SubjectPill(title: 'Matematik', count: '26 Soru', color: Color(0xFFEA580C)),
              _SubjectPill(title: 'Geometri', count: '4 Soru', color: Color(0xFFF59E0B)),
              _SubjectPill(title: 'Tarih', count: '27 Soru', color: Color(0xFF6366F1)),
              _SubjectPill(title: 'Coğrafya', count: '18 Soru', color: Color(0xFF10B981)),
              _SubjectPill(title: 'Vatandaşlık & Güncel', count: '15 Soru', color: Color(0xFF8B5CF6)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '💡 Sınav sırasında sadece işaretleme yapabilirsiniz. Sınavı tamamladığınızda netleriniz, olası KPSS puanlarınız (P3, P93, P94) ve tüm soruların detaylı çözümleri açılacaktır.',
            style: TextStyle(
              color: isDark ? const Color(0xFFC7D2FE) : const Color(0xFF3730A3),
              fontSize: 12,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {required bool isDark, required int count, Color? color}) {
    final isSelected = _selectedFilter == label;
    final Color chipBg = isDark ? const Color(0xFF1E293B) : const Color(0xFFFFFFFF);
    final Color chipBorder = isDark ? const Color(0xFF2E3D52) : const Color(0xFFCBD5E1);

    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedFilter = label),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? (color ?? AppColors.primary).withValues(alpha: 0.2)
                : chipBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? (color ?? AppColors.primaryLight) : chipBorder,
              width: isSelected ? 1.8 : 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            '$label ($count)',
            style: TextStyle(
              color: isSelected
                  ? (color ?? AppColors.primaryLight)
                  : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExamCard(BuildContext context, DenemeExam exam, bool isDark) {
    Color diffColor;
    if (exam.difficulty == 'Kolay') {
      diffColor = const Color(0xFF10B981);
    } else if (exam.difficulty == 'Orta') {
      diffColor = const Color(0xFFF59E0B);
    } else {
      diffColor = const Color(0xFFEF4444);
    }

    final bool isReady = exam.isReady;
    final Color cardBg = AppColors.card;
    final Color cardBorder = AppColors.cardBorder;
    final Color textPrimary = AppColors.textPrimary;
    final Color textSecondary = AppColors.textSecondary;
    final Color pillBg = AppColors.surfaceLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isReady ? diffColor.withValues(alpha: 0.5) : cardBorder,
          width: isReady ? 1.6 : 1.0,
        ),
        boxShadow: isReady
            ? [
                BoxShadow(
                  color: diffColor.withValues(alpha: 0.12),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : (isDark
                ? null
                : [
                    BoxShadow(
                      color: const Color(0xFF64748B).withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon or Lock
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isReady ? diffColor.withValues(alpha: 0.15) : pillBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isReady ? Icons.quiz_rounded : Icons.lock_outline_rounded,
                    color: isReady ? diffColor : const Color(0xFF94A3B8),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            exam.title,
                            style: TextStyle(
                              color: isReady ? textPrimary : textSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Difficulty Badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: diffColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: diffColor.withValues(alpha: 0.4)),
                            ),
                            child: Text(
                              exam.difficulty,
                              style: TextStyle(color: diffColor, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        exam.subtitle,
                        style: TextStyle(
                          color: isDark ? const Color(0xFF64748B) : const Color(0xFF64748B),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Ready / Locked pill
                if (!isReady)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: pillBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Hazırlanıyor',
                      style: TextStyle(
                        color: isDark ? const Color(0xFF64748B) : const Color(0xFF64748B),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              exam.description,
              style: TextStyle(color: textSecondary, fontSize: 12, height: 1.3),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 14,
                      color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${exam.durationMinutes} Dakika',
                      style: TextStyle(
                        color: isDark ? const Color(0xFF64748B) : const Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.format_list_numbered_rounded,
                      size: 14,
                      color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${exam.questionCount} Soru',
                      style: TextStyle(
                        color: isDark ? const Color(0xFF64748B) : const Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                if (isReady)
                  ElevatedButton.icon(
                    onPressed: () async {
                      final canAccess = await SecurityService.instance.canAccessDeneme(exam.id);
                      if (!canAccess) {
                        if (context.mounted) {
                          SecurityService.instance.showLicenseLockDialog(
                            context: context,
                            featureTitle: exam.title,
                          );
                        }
                        return;
                      }
                      if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MockExamScreen(deneme: exam),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 18),
                        label: const Text('Sınava Başla'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: diffColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        ),
                      )
                else
                  TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${exam.title} henüz hazırlanmaktadır. Çok yakında eklenecektir.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.lock_clock_rounded,
                      size: 16,
                      color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
                    ),
                    label: Text(
                      'Yakında',
                      style: TextStyle(
                        color: isDark ? const Color(0xFF64748B) : const Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectPill extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const _SubjectPill({required this.title, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        '$title ($count)',
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}
