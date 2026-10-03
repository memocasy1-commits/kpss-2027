import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu8IdareHukuku = LectureTopic(
  id: 'vat_konu8',
  courseId: 'vatandaslik',
  order: 8,
  title: 'İdare Hukuku ve İdari Teşkilat',
  subtitle: 'Merkezden Yönetim, Yerinden Yönetim, Hiyerarşi ve İdari Vesayet',
  icon: Icons.domain_rounded,
  color: Color(0xFF0F172A),
  testRange: 'Test 51 - 60',
  startTestNum: 51,
  endTestNum: 60,
  estimatedMinutes: 70,
  sections: [
    LectureSection(
      title: 'İdare Hukukunun Temel İlkeleri ve Özellikleri',
      type: LectureSectionType.overview,
      leadText: 'İdare hukuku kamu yararını gerçekleştirmek amacıyla kamu gücü kullanan idarenin teşkilatını, eylemlerini ve işlemlerini düzenleyen genç bir hukuk dalıdır.',
      bulletPoints: [
        'İDARE HUKUKUNUN TEMEL ÖZELLİKLERİ:',
        '  - Genç bir hukuk dalıdır (Fransız İhtilali sonrası gelişmiştir),',
        '  - Tedvin edilmemiştir (Medeni Kanun veya Ceza Kanunu gibi tek bir genel idare kanunu yoktur; dağınıktır),',
        '  - İçtihadi bir hukuk dalıdır (Fransa\'da Conseil d\'Etat, Türkiye\'de Danıştay kararlarıyla şekillenmiştir),',
        '  - İdare üstün kamu gücü ve ayrıcalıklarıyla donatılmıştır (Taraflar eşit değildir; kamu yararı üstündür),',
        '  - İdari uyuşmazlıklar İDARİ YARGI\'da (İdare Mahkemesi, Vergi Mahkemesi, Danıştay) çözümlenir.',
        'İDARENİN KANUNİLİĞİ İLKESİ (Madde 123): İdare, kuruluş ve görevleriyle bir bütündür ve kanunla düzenlenir. Kamu tüzel kişiliği, ancak KANUNLA veya CUMHURBAŞKANLIĞI KARARNAMESİYLE kurulur (2017 değişikliği).',
        'İDARENİN BÜTÜNLÜĞÜ VE ARAÇLARI: Üniter devlette idarenin bölünmez bütünlüğünü sağlamak için iki temel hukuki bağ kullanılır: 1. HİYERARŞİ, 2. İDARİ VESAYET.'
      ],
      goldenRule: 'İdare Hukuku tek bir kanunda toplanmamıştır (Tedvin edilmemiştir). Kamu tüzel kişiliği KANUNLA ya da CUMHURBAŞKANLIĞI KARARNAMESİYLE kurulur.',
      osymTrap: 'ÖSYM Soru Kalıbı: \'Kamu tüzel kişiliği yönetmelikle kurulabilir\' der. KESİNLİKLE YANLIŞ! Kamu tüzel kişiliği sadece KANUN veya CUMHURBAŞKANLIĞI KARARNAMESİ ile kurulabilir.'
    ),
    LectureSection(
      title: 'Hiyerarşi ve İdari Vesayet Ayrımı (ÖSYM Banko Soru Alanı)',
      type: LectureSectionType.comparison,
      leadText: 'Her KPSS\'de mutlaka sorulan bu iki denetim aracının ayrımını kavramak sınav başarısı için hayatidir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Hiyerarşi Denetimi: AYNI KAMU TÜZEL KİŞİLİĞİ İÇERİSİNDEKİ ast-üst ilişkisidir. Genel yetkidir (kanunda açıkça yazmasa bile üst astı denetleyebilir). Hem HUKUKİLİK hem de YERİNDELİK (uygunluk) denetimi yapılabilir. Üst astın işlemini iptal edebilir, değiştirebilir, durdurabilir ve astın yerine geçip karar alabilir.',
          wrong: 'İdari vesayetle karıştırılması: Hiyerarşide tek bir tüzel kişilik vardır (Örn: İçişleri Bakanı -> Vali, Vali -> Kaymakam, Rektör -> Dekan, Belediye Başkanı -> Zabıta Müdürü).',
          note: 'Hiyerarşik emir kanuna açıkça aykırı ise ast yapmaz (Kanunsuz emir). Ancak üst yazıyla emri yenilerse yapar; sorumluluk üste geçer. Suç teşkil eden emir hiçbir surette yerine getirilemez!'
        ),
        ComparisonRow(
          correct: 'İdari Vesayet Denetimi: MERKEZİ İDARENİN (Devlet Tüzel Kişiliği) YERİNDEN YÖNETİM KURULUŞLARI (Belediye, İl Özel İdaresi, Köy, Üniversite, Baro vb.) üzerindeki veya bir kamu tüzel kişisinin BAŞKA BİR KAMU TÜZEL KİŞİSİ üzerindeki sınırlı denetimidir. İstisnai bir yetkidir (Kanunda açıkça yazmadıkça vesayet kullanılamaz). Yalnızca HUKUKİLİK denetimi yapılabilir (Yerindelik denetimi yapılamaz!). Üst astın yerine geçip karar ALAMAZ; onaylar, reddeder veya mahkemeye taşır.',
          wrong: 'Merkezin belediye yerine karar alabileceği sanılması: Vesayet makamı işlemi değiştiremez ve yerel yönetimin yerine geçemez.',
          note: 'Örnekler: İçişleri Bakanı\'nın Belediye Başkanı üzerindeki denetimi, Valinin Köy Muhtarı üzerindeki denetimi, YÖK\'ün Üniversite üzerindeki denetimi.'
        )
      ],
      goldenRule: 'ALTIN FORMÜL: Aynı ev içindeyse (Tek Tüzel Kişilik) = HİYERARŞİ; İki farklı ev arasındaysa (İki Ayrı Tüzel Kişilik) = İDARİ VESAYET.',
      osymTrap: 'ÖSYM ÖRNEKLERİ: İçişleri Bakanı -> Vali: HİYERARŞİ. İçişleri Bakanı -> Belediye Başkanı: İDARİ VESAYET. Vali -> Kaymakam: HİYERARŞİ. Vali -> Köy Muhtarı: İDARİ VESAYET. Kaymakam -> İlçe Milli Eğitim Müdürü: HİYERARŞİ.'
    ),
    LectureSection(
      title: 'Türkiye\'nin İdari Teşkilat Şeması',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye Cumhuriyeti idari teşkilatı iki ana kola ayrılır: 1. MERKEZDEN YÖNETİM, 2. YERİNDEN YÖNETİM.',
      bulletPoints: [
        '1. MERKEZDEN YÖNETİM (Devlet Tüzel Kişiliği):',
        '   A) BAŞKENT TEŞKİLATI: Cumhurbaşkanı, Cumhurbaşkanı Yardımcıları, Bakanlıklar. Başkente Yardımcı Kuruluşlar: Danıştay, Sayıştay, Milli Güvenlik Kurulu (MGK).',
        '   B) TAŞRA TEŞKİLATI (Merkezin illerdeki uzantısıdır; ayrı bütçesi ve kamu tüzel kişiliği YOKTUR):',
        '      - İl Genel İdaresi: VALİ (İlin başı, devletin ve CB\'nin temsilcisi, yetki genişliğine sahip tek makam), İl İdare Şube Başkanları (İl müdürleri), İl İdare Kurulu.',
        '      - İlçe İdaresi: KAYMAKAM (İlçenin başı, CB\'nin temsilcisi), İlçe İdare Şube Başkanları, İlçe İdare Kurulu. (DİKKAT: Kaymakamın yetki genişliği YOKTUR!).',
        '      (Bucak idaresi tamamen kaldırılmıştır!).',
        '2. YERİNDEN YÖNETİM (Ayrı Kamu Tüzel Kişilikleri ve Bütçeleri Vardır):',
        '   A) MAHALLİ İDARELER (Yerel Yönetimler):',
        '      - İL ÖZEL İDARESİ: Organları -> VALİ (Başkanı ve yürütme organı), İL GENEL MECLİSİ (Karar organı, halk seçer), İL ENCÜMENİ (Danışma/yürütme).',
        '      - BELEDİYE İDARESİ: Nüfusu 5.000 ve üzeri yerlerde CUMHURBAŞKANI KARARIYLA kurulur. Organları -> BELEDİYE BAŞKANI (Halk seçer), BELEDİYE MECLİSİ (Karar organı, halk seçer), BELEDİYE ENCÜMENİ.',
        '      - BÜYÜKŞEHİR BELEDİYESİ: Toplam nüfusu 750.000\'i aşan illerde KANUNLA kurulur. Büyükşehir sınırları il mülki sınırıdır. İl özel idareleri ve köyler kalkar; mahalleye dönüşür.',
        '      - KÖY İDARESİ: Nüfusu 150 - 2.000 arası yerlerdir. İçişleri Bakanlığı kararıyla kurulur. Organları -> MUHTAR (Halk seçer), KÖY DERNEĞİ (Köydeki tüm seçmenler - Doğrudan demokrasi örneğidir!), İHTİYAR MECLİSİ (Seçilmişler + Doğal üyeler: İmam ve Öğretmen). Köyde İMECE (işbirliği) ve SALMA (vergi) zorunludur.',
        '   B) HİZMET YERİNDEN YÖNETİM (Kamu Kurumları): Üniversiteler, TRT, TÜBİTAK, SGK, Karayolları, Barolar, Odalar vb.'
      ],
      goldenRule: 'YETKİ GENİŞLİĞİ: Merkeze danışmadan merkezin adına karar alabilme yetkisidir; TÜRKİYE\'DE SADECE VE SADECE İL VALİSİNE AİTTİR! Kaymakamda yetki genişliği YOKTUR.',
      osymTrap: 'ÖSYM Çeldiricisi: Büyükşehir belediyesi neyle kurulur? KANUNLA kurulur! Normal belediye neyle kurulur? CUMHURBAŞKANI KARARIYLA kurulur! Köy neyle kurulur? İÇİŞLERİ BAKANLIĞI kararıyla kurulur!',
      imageAssetPath: 'assets/images/vatandaslik/vatandaslik_idare_teskilati.png',
      imageCaption: 'Türkiye İdari Teşkilatı (Merkezden Yönetim ve Yerinden Yönetim Şeması)',
    ),
    LectureSection(
      title: 'İdari İşlemler, İdari Sözleşmeler ve Kamu Görevlileri (Memurluk)',
      type: LectureSectionType.ruleList,
      leadText: '657 sayılı Devlet Memurları Kanunu\'na göre devlet memurluğu mesleğinin temel ilkeleri ve disiplin cezaları KPSS\'de düzenli olarak test edilir.',
      bulletPoints: [
        'DEVLET MEMURLUĞUNUN 3 TEMEL İLKESİ: 1. Sınıflandırma, 2. Kariyer (Meslekte en üst kademelere kadar ilerleme imkanı), 3. Liyakat (Giriş ve yükselmenin bilgi, yetenek ve sınav başarısına dayandırılması).',
        'MEMURLARIN DİSİPLİN CEZALARI (657 Sayılı Kanun Madde 125):',
        '  1. Uyarma (En hafif ceza),',
        '  2. Kınama,',
        '  3. Aylıktan Kesme (Brüt aylıktan 1/30 - 1/8 arası kesinti),',
        '  4. Kademe İlerlemesinin Durdurulması (1 - 3 yıl arası durdurulur),',
        '  5. Devlet Memurluğundan Çıkarma (Yüksek Disiplin Kurulu kararıyla verilir).',
        'DİKKAT: Görevden uzaklaştırma bir disiplin cezası DEĞİLDİR; geçici bir ihtiyati tedbirdir!',
        'DİSİPLİN CEZALARINA KARŞI YARGI YOLU: 2010 anayasa değişikliği ile uyarma ve kınama dahil TÜM DİSİPLİN CEZALARINA KARŞI YARGI YOLU AÇIKTIR (İdare Mahkemesine dava açılır).'
      ],
      goldenRule: 'MEMUR DİSİPLİN CEZALARI: Uyarma, Kınama, Aylıktan Kesme, Kademe İlerlemesinin Durdurulması, İhraç. Görevden uzaklaştırma, yer değiştirme, tenzil-i rütbe ceza DEĞİLDİR.',
      osymTrap: 'ÖSYM Sorusu: \'Uyarma ve kınama cezalarına karşı yargı yolu kapalıdır\' der. YANLIŞ! 2010 öncesi kapalıydı; 2010 değişikliği ile artık TÜM disiplin cezalarına karşı idari yargı yolu açıktır.'
    ),
    LectureSection(
      title: 'İdare Hukuku - ÖSYM Çıkmış ve Özgün Test',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre taşra teşkilatında merkeze danışmadan devlet adına karar alabilme anlamına gelen \'Yetki Genişliği\' ilkesi münhasıran hangi makama tanınmıştır?',
          options: [
            'A) Kaymakam',
            'B) Vali',
            'C) İl Emniyet Müdürü',
            'D) İl İdare Şube Başkanı',
            'E) Bölge İdare Mahkemesi Başkanı'
          ],
          correctIndex: 1,
          explanation: 'Anayasa Madde 126 uyarınca illerin idaresi yetki genişliği esasına dayanır. Türkiye idari teşkilatında yetki genişliği ilkesi sadece ve sadece İL VALİSİNE aittir; ilçe kaymakamının yetki genişliği yoktur.',
          ruleTag: 'Yetki Genişliği İlkesi'
        ),
        LectureInteractiveQuiz(
          prompt: 'İçişleri Bakanlığı\'nın Kadıköy Belediyesi\'nin bütçesi ve imar kararları üzerindeki denetim yetkisinin hukuki niteliği aşağıdakilerden hangisidir?',
          options: [
            'A) Hiyerarşi denetimi',
            'B) İdari vesayet denetimi',
            'C) Yasama denetimi',
            'D) Yargısal denetim',
            'E) Disiplin denetimi'
          ],
          correctIndex: 1,
          explanation: 'İçişleri Bakanlığı Devlet Tüzel Kişiliği (merkezden yönetim) içerisinde yer alırken; Kadıköy Belediyesi ayrı bir kamu tüzel kişiliğine sahip yerinden yönetim kuruluşudur. İki farklı kamu tüzel kişisi arasındaki bu denetim İDARİ VESAYETTİR.',
          ruleTag: 'Hiyerarşi vs İdari Vesayet'
        )
      ]
    )
  ],
);
