// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu7MadenlerEnerji = LectureTopic(
  id: 'cografya_madenler_enerji',
  courseId: 'cografya',
  order: 7,
  title: 'Türkiye\'de Madenler ve Enerji Kaynakları',
  subtitle: 'Metalik Madenler, Bor ve Mermer Rezervleri, Termik, Hidroelektrik, Jeotermal ve Yenilenebilir Enerji',
  icon: Icons.flash_on_rounded,
  color: const Color(0xFFEAB308),
  testRange: 'Test 61 - 70',
  startTestNum: 61,
  endTestNum: 70,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'de Madenciliğin Genel Özellikleri ve Metalik Madenler',
      type: LectureSectionType.overview,
      leadText: 'Türkiye; farklı jeolojik dönemlerde oluşması, orojenez ve volkanizma geçirmiş olması nedeniyle dünyada MADEN ÇEŞİTLİLİĞİ en zengin ülkelerden biridir. En fazla maden çeşidi ve rezervi DOĞU ANADOLU BÖLGESİ\'NDE (özellikle Yukarı Fırat Bölümü - Elazığ, Malatya) yer alır.',
      bulletPoints: [
        'Madencilik Terimleri: Yeraltından çıkarılan işlenmemiş taşlı-topraklı madene TUVENAN denir. Maden içindeki saf metal oranına TENÖR denir. Yeraltındaki toplam maden miktarına ise REZERV denir.',
        'Demir: Ağır sanayinin temel hammaddesidir. En önemli yataklar: Sivas (Divriği, Kangal), Malatya (Hekimhan, Hasançelebi), Sakarya (Çamdağı), Balıkesir (Eymir). İşlendiği yerler: Karabük, Ereğli ve İskenderun Demir-Çelik fabrikaları.',
        'Bakır: İletkenliği yüksek olduğu için elektrik ve elektronikte kullanılır. Yataklar: Artvin (Murgul), Kastamonu (Küre), Elazığ (Maden), Rize (Çayeli). İşlendiği yerler: Samsun Bakır İşletmesi (Liman ve ulaşım avantajı) ve Artvin Murgul (Hammaddeye yakınlık).',
        'Krom: Çeliği sertleştirmek ve paslanmaz çelik üretmek için kullanılır. Dünya rezervinde önemli paya sahibiz ve ihraç ederiz. Yataklar: Elazığ (Guleman - En zengin), Muğla (Fethiye, Köyceğiz), Erzincan (Kop Dağı), Bursa (Orhaneli). İşlendiği yerler: Elazığ ve Antalya Ferrokrom Tesisleri.',
        'Boksit (Alüminyum): Hafif ve dayanıklı bir metaldir, uçak ve otomotiv sanayisinde kullanılır. Yataklar: Konya (Seydişehir) ve Antalya (Akseki). İşlendiği yer: Konya Seydişehir Alüminyum Tesisleri.',
        'Bor Mineralleri: Jet ve roket yakıtı, cam elyafı, deterjan, savunma sanayisinde kullanılır. Dünya toplam bor rezervinin yaklaşık %73\'ü Türkiye\'dedir. Yataklar: Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa), Kütahya (Emet), Eskişehir (Seyitgazi/Kırka). İşlendiği yerler: Bandırma Bor Asit Fabrikası ve Kırka Tesisleri.',
        'Mermer: Kireçtaşının başkalaşmasıyla (metamorfizma) oluşur. Türkiye\'nin en çok ihraç ettiği ve en çok gelir sağladığı madendir. Yataklar: Afyonkarahisar, Balıkesir (Marmara Adası), Bursa, Muğla, Denizli, Bilecik.'
      ],
      goldenRule: 'EN ÇOK DÖVİZ GETİREN MADEN MERMERDİR: Türkiye maden ihracat gelirinde 1. sırayı açık ara MERMER alır. Çin, ABD ve Avrupa\'ya büyük miktarda işlenmiş ve blok mermer ihraç edilir.',
      osymTrap: 'ÖSYM TUZAĞI: Samsun\'da bakır çıkarılmaz! Ancak Karadeniz\'in en büyük bakır işleme tesisi Samsun\'dadır; sebebi deniz ulaşımı (liman) ve hinterland kolaylığıdır.'
    ),
    LectureSection(
      title: 'Diğer Önemli Madenler ve Kullanım Alanları',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'de sanayide ve ihracatta kullanılan diğer stratejik maden kaynakları:',
      bulletPoints: [
        'Fosfat: Yapay gübre üretiminin temel hammaddesidir. Türkiye ihtiyacını karşılayamaz, ithal eder. En önemli yatak: Mardin (Mazıdağı).',
        'Barit: Ağır bir mineraldir, petrol ve doğalgaz sondaj kuyularında sondaj çamurunun yoğunluğunu artırmada kullanılır. Yataklar: Antalya (Alanya, Gazipaşa), Kahramanmaraş (Elbistan), Muş.',
        'Manganez: Demirin çeliğe dönüştürülmesinde kullanılır: Denizli (Tavas), Zonguldak (Ereğli), Trabzon.',
        'Zımpara Taşı: Aşındırıcı ve parlatıcı olarak sanayide kullanılır. Ege Bölgesi\'nde yaygındır: Muğla, Aydın, İzmir, Manisa.',
        'Feldispat: Seramik ve cam sanayisinin hammaddesidir. İhraç ettiğimiz önemli bir madendir (Manisa, Aydın, Muğla).',
        'Asbest (Amyant): Yüksek ısıya ve sürtünmeye dayanıklı lifli mineraldir; itfaiyeci giysileri ve fren balatalarında kullanılır (Bursa, İzmir, Eskişehir). Kanserojen etkisi nedeniyle kullanımı sınırlandırılmıştır.',
        'Lületaşı: Süs eşyası ve pipo yapımında kullanılır. Sadece ESKİŞEHİR\'de çıkarılır.',
        'Oltutaşı: Siyah kehribar olarak bilinir, tespih ve takı yapımında kullanılır. Sadece ERZURUM (Oltu)\'da çıkarılır.'
      ],
      goldenRule: 'LÜLETAŞI ESKİŞEHİR, OLTUTAŞI ERZURUM: Süs eşyası madenlerinden Lületaşı Eskişehir\'e; Oltutaşı ise Erzurum\'a özgüdür.',
      osymTrap: 'ÖSYM TUZAĞI: Fosfat Türkiye\'de yeterli DEĞİLDİR! Mardin Mazıdağı\'nda çıkmasına rağmen Türkiye tarımda yoğun fosfatlı gübre kullandığı için en çok ithal edilen madenlerin başında gelir.'
    ),
    LectureSection(
      title: 'Türkiye\'nin Fosil (Yenilenemeyen) Enerji Kaynakları',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye\'nin elektrik enerjisi üretiminde ve ısınmada kullandığı birincil fosil kaynaklar:',
      comparisonRows: [
        ComparisonRow(
          correct: 'Taş Kömürü (1. Jeolojik Zaman)',
          wrong: 'Kalorisi çok yüksektir, demir-çelik fabrikalarında eritme enerjisi olarak kullanılır.\nSadece Zonguldak ve çevresinde (Karadeniz Ereğlisi) çıkarılır.\nTaş kömürüyle çalışan termik santral: Zonguldak Çatalağzı Termik Santrali.',
          note: 'Yatakları sınırlı olduğu için ithal de edilir.'
        ),
        ComparisonRow(
          correct: 'Linyit Kömürü (3. Jeolojik Zaman)',
          wrong: 'Kalorisi taş kömürüne göre düşüktür ancak Türkiye genelinde en yaygın fosil yakıttır.\nBüyük termik santraller: Manisa (Soma), Kahramanmaraş (Afşin-Elbistan), Kütahya (Tunçbilek, Seyitömer), Muğla (Yatağan, Yeniköy), Bursa (Orhaneli), Ankara (Çayırhan).',
          note: 'Türkiye genç oluşumlu olduğu için linyit her bölgede çıkar.'
        ),
        ComparisonRow(
          correct: 'Petrol (3. Jeolojik Zaman)',
          wrong: 'Türkiye ihtiyacının ancak %8-10\'unu yerli üretimle karşılayabilir; dışa bağımlıdır.\nİlk petrol 1940\'ta Batman Raman Dağı\'nda bulunmuştur. Yataklar: Batman, Adıyaman, Siirt, Diyarbakır, Şırnak (Gabar).\nPetrol Rafinerileri: İzmit (Tüpraş), İzmir (Aliağa/Star), Kırıkkale (Orta Anadolu), Batman (Hammaddeye yakın tek rafineri).',
          note: 'Mersin Ataş rafinerisi depolama tesisine dönüştürülmüştür.'
        ),
        ComparisonRow(
          correct: 'Doğalgaz (3. Jeolojik Zaman)',
          wrong: 'Hava kirliliği en az olan fosil yakıttır. Elektrik üretiminde payı yüksektir; tüketimin %98\'i ithaldir (Rusya, Azerbaycan, İran).\nYerli Yataklar: Kırklareli (Hamitabat), Tekirdağ (Hayrabolu), Düzce ve Karadeniz Sakarya Gaz Sahası.\nDoğalgaz Santralleri: Kırklareli (Hamitabat), İstanbul (Ambarlı), Bursa (Ovaakça), İzmir (Aliağa).',
          note: 'Türkiye doğalgazda çok büyük oranda dışa bağımlıdır.'
        ),
      ],
      goldenRule: 'BATMAN RAFİNERİSİ HAMMADDEYE YAKINDIR: Türkiye\'deki rafinerilerden İzmit, İzmir ve Mersin ULAŞIM (Liman); Kırıkkale PAZAR ve GÜVENLİK; Batman Rafinerisi ise doğrudan HAMMADDEYE YAKINLIK nedeniyle kurulmuştur.',
      osymTrap: 'ÖSYM TUZAĞI: Taş kömürü ile linyitin en büyük farkı oluştukları jeolojik zamandır. Taş kömürü 1. Zaman (Paleozoik); linyit ise 3. Zaman (Tersiyer) ürünüdür.'
    ),
    LectureSection(
      title: 'Türkiye\'nin Yenilenebilir ve Temiz Enerji Kaynakları',
      type: LectureSectionType.ruleList,
      leadText: 'Çevreye karbon salımı yapmayan, tükenmeyen doğal enerji kaynakları:',
      bulletPoints: [
        'Hidroelektrik Enerji (Su Gücü): Yüksek ve engebeli arazi yapısı sayesinde Türkiye\'nin hidroelektrik potansiyeli Avrupa\'da Rusya ve Norveç\'ten sonra 3. sıradadır. En büyük potansiyel Doğu Anadolu ve Güneydoğu Anadolu\'dadır. Önemli barajlar: Fırat üzerinde Atatürk (en büyük), Keban, Karakaya; Dicle üzerinde Ilısu (Veysel Eroğlu); Çoruh üzerinde Deriner ve Yusufeli (Türkiye\'nin en yüksek barajı).',
        'Rüzgâr Enerjisi: Sürekli rüzgâr alan kıyı ve boğaz çevrelerinde potansiyel yüksektir. İlk rüzgâr santrali İzmir Çeşme\'de kurulmuştur. En çok üretim: İzmir, Balıkesir, Çanakkale, Manisa, Hatay.',
        'Güneş Enerjisi: Güneşlenme süresinin yüksek olduğu Güneydoğu Anadolu ve Akdeniz potansiyelde ilk sıradadır. En büyük güneş enerjisi santrali (GES) Konya Karapınar\'da kurulmuştur. Karadeniz bulutluluk fazla olduğu için potansiyeli en düşük bölgedir.',
        'Jeotermal Enerji (Sıcak Su / Buhar): Fay hatları ve kırık sistemleriyle doğrudan bağlantılıdır. Elektrik üretimi, seracılık ve konut ısıtmasında kullanılır. İlk santral: Denizli (Sarayköy). Diğer santraller: Aydın (Germencik), Manisa (Salihli), Çanakkale.',
        'Biyokütle Enerjisi: Şehir çöpleri, tarımsal ve hayvansal atıklardan metan gazı üretilerek elektrik elde edilmesidir (Mamak-Ankara, Kemerburgaz-İstanbul).'
      ],
      goldenRule: 'JEOTERMAL VE HİDROELEKTRİK İKLİME BAĞIMLILIKTA ZITTIR: Hidroelektrik enerji üretimi kurak yıllarda azalır (iklime bağımlıdır); Jeotermal enerji ise yerin derinliklerinden geldiği için iklim şartlarından KESİNLİKLE ETKİLENMEZ.',
      osymTrap: 'ÖSYM TUZAĞI: Güneş enerjisi potansiyeli en yüksek bölge Güneydoğu Anadolu iken; en düşük bölge bulutlu gün sayısının fazlalığı nedeniyle Doğu Karadeniz\'dir.'
    ),
    LectureSection(
      title: 'Türkiye Maden Rezervleri ve Enerji Santralleri Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin stratejik maden yatakları, termik ve yenilenebilir enerji santralleri harita üzerinde gösterilmiştir.',
            mapData: LectureMapData(
        title: 'TÜRKİYE MADENLER VE ENERJİ KAYNAKLARI STRATEJİK ATLASI',
        subtitle: 'ÖSYM Sorularında Maden Yatakları, Rezerv Liderleri ve Enerji Santralleri Dağılımı',
        mapId: 'cografya_madenler_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_madenler.jpg',
        mapSource: 'cografyaharita.com - Türkiye Madenler Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '💎', label: 'Bor Mineralleri (%73 Dünya Rezervi)', description: 'Balıkesir (Bigadiç, Susurluk), Bursa (Mustafakemalpaşa), Kütahya (Emet), Eskişehir (Kırka - bor türevleri fabrikası).'),
          MapLegendItem(symbol: '⚙️', label: 'Demir ve Bakır Yatakları', description: 'Demir: Sivas (Divriği), Malatya (Hekimhan, Hasançelebi). Bakır: Artvin (Murgul), Kastamonu (Küre), Elazığ (Maden), Rize (Çayeli).'),
          MapLegendItem(symbol: '🛡️', label: 'Krom ve Boksit (Alüminyum)', description: 'Krom: Elazığ (Guleman), Muğla (Fethiye-Köyceğiz). Boksit: Konya (Seydişehir alüminyum tesisleri), Antalya (Akseki).'),
          MapLegendItem(symbol: '⛏️', label: 'Taşkömürü ve Linyit Havzaları', description: 'Taşkömürü: Zonguldak-Karabük-Bartın (1. Zaman). Linyit: Manisa (Soma), Kütahya (Tavşanlı, Seyitömer), Kahramanmaraş (Afşin-Elbistan), Muğla (Yatağan).'),
          MapLegendItem(symbol: '⚡', label: 'Doğal Enerji Kaynakları', description: 'Jeotermal: Denizli (Sarayköy), Aydın (Germencik). Rüzgar: İzmir, Balıkesir, Çanakkale. Güneş: Konya, Karaman, Şanlıurfa. Petrol: Batman (Raman, Garzan).')
        ],
        points: [
          MapFrontItem(
            name: 'Kırka (Eskişehir) & Bandırma (Balıkesir)',
            category: 'Dünya Bor Rezerv Merkezi',
            commander: 'İç Anadolu - Güney Marmara',
            keyEvent: 'Dünya bor rezervlerinin %73\'üne sahip olan Türkiye\'nin en zengin yatağı Eskişehir Kırka ve Kütahya Emet\'tir. İşleme ve ihracat tesisi Bandırma Bor Asit Fabrikası\'dır.',
            outcome: 'ÖSYM Çıkmış Soru: Dünya rezervinde 1. olduğumuz ve roket yakıtından cama kadar geniş kullanım alanı olan maden Bor\'dur.'
          ),
          MapFrontItem(
            name: 'Divriği (Sivas) & Hasançelebi (Malatya)',
            category: 'Ağır Sanayinin Temeli Demir',
            commander: 'Doğu Anadolu / Sivas - Malatya',
            keyEvent: 'Türkiye demir-çelik fabrikalarının (Karabük, Ereğli, İskenderun) en büyük hammadde kaynağı Sivas Divriği\'dir. Cevher buradan vagonlarla fabrikalara taşınır.',
            outcome: 'ÖSYM Sorusu: Türkiye\'nin en zengin demir yatakları Sivas Divriği ve Malatya Hekimhan\'da yer alır.'
          ),
          MapFrontItem(
            name: 'Seydişehir (Konya)',
            category: 'Entegre Boksit (Alüminyum) Tesisi',
            commander: 'İç Anadolu / Konya (Seydişehir)',
            keyEvent: 'Türkiye\'nin tek birincil alüminyum üretim tesisidir. Hammaddesi olan boksit madeni Seydişehir ve Antalya Akseki yataklarından temin edilir; Oymapınar Barajı elektriğini karşılar.',
            outcome: 'ÖSYM Soru Tuzağı: Alüminyumun hammaddesi boksittir ve entegre işleme tesisi Konya Seydişehir\'dedir.'
          ),
          MapFrontItem(
            name: 'Afşin - Elbistan & Soma Linyit Havzaları',
            category: 'En Büyük Termik Santral Havzaları',
            commander: 'K.Maraş (Afşin-Elbistan) & Manisa (Soma)',
            keyEvent: 'Afşin-Elbistan Türkiye\'nin en büyük linyit rezervine sahiptir. Soma, Seyitömer, Tunçbilek, Yatağan gibi santraller yerli linyitle elektrik üretir.',
            outcome: 'ÖSYM Çıkmış Soru: Linyit 3. Jeolojik Zaman\'da oluştuğu için Türkiye\'nin hemen hemen her bölgesinde yaygın olarak bulunur.'
          ),
          MapFrontItem(
            name: 'Denizli (Sarayköy) & Aydın (Germencik)',
            category: 'Jeotermal Enerji Lideri',
            commander: 'Ege Graben Kuşağı / Denizli - Aydın',
            keyEvent: 'Batı Anadolu kırık (fay) hatlarından çıkan yüksek sıcaklıktaki buhar gücüyle elektrik üreten ilk ve en büyük jeotermal santrallerimiz buradadır.',
            outcome: 'ÖSYM Sorusu: Jeotermal enerjiden elektrik üretimi yapılan ilk santralimiz Denizli Sarayköy santralidir.'
          )
        ],
        historicalNote: '📌 ÖSYM MADENLER VE İHRACAT TUZAKLARI:\n'
            '1. İhracat Gelirinde 1. Sırada Olan Madenimiz: MERMER (özellikle Afyon, Bilecik, Marmara Adası, Bursa, Muğla).\n'
            '2. Dışa En Çok Bağımlı Olduğumuz Enerjiler: Doğalgaz (%98 dışa bağımlı) ve Petrol (%90+ dışa bağımlı).\n'
            '3. Taşkömürü ile Linyit Farkı: Taşkömürü 1. Zaman (Paleozoik) arazisidir, kalorisi çok yüksektir, demir-çelik eritmede kullanılır (Zonguldak). Linyit 3. Zaman (Tersiyer) arazisidir, kalorisi düşüktür, termik santrallerde yakılır.'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Madenler ve Enerji',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Dünya toplam rezervinin yaklaşık %73\'üne sahip olduğumuz ve Balıkesir, Kütahya, Eskişehir çevresinde çıkarılan stratejik maden hangisidir?',
          options: [
            'A) Krom',
            'B) Bakır',
            'C) Bor Mineralleri',
            'D) Boksit',
            'E) Manganez'
          ],
          correctIndex: 2,
          explanation: 'Türkiye dünya bor rezervinin yaklaşık %73\'üne sahiptir. Balıkesir Bigadiç, Kütahya Emet ve Eskişehir Seyitgazi\'de dev yataklar bulunur.',
          ruleTag: 'Bor Rezervi'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu7 = konu7MadenlerEnerji;
