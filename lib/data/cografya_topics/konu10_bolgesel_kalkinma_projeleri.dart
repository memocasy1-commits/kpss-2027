// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu10BolgeselProjeler = LectureTopic(
  id: 'cografya_bolgesel_projeler',
  courseId: 'cografya',
  order: 10,
  title: 'Bölgesel Kalkınma Projeleri ve Coğrafi Bölgeler',
  subtitle: 'GAP, DOKAP, KOP (Mavi Tünel), DAP, ZBK ve Yeşilırmak Havzası Kalkınma Planları',
  icon: Icons.hub_rounded,
  color: const Color(0xFF0D9488),
  testRange: 'Test 91 - 95',
  startTestNum: 91,
  endTestNum: 95,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Bölgesel Kalkınma Projelerinin Amaçları ve Coğrafi Bölgeler',
      type: LectureSectionType.overview,
      leadText: 'Bölgesel kalkınma projeleri; bölgeler arasındaki ekonomik ve sosyal gelişmişlik farklarını azaltmak, sermaye ve altyapıyı yaygınlaştırmak, kırsaldan büyük kentlere göçü yerinde durdurmak ve bölgenin doğal/beşeri potansiyelini harekete geçirmek amacıyla hazırlanmıştır.',
      bulletPoints: [
        '1941 Birinci Coğrafya Kongresi: Türkiye\'nin doğal, beşeri ve ekonomik özellikleri dikkate alınarak 7 coğrafi bölge ve 21 coğrafi bölüme ayrılması kararlaştırılmıştır.',
        'Bölge Sınırlarının Kriterleri: Doğal etkenler (yer şekilleri, iklim, bitki örtüsü), beşeri etkenler (nüfus, yerleşme) ve ekonomik etkenler (tarım, hayvancılık, sanayi, madencilik, turizm).',
        'Kalkınma Projelerinin Ortak Hedefleri:',
        '• Kişi başına düşen milli geliri artırmak ve gelir dağılımını adaletli kılmak\n• İstihdam yaratarak batıya olan göçü engellemek\n• Tarımda sulama ve modern yöntemlere geçerek verimi katlamak\n• Ulaşım, lojistik ve enerji altyapısını güçlendirmek\n• Eğitim, sağlık ve kentsel yaşam standartlarını yükseltmek.'
      ],
      goldenRule: 'BÖLGESEL PLANLAR İL SINIRLARINI BÖLMEZ: İstatistiki Bölge Birimleri Sınıflandırması\'nda (İBBS) ve kalkınma projelerinde yönetim kolaylığı için iller bir bütün olarak projeye dahil edilir.',
      osymTrap: 'ÖSYM TUZAĞI: Coğrafi bölge sınırları doğal etkenlere dayandığı için kolay kolay değişmez; ancak kalkınma projesi sınırları ihtiyaç duyulduğunda yeni illerin eklenmesiyle DEĞİŞEBİLİR (Örneğin Amasya ve Çorum\'un sonradan DOKAP\'a dahil edilmesi gibi)!'
    ),
    LectureSection(
      title: 'GAP, KOP ve DOKAP Projelerinin Detaylı Analizi',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye\'nin en büyük üç bölgesel kalkınma projesinin kapsamı ve kazanımları:',
      comparisonRows: [
        ComparisonRow(
          correct: 'GAP (Güneydoğu Anadolu Projesi)',
          wrong: 'Kapsadığı İller (9 İl): Adıyaman, Batman, Diyarbakır, Gaziantep, Kilis, Mardin, Siirt, Şanlıurfa, Şırnak.\nTemel Amacı: Fırat ve Dicle nehirleri üzerinde baraj ve hidroelektrik santraller kurmak; kurak tarım arazilerini sulamaya açmaktır.\nKazanımları: Şanlıurfa Tünelleri ile Harran Ovası suya kavuşmuştur. Pamuk, mısır ve soya üretiminde patlama yaşanmış; Güneydoğu pamukta Türkiye 1.si olmuştur. Tarıma dayalı sanayi (çırçır, dokuma, yağ) gelişmiştir.',
          note: 'Türkiye\'nin ilk ve en kapsamlı bölgesel kalkınma projesidir.'
        ),
        ComparisonRow(
          correct: 'KOP (Konya Ovası Projesi)',
          wrong: 'Kapsadığı İller (8 İl): Aksaray, Karaman, Konya, Niğde, Nevşehir, Yozgat, Kırıkkale, Kırşehir.\nTemel Amacı: Aşırı yer altı suyu çekimi yüzünden kuruyan ve obruklar oluşan Konya Kapalı Havzası\'nı suya kavuşturmaktır.\nMavi Tünel Projesi: Akdeniz\'e dökülen Göksu Nehri\'nin suları Bağbaşı Barajı ve Mavi Tünel ile Konya Kapalı Havzası\'na akıtılmaktadır.\nKazanımları: Nadas alanları azalmış, mısır, ayçiçeği ve şeker pancarı verimi artmıştır.',
          note: 'Mavi Tünel ile havzalar arası su aktarımı sağlanmıştır.'
        ),
        ComparisonRow(
          correct: 'DOKAP (Doğu Karadeniz Projesi)',
          wrong: 'Kapsadığı İller (11 İl): Artvin, Bayburt, Giresun, Gümüşhane, Ordu, Rize, Samsun, Trabzon, Tokat, Amasya, Çorum.\nTemel Amacı: Ulaşım ve iletişimi güçlendirmek, yayla turizmini entegre etmek, balıkçılık ve ormancılığı geliştirmektir.\nYeşil Yol Projesi: Doğu Karadeniz yaylalarını birbirine bağlayan 2600 km\'lik turizm ve yayla koridorudur.\nKazanımları: Bölgede fındık ve çayın yanında organik tarım ve ekoturizm canlanmıştır.',
          note: 'Yeşil Yol Projesi DOKAP\'ın simgesidir.'
        ),
      ],
      goldenRule: 'BİRDEN FAZLA PROJEDE OLAN ORTAK İLLER (ÖSYM FAVORİSİ!): Samsun, Amasya, Çorum ve Tokat illeri hem DOKAP hem de Yeşilırmak Havzası (YHGP) kapsamındadır! Sivas ili ise hem DAP hem KOP projesindedir.',
      osymTrap: 'ÖSYM TUZAĞI: GAP kapsamında Fırat ve Dicle akarsuları yer alır; Seyhan ve Ceyhan nehirleri GAP kapsamında DEĞİLDİR (Seyhan ve Ceyhan Akdeniz/Çukurova havzasındadır)!'
    ),
    LectureSection(
      title: 'DAP, ZBK ve YHGP Projeleri',
      type: LectureSectionType.ruleList,
      leadText: 'Doğu Anadolu, Batı Karadeniz ve Yeşilırmak havzalarının kalkınma stratejileri:',
      bulletPoints: [
        'DAP (Doğu Anadolu Projesi):',
        '• Kapsadığı İller (15 İl): Ağrı, Ardahan, Bingöl, Bitlis, Elazığ, Erzincan, Erzurum, Hakkari, Iğdır, Kars, Malatya, Muş, Tunceli, Van, Sivas.\n• Temel Hedefi: Bölge ekonomisinin omurgası olan BÜYÜKBAŞ HAYVANCILIĞI geliştirmektir. Mera ıslahı, et ve süt kombinalarının kurulması, yem bitkisi üretiminin desteklenmesi, kış turizminin (Palandöken, Sarıkamış) canlandırılması hedeflenir.',
        'ZBK (Zonguldak - Bartın - Karabük Projesi):',
        '• Temel Hedefi: Özelleştirme ve küçülme sürecindeki taş kömürü madenciliği ve demir-çelik sanayisini modernize etmek ve yeni yatırım alanları oluşturmaktır.\n• Filyos Vadisi ve Filyos Limanı Projesi: Karadeniz\'in en büyük lojistik ve endüstri limanı inşa edilerek bölge yüksek teknolojili bir sanayi ve doğalgaz işleme üssüne dönüştürülmektedir.',
        'YHGP (Yeşilırmak Havzası Gelişim Projesi):',
        '• Kapsadığı İller (4 İl): Amasya, Çorum, Samsun, Tokat.\n• Temel Hedefi: Yeşilırmak Nehri\'nin neden olduğu taşkın, sel ve şiddetli toprak erozyonunu önlemek; akarsu kirliliğini kontrol altına alarak havzada planlı tarımsal kalkınmayı sağlamaktır.'
      ],
      goldenRule: 'DAP\'IN ANA EKSENİ HAYVANCILIKTIR: DAP\'ta tarım iklim nedeniyle sınırlı olduğu için en büyük yatırım mera ıslahı, besi hayvancılığı ve et-süt entegre tesislerine ayrılmıştır.',
      osymTrap: 'ÖSYM TUZAĞI: ZBK projesinde tarım veya hayvancılık ana hedef DEĞİLDİR! ZBK tamamen madencilik, demir-çelik sanayisi ve Filyos Limanı odaklı bir SANAYİ projesidir.'
    ),
    LectureSection(
      title: 'Türkiye Coğrafi Bölgeleri ve Havza Projeleri Atlası',
      type: LectureSectionType.overview,
      leadText: 'Bölgesel kalkınma projelerinin kapsadığı havzalar, Mavi Tünel ve Filyos Limanı harita üzerinde detaylandırılmıştır.',
            mapData: LectureMapData(
        title: 'BÖLGESEL KALKINMA PROJELERİ VE COĞRAFİ BÖLGELER ATLASI',
        subtitle: 'GAP, DAP, DOKAP, KOP, ZBK Projeleri, Kapsanan İller, Yatırımlar ve Sınav Odakları',
        mapId: 'cografya_cografi_bolgeler_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_cografi_bolgeler.jpg',
        mapSource: 'cografyaharita.com - Türkiye Coğrafi Bölgeleri Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '💧', label: 'GAP (Güneydoğu Anadolu Projesi)', description: '9 İl: Şanlıurfa, Gaziantep, Diyarbakır, Batman, Adıyaman, Mardin, Siirt, Şırnak, Kilis. Fırat ve Dicle nehirleri üzerinde 22 baraj, sulama, pamuk ve hidroelektrik santralleri.'),
          MapLegendItem(symbol: '🌽', label: 'KOP (Konya Ovası Projesi)', description: '8 İl: Konya, Karaman, Aksaray, Niğde, Nevşehir, Kırşehir, Kırıkkale, Yozgat. Göksu Nehri sularının Mavi Tünel ile ovaya aktarılması ve yeraltı sularının korunması.'),
          MapLegendItem(symbol: '🐄', label: 'DAP (Doğu Anadolu Projesi)', description: '15 İl: Erzurum, Kars, Ardahan, Ağrı, Iğdır, Van, Muş, Bitlis, Hakkari, Malatya, Elazığ, Bingöl, Tunceli, Erzincan, Sivas. Mera hayvancılığı, et-süt entegre tesisleri ve kış turizmi.'),
          MapLegendItem(symbol: '🌿', label: 'DOKAP (Doğu Karadeniz Projesi)', description: '8 İl (başlangıç) + Amasya, Çorum, Tokat ilavesiyle 11 il: Artvin, Rize, Trabzon, Giresun, Ordu, Gümüşhane, Bayburt, Samsun, Tokat, Amasya, Çorum. Yeşil Yol turizmi ve yaylacılık.'),
          MapLegendItem(symbol: '⛏️', label: 'ZBK (Zonguldak - Bartın - Karabük)', description: 'Kömür ve çelik sanayisinin modernize edilmesi, Filyos Limanı ve Serbest Bölge projesinin hayata geçirilmesi.')
        ],
        points: [
          MapFrontItem(
            name: 'Atatürk Barajı & Şanlıurfa Sulama Tünelleri (GAP)',
            category: 'GAP\'ın Kalbi',
            commander: 'Güneydoğu Anadolu / Şanlıurfa - Adıyaman',
            keyEvent: 'Türkiye\'nin ve Avrupa\'nın en büyük dolgu hacimli barajıdır. Dünyanın en uzun sulama tüneli olan Şanlıurfa Tünelleri ile Harran Ovası suya kavuşturulmuştur.',
            outcome: 'ÖSYM Çıkmış Soru: GAP ile birlikte Güneydoğu\'da pamuk ve mısır üretimi patlama yapmış, nadas alanları asgariye inmiştir.'
          ),
          MapFrontItem(
            name: 'Mavi Tünel ve Bağbaşı Barajı (KOP)',
            category: 'Konya Ovası Su Projesi',
            commander: 'İç Anadolu - Akdeniz Sınırı / Konya - Karaman',
            keyEvent: 'Akdeniz\'e dökülen Göksu Nehri suları Toros dağlarının altından 17 km\'lik Mavi Tünel ile Konya Kapalı Havzası\'na akıtılarak kuraklık ve obruk oluşumu engellenmeye çalışılmıştır.',
            outcome: 'ÖSYM Sorusu: KOP projesinin ana omurgasını Göksu Nehri sularını Konya Ovası\'na taşıyan Mavi Tünel oluşturur.'
          ),
          MapFrontItem(
            name: 'Filyos Vadisi ve Liman Projesi (ZBK)',
            category: 'Batı Karadeniz Mega Ticaret Üssü',
            commander: 'Batı Karadeniz / Zonguldak (Çaycuma)',
            keyEvent: 'ZBK kalkınma projesinin en stratejik ayağıdır. Karadeniz doğalgazının karaya çıkarıldığı, Türkiye\'nin 3. büyük limanı ve endüstri bölgesidir.',
            outcome: 'ÖSYM Güncel Bilgi: ZBK projesinin deniz ticaret ve sanayi çıkış kapısı Filyos Limanı\'dır.'
          ),
          MapFrontItem(
            name: 'Yeşil Yol Projesi (DOKAP)',
            category: 'Yayla Turizm Koridoru',
            commander: 'Doğu Karadeniz Yaylaları (Samsun - Artvin)',
            keyEvent: 'Karadeniz yaylalarını (Ayder, Pokut, Uzungöl, Anzer) birbirine bağlayarak doğa ve kış turizmini 12 aya yaymayı hedefleyen entegre yayla koridorudur.',
            outcome: 'ÖSYM Soru Tuzağı: DOKAP\'ın amacı sadece tarım değil, yayla turizmi (Yeşil Yol) ve ulaşım entegrasyonudur.'
          ),
          MapFrontItem(
            name: 'Amasya, Çorum, Tokat ve Samsun (Çift Projeli İller)',
            category: 'Hem DOKAP Hem YHGP Kapsamında',
            commander: 'Orta Karadeniz Havzası',
            keyEvent: 'Yeşilırmak Havzası Gelişim Projesi (YHGP) illeri olan Amasya, Çorum, Tokat ve Samsun sonradan DOKAP kapsamına da dahil edilerek çift projeli statüye kavuşmuştur.',
            outcome: 'ÖSYM Sınav Sorusu: Hem DOKAP hem de Yeşilırmak (YHGP) projelerinin her ikisinde de yer alan illerdir.'
          )
        ],
        historicalNote: '📌 ÖSYM BÖLGESEL PROJELER KRİTİK SINAV NOTLARI:\n'
            '1. Hem DOKAP Hem YHGP İller: Amasya, Çorum, Tokat, Samsun.\n'
            '2. Hem DAP Hem KOP Kapsamındaki İl: Yozgat ve Kırıkkale sonradan KOP\'a eklenmiştir; Sivas hem DAP kapsamındadır.\n'
            '3. GAP\'ın En Temel Çıktısı: Nadas alanlarının azalması, sanayi bitkileri (pamuk, soya, mısır) ekiminin artması, göçün yavaşlaması.\n'
            '4. Kömüre ve Ağır Sanayiye Dayalı Tek Proje: ZBK (Zonguldak-Bartın-Karabük).'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Bölgesel Projeler',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki illerden hangisi hem DOKAP (Doğu Karadeniz Projesi) hem de YHGP (Yeşilırmak Havzası Gelişim Projesi) kapsamındadır?',
          options: [
            'A) Rize',
            'B) Trabzon',
            'C) Amasya',
            'D) Artvin',
            'E) Gümüşhane'
          ],
          correctIndex: 2,
          explanation: 'Samsun, Amasya, Çorum ve Tokat illeri hem DOKAP hem de Yeşilırmak Havzası Gelişim Projesi (YHGP) kapsamındadır.',
          ruleTag: 'Ortak Kapsamdaki İller'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu10 = konu10BolgeselProjeler;
