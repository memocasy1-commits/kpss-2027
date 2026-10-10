import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/question_service.dart';
import 'theme/app_theme.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/activation_screen.dart';
import 'services/license_service.dart';
import 'services/theme_service.dart';
import 'services/settings_service.dart';
import 'services/notification_service.dart';
import 'services/update_service.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await ThemeService.instance.init();
  await SettingsService.instance.init();
  await NotificationService.instance.init();
  await UpdateService.instance.init();
  ThemeService.instance.updateSystemOverlay(ThemeService.instance.currentMode);

  runApp(const KpssSoruBankasiApp());
}

class KpssSoruBankasiApp extends StatefulWidget {
  const KpssSoruBankasiApp({super.key});

  @override
  State<KpssSoruBankasiApp> createState() => _KpssSoruBankasiAppState();
}

class _KpssSoruBankasiAppState extends State<KpssSoruBankasiApp> with WidgetsBindingObserver {
  Timer? _revocationTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    LicenseService.instance.licenseRevokedNotifier.addListener(_onGlobalLicenseRevoked);

    // Her 15 saniyede bir arka planda sessizce uzaktan iptali kontrol et
    _revocationTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      LicenseService.instance.checkRevocation();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    LicenseService.instance.licenseRevokedNotifier.removeListener(_onGlobalLicenseRevoked);
    _revocationTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Uygulama arka plandan her öne geldiğinde 0-gecikmeyle hemen kontrol et
      LicenseService.instance.checkRevocation();
    }
  }

  void _onGlobalLicenseRevoked() {
    if (LicenseService.instance.licenseRevokedNotifier.value) {
      // Hangi ekranda olursa olsun anında lisans ekranına kilitle
      rootNavigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ActivationScreen(isRevokedAlert: true)),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, mode, _) {
        ThemeData activeTheme;
        Color containerBg;
        final effectiveMode = ThemeService.instance.effectiveMode;
        if (effectiveMode == ThemeModeType.oled) {
          activeTheme = AppTheme.oledTheme;
          containerBg = const Color(0xFF000000);
        } else if (effectiveMode == ThemeModeType.dark) {
          activeTheme = AppTheme.darkTheme;
          containerBg = const Color(0xFF080C14);
        } else if (effectiveMode == ThemeModeType.sepia) {
          activeTheme = AppTheme.sepiaTheme;
          containerBg = const Color(0xFFEFE8DB);
        } else {
          activeTheme = AppTheme.lightTheme;
          containerBg = const Color(0xFFCBD5E1);
        }

        return MaterialApp(
          navigatorKey: rootNavigatorKey,
          title: 'KPSS 2027 Çözümlü Soru Bankası',
          debugShowCheckedModeBanner: false,
          theme: activeTheme,
          builder: (context, child) {
            return ValueListenableBuilder<double>(
              valueListenable: SettingsService.instance.fontScaleNotifier,
              builder: (context, fontScale, _) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(fontScale),
                  ),
                  child: Container(
                    color: containerBg,
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 540),
                      child: ClipRect(child: child ?? const SizedBox()),
                    ),
                  ),
                );
              },
            );
          },
          home: const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _statusText = 'Soru bankası yükleniyor...';
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    try {
      setState(() => _statusText = '15.000 soru veritabanı hazırlanıyor...');
      await QuestionService.instance.loadData();
      final total = QuestionService.instance.grandTotalQuestionCount;
      if (mounted) {
        setState(() => _statusText = '${QuestionService.formatNumber(total)} soru hazırlandı, başlatılıyor...');
      }

      // Uzaktan lisans iptali kontrolü yap
      await LicenseService.instance.checkRevocation();
      final isActivated = await LicenseService.instance.isActivated();
      await LicenseService.instance.applyScreenSecurity();

      if (mounted) {
        final Widget targetScreen = isActivated ? const MainNavigationScreen() : const ActivationScreen();

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 350),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _statusText = 'Yükleme hatası: $e';
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo container
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.4),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.school_rounded, color: Colors.white, size: 48),
            ),
            const SizedBox(height: 28),
            Text(
              'KPSS Çözümlü Soru Bankası',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ÖSYM Odaklı Dijital Sınav Pratiği',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 14),
            // Soru Havuzu Rozeti
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.3)),
              ),
              child: Text(
                '15.000 Çözümlü Soru • 686 Test • 15 Deneme',
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (!_hasError) ...[
              SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.primaryLight,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _statusText,
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  _statusText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.error, fontSize: 13),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _initApp,
                child: const Text('Tekrar Dene'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
