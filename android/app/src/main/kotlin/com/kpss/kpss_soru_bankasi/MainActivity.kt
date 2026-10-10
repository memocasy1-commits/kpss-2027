package com.kpss.kpss_soru_bankasi

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.view.WindowManager
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.kpss.kpss_soru_bankasi/notifications"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "showNotification" -> {
                    val title = call.argument<String>("title") ?: "KPSS Çalışma Koçu"
                    val body = call.argument<String>("body") ?: "Bugünün çalışma planı seni bekliyor!"
                    val id = call.argument<Int>("id") ?: 100
                    showSystemNotification(title, body, id)
                    result.success(true)
                }
                "setSecureScreen" -> {
                    val enabled = call.argument<Boolean>("enabled") ?: false
                    runOnUiThread {
                        if (enabled) {
                            window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
                        } else {
                            window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                        }
                    }
                    result.success(true)
                }
                "getDeviceInfo" -> {
                    val info = mapOf(
                        "manufacturer" to (Build.MANUFACTURER ?: "UNKNOWN"),
                        "model" to (Build.MODEL ?: "DEVICE"),
                        "brand" to (Build.BRAND ?: "UNKNOWN"),
                        "device" to (Build.DEVICE ?: "")
                    )
                    result.success(info)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun showSystemNotification(title: String, body: String, id: Int) {
        val channelId = "kpss_study_coach_channel"
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "KPSS Çalışma Koçu & Hatırlatıcı",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Günlük KPSS çalışma planı ve soru hatırlatmaları"
                enableVibration(true)
            }
            notificationManager.createNotificationChannel(channel)
        }

        val intent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            this,
            id,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val builder = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(title)
            .setContentText(body)
            .setStyle(NotificationCompat.BigTextStyle().bigText(body))
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setContentIntent(pendingIntent)
            .setAutoCancel(true)

        notificationManager.notify(id, builder.build())
    }
}
