import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu4OsmanliKurulusYukselme = LectureTopic(
  id: 'tarih_osmanli_kurulus_yukselme',
  courseId: 'tarih',
  order: 4,
  title: 'Osmanlı Devleti Kuruluş ve Yükselme Dönemi',
  subtitle: 'Beylikten Devlete, Balkan Fetihleri, İstanbul\'un Fethi & Cihan İmparatorluğu',
  icon: Icons.castle_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 31 - 40',
  startTestNum: 31,
  endTestNum: 40,
  estimatedMinutes: 70,
  sections: [
    // BÖLÜM 1: BEYLİĞİN KURULUŞU VE BÜYÜME FAKTÖRLERİ
    LectureSection(
      title: '1. Osmanlı Beyliği\'nin Kuruluşu & Kısa Sürede Büyüme Nedenleri',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_osman_gazi_ve_sogut.png',
      imageCaption: 'Portre 4.1: Osmanlı Devleti\'nin Kurucusu Osman Gazi (1299 - 1326)',
      secondImageAssetPath: 'assets/images/tarih/tarih_sogut_domanic_kurulus_haritasi.png',
      secondImageCaption: 'Harita 4.1: Osman Gazi Dönemi Söğüt-Domaniç ve Çevresinde Beyliğin Doğuşu Haritası',
      leadText: 'Oğuzların Bozok kolunun Kayı boyuna mensup olan Osmanlılar, Moğol istilasından kaçarak Anadolu Selçuklu Sultanı I. Alâeddin Keykubad tarafından Söğüt ve Domaniç\'e uç beyliği olarak yerleştirilmiştir.',
      bulletPoints: [
        'Kısa Sürede Cihan Devletine Dönüşme Nedenleri:\n'
            '  • 1. Jeopolitik Konum: Bizans sınırında (uç beyliği) kurulması; Bizans\'ın taht kavgaları ve tekfurların keyfi yönetimiyle çökmüş olması.\n'
            '  • 2. Gaza ve Cihat Anlayışı: Yönünü sürekli Hristiyan/Bizans topraklarına çevirerek İslam dünyasının ve gazilerin sempatisini kazanması.\n'
            '  • 3. Anadolu Beylikleriyle İlk Başta Çatışmama: Diğer beyliklerin kardeş kavgalarından uzak durması.\n'
            '  • 4. İskân Politikası: Fethedilen Balkan topraklarına Anadolu\'dan getirilen konargöçer Türkmen ailelerin yerleştirilmesi (Bölgenin kalıcı Türkleşmesi).\n'
            '  • 5. İstimâlet (Hoşgörü) Politikası: Fethedilen gayrimüslim halka din, vicdan, dil ve can güvenliği tanıyarak devlete gönülden bağlanmalarını sağlaması.\n'
            '  • 6. Ahi ve Ulema Desteği: Osman Gazi\'nin Ahi şeyhi Şeyh Edebali\'nin kızı Bâlâ Hatun ile evlenerek Ahilerin desteğini arkasına alması.\n'
            '  • 7. Merkeziyetçi Yönetim: Yetenekli ve güçlü padişahların arka arkaya tahta çıkması.',
        'Osman Gazi Dönemi (1299 - 1326):\n'
            '  • 1302 Koyunhisar (Bafeus) Savaşı: Bizans tekfurları ordusuna karşı kazanılan İLK OSMANLI-BİZANS SAVAŞIDIR (Tarihçi Halil İnalcık\'a göre devletin gerçek kuruluşu).\n'
            '  • İlk Osmanlı parası (bakır) bastırılmıştır.\n'
            '  • İlk Osmanlı kadısı tayin edilmiştir (Dursun Fakih).\n'
            '  • İlk vergi olan "Baç" (çarşı-pazar vergisi) alınmıştır.',
      ],
    ),

    // BÖLÜM 2: ORHAN GAZİ DÖNEMİ - DEVLETLEŞME ADIMLARI
    LectureSection(
      title: '2. Orhan Gazi Dönemi (1326 - 1362) & Teşkilatlanma',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/tarih/tarih_orhan_gazi_cimpe_kalesi.png',
      imageCaption: 'Portre 4.2: Beylikten Devlete Geçişin Mimarı Orhan Gazi (1326 - 1362)',
      secondImageAssetPath: 'assets/images/tarih/tarih_cimpe_ve_rumeliye_gecis_haritasi.png',
      secondImageCaption: 'Harita 4.2: Orhan Gazi Dönemi Çimpe Kalesi ve Rumeli\'ye Geçiş Güzergâh Haritası',
      leadText: 'Beylikten devlete geçiş dönemi olarak adlandırılan Orhan Gazi devrinde ilk düzenli ordu ve merkezi bürokrasi kurulmuştur.',
      bulletPoints: [
        'Fetihler ve Askeri Gelişmeler:\n'
            '  • 1326: Bursa fethedilerek başkent yapılmıştır.\n'
            '  • 1329 Maltepe (Palekanon) Savaşı: Bizans İmparatoru III. Andronikos mağlup edilmiş, İznik ve İzmit fethedilerek Kocaeli yarımadası tamamen kontrol altına alınmıştır.\n'
            '  • Karesioğulları Beyliği\'nin Alınması (1345): Osmanlı\'ya katılan İLK BEYLİKTİR. Beyliğin donanması Osmanlı\'ya geçmiş (Denizcilik başladı), Hacı İlbey, Evrenos Bey gibi değerli komutanlar Osmanlı hizmetine girmiştir.\n'
            '  • ÇİMPE KALESİ\'NİN ALINMASI (1353): Bizans taht mücadelesinde Kantakuzen\'e yardım karşılığı Gelibolu\'daki Çimpe Kalesi üs olarak alınmıştır. OSMANLI\'NIN RUMELİ\'DEKİ İLK TOPRAĞIDIR.',
        'Devlet Teşkilatlanmasının İlkleri:\n'
            '  • İlk Divan Teşkilatı kurulmuş ve ilk Sadrazam (Vezir) tayin edilmiştir (Alaeddin Paşa).\n'
            '  • İlk düzenli ordu kurulmuştur: YAYA VE MÜSELLEM ORDUSU.\n'
            '  • İlk Osmanlı medresesi açılmıştır: İZNİK ORHANİYESİ (İlk müderris Davud-i Kayserî).\n'
            '  • İlk donanma kurulmuş (Karesioğulları\'nın katılımıyla) ve ilk tersane Karamürsel\'de açılmıştır.\n'
            '  • İlk gümüş para bastırılmıştır.',
      ],
      goldenRule: '💡 ÇİMPE KALESİ\'NİN ÖNEMİ:\n'
          'Osmanlı\'nın Rumeli ve Balkan fetihlerinde ana atlama tahtası ve ilk askeri üssü ÇİMPE KALESİ\'dir.',
    ),

    // BÖLÜM 3: I. MURAD VE YILDIRIM BAYEZİD
    LectureSection(
      title: '3. I. Murad (Hüdavendigar) ve Yıldırım Bayezid Dönemi',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_birinci_murad_sirpsindigi.png',
      imageCaption: 'Portre 4.3A: Sultan I. Murad (Hüdavendigar) (1362 - 1389)',
      secondImageAssetPath: 'assets/images/tarih/tarih_yildirim_bayezid_nigbolu.png',
      secondImageCaption: 'Portre 4.3B: Sultan I. Bayezid (Yıldırım) (1389 - 1402) - Niğbolu Fatihi',
      leadText: 'Balkanlarda Haçlı ordularının kırıldığı ve Anadolu Türk birliğinin ilk kez geniş çapta sağlandığı dönemdir.',
      bulletPoints: [
        'I. Murad Dönemi (1362 - 1389):\n'
            '  • 1363 Sazlıdere Savaşı: Bizans-Bulgar ordusu yenilmiş ve EDİRNE fethedilerek başkent yapılmıştır.\n'
            '  • 1364 SIRPSINDIĞI SAVAŞI: Haçlılara karşı kazanılan İLK BÜYÜK OSMANLI ZAFERİDİR.\n'
            '  • 1371 Çirmen Savaşı ile Makedonya kapıları açılmıştır.\n'
            '  • 1389 I. KOSOVA SAVAŞI: Büyük Haçlı ordusu imha edilmiştir. İlk kez bu savaşta top ses bombası olarak kullanılmıştır. I. Murad savaş meydanını gezerken yaralı Sırp Miloş Obiliç tarafından hançerlenerek ŞEHİT EDİLEN İLK VE TEK OSMANLI PADİŞAHIDIR.\n'
            '  • Teşkilatlanma: Acemi Ocağı ve YENİÇERİ OCAĞI kurulmuştur. PENÇİK SİSTEMİ (esirlerin 1/5\'i) ve Devşirme uygulanmıştır. Kazaskerlik, Defterdarlık ve RUMELİ BEYLERBEYLİĞİ (Manastır) kurulmuştur. Veraset "Ülke padişah ve oğullarınındır" şeklinde merkeziyetçileştirilmiştir.',
        'I. Bayezid (Yıldırım) Dönemi (1389 - 1402):\n'
            '  • Anadolu Türk Siyasi Birliğini geniş ölçüde İLK KEZ sağlamıştır (Aydınoğulları, Saruhanoğulları, Menteşeoğulları, Germiyanoğulları, Karamanoğulları\'nı bağlamıştır).\n'
            '  • İstanbul\'u kuşatan İLK Osmanlı padişahıdır (Kuşatma için ANADOLU HİSARI / Güzelcehisar inşa edilmiştir).\n'
            '  • 1396 NİĞBOLU ZAFERİ: Avrupa\'nın en seçkin şövalyelerinden oluşan Haçlı ordusunu ezmiştir. Halife tarafından kendisine "SULTAN-I İKLİM-İ RÛM" (Anadolu Diyarının Sultanı) unvanı verilmiştir.\n'
            '  • 1402 ANKARA SAVAŞI: Timur ile yapılan savaşta Osmanlı ordusundaki beylik askerlerinin taraf değiştirmesiyle hezimete uğramış, Yıldırım esir düşmüştür. Devlet 11 yıl sürecek FETRET DEVRİ\'ne girmiştir.',
      ],
    ),

    // BÖLÜM 4: FETRET DEVRİ & II. MURAD DÖNEMİ
    LectureSection(
      title: '4. Fetret Devri, Çelebi Mehmed & II. Murad Dönemi',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/tarih/tarih_varna_ve_ikinci_kosova.png',
      imageCaption: 'Harita 4.4: II. Murad Dönemi Balkan Harekâtı, Varna (1444) ve II. Kosova (1448) Meydan Muharebeleri',
      leadText: 'Devletin yıkılma tehlikesini atlattığı, ikinci kurucusunu bulduğu ve Balkanların kesin Türk yurdu haline geldiği evredir.',
      bulletPoints: [
        'Fetret Devri (1402 - 1413) ve I. Mehmed (Çelebi):\n'
            '  • Yıldırım\'ın oğulları (İsa, Musa, Süleyman, Mehmed) arasında 11 yıl süren taht kavgaları dönemidir.\n'
            '  • Çelebi Mehmed kardeşlerini saf dışı bırakıp birliği sağladığı için DEVLETİN İKİNCİ KURUCUSU kabul edilir.\n'
            '  • İlk dini-sosyal isyan olan ŞEYH BEDREDDİN İSYANI bastırılmıştır.\n'
            '  • Venedik ile ilk deniz savaşı (Çalı Bey Savaşı) yapılmıştır.',
        'II. Murad Dönemi (1421 - 1451):\n'
            '  • Haçlılarla 1444 Edirne-Segedin Barış Antlaşması imzalanmış, tahtı 12 yaşındaki oğlu II. Mehmed\'e (Fatih) devretmiştir.\n'
            '  • Haçlıların antlaşmayı bozması üzerine tekrar tahta geçerek 1444 VARNA ZAFERİ\'ni kazanmıştır.\n'
            '  • 1448 II. KOSOVA SAVAŞI: Haçlı ordusu kesin bir hezimete uğratılmıştır.\n'
            '  • ÖNEMİ: BALKANLAR KESİN OLARAK TÜRK YURDU OLMUŞTUR. Avrupalıların Osmanlı\'yı Balkanlardan atma ümidi tamamen sona ermiştir.',
      ],
    ),

    // BÖLÜM 5: FATİH SULTAN MEHMED VE İSTANBUL'UN FETHİ
    LectureSection(
      title: '5. Fatih Sultan Mehmed (1451 - 1481) & İstanbul\'un Fethi',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_fatih_sultan_mehmet_istanbul.png',
      imageCaption: 'Portre 4.5: Fatih Sultan Mehmed Han (Gentile Bellini Yağlı Boya Tablosu)',
      secondImageAssetPath: 'assets/images/tarih/tarih_istanbul_kusatma_plani_1453.png',
      secondImageCaption: 'Harita 4.5: 1453 İstanbul\'un Fethi Kuşatma Planı (Haliç Zinciri, Karadan Yürütülen Gemiler & Şâhi Topları)',
      leadText: 'Bir çağı kapatıp yeni bir çağı açan, Osmanlı Devleti\'ni imparatorluk mertebesine yükselten büyük fetih ve cihan hükümdarı.',
      bulletPoints: [
        'İstanbul\'un Fethi\'nin (29 Mayıs 1453) Nedenleri:\n'
            '  • Bizans\'ın şehzadeleri ve Haçlıları sürekli kışkırtması; Anadolu-Rumeli toprak bütünlüğünü bozması; Hz. Muhammed\'in fethi müjdeleyen hadis-i şerifi.',
        'Fetih Hazırlıkları:\n'
            '  • Boğaz\'ın kuzeyine BOĞAZKESEN (Rumeli Hisarı) inşa edildi; ŞAHİ TOPLARI döktürüldü; tekerlekli kuleler ve 400 parçalık donanma hazırlandı; 72 parça gemi karadan Haliç\'e indirildi.',
        'Fethin Dünya Tarihindeki Sonuçları:\n'
            '  • 1058 yıllık Doğu Roma (Bizans) İmparatorluğu tarihe karıştı.\n'
            '  • ORTA ÇAĞ kapandı, YENİ ÇAĞ başladı.\n'
            '  • Şahi toplarının surları yıkmasıyla Avrupa\'da FEODALİTE (Derebeylik) yıkılma sürecine girdi, merkezi krallıklar güçlendi.\n'
            '  • İtalya\'ya kaçan Bizanslı bilginler RÖNESANS hareketini başlattı.\n'
            '  • Ticaret yollarının Osmanlı denetimine geçmesi Avrupalıları yeni yollar aramaya sevk etti (COĞRAFİ KEŞİFLER).',
        'Fethin Türk Tarihindeki Sonuçları:\n'
            '  • Osmanlı Kuruluş Dönemi bitti, YÜKSELME DÖNEMİ başladı. İstanbul payitaht (başkent) oldu. II. Mehmed "FATİH" ve "KAYSER-İ RÛM" unvanlarını aldı.',
        'Diğer Fetihleri:\n'
            '  • Balkanlar: Sırbistan, Mora, Eflak, Boğdan, Bosna-Hersek, Arnavutluk.\n'
            '  • Denizler: Ege Adaları, Rodos hariç On İki Ada, Otranto (İtalya).\n'
            '  • Karadeniz: Cenevizlilerden Amasra, Sinop, Trabzon Rum İmparatorluğu ve KIRIM\'IN FETHİ (1475 Gedik Ahmet Paşa ile Kırım alınınca KARADENİZ BİR TÜRK GÖLÜ HALİNE GELDİ).\n'
            '  • Doğu: 1473 Otlukbeli Savaşı ile Akkoyunlu Devleti (Uzun Hasan) mağlup edildi.\n'
            '  • Teşkilat: İlk yazılı kanunname KANUNNAME-İ ÂL-İ OSMAN yayımlandı (Kardeş katli yasallaştı, Sahn-ı Seman Medreseleri kuruldu, Topkapı Sarayı inşa edildi, ilk altın para basıldı).',
      ],
    ),

    // BÖLÜM 6: YAVUZ SULTAN SELİM VE DOĞU SEFERLERİ
    LectureSection(
      title: '6. Yavuz Sultan Selim (1512 - 1520) & Hilafet',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_yavuz_sultan_selim_caldiran.png',
      imageCaption: 'Portre 4.6: Sultan Selim Şah (Yavuz Sultan Selim Han Portresi)',
      secondImageAssetPath: 'assets/images/tarih/tarih_yavuz_dogu_ve_misir_seferleri.png',
      secondImageCaption: 'Harita 4.6: Yavuz Sultan Selim\'in Doğu ve Mısır Seferleri: Çaldıran (1514) ve Ridaniye (1517) Haritası',
      leadText: '8 yıllık saltanatına 80 yıllık fetih sığdıran, devlet hazinesini ağzına kadar altınla dolduran büyük cihangir.',
      bulletPoints: [
        '1514 Çaldıran Zaferi:\n'
            '  • Şii Safevi Devleti hükümdarı Şah İsmail mağlup edilmiş; Doğu Anadolu güvenliği sağlanmış ve Tebriz\'e girilmiştir.',
        '1515 Turnadağ Savaşı:\n'
            '  • Dulkadiroğulları Beyliği\'ne son verilmiştir. ANADOLU TÜRK SİYASİ BİRLİĞİ KESİN OLARAK SAĞLANMIŞTIR.',
        'Mısır Seferi (1516 Mercidabık & 1517 Ridaniye):\n'
            '  • Memlûk Devleti tamamen yıkılmıştır. Suriye, Lübnan, Filistin, Mısır ve Hicaz (Mekke-Medine) Osmanlı topraklarına katılmıştır.\n'
            '  • HİLAFET OSMANLI HANEDANINA GEÇMİŞTİR (İlk Osmanlı Halifesi Yavuz Sultan Selim\'dir).\n'
            '  • Kutsal Emanetler Topkapı Sarayı\'na getirilmiştir. Yavuz "Hâdimü\'l-Haremeyni\'ş-Şerîfeyn" (Mekke ve Medine\'nin Hizmetkârı) unvanını almıştır.\n'
            '  • Baharat Yolu tamamen Osmanlı denetimine geçmiştir.',
      ],
    ),

    // BÖLÜM 7: KANUNİ SULTAN SÜLEYMAN & EN PARLAK DÖNEM
    LectureSection(
      title: '7. Kanuni Sultan Süleyman (1520 - 1566) & Muhteşem Yüzyıl',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_kanuni_sultan_suleyman_mohac.png',
      imageCaption: 'Portre 4.7: Kanuni Sultan Süleyman Han (Muhteşem Süleyman Portresi)',
      secondImageAssetPath: 'assets/images/tarih/tarih_kanuni_mohac_ve_fetihler.png',
      secondImageCaption: 'Harita 4.7: Kanuni Sultan Süleyman Dönemi Mohaç Meydan Muharebesi (1526) ve Orta Avrupa Fetihleri Haritası',
      leadText: '46 yıl tahtta kalarak en uzun süre hüküm süren, adalet kanunları sebebiyle "Kanuni", Avrupa\'da ise "Muhteşem Süleyman" olarak anılan hükümdar.',
      bulletPoints: [
        'Batı Seferleri ve Zaferler:\n'
            '  • 1521 Belgrad\'ın Fethi: Orta Avrupa fetihlerinin kapısı açıldı.\n'
            '  • 1526 MOHAÇ MEYDAN MUHAREBESİ: Macar ordusu 2 saat gibi rekor bir sürede imha edildi. Dünya tarihinin en kısa süren meydan savaşıdır. Macaristan Osmanlı\'ya bağlandı.\n'
            '  • 1529 I. Viyana Kuşatması yapıldı.\n'
            '  • 1533 İSTANBUL (İBRAHİM PAŞA) ANTLAŞMASI: Avusturya arşidükü protokol bakımından Osmanlı sadrazamına eşit sayıldı (Avrupa karşısında mutlak siyasi ve diplomatik üstünlük).',
        'Denizlerdeki Hâkimiyet:\n'
            '  • Rodos Adası fethedildi (1522).\n'
            '  • Barbaros Hayreddin Paşa (Hızır Reis) Kaptan-ı Derya oldu ve Cezayir savaşsız Osmanlı\'ya katıldı.\n'
            '  • 28 Eylül 1538 PREVEZE DENİZ ZAFERİ: Andrea Doria komutasındaki devasa Haçlı donanması imha edildi. AKDENİZ BİR TÜRK GÖLÜ HALİNE GELDİ (Günümüzde Türk Deniz Kuvvetleri Günü olarak kutlanır).\n'
            '  • 1560 Cerbe Deniz Zaferi: Haçlı donanması bir kez daha yenilgiye uğratıldı.',
        'Sokullu Mehmed Paşa Dönemi (1566 - 1579):\n'
            '  • Kanuni\'nin son seferi Zigetvar\'dır (1566).\n'
            '  • II. Selim ve III. Murad devirlerinde idareyi yürüten Sokullu döneminde Kıbrıs fethedildi (1571).\n'
            '  • İnebahtı Deniz Bozgunu (1571): Haçlılar Osmanlı donanmasını yaktı (Sokullu\'nun tarihi cevabı: "Biz Kıbrıs\'ı alarak sizin kolunuzu kestik, siz donanmamızı yakmakla sakalımızı tıraş ettiniz").\n'
            '  • Kanal Projeleri: Don-Volga Kanal Projesi (Hazar\'a ulaşıp Rusya\'yı durdurmak) ve Süveyş Kanalı Projesi.',
      ],
      goldenRule: '💡 TÜRK GÖLLERİ:\n'
          '• Karadeniz\'in Türk Gölü Olması = FATİH SULTAN MEHMED (1475 Kırım\'ın Fethi)\n'
          '• Akdeniz\'in Türk Gölü Olması = KANUNİ SULTAN SÜLEYMAN (1538 Preveze Deniz Zaferi).',
    ),
  ],
);
