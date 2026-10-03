import 'dart:convert';
import 'dart:math';
import 'package:cryptography/cryptography.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// KPSS Soru Bankası - Asimetrik Kriptografik Lisanslama Servisi (Ed25519)
/// ---------------------------------------------------------------------
/// Geliştirici bilgisayarında ÖZEL ANAHTAR (Private Key) ile imzalanan
/// lisans şifrelerini, uygulama içindeki AÇIK ANAHTAR (Public Key) ile doğrular.
/// Özel anahtar ASLA APK içerisine dahil edilmez; tersine mühendislik ile lisans
/// üretici yapılması matematiksel olarak imkansızdır.
class LicenseService {
  static final LicenseService instance = LicenseService._();
  LicenseService._();

  // Ed25519 Açık Anahtarı (Public Key - 32 byte / 64 hex)
  static const String _publicKeyHex =
      "6f5e5796ae523b0cc2a4e212255c9aa29c604f29ce148e4b739a01ac3fcf5ca6";

  static const String _keyDeviceId = "kpss_unique_device_id";
  static const String _keyActivationSignature = "kpss_activation_signature";
  static const String _keyActivatedAt = "kpss_activated_at";

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
      deviceId = _generateNewDeviceId();
      await prefs.setString(_keyDeviceId, deviceId);
    }

    _cachedDeviceId = deviceId;
    return deviceId;
  }

  String getDeviceIdSyncFallback() => _cachedDeviceId ?? '';

  /// 12 karakterlik okunması kolay cihaz kodu üretir
  String _generateNewDeviceId() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'; // 0/O ve 1/I hariç
    final rand = Random.secure();
    final buffer = StringBuffer('KPSS-');

    for (int i = 0; i < 12; i++) {
      if (i > 0 && i % 4 == 0) buffer.write('-');
      buffer.write(chars[rand.nextInt(chars.length)]);
    }

    return buffer.toString();
  }

  /// Kodları normalize eder (Tire, boşluk temizler, büyük harfe çevirir)
  String cleanCode(String code) {
    return code.trim().toUpperCase().replaceAll('-', '').replaceAll(' ', '');
  }

  /// Uygulamanın bu cihazda geçerli bir asimetrik imza ile lisanslanıp lisanslanmadığını kontrol eder
  Future<bool> isActivated() async {
    final prefs = await SharedPreferences.getInstance();
    final storedSig = prefs.getString(_keyActivationSignature);
    if (storedSig == null || storedSig.isEmpty) return false;

    final deviceId = await getDeviceId();
    final sigBytes = _parseSignatureBytes(storedSig);
    if (sigBytes == null || sigBytes.length != 64) return false;

    try {
      final normId = cleanCode(deviceId);
      final payload = utf8.encode(normId);
      final signature = Signature(sigBytes, publicKey: _getPublicKey());
      final isValid = await _ed25519.verify(payload, signature: signature);
      return isValid;
    } catch (_) {
      return false;
    }
  }

  /// Kullanıcının girdiği şifreyi doğrular ve geçerliyse cihazı kalıcı olarak aktifleştirir
  Future<bool> activateWithKey(String inputKey) async {
    final deviceId = await getDeviceId();
    final sigBytes = _parseSignatureBytes(inputKey);

    if (sigBytes == null || sigBytes.length != 64) {
      return false;
    }

    try {
      final normId = cleanCode(deviceId);
      final payload = utf8.encode(normId);
      final signature = Signature(sigBytes, publicKey: _getPublicKey());

      final isValid = await _ed25519.verify(payload, signature: signature);
      if (isValid) {
        final prefs = await SharedPreferences.getInstance();
        // İmzayı kalıcı sakla (Base64Url)
        final cleanB64 = base64Url.encode(sigBytes).replaceAll('=', '');
        await prefs.setString(_keyActivationSignature, cleanB64);
        await prefs.setString(_keyActivatedAt, DateTime.now().toIso8601String());
        return true;
      }
    } catch (_) {
      return false;
    }

    return false;
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
