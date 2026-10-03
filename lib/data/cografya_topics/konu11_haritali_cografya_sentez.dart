// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu11HaritaliCografyaSentez = LectureTopic(
  id: 'cografya_haritali_sentez',
  courseId: 'cografya',
  order: 11,
  title: 'KPSS Haritalı Genel Coğrafya Sentezi ve Sınav Kritik Noktaları',
  subtitle: 'Dış Kuvvetler Sentezi, Karstik, Rüzgar, Buzul Şekilleri, Kıyı Tipleri ve UNESCO Miras Atlası',
  icon: Icons.map_rounded,
  color: const Color(0xFF8B5CF6),
  testRange: 'Test 96 - 100',
  startTestNum: 96,
  endTestNum: 100,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'de Dış Kuvvetler Sentezi: Karstik, Rüzgâr ve Buzul Şekilleri',
      imageAssetPath: 'assets/images/cografya/cografya_traverten_obruk.png',
      imageCaption: 'Görsel: Karstik Şekiller (Pamukkale Travertenleri Birikimi ve Mersin Cennet Obruğu Çöküntüsü)',
      secondImageAssetPath: 'assets/images/cografya/cografya_turkiye_ruzgarlar_etki_alani_haritasi.png',
      secondImageCaption: 'Harita: Türkiye\'de Rüzgâr Aşındırma ve Biriktirme (Erozyon) Etki Alanları (Konya Karapınar ve Güneydoğu Kurak Sahaları)',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin jeomorfolojik yapısında akarsulardan sonra karstik erime, rüzgâr birikimi ve yüksek dağ buzulları özel şekiller oluşturmuştur:',
      bulletPoints: [
        'Karstik Şekiller (Kalker, Jips ve Kaya Tuzu Aşınım-Birikimi):',
        '• En yaygın olduğu yer: Akdeniz Bölgesi (Teke ve Taşeli Platoları, Göller Yöresi).\n• Aşınım Şekilleri (Küçükten Büyüğe): Lapya (en küçük) > Dolin > Uvala > Polye (en büyük karstik çanak / karstik ova: TAKKE - Tefenni, Acıpayam, Korkuteli, Kestel, Elmalı).\n• Obruk: Yeraltı mağara tavanlarının çökmesiyle oluşan derin kuyulardır (Cennet-Cehennem obrukları Mersin, Kızören obruğu Konya).\n• Karstik Mağaralar: Damlataş, Karain, Dim (Antalya), İnsuyu (Burdur - Türkiye\'de turizme açılan ilk mağara), Ballıca (Tokat).\n• Karstik Birikim Şekilleri: Sarkıt, dikit, sütun ve Travertenler (Pamukkale travertenleri Denizli).',
        'Rüzgârın Şekillendirici Etkisi:',
        '• Kurak ve yarı kurak, bitki örtüsünün seyrek olduğu, gevşek kumlu arazilerde etkilidir. En çok görüldüğü yerler: İç Anadolu (Konya Karapınar kumulları) ve Güneydoğu Anadolu.\n• Rüzgâr Aşınım Şekilleri: Mantarkaya, Şahitkaya, Tafoni (kuş yuvası oyuklar), Yardan.\n• Rüzgâr Birikim Şekilleri: Barkan (hilal biçimli kum tepecikleri), Kumullar, Lös örtüleri.',
        'Buzulların Şekillendirici Etkisi:',
        '• Türkiye Orta Kuşak\'ta yer aldığı için (matematik konum gereği) buzullar hiçbir zaman deniz seviyesine inmemiştir; sadece yüksek dağlarda (2500-3000 m üzerinde) etkilidir.\n• Güncel Buzul Bulunan Dağlar: Hakkari Cilo (Uludoruk/Reşko - En büyük vadi buzulu), Kaçkar Dağları, Büyük Ağrı Dağı (Takke buzulu), Süphan, Erciyes, Bolkar ve Aladağlar.\n• Güncel Buzul OLMAYAN ama Buzul İzi Bulunan Dağ: Bursa ULUDAĞ (Buzul izi vardır fakat güncel buzul yoktur).'
      ],
      goldenRule: 'TÜRKİYE KIYILARINDA BUZUL ŞEKLİ YOKTUR: Türkiye\'nin kıyılarında buzul aşınım ve birikim şekillerine rastlanmamasının sebebi MATEMATİKSEL KONUMDUR (Ekvator\'a yakın Orta Kuşak\'ta olmasıdır).',
      osymTrap: 'ÖSYM TUZAĞI: Ege ve Karadeniz kıyılarında rüzgar aşındırması DEĞİL, DALGA aşındırması etkilidir. Rüzgar şekilleri deniz kıyısında değil, İç Anadolu (Karapınar) ve Güneydoğu kurak düzlüklerinde görülür!'
    ),
    LectureSection(
      title: 'Türkiye\'de Görülen ve GÖRÜLMEYEN Kıyı Tipleri',
      imageAssetPath: 'assets/images/cografya/cografya_dalmacya_kiyi_tipi.png',
      imageCaption: 'Görsel: Dalmaçya Tipi Kıyı (Antalya Kaş - Kalkan Kıyılarına Paralel Ada ve Koylar)',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye kıyıları yer şekilleri, dağların uzanışı ve jeolojik değişimlere göre şekillenmiştir:',
      bulletPoints: [
        '🌊 TÜRKİYE\'DE GÖRÜLEN KIYI TİPLERİ VE ÖRNEKLERİ:',
        '• Boyuna Kıyı Tipi: Dağların kıyıya paralel uzandığı Karadeniz ve Akdeniz kıyılarında görülür. Kıyı düzdür, girinti-çıkıntı azdır, falez (yalıyar) çoktur, kıta sahanlığı dardır.\n• Enine Kıyı Tipi: Dağların kıyıya dik uzandığı Ege kıyılarında görülür. Girinti-çıkıntı ve koy-körfez sayısı en fazladır, kıta sahanlığı geniştir, delta ovaları yaygındır.\n• Dalmaçya Kıyı Tipi: Kıyıya paralel uzanan dağların deniz suları altında kalmasıyla oluşan adacıklı kıyıdır. Türkiye\'de sadece ANTALYA KAŞ - FİNİKE kıyılarında görülür.\n• Rias Tipi Kıyı: Eski akarsu vadilerinin deniz suları altında kalmasıyla (boğulmasıyla) oluşur: İstanbul ve Çanakkale boğazları, Haliç ve Muğla Menteşe/Gökova kıyıları.\n• Limanlı Kıyı Tipi: Akarsu vadilerinin önünün kıyı kordonuyla kapanmasıyla oluşur: Büyükçekmece, Küçükçekmece ve Terkos (Durusu) gölleri kıyıları.\n• Kalanklı Kıyı Tipi: Kanyon vadilerin sular altında kalmasıyla oluşan dik karstik koylardır (Mersin-Silifke kıyıları).',
        '🚫 TÜRKİYE\'DE KESİNLİKLE GÖRÜLMEYEN KIYI TİPLERİ (SINAV TUZAKLARI):',
        '• 1) Fiyort ve Skyer Kıyı Tipleri GÖRÜLMEZ!\nNedeni: MATEMATİKSEL KONUMDUR (Kutuplara yakın kuşakta olmadığımız için buzullar deniz kıyısına hiçbir zaman inmemiştir; Norveç, Kanada gibi ülkelerde görülür).\n• 2) Haliç ve Vat Kıyı Tipleri GÖRÜLMEZ!\nNedeni: ÖZEL KONUMDUR (Okyanusa kıyımız olmadığı ve iç denizlerde gelgit genliği yetersiz olduğu için okyanus kıyılarına özgü Haliç ve Vat oluşamaz).'
      ],
      goldenRule: 'FİYORT MATEMATİK KONUM, HALİÇ ÖZEL KONUMDUR: Türkiye\'de fiyort olmamasının sebebi enlem (matematik konum); haliç ve vat olmamasının sebebi ise okyanusa kıyımızın olmamasıdır (özel konum).',
      osymTrap: 'ÖSYM TUZAĞI: İstanbul\'daki "Haliç" (Altın Boynuz) bir haliç kıyı tipi DEĞİLDİR; jeomorfolojik olarak bir RİAS tipi kıyıdır (eski akarsu vadisinin boğulmasıdır)!'
    ),
    LectureSection(
      title: 'Türkiye\'nin Dalga Aşınım ve Birikim Kıyı Şekilleri (Falez, Tombolo, Lagün)',
      imageAssetPath: 'assets/images/cografya/cografya_tombolo_sapliada.png',
      imageCaption: 'Görsel: Tombolo / Saplı Ada (Kıyı Oku ile Adanın Karaya Bağlanması - Kapıdağ ve Sinop)',
      type: LectureSectionType.ruleList,
      leadText: 'Dalga ve akıntıların taşıdığı kum ve çakıllar kıyı çizgisi boyunca özel yer şekilleri oluşturur:',
      bulletPoints: [
        'Falez (Yalıyar): Dağların denize paralel ve çok yakın uzandığı dik kıyılarda dalga çarpmasıyla yamaçların altının oyulması ve üstün çökmesiyle oluşan dik uçurumlardır. Doğu ve Batı Karadeniz ile Antalya falezleri en tipik örneklerdir.',
        'Tombolo (Saplı Ada): Kıyı açıklarındaki bir adanın kıyı okları veya kordonları vasıtasıyla ana karaya bağlanarak yarımadaya dönüşmesidir. Türkiye\'deki en belirgin örnekleri: Balıkesir Kapıdağ Yarımadası ve Sinop İnceburun Yarımadası.',
        'Lagün (Kıyı Set Gölü / Deniz Kulağı): Bir koy veya körfezin önünün dalgaların taşıdığı kıyı kordonuyla tamamen kapanması sonucu oluşan göllerdir. Örnek: İstanbul Büyükçekmece, Küçükçekmece, Terkos (Durusu) ve Muğla Fethiye Ölüdeniz lagünleri.',
        'Kıyı Oku ve Kıyı Kordonu: Dalgaların kıyı boyunca biriktirdiği ince uzun kum şeritleridir.'
      ],
      goldenRule: 'KITA SAHANLIĞI VE FALEZ İLİŞKİSİ: Kıta sahanlığının dar olduğu (derin) yerlerde falez oluşur (Doğu/Batı Karadeniz, Antalya). Kıta sahanlığının geniş olduğu (sığ) yerlerde ise delta ovaları, plajlar ve kıyı setleri oluşur (Ege ve Orta Karadeniz).',
      osymTrap: 'ÖSYM TUZAĞI: Kapıdağ ve Sinop yarımadaları volkanik değil; dalga biriktirmesi sonucu oluşan birer TOMBOLO (Saplı Ada)\'dur!'
    ),
    LectureSection(
      title: 'Türkiye\'nin 7 Coğrafi Bölgesi Haritası ve Bölüm Ayrımı',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_cografi_bolgeler_haritasi.png',
      imageCaption: 'Şekil 11.1: Türkiye 7 Coğrafi Bölge ve Bölümler Dağılış Haritası (1941 Coğrafya Kongresi)',
      leadText: 'Türkiye\'nin iklim, yer şekilleri, bitki örtüsü ve sosyoekonomik kriterlere göre belirlenen 7 coğrafi bölgesi:',
      bulletPoints: [
        'Kıyı Bölgeleri: Karadeniz, Marmara, Ege ve Akdeniz bölgeleri. Denizel etki hakimdir, nemlilik yüksektir, nüfus yoğunluğu fazladır.',
        'İç Bölgeler: İç Anadolu, Doğu Anadolu ve Güneydoğu Anadolu bölgeleri. Karasal iklim hakimdir, sıcaklık farkları fazladır, tahıl tarımı ve hayvancılık yaygındır.',
        'Yüzölçümü En Büyük Bölge: Doğu Anadolu Bölgesi (%21).',
        'Yüzölçümü En Küçük Bölge: Güneydoğu Anadolu Bölgesi (%7.5).',
        'Nüfusu En Fazla Bölge: Marmara Bölgesi; Nüfusu En Az Bölge: Doğu Anadolu Bölgesi.'
      ],
      goldenRule: 'BÖLGELER 1941\'DE ÇİZİLMİŞTİR: 1. Türk Coğrafya Kongresi\'nde doğal, beşeri ve ekonomik kriterler birlikte değerlendirilmiştir.',
      osymTrap: 'ÖSYM TUZAĞI: Coğrafi bölge sınırları il sınırlarını KESİNLİKLE takip etmez! Bir il birden fazla bölgede yer alabilir (Örn: Bilecik 4 bölgede birden toprağa sahiptir).'
    ),
    LectureSection(
      title: 'Karadeniz Bölgesi Coğrafi Analiz Haritası (Doğu, Orta, Batı)',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_karadeniz_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.2: Karadeniz Bölgesi Bölümleri Haritası (Doğu, Orta ve Batı Karadeniz)',
      leadText: 'Dağların denize paralel uzandığı, orman ve yağış şampiyonu bölgemiz:',
      bulletPoints: [
        'Doğu Karadeniz Bölümü: En çok yağış alan, en dağlık ve engebeli bölümdür (Kaçkar Dağları). Çay ve fındık tarımı tek geçim kaynağıdır. Kırsal nüfus dağınık yerleşmiştir.',
        'Orta Karadeniz Bölümü: Dağların yükseltisi azalmış ve geriye çekilmiştir (Canik Dağları). Samsun Bafra ve Çarşamba deltaları bölgenin en büyük tarım alanlarıdır. Ulaşım iç kesimlere kolaydır.',
        'Batı Karadeniz Bölümü: Taş kömürü madenciliği (Zonguldak), demir-çelik sanayisi (Karabük-Ereğli) ve kereste/orman sanayisi (Bolu, Kastamonu) ile öne çıkar.'
      ],
      goldenRule: 'ORTA KARADENİZ FARKI: Dağların basık ve geride olması Orta Karadeniz\'in iklimini daha ılıman, ulaşımını daha kolay ve tarımını daha zengin kılmıştır.',
      osymTrap: 'ÖSYM TUZAĞI: Karadeniz Bölgesi\'nin en gelişmiş ve en kalabalık kenti Samsun\'dur.'
    ),
    LectureSection(
      title: 'Marmara Bölgesi Coğrafi Analiz Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_marmara_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.3: Marmara Bölgesi Bölümleri Haritası (Çatalca-Kocaeli, Ergene, Yıldız, Güney Marmara)',
      leadText: 'Yükseltisi en az, sanayi, nüfus, enerji tüketimi ve ticaret hacmi en yüksek bölgemiz:',
      bulletPoints: [
        'Çatalca - Kocaeli Bölümü: Türkiye sanayi, finans, ulaşım ve ticaret kalbidir. Aşınım platosu üzerindedir, tarım arazileri sanayiye dönüşmüştür.',
        'Ergene Bölümü: Trakya\'nın alçak düzlükleridir. Ayçiçeği ve pirinç (çeltik) tarımının merkezidir. Karasal iklim görülür.',
        'Yıldız Dağları Bölümü: Masif arazidir, engebeli ve ormanlıktır. Nüfusu seyrektir, ana yollara uzaktır.',
        'Güney Marmara Bölümü: Bursa, Balıkesir, Çanakkale. Tarım (zeytin, meyve), hayvancılık (merinos, kümes) ve otomotiv sanayisi çok gelişmiştir.'
      ],
      goldenRule: 'İKLİM VE BİTKİ ÇEŞİTLİLİĞİ EN FAZLA OLAN BÖLGE: Karadeniz, Akdeniz ve Karasal iklimlerin geçiş alanında olduğu için 3 farklı iklim ve bitki örtüsü bir arada görülür.',
      osymTrap: 'ÖSYM TUZAĞI: Marmara\'da hidroelektrik potansiyel yer şekilleri alçak ve eğim az olduğu için EN DÜŞÜKTÜR; ancak enerji TÜKETİMİ en fazladır.'
    ),
    LectureSection(
      title: 'Ege Bölgesi Coğrafi Analiz Haritası',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_ege_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.4: Ege Bölgesi Bölümleri Haritası (Asıl Ege / Kıyı Ege ve İç Batı Anadolu)',
      leadText: 'Dağların denize dik uzandığı, horst-graben sistemleri ve linyit-jeotermal zengini bölgemiz:',
      bulletPoints: [
        'Asıl Ege (Kıyı Ege): Graben ovaları boyunca akarsular menderes çizer. Kıyı çok girintili çıkıntılıdır. ZÜHTİ tarım ürünleri (Zeytin, Üzüm, Haşhaş, Tütün, İncir) egemendir. Turizm ve liman ticareti devleşmiştir.',
        'İç Batı Anadolu: Kütahya, Afyon, Uşak. Yükselti artar, iklim karasallaşır. Linyit madenciliği, termik santraller, haşhaş ve şeker pancarı tarımı yapılır.',
        'Menteşe Yöresi İstisnası: Muğla çevresinde dağlar kıyıya paralel uzanır, çok engebelidir; bu yüzden Ege\'nin en çok yağış alan ama en seyrek nüfuslu yöresidir.'
      ],
      goldenRule: 'KIYI İLE İÇ KESİM ARASINDA FARK EN AZDIR: Dağlar kıyıya dik olduğu için denizel etki ve ulaşım kolaylıkla 200 km içeriye sokulur.',
      osymTrap: 'ÖSYM TUZAĞI: Muğla Menteşe Yöresi enine kıyı DEĞİLDİR; dağlar paralel uzanır ve boyuna/ria karakterindedir.'
    ),
    LectureSection(
      title: 'Akdeniz Bölgesi Coğrafi Analiz Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_akdeniz_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.5: Akdeniz Bölgesi Bölümleri Haritası (Adana ve Antalya Bölümleri)',
      leadText: 'Kireçtaşı (karstik) arazileri, Toros Dağları silsilesi ve seracılık şampiyonu güney bölgemiz:',
      bulletPoints: [
        'Adana Bölümü: Çukurova deltası sayesinde Türkiye\'nin tarıma dayalı sanayi ve ticaret merkezidir. Yer şekilleri Antalya\'ya göre daha sadedir; pamuk, mısır, narenciye ve soya üretimi yapılır.',
        'Antalya Bölümü: Çok dağlık ve karstiktir (Teke ve Taşeli platoları). Kıyı derin falezlerle kaplıdır, delta oluşamamıştır. Deniz turizmi ve kış seracılığının başkentidir.',
        'İklim ve Tarım: Güneşlenme süresi yüksek, kışlar çok ılık geçer. Türkiye\'de don olaylarının en az görüldüğü yerdir.'
      ],
      goldenRule: 'İKİ BÖLÜM ARASINDAKİ ENGEBE FARKI: Antalya bölümü karstik ve çok engebeli; Adana bölümü ise Çukurova sayesinde daha düzlüktür.',
      osymTrap: 'ÖSYM TUZAĞI: Teke ve Taşeli platoları Akdeniz sahilinde olmasına rağmen karstik kalkerli arazi ve su tutmayan yapısı yüzünden Türkiye\'nin en seyrek nüfuslu alanlarıdır.'
    ),
    LectureSection(
      title: 'İç Anadolu Bölgesi Coğrafi Analiz Haritası',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_ic_anadolu_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.6: İç Anadolu Bölgesi Bölümleri Haritası (Konya, Yukarı Sakarya, Orta ve Yukarı Kızılırmak)',
      leadText: 'Türkiye\'nin tahıl ambarı, düzlük platolar ve karasal step sahası:',
      bulletPoints: [
        'Konya Bölümü: Türkiye\'nin en geniş ovası ve buğday ambarıdır. Yıllık yağışın en az olduğu yerdir (Tuz Gölü çevresi).',
        'Yukarı Sakarya Bölümü: Ankara ve Eskişehir\'in yer aldığı sanayi, ulaşım, üniversite ve idari merkezdir. Bölgenin en gelişmiş bölümüdür.',
        'Orta Kızılırmak Bölümü: Kayseri, Nevşehir, Kırşehir, Yozgat. Volkanik tüfler (Kapadokya), bağcılık ve küçükbaş hayvancılık yaygındır.',
        'Yukarı Kızılırmak Bölümü: Sivas çevresidir. Bölgenin yükseltisi en fazla, kışları en sert ve engebeli bölümüdür.'
      ],
      goldenRule: 'KIRKİKİNDİ YAĞIŞLARI STEPİ YEŞERTİR: İlkbaharda ısınan havanın yükselmesiyle oluşan konveksiyonel yağışlar küçükbaş hayvancılığın can damarıdır.',
      osymTrap: 'ÖSYM TUZAĞI: Yukarı Kızılırmak (Sivas) bölümü İç Anadolu\'da olmasına rağmen yükselti ve iklim sertliği bakımından Doğu Anadolu\'ya benzer.'
    ),
    LectureSection(
      title: 'Doğu Anadolu Bölgesi Coğrafi Analiz Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_dogu_anadolu_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.7: Doğu Anadolu Bölgesi Bölümleri Haritası (Erzurum-Kars, Yukarı Fırat, Yukarı Murat-Van, Hakkari)',
      leadText: 'Yükseltisi en fazla, yüzölçümü en büyük ve hidroelektrik potansiyeli en yüksek bölgemiz:',
      bulletPoints: [
        'Erzurum - Kars Bölümü: Lav platoları üzerinde yaz yağışları ile beslenen gür çayırlar (alpin) bulunur. Büyükbaş mera hayvancılığının merkezidir. Kış mevsimi en uzun ve en soğuk geçen bölümdür.',
        'Yukarı Fırat Bölümü: Malatya, Elazığ, Erzincan. Bölgenin en gelişmiş, nüfusu en yoğun ve maden çeşitliliği en zengin (demir, bakır, krom, kurşun) bölümüdür.',
        'Yukarı Murat - Van Bölümü: Van Gölü havzası ve volkanik dağlar (Nemrut, Süphan, Tendürek, Ağrı) yer alır. Çevresine göre ılıman bir mikroklimaya sahiptir.',
        'Hakkari Bölümü: Türkiye\'nin en dağlık, engebeli ve ulaşımı en güç bölümüdür. Cilo Dağı ve güncel buzullar yer alır; nüfus çok seyrektir.'
      ],
      goldenRule: 'HİDROELEKTRİK VE MADEN ŞAMPİYONU: Eğim ve akış hızı fazla olduğu için akarsuların hidroelektrik potansiyeli Türkiye\'de en yüksektir. Yukarı Fırat bölümü ise maden çeşitliliğinde Türkiye birincisidir.',
      osymTrap: 'ÖSYM TUZAĞI: Iğdır Ovası Doğu Anadolu\'da çukurda kaldığı için bir mikroklima alanıdır; pamuk yetişir ve kışları ılıman geçer!'
    ),
    LectureSection(
      title: 'Güneydoğu Anadolu Bölgesi Coğrafi Analiz Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_guneydogu_anadolu_bolgesi_haritasi.png',
      imageCaption: 'Şekil 11.8: Güneydoğu Anadolu Bölgesi Haritası (Orta Fırat ve Dicle Bölümleri)',
      leadText: 'Yaz kuraklığı ve buharlaşmanın en şiddetli olduğu, GAP ile devleşen güney sınır bölgemiz:',
      bulletPoints: [
        'Orta Fırat Bölümü: Gaziantep ve Şanlıurfa. Yer şekilleri oldukça düzdür. GAP ile sulu tarıma (pamuk, mısır) geçilmiştir. Gaziantep bölgenin sanayi ve ticaret lokomotifidir.',
        'Dicle Bölümü: Diyarbakır, Batman, Siirt, Mardin, Şırnak. Petrol üretimi (Batman), mercimek ve Antep fıstığı tarımı öne çıkar.',
        'Yaz Sıcaklığı: Akdeniz\'den daha sıcaktır; sebebi enlem, karasallık ve Basra Alçak Basıncı\'nın getirdiği çöl rüzgarlarıdır (Samyeli).'
      ],
      goldenRule: 'GAP İLE PAMUK ŞAMPİYONU ŞANLIURFA OLMUŞTUR: GAP sulaması öncesinde pamuk lideri Adana iken, günümüzde Türkiye pamuğunun yarıdan fazlasını Şanlıurfa üretir.',
      osymTrap: 'ÖSYM TUZAĞI: Güneydoğu Anadolu orman bakımından Türkiye\'nin EN FAKİR bölgesidir (%3); temel nedeni şiddetli yaz kuraklığı ve buharlaşmadır.'
    ),
    LectureSection(
      title: 'Türkiye\'nin UNESCO Dünya Kültür ve Doğal Mirasları Atlası',
      type: LectureSectionType.ruleList,
      leadText: 'UNESCO Dünya Miras Listesi\'nde Türkiye\'nin 21 adet tescilli varlığı bulunmaktadır:',
      bulletPoints: [
        'Karma Miras Alanları (Hem Doğal Hem Kültürel Değer Taşıyanlar):',
        '• Göreme Milli Parkı ve Kapadokya (Nevşehir): Volkanik tüfler, peri bacaları ve yeraltı kaya kiliseleri.\n• Pamukkale ve Hierapolis Antik Kenti (Denizli): Karstik travertenler ve antik Roma kenti.',
        'Kültürel Miras Alanları (Kronolojik / Coğrafi Dağılım):',
        '• Divriği Ulu Camii ve Darüşşifası (Sivas - İlk tescil edilen varlığımız, 1985)\n• İstanbul\'un Tarihi Alanları (Sultanahmet, Süleymaniye, Zeyrek, Kara Surları)\n• Hattuşa: Hitit Başkenti (Çorum)\n• Nemrut Dağı Kommagene Krallığı Dev Heykelleri (Adıyaman)\n• Xanthos - Letoon Antik Kenti (Antalya - Muğla)\n• Safranbolu Şehri Osmanlı Ahşap Mimarisi (Karabük)\n• Truva Antik Kenti (Çanakkale)\n• Edirne Selimiye Camii ve Külliyesi (Mimar Sinan\'ın ustalık eseri)\n• Çatalhöyük Neolitik Kenti (Konya - İlk köy yerleşmesi)\n• Bergama Çok Katmanlı Kültürel Peyzaj Alanı (İzmir)\n• Bursa ve Cumalıkızık: Osmanlı İmparatorluğu\'nun Doğuşu (Bursa)\n• Diyarbakır Kalesi ve Hevsel Bahçeleri Kültürel Peyzajı (Diyarbakır)\n• Efes Antik Kenti (İzmir - Artemis Tapınağı, Celsus Kütüphanesi)\n• Ani Arkeolojik Alanı (Kars - Orta Çağ Ermeni ve Selçuklu kenti)\n• Afrodisias Antik Kenti (Aydın - Heykeltıraşlık okulu)\n• Göbeklitepe (Şanlıurfa - MÖ 10.000, Tarihin sıfır noktası, ilk anıtsal tapınak)\n• Arslantepe Höyüğü (Malatya - İlk saray yapısı ve bürokrasi izleri)\n• Gordion Antik Kenti (Ankara Polatlı - Frigya Başkenti, 2023 yılında eklendi)\n• Anadolu\'nun Orta Çağ Ahşap Direkli ve Kirişli Camileri (2023 yılında eklendi: Beyşehir Eşrefoğlu, Sivrihisar Ulu, Afyonkarahisar Ulu, Ankara Arslanhane, Kastamonu Mahmut Bey camileri).'
      ],
      goldenRule: 'KARMA MİRAS ALANLARIMIZ: Türkiye\'de hem doğal hem kültürel miras olarak tescillenen sadece İKİ ALAN vardır: KAPADOKYA ve PAMUKKALE.',
      osymTrap: 'ÖSYM TUZAĞI: En son eklenen UNESCO miraslarımız Gordion Antik Kenti (Ankara - 2023) ve Anadolu\'nun Ahşap Hipostil Camileri\'dir (2023). Güncel sınav sorularında bu iki yeni miras sıklıkla sorulmaktadır!'
    ),
    LectureSection(
      title: 'Türkiye Genel Fiziki Yer Şekilleri ve Coğrafi Sentez Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin fiziki coğrafyasının tüm dağ, ova, plato, karstik alan ve miras odaklarını birleştiren sentez haritası:',
      mapData: LectureMapData(
        title: 'KPSS HARİTALI GENEL COĞRAFYA SENTEZİ VE SINAV TUZAKLARI',
        subtitle: 'ÖSYM\'nin Dilsiz ve Fiziki Haritalarda En Çok Sorduğu Mekânsal Noktalar ve Sorular',
        mapId: 'cografya_haritali_sentez_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_yer_sekilleri.jpg',
        mapSource: 'cografyaharita.com - Türkiye Genel Yer Şekilleri Fiziki Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🏔️', label: 'Buzul (Glasiyal) Aşınım İzleri Olan Dağlar', description: 'Cilo (Hakkari), Ağrı, Kaçkar, Bolkar, Aladağlar, Erciyes, Uludağ (sirk gölleri vardır fakat güncel buzul yoktur). Yıldız, Karacadağ, Aydın dağlarında ASLA buzul izi bulunmaz!'),
          MapLegendItem(symbol: '🌪️', label: 'Rüzgar Aşındırma ve Biriktirme Alanları', description: 'İç Anadolu (Konya Karapınar kumulları) ve Güneydoğu Anadolu. Bitki örtüsünün cılız, kuraklığın fazla olduğu düz arazilerde rüzgar etkisi maksimumdur.'),
          MapLegendItem(symbol: '🪨', label: 'Falez (Yalıyar) Kuşakları', description: 'Dağların denize dik ve çok yakın yükseldiği Doğu ve Batı Karadeniz ile Antalya falezleri (Teke-Taşeli kıyıları). Çukurova, Bafra ve Ege grabenlerinde falez OLMAZ!'),
          MapLegendItem(symbol: '🏝️', label: 'Tombolo (Saplı Ada) ve Lagünler', description: 'Tombolo: Sinop İnceburun ve Balıkesir Kapıdağ Yarımadası. Kıyı Set Gölü (Lagün): Büyükçekmece, Küçükçekmece, Terkos (Durusu), Akyayan.'),
          MapLegendItem(symbol: '⚠️', label: 'Doğal Afet Dağılım Odakları', description: 'Heyelan: Doğu Karadeniz (İlkbahar). Çığ: Doğu Anadolu dağlık alanları. Orman Yangını: Akdeniz ve Ege kıyı kuşağı (Yaz kuraklığı). Sel/Taşkın: Karadeniz ve Ergene.')
        ],
        points: [
          MapFrontItem(
            name: 'Kapıdağ Yarımadası ve Sinop İnceburun',
            category: 'Türkiye\'nin En Belirgin Tomboloları',
            commander: 'Marmara (Balıkesir) & Karadeniz (Sinop)',
            keyEvent: 'Kıyı oklarının açıkta bulunan bir adayı anakaraya bağlamasıyla oluşan saplı adalardır. Balıkesir Kapıdağ Yarımadası ve Sinop Boztepe burnu en tipik tombolo örnekleridir.',
            outcome: 'ÖSYM Çıkmış Soru: Dalga biriktirmesi sonucu oluşan saplı adaya (tombolo) en belirgin örnek Kapıdağ Yarımadası\'dır.'
          ),
          MapFrontItem(
            name: 'Uludağ & Kaçkar Sirk Gölleri',
            category: 'Buzul Şekilleri Sınav Tuzağı',
            commander: 'Marmara (Bursa) & Doğu Karadeniz',
            keyEvent: 'Uludağ\'da 4. Zaman buzul aşındırması sonucu oluşmuş sirk gölleri (Aynalıgöl, Kilimli, Karagöl) bulunur; ancak yükseltisi yetmediği için güncel aktif buzul YOKTUR.',
            outcome: 'ÖSYM Kritik Tuzak: Uludağ\'da buzul ŞEKLİ vardır ama güncel buzul YOKTUR! Cilo ve Kaçkar\'da ise hem buzul şekli hem güncel buzul vardır.'
          ),
          MapFrontItem(
            name: 'Karapınar Çölleşme ve Kumul Alanı',
            category: 'Rüzgar Aşındırmasının Zirvesi',
            commander: 'İç Anadolu / Konya (Karapınar)',
            keyEvent: 'Eski göl tabanı kumullarının rüzgarla savrulduğu, mantar kaya, şahit tepe ve kumulların görüldüğü Türkiye\'nin rüzgar erozyonuna en açık yöresidir.',
            outcome: 'ÖSYM Sorusu: Rüzgarın şekillendirici etkisinin en belirgin olduğu yer Konya Karapınar çevresidir.'
          ),
          MapFrontItem(
            name: 'Antalya & Doğu Karadeniz Kıyıları',
            category: 'Falez (Yalıyar) Kuşakları',
            commander: 'Akdeniz & Karadeniz Kıyı Sarpalıkları',
            keyEvent: 'Dağların hemen kıyıdan dimdik yükseldiği bu kıyılarda dalga aşındırması sonucu yüksek kıyı uçurumları (falez) oluşur; kıta sahanlığı son derece dardır.',
            outcome: 'ÖSYM Sorusu: Kıyıda falez oluşabilmesi için dağların kıyıya paralel ve çok yakın uzanması şarttır.'
          )
        ],
        historicalNote: '📌 ÖSYM HARİTALI SORULAR ALTIN KURALLAR SENTEZİ:\n'
            '1. Haritada Asla Buzul Olmayan Yerler: Yıldız Dağları, Biga Yarımadası, Ege Dağları, Güneydoğu Karacadağ (yükseltileri buzul sınırına 2500m+ ulaşamaz).\n'
            '2. Haritada Falez Olmayan Kıyılar: Bafra, Çarşamba, Çukurova, Silifke deltaları ve Ege kıyıları (kıta sahanlığı geniştir, dalga biriktirme yapar).\n'
            '3. Haritada Boyuna Kıyı: Karadeniz ve Akdeniz; Enine Kıyı: Ege; Ria Tipi Kıyı: İstanbul-Çanakkale boğazları ve Haliç; Dalmaçya Kıyı: Antalya-Kaş kıyıları; Kalanklı Kıyı: Mersin Silifke kıyıları.\n'
            '4. Haliç ve Fiyort Kıyı Tipi: Türkiye\'de GELGİT genliği az olduğu ve MATEMATİKSEL KONUM (orta kuşak) gereği buzullar deniz seviyesine inmediği için ASLA GÖRÜLMEZ!'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Genel Coğrafya Sentezi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Türkiye kıyılarında fiyort ve skyer tipi kıyıların GÖRÜLMEMESİNİN nedeni aşağıdakilerden hangisidir?',
          options: [
            'A) Okyanusa kıyımızın olmaması (Özel Konum)',
            'B) Dağların kıyıya paralel uzanması (Özel Konum)',
            'C) Matematiksel konum gereği buzul aşındırmasının kıyılara hiçbir zaman inmemiş olması',
            'D) Gelgit genliğinin çok düşük olması',
            'E) Akarsuların bol alüvyon taşıması'
          ],
          correctIndex: 2,
          explanation: 'Fiyort ve skyer buzul aşındırmasıyla oluşan kıyı tipleridir. Türkiye Orta Kuşak\'ta yer aldığı için buzullar hiçbir zaman kıyı seviyesine inmemiştir. Bu durum MATEMATİK KONUMUN sonucudur.',
          ruleTag: 'Görülmeyen Kıyı Tipleri'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu11 = konu11HaritaliCografyaSentez;
