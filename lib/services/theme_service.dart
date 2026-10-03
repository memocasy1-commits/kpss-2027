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

class ThemeService {
  ThemeService._();
  static final ThemeService instance = ThemeService._();

  final ThemeNotifier isDarkNotifier = ThemeNotifier(true);
  final ValueNotifier<ThemeModeType> modeNotifier = ValueNotifier<ThemeModeType>(ThemeModeType.dark);

  bool get isDarkMode => modeNotifier.value == ThemeModeType.dark;
  bool get isSepiaMode => modeNotifier.value == ThemeModeType.sepia;
  ThemeModeType get currentMode => modeNotifier.value;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final modeIndex = prefs.getInt('app_theme_mode') ?? 0;
      final mode = ThemeModeType.values[modeIndex.clamp(0, ThemeModeType.values.length - 1)];
      _applyMode(mode);
    } catch (_) {
      _applyMode(ThemeModeType.dark);
    }
  }

  void _applyMode(ThemeModeType mode) {
    AppColors.currentMode = mode;
    modeNotifier.value = mode;
    isDarkNotifier.notifyThemeChange(mode == ThemeModeType.dark);
    updateSystemOverlay(mode);
  }

  Future<void> toggleTheme() async {
    // Cycle: dark -> light -> sepia -> dark
    ThemeModeType next;
    switch (modeNotifier.value) {
      case ThemeModeType.dark:
        next = ThemeModeType.light;
        break;
      case ThemeModeType.light:
        next = ThemeModeType.sepia;
        break;
      case ThemeModeType.sepia:
        next = ThemeModeType.dark;
        break;
    }
    _applyMode(next);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('app_theme_mode', next.index);
      await prefs.setBool('is_dark_mode', next == ThemeModeType.dark);
    } catch (_) {}
  }

  Future<void> setMode(ThemeModeType mode) async {
    _applyMode(mode);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('app_theme_mode', mode.index);
      await prefs.setBool('is_dark_mode', mode == ThemeModeType.dark);
    } catch (_) {}
  }

  void updateSystemOverlay(ThemeModeType mode) {
    final bool isDark = mode == ThemeModeType.dark;
    final Color navBg = mode == ThemeModeType.sepia
        ? const Color(0xFFFBF7EE)
        : (isDark ? const Color(0xFF0F172A) : const Color(0xFFFFFFFF));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: navBg,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
      ),
    );
  }
}
