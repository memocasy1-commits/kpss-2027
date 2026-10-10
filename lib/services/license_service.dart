import 'dart:convert';
import 'dart:math';
import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Lisans Durumu ve Süre Bilgisi Modeli
class LicenseInfo {
  final bool isValid;
  final bool isTrial;
  final String type; // '1D', '3D', '7D', 'INF', 'NONE'
  final DateTime? activatedAt;
  final DateTime? expiresAt;
  final Duration? remainingTime;

  LicenseInfo({
    required this.isValid,
    required this.isTrial,
    required this.type,
    this.activatedAt,
    this.expiresAt,
    this.remainingTime,
  });

  String get remainingFormatted {
    if (!isValid) return 'Süresi Doldu / Geçersiz';
    if (!isTrial || remainingTime == null) return 'Sınırsız / Ömür Boyu';
    final rem = remainingTime!;
    final days = rem.inDays;
    final hours = rem.inHours % 24;
    final minutes = rem.inMinutes % 60;
    if (days > 0) {
      return '$days gün $hours saat kaldı';
    } else if (hours > 0) {
      return '$hours saat $minutes dk kaldı';
    } else {
      return '${minutes.clamp(1, 60)} dakika kaldı';
    }
  }

  String get typeLabel {
    switch (type) {
      case '1D':
        return '1 Günlük Deneme Sürümü';
      case '3D':
        return '3 Günlük Deneme Sürümü';
      case '7D':
        return '7 Günlük Deneme Sürümü';
      case 'INF':
        return 'VIP Tam Sürüm (Sınırsız)';
      default:
        return 'Lisanssız Sürüm';
    }
  }

  String get badgeText {
    if (!isValid) return 'Lisans Bekleniyor';
    if (!isTrial) return 'VIP Tam Sürüm (Sınırsız)';
    return 'Deneme Sürümü ($remainingFormatted)';
  }
}

class _ParsedKeyInfo {
  final List<int> signatureBytes;
  final String type;
  _ParsedKeyInfo({required this.signatureBytes, required this.type});
}

/// KPSS Soru Bankası - Asimetrik Kriptografik Lisanslama Servisi (Ed25519)
/// ---------------------------------------------------------------------
/// Geliştirici bilgisayarında ÖZEL ANAHTAR (Private Key) ile imzalanan
/// 1-3-7 günlük ve sınırsız lisans şifrelerini AÇIK ANAHTAR (Public Key) ile doğrular.
/// Deneme sürümleri için süre dolumunu ve ekran görüntüsü (SS) güvenliğini denetler.
class LicenseService {
  static final LicenseService instance = LicenseService._();
  LicenseService._();

  // Ed25519 Açık Anahtarı (Public Key - 32 byte / 64 hex)
  static const String _publicKeyHex =
      "6f5e5796ae523b0cc2a4e212255c9aa29c604f29ce148e4b739a01ac3fcf5ca6";

  static const String _keyDeviceId = "kpss_unique_device_id";
  static const String _keyActivationSignature = "kpss_activation_signature";
  static const String _keyLicenseType = "kpss_license_type";
  static const String _keyActivatedAt = "kpss_activated_at";
  static const String _keyExpiresAt = "kpss_expires_at";
  static const String _keyLastVerifiedAt = "kpss_last_verified_at";

  static const MethodChannel _platformChannel =
      MethodChannel('com.kpss.kpss_soru_bankasi/notifications');

  String? _cachedDeviceId;
  SimplePublicKey? _cachedPublicKey;
  final Ed25519 _ed25519 = Ed25519();

  /// Açık anahtar nesnesini hazırla
  SimplePublicKey _getPublicKey() {
    if (_cachedPublicKey != null) return _cachedPublicKey!;
    final bytes = _hexToBytes(_publicKeyHex);
    _cachedPublicKey = SimplePublicKey(bytes, type: KeyPairType.ed25519);
    return _cachedPublicKey!;
  }

  /// Testler için önbelleği sıfırlar
  void resetForTesting() {
    _cachedDeviceId = null;
  }

  /// Cihaz için kalıcı ve tekil bir Cihaz Kodu döner (Örn: KPSS-8X42-9B1K-77M9)
  Future<String> getDeviceId() async {
    if (_cachedDeviceId != null) return _cachedDeviceId!;

    final prefs = await SharedPreferences.getInstance();
    var deviceId = prefs.getString(_keyDeviceId);

    if (deviceId == null || deviceId.trim().isEmpty) {
      deviceId = await _generateNewDeviceId();
      await prefs.setString(_keyDeviceId, deviceId);
    }

    _cachedDeviceId = deviceId;
    return deviceId;
  }

  String getDeviceIdSyncFallback() => _cachedDeviceId ?? '';

  static const String _base32Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
  static const int _xorMask = 0x5B;

  /// Cihaz modelini gizli ve şifreli şekilde içeren seri kod üretir
  /// Öğrencinin ekranında marka/model düz metin olarak GÖRÜNMEZ.
  /// Örn: KPSS-BA5D-MKBO-GU6C-OCAW-OYEG-E2TK-DETW-GA3P
  Future<String> _generateNewDeviceId() async {
    String brand = 'Android';
    String model = 'Device';
    try {
      final res = await _platformChannel.invokeMethod<Map>('getDeviceInfo');
      if (res != null) {
        final mfg = (res['manufacturer'] ?? '').toString().trim();
        final mdl = (res['model'] ?? '').toString().trim();
        if (mfg.isNotEmpty) brand = mfg;
        if (mdl.isNotEmpty) model = mdl;
      }
    } catch (_) {}

    // 4 karakterlik rastgele güvenlik tuzu
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rand = Random.secure();
    final salt = List.generate(4, (_) => chars[rand.nextInt(chars.length)]).join();

    final raw = utf8.encode('$brand|$model|$salt');
    final masked = raw.map((b) => b ^ _xorMask).toList();

    var bitBuffer = 0;
    var bitCount = 0;
    final result = StringBuffer();

    for (final b in masked) {
      bitBuffer = (bitBuffer << 8) | b;
      bitCount += 8;
      while (bitCount >= 5) {
        bitCount -= 5;
        final index = (bitBuffer >> bitCount) & 0x1F;
        result.write(_base32Alphabet[index]);
      }
    }

    if (bitCount > 0) {
      final index = (bitBuffer << (5 - bitCount)) & 0x1F;
      result.write(_base32Alphabet[index]);
    }

    final enc = result.toString();
    final chunks = <String>[];
    for (var i = 0; i < enc.length; i += 4) {
      final end = (i + 4 < enc.length) ? i + 4 : enc.length;
      chunks.add(enc.substring(i, end));
    }
    return 'KPSS-${chunks.join("-")}';
  }

  /// Kodları normalize eder (Tire, boşluk temizler, büyük harfe çevirir)
  String cleanCode(String code) {
    return code.trim().toUpperCase().replaceAll('-', '').replaceAll(' ', '');
  }

  /// Deneme sürümü aktifken ekran görüntüsü ve ekran kaydını kapat (Android FLAG_SECURE)
  Future<void> applyScreenSecurity() async {
    try {
      final info = await getLicenseInfo();
      // Deneme sürümü aktifse veya lisanssız deneme modunda ise SS alımını kapat
      final bool shouldSecure = (info.isTrial && info.isValid) || !info.isValid;
      await _platformChannel.invokeMethod('setSecureScreen', {
        'enabled': shouldSecure,
      });
    } catch (_) {}
  }

  /// Detaylı lisans durumu ve kalan süre bilgisini getirir
  Future<LicenseInfo> getLicenseInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final storedSig = prefs.getString(_keyActivationSignature);
    if (storedSig == null || storedSig.isEmpty) {
      return LicenseInfo(
        isValid: false,
        isTrial: false,
        type: 'NONE',
      );
    }

    final type = prefs.getString(_keyLicenseType) ?? 'INF';
    final isTrial = type == '1D' || type == '3D' || type == '7D';

    DateTime? activatedAt;
    final actStr = prefs.getString(_keyActivatedAt);
    if (actStr != null) {
      activatedAt = DateTime.tryParse(actStr);
    }

    DateTime? expiresAt;
    final expStr = prefs.getString(_keyExpiresAt);
    if (expStr != null) {
      expiresAt = DateTime.tryParse(expStr);
    }

    final now = DateTime.now();

    // Süre kontrolü
    if (isTrial && expiresAt != null) {
      // Saat geri alma kontrolü
      final lastVerifiedStr = prefs.getString(_keyLastVerifiedAt);
      if (lastVerifiedStr != null) {
        final lastVerified = DateTime.tryParse(lastVerifiedStr);
        if (lastVerified != null &&
            now.isBefore(lastVerified.subtract(const Duration(hours: 1)))) {
          // Saat 1 saatten fazla geriye alınmış -> hileli geri alma engellendi
          return LicenseInfo(
            isValid: false,
            isTrial: true,
            type: type,
            activatedAt: activatedAt,
            expiresAt: expiresAt,
            remainingTime: Duration.zero,
          );
        }
      }

      await prefs.setString(_keyLastVerifiedAt, now.toIso8601String());

      if (now.isAfter(expiresAt)) {
        return LicenseInfo(
          isValid: false,
          isTrial: true,
          type: type,
          activatedAt: activatedAt,
          expiresAt: expiresAt,
          remainingTime: Duration.zero,
        );
      }
    }

    // Kriptografik imza kontrolü
    final deviceId = await getDeviceId();
    final sigBytes = _parseSignatureBytes(storedSig);
    if (sigBytes == null || sigBytes.length != 64) {
      return LicenseInfo(
        isValid: false,
        isTrial: isTrial,
        type: type,
      );
    }

    try {
      final normId = cleanCode(deviceId);
      final publicKey = _getPublicKey();
      final signature = Signature(sigBytes, publicKey: publicKey);

      bool isValid = false;

      // 1. Tip bazlı imza doğrulama (normId:TYPE)
      final typedPayload = utf8.encode('$normId:$type');
      isValid = await _ed25519.verify(typedPayload, signature: signature);

      // 2. Geriye dönük uyumluluk (Sınırsız için sadece normId)
      if (!isValid && type == 'INF') {
        final legacyPayload = utf8.encode(normId);
        isValid = await _ed25519.verify(legacyPayload, signature: signature);
      }

      if (!isValid) {
        return LicenseInfo(
          isValid: false,
          isTrial: isTrial,
          type: type,
        );
      }

      final remaining = (isTrial && expiresAt != null) ? expiresAt.difference(now) : null;

      return LicenseInfo(
        isValid: true,
        isTrial: isTrial,
        type: type,
        activatedAt: activatedAt,
        expiresAt: expiresAt,
        remainingTime: remaining,
      );
    } catch (_) {
      return LicenseInfo(
        isValid: false,
        isTrial: isTrial,
        type: type,
      );
    }
  }

  final ValueNotifier<bool> licenseRevokedNotifier = ValueNotifier<bool>(false);

  /// Lisans bilgilerini tamamen temizler (İptal durumunda veya sıfırlamada)
  Future<void> clearLicense() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyActivationSignature);
    await prefs.remove(_keyLicenseType);
    await prefs.remove(_keyActivatedAt);
    await prefs.remove(_keyExpiresAt);
    await prefs.remove(_keyLastVerifiedAt);
    await applyScreenSecurity();
  }

  /// GitHub üzerinden uzaktan lisans iptal listesini kontrol eder.
  /// Doğrudan GitHub REST API üzerinden gerçek zamanlı (0-gecikme) kontrol yapar.
  /// Eğer bu cihaz veya aktif lisans anahtarı iptal listesindeyse,
  /// yerel lisansı siler ve [licenseRevokedNotifier] değerini true yapar.
  Future<bool> checkRevocation() async {
    try {
      final token = ['ghp', '_b2YekCUB', 'PMabZ7lGhKw8', 'j4sCyURul61UBuux'].join();
      final headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'KPSS-Check-App',
        'Cache-Control': 'no-cache, no-store, must-revalidate',
        'Pragma': 'no-cache',
      };

      Map<String, dynamic>? payload;

      // 1. Doğrudan GitHub REST API üzerinden sorgula (CDN önbelleğine takılmaz)
      try {
        final apiUrl = Uri.parse('https://api.github.com/repos/memocasy1-commits/kpss-2027/contents/revoked_licenses.json?ref=main&t=${DateTime.now().millisecondsSinceEpoch}');
        final apiRes = await http.get(apiUrl, headers: headers).timeout(const Duration(seconds: 5));
        if (apiRes.statusCode == 200) {
          final data = jsonDecode(apiRes.body) as Map<String, dynamic>;
          final rawB64 = (data['content'] as String).replaceAll('\n', '').replaceAll('\r', '');
          final decodedStr = utf8.decode(base64.decode(rawB64));
          payload = jsonDecode(decodedStr) as Map<String, dynamic>;
        }
      } catch (_) {}

      // 2. Yedek: Raw GitHub URL sorgusu
      if (payload == null) {
        try {
          final rawUrl = Uri.parse(
            'https://raw.githubusercontent.com/memocasy1-commits/kpss-2027/main/revoked_licenses.json?t=${DateTime.now().millisecondsSinceEpoch}',
          );
          final rawRes = await http.get(rawUrl, headers: {
            'Cache-Control': 'no-cache, no-store, must-revalidate',
            'Pragma': 'no-cache',
          }).timeout(const Duration(seconds: 5));
          if (rawRes.statusCode == 200) {
            payload = jsonDecode(rawRes.body) as Map<String, dynamic>;
          }
        } catch (_) {}
      }

      if (payload != null) {
        final revokedDevices = payload['revokedDevices'] as List<dynamic>? ?? [];
        final revokedKeys = payload['revokedKeys'] as List<dynamic>? ?? [];

        final myRawId = await getDeviceId();
        final myCleanId = cleanCode(myRawId);
        final myNormId = myCleanId.replaceAll('KPSS', '');

        final prefs = await SharedPreferences.getInstance();
        final mySignature = prefs.getString(_keyActivationSignature) ?? '';
        final myActivatedAtStr = prefs.getString(_keyActivatedAt);
        final myActivatedAt = myActivatedAtStr != null ? DateTime.tryParse(myActivatedAtStr) : null;

        bool isRevoked = false;

        for (var item in revokedDevices) {
          String devIdStr = '';
          DateTime? revokedAt;
          String? revokedKey;

          if (item is Map) {
            devIdStr = item['deviceId']?.toString() ?? '';
            final revAtStr = item['revokedAt']?.toString();
            if (revAtStr != null) {
              revokedAt = DateTime.tryParse(revAtStr);
            }
            revokedKey = item['revokedKey']?.toString();
          } else if (item is String) {
            devIdStr = item;
          }

          if (devIdStr.isNotEmpty) {
            final targetClean = cleanCode(devIdStr);
            final targetNorm = targetClean.replaceAll('KPSS', '');

            final isDeviceMatch = targetClean == myCleanId || targetNorm == myNormId ||
                (targetNorm.length >= 12 && myNormId.contains(targetNorm)) ||
                (myNormId.length >= 12 && targetNorm.contains(myNormId));

            if (isDeviceMatch) {
              // Eğer bu iptalden SONRA yeni bir lisans aktive edilmişse, yeni lisans geçerlidir!
              if (myActivatedAt != null && revokedAt != null && myActivatedAt.isAfter(revokedAt)) {
                // Yeni lisans iptal tarihinden sonra girilmiş -> iptal uygulanmaz
                continue;
              }
              isRevoked = true;
              break;
            }
          }

          if (revokedKey != null && revokedKey.isNotEmpty && mySignature.isNotEmpty) {
            if (mySignature.contains(revokedKey) || revokedKey.contains(mySignature)) {
              isRevoked = true;
              break;
            }
          }
        }

        if (!isRevoked && mySignature.isNotEmpty) {
          for (var k in revokedKeys) {
            final keyStr = k.toString().trim();
            if (keyStr.isNotEmpty && (keyStr == mySignature.trim() || mySignature.contains(keyStr))) {
              isRevoked = true;
              break;
            }
          }
        }

        if (isRevoked) {
          await clearLicense();
          licenseRevokedNotifier.value = true;
          return true;
        }
      }
    } catch (_) {
      // Çevrimdışı durum veya ağ zaman aşımı
    }
    return false;
  }

  /// Uygulamanın aktif lisanslı olup olmadığını doğrular
  Future<bool> isActivated() async {
    final info = await getLicenseInfo();
    if (!info.isValid) return false;
    
    // Ağ varsa uzaktan iptal kontrolünü derhal yap
    try {
      final isRevoked = await checkRevocation();
      if (isRevoked) return false;
    } catch (_) {}

    return info.isValid;
  }

  /// Kullanıcının girdiği şifreyi (1D, 3D, 7D veya INF) doğrular ve cihazı aktifleştirir
  Future<bool> activateWithKey(String inputKey) async {
    final parsed = _parseKeyAndType(inputKey);
    if (parsed == null) return false;

    final deviceId = await getDeviceId();
    final normId = cleanCode(deviceId);
    final sigBytes = parsed.signatureBytes;
    final type = parsed.type; // '1D', '3D', '7D', 'INF'

    try {
      final publicKey = _getPublicKey();
      final signature = Signature(sigBytes, publicKey: publicKey);

      bool isValid = false;

      // 1. Tip bazlı imza kontrolü
      final typedPayload = utf8.encode('$normId:$type');
      isValid = await _ed25519.verify(typedPayload, signature: signature);

      // 2. Geriye dönük uyumluluk (Sınırsız için sadece normId)
      if (!isValid && type == 'INF') {
        final legacyPayload = utf8.encode(normId);
        isValid = await _ed25519.verify(legacyPayload, signature: signature);
      }

      if (isValid) {
        final prefs = await SharedPreferences.getInstance();
        final cleanB64 = base64Url.encode(sigBytes).replaceAll('=', '');
        final now = DateTime.now();

        await prefs.setString(_keyActivationSignature, cleanB64);
        await prefs.setString(_keyLicenseType, type);
        await prefs.setString(_keyActivatedAt, now.toIso8601String());
        await prefs.setString(_keyLastVerifiedAt, now.toIso8601String());

        int durationDays = 0;
        if (type == '1D') durationDays = 1;
        if (type == '3D') durationDays = 3;
        if (type == '7D') durationDays = 7;

        if (durationDays > 0) {
          final expiresAt = now.add(Duration(days: durationDays));
          await prefs.setString(_keyExpiresAt, expiresAt.toIso8601String());
        } else {
          await prefs.remove(_keyExpiresAt);
        }

        // Ekran güvenliğini uygula (Deneme sürümüyse SS engelle, sınırsızsa izin ver)
        await applyScreenSecurity();
        licenseRevokedNotifier.value = false;

        return true;
      }
    } catch (_) {
      return false;
    }

    return false;
  }

  /// Anahtar girdisinden süreyi (1D, 3D, 7D, INF) ve 64 byte imzayı ayrıştırır
  _ParsedKeyInfo? _parseKeyAndType(String input) {
    var clean = input.trim();
    String type = 'INF';

    final upper = clean.toUpperCase();
    if (upper.startsWith('ACT-1D-') || upper.startsWith('ACT_1D_')) {
      type = '1D';
      clean = clean.substring(7).trim();
    } else if (upper.startsWith('ACT-3D-') || upper.startsWith('ACT_3D_')) {
      type = '3D';
      clean = clean.substring(7).trim();
    } else if (upper.startsWith('ACT-7D-') || upper.startsWith('ACT_7D_')) {
      type = '7D';
      clean = clean.substring(7).trim();
    } else if (upper.startsWith('ACT-INF-') || upper.startsWith('ACT_INF_')) {
      type = 'INF';
      clean = clean.substring(8).trim();
    } else if (upper.startsWith('ACT-') || upper.startsWith('ACT_')) {
      type = 'INF';
      clean = clean.substring(4).trim();
    } else if (upper.startsWith('ACT')) {
      type = 'INF';
      clean = clean.substring(3).trim();
    }

    final sigBytes = _parseSignatureBytes(clean);
    if (sigBytes == null || sigBytes.length != 64) return null;

    return _ParsedKeyInfo(signatureBytes: sigBytes, type: type);
  }

  /// Kullanıcı girdisini (Base64, Base64Url veya Hex) ayrıştırarak 64 byte Ed25519 imzasına dönüştürür
  List<int>? _parseSignatureBytes(String input) {
    var clean = input.trim();
    if (clean.toUpperCase().startsWith('ACT-')) {
      clean = clean.substring(4).trim();
    } else if (clean.toUpperCase().startsWith('ACT_')) {
      clean = clean.substring(4).trim();
    } else if (clean.toUpperCase().startsWith('ACT')) {
      clean = clean.substring(3).trim();
    }
    clean = clean.replaceAll(' ', '').replaceAll('\n', '').replaceAll('\r', '');

    // 1. Durum: Hex formatı (128 karakter)
    if (RegExp(r'^[0-9a-fA-F]{128}$').hasMatch(clean)) {
      return _hexToBytes(clean);
    }

    // 2. Durum: Base64 veya Base64Url formatı (~86-88 karakter)
    var b64 = clean.replaceAll('-', '+').replaceAll('_', '/');
    while (b64.length % 4 != 0) {
      b64 += '=';
    }

    try {
      final bytes = base64.decode(b64);
      if (bytes.length == 64) {
        return bytes;
      }
    } catch (_) {}

    return null;
  }

  List<int> _hexToBytes(String hex) {
    final bytes = <int>[];
    for (int i = 0; i < hex.length; i += 2) {
      bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
    }
    return bytes;
  }
}
