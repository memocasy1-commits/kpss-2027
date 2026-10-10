import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/question_model.dart';
import '../services/ozel_soru_bankasi_service.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';
import 'ozel_chapters_screen.dart';

class OzelSoruBankasiScreen extends StatefulWidget {
  const OzelSoruBankasiScreen({super.key});

  @override
  State<OzelSoruBankasiScreen> createState() => _OzelSoruBankasiScreenState();
}

class _OzelSoruBankasiScreenState extends State<OzelSoruBankasiScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final service = OzelSoruBankasiService.instance;
    if (!service.isLoaded) {
      await service.loadData();
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'public':
        return Icons.public_rounded;
      case 'account_balance':
        return Icons.account_balance_rounded;
      case 'calculate':
        return Icons.calculate_rounded;
      case 'shapes':
        return Icons.category_rounded;
      case 'menu_book':
        return Icons.menu_book_rounded;
      case 'gavel':
        return Icons.gavel_rounded;
      case 'assignment':
        return Icons.assignment_rounded;
      default:
        return Icons.auto_stories_rounded;
    }
  }

  void _startRandomTest() {
    final service = OzelSoruBankasiService.instance;
    final allQuestions = <Question>[];
    for (var cat in service.categories) {
      for (var book in cat.books) {
        allQuestions.addAll(book.questions);
      }
    }

    if (allQuestions.isEmpty) return;

    allQuestions.shuffle(Random());
    final selectedQuestions = allQuestions.take(20).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ExamScreen(
          title: 'Özel Banka - Karışık Hızlı Test (20 Soru)',
          questions: selectedQuestions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final service = OzelSoruBankasiService.instance;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.stars_rounded, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            Text(
              'ÖZEL SORU BANKASI',
              style: GoogleFonts.outfit(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Rastgele Karışık 20 Soru Çöz',
            icon: const Icon(Icons.shuffle_rounded, color: Color(0xFF8B5CF6)),
            onPressed: _startRandomTest,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // VIP Üst Tanıtım Kartı
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4F46E5), Color(0xFF7C3AED), Color(0xFF9333EA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                          blurRadius: 16,
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
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.verified_rounded, color: Colors.amberAccent, size: 14),
                                  const SizedBox(width: 4),
                                  Text(
                                    'VIP ÇÖZÜMLÜ ARŞİV',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '7.199 Soru',
                              style: GoogleFonts.outfit(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'KPSS Özel Çözümlü Soru Havuzu',
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Her sorunun ayrıntılı ve pedagojik çözümüyle KPSS\'ye eksiksiz hazırlanın. 68 konu bölümü ve 7 ders.',
                          style: GoogleFonts.inter(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 13,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Hızlı Test Başlat Butonu
                        InkWell(
                          onTap: _startRandomTest,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.bolt_rounded, color: Color(0xFF6D28D9), size: 18),
                                const SizedBox(width: 6),
                                Text(
                                  'Hızlı Karışık Test Başlat (20 Soru)',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF6D28D9),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Kategori Başlığı
                  Row(
                    children: [
                      Text(
                        'Dersler & Alanlar',
                        style: GoogleFonts.outfit(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${service.categories.length} Kategori • ${service.totalBooks} Bölüm',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Kategori Kartları
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: service.categories.length,
                    itemBuilder: (context, index) {
                      final cat = service.categories[index];
                      return _buildCategoryCard(context, cat);
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, OzelCategory cat) {
    final catColor = Color(cat.color);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: catColor.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OzelChaptersScreen(category: cat),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // İkon Kutusu
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [catColor, catColor.withValues(alpha: 0.75)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: catColor.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      _getIconData(cat.icon),
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Bilgi Alanı
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat.name,
                        style: GoogleFonts.outfit(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '${cat.bookCount} Bölüm',
                            style: GoogleFonts.inter(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' • ',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          Text(
                            '${cat.totalQuestions} Soru',
                            style: GoogleFonts.inter(
                              color: catColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Ok İkonu
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
