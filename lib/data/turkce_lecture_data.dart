import 'package:flutter/material.dart';
import '../models/lecture_model.dart';
import 'turkce_topics/konu1_sozcukte_anlam.dart';
import 'turkce_topics/konu2_cumlede_anlam.dart';
import 'turkce_topics/konu3_paragrafta_anlam.dart';
import 'turkce_topics/konu4_paragrafta_yapi.dart';
import 'turkce_topics/konu5_ses_bilgisi.dart';
import 'turkce_topics/konu6_yazim_kurallari.dart';
import 'turkce_topics/konu7_noktalama.dart';
import 'turkce_topics/konu8_sozcukte_yapi.dart';
import 'turkce_topics/konu9_sozcuk_turleri_fiiller.dart';
import 'turkce_topics/konu10_cumle_ve_sozel_mantik.dart';

class TurkceLectureData {
  static const LectureCourse courseInfo = LectureCourse(
    id: 'turkce',
    title: 'Türkçe',
    subtitle: 'Sözcük, Cümle, Paragraf, Dil Bilgisi & Sözel Mantık Kuralları',
    icon: Icons.menu_book_rounded,
    color: Color(0xFF0284C7), // Sky Cyan / Academic Blue
    totalTopics: 10,
    availableTopics: 10,
    isAvailable: true,
    badgeText: '2.350 Soru Müfredatı • 10 Konu • Ayrıntılı Rehber',
  );

  static final List<LectureTopic> topics = [
    konu1SozcukteAnlam,
    konu2CumledeAnlam,
    konu3ParagraftaAnlam,
    konu4ParagraftaYapi,
    konu5SesBilgisi,
    konu6YazimKurallari,
    konu7Noktalama,
    konu8SozcukteYapi,
    konu9SozcukTurleri,
    konu10CumleVeSozelMantik,
  ];
}
