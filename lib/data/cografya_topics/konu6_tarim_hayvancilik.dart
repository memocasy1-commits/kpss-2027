// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu6TarimHayvancilik = LectureTopic(
  id: 'cografya_tarim_hayvancilik',
  courseId: 'cografya',
  order: 6,
  title: 'Türkiye\'de Tarım, Hayvancılık ve Ormancılık',
  subtitle: 'Tarımsal Ürünler, Ekim Alanları, Hayvancılık Kolları ve Orman Varlığı',
  icon: Icons.agriculture_rounded,
  color: const Color(0xFF16A34A),
  testRange: 'Test 51 - 60',
  startTestNum: 51,
  endTestNum: 60,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'de Tarımı Etkileyen Faktörler ve Tarımsal Yöntemler',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'de tarımsal verimliliği ve üretimi belirleyen en önemli faktör SULAMADIR. Sulama sorununun çözüldüğü alanlarda nadas ihtiyacı ortadan kalkar, ürün çeşitliliği ve verim katlanarak artar, iklime bağımlılık sona erer ve yılda birden fazla ürün alınabilir.',
      bulletPoints: [
        'Sulamanın Tarıma Etkileri: Üretimde yıldan yıla görülen dalgalanmalar (iklime bağımlılık) sona erer. Nadas (toprağı dinlendirmek için boş bırakma) alanları azalır. Endüstri bitkilerinin (pamuk, mısır, ayçiçeği, sebze) ekim alanı genişler.',
        'Gübreleme ve Tohum Islahı: Toprağın kaybettiği mineralleri geri kazandırmak için kimyasal ve organik gübreleme şarttır. Yüksek verimli sertifikalı tohumlar (tohum ıslahı) birim alandan alınan verimi artırır.',
        'Makineleşme: Tarımda makineleşme hasat süresini kısaltır ve verimi artırır. Ancak engebeli dağlık alanlarda (Doğu Karadeniz, Menteşe Yöresi, Hakkari) makine kullanımı zordur; buralarda insan ve hayvan gücüne bağımlılık sürer. Düzlüklerde ise makineleşme kırsaldan kente işsizlik göçünü hızlandırır.',
        'İntansif (Modern/Gelişmiş) Tarım: Sulama, gübreleme, ilaçlama ve makinenin en üst düzeyde kullanıldığı yöntemdir. Birim alandan alınan verim çok yüksektir, iklime bağımlılık yoktur (Kıyı Ege, Akdeniz, Marmara).',
        'Ekstansif (Kaba/Geleneksel) Tarım: İklime, yağışa ve doğal şartlara bağımlı ilkel yöntemdir. Üretimde dalgalanma fazladır, nadas yaygındır (İç Anadolu ve Doğu Anadolu).'
      ],
      goldenRule: 'NADASIN TEK NEDENİ SU YETERSİZLİĞİDİR: Nadas; toprağın su ve mineral depolaması için bir yıl ekilip bir yıl boş bırakılmasıdır. Sulama yapıldığı anda nadasa gerek kalmaz; yerini nöbetleşe ekim (münavebe) alır.',
      osymTrap: 'ÖSYM TUZAĞI: Doğu Karadeniz ve Menteşe Yöresi\'nde tarımda makineleşmenin yetersiz olmasının sebebi sermaye eksikliği DEĞİL; yer şekillerinin aşırı engebeli ve dağlık olmasıdır!'
    ),
    LectureSection(
      title: 'Türkiye\'nin Başlıca Tarım Ürünleri ve Coğrafi Dağılışı',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye, üç farklı iklim kuşağının etkisi altında çok zengin bir ürün çeşitliliğine sahiptir:',
      comparisonRows: [
        ComparisonRow(
          correct: 'Tahıllar ve Baklagiller',
          wrong: '• Buğday ve Arpa: İlkbaharda yağış, yazın kuraklık ister. En çok İç Anadolu ve Güneydoğu\'da üretilir. Karadeniz kıyısında yaz yağışları nedeniyle YETİŞMEZ.\n• Mısır: Bol su ister. Doğal olarak Karadeniz\'de; ticari olarak ise sulamayla en çok Akdeniz (Çukurova) ve Konya Ovası\'nda üretilir.\n• Çeltik (Pirinç): Bol su ve bataklık ister. Akarsu boylarında üretilir (Meriç-Edirne 1. sırada, Ergene, Samsun Terme/Çarşamba). Sivrisinek/sıtma nedeniyle devlet kontrolündedir.\n• Kırmızı Mercimek: Kuraklığa en dayanıklıdır; Güneydoğu Anadolu (Şanlıurfa, Diyarbakır) 1. sıradadır.\n• Yeşil Mercimek ve Nohut: En çok İç Anadolu\'da üretilir.',
          note: 'Tahıllar kuraklık sever, çeltik ve mısır bol su ister.'
        ),
        ComparisonRow(
          correct: 'Sanayi ve Yağ Bitkileri',
          wrong: '• Pamuk: Büyüme döneminde su, olgunlaşma döneminde kavurucu sıcak ister. GAP ile 1. sıra Güneydoğu Anadolu\'ya (Şanlıurfa) geçmiştir; Çukurova, Ege ve mikroklima olarak Iğdır\'da üretilir. Karadeniz\'de yaz yağışları yüzünden yetişmez.\n• Tütün: Kalite kontrolü nedeniyle ekimi devlet kontrolündedir. En çok Ege\'de (Manisa, Denizli) ve Karadeniz, Adıyaman\'da üretilir.\n• Şeker Pancarı: Fabrikaya çabuk ulaştırılması gerektiği için fabrikalar ekim alanının yanına kurulur. En çok İç Anadolu\'da üretilir. Kıyı kesimlerde ekonomik getirisi daha yüksek ürünler tercih edildiği için ekilmez.\n• Çay: Yıl boyu bol nem ve asitli toprak ister. Sadece Doğu Karadeniz kıyısında (Rize %85, Trabzon, Artvin) yetişir. Mikroklima ve monokültür ürünüdür.\n• Haşhaş ve Kenevir: Uyuşturucu yapımı riski nedeniyle tamamen devlet denetimindedir (Haşhaş Afyonkarahisar, Kenevir Samsun).\n• Ayçiçeği: En çok Trakya/Ergene Havzası\'nda (Tekirdağ, Edirne) üretilir.\n• Zeytin: Tipik Akdeniz iklim ürünüdür. En çok Ege (sofralık ve yağlık), Güney Marmara ve Akdeniz\'de yetiştirilir. Bir yıl bol ürün verir, ertesi yıl dinlenir (periyodisite).',
          note: 'Devlet kontrolünde olanlar: Pirinç, tütün, haşhaş, kenevir, şeker pancarı (kota).'
        ),
        ComparisonRow(
          correct: 'Meyvecilik ve Endemik Ürünler',
          wrong: '• Fındık: Nemli ılıman iklim ister. Dünya üretiminin yaklaşık %70\'i Türkiye\'dedir (Ordu, Giresun, Trabzon, Düzce, Sakarya).\n• İncir: Kış ılımanlığı ister, don olayına dayanamaz. Dünya birincisiyiz; %80\'i Ege\'de (Aydın ve İzmir) üretilir.\n• Üzüm: Soğuğa çok dayanıklıdır, Türkiye\'nin hemen her yerinde yetişir. Kuru üzüm ihracatında Ege (Manisa) liderdir.\n• Elma: Soğuğa en dayanıklı meyvedir. Isparta, Niğde ve Karaman önde gelir.\n• Turunçgiller (Narenciye): Kış ılımanlığı şarttır. Üretimin %80\'den fazlası Akdeniz kıyılarında (Çukurova, Antalya) yapılır; Rize kıyısında fön rüzgarıyla mikroklima olarak yetişir.\n• Muz: Tropikal meyvedir. Yalnızca Antalya-Anamur (Mersin) kıyı mikroklimasında yetişir.',
          note: 'Dünya lideri olduğumuz ürünler: Fındık, kuru incir, kuru üzüm, kuru kayısı (Malatya).'
        ),
      ],
      goldenRule: 'DEVLET KONTROLÜNDEKİ ÜRÜNLERİN SEBEPLERİ: Çeltik (Sıtma hastalığı - sağlık), Haşhaş ve Kenevir (Uyuşturucu - güvenlik), Tütün (Kalite koruma), Şeker Pancarı (Kota ve çabuk bozulma).',
      osymTrap: 'ÖSYM TUZAĞI: Şeker pancarının kıyılarda yetiştirilmemesinin sebebi iklim DEĞİLDİR! Kıyılarda çiftçilerin pamuk, mısır, sebze ve narenciye gibi geliri çok daha yüksek ürünleri tercih etmesidir.'
    ),
    LectureSection(
      title: 'Türkiye\'de Hayvancılık Faaliyetleri ve Dağılışı',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'de hayvan sayısı fazla olmasına rağmen birim hayvandan alınan et ve süt verimi düşüktür. Bunun temel sebebi yerli ırkların yaygın olması ve mera hayvancılığının ağırlıkta olmasıdır:',
      bulletPoints: [
        'Küçükbaş Hayvancılık (Koyun): Bozkır (step) bitki örtüsünün yaygın olduğu İç Anadolu, Güneydoğu Anadolu ve Doğu Anadolu düzlüklerinde en yaygın hayvancılık türüdür. En çok koyun Van, Konya ve Şanlıurfa\'dadır.',
        'Kıl Keçisi: Dağlık, engebeli ve kayalık arazilerde maki ve çalılarla beslenir. En çok Akdeniz\'de Toros Dağları, Teke ve Taşeli Platolarında (Mersin, Antalya) yetiştirilir. Ormanlara zarar verdiği için devlet kontrolündedir.',
        'Tiftik Keçisi (Ankara Keçisi): Yünü (tiftik) çok değerlidir. İç Anadolu\'da (Ankara ve Siirt) yetiştirilir.',
        'Büyükbaş Hayvancılık (Sığır / Manda):',
        '• Mera Hayvancılığı: Yaz yağışlarıyla yeşeren gür Alpin çayırların bulunduğu Erzurum-Kars-Ardahan platosu ve Doğu Karadeniz yaylalarında yapılır. İklime ve ot verimine bağlı olduğu için et-süt üretiminde dalgalanma görülür.\n• Ahır / Besi Hayvancılığı: Tüketici nüfusun yoğun olduğu büyük şehirlerin çevrelerinde (Marmara, Ege, İç Anadolu) modern yöntemlerle yapılır. İklimden etkilenmez, et ve süt verimi çok yüksektir.',
        'Kümes Hayvancılığı: Beyaz et ve yumurta üretimidir. İklimden kesinlikle ETKİLENMEZ. Tüketim merkezlerine (büyük kentlere) yakın yerlerde kurulur (Manisa, Bolu, Balıkesir, Sakarya).',
        'Arıcılık: Zengin bitki örtüsü ve dağlık-engebeli doğanın bulunduğu yerlerde yaygındır: Muğla (Çam balı), Rize Anzer (Endemik çiçek balı), Ordu, Kars, Hakkari.',
        'İpek Böcekçiliği: Dut yaprağı ile beslenir. Son yıllarda yapay ipek nedeniyle gerilese de Diyarbakır, Antalya, Ankara ve Bursa\'da sürdürülmektedir.',
        'Balıkçılık: Deniz balıkçılığında Karadeniz %70 payla açık ara 1. sıradadır (oksijen ve plankton bolluğu). Kültür (çiftlik) balıkçılığı ise Ege koylarında (Muğla, İzmir) yaygındır.'
      ],
      goldenRule: 'HAYVANCILIKTA VERİMİ ARTIRMANIN YOLLARI: Yerli ırklar ıslah edilmeli (kültür ırklarına geçilmeli), mera hayvancılığı yerine ahır/besi hayvancılığı yaygınlaştırılmalı, erken kesimler (kuzu/dana) önlenmeli, yem sanayisi geliştirilmelidir.',
      osymTrap: 'ÖSYM TUZAĞI: Kümes hayvancılığının Marmara ve Ege\'de yoğunlaşmasının sebebi iklim veya hammadde DEĞİLDİR; sadece ve sadece büyük kentlerin PAZARLAMA (tüketim) imkanıdır!'
    ),
    LectureSection(
      title: 'Türkiye\'nin Orman Varlığı ve Orman Ürünleri',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin yaklaşık %29-30\'u ormanlarla kaplıdır. Ormanların coğrafi dağılışında yağış ve nem temel belirleyicidir:',
      bulletPoints: [
        'Bölgelere Göre Orman Oranları: Karadeniz (%25), Akdeniz (%24), Ege (%17), Marmara (%13), Doğu Anadolu (%11), İç Anadolu (%7), Güneydoğu Anadolu (%3).',
        'İllere Göre Orman Varlığı: Orman alanı en fazla olan il ANTALYA\'dır; yüz ölçümüne oranla en ormanlık il ise KARABÜK\'tür.',
        'Ağaç Türleri Dağılımı: İğne yapraklılarda en yaygın olanlar Kızılçam (Akdeniz-Ege), Karaçam ve Sarıçam (yüksek soğuk alanlar); geniş yapraklılarda ise Meşe (Türkiye geneli en yaygın ağaç) ve Kayın (Karadeniz)\'dır.',
        'Ormanların Faydaları: Kereste, kağıt, mobilya, reçine, defne yaprağı ve sığla yağı (Muğla Köyceğiz\'e özgü endemik) gibi ekonomik değerlerin yanında; erozyonu ve taşkınları önleme, oksijen üretme ve su kaynaklarını düzenleme işlevi görür.'
      ],
      goldenRule: 'TÜRKİYE\'NİN EN YAYGIN AĞACI MEŞEDİR: Her iklime ve kuraklığa uyum sağlayabildiği için Türkiye\'de en yaygın ağaç türü meşedir. Akdeniz\'in en karakteristik ağacı ise kızılçamdır.',
      osymTrap: 'ÖSYM TUZAĞI: Orman alanının en çok olduğu il KARABÜK DEĞİL, ANTALYA\'dır! Karabük orman oranı (%71 ile) en yüksek olan ildir; toplam orman alanı en geniş il ise yüz ölçümünün büyüklüğü sayesinde Antalya\'dır.'
    ),
    LectureSection(
      title: 'Türkiye Tarım Alanları ve Hayvancılık Dağılım Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin tarımsal üretim havzaları, mera alanları ve hayvancılık merkezleri harita üzerinde analiz edilmiştir.',
            mapData: LectureMapData(
        title: 'TÜRKİYE TARIM ALANLARI, ÜRÜN DAĞILIŞI VE HAYVANCILIK HARİTASI',
        subtitle: 'ÖSYM Çıkmış Soru Referanslı İntansif Tarım Havzaları, Monokültür Alanlar ve Hayvancılık Kuşakları',
        mapId: 'cografya_tarim_alanlari_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_tarim_alanlari.jpg',
        mapSource: 'cografyaharita.com - Türkiye Tarım Alanları Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🌾', label: 'Tahıl ve Baklagil Havzaları', description: 'Konya Ovası, Şanlıurfa-Diyarbakır ovaları, Ergene Havzası. Yaz kuraklığı isteyen buğday, arpa, kırmızı mercimek ve nohut üretimi hakimdir.'),
          MapLegendItem(symbol: '🍃', label: 'Özel İklim İsteyen Sanayi Bitkileri', description: 'Çay (Doğu Karadeniz - yıkanmış asidik toprak), Fındık (Karadeniz kıyıları), Pamuk (GAP / Şanlıurfa, Çukurova, Ege grabenleri), Şeker Pancarı (İç Anadolu - kıyılarda ekonomik değeri yüksek ürünler ekilir).'),
          MapLegendItem(symbol: '🫒', label: 'Akdeniz İklimi Ürünleri', description: 'Zeytin (Ege, Güney Marmara, Akdeniz), İncir (Aydın / B. Menderes), Turunçgiller (Akdeniz kıyı şeridi), Muz (Anamur-Alanya-Gazipaşa).'),
          MapLegendItem(symbol: '🐄', label: 'Büyükbaş Mera Hayvancılığı', description: 'Erzurum-Kars-Ardahan platosu ve Doğu Karadeniz yaylaları. Yaz yağışları ile yeşeren gür Alpin çayırlar et ve süt sığırcılığını destekler.'),
          MapLegendItem(symbol: '🐑', label: 'Küçükbaş Bozkır Hayvancılığı', description: 'Koyun: İç Anadolu, Doğu Anadolu. Kıl Keçisi: Akdeniz Toros kuşağı (çalılık ve sarp yamaçlar). Tiftik (Ankara) Keçisi: Ankara, Siirt.'),
          MapLegendItem(symbol: '🐝', label: 'Arıcılık ve İpek Böcekçiliği', description: 'Arıcılık: Muğla (çam balı), Ordu-Rize (kestane/çiçek balı), Hakkari, Kars. İpek Böceği: Diyarbakır (1. sırada), Antalya, Bursa.')
        ],
        points: [
          MapFrontItem(
            name: 'Konya Kapalı Havzası (Türkiye\'nin Tahıl Ambarı)',
            category: 'Tahıl ve Şeker Pancarı Merkezi',
            commander: 'İç Anadolu / Konya - Aksaray - Karaman',
            keyEvent: 'Türkiye buğday, arpa ve şeker pancarı üretiminde 1. sıradadır. Mavi Tünel (KOP projesi) ile Göksu Nehri\'nin suları ovaya akıtılarak sulu tarım yaygınlaştırılmıştır.',
            outcome: 'ÖSYM Çıkmış Soru: Türkiye\'de buğday ve şeker pancarı üretiminde ilk sırada yer alan merkez Konya\'dır.'
          ),
          MapFrontItem(
            name: 'Doğu Karadeniz (Rize - Trabzon - Artvin)',
            category: 'Çay ve Fındık Monokültürü',
            commander: 'Karadeniz / Rize (Çay) - Ordu/Giresun (Fındık)',
            keyEvent: 'Çay Türkiye\'de sadece Doğu Karadeniz\'de yetişir (%100 monokültür). Fındık üretiminin ise yaklaşık %80\'i Karadeniz sahil şeridinde toplanmıştır.',
            outcome: 'ÖSYM Püf Noktası: Çay mikroklima ve yıkanmış kireçsiz toprak istediği için üretim alanı en dar olan tarım ürünlerimizdendir.'
          ),
          MapFrontItem(
            name: 'Şanlıurfa ve GAP Ovaları',
            category: 'Pamuk ve Kırmızı Mercimek Lideri',
            commander: 'Güneydoğu Anadolu / Harran ve Ceylanpınar',
            keyEvent: 'GAP sulama kanallarının devreye girmesiyle birlikte pamuk üretiminde Ege ve Çukurova\'yı geride bırakarak Türkiye pamuğunun %55\'inden fazlasını tek başına üretmeye başlamıştır.',
            outcome: 'ÖSYM Çıkmış Soru: GAP projesi sonrası Şanlıurfa pamuk ve kırmızı mercimek üretiminde Türkiye birincisi olmuştur.'
          ),
          MapFrontItem(
            name: 'Erzurum - Kars - Ardahan Platosu',
            category: 'Mera Sığırcılığı ve Çernozyom',
            commander: 'Kuzeydoğu Anadolu / Erzurum - Kars',
            keyEvent: 'Yaz yağışlarıyla kurulamayan yüksek boylu çayırlar üzerinde et ve süt kombinalarına dayalı büyükbaş sığırcılık yapılır. Manda varlığında da Samsun ve Diyarbakır ile yarışır.',
            outcome: 'ÖSYM Sorusu: Yaz yağışları -> Gür çayır -> Büyükbaş mera hayvancılığı bağlantısı doğrudan Erzurum-Kars\'ı işaret eder.'
          ),
          MapFrontItem(
            name: 'Muğla Yöresi (Menteşe Dağları)',
            category: 'Çam Balı ve Arıcılık Lideri',
            commander: 'Ege / Muğla',
            keyEvent: 'Kızılçam ormanlarındaki basra böceği salgısıyla dünyaca ünlü çam balının %80\'den fazlası Muğla ve ilçelerinde (Marmaris, Köyceğiz, Milas) üretilir.',
            outcome: 'ÖSYM Soru Tuzağı: Türkiye bal üretiminde Muğla ve Ordu başı çeker; çam balında lider Muğla\'dır.'
          )
        ],
        historicalNote: '📌 ÖSYM TARIM VE HAYVANCILIKTA DEVLET KONTROLÜNDEKİ ÜRÜNLER:\n'
            '1. Pirinç (Çeltik): Sıtma hastalığına yol açan sivrisinek üremesi nedeniyle yerleşim yerleri çevresinde izne bağlıdır.\n'
            '2. Tütün: Kaliteyi korumak ve aşırı üretimi engellemek için devlet kotası uygulanır.\n'
            '3. Haşhaş: Uyuşturucu yapımında kullanıldığı için BM denetiminde ve TMO kontrolünde (Afyon, Denizli, Kütahya) üretilir.\n'
            '4. Kenevir: Uyuşturucu üretimi riskine karşı kontrollü ekilir (Samsun Vezirköprü ana merkezdir).\n'
            '5. Şeker Pancarı: Fabrikaların işleme kapasitesi ve çabuk bozulması nedeniyle kotalı sözleşmeli tarımla üretilir.'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Tarım ve Hayvancılık',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Türkiye\'de şeker pancarı ekiminin Ege ve Akdeniz kıyılarında yapılmamasının temel gerekçesi aşağıdakilerden hangisidir?',
          options: [
            'A) Kıyıların ikliminin şeker pancarına uygun olmaması',
            'B) Şeker pancarının don olaylarına dayanamaması',
            'C) Kıyı ovalarında ekonomik getirisi çok daha yüksek sanayi ve narenciye ürünlerinin tercih edilmesi',
            'D) Kıyılarda şeker fabrikası kurmanın yasak olması',
            'E) Sulama imkanlarının kıyılarda yetersiz olması'
          ],
          correctIndex: 2,
          explanation: 'Şeker pancarı kıyılarda çok rahat yetişebilir; ancak çiftçiler mısır, pamuk, sebze ve narenciye gibi çok daha yüksek gelir getiren ürünleri tercih ettikleri için şeker pancarı ekmezler.',
          ruleTag: 'Tarımsal Tercih ve Gelir'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu6 = konu6TarimHayvancilik;
