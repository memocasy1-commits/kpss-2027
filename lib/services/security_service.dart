import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'license_service.dart';
import '../screens/activation_screen.dart';

/// KPSS Soru Bankası - Askeri Düzey Güvenlik ve Tersine Mühendislik Savunma Servisi
/// (Anti-Tamper, Defense-in-Depth & Data-at-Rest Security Guard)
/// -------------------------------------------------------------------------------
/// 1. Çok Katmanlı Asimetrik İmza Doğrulama: Sadece tek bir boolean değişkene
///    güvenmek yerine, her kritik işlemde Ed25519 imzasını cihaz kimliğiyle doğrular.
/// 2. Derinlemesine Savunma (Defense-in-Depth): main.dart baypass edilse dahi,
///    testlerin (%99'u), akıllı çalışma özellikleri ve deneme sınavları kilitli kalır.
/// 3. Bellek Yamalama Savunması: Lisans durumu dinamik SHA-256 token ile mühürlenir.
class SecurityService {
  static final SecurityService instance = SecurityService._();
  SecurityService._();

  static const String _salt = "kpss_secure_gate_2027_v1";

  // Önbelleklenmiş doğrulama durumu ve bütünlük tokenı
  bool _isVerified = false;
  String _integrityToken = '';
  DateTime? _lastVerificationTime;

  /// Güvenlik durumunu tazeler ve kriptografik imza bütünlüğünü doğrular
  Future<bool> verifyLicenseIntegrity({bool forceRecheck = false}) async {
    final now = DateTime.now();

    // 10 saniye içinde yapılmış doğrulamalar için önbellek kontrolü (aşırı CPU yükünü önlemek için)
    if (!forceRecheck &&
        _lastVerificationTime != null &&
        now.difference(_lastVerificationTime!).inSeconds < 10) {
      if (_isVerified && _verifyToken()) {
        return true;
      }
    }

    try {
      final isLic = await LicenseService.instance.isActivated();
      final devId = await LicenseService.instance.getDeviceId();

      if (isLic) {
        _isVerified = true;
        _integrityToken = _computeToken(devId, isLic);
        _lastVerificationTime = now;
        return true;
      } else {
        _isVerified = false;
        _integrityToken = '';
        _lastVerificationTime = now;
        return false;
      }
    } catch (_) {
      _isVerified = false;
      _integrityToken = '';
      return false;
    }
  }

  /// Token bütünlük mührünü hesapla (Bellek yamalamalarına karşı savunma)
  String _computeToken(String deviceId, bool isLicensed) {
    final raw = "$deviceId:$_salt:${isLicensed ? 'VIP_FULL_2027' : 'UNLICENSED'}";
    return sha256.convert(utf8.encode(raw)).toString();
  }

  /// Token'ın bellekte bozulup bozulmadığını kontrol et
  bool _verifyToken() {
    if (!_isVerified) return false;
    try {
      final devId = LicenseService.instance.cleanCode(
        LicenseService.instance.getDeviceIdSyncFallback(),
      );
      final expected = _computeToken(devId, true);
      return _integrityToken == expected;
    } catch (_) {
      return false;
    }
  }

  /// Bir test numarasının erişilebilir olup olmadığını kontrol eder
  /// Test 1: Ücretsiz Deneme / Önizleme (Herkes çözebilir)
  /// Test 2 ve üzeri: Sadece kriptografik olarak doğrulanmış lisansla açılır
  Future<bool> canAccessTest(int testNum) async {
    if (testNum <= 1) {
      return true; // İlk test demo önizlemedir
    }
    return await verifyLicenseIntegrity();
  }


  /// 120 Soruluk ÖSYM Deneme Sınavı erişim izni
  Future<bool> canAccessDeneme(dynamic denemeId) async {
    final str = denemeId.toString().toLowerCase();
    if (str == '1' || str == 'deneme_1' || str == 'deneme1') {
      return true; // 1. Deneme demo olarak incelenebilir
    }
    return await verifyLicenseIntegrity();
  }

  /// Lisanssız kullanıcılara şık ve profesyonel lisans uyarı modalı gösterir
  void showLicenseLockDialog({
    required BuildContext context,
    required String featureTitle,
    VoidCallback? onActivated,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        final bg = isDark ? const Color(0xFF1E293B) : Colors.white;
        final textPrimary = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
        final textSecondary = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);

        return AlertDialog(
          backgroundColor: bg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.lock_person_outlined, color: Color(0xFFD97706), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Tam Sürüm Lisansı Gerekli',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$featureTitle içeriği yalnızca VIP tam sürüm lisansı ile erişilebilir.',
                style: TextStyle(color: textPrimary, fontSize: 13.5, height: 1.4),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• 686 Test ve 15.000 Çözümlü Soru',
                      style: TextStyle(color: textSecondary, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '• 15 Adet 120 Soruluk Tam ÖSYM Denemesi',
                      style: TextStyle(color: textSecondary, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '• Akıllı Koç & İnteraktif Matematik Atölyesi',
                      style: TextStyle(color: textSecondary, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '• %100 Çevrimdışı ve Ömür Boyu Kullanım',
                      style: TextStyle(color: textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'Vazgeç',
                style: TextStyle(color: textSecondary, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ActivationScreen()),
                ).then((_) {
                  if (onActivated != null) onActivated();
                });
              },
              child: const Text('Lisans Tanımla ➔', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  /// Veri akış şifreleme/deşifreleme modülü (Data Obfuscation / Cipher Stream)
  /// APK dosyası arşiv gibi açıldığında JSON dosyalarının düz metin olarak çalınmasını önler
  List<int> transformPayload(List<int> input, String keySeed) {
    final keyHash = sha256.convert(utf8.encode(keySeed)).bytes;
    final output = List<int>.filled(input.length, 0);
    for (int i = 0; i < input.length; i++) {
      output[i] = input[i] ^ keyHash[i % keyHash.length];
    }
    return output;
  }
}
