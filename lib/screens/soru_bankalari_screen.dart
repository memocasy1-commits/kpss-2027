import 'package:flutter/material.dart';
import '../services/question_service.dart';
import '../theme/app_theme.dart';
import '../services/theme_service.dart';
import 'test_list_screen.dart';
import 'exam_screen.dart';

class SoruBankalariScreen extends StatelessWidget {
  const SoruBankalariScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: Text(
              'Soru Bankaları',
              style: TextStyle(
                color: textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
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
                    Icon(Icons.menu_book_rounded, color: AppColors.primaryLight, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${QuestionService.formatNumber(QuestionService.instance.grandTotalQuestionCount)} Soru',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
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
                // Header for Courses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ders Soru Bankaları',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '7 Ders • ${QuestionService.instance.totalCourseTestCount} Test',
                      style: TextStyle(
                        color: isDark ? const Color(0xFF64748B) : const Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tarih Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Tarih Soru Bankası',
                  subtitle: 'Tüm Müfredat Tamamlandı (${QuestionService.formatNumber(QuestionService.instance.totalTarihCount)} Soru • ${QuestionService.instance.totalTarihTestCount} Test • Çözümlü)',
                  questionCount: QuestionService.instance.totalTarihCount,
                  testCount: QuestionService.instance.totalTarihTestCount,
                  icon: Icons.account_balance_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'tarih',
                          courseTitle: 'Tarih Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Türkçe Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Türkçe Soru Bankası',
                  subtitle: 'Sözcükte Anlam, Cümlede Anlam, Paragraf, Dil Bilgisi & PİSA (${QuestionService.formatNumber(QuestionService.instance.totalTurkceCount)} Soru • ${QuestionService.instance.totalTurkceTestCount} Test)',
                  questionCount: QuestionService.instance.totalTurkceCount,
                  testCount: QuestionService.instance.totalTurkceTestCount,
                  icon: Icons.menu_book_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D9488), Color(0xFF0284C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'turkce',
                          courseTitle: 'Türkçe Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Matematik & Geometri Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Matematik & Geometri',
                  subtitle: 'Kademeli Zorluk • Geometri ve PİSA Analitiği Dahil (${QuestionService.formatNumber(QuestionService.instance.totalMatematikCount)} Soru • ${QuestionService.instance.totalMatematikTestCount} Test)',
                  questionCount: QuestionService.instance.totalMatematikCount,
                  testCount: QuestionService.instance.totalMatematikTestCount,
                  icon: Icons.functions_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD97706), Color(0xFFEA580C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'matematik',
                          courseTitle: 'Matematik & Geometri Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Coğrafya Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Coğrafya Soru Bankası',
                  subtitle: 'ÖSYM Formatında Çözümlü • Fiziki, Beşerî ve Ekonomik Coğrafya (${QuestionService.formatNumber(QuestionService.instance.totalCografyaCount)} Soru • ${QuestionService.instance.totalCografyaTestCount} Test)',
                  questionCount: QuestionService.instance.totalCografyaCount,
                  testCount: QuestionService.instance.totalCografyaTestCount,
                  icon: Icons.public_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF047857), Color(0xFF10B981)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'cografya',
                          courseTitle: 'Coğrafya Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Vatandaşlık & Anayasa Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Vatandaşlık & Anayasa',
                  subtitle: 'ÖSYM Formatında Çözümlü • Hukuk, Anayasa, İdare ve Güncel (${QuestionService.formatNumber(QuestionService.instance.totalVatandaslikCount)} Soru • ${QuestionService.instance.totalVatandaslikTestCount} Test)',
                  questionCount: QuestionService.instance.totalVatandaslikCount,
                  testCount: QuestionService.instance.totalVatandaslikTestCount,
                  icon: Icons.gavel_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4338CA), Color(0xFF6366F1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'vatandaslik',
                          courseTitle: 'Vatandaşlık Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Sözel Mantık Soru Bankası Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Sözel Mantık Soru Bankası',
                  subtitle: 'Özgün & Yenilikçi ÖSYM Kurguları (${QuestionService.formatNumber(QuestionService.instance.totalMantikCount)} Soru • ${QuestionService.instance.totalMantikTestCount} Test • Çözümlü)',
                  questionCount: QuestionService.instance.totalMantikCount,
                  testCount: QuestionService.instance.totalMantikTestCount,
                  icon: Icons.psychology_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6B21A8), Color(0xFF9333EA)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'mantik',
                          courseTitle: 'Sözel Mantık Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Sayısal Mantık Soru Bankası Course Card
                _buildCourseCard(
                  context: context,
                  isDark: isDark,
                  title: 'Sayısal Mantık Soru Bankası',
                  subtitle: 'Vektörel & Çizimsel Şemalar, Orta-Zor Düzey (${QuestionService.formatNumber(QuestionService.instance.totalSayisalMantikCount)} Soru • ${QuestionService.instance.totalSayisalMantikTestCount} Test • Çözümlü)',
                  questionCount: QuestionService.instance.totalSayisalMantikCount,
                  testCount: QuestionService.instance.totalSayisalMantikTestCount,
                  icon: Icons.calculate_rounded,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D9488), Color(0xFF0284C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestListScreen(
                          courseId: 'sayisal_mantik',
                          courseTitle: 'Sayısal Mantık Soru Bankası',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // Quick practice buttons
                Text(
                  'Hızlı Alıştırma Modları',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildPracticeButton(
                        context: context,
                        isDark: isDark,
                        title: '10 Soru Karma',
                        icon: Icons.shuffle_rounded,
                        color: AppColors.accent,
                        count: 10,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildPracticeButton(
                        context: context,
                        isDark: isDark,
                        title: '25 Soru Karma',
                        icon: Icons.bolt_rounded,
                        color: AppColors.warning,
                        count: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCourseCard({
    required BuildContext context,
    required bool isDark,
    required String title,
    required String subtitle,
    required int questionCount,
    required int testCount,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    final Color cardBg = AppColors.card;
    final Color cardBorder = AppColors.cardBorder;
    final Color textPrimary = AppColors.textPrimary;
    final Color textSecondary = AppColors.textSecondary;
    final Color pillBg = AppColors.surfaceLight;

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : const Color(0xFF64748B).withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: pillBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${QuestionService.formatNumber(questionCount)} Soru • $testCount Test',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: textSecondary,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeButton({
    required BuildContext context,
    required bool isDark,
    required String title,
    required IconData icon,
    required Color color,
    required int count,
  }) {
    final Color btnBg = AppColors.surfaceLight;
    final Color btnBorder = AppColors.cardBorder;
    final Color textPrimary = AppColors.textPrimary;

    return InkWell(
      onTap: () {
        final questions = QuestionService.instance.getRandomPracticeQuestions(count: count);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamScreen(
              title: title,
              questions: questions,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: btnBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: btnBorder),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: const Color(0xFF64748B).withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
