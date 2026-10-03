import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu2TurkIslam = LectureTopic(
  id: 'tarih_turk_islam',
  courseId: 'tarih',
  order: 2,
  title: 'İlk Türk İslam Devletleri',
  subtitle: 'Talas Savaşı, Karahanlılar, Gazneliler, Büyük Selçuklu, Teşkilat & Eserler',
  icon: Icons.mosque_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 11 - 20',
  startTestNum: 11,
  endTestNum: 20,
  estimatedMinutes: 60,
  sections: [
    // BÖLÜM 1: TALAS SAVAŞI VE İSLAMİYET'İN KABULÜ
    LectureSection(
      title: '1. Talas Savaşı (751) & Türklerin İslamiyet\'i Kabulü',
      type: LectureSectionType.overview,
      leadText: 'Türklerin Müslümanlarla komşu olmaları Hz. Ömer devrinde başlamış; Emevilerin ırkçı (mevali) politikası ilişkileri germiş; 751 Talas Savaşı ise Türk tarihi için dönüm noktası olmuştur.',
      bulletPoints: [
        'Talas Savaşı (751):\n'
            '  • Nedenleri: Orta Asya\'da Kök Türk Devleti\'nin yıkılmasıyla ortaya çıkan siyasi boşluktan faydalanmak isteyen Çinliler ile Abbasi Devleti\'nin Batı Türkistan\'a hâkim olma mücadelesidir.\n'
            '  • Gelişim: Savaş sırasında Türk boyu KARLUKLAR Abbasilerin safına geçmiş ve Çin ordusu ağır bir hezimete uğramıştır.\n'
            '  • Sonuçları:\n'
            '    - 1. Orta Asya Çin istilasından ve hâkimiyetinden kesin olarak kurtulmuştur.\n'
            '    - 2. Türkler kitleler halinde İslamiyet\'i kabul etmeye başlamışlardır (İslamiyet\'i benimseyen İLK TÜRK BOYU KARLUKLARDIR).\n'
            '    - 3. Kâğıt, matbaa ve pusula ilk kez Çin dışına çıkarak İslam dünyasında Semerkant\'ta üretilmeye başlanmıştır (Semerkant: "Şehirlerin Şahı").',
        'Türklerin İslamiyet\'i Benimsemesini Kolaylaştıran Faktörler:\n'
            '  • Gök Tanrı inancı ile İslamiyet\'teki Tek Allah inancının birebir örtüşmesi.\n'
            '  • Ahiret, cennet (uçmağ), cehennem (tamu) ve ruhun ölümsüzlüğü anlayışlarının benzerliği.\n'
            '  • Türk töresindeki adalet, doğruluk, yardımlaşma ve cihan hâkimiyeti mefkûresinin İslam\'daki Gaza ve Cihat anlayışıyla özdeşleşmesi.\n'
            '  • Abbasi Devleti\'nin Emeviler gibi ırkçı değil, hoşgörülü ve eşitlikçi politika izlemesi (Türklere ordu ve idarede yer vermeleri, Samarra ordugâh şehrini kurmaları).',
      ],
      goldenRule: '💡 İSLAMİYETİ KABUL EDEN İLKLER:\n'
          '• İlk Türk Boyu: KARLUKLAR\n'
          '• Orta Asya\'da Kuran İlk Türk Devleti: KARAHANLILAR\n'
          '• Avrupa\'da Kuran İlk Türk Devleti: İTİL (VOLGA) BULGARLARI.',
    ),

    // BÖLÜM 2: KARAHANLI DEVLETİ
    LectureSection(
      title: '2. Karahanlı Devleti (840 - 1212) - İlk Müslüman Türk Devleti',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/tarih/tarih_talas_savasi_ve_turk_islam.png',
      imageCaption: 'Harita 2.1: Karahanlı Devleti Hâkimiyet Alanı ve Başkentleri (Balasagun & Kaşgar)',
      leadText: 'Orta Asya\'da kurulan İLK MÜSLÜMAN TÜRK DEVLETİDİR. Karluk, Yağma, Çiğil ve Tuhsi boylarının birleşmesiyle kurulmuştur.',
      bulletPoints: [
        'Siyasi Gelişmeler:\n'
            '  • Kurucu: BİLGE KÜL KADİR HAN. Başkent Balasagun, ardından Kaşgar.\n'
            '  • İslamiyet\'in Kabulü: SATUK BUĞRA HAN döneminde İslamiyet resmi din ilan edilmiştir. Satuk Buğra Han Müslüman olunca "Abdülkerim" adını ve "El-Mücahit / El-Gazi" unvanını almıştır.\n'
            '  • Yusuf Kadir Han döneminde en parlak devrini yaşamış, sonrasında Doğu ve Batı olarak ikiye ayrılmıştır.',
        'Milli Kimlik ve Kültürel Özellikleri:\n'
            '  • Karahanlılar halkı, ordusu ve yöneticileri tamamen Türk olan bir coğrafyada kurulduğu için TÜRK MİLLİ BENLİĞİNİ KESİNTİSİZ KORUMUŞLARDIR.\n'
            '  • Resmi dilleri TÜRKÇE (Hakaniye lehçesi)\'dir. Türkçeyi devlet yazışmalarında ve edebi eserlerde kullanmışlardır.\n'
            '  • Türk-İslam Medeniyetinin İlkleri:\n'
            '    - RİBAT adı verilen ilk Türk-İslam kervansaraylarını inşa etmişlerdir.\n'
            '    - BİMARHANE adı verilen ilk tam teşekküllü hastaneleri kurmuşlardır.\n'
            '    - İlk Türk-İslam medreselerini (Semerkant Medresesi) açmışlar ve ilk burslu öğrencilik sistemini başlatmışlardır.\n'
            '    - İlk posta ve istihbarat teşkilatını kurmuşlardır.',
      ],
    ),

    // BÖLÜM 3: GAZNELİ DEVLETİ
    LectureSection(
      title: '3. Gazneli Devleti (963 - 1187) & Sultan Mahmud',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_gazneli_devleti.png',
      imageCaption: 'Harita 2.2: Gazneli Devleti Hâkimiyet Alanı ve Sultan Mahmud\'un Seferleri',
      leadText: 'Afganistan\'ın Gazne şehrinde kurulan, çok uluslu imparatorluk yapısına sahip büyük bir Türk-İslam devletidir.',
      bulletPoints: [
        'Kuruluş ve Gelişim:\n'
            '  • Kurucu: ALP TEGİN (Samanoğulları ordusundaki Türk komutan).\n'
            '  • En Parlak Dönem: SULTAN MAHMUD (Gazneli Mahmud) dönemidir.',
        'Sultan Mahmud ve Hindistan Seferleri:\n'
            '  • Tarihte "SULTAN" unvanını kullanan İLK TÜRK HÜKÜMDARIDIR (Abbasi Halifesini Şii Büveyhoğulları baskısından kurtardığı için halife tarafından bu unvan verilmiştir).\n'
            '  • Hindistan\'a tam 17 SEFER düzenlemiştir (En meşhuru Somnat Seferi\'dir).\n'
            '  • Seferlerin Sonuçları: İslamiyet Hindistan, Pakistan ve Bangladeş coğrafyasına yayılmış; Hindistan\'ın kast sistemi ağır darbe almıştır.\n'
            '  • Bilime Verdiği Önem: Ünlü bilim insanı BİRUNİ için "Sarayımın en değerli hazinesi" demiştir.',
        'Yıkılış Süreci:\n'
            '  • Gazneli Mesut döneminde Büyük Selçuklular ile yapılan 1040 DANDANAKAN SAVAŞI hezimetle sonuçlanmış; devlet yıkılış sürecine girmiş ve Afgan yerlileri Gurlular tarafından yıkılmıştır.',
      ],
      goldenRule: '💡 KARAHANLI VS GAZNELİ FARKI:\n'
          'Karahanlıların dili tamamen Türkçe iken; Gaznelilerde sarayda Türkçe, bilimde Arapça, edebiyatta Farsça kullanılmıştır. Gaznelilerin halkının çok uluslu (Hint, Afgan, Fars, Türk) olması kısa sürede yıkılmalarında etkili olmuştur.',
    ),

    // BÖLÜM 4: BÜYÜK SELÇUKLU DEVLETİ
    LectureSection(
      title: '4. Büyük Selçuklu Devleti (1040 - 1157) & Malazgirt',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_buyuk_selcuklu_devleti.png',
      imageCaption: 'Harita 2.3: Büyük Selçuklu Devleti Sınırları ve Anadolu Seferleri',
      leadText: 'Oğuzların Kınık boyu tarafından kurulan, İslam dünyasının koruyuculuğunu üstlenen ve Anadolu\'nun kapılarını Türklere açan cihanşümul imparatorluktur.',
      bulletPoints: [
        'Kuruluş: Tuğrul ve Çağrı Beyler:\n'
            '  • 1040 Dandanakan Savaşı: Gazneliler mağlup edilerek devlet resmen kurulmuştur.\n'
            '  • 1048 Pasinler Savaşı: Bizans ve Gürcü kuvvetlerine karşı kazanılan İLK BÜYÜK SELÇUKLU-BİZANS SAVAŞIDIR. Anadolu\'ya keşif ve akın dönemi başlamıştır.\n'
            '  • 1055 Bağdat Seferi: Tuğrul Bey Abbasi Halifesini Şii Büveyhoğullarından kurtarmış; Halife Tuğrul Bey\'e altın kılıç kuşatarak "DOĞUNUN VE BATININ HÜKÜMDARI" unvanını vermiştir. İslam dünyasının siyasi liderliği Türklere geçmiştir.',
        'Sultan Alparslan ve 1071 MALAZGİRT ZAFERİ:\n'
            '  • Hıristiyan dünyasının müstahkem Ani Kalesi\'ni fethederek "Ebü\'l-Feth" (Fetihlerin Babası) unvanını almıştır.\n'
            '  • 26 Ağustos 1071 Malazgirt Meydan Muharebesi: Bizans İmparatoru Romen Diyojen\'in 200.000 kişilik ordusu, Alparslan\'ın 50.000 kişilik ordusu ve Hilal Taktiği ile ezilmiştir.\n'
            '  • Malazgirt Zaferi\'nin Dünya Tarihindeki Sonuçları:\n'
            '    - ANADOLU\'NUN KAPILARI TÜRKLERE KESİN OLARAK AÇILMIŞTIR.\n'
            '    - Türkiye Tarihi başlamış; Anadolu\'da ilk Türk beylikleri kurulmuştur.\n'
            '    - Bizans İmparatoru esir alınmış; Papa Avrupa\'yı kışkırtarak HAÇLI SEFERLERİ\'Nİ başlatmıştır.',
        'En Parlak Dönem: SULTAN MELİKŞAH ve NİZÂMÜLMÜLK:\n'
            '  • Devlet en geniş sınırlarına ulaşmıştır (Seyhun\'dan Akdeniz\'e).\n'
            '  • Başvezir Nizâmülmülk "Siyasetnâme" eserini yazmış; Bağdat\'ta dünyanın ilk modern üniversitesi sayılan NİZAMİYE MEDRESELERİ\'ni kurmuştur.\n'
            '  • Ömer Hayyam başkanlığındaki heyete güneş yılı esaslı CELÂLÎ TAKVİMİ hazırlatılmıştır.',
        'Yıkılış Nedenleri:\n'
            '  • 1141 Katvan Savaşı: Moğol Karahitaylara karşı kaybedilen savaş devleti sarstı.\n'
            '  • Bâtınilik / Haşhaşiler: Hasan Sabbah\'ın Alamut Kalesi merkezli kurduğu terör örgütü devlet adamlarına ve Nizâmülmülk\'e suikastlar düzenledi.\n'
            '  • Oğuz İsyanı: Küstürülen göçebe Oğuzlar Sultan Sencer\'i esir aldı; Sultan Sencer\'in 1157\'de ölümüyle devlet dağıldı.',
      ],
    ),

    // BÖLÜM 5: TÜRK-İSLAM DEVLET TEŞKİLATI & KÜLTÜR-MEDENİYET
    LectureSection(
      title: '5. Türk-İslam Devlet Teşkilatı, Divanlar, Ordu & İkta',
      type: LectureSectionType.ruleList,
      leadText: 'Eski Türk devlet teşkilatı ile İslam dininin emir ve prensiplerinin sentezlenmesiyle mükemmel bir idari sistem doğmuştur.',
      bulletPoints: [
        'Merkez ve Saray Teşkilatı:\n'
            '  • Hükümdar: Sultan unvanını kullanır, hutbe okutur, para bastırır ve hilat giyerdi.\n'
            '  • Hâcibü\'l-Hüccab: Saray teşkilatının başında bulunan, halk ile sultan arasındaki iletişimi sağlayan en yetkili saray görevlisi.\n'
            '  • Divân-ı Saltanat (Büyük Divan) ve Alt Divanlar:\n'
            '    - Divân-ı İstifâ: Maliye işlerine bakar; başında "Müstevfi" bulunur.\n'
            '    - Divân-ı Arz: Ordu ve askerlik işlerine bakar; başında "Emir-i Arz" bulunur.\n'
            '    - Divân-ı İşrâf: İdari ve mali denetim yapar; başında "Müşrif" bulunur.\n'
            '    - Divân-ı İnşâ (Tuğra): Devletin iç ve dış yazışmalarını yürütür; başında "Tuğrai" bulunur.\n'
            '    - Divân-ı Mezâlim: Hükümdarın başkanlık ettiği, ağır siyasi suçların ve adli haksızlıkların yargılandığı en yüksek mahkeme.',
        'Ordu Teşkilatı:\n'
            '  • Hassa Ordusu: Hükümdarı doğrudan koruyan seçkin birliklerdir.\n'
            '  • Gulam Ordusu: Savaş esirleri ve devşirilen çocukların Gulamhane\'de eğitilmesiyle oluşturulur. Doğrudan hazineden maaş (Bistegani) alırlardı (Osmanlı\'daki Kapıkulu\'nun temeli).\n'
            '  • İkta Askerleri: İkta sahiplerinin yetiştirdiği atlı askerler (Cebelü).\n'
            '  • Türkmenler: Sınır boylarında akın düzenleyen göçebe süvariler.',
        'İkta Sistemi ve Faydaları:\n'
            '  • Devlete ait miri arazilerin gelirlerinin maaş karşılığı komutan ve memurlara tahsis edilmesidir.\n'
            '  • Faydaları: 1) Devlet kasasından para çıkmadan daimi ve devasa bir ordu hazır tutulmuştur. 2) Üretimde süreklilik sağlanmıştır. 3) Taşrada can ve mal güvenliği temin edilmiştir. 4) Vergilerin düzenli toplanması sağlanmıştır.',
      ],
    ),

    // BÖLÜM 6: İLK TÜRK-İSLAM ESERLERİ VE BİLİM İNSANLARI
    LectureSection(
      title: '6. İlk Türk-İslam Eserleri & Bilim İnsanları',
      type: LectureSectionType.comparison,
      leadText: 'XI. ve XII. yüzyıllarda Karahanlı ve Selçuklu coğrafyasında yazılan temel edebi ve felsefi şaheserler:',
      bulletPoints: [
        'Temel 4 Büyük Eser:\n'
            '  • 1. Kutadgu Bilig (Mutluluk Veren Bilgi): Yusuf Has Hacib tarafından yazılmış ve Karahanlı hükümdarı Tamgaç Buğra Han\'a sunulmuştur. İlk Türk-İslam edebi eseri, ilk siyasetname ve aruz ölçüsüyle yazılan ilk eserdir. Alegorik 4 karakter taşır (Kün Togdı: Hükümdar/Adalet; Ay Toldı: Vezir/Kut; Ögdülmiş: Vezirin oğlu/Akıl; Odgurmış: Zahit/Akıbet).\n'
            '  • 2. Dîvânu Lugâti\'t-Türk: Kaşgarlı Mahmud tarafından yazılmış ve Abbasi Halifesi El-Muktedî\'ye sunulmuştur. İlk Türkçe sözlük, ilk dilbilgisi kitabı ve Türk ansiklopedisidir. Araplara Türkçeyi öğretmek ve Türkçenin zenginliğini kanıtlamak amacıyla yazılmıştır. İçinde ilk Türk dünyası haritası yer alır.\n'
            '  • 3. Atabetü\'l-Hakayık (Hakikatlerin Eşiği): Edip Ahmet Yükneki tarafından yazılmış, ahlak ve öğüt kitabıdır.\n'
            '  • 4. Dîvân-ı Hikmet: Hoca Ahmet Yesevi ("Pîr-i Türkistan") tarafından yazılmıştır. İlk Türk tasavvuf edebiyatı eseridir.',
        'Önemli Bilim İnsanları:\n'
            '  • Fârâbî (Al-Pharabius): "Muallim-i Sânî" (İkinci Öğretmen - İlki Aristo). Pozitif bilimleri ilk sınıflandıran ve Birleşmiş Milletler fikrini ilk ortaya atan (İdeal Devlet / El-Medinetü\'l-Fâzıla) filozoftur.\n'
            '  • İbn Sînâ (Avicenna): "Tıbbın Hükümdarı". Yazdığı "El-Kânûn fî\'t-Tıbb" eseri yüzyıllarca Avrupa üniversitelerinde temel ders kitabı olarak okutulmuştur.\n'
            '  • Hârizmî: Sıfır (0) rakamını ve cebir bilimini ilk kullanan matematikçidir ("El-Cebr ve\'l-Mukâbele").\n'
            '  • Bîrûnî: Dünyanın çapını ve eksen eğikliğini hassas şekilde hesaplamıştır.',
      ],
      goldenRule: '💡 KUTADGU BİLİG VS DÎVÂNU LUGÂTİ\'T-TÜRK:\n'
          'ÖSYM sorularında "İlk Türkçe sözlük ve Türk dünyası haritası" = DÎVÂNU LUGÂTİ\'T-TÜRK; "İlk siyasetname ve mutluluk veren bilgi" = KUTADGU BİLİG\'dir.',
    ),

    // BÖLÜM 7: PDF ÜNİTE 3 PEKİŞTİRME VE DEĞERLENDİRME TESTİ
    LectureSection(
      title: '7. Ünite 3 MEB Pekiştirme & Konu Değerlendirme Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'MEB Ders Kitabı Ünite 3 değerlendirme soruları ile Türk-İslam Tarihi bilginizi sınayın.',
      bulletPoints: [
        'MEB Soru 1: İslamiyet\'i kabul eden ilk Türk boyu hangisidir?\n'
            '  ➜ Doğru Cevap: Karluklar (751 Talas Savaşı sonrası).',
        'MEB Soru 2: Orta Asya\'da kurulan ilk Müslüman Türk devleti hangisidir?\n'
            '  ➜ Doğru Cevap: Karahanlı Devleti (840-1212).',
        'MEB Soru 3: Tarihte "Sultan" unvanını kullanan ilk Türk hükümdarı kimdir?\n'
            '  ➜ Doğru Cevap: Gazneli Mahmud (Sultan Mahmud).',
        'MEB Soru 4: Anadolu\'nun kapılarını Türklere kesin olarak açan savaş hangisidir?\n'
            '  ➜ Doğru Cevap: 1071 Malazgirt Meydan Muharebesi (Sultan Alparslan).',
        'MEB Soru 5: Türk-İslam tarihinin ilk siyasetnamesi kabul edilen eser hangisidir?\n'
            '  ➜ Doğru Cevap: Kutadgu Bilig (Yusuf Has Hacib).',
        'MEB Soru 6: Selçuklularda toprağın vergi gelirine göre asker yetiştirme sistemine ne ad verilir?\n'
            '  ➜ Doğru Cevap: İkta Sistemi.',
      ],
    ),
  ],
);
