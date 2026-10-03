import 'package:flutter/material.dart';
import '../models/lecture_model.dart';
import 'matematik_topics/konu1_temel_kavramlar.dart';
import 'matematik_topics/konu2_bolme_ebob_ekok.dart';
import 'matematik_topics/konu3_rasyonel_sayilar.dart';
import 'matematik_topics/konu4_esitsizlik_mutlak_deger.dart';
import 'matematik_topics/konu5_uslu_koklu_sayilar.dart';
import 'matematik_topics/konu6_carpanlara_ayirma_oran_oranti.dart';
import 'matematik_topics/konu7_sayi_kesir_yas_problemleri.dart';
import 'matematik_topics/konu8_yuzde_karisim_hareket_problemleri.dart';
import 'matematik_topics/konu9_kumeler_fonksiyonlar_moduler.dart';
import 'matematik_topics/konu10_sayma_olasilik_istatistik.dart';
import 'matematik_topics/konu11_geometri.dart';
import 'matematik_topics/konu12_pisa_sayisal_mantik.dart';

class MatematikLectureData {
  static const LectureCourse courseInfo = LectureCourse(
    id: 'matematik',
    title: 'Matematik & Mantık',
    subtitle: 'Temel Kavramlar, Cebir, Problemler, Geometri ve Sayısal Mantık',
    icon: Icons.calculate_rounded,
    color: Color(0xFF4F46E5), // Indigo / Modern Math Blue
    totalTopics: 12,
    availableTopics: 12,
    isAvailable: true,
    badgeText: '2.550 Soru Müfredatı • 12 Konu • Formül & Taktik Rehberi',
  );

  static final List<LectureTopic> topics = [
    matematikKonu1,
    matematikKonu2,
    matematikKonu3,
    matematikKonu4,
    matematikKonu5,
    matematikKonu6,
    matematikKonu7,
    matematikKonu8,
    matematikKonu9,
    matematikKonu10,
    matematikKonu11,
    matematikKonu12,
  ];
}
