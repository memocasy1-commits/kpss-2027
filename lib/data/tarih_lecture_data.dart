import 'package:flutter/material.dart';
import '../models/lecture_model.dart';
import 'tarih_topics/konu1_islamiyet_oncesi.dart';
import 'tarih_topics/konu2_turk_islam.dart';
import 'tarih_topics/konu3_turkiye_selcuklu_beylikler.dart';
import 'tarih_topics/konu4_osmanli_kurulus_yukselme.dart';
import 'tarih_topics/konu5_osmanli_kultur_medeniyet.dart';
import 'tarih_topics/konu6_duraklama_donemi.dart';
import 'tarih_topics/konu7_gerileme_donemi.dart';
import 'tarih_topics/konu8_dagilma_donemi.dart';
import 'tarih_topics/konu9_xx_yy_baslari_osmanli.dart';
import 'tarih_topics/konu10_birinci_dunya_savasi.dart';
import 'tarih_topics/konu11_kurtulus_savasi_hazirlik.dart';
import 'tarih_topics/konu12_kurtulus_savasi_muharebeler.dart';
import 'tarih_topics/konu13_ataturkculuk_inkilaplar.dart';
import 'tarih_topics/konu14_cagdas_turk_dunya.dart';

class TarihLectureData {
  static const LectureCourse courseInfo = LectureCourse(
    id: 'tarih',
    title: 'Tarih',
    subtitle: 'İlk Türk Devletlerinden Çağdaş Türk ve Dünya Tarihine Askeri Haritalarla Konu Anlatımı',
    icon: Icons.history_edu_rounded,
    color: Color(0xFFD97706), // Amber / Antique Gold
    totalTopics: 14,
    availableTopics: 14,
    isAvailable: true,
    badgeText: '2.800 Soru Müfredatı • 14 Konu • Askeri Haritalı',
  );

  static const List<LectureTopic> topics = [
    konu1IslamiyetOncesi,
    konu2TurkIslam,
    konu3TurkiyeSelcukluBeylikler,
    konu4OsmanliKurulusYukselme,
    konu5OsmanliKulturMedeniyet,
    konu6DuraklamaDonemi,
    konu7GerilemeDonemi,
    konu8DagilmaDonemi,
    konu9XxYyBaslariOsmanli,
    konu10BirinciDunyaSavasi,
    konu11KurtulusSavasiHazirlik,
    konu12KurtulusSavasiMuharebeler,
    konu13AtaturkculukInkilaplar,
    konu14CagdasTurkDunya,
  ];
}
