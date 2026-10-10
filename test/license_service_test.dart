import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kpss_soru_bankasi/services/license_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const mockDeviceId = 'KPSS-8X42-9B1K-77M9';

  setUp(() {
    LicenseService.instance.resetForTesting();
  });

  test('LicenseService - Legacy Unlimited Activation works seamlessly', () async {
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': mockDeviceId,
    });

    final service = LicenseService.instance;
    expect(await service.isActivated(), isFalse);

    // Legacy format key
    const legacyKey =
        'ACT-_qrx4JH0HpCQ91CpXqZkzoRmrWiEA4U7rTFyvpCVqBDucgrmo8PwiaiU9Ry_PtsqwUdTFnlj_931sbKFKfPYAA';
    final success = await service.activateWithKey(legacyKey);
    expect(success, isTrue);

    final info = await service.getLicenseInfo();
    expect(info.isValid, isTrue);
    expect(info.isTrial, isFalse);
    expect(info.type, equals('INF'));
  });

  test('LicenseService - New ACT-INF Unlimited Activation works', () async {
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': mockDeviceId,
    });

    final service = LicenseService.instance;
    const infKey =
        'ACT-INF-ZV8gwUnQk8piqwWl7PxhFt5nTnOsmYcWW1-98dkJcjLnFSeAWdiOwW8rl9t4Rv9xnAX4f6aIH1M86aBWiEKsAg';
    final success = await service.activateWithKey(infKey);
    expect(success, isTrue);

    final info = await service.getLicenseInfo();
    expect(info.isValid, isTrue);
    expect(info.isTrial, isFalse);
    expect(info.type, equals('INF'));
  });

  test('LicenseService - 3 Günlük Deneme Sürümü Aktivasyonu ve Kalan Süre', () async {
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': mockDeviceId,
    });

    final service = LicenseService.instance;
    const key3D =
        'ACT-3D-5TVzNeJuUQLXzudgNwBiNRQ_vY4hMa7TbBywtGJS2AZ0l9WpZIEG3EeE7GBvrOJla2Sgdvtqf3AgYV9tw0CSCQ';
    final success = await service.activateWithKey(key3D);
    expect(success, isTrue);

    final info = await service.getLicenseInfo();
    expect(info.isValid, isTrue);
    expect(info.isTrial, isTrue);
    expect(info.type, equals('3D'));
    expect(info.remainingTime, isNotNull);
    expect(info.remainingTime!.inHours, greaterThan(70));
    expect(info.remainingFormatted, contains('gün'));
  });

  test('LicenseService - 7 Günlük Deneme Sürümü Aktivasyonu', () async {
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': mockDeviceId,
    });

    final service = LicenseService.instance;
    const key7D =
        'ACT-7D-AjasJhWbvnCwl7nYW74t2XoQ6yAvU6O4io-QXg68ouWjMsxk5DyEcQ7rk6D9utXI-rFgDMZEwDNKB6M41ITXBQ';
    final success = await service.activateWithKey(key7D);
    expect(success, isTrue);

    final info = await service.getLicenseInfo();
    expect(info.isValid, isTrue);
    expect(info.isTrial, isTrue);
    expect(info.type, equals('7D'));
    expect(info.remainingTime!.inDays, greaterThanOrEqualTo(6));
  });

  test('LicenseService - Süresi Dolan Deneme Lisansı Geçersiz Olmalı', () async {
    // 3 günlük lisans geçmiş tarihte bitmiş gibi ayarla
    final expiredTime = DateTime.now().subtract(const Duration(hours: 2));
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': mockDeviceId,
      'kpss_activation_signature':
          '5TVzNeJuUQLXzudgNwBiNRQ_vY4hMa7TbBywtGJS2AZ0l9WpZIEG3EeE7GBvrOJla2Sgdvtqf3AgYV9tw0CSCQ',
      'kpss_license_type': '3D',
      'kpss_activated_at': DateTime.now().subtract(const Duration(days: 4)).toIso8601String(),
      'kpss_expires_at': expiredTime.toIso8601String(),
    });

    final service = LicenseService.instance;
    expect(await service.isActivated(), isFalse);

    final info = await service.getLicenseInfo();
    expect(info.isValid, isFalse);
    expect(info.remainingFormatted, contains('Süresi Doldu'));
  });

  test('LicenseService - Güvenlik: 1D Anahtarını INF Yapmaya Çalışmak Başarısız Olmalı', () async {
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': mockDeviceId,
    });

    final service = LicenseService.instance;
    // 1D anahtarının imzasını alıp başına ACT-INF koyuyoruz:
    const tamperedKey =
        'ACT-INF-j6OgV4vAALGt122yMPNCzMt_AmweZW6RnDszFb3mbTJrd7w0_o-IvYNQ09FoOSHkkkseUUNfK_USPyZu-zPKAA';
    final success = await service.activateWithKey(tamperedKey);
    expect(success, isFalse);
    expect(await service.isActivated(), isFalse);
  });

  test('LicenseService - Güvenlik: Başka Cihazın Anahtarı Reddedilmeli', () async {
    SharedPreferences.setMockInitialValues({
      'kpss_unique_device_id': 'KPSS-DIFFERENT-DEV',
    });

    final service = LicenseService.instance;
    const keyForAnotherDevice =
        'ACT-3D-5TVzNeJuUQLXzudgNwBiNRQ_vY4hMa7TbBywtGJS2AZ0l9WpZIEG3EeE7GBvrOJla2Sgdvtqf3AgYV9tw0CSCQ';
    final success = await service.activateWithKey(keyForAnotherDevice);
    expect(success, isFalse);
    expect(await service.isActivated(), isFalse);
  });
}
