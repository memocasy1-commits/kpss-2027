# -*- coding: utf-8 -*-
import os

OUT_DIR = "lib/data/tarih_topics"
os.makedirs(OUT_DIR, exist_ok=True)

# -------------------------------------------------------------
# KONU 2: İLK TÜRK - İSLAM DEVLETLERİ VE MEDENİYETİ
# -------------------------------------------------------------
konu2_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu2TurkIslam = LectureTopic(
  id: 'tarih_turk_islam',
  courseId: 'tarih',
  order: 2,
  title: 'İlk Türk - İslam Devletleri ve Medeniyeti',
  subtitle: 'Talas Savaşı, Karahanlılar, Gazneliler, Büyük Selçuklular, Mısır Devletleri & Bilim İnsanları',
  icon: Icons.mosque_rounded,
  color: Color(0xFF0D9488),
  testRange: 'Test 11 - 20',
  startTestNum: 11,
  endTestNum: 20,
  estimatedMinutes: 40,
  sections: [
    LectureSection(
      title: '1. Türklerin İslamiyet\\'i Kabulü & Talas Savaşı (751)',
      type: LectureSectionType.overview,
      leadText: 'Türklerin İslamlaşma süreci Talas Savaşı ile hızlanmış; inanç ve ahlak benzerlikleri bu geçişi kolaylaştırmıştır.',
      bulletPoints: [
        'Talas Savaşı (751) - Tarihin Kırılma Noktası:\\n  • Abbasiler ile Çinliler (T\\'ang Hanedanı) arasında Orta Asya egemenliği için yapıldı.\\n  • Karluk Türkleri Abbasilerin safına geçerek Çin\\'i mağlup etti.\\n  • Sonuçları:\\n    1. Orta Asya\\'nın Çinleşmesi önlendi.\\n    2. Kağıt Çin dışında ilk kez Semerkant\\'ta üretildi ("Şehirlerin Şahı").\\n    3. Türk-İslam tarihi resmen başladı; Karluklar İslamiyet\\'i kabul eden ilk Türk boyu oldu.',
        'Gök Tanrı & İslamiyet Benzerlikleri:\\n  • Tek Tanrı inancı (Tevhid paralelliği)\\n  • Ahiret, cennet (uçmağ) ve cehennem (tamu) inancı\\n  • Kurban kesme geleneği ve ruhun ölümsüzlüğü\\n  • Cihan Hâkimiyeti mefkûresi ile Gaza/Cihad anlayışının örtüşmesi\\n  • Hırsızlık, zina ve yalancılığın her iki inançta da kesinlikle yasaklanması.',
      ],
      goldenRule: '💡 TÜRK-İSLAM TARİHİNİN BAŞLANGICI:\\n751 Talas Savaşı Türk-İslam tarihinin miladıdır. Semerkant "Şehirlerin Şahı", Buhara ise "İslam\\'ın Roması" unvanına sahiptir.',
    ),
    LectureSection(
      title: '2. İlk Müslüman Türk Devletleri: Karahanlılar ve Gazneliler',
      type: LectureSectionType.comparison,
      leadText: 'Orta Asya ve Hindistan\\'da kurulan bu iki büyük devlet Türk-İslam medeniyetinin öncüsü olmuştur.',
      leftHeader: 'Karahanlılar (840 - 1212)',
      rightHeader: 'Gazneliler (963 - 1186)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Bilge Kül Kadir Han / Balasagun (Türk Yurdu)',
          wrong: 'Alp Tigin / Gazne (Afganistan ve Hindistan)',
          note: 'Kurucu ve Merkez',
        ),
        ComparisonRow(
          correct: 'Resmi dil Türkçe (Hakaniye) - Ulusçu kimlik',
          wrong: 'Resmi dil Farsça, bilim dili Arapça, ordu Türkçe',
          note: 'Dil ve Kültür',
        ),
        ComparisonRow(
          correct: 'Satuk Buğra Han (Abdülkerim) - El Mücahit',
          wrong: 'Sultan Mahmut (Tarihte İLK kez Sultan unvanı)',
          note: 'Kilit Hükümdar',
        ),
        ComparisonRow(
          correct: 'İlk medrese (Semerkant), ilk burslu öğrenci, ilk ribat',
          wrong: 'Hindistan\\'a 17 sefer (Pakistan ve Bangladeş temeli)',
          note: 'Tarihi Başarılar',
        ),
      ],
      osymTrap: '⚠️ KARAHANLI VE GAZNELİ DİL FARKI:\\nKarahanlılar halkı ve yöneticisi tamamen Türk olduğu için Türkçeyi korumuş; Gazneliler çok uluslu olduğu için Farsça ve Arapçayı resmiyette kullanmıştır.',
    ),
    LectureSection(
      title: '3. Büyük Selçuklu Devleti (1040 - 1157)',
      type: LectureSectionType.formula,
      leadText: 'Oğuzların Kınık boyu tarafından kurulan devlet, İslam dünyasının siyasi liderliğini ve koruyuculuğunu üstlenmiştir.',
      bulletPoints: [
        'Dandanakan Savaşı (1040): Gazneliler yenildi; Selçuklular bağımsız devlet oldu.',
        'Pasinler Savaşı (1048): Bizans-Gürcü ittifakına karşı kazanılan ilk büyük zafer.',
        'Bağdat Seferi (1055): Tuğrul Bey Şii Büveyhoğullarını yıkarak halifeyi kurtardı. Halife ona "Doğunun ve Batının Sultanı" unvanını verdi (Siyasi yetki Türklere geçti).',
        'Malazgirt Zaferi (1071): Sultan Alparslan ("Ebu\\'l Feth"), Bizans İmparatoru Romen Diyojen\\'i mağlup ederek Anadolu\\'nun kapılarını Türklere kesin olarak açtı ("Kılıç Hakkı" kuralını başlattı).',
        'Sultan Melikşah & Nizamülmülk: En parlak dönemdir. Nizamiye Medreseleri kuruldu; Batınilikle mücadele edildi; Ömer Hayyam Celali Takvimi hazırladı.',
      ],
      goldenRule: '💡 BÜYÜK SELÇUKLU\\'NUN YIKILIŞ SEBEPLERİ:\\n1) Hasan Sabbah ve Haşhaşiler (Batınilik), 2) 1141 Katvan Savaşı (Karahitaylara yenilgi), 3) Oğuz İsyanı, 4) Atabeylerin bağımsızlık hareketleri.',
    ),
    LectureSection(
      title: '4. Mısır\\'da Kurulan Türk-İslam Devletleri (TEMA)',
      type: LectureSectionType.ruleList,
      leadText: 'Mısır coğrafyasında kurulan 4 Türk devleti kronolojik olarak TEMA şifresi ile kodlanır:',
      bulletPoints: [
        'T - Tolunoğulları (868-905): Mısır\\'da kurulan İLK Türk-İslam devletidir. Tolunoğlu Ahmet Camii ve Maristan (hastane) inşa ettiler.',
        'E - Eyyubiler (1174-1250): Selahaddin Eyyubi 1187 Hıttin Savaşı ile Kudüs\\'ü Haçlılardan geri aldı ("Hadimü\\'l Haremeyn").',
        'M - Memlükler (1250-1517): 1260 Ayn Calut ve 1277 Elbistan savaşlarıyla Moğolları tarihte İLK KEZ durdurdular. Hanedan kuralı yoktu; her güçlü emir tahta geçebilirdi.',
        'A - Akşitler / İhşidiler (935-969): Hicaz bölgesine (Mekke ve Medine) egemen olan İLK Türk devletidir (Muhammed bin Togaç).',
      ],
      osymTrap: '⚠️ MEMLÜK VERASET FARKI:\\nMemlüklerde "Kut" anlayışı ve hanedan soyu şartı aranmazdı. Her güçlü komutan hükümdar olabilirdi. Bu yüzden en çok taht değişikliği yaşayan Türk devletidir.',
    ),
    LectureSection(
      title: '5. İlk Edebi Eserler ve Bilim İnsanları',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Karahanlılar döneminde yazılan ilk edebi eserler ve çağa damga vuran Türk-İslam bilginleri:',
      bulletPoints: [
        'Kutadgu Bilig (Yusuf Has Hacib): İlk Türk-İslam eseri, ilk siyasetname, aruz ölçüsüyle yazıldı (Tamgaç Buğra Han\\'a sunuldu).',
        'Divanü Lügati\\'t-Türk (Kaşgarlı Mahmut): İlk Türkçe sözlük, ansiklopedi, ilk Türk dünyası haritası (Halife El-Muktedi\\'ye sunuldu).',
        'Atabetü\\'l-Hakayık (Edip Ahmet Yükneki): Hakikatlerin eşiği, ahlak ve erdem kitabı.',
        'Divan-ı Hikmet (Hoca Ahmet Yesevi): İlk Türk tasavvuf eseri, Piri Türkistan.',
        'Farabi (Muallim-i Sani): İkinci öğretmen, BM fikrini ilk atan bilgin, El-Medinetü\\'l Fazıla.',
        'İbn-i Sina (Avicenna): Tıbbın babası, "El-Kanun Fi\\'t-Tıbb" yazarı.',
        'Harezmi: Sıfırı (0) bulan, cebirin kurucusu.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi kutsal Hicaz bölgesine (Mekke-Medine) egemen olan İLK Türk devletidir?',
          options: ['Tolunoğulları', 'İhşidiler (Akşitler)', 'Eyyubiler', 'Memlükler', 'Karahanlılar'],
          correctIndex: 1,
          explanation: 'Hicaz bölgesine egemen olan ilk Türk devleti Muhammed bin Togaç tarafından kurulan İhşidiler\\'dir (Akşitler).',
          ruleTag: 'Hicaz Hakimiyeti',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu2_turk_islam.dart", "w", encoding="utf-8") as f:
    f.write(konu2_code)

# -------------------------------------------------------------
# KONU 3: TÜRKİYE SELÇUKLULARI VE ANADOLU BEYLİKLERİ
# -------------------------------------------------------------
konu3_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu3TurkiyeSelcukluBeylikler = LectureTopic(
  id: 'tarih_selcuklu_beylikler',
  courseId: 'tarih',
  order: 3,
  title: 'Türkiye Selçukluları ve Anadolu Beylikleri',
  subtitle: 'I. ve II. Dönem Beylikleri, Miryokefalon, Kösedağ Savaşı, Ahilik & Anadolu Medeniyeti',
  icon: Icons.fort_rounded,
  color: Color(0xFFB45309),
  testRange: 'Test 21 - 30',
  startTestNum: 21,
  endTestNum: 30,
  estimatedMinutes: 38,
  sections: [
    LectureSection(
      title: '1. I. Dönem Anadolu Beylikleri (Malazgirt Sonrası)',
      type: LectureSectionType.ruleList,
      leadText: 'Malazgirt sonrası Sultan Alparslan\\'ın kılıç hakkı emriyle Anadolu\\'da kurulan beylikler (DSMAÇ):',
      bulletPoints: [
        'Danişmentliler (Sivas, Tokat, Amasya): Anadolu\\'daki İLK medreseyi kurdular (Tokat Niksar Yağıbasan Medresesi). En güçlü I. dönem beyliğidir.',
        'Saltuklular (Erzurum): Anadolu\\'da kurulan İLK Türk beyliğidir. Mama Hatun Türbesi ve Erzurum Ulu Camii.',
        'Mengücekliler (Erzincan, Divriği): Divriği Ulu Camii ve Darüşşifası UNESCO Dünya Mirası Listesi\\'ndedir.',
        'Artuklular (Mardin, Batman, Diyarbakır): Malabadi Köprüsü meşhurdur. Sibernetik ve robotik dâhisi El-Cezeri burada çalışmıştır.',
        'Çaka Beyliği (İzmir): İlk Türk denizcisidir. 1081 yılı Türk Deniz Kuvvetleri\\'nin kuruluş yılı kabul edilir.',
      ],
      goldenRule: '💡 I. DÖNEM İLKLERİ:\\nAnadolu\\'da kurulan ilk beylik: Saltuklular; İlk medrese: Danişmentliler Yağıbasan Medresesi; İlk denizci: Çaka Beyi (1081).',
    ),
    LectureSection(
      title: '2. Türkiye Selçuklu Devleti ve Dönüm Noktası Savaşlar',
      type: LectureSectionType.formula,
      leadText: '1077\\'de Kutalmışoğlu Süleyman Şah tarafından İznik\\'te kuruldu; I. Haçlı Seferi ile başkent Konya\\'ya taşındı.',
      bulletPoints: [
        'Miryokefalon Savaşı (1176 - II. Kılıç Arslan): Bizans ordusu Denizli civarında hezimete uğratıldı. Anadolu KESİN TÜRK YURDU oldu ("Yurttutan Zaferi"). Bizans savunmaya çekildi.',
        'I. Alaeddin Keykubat (Altın Çağ): Sinop, Alanya (Alaiye) ve Sudak (Kırım) fethedildi. Tarihte ilk kez devlet sigortacılığı uygulandı.',
        'Yassıçemen Savaşı (1230): Harzemşahlar mağlup edilip yıkıldı; ancak Moğollarla tampon bölge ortadan kalktı!',
        'Baba İshak İsyanı (1240): Anadolu\\'daki ilk büyük dini ve sosyal isyandır. Devletin zayıfladığını Moğollara gösterdi.',
        'Kösedağ Savaşı (1243 - Moğol İlhanlılar ile): Selçuklu ordusu Baycu Noyan\\'a yenildi. Anadolu Türk siyasi birliği parçalandı; II. Dönem Türk Beylikleri kuruldu.',
      ],
      goldenRule: '💡 ANADOLU SAVAŞLARI ŞİFRESİ:\\n• Pasinler (1048): Keşif\\n• Malazgirt (1071): Yurtaçan\\n• Miryokefalon (1176): Yurttutan\\n• Başkomutan Meydan Muharebesi (1922): Yurtkurtaran.',
    ),
    LectureSection(
      title: '3. II. Dönem Türk Beylikleri (Kösedağ Sonrası)',
      type: LectureSectionType.overview,
      leadText: 'Kösedağ Savaşı sonrası kurulan ve Osmanlı\\'nın Anadolu Türk siyasi birliği (ATSB) için mücadele ettiği beylikler:',
      bulletPoints: [
        'Osmanoğulları (Söğüt, Bilecik): Uç beyliği, gaza politikası ile cihan imparatorluğuna dönüştü.',
        'Karamanoğulları (Konya, Karaman): Kendilerini Selçuklu mirasçısı gördüler. Karamanoğlu Mehmet Bey 1277\\'de Türkçeyi resmi dil ilan etti.',
        'Karesioğulları (Balıkesir, Çanakkale): Osmanlı\\'ya katılan İLK beyliktir (Donanması Osmanlı\\'ya geçti, Rumeli\\'ye geçiş sağlandı).',
        'Dulkadiroğulları (Maraş): 1515 Turnadağ Savaşı ile Osmanlı\\'ya katılan SON beyliktir (ATSB kesin olarak sağlandı).',
        'Hamitoğulları: Topraklarının bir kısmını para karşılığı Osmanlı\\'ya sattı.',
        'Germiyanoğulları: Topraklarını çeyiz ve vasiyet yoluyla Osmanlı\\'ya bıraktı.',
      ],
      osymTrap: '⚠️ İLK VE SON KATILAN BEYLİKLER:\\nOsmanlı\\'ya ilk katılan beylik Karesioğulları, son katılan beylik ise 1515 Turnadağ Savaşı ile Dulkadiroğulları\\'dır.',
    ),
    LectureSection(
      title: '4. Ahilik Teşkilatı ve Teşkilat Yapısı',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Ahi Evran tarafından Kırşehir\\'de kurulan esnaf ve ahlak dayanışma teşkilatı:',
      bulletPoints: [
        'Ahilik Teşkilatı Özellikleri:\\n  • Üyelerine mesleki eğitim, adalet ve cömertlik öğretilir.\\n  • Narh Sistemi: Ürünlerin tavan satış fiyatını belirleme yetkisi vardır.\\n  • Gedik Sistemi: İş yeri açma ve ustalık ruhsatıdır.\\n  • Bacıyan-ı Rum: Ahi Evran\\'ın eşi Fatma Bacı tarafından kurulan dünyanın ilk kadın teşkilatıdır.\\n  • DİKKAT: Ahilik teşkilatına GAYRİMÜSLİMLER ASLA ALINMAZ! (Osmanlı Loncasına ise alınmıştır).',
        'Devlet Teşkilatı İlkleri:\\n  • Niyabet-i Saltanat: Hükümdar yokken devleti yöneten divan (Naib-i Sultan).\\n  • Pervaneci: İkta topraklarını dağıtan görevli (Nişancı\\'nın atası).\\n  • Reisü\\'l Bahr / Melikü\\'s Sevahil: Donanma komutanı.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Anadolu\\'nun tapusunu tescilleyen ve Bizans\\'ı kesin olarak savunmaya iten "Yurttutan" savaşı hangisidir?',
          options: ['Malazgirt Savaşı', 'Pasinler Savaşı', 'Miryokefalon Savaşı', 'Kösedağ Savaşı', 'Yassıçemen Savaşı'],
          correctIndex: 2,
          explanation: '1176 Miryokefalon Savaşı ile Anadolu\\'nun kesin Türk yurdu olduğu tescillenmiş ve Bizans savunmaya çekilmiştir.',
          ruleTag: 'Miryokefalon Zaferi',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu3_turkiye_selcuklu_beylikler.dart", "w", encoding="utf-8") as f:
    f.write(konu3_code)

# -------------------------------------------------------------
# KONU 4: OSMANLI KURULUŞ VE YÜKSELME DÖNEMLERİ
# -------------------------------------------------------------
konu4_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu4OsmanliKurulusYukselme = LectureTopic(
  id: 'tarih_osmanli_kurulus_yukselme',
  courseId: 'tarih',
  order: 4,
  title: 'Osmanlı Devleti Kuruluş ve Yükselme Dönemleri',
  subtitle: 'Koyunhisar\\'dan Viyana Kapılarına, Fatih, Yavuz, Kanuni Dönemi ve Dünya Gücü Osmanlı',
  icon: Icons.military_tech_rounded,
  color: Color(0xFFDC2626),
  testRange: 'Test 31 - 40',
  startTestNum: 31,
  endTestNum: 40,
  estimatedMinutes: 45,
  sections: [
    LectureSection(
      title: '1. Kuruluş Dönemi Padişahları ve Stratejik Adımlar (1299 - 1453)',
      type: LectureSectionType.overview,
      leadText: 'Uç beyliğinden dünya imparatorluğuna geçiş süreci (İskân ve İstimâlet politikaları):',
      bulletPoints: [
        'Osman Bey (Fahrüddin): 1302 Koyunhisar (Bafeus) Savaşı (Bizans tekfurlarına karşı ilk zafer), ilk bakır para, ilk vergi (bac), ilk kadı (Dursun Fakih).',
        'Orhan Bey (İhtiyareddin): Beylikten devlete geçiş! Bursa başkent yapıldı, 1329 Maltepe (Palekanon) Zaferi, 1353 Çimpe Kalesi\\'nin alınması (Rumeli\\'de ilk üs), Karesioğulları\\'nın ilhakı (İlk donanma), ilk düzenli ordu (Yaya ve Müsellem), ilk divan, ilk medrese (İznik).',
        'I. Murat (Hüdavendigar): Edirne başkent yapıldı (Sazlıdere), 1364 Sırpsındığı (İlk Haçlı savaşı), 1389 I. Kosova (Savaş meydanında şehit olan tek padişah). "Ülke padişah ve oğullarınındır" veraset kuralını getirdi; Yeniçeri Ocağı ve Tımarı kurdu.',
        'Yıldırım Bayezid: Niğbolu Zaferi (1396 - Halifeden Sultan-ı İklim-i Rum unvanı), İstanbul\\'u ilk kuşatan padişah (Güzelcehisar / Anadolu Hisarı). 1402 Ankara Savaşı ile Timur\\'a esir düştü ve 11 yıllık Fetret Devri başladı.',
        'Çelebi Mehmet & II. Murat: Çelebi Mehmet devleti toparladığı için II. Kurucu sayılır. II. Murat Varna (1444) ve II. Kosova (1448 - Balkanların kesin Türk yurdu olması) zaferlerini kazandı.',
      ],
      goldenRule: '💡 BALKANLARIN TAPUSU: II. KOSOVA ZAFERİ (1448):\\nTıpkı Miryokefalon\\'un Anadolu\\'yu Türk yurdu yapması gibi, 1448 II. Kosova Zaferi de Balkanların kesin Türk yurdu olduğunu tescillemiştir.',
    ),
    LectureSection(
      title: '2. Yükselme Dönemi: Fatih Sultan Mehmet (1451 - 1481)',
      type: LectureSectionType.formula,
      leadText: 'Çağ açıp çağ kapatan Fatih, devleti merkeziyetçi bir cihan imparatorluğuna dönüştürmüştür.',
      bulletPoints: [
        'İstanbul\\'un Fethi (29 Mayıs 1453): Boğazkesen (Rumeli Hisarı) yapıldı, Şahi topları döktürüldü. Orta Çağ kapandı, Yeni Çağ başladı; feodalite surların yıkılmasıyla çöktü; İpek Yolu kontrolü sağlandı; Rönesans ve Coğrafi Keşifler tetiklendi.',
        'Karadeniz ve Ege Hakimiyeti: Kırım fethedildi (Karadeniz Türk gölü oldu), Trabzon Rum İmparatorluğu ve Candaroğulları son buldu, Ege adaları alındı.',
        'Otlukbeli Savaşı (1473): Akkoyunlu Devleti (Uzun Hasan) mağlup edildi.',
        'Kanunname-i Âli Osman: İlk yazılı Osmanlı kanunnamesidir. Kardeş katli yasallaştı, Müsadere (mala el koyma) kuralı getirildi, Cülus bahşişi kanunlaştı.',
      ],
      goldenRule: '💡 KARADENİZ\\'İ TÜRK GÖLÜ YAPAN FETİH:\\nFatih döneminde Gedik Ahmet Paşa komutasında Kırım\\'ın fethi ile Karadeniz resmen Türk gölü haline gelmiştir.',
    ),
    LectureSection(
      title: '3. Yavuz Sultan Selim ve Kanuni Sultan Süleyman',
      type: LectureSectionType.comparison,
      leadText: 'Doğu ve Batı siyasetinde Osmanlı\\'nın zirve yaptığı iki altın hükümdarlık dönemi:',
      leftHeader: 'Yavuz Sultan Selim (1512 - 1520)',
      rightHeader: 'Kanuni Sultan Süleyman (1520 - 1566)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Doğu ve İslam Dünyasını tek çatı altında toplama',
          wrong: 'Orta Avrupa, Akdeniz ve Cihan hakimiyeti',
          note: 'Stratejik Vizyon',
        ),
        ComparisonRow(
          correct: 'Çaldıran (1514), Turnadağ (1515), Mercidabık (1516), Ridaniye (1517)',
          wrong: 'Mohaç (1526 - 2 saatte zafer), Zigetvar (1566)',
          note: 'Meydan Muharebeleri',
        ),
        ComparisonRow(
          correct: 'Halifelik Osmanlı\\'ya geçti ("Hadimü\\'l Haremeyn")',
          wrong: '1533 İstanbul Antlaşması (Avusturya Arşidükü = Sadrazam)',
          note: 'Diplomatik Üstünlük',
        ),
        ComparisonRow(
          correct: 'Baharat Yolu ve Mısır hazineleri ele geçti',
          wrong: '1538 Preveze Deniz Zaferi (Akdeniz Türk gölü oldu)',
          note: 'Deniz ve Ticaret',
        ),
      ],
      osymTrap: '⚠️ ATSB\\'Yİ KESİN SAĞLAYAN SAVAŞ:\\nAnadolu Türk siyasi birliği 1515 Turnadağ Savaşı ile Dulkadiroğulları\\'nın ilhak edilmesiyle KESİN OLARAK sağlanmıştır.',
    ),
    LectureSection(
      title: '4. Osmanlı Yükselme Dönemi Kilit Soruları',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Kuruluş ve yükselme döneminin en sık test edilen soru kalıpları:',
      bulletPoints: [
        'Cem Sultan Olayı: II. Bayezid döneminde taht kavgası iken Papalık ve Şövalyelerin karışmasıyla DIŞ SORUNA dönüşen olaydır.',
        '1533 İstanbul Antlaşması: Osmanlı\\'nın Avrupa diplomasisindeki ezici üstünlüğünü simgeler (Arşidük sadrazama denktir).',
        'Preveze Deniz Zaferi (1538): Barbaros Hayreddin Paşa Haçlı donanmasını yenmiş, Akdeniz Türk gölü olmuştur (Donanma Günü).',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Avusturya Arşidükünün protokolde Osmanlı sadrazamına denk sayıldığı antlaşma hangisidir?',
          options: ['Edirne-Segedin Antlaşması', '1533 İstanbul Antlaşması', 'Zitvatorok Antlaşması', 'Karlofça Antlaşması', 'Kasr-ı Şirin Antlaşması'],
          correctIndex: 1,
          explanation: '1533 İstanbul (İbrahim Paşa) Antlaşması ile Avusturya kralı Osmanlı Sadrazamına eşit sayılmış ve büyük bir siyasi üstünlük elde edilmiştir.',
          ruleTag: '1533 İstanbul Antlaşması',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu4_osmanli_kurulus_yukselme.dart", "w", encoding="utf-8") as f:
    f.write(konu4_code)

# -------------------------------------------------------------
# KONU 5: OSMANLI KÜLTÜR VE MEDENİYETİ
# -------------------------------------------------------------
konu5_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu5OsmanliKulturMedeniyet = LectureTopic(
  id: 'tarih_osmanli_kultur_medeniyet',
  courseId: 'tarih',
  order: 5,
  title: 'Osmanlı Devleti Kültür ve Medeniyeti',
  subtitle: 'Merkez Teşkilatı, Seyfiye-İlmiye-Kalemiye, Taşra, Tımar, Ordu & Toprak Sistemi',
  icon: Icons.account_balance_rounded,
  color: Color(0xFF4F46E5),
  testRange: 'Test 41 - 50',
  startTestNum: 41,
  endTestNum: 50,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: '1. Merkez Teşkilatı, Veraset Değişimi & Saray Yapısı',
      type: LectureSectionType.overview,
      leadText: 'Osmanlı mutlak ve merkeziyetçi bir imparatorluktur. Veraset sistemi taht kavgalarını önlemek için evrilmiştir.',
      bulletPoints: [
        'Veraset Sisteminin Evrimi:\\n  • Osman & Orhan: "Ülke hanedanın ortak malıdır"\\n  • I. Murat: "Ülke padişah ve oğullarınındır"\\n  • Fatih: "Ülke padişahındır, nizam-ı âlem için kardeş katli vaciptir"\\n  • I. Ahmet: "Ekber ve Erşed Sistemi" (En yaşlı ve akıllı şehzade tahta geçer; Kafes usulü getirildi, sancak usulü kalktı).',
        'Topkapı Sarayı\\'nın Bölümleri:\\n  • Birun: Dış saray, devlet işleri ve kapıkulu askerleri.\\n  • Enderun: İç saray ve saray mektebi; devşirmeler devlet adamı ve komutan olarak yetişir.\\n  • Harem: Padişah ailesinin özel yaşam alanı ve cariyelerin eğitim ocağı.',
      ],
      goldenRule: '💡 EKBER VE ERŞED SİSTEMİ (I. AHMET):\\nTaht kavgalarını ve kardeş katlini bitirmiştir; ancak şehzadelerin sancağa çıkmasını engelleyerek tecrübesiz padişahların yetişmesine yol açmıştır.',
    ),
    LectureSection(
      title: '2. Divan-ı Hümayun ve Yönetici Sınıflar (Üç Zümre)',
      type: LectureSectionType.comparison,
      leadText: 'Osmanlı yönetici bürokrasisi 3 temel sınıfa ayrılmıştır:',
      leftHeader: 'Seyfiye (Kılıç Ehli - Yürütme)',
      rightHeader: 'İlmiye (Sarık Ehli - Din/Hukuk/Eğitim)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Sadrazam, Vezirler, Kaptan-ı Derya, Yeniçeri Ağası',
          wrong: 'Şeyhülislam, Kazasker, Kadılar, Müderrisler',
          note: 'Üyeler ve Makamlar',
        ),
        ComparisonRow(
          correct: 'Devşirme kökenliler ağırlıktadır',
          wrong: 'KESİNLİKLE doğuştan Müslüman ve medrese mezuniyeti şarttır',
          note: 'Köken Zorunluluğu',
        ),
        ComparisonRow(
          correct: 'Askeri yönetim, fetihler ve iç asayiş',
          wrong: 'Yargı (Kadı), müderris atamaları (Kazasker) ve fetva (Şeyhülislam)',
          note: 'Temel Görev Sahası',
        ),
      ],
      osymTrap: '⚠️ KALEMİYE SINIFI (YAZI EHLİ):\\nDefterdar (Maliye) ve Nişancı (Tuğra & Tahrir defteri) Kalemiye sınıfıdır. Reisülküttap XVII. yy\\'dan sonra dışişleri bakanı olarak Kalemiye\\'nin lideri olmuştur.',
    ),
    LectureSection(
      title: '3. Taşra Teşkilatı, Eyaletler ve Ordu Yapısı',
      type: LectureSectionType.ruleList,
      leadText: 'Taşra idaresi Eyalet -> Sancak -> Kaza -> Köy şeklinde kademelendirilmiştir.',
      bulletPoints: [
        'Eyalet Türleri:\\n  • Salyanesiz (Yıllıksız) Eyaletler: Merkeze yakındır; TIMAR sistemi uygulanır (Rumeli, Anadolu, Sivas).\\n  • Salyaneli (Yıllıklı) Eyaletler: Merkeze uzaktır; İLTİZAM sistemiyle vergi peşin toplanır, mültezim görev yapar (Mısır, Trablusgarp, Tunus, Cezayir).\\n  • İmtiyazlı Eyaletler: Hicaz (vergi yok, asker yok), Kırım (vergi yok, sadece asker).',
        'Ordu Teşkilatı:\\n  • Kapıkulu Askerleri: Devşirmedir; 3 ayda bir Ulufe maaşı, tahta geçişte Cülus alırlar (Yeniçeriler, Cebeciler, Topçular, Süvariler).\\n  • Tımarlı Sipahiler: Tamamen Türk ve Müslümandır; hazineye yük olmadan dirlik gelirleriyle beslenirler (Cebelü adı verilen atlı asker yetiştirirler). Barışta asayişi sağlarlar.',
      ],
      goldenRule: '💡 ÇİFTBOZAN VERGİSİ:\\nToprağını mazeretsiz 3 yıl üst üste boş bırakan köylüden tarımsal üretimde devamlılığı sağlamak amacıyla alınan ceza vergisidir.',
    ),
    LectureSection(
      title: '4. Kültür ve Medeniyet Soru Çözümleri',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'KPSS\\'de her yıl 3-4 soru gelen kültür medeniyet test sorusu:',
      bulletPoints: [
        'Miri Arazi: Mülkiyeti devlete ait topraklardır; feodal beylerin doğmasını engellemiştir.',
        'Lonca Teşkilatı: Esnaf birliğidir; Ahilikten farkı gayrimüslimlerin de üye olabilmesidir.',
        'Mecelle: Ahmet Cevdet Paşa başkanlığında hazırlanan ilk Türk medeni kanunudur.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Osmanlı Devleti\\'nde kadı ve müderrislerin atama ve tayin işlerine bakan divan üyesi hangisidir?',
          options: ['Şeyhülislam', 'Kazasker', 'Nişancı', 'Sadrazam', 'Reisülküttap'],
          correctIndex: 1,
          explanation: 'Kadı (yargıç) ve müderris (öğretim üyesi) atamalarını adalet ve milli eğitim bakanı konumundaki Kazasker (Kadıasker) yapardı.',
          ruleTag: 'Kazasker Yetkisi',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu5_osmanli_kultur_medeniyet.dart", "w", encoding="utf-8") as f:
    f.write(konu5_code)

# -------------------------------------------------------------
# KONU 6: XVII. YÜZYIL OSMANLI DEVLETİ (DURAKLAMA)
# -------------------------------------------------------------
konu6_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu6DuraklamaDonemi = LectureTopic(
  id: 'tarih_duraklama_donemi',
  courseId: 'tarih',
  order: 6,
  title: 'XVII. Yüzyıl Osmanlı Devleti (Duraklama)',
  subtitle: 'İsyanlar, Kasr-ı Şirin, Karlofça Antlaşması & XVII. Yüzyıl Islahatçıları (TOKMAK)',
  icon: Icons.hourglass_empty_rounded,
  color: Color(0xFFE11D48),
  testRange: 'Test 51 - 60',
  startTestNum: 51,
  endTestNum: 60,
  estimatedMinutes: 40,
  sections: [
    LectureSection(
      title: '1. Duraklamanın Nedenleri ve İç İsyanlar',
      type: LectureSectionType.overview,
      leadText: 'İç bozulmalar (beşik ulemalığı, rüşvet) ve dış etkenler (Coğrafi Keşifler, doğal sınırlar) devleti sarstı.',
      bulletPoints: [
        'İstanbul (Yeniçeri) İsyanları: Maaş ve cülus azlığı sebebiyle çıktı; Genç Osman şehit edildi, Vaka-i Vakvakiye (Çınar Vakası) yaşandı. Rejime karşı DEĞİLDİR!',
        'Celali (Anadolu) İsyanları: Ağır vergiler ve tımar haksızlıkları yüzünden köylüler toprağını terk etti ("Büyük Kaçgun"). Milliyetçilik etkisi YOKTUR!',
        'Eyalet İsyanları: Eflak, Boğdan, Yemen\\'de yerel yöneticilerin başkaldırısıdır.',
      ],
      goldenRule: '💡 XVII. YÜZYIL İSYANLARINDA ASLA MİLLİYETÇİLİK YOKTUR:\\nFransız İhtilali (1789) henüz gerçekleşmediği için XVII. yüzyıldaki hiçbir isyanda milliyetçilik ve bağımsızlık fikri aranmaz!',
    ),
    LectureSection(
      title: '2. XVII. Yüzyıl Siyasi İlişkileri ve Kritik Antlaşmalar (VARİL)',
      type: LectureSectionType.ruleList,
      leadText: 'Osmanlı bu yüzyılda Venedik, Avusturya, Rusya, İran ve Lehistan (VARİL) ile savaşmıştır:',
      bulletPoints: [
        'Ferhat Paşa Antlaşması (1590 - İran): Osmanlı DOĞUDA EN GENİŞ sınırlara ulaştı.',
        'Kasr-ı Şirin Antlaşması (1639 - IV. Murat): Günümüz Türkiye - İran sınırı büyük ölçüde çizildi (Zağros Dağları sınır).',
        'Zitvatorok Antlaşması (1606 - Avusturya): 1533 üstünlüğü bitti! Avusturya kralı Osmanlı padişahına denk sayıldı (Mütekabiliyet).',
        'Bucaş Antlaşması (1672 - Lehistan): Osmanlı BATIDA EN GENİŞ sınırlara ulaştı (Podolya ve Ukrayna).',
        'Bahçesaray (Çehrin - 1681): Rusya ile imzalanan İLK resmi antlaşma.',
      ],
      osymTrap: '⚠️ EN GENİŞ SINIRLAR:\\nDoğuda en geniş sınırlar Ferhat Paşa; Batıda en geniş sınırlar Bucaş Antlaşması ile kazanılmıştır.',
    ),
    LectureSection(
      title: '3. II. Viyana Kuşatması ve Karlofça Antlaşması (1699)',
      type: LectureSectionType.formula,
      leadText: '1683 II. Viyana bozgunu sonrası Papa çağrısıyla Kutsal İttifak (MARVEL: Malta, Avusturya, Rusya, Venedik, Lehistan) kuruldu.',
      bulletPoints: [
        'Karlofça Antlaşması (1699): Avusturya, Venedik ve Lehistan ile imzalandı. Osmanlı Batı\\'da İLK KEZ büyük çapta toprak kaybetti (Macaristan, Mora, Podolya). Duraklama bitti, Gerileme başladı.',
        '1700 İstanbul Antlaşması (Rusya): Azak Kalesi Rusya\\'ya verildi; Ruslar İLK KEZ Karadeniz\\'e inme fırsatı buldu.',
      ],
      goldenRule: '💡 KARLOFÇA VE RUSYA:\\nRusya Karlofça\\'da yer almamış; bir yıl sonra 1700 İstanbul Antlaşması\\'nı ayrı imzalamıştır.',
    ),
    LectureSection(
      title: '4. XVII. Yüzyıl Islahatçıları (Şifre: TOKMAK)',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'T - Tarhuncu, O - Osman II, K - Kuyucu Murat, M - Murat IV, A - Ahmet I, K - Köprülüler:',
      bulletPoints: [
        'Genç Osman (II. Osman): İlk köklü reformcu padişahtır; saray dışından evlendi, yeniçeriyi kaldırmayı düşündü, şehit edildi.',
        'Tarhuncu Ahmet Paşa: İlk modern denk bütçeyi hazırladı.',
        'IV. Murat (Bağdat Fatihi): İçki, tütün yasağı, Koçi Bey ve Katip Çelebi\\'ye layihalar (raporlar) hazırlattı.',
        'Köprülü Mehmet Paşa: Saraya şartlar öne sürerek sadrazam olan ilk devlet adamıdır.',
        'DİKKAT: XVII. yüzyıl ıslahatlarında KESİNLİKLE AVRUPA (BATI) ÖRNEK ALINMAMIŞTIR!',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi XVII. yüzyıl Osmanlı ıslahatlarının özelliklerinden biri DEĞİLDİR?',
          options: ['Kişilere bağlı kalması', 'Avrupa\\'nın askeri teknolojisinin taklit edilmesi', 'Sorunların kökenine inilememesi', 'Baskı ve şiddet yoluyla düzen sağlanması', 'Yükselme dönemine dönme arzusu taşınması'],
          correctIndex: 1,
          explanation: 'XVII. yüzyılda Avrupa örnek ALINMAMIŞTIR; Batı\\'nın üstünlüğü XVIII. yüzyılda (Lale Devri ile) kabul edilmiştir.',
          ruleTag: 'XVII. yy Islahat Özelliği',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu6_duraklama_donemi.dart", "w", encoding="utf-8") as f:
    f.write(konu6_code)

# -------------------------------------------------------------
# KONU 7: XVIII. YÜZYIL OSMANLI DEVLETİ (GERİLEME)
# -------------------------------------------------------------
konu7_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu7GerilemeDonemi = LectureTopic(
  id: 'tarih_gerileme_donemi',
  courseId: 'tarih',
  order: 7,
  title: 'XVIII. Yüzyıl Osmanlı Devleti (Gerileme)',
  subtitle: 'Lale Devri, Belgrad, Küçük Kaynarca, Batılılaşma & Nizam-ı Cedit (3-1-3-1-3)',
  icon: Icons.trending_down_rounded,
  color: Color(0xFFCA8A04),
  testRange: 'Test 61 - 70',
  startTestNum: 61,
  endTestNum: 70,
  estimatedMinutes: 42,
  sections: [
    LectureSection(
      title: '1. Gerileme Dönemi Siyasi Olayları ve Antlaşmalar',
      type: LectureSectionType.overview,
      leadText: 'Prut ile Karlofça kayıplarını geri alma umudu doğmuş; Pasarofça ile mevcut toprakları koruma politikasına geçilmiştir.',
      bulletPoints: [
        'Prut Antlaşması (1711 - Rusya): Azak Kalesi geri alındı; toprakları geri alma UMUDU doğdu.',
        'Pasarofça Antlaşması (1718): Belgrad kaybedildi; Batı\\'nın üstünlüğü KESİN kabul edildi. Lale Devri başladı.',
        'Belgrad Antlaşması (1739): Osmanlı\\'nın Batı\\'da imzaladığı SON KAZANÇLI antlaşmadır; Karadeniz son kez Türk gölü sayıldı. Fransız kapitülasyonları 1740\\'ta sürekli yapıldı.',
        'Küçük Kaynarca Antlaşması (1774 - Rusya): XVIII. yüzyılın en ağır antlaşmasıdır! Kırım bağımsız oldu (Halkı Türk/Müslüman olan bir yer İLK KEZ kaybedildi; halifeye bağlandı). Rusya\\'ya ilk kez kapitülasyon ve savaş tazminatı verildi.',
        'Yaş Antlaşması (1792): Kırım\\'ın Rusya\\'ya ait olduğu kesinleşti. Gerileme bitti, Dağılma başladı.',
      ],
      goldenRule: '💡 KIRIM\\'IN KAYBEDİLME AŞAMALARI:\\n1) 1774 Küçük Kaynarca (Bağımsız oldu),\\n2) 1779 Aynalıkavak Tenkihnamesi (Şahin Giray han oldu),\\n3) 1792 Yaş Antlaşması (Resmen Rusya\\'ya bağlandı).',
    ),
    LectureSection(
      title: '2. Lale Devri (1718 - 1730): Batı\\'ya Açılan İlk Pencere',
      type: LectureSectionType.ruleList,
      leadText: 'Padişahı III. Ahmet, sadrazamı Nevşehirli Damat İbrahim Paşa, şairi Nedim, minyatürcüsü Levni\\'dir.',
      bulletPoints: [
        'İlk Geçici Elçilik: Paris\\'e Yirmisekiz Çelebi Mehmet Efendi gönderildi (Paris Sefaretnamesi).',
        'İlk Özel Türk Matbaası (1727): İbrahim Müteferrika ve Sait Efendi kurdu; basılan ilk eser "Vankulu Lügati"dir.',
        'Tulumbacılar Ocağı: İlk itfaiye teşkilatı kuruldu (Gerçek Davud).',
        'Çiçek Aşısı ilk kez uygulandı; Barok ve Rokoko mimarisi başladı (III. Ahmet Çeşmesi, Nuruosmaniye).',
        'Patrona Halil İsyanı (1730) ile Lale Devri sona erdi.',
        'DİKKAT: Lale Devri\\'nde KESİNLİKLE ASKERİ ISLAHAT YAPILMAMIŞTIR!',
      ],
      osymTrap: '⚠️ LALE DEVRİ\\'NDE ASKERİ YENİLİK YOKTUR:\\nKPSS\\'de "Lale Devrinde Hendesehane açıldı veya ordu düzenlendi" seçenekleri standart çeldiricidir; Lale Devri\\'nde askeri ıslahat yoktur!',
    ),
    LectureSection(
      title: '3. XVIII. Yüzyıl Islahatçıları (3-1-3-1-3)',
      type: LectureSectionType.comparison,
      leadText: 'III. Ahmet, I. Mahmut, III. Mustafa, I. Abdülhamit ve III. Selim reformları:',
      leftHeader: 'I. Mahmut & III. Mustafa',
      rightHeader: 'III. Selim (Nizam-ı Cedit)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Hendesehane (İlk Batı tarzı okul), Mühendishane-i Bahr-i Hümayun',
          wrong: 'Mühendishane-i Berr-i Hümayun & Nizam-ı Cedit Ordusu',
          note: 'Askeri Eğitim',
        ),
        ComparisonRow(
          correct: 'Comte de Bonneval (Humbaracı Ahmet Paşa) ve Baron de Tott',
          wrong: 'Fransız subaylar nezaretinde modern eğitim',
          note: 'Yabancı Uzmanlar',
        ),
        ComparisonRow(
          correct: 'Esham (İç borçlanma senetleri) tasarlandı',
          wrong: 'Londra\\'da İLK DAİMİ elçilik açıldı (Yusuf Agah Efendi)',
          note: 'Finans ve Diplomasi',
        ),
      ],
      goldenRule: '💡 NİZAM-I CEDİT\\'İN İLK ZAFERİ: AKKA ZAFERİ (1799):\\nIII. Selim\\'in kurduğu Nizam-ı Cedit ordusu ilk ve tek zaferini Mısır\\'ı işgal eden Napolyon Bonapart\\'a karşı Akka Kalesi\\'nde kazanmıştır (Cezzar Ahmet Paşa).',
    ),
    LectureSection(
      title: '4. Gerileme Dönemi Soru Çözümleri',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'XVIII. yüzyıl ÖSYM favori sınav soruları:',
      bulletPoints: [
        'Kırım halkı halifeye bağlı kalarak kültürel bağ korunmak istenmiştir (Küçük Kaynarca).',
        'İlk daimi elçilik III. Selim döneminde Londra\\'da açılmıştır (Yusuf Agah Efendi).',
        'Cülus bahşişi I. Abdülhamit döneminde tamamen kaldırılmıştır.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Osmanlı Devleti\\'nde ilk geçici elçilik ve ilk daimi (sürekli) elçilik sırasıyla nerede açılmıştır?',
          options: ['Viyana - Paris', 'Paris - Londra', 'Londra - Berlin', 'Roma - Moskova', 'Paris - Viyana'],
          correctIndex: 1,
          explanation: 'İlk geçici elçilik Lale Devri\\'nde Paris\\'te (Yirmisekiz Çelebi Mehmet); ilk daimi elçilik ise III. Selim döneminde Londra\\'da (Yusuf Agah Efendi) açılmıştır.',
          ruleTag: 'Elçilikler Tarihi',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu7_gerileme_donemi.dart", "w", encoding="utf-8") as f:
    f.write(konu7_code)

print("Part 1 updated with exact model fields.")
