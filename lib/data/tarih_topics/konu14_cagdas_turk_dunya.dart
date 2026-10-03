import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu14CagdasTurkDunya = LectureTopic(
  id: 'tarih_cagdas_turk_dunya',
  courseId: 'tarih',
  order: 14,
  title: 'Çağdaş Türk ve Dünya Tarihi',
  subtitle: 'Atatürk Dönemi Dış Politika, Montrö, Hatay, II. Dünya Savaşı & Soğuk Savaş',
  icon: Icons.public_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 131 - 140',
  startTestNum: 131,
  endTestNum: 140,
  estimatedMinutes: 80,
  sections: [
    // BÖLÜM 1: 1923 - 1930 TÜRK DIŞ POLİTİKASI (LOZAN'DAN KALAN SORUNLAR)
    LectureSection(
      title: '1. 1923 - 1930 Dış Politika: Lozan\'dan Kalan Sorunlar',
      type: LectureSectionType.overview,
      leadText: 'Atatürk\'ün "Yurtta sulh, cihanda sulh" ilkesi doğrultusunda tam bağımsızlık, eşitlik ve uluslararası hukuka dayalı barışçı dış politika.',
      bulletPoints: [
        '1. Yabancı Okullar Sorunu (Fransa ve Papalık ile):\n'
            '  • Tevhid-i Tedrisat gereği yabancı okullarda tarih ve coğrafya derslerinin Türkçe okutulması ve Türk müfettişlerce denetlenmesi kararlaştırıldı.\n'
            '  • Fransa konuyu uluslararası alana taşımak istedi; Türkiye "Bu bizim İÇ MESELEMİZDİR, asla taviz vermeyiz" diyerek kurallara uymayan okulları kapattı.',
        '2. Musul Meselesi ve Irak Sınırı (İngiltere ile):\n'
            '  • Lozan\'da çözülememişti. 1924 Haliç Konferansı\'nda Ali Fethi Okyar Musul\'u savundu, ancak sonuç alınamadı.\n'
            '  • ŞEYH SAİT İSYANI (1925) nedeniyle Türkiye askeri harekât yapamadı ve taviz vermek zorunda kaldı.\n'
            '  • 1926 ANKARA ANTLAŞMASI: Musul ve Kerkük İngiliz mandasındaki Irak\'a bırakıldı; Musul petrol gelirlerinin %10\'u 25 yıl süreyle Türkiye\'ye verildi (Türkiye 500.000 sterlin peşin para karşılığı vazgeçti).',
        '3. Nüfus Mübadelesi ve Etabli Sorunu (Yunanistan ile):\n'
            '  • Yunanistan İstanbul\'da daha fazla Rum bırakmak için "Etabli" (Yerleşik) kavramını çarpıttı.\n'
            '  • 1930 AHALİ ANTLAŞMASI ile sorun çözüldü: İstanbul Rumları ile Batı Trakya Türkleri hariç tüm nüfus mübadele edildi.\n'
            '  • Sonuç: Türk-Yunan dostluğu başladı; Yunan Başbakanı Venizelos Atatürk\'ü Nobel Barış Ödülü\'ne aday gösterdi.',
        '4. Osmanlı Dış Borçları Sorunu (Fransa ile):\n'
            '  • 1929 Dünya Ekonomik Buhranı borç ödemelerini zora sokunca Hoover Moratoryumu doğrultusunda 1933 yılında Paris Antlaşması ile taksitlendirildi; son taksit 1954 yılında ödendi.',
        '5. Bozkurt - Lotus Olayı (1926 - Fransa ile):\n'
            '  • Midilli açıklarında Türk kömür gemisi Bozkurt ile Fransız Lotus gemisi çarpıştı; 8 Türk denizci şehit oldu. Mahmut Esat Bey Lahey Uluslararası Adalet Divanı\'nda davayı Türkiye lehine kazandı (Atatürk Mahmut Esat\'a "Bozkurt" soyadını verdi).',
      ],
    ),

    // BÖLÜM 2: 1930 - 1938 TÜRK DIŞ POLİTİKASI (BARIŞ VE GÜVENLİK İTTİFAKLARI)
    LectureSection(
      title: '2. 1930 - 1938 Dış Politika: Montrö, Sadabat & Hatay Davası',
      type: LectureSectionType.formula,
      leadText: 'İtalya ve Almanya\'nın saldırgan ve revizyonist politikalarına karşı Türkiye\'nin kurduğu bölgesel savunma paktları ve tarihi zaferler.',
      bulletPoints: [
        '1. Türkiye\'nin Milletler Cemiyeti\'ne (Cemiyet-i Akvam) Girişi (1932):\n'
            '  • İspanya\'nın teklifi, Yunanistan\'ın desteği ve genel kurulun DAVETİYLE Cemiyete giren İLK VE TEK DEVLET Türkiye\'dir.',
        '2. Balkan Antantı (9 Şubat 1934 - Şifre: T - A - Y - Y - A - R):\n'
            '  • Üyeler: TÜRKİYE, YUNANİSTAN, YUGOSLAVYA, ROMANYA.\n'
            '  • Amaç: İtalya ve Almanya tehdidine karşı Batı sınırlarını karşılıklı güvence altına almak.\n'
            '  • Katılmayanlar: Bulgaristan (yayılmacı emelleri yüzünden) ve Arnavutluk (İtalya baskısı yüzünden).',
        '3. MONTRÖ BOĞAZLAR SÖZLEŞMESİ (20 Temmuz 1936):\n'
            '  • Neden: İtalya\'nın Habeşistan\'ı işgali ve Almanya\'nın Ren bölgesini silahlandırması üzerine Türkiye Boğazlar güvenliğinin tehlikede olduğunu belirtti.\n'
            '  • Tarihi Maddeleri:\n'
            '    - Uluslararası Boğazlar Komisyonu KALDIRILDI; tüm yetkileri TÜRKİYE DEVLETİ\'NE DEVREDİLDİ.\n'
            '    - Boğazların her iki yakasında Türk askeri konuşlandırıldı.\n'
            '    - Ticaret gemilerinin geçişi serbest, savaş gemilerinin geçişi Türkiye\'nin iznine bağlandı.\n'
            '    - Karadeniz\'e kıyısı olmayan devletlerin savaş gemilerine tonaj ve 21 günlük süre sınırı getirildi.\n'
            '  • ÖNEMİ: BOĞAZLARDA TAM VE KESİNTİSİZ TÜRK EGEMENLİĞİ SAĞLANDI! Lozan\'ın en büyük eksikliği giderildi.',
        '4. Sadabat Paktı (8 Temmuz 1937 - Tahran):\n'
            '  • Üyeler: TÜRKİYE, İRAN, IRAK, AFGANİSTAN.\n'
            '  • Amaç: İtalya\'nın Ortadoğu ve Doğu Akdeniz tehdidine karşı Doğu sınırlarını güvence altına almak (Suriye Hatay meselesi yüzünden katılmamıştır).',
        '5. HATAY MESELESİ VE ANAVATANA KATILMASI (1939):\n'
            '  • Fransa 1936\'da Suriye mandasından çekilince Hatay sorunu doğdu. Atatürk "Hatay benim şahsi meselemdir!", "Kırk asırlık Türk yurdu düşman elinde esir kalamaz!" demiştir.\n'
            '  • Milletler Cemiyeti SANDLER RAPORU ile Hatay\'ın ayrı bir varlık olduğunu tescilledi.\n'
            '  • 2 Eylül 1938: BAĞIMSIZ HATAY DEVLETİ kuruldu (İlk Cumhurbaşkanı TAYFUR SÖKMEN, Başbakanı ABDURRAHMAN MELEK).\n'
            '  • 23 Haziran 1939: Hatay Millet Meclisi oybirliğiyle TÜRKİYE\'YE KATILMA KARARI aldı (Atatürk vefatından önce temelini atmıştır).',
      ],
      goldenRule: '💡 ATATÜRK DÖNEMİ DIŞ POLİTİKA ZİRVESİ:\n'
          '• Boğazların kurtarılması = 1936 MONTRÖ BOĞAZLAR SÖZLEŞMESİ\n'
          '• Atatürk\'ün vefatından sonra gerçekleşen tek dış gelişme = 1939 HATAY\'IN ANAVATANA KATILMASI.',
    ),

    // BÖLÜM 3: II. DÜNYA SAVAŞI (1939 - 1945) VE TÜRKİYE
    LectureSection(
      title: '3. II. Dünya Savaşı (1939 - 1945) & Türkiye\'nin Tutumu',
      type: LectureSectionType.ruleList,
      leadText: '60 milyondan fazla insanın öldüğü küresel felaket ve Türkiye\'nin savaşa fiilen girmeyerek izlediği denge diplomasisi.',
      bulletPoints: [
        'Savaşan Bloklar:\n'
            '  • MİHVER DEVLETLER: Almanya (Hitler - Nazizm), İtalya (Mussolini - Faşizm), Japonya (Hirohito).\n'
            '  • MÜTTEFİK DEVLETLER: İngiltere (Churchill), Fransa (De Gaulle), SSCB (Stalin), ABD (Roosevelt - Pearl Harbor baskını sonrası girdi).',
        'Türkiye\'nin Savaş Politikası (İsmet İnönü Dönemi):\n'
            '  • Türkiye savaş boyunca tarafsızlık ve dengeli dış politika izlemiştir.\n'
            '  • 1943 Adana Görüşmesi (Yenice Çadırı): Churchill bizzat tren garında İsmet İnönü\'yü savaşa girmeye ikna etmeye çalıştı; İnönü ordunun modern teçhizatı olmadan savaşa girmeyeceğini belirtti.\n'
            '  • 1943 I. ve II. Kahire Konferansları yapıldı.\n'
            '  • SAVAŞ İLANI (23 Şubat 1945): Yalta Konferansı kararı gereği, BİRLEŞMİŞ MİLLETLER\'İN KURUCU ÜYESİ OLABİLMEK ve San Francisco Konferansı\'na katılabilmek için Türkiye sembolik olarak Almanya ve Japonya\'ya savaş ilan etmiştir (Hiçbir cepheye fiilen asker göndermemiştir).',
        'Savaş Yıllarında Türkiye\'de Yaşanan İç Gelişmeler:\n'
            '  • Seferberlik ilan edildi; 1 milyondan fazla genç silah altına alındı; tarımsal ve sanayi üretimi düştü.\n'
            '  • 1940 MİLLİ KORUNMA KANUNU çıkarıldı (Devlete ekonomiye müdahale yetkisi verildi).\n'
            '  • Ekmek, şeker ve un karneye bağlandı; geceleri karartma geceleri uygulandı.\n'
            '  • 1942 VARLIK VERGİSİ: Savaş zenginlerinden ve karaborsacılardan tek seferlik servet vergisi alındı (Ödemeyenler Aşkale\'ye çalışma kampına gönderildi).\n'
            '  • 1944 Toprak Mahsulleri Vergisi alındı; Köy Enstitüleri (1940 - Hasan Âli Yücel, İsmail Hakkı Tonguç) açıldı.',
      ],
    ),

    // BÖLÜM 4: SOĞUK SAVAŞ DÖNEMİ, ÇOK PARTİLİ HAYAT VE ÇAĞDAŞ GELİŞMELER
    LectureSection(
      title: '4. Soğuk Savaş, NATO\'ya Giriş, Çok Partili Hayat & Kıbrıs',
      type: LectureSectionType.comparison,
      leadText: 'ABD liderliğindeki Batı Bloku ile SSCB liderliğindeki Doğu Bloku arasındaki nükleer rekabet ve Türkiye\'nin Batı ittifakındaki yeri:',
      bulletPoints: [
        '1. Soğuk Savaş Bloklaşmaları:\n'
            '  • BATI BLOKU (ABD): Truman Doktrini (1947 - Türkiye ve Yunanistan\'a askeri yardım), Marshall Planı (ekonomik yardım), NATO (Kuzey Atlantik Savunma Paktı - 1949).\n'
            '  • DOĞU BLOKU (SSCB): Kominform (siyasi işbirliği), Comecon (ekonomik pakt), VARŞOVA PAKTI (askeri ittifak - 1955).',
        '2. Türkiye\'nin NATO\'ya Girişi (1952):\n'
            '  • SSCB lideri Stalin\'in Boğazlardan üs ve Kars-Ardahan\'ı talep etmesi üzerine Türkiye Batı ittifakına yöneldi.\n'
            '  • KORE SAVAŞI (1950): Türkiye General Tahsin Yazıcı komutasında 4.500 kişilik Türk Tugayı\'nı Kunuri Muharebeleri\'ne gönderdi. Türk askerinin kahramanlığı sonucu TÜRKİYE VE YUNANİSTAN 1952 YILINDA NATO\'YA KABUL EDİLDİ.',
        '3. Çok Partili Hayata Kesin Geçiş (1945 - 1946):\n'
            '  • 1945: Nuri Demirağ tarafından MİLLİ KALKINMA PARTİSİ kuruldu (Çok partili hayatın ilk partisidir).\n'
            '  • 1946: CHP\'den ayrılan DÖRTLÜ TAKRİR grubu (CELAL BAYAR, ADNAN MENDERES, REFİK KORALTAN, FUAT KÖPRÜLÜ) DEMOKRAT PARTİ\'Yİ (DP) kurdu.\n'
            '  • 1946 Seçimleri: İlk çok partili seçimdir (Açık oy - Gizli tasnif hilesiyle yapıldı).\n'
            '  • 14 MAYIS 1950 SEÇİMLERİ (BEYAZ İHTİLAL): Gizli oy - Açık tasnif ile yapılan ilk dürüst seçimde Demokrat Parti ezici çoğunlukla iktidara geldi. 27 yıllık tek parti iktidarı kansız şekilde el değiştirdi (Celal Bayar Cumhurbaşkanı, Adnan Menderes Başbakan oldu).',
        '4. Kıbrıs Sorunu ve 1974 Kıbrıs Barış Harekâtı:\n'
            '  • EOKA terör örgütü ve Enosis (Kıbrıs\'ı Yunanistan\'a bağlama) planına karşı Türkler TÜRK MUKAVEMET TEŞKİLATI\'NI (TMT) kurdu (Dr. Fazıl Küçük ve Rauf Denktaş).\n'
            '  • 1963 Kanlı Noel katliamı; Pilot Yüzbaşı Cengiz Topel\'in şehit edilmesi.\n'
            '  • 20 TEMMUZ 1974 KIBRIS BARIŞ HAREKÂTI: Başbakan Bülent Ecevit ve Başbakan Yardımcısı Necmettin Erbakan hükümeti "AYŞE TATİLE ÇIKSIN" parolasıyla Türk Silahlı Kuvvetleri\'ni adaya çıkardı.\n'
            '  • 1983: KUZEY KIBRIS TÜRK CUMHURİYETİ (KKTC) kuruldu; ilk Cumhurbaşkanı RAUF DENKTAŞ oldu.',
      ],
      goldenRule: '💡 BEYAZ İHTİLAL VE ÇOK PARTİLİ HAYAT:\n'
          '• Çok partili hayatın ilk partisi = MİLLİ KALKINMA PARTİSİ (1945)\n'
          '• İktidara gelen muhalefet = DEMOKRAT PARTİ (14 Mayıs 1950 Beyaz İhtilal)\n'
          '• Kıbrıs Barış Harekâtı parolası = "AYŞE TATİLE ÇIKSIN" (1974).',
      imageAssetPath: 'assets/images/tarih/tarih_cagdas_ve_kibris_infografik.png',
      imageCaption: 'Soğuk Savaş Blokları, NATO Süreci ve 1974 Kıbrıs Barış Harekâtı İnfografiği',
    ),
  ],
);
