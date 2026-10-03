import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu1IslamiyetOncesi = LectureTopic(
  id: 'tarih_islamiyet_oncesi',
  courseId: 'tarih',
  order: 1,
  title: 'İslamiyet Öncesi Türk Tarihi',
  subtitle: 'Kültür Merkezleri, Bozkır Devletleri, Teşkilat, Töre, Ordu & Medeniyet',
  icon: Icons.shield_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 1 - 10',
  startTestNum: 1,
  endTestNum: 10,
  estimatedMinutes: 65,
  sections: [
    // BÖLÜM 1: TÜRKLERİN ANAYURDU VE COĞRAFİ ÖZELLİKLERİ
    LectureSection(
      title: '1. Türklerin Anayurdu Orta Asya & Coğrafi Yapı',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_turklerin_anayurdu.png',
      imageCaption: 'Harita 1.1: Türklerin İlk Anayurdu Orta Asya (Türkistan) ve Doğal Sınırları',
      leadText: 'Türklerin ilk anayurdu Orta Asya yani "Türkistan"dır. Türkistan, "Türklerin yaşadığı ülke" anlamına gelmektedir. Sert karasal iklim ve geniş bozkırlar, Türk milletinin sosyal, ekonomik ve askeri karakterini belirlemiştir.',
      bulletPoints: [
        'Orta Asya Anayurdunun Doğal Sınırları:\n'
            '  • Doğuda: Kingan Dağları ve Moğolistan stepleri,\n'
            '  • Batıda: Hazar Denizi ve İtil (Volga) Nehri,\n'
            '  • Güneyinde: Hindikuş ve Karanlık (Karanlık/Tibet) Dağları,\n'
            '  • Kuzeyinde: Kırgız Bozkırları ve Altay-Sayan Dağları ile Sibirya stepleri yer alır.',
        'Bozkır Kültürü ve Yaşam Tarzı:\n'
            '  • İklim: Kışları son derece sert ve dondurucu, yazları kurak ve sıcak geçen sert karasal iklim egemendir.\n'
            '  • Konargöçer (Yaylak-Kışlak) Yaşam: Coğrafi zorunluluklar nedeniyle Türkler atlı göçebe/konargöçer bir hayat sürmüşlerdir. Çadırlarda (Yurt/Otağ) yaşamışlardır.\n'
            '  • Ekonomik Yapı: En temel geçim kaynağı HAYVANCILIKTIR (koyun, at, sığır).\n'
            '  • Atın Evcilleştirilmesi: Türkler dünyada atı ilk evcilleştiren ve savaş aracı olarak en etkin kullanan milletlerdendir. At sayesinde binlerce kilometrelik alanlara hızla yayılmışlardır.\n'
            '  • Diğer Uğraşlar: Dokumacılık (yün, kilim), madencilik (demir, altın, tunç), deri işlemeciliği ve sulama kanalları çevresinde sınırlı tarım.',
      ],
      goldenRule: '💡 BOZKIR ŞARTLARI = SAVAŞÇI MİLLET:\n'
          'Sert doğa şartları ve konargöçer yaşam biçimi, Türklere dayanıklılık, disiplin, bağımsızlık tutkusu ve teşkilatçılık kazandırmıştır. Bu yüzden her Türk aynı zamanda bir asker kabul edilmiştir (Ordu-Millet anlayışı).',
    ),

    // BÖLÜM 2: TÜRK ADININ ANLAMI & TÜRKİYE KAVRAMI
    LectureSection(
      title: '2. Türk Adının Anlamı & Coğrafi Ad Olarak Türkiye',
      type: LectureSectionType.ruleList,
      leadText: 'Tarih boyunca farklı kaynak ve dönemlerde "Türk" adı ve "Türkiye" coğrafi tanımı çeşitli anlamlarla ifade edilmiştir.',
      bulletPoints: [
        'Kaynaklara Göre Türk Adının Anlamları:\n'
            '  • Çin Kaynaklarında: "Miğfer" (Altay Dağları\'nın miğfere benzemesinden dolayı).\n'
            '  • Kaşgarlı Mahmud (Dîvânu Lugâti\'t-Türk): "Olgunluk Çağı".\n'
            '  • Ziya Gökalp: "Töreli", "Nizam sahibi", "Kanun ve kurala bağlı".\n'
            '  • Uygur Metinlerinde: "Güç", "Kuvvet", "Kudretli".\n'
            '  • A. Wambery\'ye Göre: "Türemek", çoğalmak, yaratılmış olmak.\n'
            '  • İran/Fars Kaynaklarında: "Güzel insan".',
        'Coğrafi Bir Ad Olarak Türkiye:\n'
            '  • VI. Yüzyıldan İtibaren Bizans Kaynaklarında: Orta Asya için "Türkiye" (Tourkia) ifadesi kullanılmıştır.\n'
            '  • IX. ve X. Yüzyıllarda: Volga\'dan Orta Avrupa\'ya kadar uzanan Hazar ve Karadeniz kuzeyi coğrafyasına Türkiye denmiştir.\n'
            '  • XI. - XIII. Yüzyıllarda: Mısır ve Suriye Memlûk Devleti sahası "et-Devletü\'t-Türkiyye" olarak anılmıştır.\n'
            '  • XII. Yüzyıldan (1176 Miryokefalon Zaferi) İtibaren: Avrupalı seyyahlar ve Bizanslılar ANADOLU için "Türkiye" adını kullanmışlardır.',
      ],
      osymTrap: '⚠️ SİYASİ AD OLARAK İLK KULLANAN DEVLET:\n'
          'Türk adını resmi/siyasi bir devlet adı olarak tarihte İLK KEZ kullanan devlet KÖK TÜRK (GÖKTÜRK) DEVLETİ\'dir!',
    ),

    // BÖLÜM 3: ORTA ASYA KÜLTÜR MERKEZLERİ & İSKİTLER
    LectureSection(
      title: '3. Orta Asya Kültür Merkezleri & İskitler (Sakalar)',
      type: LectureSectionType.comparison,
      imageAssetPath: 'assets/images/tarih/tarih_orta_asya_kultur_merkezleri.png',
      imageCaption: 'Harita 1.2: Orta Asya Tarih Öncesi Kültür Merkezleri ve Arkeolojik Kazı Alanları',
      leadText: 'Orta Asya\'da yapılan arkeolojik kazılar sonucunda MÖ 5000\'lere kadar uzanan zengin kültür katmanları tespit edilmiştir.',
      bulletPoints: [
        'Orta Asya Arkeolojik Kültür Merkezleri:\n'
            '  • 1. Anav Kültürü (Aşkabat/Türkmenistan): Orta Asya\'nın bilinen EN ESKİ kültürüdür. At ilk kez burada evcilleştirilmiş; yerleşik tarım ve seramik izleri bulunmuştur.\n'
            '  • 2. Kelteminar Kültürü (Aral Gölü Çevresi): Avcılık ve balıkçılıkla uğraşan, neolitik yaşam süren toplulukların kültürüdür.\n'
            '  • 3. Afanasyevo Kültürü (Altay-Sayan Dağları): Türklerin bilinen EN ESKİ arkeolojik ve etnik kültürü kabul edilir. Çakmak taşından aletler ve bakır eşyalar bulunmuştur.\n'
            '  • 4. Andronovo Kültürü (Yenisey Çevresi): Afanasyevo kültürünün genişlemiş halidir. Tunç ve altın madeni işlenmiş, ilk kez tekerlekli araba izleri görülmüştür.\n'
            '  • 5. Karasuk Kültürü (Yenisey/Demir): Dünyada DEMİR MADENİNİN ilk kez işlendiği ve dört tekerlekli keçe çadır arabaların yapıldığı merkezdir.\n'
            '  • 6. Tagar Kültürü (Abakan Bölgesi): Orta Asya kültürleri içinde EN GELİŞMİŞ ve günümüze en yakın olanıdır. Hayvan üslubunda kabartma eşyalar ve hançerler bulunmuştur.',
        'İskitler (Sakalar - MÖ VIII - II. Yüzyıl):\n'
            '  • Tarihte bilinen İLK TÜRK TOPLULUĞUDUR (Devlet değil, atlı göçebe federasyonudur!).\n'
            '  • En önemli hükümdarları ALP ER TUNGA\'dır. Firdevsi\'nin Şehnâme eserinde "Afrasiyap" adıyla anılır.\n'
            '  • Dünyanın bilinen İLK KADIN HÜKÜMDARI "TOMRİS HATUN" İskitlere liderlik etmiştir.\n'
            '  • Maden işlemeciliğindeki eşsiz ustalıkları nedeniyle tarihte "BOZKIRIN KUYUMCULARI" olarak adlandırılmışlardır.\n'
            '  • Sanatta "HAYVAN ÜSLUBU" akımını başlatmış; at koşum takımlarını, üzengiyi ve pantolonu yaygınlaştırmışlardır.\n'
            '  • Destanları: Alp Er Tunga Destanı ve Şu Destanı.',
      ],
      goldenRule: '💡 İLK TOPLULUK VS İLK DEVLET:\n'
          'Tarihte bilinen İLK TÜRK TOPLULUĞU = İSKİTLER (Sakalar)\n'
          'Tarihte kurulan İLK TEŞKİLATLI TÜRK DEVLETİ = ASYA HUN DEVLETİ\'dir.',
    ),

    // BÖLÜM 4: ORTA ASYA TÜRK GÖÇLERİ
    LectureSection(
      title: '4. Orta Asya Türk Göçleri, Nedenleri & Göç Yolları',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_orta_asya_goc_yollari.png',
      imageCaption: 'Harita 1.3: Orta Asya\'dan Dünyaya Yayılan Türk Göç Güzergâhları',
      leadText: 'Türkler MÖ XVI. yüzyıldan itibaren anayurtları Orta Asya\'dan dünyanın dört bir yanına göç etmişlerdir.',
      bulletPoints: [
        'Göçlerin Temel Nedenleri:\n'
            '  • İklim ve Kuraklık: Otlakların kuruması, meraların yetersiz kalması, şiddetli kışlar ve hayvan hastalıkları (Kıran salgını).\n'
            '  • Nüfus Artışı: Hızlı nüfus artışı karşısında mevcut toprakların yetersiz kalması.\n'
            '  • Dış Baskılar: Özellikle Çin ve Moğol (Tunguz/Kitan) kavimlerinin askeri ve siyasi baskıları.\n'
            '  • Boylar Arası Mücadeleler: Yenilen Türk boyunun esareti kabul etmeyip yeni yurt arayışına girmesi.\n'
            '  • Cihan Hâkimiyeti Düşüncesi: Güneşin doğduğu yerden battığı yere kadar dünyayı yönetme mefkûresi (Türk Cihan Hâkimiyeti / Kızılelma).\n'
            '  • Bağımsızlık Tutkusu: Başka bir devletin boyunduruğu altına girmeyi reddetme anlayışı.',
        'Göç Güzergâhları ve Sonuçları:\n'
            '  • Kuzeye gidenler: Sibirya\'ya yerleşmişlerdir (Yakutlar/Salar).\n'
            '  • Batıya gidenler: Hazar\'ın kuzeyinden Karadeniz kıyılarına ve Avrupa içlerine (Hunlar, Avarlar, Bulgarlar, Macarlar, Peçenekler, Kumanlar).\n'
            '  • Güneye gidenler: Hindistan ve Afganistan\'a (Akhunlar, Gazneliler, Babürler).\n'
            '  • Güneybatıya gidenler: İran, Irak, Suriye ve Anadolu\'ya (Selçuklular, Osmanlılar).\n'
            '  • Sonuç: Türk kültürü çok geniş bir coğrafyaya yayılmış; atın evcilleştirilmesi ve demir madeni dünyaya öğretilmiştir. Türk tarihini tek bir coğrafyada incelemek imkânsız hale gelmiştir.',
      ],
    ),

    // BÖLÜM 5: ASYA HUN DEVLETİ (BÜYÜK HUN)
    LectureSection(
      title: '5. Asya (Büyük) Hun Devleti (MÖ 220 - MS 216)',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_asya_hun_devleti.png',
      imageCaption: 'Harita 1.4: Asya Hun Devleti Sınırları ve Ötüken Başkenti',
      leadText: 'Orta Asya\'da kurulan tarihteki İLK TEŞKİLATLI TÜRK DEVLETİ Asya Hun Devleti\'dir. Başkenti kutsal toprak kabul edilen Ötüken\'dir.',
      bulletPoints: [
        'Kuruluş ve Teoman Dönemi:\n'
            '  • Bilinen ilk hükümdarı TEOMAN\'dır (Çin kaynaklarında Tuman).\n'
            '  • Dağınık Türk boylarını bir araya toplamış, Çin ve Yüeçiler ile savaşmıştır.\n'
            '  • Teoman\'ın akınlarını durduramayan Çinliler MÖ 214 yılında ÇİN SEDDİ\'ni inşa etmeye başlamışlardır.',
        'En Parlak Dönem: METE HAN (MÖ 209 - MÖ 174):\n'
            '  • MÖ 209 Tahta Çıkış Yılı: Günümüzde TÜRK KARA KUVVETLERİ\'NİN KURULUŞ YILI olarak kabul edilir.\n'
            '  • Onlu Askeri Teşkilat: Dünya ordularına model olan Onbaşı, Yüzbaşı, Binbaşı ve Tümen (10.000) sistemini kurmuştur.\n'
            '  • Islıklı Ok: Askerlerin yönünü ve hedefini sesle belirleyen ıslıklı oku icat etmiştir.\n'
            '  • İlk Siyasi Birlik: Orta Asya\'daki 26 Türk ve bozkır boyunu tek bayrak altında toplayarak İLK KEZ TÜRK SİYASİ BİRLİĞİNİ kurmuştur.\n'
            '  • Çin Seferi ve Baideng Kuşatması: Çin\'i mağlup edip vergiye bağlamış, ancak kalabalık Çin nüfusu içinde Türklerin milli benliklerini kaybetmemesi (asimile olmaması) için Türklerin Çin\'e yerleşmesini yasaklamıştır.\n'
            '  • Vatan Sevgisi: Tunguzların çorak bir toprak parçası talebine "Toprak devletin temelidir, kimseye verilemez!" diyerek tarihte vatan sevgisinden bahseden ilk Türk hükümdarı olmuştur.\n'
            '  • Edebi Miras: Hunlara ait OĞUZ KAĞAN DESTANI\'ndaki efsanevi kahraman Oğuz Kağan, Mete Han ile özdeşleştirilir.',
        'Yıkılış Süreci:\n'
            '  • Ki-ok ve sonraki dönemlerde Çinli prenseslerle yapılan evlilikler saray entrikalarını artırmıştır.\n'
            '  • Ho-han-ye Çin egemenliğine girmeyi teklif etmiş; kardeşi Çi-çi "Bağımsızlığı feda etmek utanç vericidir" diyerek direnmiştir.\n'
            '  • Hunlar Kuzey ve Güney Hunları olarak ikiye ayrılmış, sonrasında yıkılarak batıya göç hareketini başlatmışlardır.',
      ],
      goldenRule: '💡 METE HAN\'IN ÇİN DİPLOMASİSİ:\n'
          'Mete Han Çin\'i tamamen ele geçirebilecek güçte olmasına rağmen oraya yerleşmemiş, sadece vergiye bağlamıştır. Nedeni: Kalabalık Çin nüfusu içinde asimile olmayı önlemek ve milli kimliği korumaktır.',
    ),

    // BÖLÜM 6: KAVİMLER GÖÇÜ (375)
    LectureSection(
      title: '6. Kavimler Göçü (375) ve Dünya Tarihindeki Sonuçları',
      type: LectureSectionType.ruleList,
      leadText: 'Kuzey Hunlarının Balamir önderliğinde Volga (İdil) nehrini geçerek batıya doğru ilerlemesiyle dünya tarihini kökten değiştiren Kavimler Göçü başlamıştır.',
      bulletPoints: [
        'Kavimler Göçü\'nün Gelişimi:\n'
            '  • Hunların önünden kaçan Ostrogot, Vizigot, Vandal, Süev, Frank, Burgund, Sakson ve Angıl gibi barbar kavimler Roma İmparatorluğu sınırlarına yığılmış ve imparatorluğu sarsmıştır.',
        'Dünya Tarihini Değiştiren Sonuçları:\n'
            '  • 1. Çağ Değişimi: İLK ÇAĞ kapandı, ORTA ÇAĞ başladı.\n'
            '  • 2. Roma\'nın Parçalanması: Roma İmparatorluğu 395\'te Doğu Roma (Bizans) ve Batı Roma olarak ikiye ayrıldı. Batı Roma 476\'da yıkıldı.\n'
            '  • 3. Feodalite (Derebeylik): Avrupa\'da merkezi krallıklar zayıfladı; şatolar ve derebeylik rejimi ortaya çıktı.\n'
            '  • 4. Skolastik Düşünce: Katolik Kilisesi ve Papalık mutlak güç kazandı; dogmatik düşünce Avrupa\'ya egemen oldu.\n'
            '  • 5. Günümüz Avrupa Milletleri: Göç eden kavimlerin yerli halkla kaynaşması sonucu günümüzün İngiliz, Fransız, Alman, İspanyol gibi milletleri teşekkül etti.\n'
            '  • 6. Avrupa Hun Devleti Kuruldu: Avrupa\'da ilk teşkilatlı Türk devleti Macaristan merkezli kuruldu; at koşum takımları, pantolon ve ceket Avrupa\'ya taşındı.',
      ],
    ),

    // BÖLÜM 7: AVRUPA HUN DEVLETİ & ATTİLA
    LectureSection(
      title: '7. Avrupa Hun Devleti (375 - 469) & "Tanrının Kırbacı" Attila',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_kavimler_gocu_avrupa_hun.png',
      imageCaption: 'Harita 1.5: Kavimler Göçü Güzergâhları ve Avrupa Hun Devleti',
      leadText: 'Balamir önderliğinde Macaristan merkezli kurulan Avrupa Hun Devleti, Attila döneminde Avrupa\'nın en büyük askeri gücü haline gelmiştir.',
      bulletPoints: [
        'Balamir ve Uldız Dönemi:\n'
            '  • Balamir devletin ilk kurucusudur.\n'
            '  • Uldız Dönemi Dış Politikası: "Güneşin battığı yere kadar her yeri zapt ederim" demiştir. Doğu Roma\'yı (Bizans) baskı altına alıp Batı Roma ile dostane ilişkiler sürdürmüştür. Trakya üzerinden Anadolu\'ya ilk Türk akınlarını yaptırmıştır.',
        'En Parlak Dönem: ATTİLA (434 - 453):\n'
            '  • Doğu Roma Seferleri: I. ve II. Balkan Seferleri sonucunda Bizans\'ı mağlup etmiş; 434 MARGOS BARIŞI ve 447 ANATOLİOS ANTLAŞMASI ile Bizans\'ı ağır vergilere bağlamıştır.\n'
            '  • Batı Roma Seferleri:\n'
            '    - 451 Galya Seferi: Romalı komutan Flavius Aetius ile Katalon (Campus Mauriacus) Savaşı yapılmıştır.\n'
            '    - 452 İtalya Seferi: Roma kapılarına dayanmış; Papa I. Leo bizzat karargâha gelerek barış dilemiştir. Attila Roma\'yı yağmalamaktan vazgeçmiştir.\n'
            '  • Roma\'yı İstiladan Vazgeçme Nedenleri: Papa\'nın ricası, Roma\'nın Hristiyanlarca kutsal sayılması, orduda baş gösteren veba salgını ve Doğu Sasani tehlikesinin belirmesi.\n'
            '  • Unvanları ve Edebiyat: Avrupalılar günahları yüzünden Tanrı\'nın onları cezalandırmak için gönderdiğine inanarak "FLAGELLUM DEI" (Tanrının Kırbacı) demişlerdir. "Cesur Kavimlerin Efendisi" olarak anılmıştır. Almanların NİBELUNGEN DESTANI\'nda barışsever, asil ve adil kral "ETZEL" adıyla yer almıştır.',
      ],
    ),

    // BÖLÜM 8: I. VE II. KÖK TÜRK DEVLETİ
    LectureSection(
      title: '8. I. ve II. Kök Türk (Göktürk) Devleti (552 - 744)',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_kok_turk_devleti.png',
      imageCaption: 'Harita 1.6: Kök Türk Devleti Hâkimiyet Alanı ve İpek Yolu Güzergâhı',
      leadText: 'Tarihte "Türk" adını siyasi ve resmi devlet adı olarak kullanan İLK DEVLETTİR. Başkenti Ötüken\'dir.',
      bulletPoints: [
        'I. Kök Türk Devleti (552 - 630):\n'
            '  • Kurucu: BUMİN KAĞAN (Avar hâkimiyetine son vererek devleti kurmuş ve İl Kağan unvanını almıştır).\n'
            '  • İkili Teşkilat: Bumin Kağan doğuyu yönetirken, batının idaresini kardeşi İSTEMİ YABGU\'ya vermiştir.\n'
            '  • İstemi Yabgu\'nun İpek Yolu Diplomasisi:\n'
            '    - İpek Yolu ticaretini denetlemek için önce Sasaniler ile anlaşıp Akhun Devleti\'ni yıkmıştır.\n'
            '    - Ardından Sasanilere karşı Bizans İmparatorluğu ile ittifak kurmuştur (Orta Asya\'dan Bizans\'a elçi [Manyak] gönderen ilk Türk devletidir).\n'
            '  • En Parlak Dönem: MUKAN KAĞAN dönemidir. Çin\'i baskı altına almış, sınırları genişletmiştir.\n'
            '  • 582 yılında Doğu ve Batı olarak ikiye ayrılmış, ardından Çin hâkimiyetine girerek 50 yıllık esaret dönemi başlamıştır.',
        'Kürşad İhtilali (639):\n'
            '  • Çin sarayını basarak bağımsızlığı kazanmak isteyen 39 arkadaşıyla kahramanca şehit düşen Kürşad, Türk tarihindeki ilk milli bağımsızlık ayaklanması sembolüdür.',
        'II. Kök Türk (Kutluk) Devleti (682 - 744):\n'
            '  • Kurucu: KUTLUK KAĞAN. Dağınık boyları toplayıp devleti yeniden kurduğu için kendisine "İlteriş" (İli toplayan/derleyen) unvanı verilmiştir.\n'
            '  • Vezir Tonyukuk: "Türklerin Bismarck\'ı" ve ilk Türk tarihçisi/yazarı kabul edilen bilge vezirdir.\n'
            '  • En Parlak Dönem: BİLGE KAĞAN ve kardeşi ordu komutanı KÖL TİGİN dönemidir. Karluk, Basmil ve Uygur boylarının isyanı sonucu yıkılmıştır.',
      ],
    ),

    // BÖLÜM 9: ORHUN ABİDELERİ & UYGUR DEVLETİ
    LectureSection(
      title: '9. Orhun Abideleri (Bengü Taşlar) & Uygur Devleti (744 - 840)',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_orhun_abideleri_kitabe.png',
      imageCaption: 'Görsel 1.7: Moğolistan Orhun Vadisi Bilge Kağan ve Kül Tigin Bengü Taşları (Orhun Abideleri)',
      leadText: 'Türk tarihinin ve edebiyatının İLK YAZILI ESERLERİ Orhun Abideleri\'dir. Uygurlar ise yerleşik hayata geçen ilk Türk devletidir.',
      bulletPoints: [
        'Orhun Abideleri (Bengü Taşlar):\n'
            '  • Yazıtlar II. Kök Türk Devleti döneminde dikilmiştir. 38 harfli milli Kök Türk Alfabesi kullanılmıştır.\n'
            '  • Kimlerin Adına Dikildi?\n'
            '    - 720: Vezir Tonyukuk Yazıtı (Bizzat kendisi yazmıştır, anı/hatırat türünün ilk örneğidir).\n'
            '    - 732: Köl Tigin Yazıtı (Yollug Tigin tarafından yazılmıştır).\n'
            '    - 735: Bilge Kağan Yazıtı (Yollug Tigin tarafından yazılmıştır).\n'
            '  • Önemi: Türk adının geçtiği, devlet adamlarının millete hesap verdiği ilk siyasetname ve Türk milli edebiyatının ilk şaheseridir. Danimarkalı dilbilimci Vilhelm Thomsen tarafından 1893\'te okunmuştur. İlk okunan kelime "TENGRI" (Tanrı) ve "TÜRK"tür.',
        'Uygur Devleti (744 - 840):\n'
            '  • Kurucu: KUTLUK BİLGE KÜL KAĞAN. Başkent Karabalgasun (Ordu-Balık).\n'
            '  • Bögü Kağan Dönemi ve Maniheizm:\n'
            '    - 762 yılında Çin seferi sırasında Maniheizm (Mani) dinini kabul etmişlerdir.\n'
            '    - Mani dini et yemeyi ve savaşmayı yasakladığı için Uygurların savaşçı özellikleri zayıflamıştır.\n'
            '    - Buna karşılık tarıma, bilime, sanata yönelmişler; YERLEŞİK HAYATA GEÇEN İLK TÜRK DEVLETİ olmuşlardır.\n'
            '  • Uygur Medeniyetinin İlkleri:\n'
            '    - Şehirler (Balık), saraylar, evler ve tapınaklar (Stupa) inşa ederek Türk mimarisini başlatmışlardır.\n'
            '    - 18 harfli Uygur Alfabesini hazırlamışlar, hareketli harf sistemine sahip AHŞAP MATBAA ve KÂĞIT üretmişlerdir.\n'
            '    - İlk Türk kütüphanelerini kurmuşlar, duvar resimleri (Fresko) ve minyatür sanatını geliştirmişlerdir.\n'
            '    - Hukuku yazılı hale getirmişler, faizle borç para vererek ilk bankacılık ve senet sistemini uygulamışlardır.\n'
            '    - Orta oyunu ve tiyatro sanatının ilk örneklerini vermişlerdir.',
      ],
      goldenRule: '💡 YERLEŞİK HAYATIN KESİN KANITLARI:\n'
          'Saray, tapınak, ev mimarisi, sulama kanalları (Tötö kanalı), tohumluk ambarlar ve duvar resimleri (fresko) yerleşik hayata geçildiğinin KESİN kanıtıdır.',
    ),

    // BÖLÜM 10: İLK TÜRK DEVLETLERİNDE KÜLTÜR VE MEDENİYET
    LectureSection(
      title: '10. Devlet Teşkilatı, Hükümdar, Kut İnancı & İkili Sistem',
      type: LectureSectionType.ruleList,
      leadText: 'İslamiyet öncesi Türk devletleri, kut anlayışı, töre ve güçlü merkezi teşkilatlanma temelleri üzerine kurulmuştur.',
      bulletPoints: [
        'Kut İnancı ve Veraset Sistemi:\n'
            '  • Devleti yönetme yetkisinin Gök Tanrı tarafından hükümdara ve onun ailesine bağışlandığı inancına "KUT" denir.\n'
            '  • Kan yoluyla babadan oğula geçtiği kabul edildiğinden, hükümdar ailesindeki tüm erkeklerin tahta çıkma hakkı vardı ("Ülke hanedanın ortak malıdır").\n'
            '  • Bu anlayış sık sık taht kavgalarına ve Türk devletlerinin kısa sürede parçalanmasına yol açmıştır.',
        'Hükümdarlık Unvanları ve Alametleri:\n'
            '  • Unvanlar: Kağan, Hakan, Han, Yabgu, İlteber, İdikut, Tanhu, Şanyü, Erkin.\n'
            '  • Hükümdarlık Alametleri: Otağ (çadır), Taht (örgin), Tuğ (sancak), Davul (köbürge), Kotuz/Sorguç, Kemer (kur), Kılıç, Yay.',
        'İkili Teşkilat (Çifte İdare):\n'
            '  • Ülke Doğu ve Batı olarak ikiye ayrılırdı. Güneşin doğduğu yer kutsal sayıldığı için Asıl Kağan DOĞUDA otururdu.\n'
            '  • Batıyı ise kağana bağlı olarak hanedandan "Yabgu" unvanlı tecrübeli prens yönetirdi.',
        'Hatun (Katun):\n'
            '  • Hükümdarın eşidir. Kurultaya katılır, elçileri kabul eder, hükümdar yokken devleti temsil ederdi. Türklerde kadına verilen yüksek değerin kanıtıdır.',
        'Kurultay (Toy / Kengeş):\n'
            '  • Devlet işlerinin görüşüldüğü danışma ve karar meclisidir. Boy beyleri, hatun ve devlet ileri gelenleri (Toygun) katılırdı. Hükümdar seçiminde ve töre değişikliklerinde belirleyiciydi.',
      ],
    ),

    // BÖLÜM 11: TOPLUMSAL YAPI, TÖRE (HUKUK) & ORDU
    LectureSection(
      title: '11. Toplumsal Yapı, Töre (Hukuk) & Ordu Sistemi',
      type: LectureSectionType.comparison,
      leadText: 'Eski Türk toplumunda sınıflaşma ve kölelik yoktur; toplum eşitlikçi bir akrabalık bağıyla örülmüştür.',
      bulletPoints: [
        'Toplumsal Yapının Basamakları:\n'
            '  • 1. Oguş: Aile (toplumun en küçük hücresi).\n'
            '  • 2. Urug: Aileler birliği (Sülale).\n'
            '  • 3. Boy (Bod): Sülaleler birliği (Boy beyi idare eder).\n'
            '  • 4. Bodun: Boylar birliği (Millet).\n'
            '  • 5. İl (El): Devlet (Milletin teşkilatlanmış en üst formu).',
        'Töre ve Hukuk Sistemi:\n'
            '  • Yazısız hukuk kurallarına "TÖRE" denir. Törenin oluşumunda gelenekler, kurultay kararları ve kağan emirleri etkiliydi.\n'
            '  • Kağan dahil herkes töreye uymak zorundaydı (Hukukun üstünlüğü).\n'
            '  • Törenin Değişmez 4 İlkesi: Könilik (Adalet), Uzluk (İyilik/Faydalılık), Tüzlük (Eşitlik), Kişilik/İnsanlık (Evrensellik).\n'
            '  • Konargöçer hayat şartları nedeniyle hapis cezaları genellikle KISA SÜRELİ (en fazla 10 gün) olmuştur. Adam öldürme, vatana ihanet ve zina gibi ağır suçların cezası idamdı.',
        'Ordu Sistemi:\n'
            '  • Ordu-Millet anlayışı egemendir; eli silah tutan herkes askerdir, paralı askerlik YOKTUR (Hazarlar hariç!).\n'
            '  • Mete Han\'ın kurduğu ONLU SİSTEM uygulanmıştır.\n'
            '  • Savaş Taktikleri: Hilal Taktiği (Turan / Sahte Ric\'at / Kurt Kapanı) en temel taktikti. Keşif birliklerine "Yelme" denirdi.',
      ],
    ),

    // BÖLÜM 12: DİN, İNANIŞ, SANAT VE EKONOMİ
    LectureSection(
      title: '12. Din ve İnanış, Kurgan, Balbal, Sanat & Ekonomi',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_kurgan_ve_balbal.png',
      imageCaption: 'Görsel 1.8: Bozkır Kurgan Mezar Yapısı ve Mezar Başı Balbal Taşları',
      leadText: 'Eski Türklerde tek yaratıcıya inanılan Gök Tanrı inancı egemendi; ölümden sonraki hayata (ahiret) güçlü şekilde inanılırdı.',
      bulletPoints: [
        'Dini Terimler ve Ahiret İnancı:\n'
            '  • Gök Tanrı: Tek ve ulu yaratıcıdır.\n'
            '  • Ahiret İnancının Kanıtları:\n'
            '    - Kurgan: Mezar odalarıdır. Ölen kişi eşyaları, silahları ve atıyla birlikte gömülürdü.\n'
            '    - Balbal: Kurganların etrafına dikilen, ölen kişinin hayattayken öldürdüğü düşman sayısı kadar insan biçimli taş heykelciklerdir (Ahirette o kişiye hizmet edeceklerine inanılırdı; Türk heykel sanatının ilk örnekleridir).\n'
            '    - Uçmağ: Cennet; Tamu: Cehennem.\n'
            '    - Yuğ: Cenaze töreni; Sagu: Cenazelerde yakılan ağıt.',
        'Sanat ve Maddi Kültür:\n'
            '  • Hayvan Üslubu: Çadırlar, kemerler, kılıç kınları, kazanlar kartal, kurt, geyik, pars figürleriyle bezenmiştir.\n'
            '  • Maden İşlemeciliği: Demir ve altın işçiliğinde zirveye çıkılmıştır. Kazakistan\'da bulunan "ALTIN ELBİSELİ ADAM" zırhı (İskit/Hun) ve Pazırık Kurganı\'ndaki DÜNYANIN EN ESKİ HALISI (Pazırık Halısı) bu dönemin şaheseridir.',
      ],
    ),

    // BÖLÜM 13: DİĞER TÜRK DEVLETLERİ VE TOPLULUKLARI
    LectureSection(
      title: '13. Diğer Türk Devletleri ve Toplulukları',
      type: LectureSectionType.ruleList,
      leadText: 'Orta Asya, Kafkaslar, Karadeniz\'in kuzeyi ve Balkanlar\'da varlık gösteren diğer önemli Türk boy ve devletleri:',
      bulletPoints: [
        'Avarlar (Juan-Juan):\n'
            '  • Hem Asya\'da hem Avrupa\'da devlet kurmuşlardır. İSTANBUL\'U KUŞATAN İLK TÜRK DEVLETİDİR (Sasaniler ile ortaklaşa 619 ve 626\'da).\n'
            '  • Üzengiyi Avrupa\'ya tanıtmışlardır. Franklar tarafından yıkılmışlardır.',
        'Hazarlar:\n'
            '  • Kafkaslar ve Hazar Denizi çevresinde kurulmuşlardır. YAHUDİLİĞİ (Museviliği) KABUL EDEN İLK VE TEK TÜRK DEVLETİDİR.\n'
            '  • Hz. Osman döneminde Müslüman ordularıyla (Belencer Savaşı) savaşarak İslamiyet\'in Kafkaslara yayılmasını geciktirmişlerdir.\n'
            '  • Tüccar bir devlettir; ordularında PARALI ASKER kullanan ilk Türk devletidir. Hazar Barış Çağı (Pax Hazarica) yaşatmışlardır.',
        'Bulgarlar:\n'
            '  • İtil (Volga) Bulgarları: İSLAMİYET\'İ KABUL EDEN İLK TÜRK DEVLETİ kabul edilir (Almış Han dönemi - İbn Fadlan Seyahatnamesi).\n'
            '  • Tuna Bulgarları: Hristiyanlığı kabul ederek Slavlaşmış ve asimile olmuşlardır (Kurum Han).',
        'Peçenekler, Uzlar (Oğuzlar) ve Kumanlar (Kıpçaklar):\n'
            '  • Peçenekler ve Uzlar: Devlet kuramamış, boy halinde yaşamışlardır. Bizans ordusunda paralı askerlik yapmışlar; 1071 MALAZGİRT SAVAŞI\'nda Selçuklu safına geçerek zaferin kazanılmasında belirleyici rol oynamışlardır.\n'
            '  • Kumanlar (Kıpçaklar): Dede Korkut Hikâyelerine (Oğuz-Kıpçak mücadeleleri) ve İgor Destanı\'na konu olmuşlardır. "Codex Cumanicus" adında Türkçe-Latince sözlük bırakmışlardır.',
        'Macarlar, Türgişler ve Kırgızlar:\n'
            '  • Macarlar: Hristiyanlığı kabul edip benliklerini kaybetmişlerdir. Dünyada ilk TÜRKO LOJİ ENSTİTÜSÜNÜ Budapeşte\'de kurmuşlardır.\n'
            '  • Türgişler: Hükümdarları Baga Tarkan KENDİ ADINA PARA BASTIRAN İLK TÜRK HÜKÜMDARIDIR. Emeviler ile Haristan Savaşı\'nı yaparak İslamiyet\'in Orta Asya\'ya girmesini bir süre engellemişlerdir.\n'
            '  • Kırgızlar: Dünyanın en uzun destanı olan MANAS DESTANI\'na sahiptirler. Yenisey Kitabeleri\'ni dikmişlerdir.',
      ],
      goldenRule: '💡 MALAZGİRT\'TE TARAF DEĞİŞTİRENLER:\n'
          '1071 Malazgirt Savaşı\'nda Bizans saflarında paralı askerken Alparslan\'ın ordusunu görüp Türk saflarına geçen boylar: PEÇENEKLER ve UZLARDIR (Oğuzlar).',
    ),

    // BÖLÜM 14: PDF ÜNİTE 1 PEKİŞTİRME VE DEĞERLENDİRME SORULARI
    LectureSection(
      title: '14. Ünite 1 MEB Pekiştirme & Konu Değerlendirme Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'MEB Ders Kitabı Ünite 1 sonunda yer alan resmi boşluk doldurma ve değerlendirme soruları ile bilgilerinizi pekiştirin.',
      bulletPoints: [
        'MEB Soru 1: Orta Asya\'da kurulan ilk teşkilatlı Türk devleti hangisidir?\n'
            '  ➜ Doğru Cevap: Asya (Büyük) Hun Devleti (MÖ 220, Kurucu Teoman).',
        'MEB Soru 2: Türk adını siyasi olarak ilk kez kullanan devlet hangisidir?\n'
            '  ➜ Doğru Cevap: I. Kök Türk (Göktürk) Devleti (552, Bumin Kağan).',
        'MEB Soru 3: Yerleşik hayata geçen ve Maniheizm dinini kabul eden ilk Türk devleti hangisidir?\n'
            '  ➜ Doğru Cevap: Uygur Devleti (744, Kutluk Bilge Kül Kağan / Bögü Kağan).',
        'MEB Soru 4: Türk tarihinde parayı kendi adına bastıran ilk Türk hükümdarı kimdir?\n'
            '  ➜ Doğru Cevap: Türgiş hükümdarı Baga Tarkan.',
        'MEB Soru 5: İstanbul\'u kuşatan ilk Türk devleti hangisidir?\n'
            '  ➜ Doğru Cevap: Avarlar (619 ve 626 yıllarında Sasanilerle ortaklaşa).',
        'MEB Soru 6: Türk tarihinin ve edebiyatının ilk yazılı bengü taşları hangisidir?\n'
            '  ➜ Doğru Cevap: Orhun Abideleri (Tonyukuk, Köl Tigin ve Bilge Kağan yazıtları).',
      ],
    ),
  ],
);
