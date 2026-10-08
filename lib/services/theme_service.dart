import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';

class ThemeNotifier extends ValueNotifier<bool> {
  ThemeNotifier(super.value);

  void notifyThemeChange(bool isDark) {
    if (value != isDark) {
      value = isDark;
    } else {
      notifyListeners();
    }
  }
}

class ThemeModeNotifier extends ValueNotifier<ThemeModeType> {
  ThemeModeNotifier(super.value);

  void notifyModeChange(ThemeModeType mode) {
    value = mode;
    notifyListeners();
  }
}

class ThemeService {
  ThemeService._();
  static final ThemeService instance = ThemeService._();

  final ThemeNotifier isDarkNotifier = ThemeNotifier(true);
  final ThemeModeNotifier modeNotifier = ThemeModeNotifier(ThemeModeType.dark);

  ThemeModeType get currentMode => modeNotifier.value;

  /// Sistem modu seçildiğinde cihazın anlık temasını döndürür
  ThemeModeType get effectiveMode {
    if (modeNotifier.value == ThemeModeType.system) {
      final isDark = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
      return isDark ? ThemeModeType.dark : ThemeModeType.light;
    }
    return modeNotifier.value;
  }

  bool get isDarkMode => effectiveMode == ThemeModeType.dark || effectiveMode == ThemeModeType.oled;
  bool get isOledMode => effectiveMode == ThemeModeType.oled;
  bool get isSepiaMode => effectiveMode == ThemeModeType.sepia;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final modeIndex = prefs.getInt('app_theme_mode') ?? 0;
      final mode = ThemeModeType.values[modeIndex.clamp(0, ThemeModeType.values.length - 1)];
      _applyMode(mode);
    } catch (_) {
      _applyMode(ThemeModeType.dark);
    }

    // Telefonun sistem teması değiştiğinde otomatik güncelleme
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      if (modeNotifier.value == ThemeModeType.system) {
        _applyMode(ThemeModeType.system);
      }
    };
  }

  void _applyMode(ThemeModeType mode) {
    final eff = mode == ThemeModeType.system ? effectiveMode : mode;
    AppColors.currentMode = eff;
    modeNotifier.notifyModeChange(mode);
    isDarkNotifier.notifyThemeChange(eff == ThemeModeType.dark || eff == ThemeModeType.oled);
    updateSystemOverlay(mode);
  }

  Future<void> toggleTheme() async {
    // Döngü: dark (LCD) -> oled (AMOLED Saf Siyah) -> light -> sepia -> system -> dark
    ThemeModeType next;
    switch (modeNotifier.value) {
      case ThemeModeType.dark:
        next = ThemeModeType.oled;
        break;
      case ThemeModeType.oled:
        next = ThemeModeType.light;
        break;
      case ThemeModeType.light:
        next = ThemeModeType.sepia;
        break;
      case ThemeModeType.sepia:
        next = ThemeModeType.system;
        break;
      case ThemeModeType.system:
        next = ThemeModeType.dark;
        break;
    }
    await setMode(next);
  }

  Future<void> setMode(ThemeModeType mode) async {
    _applyMode(mode);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('app_theme_mode', mode.index);
      final eff = mode == ThemeModeType.system ? effectiveMode : mode;
      await prefs.setBool('is_dark_mode', eff == ThemeModeType.dark || eff == ThemeModeType.oled);
    } catch (_) {}
  }

  void updateSystemOverlay(ThemeModeType mode) {
    final eff = mode == ThemeModeType.system ? effectiveMode : mode;
    final bool isDark = eff == ThemeModeType.dark || eff == ThemeModeType.oled;
    final bool isOled = eff == ThemeModeType.oled;

    final Color navBg = isOled
        ? const Color(0xFF000000)
        : (eff == ThemeModeType.sepia
            ? const Color(0xFFFBF7EE)
            : (isDark ? const Color(0xFF0F172A) : const Color(0xFFFFFFFF)));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: navBg,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: isOled
            ? const Color(0xFF141414)
            : (isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0)),
      ),
    );
  }
}
