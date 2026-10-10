import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// KPSS Soru Çözme Hatırlatıcı ve Bildirim Servisi
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  static const String _keyReminderEnabled = 'pref_reminder_enabled';
  static const String _keyReminderTime = 'pref_reminder_time';
  static const String _keyReminderFrequency = 'pref_reminder_frequency';

  final ValueNotifier<bool> reminderEnabledNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<String> reminderTimeNotifier = ValueNotifier<String>('20:00');
  final ValueNotifier<String> reminderFrequencyNotifier = ValueNotifier<String>('Her Gün');

  bool get isReminderEnabled => reminderEnabledNotifier.value;
  String get reminderTime => reminderTimeNotifier.value;
  String get reminderFrequency => reminderFrequencyNotifier.value;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      reminderEnabledNotifier.value = prefs.getBool(_keyReminderEnabled) ?? true;
      reminderTimeNotifier.value = prefs.getString(_keyReminderTime) ?? '20:00';
      reminderFrequencyNotifier.value = prefs.getString(_keyReminderFrequency) ?? 'Her Gün';
    } catch (_) {}
  }

  Future<void> setReminderEnabled(bool enabled) async {
    reminderEnabledNotifier.value = enabled;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyReminderEnabled, enabled);
    } catch (_) {}
  }

  Future<void> setReminderTime(String time) async {
    reminderTimeNotifier.value = time;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyReminderTime, time);
    } catch (_) {}
  }

  Future<void> setReminderFrequency(String frequency) async {
    reminderFrequencyNotifier.value = frequency;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyReminderFrequency, frequency);
    } catch (_) {}
  }

  static const MethodChannel _platformChannel = MethodChannel('com.kpss.kpss_soru_bankasi/notifications');

  /// Android sistem bildirim çubuğunda (Status Bar) gerçek bildirim gösterir
  Future<bool> showSystemNotification({
    required String title,
    required String body,
    int id = 100,
  }) async {
    try {
      final res = await _platformChannel.invokeMethod<bool>('showNotification', {
        'title': title,
        'body': body,
        'id': id,
      });
      return res ?? true;
    } catch (e) {
      debugPrint('System notification channel error: $e');
      return false;
    }
  }

  /// KPSS Koçu Hatırlatma Bildirimi (Hem sistem bildirim çubuğuna hem arayüze gönderir)
  Future<void> sendCoachReminder({
    required String title,
    required String message,
    BuildContext? context,
    VoidCallback? onAction,
    int id = 200,
  }) async {
    // 1. Android Sistem Bildirim Çubuğunda Göster
    await showSystemNotification(title: title, body: message, id: id);

    // 2. Uygulama içi açıksa zengin SnackBar ile de pekiştir
    if (context != null && context.mounted) {
      HapticFeedback.mediumImpact();
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          backgroundColor: const Color(0xFF0F172A),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFF6366F1), width: 1.2),
          ),
          duration: const Duration(seconds: 5),
          content: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.psychology_rounded, color: Color(0xFF818CF8), size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Color(0xFFCBD5E1),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          action: SnackBarAction(
            label: 'Plana Git',
            textColor: const Color(0xFF38BDF8),
            onPressed: () {
              if (onAction != null) onAction();
            },
          ),
        ),
      );
    }
  }

  /// Anında test bildirimi tetikler (Kullanıcı tercihlerini test etmek veya hatırlatmayı simüle etmek için)
  void triggerTestNotification(BuildContext context, {VoidCallback? onAction}) {
    showSystemNotification(
      title: '🎯 KPSS Günlük Soru Vakti!',
      body: 'Günün sorusu hazır. Altın bilgiyi öğrenmek için 1 soru çöz!',
      id: 101,
    );
    HapticFeedback.mediumImpact();
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: const Color(0xFF1E1B4B),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF818CF8), width: 1.2),
        ),
        duration: const Duration(seconds: 5),
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF818CF8).withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.notifications_active_rounded, color: Color(0xFFFBBF24), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '🎯 KPSS Günlük Soru Vakti!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Günün sorusu hazır. Altın bilgiyi öğrenmek için 1 soru çöz!',
                    style: TextStyle(
                      color: Color(0xFFCBD5E1),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'Hemen Çöz',
          textColor: const Color(0xFF38BDF8),
          onPressed: () {
            if (onAction != null) onAction();
          },
        ),
      ),
    );
  }
}
