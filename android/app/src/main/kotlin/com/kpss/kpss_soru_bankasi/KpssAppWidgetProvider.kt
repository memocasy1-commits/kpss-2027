package com.kpss.kpss_soru_bankasi

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.view.View
import android.widget.RemoteViews

/**
 * KPSS Soru Bankası - Android Ana Ekran Widget'ı (Home Screen Widget)
 * Kullanıcının telefon ana ekranında KPSS sorusu çözmesini, altın bilgiyi görmesini
 * ve yeni sorulara geçmesini sağlar.
 */
class KpssAppWidgetProvider : AppWidgetProvider() {

    companion object {
        const val ACTION_NEXT_QUESTION = "com.kpss.kpss_soru_bankasi.ACTION_NEXT_QUESTION"
        const val ACTION_REVEAL_ANSWER = "com.kpss.kpss_soru_bankasi.ACTION_REVEAL_ANSWER"
        const val PREFS_NAME = "kpss_widget_prefs"
        const val KEY_QUESTION_INDEX = "current_q_index"
        const val KEY_REVEALED = "solution_revealed"

        // Widget için seçilmiş KPSS soruları ve altın bilgileri
        data class WidgetQuestion(
            val course: String,
            val courseTagColor: String,
            val question: String,
            val optA: String,
            val optB: String,
            val optC: String,
            val optD: String,
            val optE: String,
            val correctAns: String,
            val solution: String
        )

        val QUESTIONS = listOf(
            WidgetQuestion(
                course = "TARİH",
                courseTagColor = "#EF4444",
                question = "Aşağıdaki Türk-İslam devletlerinden hangisinde 'Divan-ı Pervâne' teşkilatı arazi ve ikta kayıtlarını tutmakla görevlidir?",
                optA = "A) Büyük Selçuklu Devleti",
                optB = "B) Gazneliler",
                optC = "C) Türkiye Selçuklu Devleti",
                optD = "D) Karahanlılar",
                optE = "E) Eyyubiler",
                correctAns = "C",
                solution = "💡 ALTIN BİLGİ: Divan-ı Pervâne ve Pervaneci makamı YALNIZCA Türkiye Selçukluları'na hastır. Ülke topraklarının tapu, tahrir ve ikta kayıtlarını tutar."
            ),
            WidgetQuestion(
                course = "COĞRAFYA",
                courseTagColor = "#10B981",
                question = "Ardışık iki paralel dairesi arasındaki kuş uçuşu mesafe Dünya'nın her yerinde kaç kilometredir?",
                optA = "A) 33 km",
                optB = "B) 77 km",
                optC = "C) 111 km",
                optD = "D) 144 km",
                optE = "E) 180 km",
                correctAns = "C",
                solution = "💡 ALTIN BİLGİ: Ardışık iki paralel dairesi arasındaki kuş uçuşu mesafe Dünya'nın her yerinde SABİT olup 111 kilometredir. Türkiye 36°-42° K paralelleri arasında 666 km kuzey-güney mesafeye sahiptir."
            ),
            WidgetQuestion(
                course = "VATANDAŞLIK",
                courseTagColor = "#8B5CF6",
                question = "1982 Anayasası'na göre TBMM Başkanlık Divanı'nda aşağıdakilerden hangisi yer almaz?",
                optA = "A) Meclis Başkanı",
                optB = "B) Başkanvekilleri",
                optC = "C) Kâtip Üyeler",
                optD = "D) İdare Amirleri",
                optE = "E) Komisyon Başkanları",
                correctAns = "E",
                solution = "💡 ALTIN BİLGİ: 1982 Anayasası Madde 94 gereğince Başkanlık Divanı: Meclis Başkanı + Başkanvekilleri + Kâtip Üyeler + İdare Amirleri'nden oluşur. Komisyon başkanları divana dahil değildir."
            ),
            WidgetQuestion(
                course = "TÜRKÇE",
                courseTagColor = "#3B82F6",
                question = "Aşağıdaki cümlelerin hangisinde 'türeme sırasında ünlü düşmesine' uğramış bir sözcük vardır?",
                optA = "A) Omzundaki ağır çantayı nihayet yere bıraktı.",
                optB = "B) Sonbahar gelince parktaki ağaçların yaprakları sarardı.",
                optC = "C) Şehrin dar sokaklarında saatlerce tek başına yürüdü.",
                optD = "D) Aklına gelen harika fikirleri hemen not defterine yazdı.",
                optE = "E) Kaynanasının yaptığı lezzetli yemekleri çok beğenmişti.",
                correctAns = "B",
                solution = "💡 ALTIN BİLGİ: 'sarardı' sözcüğü 'sarı-ar-mak' kökünden yapım eki alırken türeme sırasında kökteki 'ı' ünlüsünü kaybetmiştir. A, C, D çekim ekiyle; E ise aşınma yoluyla düşmüştür."
            ),
            WidgetQuestion(
                course = "MATEMATİK",
                courseTagColor = "#F59E0B",
                question = "Bir torbada 4 kırmızı, 5 mavi ve 6 beyaz bilye vardır. Rastgele çekilen bir bilyenin kırmızı olmama olasılığı kaçtır?",
                optA = "A) 4/15",
                optB = "B) 11/15",
                optC = "C) 1/3",
                optD = "D) 2/5",
                optE = "E) 3/5",
                correctAns = "B",
                solution = "💡 ALTIN FORMÜL: P(A') = 1 - P(A). Toplam bilye: 4 + 5 + 6 = 15. Kırmızı çekme: 4/15. Kırmızı olmama olasılığı: 1 - 4/15 = 11/15 bulunur."
            )
        )
    }

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

        when (intent.action) {
            ACTION_NEXT_QUESTION -> {
                val current = prefs.getInt(KEY_QUESTION_INDEX, 0)
                val next = (current + 1) % QUESTIONS.size
                prefs.edit()
                    .putInt(KEY_QUESTION_INDEX, next)
                    .putBoolean(KEY_REVEALED, false)
                    .apply()
                triggerWidgetUpdate(context)
            }
            ACTION_REVEAL_ANSWER -> {
                val isRevealed = prefs.getBoolean(KEY_REVEALED, false)
                prefs.edit().putBoolean(KEY_REVEALED, !isRevealed).apply()
                triggerWidgetUpdate(context)
            }
        }
    }

    private fun triggerWidgetUpdate(context: Context) {
        val appWidgetManager = AppWidgetManager.getInstance(context)
        val thisWidget = ComponentName(context, KpssAppWidgetProvider::class.java)
        val allWidgetIds = appWidgetManager.getAppWidgetIds(thisWidget)
        for (id in allWidgetIds) {
            updateAppWidget(context, appWidgetManager, id)
        }
    }

    private fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: Int) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val qIndex = prefs.getInt(KEY_QUESTION_INDEX, 0) % QUESTIONS.size
        val isRevealed = prefs.getBoolean(KEY_REVEALED, false)
        val q = QUESTIONS[qIndex]

        val views = RemoteViews(context.packageName, R.layout.kpss_app_widget)

        // 1. Bilgileri Doldur
        views.setTextViewText(R.id.widget_course_tag, q.course)
        views.setTextViewText(R.id.widget_question_text, q.question)
        views.setTextViewText(R.id.widget_option_a, q.optA)
        views.setTextViewText(R.id.widget_option_b, q.optB)
        views.setTextViewText(R.id.widget_option_c, q.optC)
        views.setTextViewText(R.id.widget_option_d, q.optD)
        views.setTextViewText(R.id.widget_option_e, q.optE)

        // 2. Çözüm Görünürlüğü
        if (isRevealed) {
            views.setViewVisibility(R.id.widget_solution_box, View.VISIBLE)
            views.setTextViewText(R.id.widget_solution_text, "✅ DOĞRU CEVAP: ${q.correctAns}\n\n${q.solution}")
            views.setTextViewText(R.id.widget_btn_reveal, "🙈 Çözümü Gizle")
        } else {
            views.setViewVisibility(R.id.widget_solution_box, View.GONE)
            views.setTextViewText(R.id.widget_btn_reveal, "💡 Çözümü / Altın Bilgiyi Gör")
        }

        // 3. Tıklama Olayları (PendingIntents)
        // Sonraki Soru Butonu
        val nextIntent = Intent(context, KpssAppWidgetProvider::class.java).apply {
            action = ACTION_NEXT_QUESTION
        }
        val nextPendingIntent = PendingIntent.getBroadcast(
            context,
            appWidgetId * 10 + 1,
            nextIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(R.id.widget_btn_next, nextPendingIntent)

        // Çözümü Gör Butonu
        val revealIntent = Intent(context, KpssAppWidgetProvider::class.java).apply {
            action = ACTION_REVEAL_ANSWER
        }
        val revealPendingIntent = PendingIntent.getBroadcast(
            context,
            appWidgetId * 10 + 2,
            revealIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(R.id.widget_btn_reveal, revealPendingIntent)

        // Uygulamada Aç Butonu & Kök Kart
        val openAppIntent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val openAppPendingIntent = PendingIntent.getActivity(
            context,
            appWidgetId * 10 + 3,
            openAppIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(R.id.widget_btn_open_app, openAppPendingIntent)

        // Widget'ı Güncelle
        appWidgetManager.updateAppWidget(appWidgetId, views)
    }
}
