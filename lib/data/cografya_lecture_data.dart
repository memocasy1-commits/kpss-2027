import 'package:flutter/material.dart';
import '../models/lecture_model.dart';
import 'cografya_topics/konu1_cografi_konum_jeopolitik.dart';
import 'cografya_topics/konu2_yersekilleri_jeoloji.dart';
import 'cografya_topics/konu3_iklim_bitki_ortusu.dart';
import 'cografya_topics/konu4_su_toprak_afetler.dart';
import 'cografya_topics/konu5_nufus_yerlesme_goc.dart';
import 'cografya_topics/konu6_tarim_hayvancilik.dart';
import 'cografya_topics/konu7_madenler_enerji.dart';
import 'cografya_topics/konu8_sanayi_ticaret.dart';
import 'cografya_topics/konu9_ulasim_turizm.dart';
import 'cografya_topics/konu10_bolgesel_kalkinma_projeleri.dart';
import 'cografya_topics/konu11_haritali_cografya_sentez.dart';

class CografyaLectureData {
  static const LectureCourse courseInfo = LectureCourse(
    id: 'cografya',
    title: 'Coğrafya',
    subtitle: 'Fiziki, Beşeri ve Ekonomik Coğrafya • Tematik Harita Atlası ve ÖSYM Analizleri',
    icon: Icons.public_rounded,
    color: Color(0xFF059669), // Emerald / Forest Green
    totalTopics: 11,
    availableTopics: 11,
    isAvailable: true,
    badgeText: '11 Modül • 200+ Sayfa Derinlik • Tematik Harita Atlaslı',
  );

  static final List<LectureTopic> topics = [
    konu1CografiKonum,
    konu2YersekilleriJeoloji,
    konu3IklimBitkiOrtusu,
    konu4SuToprakAfetler,
    konu5NufusYerlesmeGoc,
    konu6TarimHayvancilik,
    konu7MadenlerEnerji,
    konu8SanayiTicaret,
    konu9UlasimTurizm,
    konu10BolgeselProjeler,
    konu11HaritaliCografyaSentez,
  ];
}
