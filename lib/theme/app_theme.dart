import 'package:flutter/material.dart';

enum ThemeModeType {
  dark, // 0: Koyu Gece Modu (LCD Uyumlu)
  light, // 1: Aydınlık Gündüz Modu
  sepia, // 2: Sepya (Kâğıt Dokusu)
  oled, // 3: Saf Siyah (AMOLED / OLED)
  system, // 4: Telefona Uyum Sağla (Otomatik)
}

class AppColors {
  // Theme state
  static ThemeModeType currentMode = ThemeModeType.dark;
  static bool get isDarkMode => currentMode == ThemeModeType.dark || currentMode == ThemeModeType.oled;
  static bool get isOledMode => currentMode == ThemeModeType.oled;
  static bool get isSepiaMode => currentMode == ThemeModeType.sepia;

  // Backward compatibility setter
  static set isDarkMode(bool val) {
    currentMode = val ? ThemeModeType.dark : ThemeModeType.light;
  }

  // Adaptive background & surface
  static Color get background {
    if (currentMode == ThemeModeType.oled) return const Color(0xFF000000);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFFAF5E8);
    return isDarkMode ? const Color(0xFF0B1120) : const Color(0xFFF8FAFC);
  }

  static Color get surface {
    if (currentMode == ThemeModeType.oled) return const Color(0xFF000000);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFF3EBD8);
    return isDarkMode ? const Color(0xFF1E293B) : const Color(0xFFFFFFFF);
  }

  static Color get surfaceLight {
    if (currentMode == ThemeModeType.oled) return const Color(0xFF141414);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFEAE0D0);
    return isDarkMode ? const Color(0xFF334155) : const Color(0xFFF1F5F9);
  }

  static Color get card {
    if (currentMode == ThemeModeType.oled) return const Color(0xFF000000);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFFFFDF8);
    return isDarkMode ? const Color(0xFF182234) : const Color(0xFFFFFFFF);
  }

  static Color get cardBorder {
    if (currentMode == ThemeModeType.oled) return const Color(0xFF222222);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFDDD2BC);
    return isDarkMode ? const Color(0xFF3B4D66) : const Color(0xFFCBD5E1);
  }

  // Vibrant primary accents
  static Color get primary {
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFB45309); // Amber / Leather
    return const Color(0xFF6366F1); // Indigo
  }

  static Color get primaryLight {
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFD97706);
    return isDarkMode ? const Color(0xFF818CF8) : const Color(0xFF4F46E5);
  }

  static Color get secondary {
    if (currentMode == ThemeModeType.sepia) return const Color(0xFF92400E);
    return const Color(0xFF8B5CF6);
  }

  static const Color accent = Color(0xFF06B6D4); // Cyan

  // High-contrast semantic course accents for home cards
  static Color get courseBlue {
    if (currentMode == ThemeModeType.sepia) return const Color(0xFFB45309);
    return isDarkMode ? const Color(0xFF60A5FA) : const Color(0xFF2563EB);
  }

  static Color get courseGreen {
    if (currentMode == ThemeModeType.sepia) return const Color(0xFF0D9488);
    return isDarkMode ? const Color(0xFF34D399) : const Color(0xFF059669);
  }

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color successBg = Color(0x2210B981);
  static const Color error = Color(0xFFEF4444);
  static const Color errorBg = Color(0x22EF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningBg = Color(0x22F59E0B);

  // Text colors - High contrast, non-silik typography
  static Color get textPrimary {
    if (currentMode == ThemeModeType.sepia) return const Color(0xFF231C10);
    return isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF0F172A);
  }

  static Color get textSecondary {
    if (currentMode == ThemeModeType.oled) return const Color(0xFFE5E7EB);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFF5A4833);
    return isDarkMode ? const Color(0xFFE2E8F0) : const Color(0xFF475569);
  }

  static Color get textMuted {
    if (currentMode == ThemeModeType.oled) return const Color(0xFF9CA3AF);
    if (currentMode == ThemeModeType.sepia) return const Color(0xFF7A6852);
    return isDarkMode ? const Color(0xFFCBD5E1) : const Color(0xFF64748B);
  }

  // Gradients
  static LinearGradient get primaryGradient {
    if (currentMode == ThemeModeType.sepia) {
      return const LinearGradient(
        colors: [Color(0xFFB45309), Color(0xFF78350F)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
    return const LinearGradient(
      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient get cardGradient {
    if (currentMode == ThemeModeType.oled) {
      return const LinearGradient(
        colors: [Color(0xFF050505), Color(0xFF000000)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    if (currentMode == ThemeModeType.sepia) {
      return const LinearGradient(
        colors: [Color(0xFFFAF6EB), Color(0xFFF4ECE0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    return isDarkMode
        ? const LinearGradient(
            colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        : const LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          );
  }

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get oledTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF000000),
      primaryColor: const Color(0xFF6366F1),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF000000),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF000000),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF222222), width: 1.2),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF000000),
        selectedItemColor: Color(0xFF818CF8),
        unselectedItemColor: Color(0xFF94A3B8),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF1F1F1F),
        thickness: 1,
      ),
    );
  }
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B1120),
      primaryColor: const Color(0xFF6366F1),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0B1120),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF182234),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF3B4D66), width: 1.2),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF0F172A),
        selectedItemColor: Color(0xFF818CF8),
        unselectedItemColor: Color(0xFF94A3B8),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 16,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      primaryColor: const Color(0xFF6366F1),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF8FAFC),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0xFF0F172A),
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: Color(0xFF0F172A)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFFFF),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFCBD5E1), width: 1),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFF4F46E5),
        unselectedItemColor: Color(0xFF94A3B8),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }

  static ThemeData get sepiaTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFFAF5E8),
      primaryColor: const Color(0xFFB45309),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFAF5E8),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0xFF231C10),
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: Color(0xFF231C10)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFDF8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFDDD2BC), width: 1.2),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFF3EBD8),
        selectedItemColor: Color(0xFFB45309),
        unselectedItemColor: Color(0xFF7A6852),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
