import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HapticService {
  static final HapticService instance = HapticService._internal();
  HapticService._internal();

  static const String _keyHapticEnabled = 'haptic_feedback_enabled';
  bool _isEnabled = true;

  bool get isEnabled => _isEnabled;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isEnabled = prefs.getBool(_keyHapticEnabled) ?? true;
  }

  Future<void> setEnabled(bool value) async {
    _isEnabled = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHapticEnabled, value);
    if (value) {
      selection();
    }
  }

  void selection() {
    if (_isEnabled) {
      HapticFeedback.selectionClick();
    }
  }

  void light() {
    if (_isEnabled) {
      HapticFeedback.lightImpact();
    }
  }

  void medium() {
    if (_isEnabled) {
      HapticFeedback.mediumImpact();
    }
  }

  void success() {
    if (_isEnabled) {
      HapticFeedback.lightImpact();
    }
  }

  void error() {
    if (_isEnabled) {
      HapticFeedback.heavyImpact();
    }
  }
}
