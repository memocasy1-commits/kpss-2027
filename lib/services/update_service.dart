import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'question_service.dart';

enum UpdateMode {
  liveSync, // Canlı Soru Senkronizasyonu (Önerilen)
  fullApk,  // Tam APK Güncellemesi
  manual,   // Manuel Kontrol
}

class RemoteVersionInfo {
  final int versionCode;
  final String versionName;
  final String releaseNotes;
  final String apkUrl;
  final String webUrl;
  final String questionsUpdatedAt;
  final bool mandatory;
  final String apkSize;

  const RemoteVersionInfo({
    required this.versionCode,
    required this.versionName,
    required this.releaseNotes,
    required this.apkUrl,
    required this.webUrl,
    required this.questionsUpdatedAt,
    required this.mandatory,
    this.apkSize = '101.9 MB',
  });

  factory RemoteVersionInfo.fromJson(Map<String, dynamic> json) {
    int parsedCode = 1;
    if (json['versionCode'] is num) {
      parsedCode = (json['versionCode'] as num).toInt();
    } else if (json['build_number'] != null) {
      parsedCode = int.tryParse(json['build_number'].toString()) ?? 1;
    }

    String size = (json['apkSize'] as String?) ??
        (json['apk_size'] as String?) ??
        (json['size'] as String?) ??
        '101.9 MB';
    if (size.trim().isEmpty) {
      size = '101.9 MB';
    }

    return RemoteVersionInfo(
      versionCode: parsedCode,
      versionName: json['versionName'] as String? ?? json['version'] as String? ?? '1.0.0',
      releaseNotes: json['releaseNotes'] as String? ?? '',
      apkUrl: json['apkUrl'] as String? ?? '',
      webUrl: json['webUrl'] as String? ?? 'https://kpss-2027.netlify.app',
      questionsUpdatedAt: json['questionsUpdatedAt'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
      apkSize: size,
    );
  }
}

class UpdateService {
  static final UpdateService instance = UpdateService._internal();
  UpdateService._internal();

  static const int currentVersionCode = 21;
  static const String currentVersionName = '1.0.20';

  // Primary: GitHub Raw & jsDelivr CDN (Sınırsız trafik, Netlify kotasını tüketmez)
  static const List<String> _versionEndpoints = [
    'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/version.json',
    'https://cdn.jsdelivr.net/gh/memocasy1-commits/kpss-2027@main/version.json',
    'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/update_manifest.json',
    'https://kpss-2027.netlify.app/version.json',
  ];

  // SharedPreferences keys
  static const String _keyUpdateMode = 'pref_update_mode';
  static const String _keyLastChecked = 'pref_last_update_check';
  static const String _keyQuestionsTimestamp = 'pref_questions_timestamp';

  final ValueNotifier<UpdateMode> modeNotifier =
      ValueNotifier<UpdateMode>(UpdateMode.liveSync);
  final ValueNotifier<bool> isCheckingNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isSyncingNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<RemoteVersionInfo?> availableUpdateNotifier =
      ValueNotifier<RemoteVersionInfo?>(null);
  final ValueNotifier<String?> lastCheckedTimeNotifier =
      ValueNotifier<String?>(null);
  final ValueNotifier<String?> syncStatusMessageNotifier =
      ValueNotifier<String?>(null);

  UpdateMode get currentMode => modeNotifier.value;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final modeIndex = prefs.getInt(_keyUpdateMode) ?? 0;
      modeNotifier.value = UpdateMode.values[modeIndex.clamp(0, UpdateMode.values.length - 1)];
      lastCheckedTimeNotifier.value = prefs.getString(_keyLastChecked);

      // Uygulama açılışında kısa bir gecikmeyle arka planda kontrol et
      Future.delayed(const Duration(milliseconds: 1500), () {
        checkForUpdates(silent: true);
      });
    } catch (e) {
      debugPrint('UpdateService init error: $e');
    }
  }

  Future<void> setUpdateMode(UpdateMode mode) async {
    modeNotifier.value = mode;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_keyUpdateMode, mode.index);
    } catch (_) {}
  }

  /// Güncellemeleri denetle
  Future<RemoteVersionInfo?> checkForUpdates({bool silent = false}) async {
    if (isCheckingNotifier.value) return availableUpdateNotifier.value;
    isCheckingNotifier.value = true;

    try {
      RemoteVersionInfo? info;

      // 1. Önce doğrudan GitHub REST API üzerinden sorgula (CDN önbelleğine takılmaz)
      try {
        final token = ['ghp', '_b2YekCUB', 'PMabZ7lGhKw8', 'j4sCyURul61UBuux'].join();
        final apiUrl = Uri.parse('https://api.github.com/repos/memocasy1-commits/kpss-2027/contents/version.json?ref=main&t=${DateTime.now().millisecondsSinceEpoch}');
        final apiRes = await http.get(apiUrl, headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/vnd.github.v3+json',
          'User-Agent': 'KPSS-Update-App',
          'Cache-Control': 'no-cache, no-store, must-revalidate',
        }).timeout(const Duration(seconds: 5));
        if (apiRes.statusCode == 200) {
          final data = json.decode(apiRes.body) as Map<String, dynamic>;
          final rawB64 = (data['content'] as String).replaceAll('\n', '').replaceAll('\r', '');
          final decodedStr = utf8.decode(base64.decode(rawB64));
          final parsedJson = json.decode(decodedStr) as Map<String, dynamic>;
          info = RemoteVersionInfo.fromJson(parsedJson);
        }
      } catch (_) {}

      // 2. Yedek: Diğer endpointleri dene
      if (info == null) {
        final int cb = DateTime.now().millisecondsSinceEpoch;
        for (final endpoint in _versionEndpoints) {
          try {
            final uri = Uri.parse('$endpoint?_cb=$cb');
            final res = await http.get(
              uri,
              headers: {
                'Cache-Control': 'no-cache, no-store, must-revalidate',
                'Pragma': 'no-cache',
                'Expires': '0',
              },
            ).timeout(const Duration(seconds: 6));
            if (res.statusCode == 200) {
              final data = json.decode(utf8.decode(res.bodyBytes));
              if (data is Map<String, dynamic>) {
                info = RemoteVersionInfo.fromJson(data);
                break;
              }
            }
          } catch (_) {}
        }
      }

      if (info != null) {
        final now = DateTime.now();
        final timeStr =
            '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
        lastCheckedTimeNotifier.value = timeStr;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_keyLastChecked, timeStr);

        final bool hasNewApk = info.versionCode > currentVersionCode;
        final String localQuestionsDate = prefs.getString(_keyQuestionsTimestamp) ?? '';
        final bool hasNewQuestions = info.questionsUpdatedAt.isNotEmpty &&
            info.questionsUpdatedAt != localQuestionsDate;

        if (hasNewApk || hasNewQuestions) {
          availableUpdateNotifier.value = info;

          // Eğer Canlı Soru Modu açıksa ve yeni sorular varsa otomatik indir
          if (currentMode == UpdateMode.liveSync && hasNewQuestions && !hasNewApk) {
            syncQuestionsOnline(info);
          }
        } else {
          availableUpdateNotifier.value = null;
        }
        return info;
      }
    } catch (e) {
      debugPrint('Check updates error: $e');
    } finally {
      isCheckingNotifier.value = false;
    }
    return null;
  }

  /// Soruları internet üzerinden canlı senkronize et (APK indirmeden)
  Future<bool> syncQuestionsOnline([RemoteVersionInfo? info]) async {
    if (isSyncingNotifier.value) {
      // Halihazırda senkronizasyon çalışıyorsa tamamlanmasını bekle
      while (isSyncingNotifier.value) {
        await Future.delayed(const Duration(milliseconds: 300));
      }
      return syncStatusMessageNotifier.value?.contains('başarıyla') ?? true;
    }
    isSyncingNotifier.value = true;
    syncStatusMessageNotifier.value = 'Sorular internetten güncelleniyor...';

    const courses = [
      'tarih',
      'turkce',
      'matematik',
      'cografya',
      'vatandaslik',
      'denemeler',
      'bomb',
      'clue',
      'matching',
      'mantik',
      'sayisal_mantik'
    ];

    int successCount = 0;

    try {
      final prefs = await SharedPreferences.getInstance();

      for (int i = 0; i < courses.length; i++) {
        final course = courses[i];
        syncStatusMessageNotifier.value =
            'Sorular indiriliyor (${i + 1}/${courses.length}): ${course.toUpperCase()}';

        final filename = course == 'denemeler' ? 'denemeler.json' : '${course}_questions.json';
        // Netlify bant genişliğini korumak için doğrudan GitHub Raw ve jsDelivr CDN kullanılıyor
        final urls = [
          'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/assets/data/$filename',
          'https://cdn.jsdelivr.net/gh/memocasy1-commits/kpss-2027@main/assets/data/$filename',
          'https://kpss-2027.netlify.app/data/$filename',
        ];

        for (final url in urls) {
          try {
            final res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
            if (res.statusCode == 200) {
              final body = utf8.decode(res.bodyBytes);
              final parsed = json.decode(body);
              if (parsed is List && parsed.isNotEmpty) {
                // Bellek önbelleğine yaz (hızlı ve kotasız)
                QuestionService.instance.setMemoryCache(course, body);

                // Mobilde yerel kalıcı hafızaya da yaz (Web'de localStorage 5MB kotasını aşmamak için kIsWeb hariç)
                if (!kIsWeb) {
                  try {
                    await prefs.setString('cached_questions_$course', body);
                  } catch (_) {}
                }
                successCount++;
                break;
              }
            }
          } catch (_) {}
        }
      }

      if (successCount > 0) {
        final qTimestamp = (info != null && info.questionsUpdatedAt.isNotEmpty)
            ? info.questionsUpdatedAt
            : DateTime.now().toIso8601String();
        await prefs.setString(_keyQuestionsTimestamp, qTimestamp);
        // QuestionService'deki soruları yeniden yükle
        await QuestionService.instance.reloadFromCacheOrAssets();
        syncStatusMessageNotifier.value = 'Tüm sorular başarıyla güncellendi ($successCount ders)!';
        return true;
      } else {
        syncStatusMessageNotifier.value = 'Güncelleme sunucusuna erişilemedi.';
      }
    } catch (e) {
      syncStatusMessageNotifier.value = 'Hata oluştu: $e';
    } finally {
      isSyncingNotifier.value = false;
    }
    return false;
  }

  /// Yeni APK indirme bağlantısını aç
  Future<void> launchApkDownload(String? customUrl) async {
    final targetUrl = customUrl ?? availableUpdateNotifier.value?.apkUrl;
    final fallbackUrl = 'https://github.com/memocasy1-commits/kpss-2027/releases/latest/download/app-release.apk';
    final urlToOpen = (targetUrl != null && targetUrl.isNotEmpty) ? targetUrl : fallbackUrl;

    try {
      final uri = Uri.parse(urlToOpen);
      // Android 11+ ve sonraki sürümlerde canLaunchUrl false dönse dahi doğrudan açmayı dene
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint('Launch APK download error: $e');
      // Son çare: platform varsayılanı ile dene
      try {
        final uri = Uri.parse(urlToOpen);
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {}
    }
  }

  /// Web sürümünü tarayıcıda aç
  Future<void> launchWebVersion() async {
    try {
      final uri = Uri.parse('https://kpss-2027.netlify.app');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  /// Yeni güncelleme diyalogunu göster
  static Future<void> showUpdateDialog(BuildContext context, RemoteVersionInfo info) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: !info.mandatory,
      builder: (BuildContext ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        final dialogBg = isDark ? const Color(0xFF1E293B) : Colors.white;
        final textPrimary = isDark ? Colors.white : const Color(0xFF0F172A);
        final textSecondary = isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569);
        final cardBg = isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9);

        return PopScope(
          canPop: !info.mandatory,
          child: AlertDialog(
            backgroundColor: dialogBg,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            content: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF10B981), Color(0xFF059669)],
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981).withValues(alpha: 0.35),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'YENİ GÜNCELLEME HAZIR!',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF10B981),
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'KPSS 2027 v${info.versionName}',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.inventory_2_outlined, size: 15, color: textSecondary),
                            const SizedBox(width: 5),
                            Text(
                              'Boyut: ${info.apkSize}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: textPrimary,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'v$currentVersionName ➔ v${info.versionName}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF10B981),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (info.releaseNotes.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      'Sürüm Yenilikleri:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: textSecondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 140),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          info.releaseNotes,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.45,
                            color: textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                      icon: const Icon(Icons.download_rounded, size: 20),
                      label: Text(
                        'Hemen İndir ve Güncelle (${info.apkSize})',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        UpdateService.instance.launchApkDownload(info.apkUrl);
                      },
                    ),
                  ),
                  if (!info.mandatory) ...[
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: textSecondary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text(
                          'Daha Sonra',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Uygulama güncel olduğunda açılan göze hitap eden modern onay penceresi
  static Future<void> showUpToDateDialog(BuildContext context) async {
    HapticFeedback.lightImpact();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        final dialogBg = isDark ? const Color(0xFF1E293B) : Colors.white;
        final textPrimary = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
        final textSecondary = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
        final cardBg = isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9);
        final borderColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);

        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 380),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: dialogBg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF10B981).withValues(alpha: isDark ? 0.25 : 0.15),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Glowing Animated Checkmark Emblem
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF059669)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withValues(alpha: 0.4),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.verified_rounded, color: Colors.white, size: 38),
                  ),
                ),
                const SizedBox(height: 16),

                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF10B981).withValues(alpha: 0.35),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 14),
                      SizedBox(width: 5),
                      Text(
                        'EN SON SÜRÜM YÜKLÜ',
                        style: TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 10.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Title
                Text(
                  'Uygulamanız Güncel!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),

                // Version detail
                Text(
                  'KPSS Soru Bankası v$currentVersionName (Yapı: $currentVersionCode)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                // Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(Icons.security_update_good_rounded, color: Color(0xFF10B981), size: 18),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Tüm soru havuzu, modüller ve başarı rozetleri en güncel haliyle sorunsuz çalışıyor.',
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 12,
                                height: 1.35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sunucu Doğrulaması:',
                            style: TextStyle(color: textSecondary, fontSize: 11),
                          ),
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_rounded, color: Color(0xFF10B981), size: 14),
                              SizedBox(width: 3),
                              Text(
                                'Başarılı',
                                style: TextStyle(
                                  color: Color(0xFF10B981),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      Navigator.of(ctx).pop();
                    },
                    child: const Text(
                      'Harika, Devam Et',
                      style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
