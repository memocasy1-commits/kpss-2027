import 'package:flutter/material.dart';
import '../models/deneme_model.dart';
import '../models/question_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'mock_exam_review_screen.dart';

class MockExamResultScreen extends StatelessWidget {
  final DenemeResult result;
  final List<Question> questions;

  const MockExamResultScreen({
    super.key,
    required this.result,
    required this.questions,
  });

  String _formatTimer(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;
    if (hours > 0) {
      return '${hours}sa ${minutes}dk ${seconds}sn';
    }
    return '${minutes}dk ${seconds}sn';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Sınav Sonuç Raporu'),
            automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () {
              Navigator.pop(context); // Close result screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Congratulations / Summary Card
            _buildOverallScoreCard(context),
            const SizedBox(height: 20),

            // Olası KPSS Puanları Bölümü (KPSS P3, P93, P94)
            _buildPredictedScoresCard(),
            const SizedBox(height: 20),

            // Ders Bazlı Detaylı Net Dağılımı Tablosu
            _buildCourseResultsCard(),
            const SizedBox(height: 24),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MockExamReviewScreen(
                        result: result,
                        questions: questions,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 22),
                label: const Text(
                  'Çözümleri Göster (120 Soru)',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 4,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.home_rounded, color: AppColors.textPrimary),
                label: Text(
                  'Ana Sayfaya Dön',
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.cardBorder),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
      },
    );
  }

  Widget _buildOverallScoreCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.surface,
            AppColors.surfaceLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.emoji_events_rounded, color: AppColors.warning, size: 32),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.denemeTitle,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Süre: ${_formatTimer(result.elapsedSeconds)}',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppColors.cardBorder, height: 28),
          // Total Net Large Display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBigStat('TOPLAM NET', '${result.totalNet}', AppColors.primaryLight),
              Container(height: 40, width: 1, color: AppColors.cardBorder),
              _buildBigStat('DOĞRU', '${result.totalCorrect}', AppColors.success),
              Container(height: 40, width: 1, color: AppColors.cardBorder),
              _buildBigStat('YANLIŞ', '${result.totalWrong}', AppColors.error),
              Container(height: 40, width: 1, color: AppColors.cardBorder),
              _buildBigStat('BOŞ', '${result.totalEmpty}', AppColors.textMuted),
            ],
          ),
          const SizedBox(height: 16),
          // GY vs GK split row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.background.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Genel Yetenek (60 Soru): ${result.gyNet} Net',
                  style: const TextStyle(color: AppColors.accent, fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Genel Kültür (60 Soru): ${result.gkNet} Net',
                  style: const TextStyle(color: AppColors.warning, fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBigStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildPredictedScoresCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics_rounded, color: AppColors.primaryLight, size: 22),
              const SizedBox(width: 8),
              Text(
                'Olası KPSS Puanları (Simülasyon)',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'ÖSYM standart sapma ve ağırlık katsayıları baz alınarak hesaplanmıştır:',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
          const SizedBox(height: 16),
          // Score Cards
          Row(
            children: [
              Expanded(
                child: _buildScoreBox(
                  title: 'KPSS P3',
                  subtitle: 'Lisans Puanı',
                  score: result.p3Score,
                  color: const Color(0xFF6366F1),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildScoreBox(
                  title: 'KPSS P93',
                  subtitle: 'Önlisans Puanı',
                  score: result.p93Score,
                  color: const Color(0xFF0D9488),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildScoreBox(
                  title: 'KPSS P94',
                  subtitle: 'Ortaöğretim',
                  score: result.p94Score,
                  color: const Color(0xFFD97706),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBox({
    required String title,
    required String subtitle,
    required double score,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.35), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(color: AppColors.textMuted, fontSize: 11),
          ),
          const SizedBox(height: 6),
          Text(
            score.toStringAsFixed(2),
            style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 2),
          Text(
            'Puan',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseResultsCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ders Bazlı Net Analizi',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          // Table header
          Row(
            children: [
              Expanded(flex: 3, child: Text('Ders', style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.bold))),
              Expanded(flex: 1, child: Text('D', textAlign: TextAlign.center, style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold))),
              Expanded(flex: 1, child: Text('Y', textAlign: TextAlign.center, style: TextStyle(color: AppColors.error, fontSize: 12, fontWeight: FontWeight.bold))),
              Expanded(flex: 1, child: Text('B', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.bold))),
              Expanded(flex: 2, child: Text('Net', textAlign: TextAlign.end, style: TextStyle(color: AppColors.primaryLight, fontSize: 12, fontWeight: FontWeight.bold))),
            ],
          ),
          Divider(color: AppColors.cardBorder, height: 16),
          ...result.courseResults.map((c) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      c.courseName,
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('${c.correct}', textAlign: TextAlign.center, style: const TextStyle(color: AppColors.success, fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('${c.wrong}', textAlign: TextAlign.center, style: const TextStyle(color: AppColors.error, fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('${c.empty}', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      c.net.toStringAsFixed(2),
                      textAlign: TextAlign.end,
                      style: TextStyle(color: AppColors.primaryLight, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
