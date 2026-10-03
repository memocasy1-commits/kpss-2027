import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu3TurkiyeSelcukluBeylikler = LectureTopic(
  id: 'tarih_selcuklu_beylikler',
  courseId: 'tarih',
  order: 3,
  title: 'Türkiye Selçukluları ve Beylikler Dönemi',
  subtitle: 'I. ve II. Beylikler, Miryokefalon, Haçlı Seferleri, Kösedağ & Medeniyet',
  icon: Icons.fort_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 21 - 30',
  startTestNum: 21,
  endTestNum: 30,
  estimatedMinutes: 65,
  sections: [
    // BÖLÜM 1: ANADOLU'YA YAPILAN İLK TÜRK AKINLARI
    LectureSection(
      title: '1. Anadolu\'ya Yapılan İlk Türk Akınları & Yerleşme Süreci',
      type: LectureSectionType.overview,
      leadText: 'Anadolu\'ya Türk akınları IV. yüzyılda Hunlarla başlamış, ancak Anadolu\'nun kalıcı bir Türk yurdu haline gelmesi Malazgirt Zaferi sonrasında gerçekleşmiştir.',
      bulletPoints: [
        'Anadolu\'ya Yönelik Türk Dalgaları:\n'
            '  • IV. Yüzyıl (Hunlar): Ganimet ve keşif amacıyla Kafkaslar üzerinden Anadolu\'ya inmişlerdir.\n'
            '  • VI. Yüzyıl (Sabarlar): Doğu Anadolu ve Kapadokya bölgesine kadar ilerlemişlerdir.\n'
            '  • XI. Yüzyıl (Selçuklular): Çağrı Bey\'in 1015-1021 keşif akınları ile Anadolu yakından tanınmış; otlakları bol, iklimi elverişli bir yurt olarak hedeflenmiştir.\n'
            '  • Pasinler (1048) ve Malazgirt (1071) zaferleriyle Anadolu\'da fetih ve iskân süreci başlamıştır.',
        'Sultan Alparslan\'ın Kılıç Hakkı Politikası:\n'
            '  • Sultan Alparslan Malazgirt zaferinden sonra komutanlarına "Toprak fethedenin malıdır!" emrini vermiştir (Kılıç Hakkı).\n'
            '  • Bu emir sayesinde Anadolu çok kısa sürede hızla fethedilmiş ve Anadolu\'da I. Dönem Türk Beylikleri kurulmuştur.',
      ],
    ),

    // BÖLÜM 2: I. DÖNEM ANADOLU TÜRK BEYLİKLERİ
    LectureSection(
      title: '2. I. Dönem Anadolu Türk Beylikleri (Malazgirt Sonrası)',
      type: LectureSectionType.comparison,
      imageAssetPath: 'assets/images/tarih/tarih_anadolu_ilk_beylikler.png',
      imageCaption: 'Harita 3.1: Malazgirt Zaferi Sonrası Anadolu\'da Kurulan I. Dönem Türk Beylikleri',
      leadText: 'Malazgirt Zaferi\'nin ardından Anadolu\'yu Türkleştiren ve İslamlaştıran ilk bağımsız beylikler kurulmuştur.',
      bulletPoints: [
        '1. Danişmentliler (Sivas, Tokat, Niksar, Malatya, Kayseri):\n'
            '  • Danişment Gazi tarafından kurulmuştur. I. Dönem beylikleri içinde EN GÜÇLÜ olanıdır.\n'
            '  • Haçlılara karşı Türkiye Selçukluları ile birlikte destansı savaşlar vermişlerdir.\n'
            '  • Tokat Niksar\'da kurdukları YAĞIBASAN MEDRESESİ, Anadolu\'daki İLK TÜRK MEDRESESİDİR.',
        '2. Saltuklular (Erzurum ve Çevresi):\n'
            '  • Ebulkasım Saltuk Bey tarafından kurulmuştur. Anadolu\'da kurulan İLK TÜRK BEYLİĞİDİR.\n'
            '  • Gürcüler ve Haçlılarla mücadele etmişlerdir. Eserleri: Erzurum Kale Camii, Tepsi Minare, Mama Hatun Kümbeti.',
        '3. Mengücekliler (Erzincan, Kemah, Divriği):\n'
            '  • Mengücek Gazi kurmuştur. DİVRİĞİ ULU CAMİİ VE DARÜŞŞİFASI, UNESCO Dünya Kültür Mirası listesinde yer alan taş işçiliği harikasıdır.',
        '4. Artuklular (Diyarbakır, Batman, Mardin, Harput):\n'
            '  • Artuk Bey\'in oğulları tarafından Hasankeyf, Harput ve Mardin kolları olarak kurulmuştur.\n'
            '  • Eserleri: Malabadi Köprüsü (dünyanın en geniş kemerli taş köprüsü), Mardin Hatuniye Medresesi.\n'
            '  • Ünlü sibernetik ve robotik biliminin kurucusu EL-CEZERİ Artuklular sarayında hizmet etmiştir.',
        '5. Çaka Beyliği (İzmir ve Çevresi):\n'
            '  • Çaka Bey tarafından kurulmuştur. Tarihteki İLK TÜRK DENİZCİ DEVLETİDİR.\n'
            '  • 1081 yılı TÜRK DENİZ KUVVETLERİ\'NİN KURULUŞ YILI kabul edilir. İlk Türk donanması ile Bizans donanmasını mağlup etmiş ve Ege adalarını fethetmiştir.',
      ],
      goldenRule: '💡 I. DÖNEM BEYLİKLERİ ŞİFRESİ (DSMAÇ / SAMDAN):\n'
          'Danişmentliler (Sivas), Saltuklular (Erzurum), Mengücekliler (Erzincan), Artuklular (Mardin), Çaka Beyliği (İzmir). Hepsi Malazgirt Zaferi sonucudur!',
    ),

    // BÖLÜM 3: TÜRKİYE SELÇUKLU DEVLETİ & MİRYOKEFALON
    LectureSection(
      title: '3. Türkiye Selçuklu Devleti (1077 - 1308) & Miryokefalon',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_turkiye_selcuklu_devleti.png',
      imageCaption: 'Harita 3.2: Türkiye Selçuklu Devleti Sınırları ve Kervansaray Ağları',
      leadText: 'Kutalmışoğlu Süleyman Şah tarafından İznik merkezli kurulan, Anadolu\'yu imar ederek dünya ticaretinin merkezi haline getiren devlettir.',
      bulletPoints: [
        'Kuruluş ve I. Kılıç Arslan:\n'
            '  • Kurucu: KUTALMIŞOĞLU SÜLEYMAN ŞAH. İznik\'i fethedip başkent yapmıştır.\n'
            '  • I. Kılıç Arslan ve I. Haçlı Seferi (1096-1099): Yüz binlerce kişilik Haçlı ordusu karşısında başkent İznik kaybedilince, devletin başkenti KONYA\'ya taşınmıştır.\n'
            '  • I. Mesut Dönemi: İlk Selçuklu bakır parası basılmış; Batı kaynakları ilk kez Anadolu için "TÜRKİYE" ifadesini kullanmaya başlamıştır.',
        'II. Kılıç Arslan ve 1176 MİRYOKEFALON ZAFERİ (Yurttutan Savaşı):\n'
            '  • Bizans İmparatoru Manuel Komnenos Türkleri Anadolu\'dan tamamen atmak için sefere çıkmıştır.\n'
            '  • Denizli Kumdanlı mevkiinde yapılan Miryokefalon Savaşı\'nda Bizans ordusu pusuya düşürülerek yok edilmiştir.\n'
            '  • ÖNEMİ: 1) ANADOLU KESİN OLARAK TÜRK YURDU OLMUŞTUR. 2) Bizans\'ın Türkleri Anadolu\'dan atma ümidi tamamen sona ermiş, Bizans savunmaya çekilmiştir. 3) Avrupalılar Anadolu\'ya kesin olarak "Türkiye" demeye başlamıştır.',
      ],
      goldenRule: '💡 ANADOLU\'NUN 3 BÜYÜK TAPU SAVAŞI:\n'
          '1. Pasinler (1048) = Keşif Savaşı\n'
          '2. Malazgirt (1071) = Kapı Açan Savaş (Yurt Kuran)\n'
          '3. Miryokefalon (1176) = Tapu Senedi (Yurt Tutan).',
    ),

    // BÖLÜM 4: DENİZCİLİK, TİCARET VE EN PARLAK DÖNEM
    LectureSection(
      title: '4. Denizcilik, Uluslararası Ticaret & I. Alâeddin Keykubad',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye Selçukluları Anadolu\'yu dünya transit ticaretinin merkez üssü haline getirmek için devrim niteliğinde tedbirler almıştır.',
      bulletPoints: [
        'Ticareti Geliştirme Politikaları:\n'
            '  • Liman Şehirlerinin Fethi: Karadeniz\'de SİNOP ve SUDAK (Kırım), Akdeniz\'de ANTALYA ve ALANYA (Alaiye) fethedilerek deniz aşırı ticaret başlatılmıştır.\n'
            '  • Devlet Sigortacılığı: Dünyada ilk kez tüccarların malları korsan ve eşkıya saldırılarına karşı devlet güvencesine alınmıştır (İlk Devlet Sigortası).\n'
            '  • Kervansaraylar: Her 30-40 kilometrede bir (bir konaklama mesafesi) kervansaraylar (Hanlar) inşa edilmiştir. Kervansaraylarda yerli-yabancı tüm tüccarlara 3 gün ücretsiz yeme, içme, konaklama ve tedavi hizmeti verilmiştir.\n'
            '  • Gümrük Kolaylığı: Yabancı tüccarlara düşük gümrük vergisi uygulanmış; Venedik ve Cenevizlilerle ticaret antlaşmaları yapılmıştır.',
        'En Parlak Dönem: I. ALÂEDDİN KEYKUBAD (1220 - 1237):\n'
            '  • Alanya ve Kırım Sudak limanlarını fethetmiştir.\n'
            '  • 1230 Yassıçemen Savaşı: Anadolu\'yu istila eden Celâleddin Hârezmşah mağlup edilmiş ve Harzemşahlar yıkılmıştır.\n'
            '  • UYARI: Harzemşahların yıkılmasıyla Türkiye Selçukluları Moğollarla sınır komşusu olmuş; Moğol istilasına karşı doğal tampon bölge yok olmuştur!',
      ],
    ),

    // BÖLÜM 5: BABA İSHAK İSYANI & 1243 KÖSEDAĞ HEZİMETİ
    LectureSection(
      title: '5. Baba İshak İsyanı & 1243 Kösedağ Savaşı Yıkılış Süreci',
      type: LectureSectionType.overview,
      leadText: 'II. Gıyaseddin Keyhüsrev dönemindeki yönetim zaafı ve isyanlar Moğol istilasının kapısını ardına kadar açmıştır.',
      bulletPoints: [
        'Baba İshak (Babailer) İsyanı (1240):\n'
            '  • Türkmenlerin ekonomik ve sosyal sıkıntıları sonucu çıkan dini-sosyal nitelikli ilk büyük isyandır.\n'
            '  • Selçuklu ordusu isyanı güçlükle bastırabilmiş; bu durum devletin içten içe zayıfladığını Moğollara göstermiştir.',
        '1243 KÖSEDAĞ SAVAŞI ve Yıkılış:\n'
            '  • Baycu Noyan komutasındaki Moğol (İlhanlı) ordusu ile II. Gıyaseddin Keyhüsrev ordusu Sivas Kösedağ mevkiinde karşılaşmıştır.\n'
            '  • Selçuklu ordusu ağır bir bozguna uğramış ve dağılmıştır.\n'
            '  • Sonuçları:\n'
            '    - Türkiye Selçuklu Devleti İlhanlı Moğollarına tabi (vergiye bağlı) hale gelmiş, bağımsızlığını kaybetmiştir.\n'
            '    - ANADOLU TÜRK SİYASİ BİRLİĞİ TAMAMEN PARÇALANMIŞTIR.\n'
            '    - Anadolu\'da II. DÖNEM TÜRK BEYLİKLERİ kurulmuştur.\n'
            '    - Moğol zulmünden kaçan Türkmenler Batı Anadolu\'ya yığılmış; bu durum Batı Anadolu\'nun hızla Türkleşmesini sağlamıştır.',
      ],
    ),

    // BÖLÜM 6: II. DÖNEM ANADOLU TÜRK BEYLİKLERİ
    LectureSection(
      title: '6. II. Dönem Anadolu Türk Beylikleri (Kösedağ Sonrası)',
      type: LectureSectionType.comparison,
      imageAssetPath: 'assets/images/tarih/tarih_anadolu_ikinci_beylikler.png',
      imageCaption: 'Harita 3.3: Kösedağ Savaşı (1243) Sonrası Anadolu Türk Beylikleri Haritası',
      leadText: 'Kösedağ Savaşı sonrasında Selçuklu otoritesinin çökmesiyle kurulan ikinci dönem beylikler:',
      bulletPoints: [
        '1. Osmanoğulları (Söğüt, Domaniç, Bilecik):\n'
            '  • Ertuğrul Gazi ve Osman Bey kurmuştur. Jeopolitik konumu ve gaza politikasıyla dünya imparatorluğuna dönüşmüştür.',
        '2. Karamanoğulları (Konya, Karaman):\n'
            '  • Kendilerini Türkiye Selçuklularının mirasçısı görmüş ve Osmanlı\'yı en çok uğraştıran beylik olmuşlardır.\n'
            '  • Karamanoğlu Mehmet Bey 1277 yılında "Bugünden sonra divanda, dergahta, bargahta Türkçeden başka dil konuşulmaya!" fermanıyla TÜRKÇEYİ RESMİ DİL ilan etmiştir.',
        '3. Karesioğulları (Balıkesir, Çanakkale):\n'
            '  • Güçlü bir donanmaya sahiptirler. OSMANLI DEVLETİ\'NE KATILAN İLK BEYLİKTİR (Orhan Gazi dönemi). Bu sayede Osmanlı ilk donanmasına kavuşmuş ve Rumeli\'ye geçiş kolaylaşmıştır.',
        '4. Germiyanoğulları (Kütahya):\n'
            '  • Topraklarının bir kısmını çeyiz, geri kalanını vasiyet yoluyla Osmanlı\'ya devretmiştir.',
        '5. Hamitoğulları (Isparta, Eğirdir):\n'
            '  • Topraklarının bir kısmını para karşılığı (80.000 altın) I. Murad döneminde Osmanlı\'ya satmıştır.',
        '6. Candaroğulları (Kastamonu, Sinop), Aydınoğulları (Aydın), Saruhanoğulları (Manisa), Menteşeoğulları (Muğla):\n'
            '  • Güçlü denizci beyliklerdir.',
        '7. Dulkadiroğulları (Maraş):\n'
            '  • 1515 Turnadağ Savaşı ile Yavuz Sultan Selim tarafından alınarak ANADOLU TÜRK SİYASİ BİRLİĞİ KESİN OLARAK SAĞLANMIŞTIR.',
      ],
      goldenRule: '💡 BEYLİKLERİN OSMANLIYA KATILMA ÖZELLİKLERİ:\n'
          '• Osmanlı\'ya katılan İLK beylik = KARESİOĞULLARI (Denizcilik başladı).\n'
          '• Çeyiz ve vasiyetle katılan = GERMİYANOĞULLARI.\n'
          '• Parayla satın alınan = HAMİTOĞULLARI.\n'
          '• Osmanlı\'ya katılan EN SON beylik = DULKADİROĞULLARI (1515 Turnadağ ile kesin birlik).',
    ),

    // BÖLÜM 7: AHİLİK TEŞKİLATI VE MEDENİYET MİRASI
    LectureSection(
      title: '7. Ahilik Teşkilatı, Tasavvuf & Selçuklu Kültür Mirası',
      type: LectureSectionType.overview,
      leadText: 'Anadolu Selçukluları döneminde esnaf teşkilatlanması ve tasavvufi düşünce Anadolu\'nun mayasını oluşturmuştur.',
      bulletPoints: [
        'Ahilik Teşkilatı (Ahi Evran):\n'
            '  • Kırşehir merkezli Ahi Evran tarafından kurulan esnaf, zanaatkâr ve ahlak teşkilatıdır (Temeli fütüvvet anlayışıdır).\n'
            '  • Çırak, Kalfa, Usta hiyerarşisiyle mesleki ve ahlaki eğitim verilirdi. Dükkân açma ruhsatına "GEDİK" denirdi.\n'
            '  • Ürünlerin fiyat ve kalitesini denetlerlerdi (Narh Sistemi).\n'
            '  • Bacıyan-ı Rum (Anadolu Kadınları Teşkilatı): Ahi Evran\'ın eşi Fatma Bacı tarafından dünyada ilk kadın örgütlenmesi olarak kurulmuştur.',
        'Anadolu Erenleri ve Tasavvuf:\n'
            '  • Mevlânâ Celâleddîn-i Rûmî (Mesnevî, Dîvân-ı Kebîr).\n'
            '  • Yunus Emre (Risâletü\'n-Nushiyye, Türkçe Divan).\n'
            '  • Hacı Bektâş-ı Velî (Makâlât).\n'
            '  • Hacı Bayram-ı Velî ve Sadreddin Konevî.',
      ],
    ),
  ],
);
