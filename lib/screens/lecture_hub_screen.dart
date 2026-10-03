import 'package:flutter/material.dart';
import '../data/cografya_lecture_data.dart';
import '../data/matematik_lecture_data.dart';
import '../data/tarih_lecture_data.dart';
import '../data/turkce_lecture_data.dart';
import '../data/vatandaslik_lecture_data.dart';
import '../models/lecture_model.dart';
import '../services/theme_service.dart';
import '../theme/app_theme.dart';
import 'lecture_topics_screen.dart';

class LectureHubScreen extends StatelessWidget {
  const LectureHubScreen({super.key});

  static const List<LectureCourse> _courses = [
    TurkceLectureData.courseInfo,
    MatematikLectureData.courseInfo,
    TarihLectureData.courseInfo,
    VatandaslikLectureData.courseInfo,
    CografyaLectureData.courseInfo,
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
        final Color brandBlue = const Color(0xFF0284C7);

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
                    color: brandBlue.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: brandBlue.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.import_contacts_rounded, color: brandBlue, size: 20),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KONU ANLATIMI & KÜTÜPHANE',
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      'ÖSYM Odaklı Mikro Konu Notları',
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
                // 1. HERO VİTRİN KARTI
                Container(
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
                              color: brandBlue.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: brandBlue.withValues(alpha: 0.25)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.school_rounded, color: brandBlue, size: 13),
                                const SizedBox(width: 5),
                                Text(
                                  'MİKRO ÖĞRENME MODELİ',
                                  style: TextStyle(
                                    color: brandBlue,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Soru Odaklı Notlar',
                            style: TextStyle(color: textSecondary, fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Ezberleme, Mantığını Kavra!',
                        style: TextStyle(
                          color: textPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Soru bankasındaki 15.000 sorunun çözüm mantığı, ÖSYM tuzakları ve altın kuralları tek bir yerde. Türkçe dersinden başlayarak adım adım ekleniyor.',
                        style: TextStyle(color: textSecondary, fontSize: 12.5, height: 1.45),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  'DERS KONU ANLATIMLARI',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),

                // 2. DERS KARTLARI
                ..._courses.map((course) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: course.isAvailable
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LectureTopicsScreen(course: course),
                                ),
                              );
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${course.title} konu anlatımı müfredatı hazırlanıyor. Türkçe ve Tarih dersleri aktif olarak kullanılabilir.'),
                                  backgroundColor: AppColors.primary,
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: course.isAvailable ? course.color.withValues(alpha: 0.45) : borderColor,
                            width: course.isAvailable ? 1.5 : 1.2,
                          ),
                          boxShadow: course.isAvailable
                              ? [
                                  BoxShadow(
                                    color: course.color.withValues(alpha: 0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: course.color.withValues(alpha: course.isAvailable ? 0.15 : 0.08),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: course.color.withValues(alpha: course.isAvailable ? 0.35 : 0.15),
                                ),
                              ),
                              child: Icon(
                                course.icon,
                                color: course.isAvailable ? course.color : textSecondary,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        course.title,
                                        style: TextStyle(
                                          color: textPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                                        decoration: BoxDecoration(
                                          color: course.isAvailable
                                              ? const Color(0xFF10B981).withValues(alpha: 0.15)
                                              : AppColors.background,
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(
                                            color: course.isAvailable
                                                ? const Color(0xFF10B981).withValues(alpha: 0.3)
                                                : borderColor,
                                          ),
                                        ),
                                        child: Text(
                                          course.isAvailable ? 'AKTİF' : 'YAKINDA',
                                          style: TextStyle(
                                            color: course.isAvailable ? const Color(0xFF10B981) : textSecondary,
                                            fontSize: 9.5,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    course.subtitle,
                                    style: TextStyle(
                                      color: textSecondary,
                                      fontSize: 12,
                                      height: 1.35,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    course.badgeText,
                                    style: TextStyle(
                                      color: course.isAvailable ? course.color : textSecondary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: course.isAvailable ? course.color : textSecondary.withValues(alpha: 0.5),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
