import 'dart:convert';
import 'package:flutter/foundation.dart';
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

  const RemoteVersionInfo({
    required this.versionCode,
    required this.versionName,
    required this.releaseNotes,
    required this.apkUrl,
    required this.webUrl,
    required this.questionsUpdatedAt,
    required this.mandatory,
  });

  factory RemoteVersionInfo.fromJson(Map<String, dynamic> json) {
    int parsedCode = 1;
    if (json['versionCode'] is num) {
      parsedCode = (json['versionCode'] as num).toInt();
    } else if (json['build_number'] != null) {
      parsedCode = int.tryParse(json['build_number'].toString()) ?? 1;
    }

    return RemoteVersionInfo(
      versionCode: parsedCode,
      versionName: json['versionName'] as String? ?? json['version'] as String? ?? '1.0.0',
      releaseNotes: json['releaseNotes'] as String? ?? '',
      apkUrl: json['apkUrl'] as String? ?? '',
      webUrl: json['webUrl'] as String? ?? 'https://kpss-2027.netlify.app',
      questionsUpdatedAt: json['questionsUpdatedAt'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
    );
  }
}

class UpdateService {
  static final UpdateService instance = UpdateService._internal();
  UpdateService._internal();

  static const int currentVersionCode = 5;
  static const String currentVersionName = '1.0.4';

  // Primary: Netlify public CDN and GitHub raw
  static const List<String> _versionEndpoints = [
    'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/version.json',
    'https://kpss-2027.netlify.app/version.json',
    'https://kpss-2027.netlify.app/update_manifest.json',
    'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/update_manifest.json',
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

      // Otomatik moddaysa arka planda sessizce kontrol et
      if (currentMode != UpdateMode.manual) {
        // Uygulama açılışında kısa bir gecikmeyle arka planda kontrol
        Future.delayed(const Duration(seconds: 4), () {
          checkForUpdates(silent: true);
        });
      }
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

      // Endpointleri sırayla dene (Netlify CDN -> Fallbacks)
      for (final endpoint in _versionEndpoints) {
        try {
          final res = await http.get(Uri.parse(endpoint)).timeout(
                const Duration(seconds: 5),
              );
          if (res.statusCode == 200) {
            final data = json.decode(utf8.decode(res.bodyBytes));
            if (data is Map<String, dynamic>) {
              info = RemoteVersionInfo.fromJson(data);
              break;
            }
          }
        } catch (_) {}
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
        final urls = [
          'https://kpss-2027.netlify.app/data/$filename',
          'https://kpss-2027.netlify.app/assets/assets/data/$filename',
          'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/assets/data/$filename',
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
    final fallbackUrl = 'https://github.com/memocasy1-commits/kpss-2027/releases/download/v1.0.0/app-release.apk';
    final urlToOpen = (targetUrl != null && targetUrl.isNotEmpty) ? targetUrl : fallbackUrl;

    try {
      final uri = Uri.parse(urlToOpen);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Launch APK download error: $e');
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
}
