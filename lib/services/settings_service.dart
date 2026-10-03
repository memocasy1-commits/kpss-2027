import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// KPSS Soru Bankası - Kullanıcı Tercihleri ve Ayarlar Servisi
class SettingsService {
  SettingsService._();
  static final SettingsService instance = SettingsService._();

  // Keys
  static const String _keyFontScale = 'pref_font_scale';
  static const String _keyInstantSolution = 'pref_instant_solution';
  static const String _keyShowTimer = 'pref_show_timer';
  static const String _keyHapticFeedback = 'pref_haptic_feedback';
  static const String _keySoundEffects = 'pref_sound_effects';
  static const String _keyTargetExam = 'pref_target_exam';
  static const String _keyDailyGoal = 'pref_daily_goal';
  static const String _keyKeepAwake = 'pref_keep_awake';

  // Notifiers
  final ValueNotifier<double> fontScaleNotifier = ValueNotifier<double>(1.0);
  final ValueNotifier<bool> instantSolutionNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> showTimerNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> hapticFeedbackNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> soundEffectsNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<String> targetExamNotifier = ValueNotifier<String>('KPSS Lisans (GY-GK)');
  final ValueNotifier<int> dailyGoalNotifier = ValueNotifier<int>(50);
  final ValueNotifier<bool> keepScreenAwakeNotifier = ValueNotifier<bool>(true);

  // Getters
  double get fontScale => fontScaleNotifier.value;
  bool get instantSolution => instantSolutionNotifier.value;
  bool get showTimer => showTimerNotifier.value;
  bool get hapticFeedback => hapticFeedbackNotifier.value;
  bool get soundEffects => soundEffectsNotifier.value;
  String get targetExam => targetExamNotifier.value;
  int get dailyGoal => dailyGoalNotifier.value;
  bool get keepScreenAwake => keepScreenAwakeNotifier.value;

  /// Ayarları SharedPreferences'tan yükle
  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      fontScaleNotifier.value = prefs.getDouble(_keyFontScale) ?? 1.0;
      instantSolutionNotifier.value = prefs.getBool(_keyInstantSolution) ?? true;
      showTimerNotifier.value = prefs.getBool(_keyShowTimer) ?? true;
      hapticFeedbackNotifier.value = prefs.getBool(_keyHapticFeedback) ?? true;
      soundEffectsNotifier.value = prefs.getBool(_keySoundEffects) ?? true;
      targetExamNotifier.value = prefs.getString(_keyTargetExam) ?? 'KPSS Lisans (GY-GK)';
      dailyGoalNotifier.value = prefs.getInt(_keyDailyGoal) ?? 50;
      keepScreenAwakeNotifier.value = prefs.getBool(_keyKeepAwake) ?? true;
    } catch (_) {}
  }

  Future<void> setFontScale(double scale) async {
    fontScaleNotifier.value = scale;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_keyFontScale, scale);
    } catch (_) {}
  }

  Future<void> setInstantSolution(bool value) async {
    instantSolutionNotifier.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyInstantSolution, value);
    } catch (_) {}
  }

  Future<void> setShowTimer(bool value) async {
    showTimerNotifier.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyShowTimer, value);
    } catch (_) {}
  }

  Future<void> setHapticFeedback(bool value) async {
    hapticFeedbackNotifier.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyHapticFeedback, value);
    } catch (_) {}
  }

  Future<void> setSoundEffects(bool value) async {
    soundEffectsNotifier.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keySoundEffects, value);
    } catch (_) {}
  }

  Future<void> setTargetExam(String exam) async {
    targetExamNotifier.value = exam;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyTargetExam, exam);
    } catch (_) {}
  }

  Future<void> setDailyGoal(int goal) async {
    dailyGoalNotifier.value = goal;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_keyDailyGoal, goal);
    } catch (_) {}
  }

  Future<void> setKeepScreenAwake(bool value) async {
    keepScreenAwakeNotifier.value = value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyKeepAwake, value);
    } catch (_) {}
  }
}
