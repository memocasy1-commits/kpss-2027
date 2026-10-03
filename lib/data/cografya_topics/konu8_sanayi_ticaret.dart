// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu8SanayiTicaret = LectureTopic(
  id: 'cografya_sanayi_ticaret',
  courseId: 'cografya',
  order: 8,
  title: 'Türkiye\'de Sanayi, Ticaret ve Serbest Bölgeler',
  subtitle: 'Sanayi Tesisleri, Kuruluş Şartları, Dış Ticaret Dengesi, İhracat-İthalat ve Serbest Ticaret Havzaları',
  icon: Icons.factory_rounded,
  color: const Color(0xFFEA580C),
  testRange: 'Test 71 - 80',
  startTestNum: 71,
  endTestNum: 80,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'de Sanayinin Kuruluşunu Etkileyen Faktörler',
      type: LectureSectionType.overview,
      leadText: 'Bir yerde sanayi tesisinin kurulabilmesi için hammadde, enerji, sermaye, iş gücü, ulaşım ve pazar şartlarının uygun olması gerekir. Türkiye\'de sanayinin en yoğun olduğu bölge MARMARA (özellikle Çatalca-Kocaeli), en az geliştiği bölge ise DOĞU ANADOLU\'DUR.',
      bulletPoints: [
        'Hammaddeye Yakınlık: Çabuk bozulan veya taşınması pahalı olan hammaddelerin işlendiği tesisler hammadde kaynağının hemen yanına kurulur:',
        '• Şeker Fabrikaları (Şeker pancarı hasattan hemen sonra işlenmelidir)\n• Çay Fabrikaları (Rize ve Doğu Karadeniz\'de toplanan yaş çay yaprakları aynı gün işlenmelidir)\n• Konserve ve Salça Fabrikaları (Çanakkale, Balıkesir, Bursa domates-sebze ovaları)\n• Zeytinyağı Fabrikaları (Ege ve Güney Marmara zeytinlikleri)\n• Et ve Süt Fabrikaları (Erzurum, Kars, Konya mera çevreleri)\n• Kağıt ve Kereste Fabrikaları (Karadeniz ve Akdeniz orman kuşakları)\n• Batman Petrol Rafinerisi (Raman petrol sahası yanı).',
        'Enerji Kaynağına Yakınlık: Karabük ve Ereğli Demir-Çelik fabrikaları Zonguldak\'taki taş kömürüne yakın kurulmuştur (Bölgede demir çıkmaz, sebep enerjiye yakınlıktır).',
        'Ulaşım ve Liman Kolaylığı: İskenderun Demir-Çelik fabrikası ile Samsun Bakır İşletmesi hammaddeye değil; deniz ulaşımı ve liman imkanına bağlı olarak kurulmuştur.',
        'Pazar ve Nüfus (Tüketim): İstanbul, İzmir, Ankara, Bursa gibi metropollerin etrafındaki giyim, ambalaj, gıda ve kümes hayvancılığı tesisleri doğrudan büyük tüketici pazarına yakınlık sebebiyle kurulmuştur.',
        'Sermaye ve Nitelikli İş Gücü: Türkiye\'de sanayinin Marmara\'da toplanmasının en temel nedeni sermaye birikimi ve kalifiye iş gücünün burada bulunmasıdır.'
      ],
      goldenRule: 'KARABÜK VE EREĞLİ\'NİN KURULUŞ SEBEBİ ENERJİDİR: Karabük ve Zonguldak Ereğli\'de demir madeni çıkmaz; demir Sivas Divriği ve Malatya\'dan trenle getirilir. Tesislerin buraya kurulmasının tek nedeni taş kömürüne (enerji kaynağına) yakınlıktır.',
      osymTrap: 'ÖSYM TUZAĞI: İskenderun Demir-Çelik Fabrikası enerjiye DEĞİL, ULAŞIMA (deniz limanına) yakın kurulmuştur. Karabük-Ereğli ise ENERJİYE (taş kömürüne) yakın kurulmuştur. Bu ayrım ÖSYM\'nin vazgeçilmez sorusudur!'
    ),
    LectureSection(
      title: 'Türkiye Gıda Sanayisi Tesisleri Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_gida_sanayisi_haritasi.png',
      imageCaption: 'Şekil 8.1: Türkiye Gıda ve İçki Sanayisi Tesisleri Dağılış Haritası (Un, Şeker, Yağ, Çay, Konserve)',
      leadText: 'Türkiye\'de en yaygın ve hammaddeye en bağımlı sanayi kolu gıda sektörüdür:',
      bulletPoints: [
        'Şeker Sanayisi: Türkiye\'nin hemen hemen her iç bölgesinde şeker fabrikası bulunur (ilk fabrika Alpullu - Kırklareli ve Uşak). Şeker pancarı hasattan hemen sonra bozulduğu için fabrika tarlaya yakın kurulur.',
        'Çay Sanayisi: Sadece Doğu Karadeniz\'de (Rize, Trabzon, Artvin, Giresun) bulunur; hammaddeye tam bağımlıdır.',
        'Un ve Unlu Mamuller: İç Anadolu\'da (Konya, Ankara, Eskişehir) tahıl üretimine bağlı olarak çok gelişmiştir.',
        'Bitkisel Yağ Sanayisi: Zeytinyağı Ege ve Güney Marmara\'da; ayçiçek yağı Trakya (Tekirdağ, Edirne) ve Çukurova\'da kümelenmiştir.',
        'Konserve ve Salça: Güney Marmara (Balıkesir, Bursa, Çanakkale) ve Ege ovalarında yaygındır.'
      ],
      goldenRule: 'ŞEKER VE ÇAY HAMMADDEYE EN BAĞIMLI SEKTÖRLERDİR: İkisi de tarladan toplandığı gün işlenmek zorundadır; bu yüzden fabrikaları üretim alanının dışına kurulamaz.',
      osymTrap: 'ÖSYM TUZAĞI: Şeker pancarı kıyılarda ekonomik değeri daha yüksek ürünler (pamuk, tütün, sebze) ekildiği için kıyı şeridinde yetiştirilmez ve fabrikası bulunmaz.'
    ),
    LectureSection(
      title: 'Türkiye Dokuma, Tekstil ve Deri Sanayisi Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_dokuma_ve_deri_sanayisi_haritasi.png',
      imageCaption: 'Şekil 8.2: Türkiye Dokuma, Tekstil, Konfeksiyon ve Deri Sanayisi Haritası',
      leadText: 'Türkiye\'nin istihdamda en büyük paya sahip geleneksel ve ihracatçı sektörüdür:',
      bulletPoints: [
        'Pamuklu Dokuma: Adana, Gaziantep, İzmir, Denizli, Bursa, Aydın, Kahramanmaraş, Kayseri.',
        'Yünlü Dokuma: Hereke (Kocaeli halısı), Bursa, Uşak ve İstanbul.',
        'İpekli Dokuma ve Sentetik İplik: Bursa ve İstanbul (yapay ipek ve sentetik elyaf).',
        'Deri Sanayisi: İstanbul (Zeytinburnu, Tuzla deri serbest bölgesi), İzmir, Bolu Gerede ve Uşak.'
      ],
      goldenRule: 'DENİZLİ VE GAZİANTEP DOKUMA DEVLERİDİR: Denizli ev tekstilinde, Gaziantep ise iplik ve halı dokumada Türkiye\'nin dünya çapında merkezleridir.',
      osymTrap: 'ÖSYM TUZAĞI: Kayseri ve Konya\'da pamuk yetişmemesine rağmen pamuklu dokuma fabrikası vardır; çünkü ulaşım ve tüketim pazarı kolaylığı mevcuttur.'
    ),
    LectureSection(
      title: 'Türkiye Orman Ürünleri, Kereste ve Kağıt Sanayisi Haritası',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_orman_ve_kagit_sanayisi_haritasi.png',
      imageCaption: 'Şekil 8.3: Türkiye Kağıt, Kereste ve Orman Yan Ürünleri Fabrikaları Dağılış Haritası',
      leadText: 'Orman varlığının yoğun olduğu Karadeniz ve Akdeniz kuşaklarında hammaddeye yakın olarak kurulmuştur:',
      bulletPoints: [
        'Kağıt Fabrikaları: Balıkesir, Giresun (Aksu), Zonguldak (Çaycuma), Kastamonu (Taşköprü), Muğla (Dalaman), Mersin (Taşucu), Afyon (Çay).',
        'Kereste ve Sunta/MDF: Batı Karadeniz (Bolu, Düzce, Kastamonu, Sinop) en büyük kereste havzasıdır.',
        'Mobilya Sanayisi: Hammaddeye değil büyük tüketim pazarına bağlıdır: İstanbul, Bursa (İnegöl), Ankara (Siteler), Kayseri ve İzmir.'
      ],
      goldenRule: 'MOBİLYA PAZARA, KAĞIT HAMMADDEYE YAKINDIR: Kağıt fabrikaları orman kenarına; mobilya sanayisi ise büyük tüketici nüfusa yakın kurulur.',
      osymTrap: 'ÖSYM TUZAĞI: Kayseri\'de orman olmamasına rağmen devasa mobilya fabrikaları vardır; nedeni sermaye, iş gücü ve pazar ulaşımıdır.'
    ),
    LectureSection(
      title: 'Türkiye Kimya ve Petrokimya Sanayisi Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_kimya_sanayisi_haritasi.png',
      imageCaption: 'Şekil 8.4: Türkiye Petrol Rafinerileri, Petrokimya, Gübre ve Kimya Sanayisi Haritası',
      leadText: 'Petrol rafinasyonu, petrokimya, yapay gübre, boya ve ilaç sanayisi tesisleri:',
      bulletPoints: [
        'Petrol Rafinerileri: Batman (Hammadde yanı), İzmit İpraş (Liman ve sanayi pazarı), İzmir Aliağa (Liman/Ulaşım), Kırıkkale Orta Anadolu (İç bölge güvenliği/dağıtımı).',
        'Petrokimya: Aliağa (Petkim) ve İzmit (Tüpraş) tesisleri.',
        'Yapay Gübre: Mersin, Bandırma, İskenderun, Kocaeli, Kütahya.',
        'İlaç ve Boya Sanayisi: İstanbul ve Kocaeli (Gebze) kimya vadisinde yoğunlaşmıştır.'
      ],
      goldenRule: 'BATMAN HAMMADDEYE, DİĞER RAFİNERİLER LİMANA BAĞLIDIR: Batman rafinerisi hariç tüm rafinerilerimiz petrolü deniz yoluyla ithal eder.',
      osymTrap: 'ÖSYM TUZAĞI: Mersin ATAŞ rafinerisi artık petrol arıtmamakta; sadece petrol depolama ve lojistik terminali olarak çalışmaktadır.'
    ),
    LectureSection(
      title: 'Türkiye Taş, Toprak, Seramik ve Çimento Sanayisi Haritası',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_tas_toprak_cimento_sanayisi_haritasi.png',
      imageCaption: 'Şekil 8.5: Türkiye Taş, Toprak, Tuğla, Cam, Seramik ve Çimento Tesisleri Haritası',
      leadText: 'Hammaddesini doğrudan kayaçlar, killer, kumlar ve kireçtaşından alan sanayi koludur:',
      bulletPoints: [
        'Çimento Sanayisi: Hammaddesi kireçtaşı ve kil olduğu için 7 coğrafi bölgenin tamamında kurulmuştur.',
        'Seramik ve Porselen: Kütahya, Bilecik (Bozüyük, Söğüt), Çanakkale (Çan), İzmir.',
        'Cam Sanayisi: İstanbul, Kocaeli, Kırklareli, Mersin, Ankara (silisli kum hammadde kaynağına yakınlık).',
        'Tuğla ve Kiremit: Manisa (Turgutlu), Uşak, Çorum, Eskişehir, Tokat.'
      ],
      goldenRule: 'ÇİMENTO EN YAYGIN SANAYİDİR: Ağır ve taşıma maliyeti yüksek olduğu için her bölgede yerel olarak üretilir.',
      osymTrap: 'ÖSYM TUZAĞI: Çimento fabrikalarının her yerde olması o yörenin geliştiğini değil; hammaddenin her yerde bol olduğunu gösterir.'
    ),
    LectureSection(
      title: 'Türkiye Makine, Ulaşım Araçları ve Otomotiv Sanayisi Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_makine_otomotiv_sanayisi_haritasi.png',
      imageCaption: 'Şekil 8.6: Türkiye Otomotiv, Raylı Sistemler, Savunma ve Makine Sanayisi Haritası',
      leadText: 'Türkiye ihracatının lokomotifi olan ileri teknoloji, montaj ve motor sanayisi tesisleri:',
      bulletPoints: [
        'Otomotiv Sanayisi: Bursa (Renault, Tofaş), Kocaeli (Ford, Hyundai), Sakarya (Toyota, Otokar), İzmir, Aksaray (Mercedes kamyon), Bursa Gemlik (TOGG).',
        'Lokomotif ve Vagon (Raylı Sistemler): Eskişehir (TÜRASAŞ lokomotif), Adapazarı (vagon), Sivas (demiryolu makinaları).',
        'Uçak ve Savunma Sanayisi: Ankara (TUSAŞ/TAI, ASELSAN, ROKETSAN, HAVELSAN), Eskişehir (uçak motoru TEI).',
        'Gemi İnşaatı ve Tersaneler: İstanbul (Tuzla) ve Yalova (Altınova).'
      ],
      goldenRule: 'İHRACAT ŞAMPİYONU OTOMOTİVDİR: Türkiye\'nin dış ticaretinde en çok döviz kazandıran sektör motorlu kara taşıtlarıdır.',
      osymTrap: 'ÖSYM TUZAĞI: Eskişehir ve Adapazarı raylı sistemler sanayisinde ÖSYM\'nin en sık sorduğu merkezlerdir.'
    ),
    LectureSection(
      title: 'Türkiye\'de Ticaret, Dış Ticaret Dengesi ve Serbest Bölgeler',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye\'nin iç ticaret hacmi yer şekilleri, iklim çeşitliliği, bölgeler arası ürün farklılıkları ve sanayi dağılımı sayesinde son derece dinamiktir:',
      comparisonRows: [
        ComparisonRow(
          correct: 'En Çok İhraç Ettiğimiz (Sattığımız) Ürünler',
          wrong: '1) Motorlu kara taşıtları ve otomotiv parçaları (1. Sırada)\n2) Kazanlar, makineler ve mekanik cihazlar\n3) Demir-çelik ve metal eşyalar\n4) Tekstil, hazır giyim ve konfeksiyon ürünleri\n5) Elektrikli teçhizat ve beyaz eşya\n6) Tarım ve gıda: Fındık, incir, kayısı, narenciye\n7) Maden: Mermer, bor, krom.',
          note: 'İhracatımızın %93\'ten fazlası SANAYİ ürünleridir.'
        ),
        ComparisonRow(
          correct: 'En Çok İthal Ettiğimiz (Aldığımız) Ürünler',
          wrong: '1) Mineral yakıtlar, petrol ve doğalgaz (Açık ara 1. sırada)\n2) Kazanlar, makineler ve yüksek teknoloji aletleri\n3) Elektrikli ve elektronik cihazlar\n4) Kıymetli taşlar ve altın\n5) Motorlu taşıtlar (lüks araçlar)\n6) Plastik ve kimyasal hammaddeler\n7) Eczacılık ürünleri ve tıbbi cihazlar.',
          note: 'Enerji faturası dış ticaret açığımızın ana sebebidir.'
        ),
        ComparisonRow(
          correct: 'En Çok Ticaret Yaptığımız Ülkeler',
          wrong: 'En Çok İhracat Yaptığımız Ülke: ALMANYA (1. Sırada), ardından ABD, İngiltere, İtalya, Irak gelir.\nEn Çok İthalat Yaptığımız Ülkeler: RUSYA ve ÇİN (Enerji ve sanayi ürünleri), ardından Almanya, İtalya ve ABD gelir.',
          note: 'Almanya en büyük ihracat ortağımızdır.'
        ),
        ComparisonRow(
          correct: 'Dış Ticaret Açığı ve Serbest Bölgeler',
          wrong: 'Dış Ticaret Açığı: İthalat giderlerinin ihracat gelirlerinden fazla olması durumudur (Türkiye\'de enerji ithalatı yüzünden açık kroniktir).\nSerbest Bölgeler: Ülke sınırları içinde olan ancak gümrük hattı dışında sayılan, vergi muafiyeti tanınan ticaret sahalarıdır. İlk serbest bölge 1987\'de MERSİN\'de kurulmuştur (İstanbul, İzmir, Ege, Antalya, Trabzon, Gaziantep).',
          note: 'Dış ticaret açığı turizm gelirleriyle dengelenmeye çalışılır.'
        ),
      ],
      goldenRule: 'DIŞ TİCARET AÇIĞININ 1 NUMARALI SEBEBİ ENERJİDİR: Türkiye\'nin ithalatında en büyük harcama kalemi fosil yakıtlardır (petrol ve doğalgaz). Enerjide dışa bağımlılık azaldıkça dış ticaret açığı da azalacaktır.',
      osymTrap: 'ÖSYM TUZAĞI: Türkiye\'nin ihraç ettiği ürünlerin ezici çoğunluğu (%93+) SANAYİ ÜRÜNÜDÜR! "Türkiye tarım ülkesidir, sadece tarım ürünü ihraç eder" düşüncesi sınavdaki en büyük yanılgıdır.'
    ),
    LectureSection(
      title: 'Türkiye Sanayi Tesisleri ve Demir-Çelik Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin ağır sanayi tesisleri, otomotiv merkezleri ve serbest bölgeleri harita üzerinde analiz edilmiştir.',
      mapData: LectureMapData(
        title: 'TÜRKİYE SANAYİ VE TİCARET ALTYAPISI HARİTASI',
        subtitle: 'Ağır Sanayi Tesisleri, Petrol Rafinerileri, Otomotiv Kümelenmeleri ve Sanayi Bölgeleri',
        mapId: 'cografya_sanayi_tesisleri_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_sanayi_tesisleri.jpg',
        mapSource: 'cografyaharita.com - Türkiye Sanayi Tesisleri Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🏭', label: 'Demir-Çelik Fabrikaları', description: 'Karabük (KARDEMİR - Enerji kaynağına yakınlık), Ereğli (ERDEMİR - Enerji ve Liman), İskenderun (İSDEMİR - Liman/Ulaşım), Kırıkkale, Sivas, İzmir.'),
          MapLegendItem(symbol: '🛢️', label: 'Petrol Rafinerileri', description: 'Batman (Hammaddeye yakın), İzmit/İpraş (Pazar ve Liman), İzmir/Aliağa (Liman/Ulaşım), Kırıkkale/Orta Anadolu (İç bölge tüketimi/Güvenlik).'),
          MapLegendItem(symbol: '🚗', label: 'Otomotiv ve Yan Sanayi', description: 'Bursa (Oyak Renault, Tofaş), Kocaeli (Ford Otosan, Hyundai), Sakarya (Toyota, Otokar), İzmir, Aksaray (Mercedes kamyon).'),
          MapLegendItem(symbol: '✈️', label: 'Savunma ve Havacılık Sanayii', description: 'Ankara (TAI/TUSAŞ, ASELSAN, ROKETSAN, HAVELSAN), Eskişehir (TUSAŞ Motor Sanayii - TEI), Kırıkkale (MKE Silah Sanayii).'),
          MapLegendItem(symbol: '🚢', label: 'Gemi İnşa ve Tersaneler', description: 'İstanbul (Tuzla), Yalova (Altınova tersaneler bölgesi).')
        ],
        points: [
          MapFrontItem(
            name: 'Karabük & Ereğli Demir-Çelik (KARDEMİR & ERDEMİR)',
            category: 'Enerji Kaynağına Yakınlık',
            commander: 'Batı Karadeniz / Karabük - Zonguldak',
            keyEvent: 'Demir madeni burada çıkmamasına rağmen fabrikanın burada kurulmasının tek sebebi Zonguldak taşkömürü yataklarına (yüksek ısı enerjisine) yakın olmaktır.',
            outcome: 'ÖSYM Klasik Soru: Karabük ve Ereğli\'de demir-çelik fabrikasının kurulma nedeni ENERJİ KAYNAĞINA YAKINLIKTIR.'
          ),
          MapFrontItem(
            name: 'İskenderun Demir-Çelik (İSDEMİR)',
            category: 'Ulaşım ve Liman Kolaylığı',
            commander: 'Akdeniz / Hatay (İskenderun)',
            keyEvent: 'Ne demir madeni ne de taşkömürü çıkar. Kuruluş nedeni geniş hinterlantlı doğal limanı, deniz ulaşımı ve ithal kömür/cevherin kolay tahliyesidir.',
            outcome: 'ÖSYM Çıkmış Soru: İskenderun Demir-Çelik tesisinin kuruluş faktörü ULAŞIM VE LİMAN OLANAKLARIDIR.'
          ),
          MapFrontItem(
            name: 'Batman Petrol Rafinerisi',
            category: 'Hammaddeye Yakınlık',
            commander: 'Güneydoğu Anadolu / Batman',
            keyEvent: 'Türkiye\'de yerli petrol yataklarının (Raman, Garzan) hemen başında kurulmuş tek hammaddeye doğrudan bağlı rafinerimizdir.',
            outcome: 'ÖSYM Sorusu: Kuruluşunda hammaddeye yakınlığın esas alındığı rafineri Batman Rafinerisi\'dir.'
          ),
          MapFrontItem(
            name: 'Bursa & Kocaeli Otomotiv Havzası',
            category: 'İhracat Şampiyonu Sektör',
            commander: 'Güney Marmara - Doğu Marmara',
            keyEvent: 'Türkiye\'nin ihracatında yıllardır 1. sırada yer alan otomotiv ve yan sanayinin ana üssüdür. Kalifiye iş gücü, limanlara yakınlık ve pazar hacmi ile devleşmiştir.',
            outcome: 'ÖSYM Püf Noktası: Türkiye ihracatında sektör lideri motorlu kara taşıtları (otomotiv) sektörüdür.'
          )
        ],
        historicalNote: '📌 ÖSYM SANAYİ KURULUŞ YERİ SEÇİMİ FORMÜLLERİ:\n'
            '1. Hammaddeye Yakınlık: Şeker fabrikaları (çabuk bozulur), Çay fabrikaları (Rize), Konserve-Salça (Güney Marmara/Ege), Batman Rafinerisi, Kağıt fabrikaları (orman kıyıları).\n'
            '2. Enerji Kaynağına Yakınlık: Karabük ve Ereğli Demir-Çelik (taşkömürü).\n'
            '3. Pazar Alanına Yakınlık: İstanbul, Ankara, İzmir çevresindeki gıda, tekstil, unlu mamul tesisleri.\n'
            '4. Ulaşım ve Liman: İzmit İpraş ve Aliağa rafinerileri, İskenderun Demir-Çelik fabrikası, Samsun Bakır İşletmesi.'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Sanayi ve Ticaret',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Karabük ve Ereğli Demir-Çelik fabrikalarının kuruluş yeri seçiminde aşağıdakilerden hangisi belirleyici olmuştur?',
          options: [
            'A) Bölgede zengin demir yataklarının bulunması',
            'B) Tüketim pazarına ve başkente yakın olması',
            'C) Taş kömürüne (enerji kaynağına) yakınlık',
            'D) Geniş tarım alanlarına sahip olması',
            'E) Akarsu taşkınlarından uzak olması'
          ],
          correctIndex: 2,
          explanation: 'Karabük ve Ereğli\'de demir madeni çıkmaz; demir Sivas ve Malatya\'dan getirilir. Fabrikaların oraya kurulmasının tek sebebi Zonguldak taş kömürüne (enerji kaynağına) yakınlıktır.',
          ruleTag: 'Sanayide Kuruluş Yeri Seçimi'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu8 = konu8SanayiTicaret;
