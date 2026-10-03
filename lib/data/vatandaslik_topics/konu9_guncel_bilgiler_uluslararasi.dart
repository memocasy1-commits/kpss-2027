import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu9GuncelUluslararasi = LectureTopic(
  id: 'vat_konu9',
  courseId: 'vatandaslik',
  order: 9,
  title: 'Güncel Bilgiler & Uluslararası Kuruluşlar',
  subtitle: 'BM, NATO, AB, Türk Dünyası, UNESCO Mirasları ve Milli Mega Projeler',
  icon: Icons.public_rounded,
  color: Color(0xFF0369A1),
  testRange: 'Test 61 - 68',
  startTestNum: 61,
  endTestNum: 68,
  estimatedMinutes: 65,
  sections: [
    LectureSection(
      title: 'Küresel ve Bölgesel Uluslararası Kuruluşlar',
      type: LectureSectionType.overview,
      leadText: 'KPSS Genel Kültür sınavında her yıl uluslararası örgütlerin merkezleri, kurucu antlaşmaları ve Türkiye\'nin üyelik statüsünden en az 2-3 soru gelmektedir.',
      bulletPoints: [
        'BİRLEŞMİŞ MİLLETLER (BM - 1945):',
        '  - Merkezi: New York (ABD). Türkiye kurucu üyedir.',
        '  - Güvenlik Konseyi: 15 üyeden oluşur. 5 Daimi Üyenin VETO HAKKI vardır (KODLAMA: FİRÇA veya ÇİFTO -> Fransa, İngiltere, Rusya, Çin, ABD).',
        '  - Yargı Organı: Uluslararası Adalet Divanı (UAD) - Merkezi Lahey (Hollanda).',
        '  - Genel Sekreteri: Antonio Guterres (Portekiz).',
        'KUZEY ATLASİTİK PAKTI (NATO - 1949):',
        '  - Merkezi: Brüksel (Belçika). Savunma paktıdır (Madde 5: Birimize yapılan saldırı hepimize yapılmıştır).',
        '  - Türkiye 1952 yılında (Kore Savaşı sonrası, Yunanistan ile birlikte) üye olmuştur.',
        '  - Son katılan üyeler: 31. üye Finlandiya (2023), 32. üye İsveç (2024).',
        'AVRUPA BİRLİĞİ (AB):',
        '  - Temeli: 1951 Schuman Bildirgesi ve Paris Antlaşması (AKÇT) ile 1957 Roma Antlaşması (AET).',
        '  - 1992 Maastricht Antlaşması ile adı Avrupa Birliği olmuştur.',
        '  - Ortak Para Birimi: Euro (1999).',
        '  - Türkiye\'nin Adaylık Statüsü: 1999 Helsinki Zirvesi\'nde aday ülke ilan edilmiştir; 2005\'te katılım müzakereleri başlamıştır.',
        '  - İngiltere Brexit süreciyle AB\'den ayrılan ilk devlettir.',
        'AVRUPA KONSEYİ (1949):',
        '  - Merkezi: Strazburg (Fransa). Türkiye kurucu üyelerindendir.',
        '  - Yargı Organı: Avrupa İnsan Hakları Mahkemesi (AİHM). Türkiye AİHM\'in zorunlu yargı yetkisini 1990\'da kabul etmiştir.'
      ],
      goldenRule: 'BM GÜVENLİK KONSEYİ VETO YETKİLİ DAİMİ 5\'Lİ: F-İ-R-Ç-A (Fransa, İngiltere, Rusya, Çin, ABD). NATO\'nun en son üyeleri: Finlandiya (31) ve İsveç (32).',
      osymTrap: 'ÖSYM Çeldiricisi: \'Avrupa İnsan Hakları Mahkemesi (AİHM) Avrupa Birliği\'nin mahkemesidir\' der. KESİNLİKLE YANLIŞ! AİHM, Avrupa Konseyi\'nin yargı organıdır; Avrupa Birliği\'nin yargı organı ise Lüksemburg\'daki Adalet Divanı\'dır (ABAD).'
    ),
    LectureSection(
      title: 'Türk Dünyası, Bölgesel İşbirlikleri ve Ekonomik Paktlar',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'nin öncülük ettiği Avrasya ve İslam coğrafyası teşkilatları KPSS\'de sıkça sorulmaktadır.',
      bulletPoints: [
        'TÜRK DEVLETLERİ TEŞKİLATI (TDT):',
        '  - Temeli: 2009 Nahçıvan Anlaşması ile Türk Keneşi (Konseyi) adıyla atılmıştır.',
        '  - 2021 İstanbul Zirvesi\'nde adı \'Türk Devletleri Teşkilatı\' olarak değiştirilmiştir. Merkezi İstanbul\'dur.',
        '  - Üye Ülkeler: Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan.',
        '  - Gözlemci Üyeler: Macaristan, Türkmenistan, Kuzey Kıbrıs Türk Cumhuriyeti (KKTC).',
        'TÜRKSOY (Uluslararası Türk Kültürü Teşkilatı - 1993):',
        '  - Türk Dünyasının UNESCO\'su olarak bilinir. Merkezi Ankara\'dadır.',
        '  - Her yıl Türk Dünyası Kültür Başkenti seçer (Örn: Bursa, Şuşa, Anev).',
        'İSLAM İŞBİRLİĞİ TEŞKİLATI (İİT - 1969):',
        '  - 1969 Mescid-i Aksa kundaklaması sonrası kurulmuştur. Merkezi Cidde\'dir (Suudi Arabistan).',
        'D-8 (Gelişmekte Olan 8 Ülke - 1997):',
        '  - Necmettin Erbakan öncülüğünde İstanbul\'da kurulmuştur. KODLAMA: N-İ-G-E-T-B-A-M (Nijerya, İran, Gine/Malezya, Endonezya, Türkiye, Bangladeş, Mısır, Pakistan).',
        'EKONOMİK İŞBİRLİĞİ VE KALKINMA ÖRGÜTÜ (OECD):',
        '  - Merkezi Paris\'tir. Türkiye kurucu üyedir.',
        'G-20 (Dünyanın En Büyük 20 Ekonomisi):',
        '  - Türkiye 2015 yılında Antalya Zirvesi ile dönem başkanlığı yapmıştır.'
      ],
      goldenRule: 'TDT ÜYELERİ: Türkiye, Azerbaycan, Kazakistan, Kırgızistan, Özbekistan. KKTC gözlemci üyedir. TÜRKSOY\'un merkezi Ankara, TDT\'nin merkezi İstanbul\'dur.',
      osymTrap: 'ÖSYM Sorusu: Türkmenistan TDT\'nin tam üyesi midir? HAYIR! Türkmenistan tarafsızlık statüsü nedeniyle tam üye değil, GÖZLEMCİ ÜYEDİR.'
    ),
    LectureSection(
      title: 'UNESCO Dünya Mirası Listesi\'ndeki Türkiye Değerleri (Güncel)',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'nin UNESCO Dünya Miras Listesi\'nde 21 tescilli alanı bulunmaktadır (En son eklenenler KPSS\'de doğrudan sorulur!).',
      bulletPoints: [
        'EN SON EKLENEN MİRASLARIMIZ (Sınavda çıkma ihtimali en yüksek!):',
        '  - 20. Varlık: GORDİON (Ankara - Polatlı) -> Antik Frigya\'nın başkenti (2023 yılında UNESCO Dünya Mirası Listesi\'ne alındı).',
        '  - 21. Varlık: ANADOLU\'NUN ORTAÇAĞ AHŞAP HİPOSTİL CAMİLERİ (2023): Konya Eşrefoğlu Camii, Kastamonu Mahmut Bey Camii, Eskişehir Sivrihisar Ulu Camii, Afyonkarahisar Ulu Camii, Ankara Arslanhane (Ahi Şerafeddin) Camii.',
        'DİĞER KRİTİK UNESCO ALANLARI:',
        '  - İlk Eklenenler (1985): Divriği Ulu Camii ve Darüşşifası (Sivas), İstanbul\'un Tarihi Alanları, Göreme Milli Parkı ve Kapadokya.',
        '  - Göbeklitepe (Şanlıurfa - 2018): Tarihin sıfır noktası, dünyanın en eski tapınak kompleksi.',
        '  - Arslantepe Höyüğü (Malatya - 2021): Dünyanın ilk kerpiç saray kompleksi ve ilk bürokrasi izleri.',
        '  - Çatalhöyük (Konya): İlk neolitik kent yerleşimi.',
        '  - Nemrut Dağı (Adıyaman): Kommagene Krallığı dev heykelleri.',
        '  - Afrodisias (Aydın - 2017), Ani Arkeolojik Alanı (Kars - 2016).',
        '  - KARMA MİRASLARIMIZ (Hem Doğal Hem Kültürel - Sadece 2 Tanedir!): 1. Pamukkale-Hierapolis (Denizli), 2. Göreme Milli Parkı ve Kapadokya (Nevşehir).'
      ],
      goldenRule: 'HEM DOĞAL HEM KÜLTÜREL (Karma) 2 ALANIMIZ: Pamukkale ve Kapadokya. En son eklenenler (2023): Gordion (Ankara) ve Ahşap Direkli Ortaçağ Camileri.',
      osymTrap: 'ÖSYM\'nin en sevdiği tuzak: Divriği Ulu Camii nerede? Sivas\'ta! İshak Paşa Sarayı nerede? Ağrı Doğubayazıt\'ta (UNESCO daimi listesinde değil, geçici listededir!).'
    ),
    LectureSection(
      title: 'Türkiye\'nin Milli Teknoloji ve Uzay Hamlesi Vizyonu',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'nin son yıllarda hayata geçirdiği savunma sanayii ve bilimsel mega projeler KPSS Genel Kültür alanında düzenli olarak sorulmaktadır.',
      bulletPoints: [
        'MİLLİ UZAY PROGRAMI VE İLK ASTRONOTLARIMIZ:',
        '  - Alper Gezeravcı: Türkiye\'nin İLK ASTRONOTUDUR. Axiom-3 (Ax-3) misyonu kapsamında Uluslararası Uzay İstasyonu\'na (ISS) giderek 13 farklı bilimsel deney gerçekleştirmiştir (Ocak 2024).',
        '  - Tuva Cihangir Atasever: Türkiye\'nin ikinci astronotu olup yörünge altı araştırma uçuşunu başarıyla tamamlamıştır (Haziran 2024).',
        'SAVUNMA SANAYİİ VE HAVACILIKTAKİ GURUR PROJELERİMİZ:',
        '  - KAAN: Türkiye\'nin 5. nesil Milli Muharip Uçağı (MMU). İlk uçuşunu 21 Şubat 2024 tarihinde başarıyla gerçekleştirmiştir.',
        '  - KIZILELMA: Türkiye\'nin ilk insansız savaş uçağı (MİUS - Baykar).',
        '  - TCG ANADOLU: Dünyanın ilk SİHA gemisi ve Türk Deniz Kuvvetleri\'nin en büyük amiral gemisi (2023\'te envantere girdi).',
        '  - HÜRJET: Türkiye\'nin ilk yerli jet eğitim ve hafif taarruz uçağı.',
        '  - GÖKBEY: İlk yerli genel maksat helikopteri.',
        '  - İMECE: Türkiye\'nin yerli ve milli yüksek çözünürlüklü ilk yer gözlem uydusu (2023\'te uzaya fırlatıldı).',
        '  - TÜRKSAT 6A: Türkiye\'nin ilk yerli ve milli haberleşme uydusu (2024 Temmuz ayında uzaya fırlatıldı).'
      ],
      goldenRule: 'İLK TÜRK ASTRONOTU = Alper Gezeravcı (Ax-3 Misyonu). 5. NESİL MİLLİ UÇAK = KAAN. İLK SİHA GEMİSİ = TCG Anadolu. İLK YERLİ HABERLEŞME UYDUSU = Türksat 6A.',
      osymTrap: 'ÖSYM Soru Kalıbı: Türkiye\'nin ilk yerli haberleşme uydusu hangisidir? TÜRKSAT 6A! İlk yerli yüksek çözünürlüklü gözlem uydusu ise İMECE\'dir.'
    ),
    LectureSection(
      title: 'Kültür, Sanat ve Uluslararası Ödüller',
      type: LectureSectionType.ruleList,
      leadText: 'Türk edebiyatı, bilimi ve sanatına yön veren Nobel ve uluslararası ödüllü şahsiyetler.',
      bulletPoints: [
        'NOBEL ÖDÜLLERİ VE TÜRKİYE:',
        '  - Orhan Pamuk: 2006 Nobel Edebiyat Ödülü\'nü kazanan ilk Türk vatandaşıdır (Kar, Beyaz Kale, Masumiyet Müzesi).',
        '  - Prof. Dr. Aziz Sancar: 2015 Nobel Kimya Ödülü\'nü DNA onarımı mekanizmaları alanındaki çalışmasıyla kazanan bilim insanımızdır.',
        '  - Prof. Dr. Daron Acemoğlu: Kurumların oluşumu ve refaha etkileri konusundaki çalışmalarıyla 2024 NOBEL EKONOMİ ÖDÜLÜ\'NÜ kazanmıştır.',
        'KÜLTÜRÜMÜZÜN ANIT ŞAHSİYETLERİ:',
        '  - Aliya İzzetbegoviç: Bağımsız Bosna Hersek\'in ilk Cumhurbaşkanı, \'Bilge Kral\'.',
        '  - Sezai Karakoç: \'Diriliş Şairi\', Monna Rosa şiirinin şairi, 2021 vefat etti.',
        '  - Nuri Pakdil: \'Kudüs Şairi\', Edebiyat Dergisi kurucusu.',
        '  - Cahit Zarifoğlu: Yedi Güzel Adam\'dan biri.',
        '  - Aşık Veysel Şatıroğlu: UNESCO tarafından 2023 yılı Aşık Veysel\'i Anma Yılı ilan edilmiştir.',
        '  - Fuat Sezgin: İslam Bilim Tarihi araştırmacısı, Gülhane Parkı İslam Bilim ve Teknoloji Tarihi Müzesi kurucusu.'
      ],
      goldenRule: 'NOBEL ÖDÜLLÜLERİMİZ: Orhan Pamuk (2006 Edebiyat), Aziz Sancar (2015 Kimya), Daron Acemoğlu (2024 Ekonomi).',
      osymTrap: 'ÖSYM Güncel Bilgi Sorusu: 2024 Nobel Ekonomi Ödülü\'nü kazanan Türk bilim insanı kimdir? Prof. Dr. Daron Acemoğlu!'
    ),
    LectureSection(
      title: 'Güncel Bilgiler - ÖSYM Çıkmış ve Özgün Test',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '2023 yılında UNESCO Dünya Mirası Listesi\'ne Türkiye\'nin 20. kültürel varlığı olarak tescil edilen antik Frigya Krallığı\'nın tarihi başkenti aşağıdakilerden hangisidir?',
          options: [
            'A) Çatalhöyük',
            'B) Gordion',
            'C) Hattuşa',
            'D) Arslantepe',
            'E) Afrodisias'
          ],
          correctIndex: 1,
          explanation: 'Ankara\'nın Polatlı ilçesinde yer alan Antik Frigya Krallığı\'nın başkenti GORDİON, 2023 yılında Suudi Arabistan\'da toplanan 45. UNESCO Dünya Miras Komitesi toplantısında Türkiye\'nin 20. mirası olarak listeye dahil edilmiştir.',
          ruleTag: 'UNESCO Dünya Mirası'
        ),
        LectureInteractiveQuiz(
          prompt: 'Ocak 2024\'te Axiom-3 (Ax-3) misyonu kapsamında Uluslararası Uzay İstasyonu\'na (ISS) giderek uzayda 13 farklı bilimsel deney gerçekleştiren Türkiye\'nin ilk astronotu aşağıdakilerden hangisidir?',
          options: [
            'A) Tuva Cihangir Atasever',
            'B) Alper Gezeravcı',
            'C) Halil Kayıkçı',
            'D) Vecihi Hürkuş',
            'E) Nuri Demirağ'
          ],
          correctIndex: 1,
          explanation: 'Türkiye\'nin ilk astronotu Alper Gezeravcı, Ax-3 misyonu ile 18 Ocak 2024\'te uzay yolculuğuna başlamış ve Uluslararası Uzay İstasyonu\'nda Türk bilim insanlarının hazırladığı 13 deneyi başarıyla tamamlayarak tarihe geçmiştir.',
          ruleTag: 'Milli Uzay Programı'
        )
      ]
    )
  ],
);
