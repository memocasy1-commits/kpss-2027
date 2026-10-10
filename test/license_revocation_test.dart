import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kpss_soru_bankasi/services/license_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    LicenseService.instance.resetForTesting();
    LicenseService.instance.licenseRevokedNotifier.value = false;
  });

  test('LicenseService - clearLicense cleans local preferences', () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("kpss_activation_signature", "sample_sig");
    await prefs.setString("kpss_license_type", "INF");

    expect(prefs.getString("kpss_activation_signature"), equals("sample_sig"));

    await LicenseService.instance.clearLicense();

    expect(prefs.getString("kpss_activation_signature"), isNull);
    expect(prefs.getString("kpss_license_type"), isNull);
  });

  test('LicenseService - licenseRevokedNotifier notifies listeners', () {
    bool listenerCalled = false;
    LicenseService.instance.licenseRevokedNotifier.addListener(() {
      listenerCalled = true;
    });

    LicenseService.instance.licenseRevokedNotifier.value = true;
    expect(listenerCalled, isTrue);
  });
}
