import 'package:flutter/material.dart';
import '../models/lecture_model.dart';
import 'vatandaslik_topics/konu1_temel_hukuk.dart';
import 'vatandaslik_topics/konu2_turk_anayasa_tarihi.dart';
import 'vatandaslik_topics/konu3_1982_anayasasi_esaslar.dart';
import 'vatandaslik_topics/konu4_temel_hak_hurriyetler.dart';
import 'vatandaslik_topics/konu5_yasama_organi_tbmm.dart';
import 'vatandaslik_topics/konu6_yurutme_cumhurbaskanligi.dart';
import 'vatandaslik_topics/konu7_yargi_organi_mahkemeler.dart';
import 'vatandaslik_topics/konu8_idare_hukuku_teskilat.dart';
import 'vatandaslik_topics/konu9_guncel_bilgiler_uluslararasi.dart';

class VatandaslikLectureData {
  static const LectureCourse courseInfo = LectureCourse(
    id: 'vatandaslik',
    title: 'Vatandaşlık & Güncel',
    subtitle: 'Temel Hukuk, Anayasa, Yasama-Yürütme-Yargı, İdare ve Güncel Bilgiler',
    icon: Icons.account_balance_rounded,
    color: Color(0xFF0284C7), // Sky / Slate Blue
    totalTopics: 9,
    availableTopics: 9,
    isAvailable: true,
    badgeText: '9 Modül • 200+ Sayfa Derinlik • ÖSYM Tuzakları',
  );

  static const List<LectureTopic> topics = [
    konu1TemelHukuk,
    konu2TurkAnayasaTarihi,
    konu3AnayasaEsaslari,
    konu4TemelHaklar,
    konu5YasamaTbmm,
    konu6YurutmeCumhurbaskanligi,
    konu7YargiMahkemeler,
    konu8IdareHukuku,
    konu9GuncelUluslararasi,
  ];
}
