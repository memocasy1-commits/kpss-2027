// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu9UlasimTurizm = LectureTopic(
  id: 'cografya_ulasim_turizm',
  courseId: 'cografya',
  order: 9,
  title: 'Türkiye\'de Ulaşım ve Turizm',
  subtitle: 'Karayolu Geçitleri, Demiryolları, Limanlar, Hinterland, Doğal ve Kültürel Turizm Varlıkları',
  icon: Icons.directions_bus_rounded,
  color: const Color(0xFF0284C7),
  testRange: 'Test 81 - 90',
  startTestNum: 81,
  endTestNum: 90,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'de Ulaşımı Etkileyen Faktörler ve Karayolu Ulaşımı',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'de ulaşım ağlarının dağılışında ve güzergahlarında en belirleyici doğal faktör YER ŞEKİLLERİDİR. Dağların genellikle doğu-batı doğrultusunda uzanması nedeniyle ulaşım hatları da doğu-batı yönünde kolaylaşmış; kuzey-güney yönünde ise sarp dağ sıraları yüzünden ancak geçit ve tünellerle sağlanabilmiştir.',
      bulletPoints: [
        'Yer Şekilleri ve Ulaşım Maliyeti: Engebeli ve yüksek alanlarda (Doğu Anadolu, Doğu Karadeniz, Akdeniz Torosları) yol yapım maliyeti çok yüksektir; köprü, viyadük ve tünel ihtiyacı fazladır. Düz ve alçak alanlarda (Marmara, İç Anadolu, Güneydoğu) ise yol yapım maliyeti düşüktür.',
        'Karayolu Taşımacılığı Özellikleri: Türkiye\'de yurtiçi yolcu taşımacılığının yaklaşık %88\'i, yük taşımacılığının ise %80\'den fazlası karayolu ile yapılmaktadır. Kapıdan kapıya ulaşım sağlaması en büyük avantajı, birim taşıma maliyetinin yüksek olması ise dezavantajıdır.',
        'Türkiye\'nin Kritik Karayolu Geçitleri ve Tünelleri:',
        '• Karadeniz Bölgesi Geçitleri:\n- Zigana Geçidi ve Yeni Zigana Tüneli: Trabzon\'u Gümüşhane ve Erzurum üzerinden İran transit yoluna bağlar (Avrupa\'nın en uzun çift tüplü tüneli).\n- Kop Geçidi: Bayburt\'u Erzurum\'a bağlar.\n- Ovit Tüneli: Rize\'yi İspir üzerinden Erzurum\'a bağlar (kışın kapanan yolu 12 ay açık tutar).\n- Ilgaz Geçidi ve Tüneli: Kastamonu\'yu Çankırı ve Ankara\'ya bağlar.\n- Ecevit Geçidi: İnebolu Limanı\'nı Kastamonu\'ya bağlar.\n- Cankurtaran Tüneli: Hopa\'yı Borçka ve Artvin\'e bağlar.',
        '• Akdeniz Bölgesi Geçitleri:\n- Çubuk Geçidi: Antalya\'yı Burdur ve Göller Yöresi\'ne bağlar.\n- Sertavul Geçidi: Silifke ve Mersin\'i Karaman ve Konya\'ya bağlar.\n- Gülek Boğazı: Adana ve Çukurova\'yı Pozantı üzerinden İç Anadolu\'ya bağlayan en işlek boğazdır.\n- Belen Geçidi: İskenderun\'u Antakya ve Suriye sınırına bağlar.'
      ],
      goldenRule: 'GEÇİTLER KUZEY-GÜNEY YÖNLÜDÜR: Dağlar kıyıya paralel uzandığı için Karadeniz ve Akdeniz\'de kıyı ile iç kesimi birbirine bağlayan tüm kritik geçitler KUZEY-GÜNEY doğrultusundadır.',
      osymTrap: 'ÖSYM TUZAĞI: Ege Bölgesi\'nde dağlar denize dik uzandığı için kıyı ile iç kesim arasında geçit ihtiyacı YOKTUR! Ulaşım doğal graben oluklarından son derece rahat ve düşük maliyetle sağlanır.'
    ),
    LectureSection(
      title: 'Demiryolu, Denizyolu ve Havayolu Ulaşımı',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye\'nin demiryolu, liman ve havayolu altyapısının mekânsal dağılımı:',
      comparisonRows: [
        ComparisonRow(
          correct: 'Demiryolu Ulaşımı ve YHT Ağları',
          wrong: 'İlk demiryolu hattı 1856 yılında İngilizler tarafından İzmir-Aydın arasında açılmıştır.\nYüksek Hızlı Tren (YHT) Hatları: Ankara-Eskişehir-İstanbul, Ankara-Konya-Karaman, Ankara-Kırıkkale-Yozgat-Sivas.\nDemiryolu Ulaşmayan İller (ÖSYM\'nin En Çok Sorduğu Tuzak): Antalya, Muğla, Çanakkale, Bursa merkez (YHT yapım aşamasında), Kastamonu, Sinop, Giresun, Trabzon, Rize, Artvin, Ağrı, Hakkari.',
          note: 'Karadeniz sahilinde demiryolu olan sadece Zonguldak ve Samsun\'dur.'
        ),
        ComparisonRow(
          correct: 'Denizyolu ve Limanların Hinterlandı (Art Ülkesi)',
          wrong: 'Denizyolu en ucuz taşıma türüdür (Yol yapım ve bakım masrafı yoktur, tek seferde devasa yük taşınır).\nHinterlandı Geniş (Gelişmiş) Limanlar: İstanbul (Ambarlı), Kocaeli, İzmir (Aliağa), Mersin, İskenderun, Tekirdağ (Asyaport), Samsun.\nHinterlandı Dar (Gelişmemiş) Liman: SİNOP (Küre Dağları gerisinde dik set oluşturduğu ve demiryolu bağlantısı olmadığı için doğal liman olmasına rağmen gelişememiştir).',
          note: 'Hinterland; bir limanın ardındaki ekonomik, sanayi ve demiryolu etki sahasıdır.'
        ),
        ComparisonRow(
          correct: 'Havayolu Ulaşımı',
          wrong: 'En hızlı ve en pahalı ulaşım türüdür. Son yıllarda yapılan bölgesel havalimanlarıyla yaygınlaşmıştır.\nDeniz Üzerine Dolgu Yapılarak İnşa Edilen Havalimanları:\n1) Ordu - Giresun Havalimanı (Türkiye ve Avrupa\'nın ilk deniz dolgu havalimanı)\n2) Rize - Artvin Havalimanı (Türkiye\'nin ikinci deniz dolgu havalimanı).',
          note: 'Arazinin aşırı dağlık olması deniz dolgusunu zorunlu kılmıştır.'
        ),
      ],
      goldenRule: 'ANTALYA VE ÇANAKKALE\'DE DEMİRYOLU YOKTUR: Antalya gibi dev bir turizm-tarım merkezinde ve Çanakkale gibi iki yakalı boğaz şehrinde DEMİRYOLU BAĞLANTISI KESİNLİKLE YOKTUR.',
      osymTrap: 'ÖSYM TUZAĞI: Sinop Limanı Karadeniz\'in tek doğal limanı olmasına rağmen gelişememiştir; çünkü arkasındaki Küre Dağları yüzünden iç kesimlerle bağlantısı kopuktur ve demiryolu yoktur (Hinterlandı dardır)!'
    ),
    LectureSection(
      title: 'Türkiye\'de Turizm Çeşitleri ve Coğrafi Dağılışı',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'nin zengin tarihi, 4 mevsimi aynı anda yaşaması ve doğal güzellikleri turizmi bacasız bir sanayiye dönüştürmüştür:',
      bulletPoints: [
        'Kıyı (Deniz) Turizmi: Güneşlenme süresi ve deniz suyu sıcaklığının yüksek olduğu Akdeniz ve Ege kıyılarında yaygındır (Antalya, Alanya, Bodrum, Marmaris, Fethiye, Kuşadası, Çeşme). Karadeniz\'de yaz yağışları ve bulutluluk nedeniyle deniz turizm sezonu çok kısadır.',
        'Kültür ve Arkeoloji Turizmi: Tarihi Yarımada (İstanbul), Efes ve Meryem Ana (İzmir), Truva (Çanakkale), Bergama (İzmir), Çatalhöyük (Konya), Göbeklitepe (Şanlıurfa - Dünyanın en eski tapınağı), Nemrut Dağı heykelleri (Adıyaman), Ani Harabeleri (Kars), Gordion (Ankara).',
        'Kış Turizmi: Yüksek dağlık alanlarda kar örtüsünün uzun süre kalmasıyla gelişir: Bursa Uludağ (İlk kış turizm merkezi), Erzurum Palandöken, Kayseri Erciyes, Bolu Kartalkaya, Kars Sarıkamış (Kristal kar), Kocaeli Kartepe, Isparta Davraz.',
        'Termal (Sağlık) Turizmi: Fay hatlarının yaygınlığı nedeniyle jeotermal kaplıcalar çok zengindir: Afyonkarahisar (Termal başkent), Bursa (Oylat, Çekirge), Denizli (Pamukkkale-Karahayıt), Kütahya (Yoncalı), Yalova, Ankara (Kızılcahamam).',
        'Yayla ve Ekoturizm: Karadeniz (Ayder, Uzungöl) ve Akdeniz Toros yaylalarında yaz sıcağından kaçmak ve doğa yürüyüşü amacıyla gelişmiştir.',
        'İnanç Turizmi: Konya (Mevlana), Şanlıurfa (Balıklıgöl), Hatay (St. Pierre Kilisesi - İlk mağara kilise), Trabzon (Sümela Manastırı), İzmir Selçuk (Meryem Ana Evi).'
      ],
      goldenRule: 'TERMAL TURİZM İKLİMDEN ETKİLENMEZ: Kaplıca ve termal sular yer altından geldiği için 12 ay boyunca kesintisiz turizm faaliyetine imkan tanır.',
      osymTrap: 'ÖSYM TUZAĞI: Karadeniz kıyılarında deniz turizminin gelişememesinin ana sebebi sıcaklık yetersizliğinden ziyade YAZ YAĞIŞLARI VE AŞIRI BULUTLULUKTUR (Güneşlenme süresi çok azdır).'
    ),
    LectureSection(
      title: 'Türkiye Ulaşım Hatları ve Karayolu Geçitleri Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin stratejik otoyolları, kritik dağ geçitleri, YHT koridorları ve ticaret limanları harita üzerinde analiz edilmiştir.',
            mapData: LectureMapData(
        title: 'TÜRKİYE KARAYOLLARI, DEMİRYOLLARI VE LİMANLAR ATLASI',
        subtitle: 'Transit Ticaret Aksları, YHT Hatları, Tarihi Dağ Geçitleri ve Deniz Ticaret Kapıları',
        mapId: 'cografya_karayollari_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_karayollari.jpg',
        mapSource: 'cografyaharita.com - Türkiye Karayolları Ağı Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🛣️', label: 'Ana Transit Otoyol Koridorları', description: 'TEM (Trans European Motorway) Kapıkule-İstanbul-Ankara-Gerede-Gürbulak/Habur; Kuzey Marmara Otoyolu; Ankara-Niğde Otoyolu; İzmir-İstanbul Otoyolu.'),
          MapLegendItem(symbol: '🚄', label: 'Yüksek Hızlı Tren (YHT) Hatları', description: 'Ankara-Eskişehir-İstanbul, Ankara-Konya, Ankara-Sivas, Konya-Karaman. İnşa halindekiler: Ankara-İzmir, Bursa-Osmaneli, Mersin-Adana-Gaziantep.'),
          MapLegendItem(symbol: '🏔️', label: 'Stratejik Dağ Geçitleri', description: 'Karadeniz: Zigana & Kop (Doğu Karadeniz), Ilgaz & Ecevit (Batı Karadeniz). Akdeniz: Çubuk, Sertavul, Gülek Boğazı, Belen Geçidi.'),
          MapLegendItem(symbol: '⚓', label: 'Hinterlandı Geniş İhracat Limanları', description: 'Mersin Uluslararası Limanı, Ambarlı (İstanbul), Aliağa ve İzmir Limanı, Kocaeli (Derince), İskenderun Limanı, Samsun Limanı.'),
          MapLegendItem(symbol: '🚫', label: 'Demiryolu Bağlantısı Olmayan Kıyı İlleri', description: 'Sinop, Trabzon, Rize, Artvin, Giresun, Ordu, Çanakkale, Muğla, Antalya, Kastamonu, Bartın.')
        ],
        points: [
          MapFrontItem(
            name: 'Zigana & Kop Geçitleri (Yeni Zigana Tüneli)',
            category: 'Tarihi İpek Yolu Dağ Geçidi',
            commander: 'Doğu Karadeniz / Trabzon - Gümüşhane - Bayburt',
            keyEvent: 'Trabzon Limanı\'nı Doğu Anadolu ve İran\'a bağlayan en kritik geçittir. 14.5 km uzunluğundaki çift tüplü Yeni Zigana Tüneli ile Avrupa\'nın en uzun karayolu tüneli unvanını almıştır.',
            outcome: 'ÖSYM Çıkmış Soru: Trabzon Limanı\'nın iç kesimlerle bağlantısı Zigana ve Kop geçitleri üzerinden sağlanır.'
          ),
          MapFrontItem(
            name: 'Gülek Boğazı (Toroslar Geçidi)',
            category: 'Akdeniz\'i İç Anadolu\'ya Bağlayan Kapı',
            commander: 'Akdeniz / Adana - Mersin - Niğde Sınırı',
            keyEvent: 'Tarih boyunca Kilikya Kapısı olarak anılan geçittir. Çukurova ve Akdeniz limanlarını İç Anadolu\'ya bağlayan otoyol ve demiryolu bu boğazdan geçer.',
            outcome: 'ÖSYM Sorusu: Adana ve Mersin sanayisini İç Anadolu\'ya bağlayan tarihi boğaz Gülek Boğazı\'dır.'
          ),
          MapFrontItem(
            name: 'Mersin Uluslararası Limanı (MIP)',
            category: 'Türkiye\'nin En Büyük Konteyner Limanı',
            commander: 'Akdeniz / Mersin',
            keyEvent: 'Geniş hinterlandı, doğrudan demiryolu bağlantısı ve serbest bölge avantajıyla Türkiye\'nin en işlek ihracat ve ithalat deniz kapısıdır.',
            outcome: 'ÖSYM Püf Noktası: Hinterlandı en geniş Akdeniz limanımız Mersin Limanı\'dır.'
          ),
          MapFrontItem(
            name: 'Sinop Doğal Limanı',
            category: 'Hinterlandı Dar Doğal Liman',
            commander: 'Batı Karadeniz / Sinop',
            keyEvent: 'Karadeniz\'in tek doğal limanı olmasına rağmen hemen arkasındaki Küre Dağları demiryolu ve karayolu geçişini engellediği için gelişememiş ve tenhada kalmıştır.',
            outcome: 'ÖSYM Çıkmış Soru: Doğal bir liman olmasına rağmen hinterlandı dar olduğu için gelişemeyen limanımız Sinop\'tur.'
          ),
          MapFrontItem(
            name: 'Antalya & Muğla Demiryolu Çıkmazı',
            category: 'Demiryolu Ağı Bulunmayan Turizm İlleri',
            commander: 'Akdeniz & Ege / Antalya - Muğla',
            keyEvent: 'Menteşe ve Batı Toros dağlarının sarp engebesi nedeniyle Türkiye\'nin en çok turist çeken iki iline halen demiryolu hattı ulaşamamıştır.',
            outcome: 'ÖSYM Soru Tuzağı: Antalya ve Muğla\'da DEMİRYOLU BAĞLANTISI YOKTUR!'
          )
        ],
        historicalNote: '📌 ÖSYM ULAŞIM VE DEMİRYOLU KRİTİK SINAV NOTLARI:\n'
            '1. Demiryolu Ulaşımı OLMAYAN İllerimiz:\n'
            '   - Karadeniz Kıyısı: Sinop, Kastamonu, Trabzon, Rize, Artvin, Giresun, Ordu.\n'
            '   - Akdeniz Kıyısı: Antalya.\n'
            '   - Ege Kıyısı: Muğla, Çanakkale.\n'
            '   - Doğu Anadolu: Hakkari, Şırnak, Iğdır, Ağrı.\n'
            '2. Demiryolu Bağlantısı OLAN Karadeniz Limanları: Samsun ve Zonguldak.\n'
            '3. İlk Demiryolu Hattı: 1856 yılında İngilizler tarafından inşa edilen İzmir - Aydın hattıdır.\n'
            '4. İlk Yüksek Hızlı Tren (YHT): 2009 yılında Ankara - Eskişehir arasında hizmete girmiştir.'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Ulaşım ve Turizm',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Karadeniz\'in tek doğal limanı olmasına rağmen Sinop Limanı\'nın hinterlandının dar kalmasının ve gelişememesinin ana nedeni nedir?',
          options: [
            'A) Limanda sık sık fırtına çıkması',
            'B) Arkasındaki Küre Dağları yüzünden iç kesimlerle ulaşımının zor olması ve demiryolunun bulunmaması',
            'C) Deniz suyunun çok tuzlu olması',
            'D) Çevresinde hiç orman bulunmaması',
            'E) Limanın sığ olması'
          ],
          correctIndex: 1,
          explanation: 'Sinop doğal bir limandır fakat arkasındaki engebeli Küre Dağları iç kesimlerle bağlantıyı keser ve demiryolu bağlantısı yoktur. Bu yüzden hinterlandı çok dardır ve gelişememiştir.',
          ruleTag: 'Liman Hinterlandı'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu9 = konu9UlasimTurizm;
