import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/leitner_service.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';

class SpacedRepetitionScreen extends StatefulWidget {
  const SpacedRepetitionScreen({super.key});

  @override
  State<SpacedRepetitionScreen> createState() => _SpacedRepetitionScreenState();
}

class _SpacedRepetitionScreenState extends State<SpacedRepetitionScreen> {
  Map<String, int> _stats = {'box1': 0, 'box2': 0, 'box3': 0, 'box4': 0, 'total': 0, 'due': 0};
  List<Question> _dueQuestions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final s = await LeitnerService.instance.getStats();
    final due = await LeitnerService.instance.getDueQuestions();
    if (mounted) {
      setState(() {
        _stats = s;
        _dueQuestions = due;
        _isLoading = false;
      });
    }
  }

  void _startReviewSession() {
    if (_dueQuestions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bugün için vadesi gelen tekrar sorusu bulunmuyor. Harika gidiyorsunuz!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ExamScreen(
          title: 'Aralıklı Hafıza Tekrarı (${_dueQuestions.length} Soru)',
          questions: _dueQuestions,
        ),
      ),
    ).then((_) => _loadData());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final Color bgColor = AppColors.background;
        final Color surfaceBg = AppColors.surface;
        final Color borderColor = AppColors.cardBorder;
        final Color textPrimary = AppColors.textPrimary;
        final Color textSecondary = AppColors.textSecondary;

        final int dueCount = _dueQuestions.length;
        final int totalTracked = _stats['total'] ?? 0;

        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: surfaceBg,
            elevation: 0,
            title: Text(
              'Aralıklı Tekrar & Hafıza Sistemi',
              style: TextStyle(
                color: textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 14),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D9488).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$totalTracked Soru Takipte',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D9488),
                    ),
                  ),
                ),
              ),
            ],
            shape: Border(bottom: BorderSide(color: borderColor, width: 1)),
          ),
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: _loadData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. BÜYÜK EYLEM KARTI: BUGÜNKÜ TEKRAR HAVUZU
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1E3A8A).withValues(alpha: 0.3),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'BİLİMSEL LEITNER MODELİ',
                                      style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                  const Icon(Icons.psychology_rounded, color: Colors.white, size: 28),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                dueCount > 0
                                    ? '$dueCount Soru Tekrar Bekliyor'
                                    : 'Bugünkü Tekrarlar Tamamlandı! 🎉',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                dueCount > 0
                                    ? 'Unutma eğrisini kırmak için vadesi gelen soruları çözerek kalıcı hafızaya taşıyın.'
                                    : 'Şu an bekleyen soru yok. Yanlış çözdüğünüz veya zorlandığınız sorular otomatik olarak buraya eklenir.',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (dueCount > 0)
                                SizedBox(
                                  width: double.infinity,
                                  height: 46,
                                  child: ElevatedButton(
                                    onPressed: _startReviewSession,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFF1E3A8A),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.play_arrow_rounded, size: 22),
                                        SizedBox(width: 8),
                                        Text(
                                          'Hafıza Tekrarını Başlat',
                                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // 2. 4 KADEMELİ HAFIZA KUTULARI (LEITNER BOXES)
                        Text(
                          'HAFIZA KUTULARI DURUMU',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildBoxCard(
                                title: '1. Kutu (1 Gün)',
                                count: _stats['box1'] ?? 0,
                                subtitle: 'Yeni / Zor',
                                color: const Color(0xFFEF4444),
                                icon: Icons.inbox_rounded,
                                surfaceBg: surfaceBg,
                                borderColor: borderColor,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildBoxCard(
                                title: '2. Kutu (3 Gün)',
                                count: _stats['box2'] ?? 0,
                                subtitle: 'Gelişmekte',
                                color: const Color(0xFFF59E0B),
                                icon: Icons.repeat_rounded,
                                surfaceBg: surfaceBg,
                                borderColor: borderColor,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _buildBoxCard(
                                title: '3. Kutu (7 Gün)',
                                count: _stats['box3'] ?? 0,
                                subtitle: 'Pekiştirilen',
                                color: const Color(0xFF10B981),
                                icon: Icons.offline_bolt_rounded,
                                surfaceBg: surfaceBg,
                                borderColor: borderColor,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildBoxCard(
                                title: '4. Kutu (15 Gün)',
                                count: _stats['box4'] ?? 0,
                                subtitle: 'Kalıcı Hafıza',
                                color: const Color(0xFF8B5CF6),
                                icon: Icons.military_tech_rounded,
                                surfaceBg: surfaceBg,
                                borderColor: borderColor,
                                textPrimary: textPrimary,
                                textSecondary: textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // 3. NASIL ÇALIŞIR? BİLGİLENDİRME KARTI
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: surfaceBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: borderColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.lightbulb_outline_rounded, color: const Color(0xFFF59E0B), size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Aralıklı Tekrar Metodu Nasıl Çalışır?',
                                    style: TextStyle(
                                      color: textPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '• Yanlış çözdüğünüz bir soru otomatik olarak 1. Kutuya (1 Günlük tekrar) düşer.\n'
                                '• Tekrar oturumunda doğru bildiğinizde bir üst kutuya (3 Gün, 7 Gün, 15 Gün) terfi eder.\n'
                                '• Tekrar sırasında yanlış yaparsanız soru doğrudan 1. Kutuya sıfırlanır.\n'
                                '• Böylece sınav gününe kadar hiçbir bilgi unutulmaz ve kalıcı belleğe kazınır.',
                                style: TextStyle(
                                  color: textSecondary,
                                  fontSize: 12.5,
                                  height: 1.55,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildBoxCard({
    required String title,
    required int count,
    required String subtitle,
    required Color color,
    required IconData icon,
    required Color surfaceBg,
    required Color borderColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: textPrimary),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: textSecondary),
          ),
        ],
      ),
    );
  }
}
