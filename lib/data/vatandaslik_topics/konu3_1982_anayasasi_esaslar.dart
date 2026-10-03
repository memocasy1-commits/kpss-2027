import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu3AnayasaEsaslari = LectureTopic(
  id: 'vat_konu3',
  courseId: 'vatandaslik',
  order: 3,
  title: '1982 Anayasası Temel İlkeleri',
  subtitle: 'Anayasanın Nitelikleri, İlk 4 Madde ve Devletin Temel Organları',
  icon: Icons.assured_workload_rounded,
  color: Color(0xFF5B21B6),
  testRange: 'Test 15 - 20',
  startTestNum: 15,
  endTestNum: 20,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: '1982 Anayasası\'nın Genel Nitelikleri ve Doğuş Şartları',
      type: LectureSectionType.overview,
      leadText: '12 Eylül 1980 askeri darbesi sonrası Milli Güvenlik Konseyi ve Danışma Meclisi\'nden oluşan Kurucu Meclis tarafından hazırlanmış, 7 Kasım 1982\'de referandumla kabul edilmiştir.',
      bulletPoints: [
        'KAZUİSTİK (Aşırı Ayrıntıcı) YAPI: Hükümleri son derece detaylı, uzun ve kanun maddesi gibi kaleme alınmıştır (177 asıl madde). Olası krizleri önlemek için her ihtimale anayasada yer verilmek istenmiştir.',
        'SERT / KATI ANAYASA: Değiştirilmesi kanunlara göre daha zorlaştırılmış usullere bağlanmış ve değiştirilemeyecek değiştirilmesi teklif dahi edilemeyecek maddeler (İlk 3 Madde) içermiştir.',
        'DEVLET OTORİTESİNİ GÜÇLENDİREN YAPI: 1961 Anayasası\'nın getirdiği hürriyetçi ortamın devleti zayıflattığı iddiasıyla, yürütme organı (özellikle Cumhurbaşkanlığı makamı) olağanüstü güçlendirilmiştir.',
        'RASYONELLEŞTİRİLMİŞ PARLAMENTERİZM: Hükümet krizlerini önlemek, meclisin kilitlenmesini engellemek için meclis başkanlığı seçimleri, erken seçim mekanizmaları ve güvenoyu kuralları rasyonelleştirilmiştir (2017 sonrasında ise doğrudan Cumhurbaşkanlığı Hükümet Sistemine geçilmiştir).',
        'GEÇİŞ DÖNEMİ ÖNGÖRMÜŞTÜR: Geçici maddelerle MGK Başkanı Kenan Evren anayasanın kabulüyle doğrudan Cumhurbaşkanı sıfatı kazanmıştır.'
      ],
      goldenRule: '1982 ANAYASASI ETİKETLERİ: Kazuistik (En ayrıntılı), Katı (İlk 3 madde kilitli), Yürütmeyi güçlendiren, Geçiş dönemi öngören anayasadır.',
      osymTrap: 'ÖSYM Çeldiricisi: \'1982 Anayasası tek dereceli halkoyuyla kabul edilen tek anayasadır\' der. YANLIŞ! 1961 Anayasası da referandumla (halkoyuyla) kabul edilmiştir.',
      imageAssetPath: 'assets/images/vatandaslik/vatandaslik_kuvvetler_ayriligi.png',
      imageCaption: '1982 Anayasası Devletin Temel Organları (Yasama, Yürütme ve Yargı Kuvvetleri)',
    ),
    LectureSection(
      title: 'Değiştirilemez Hükümler: İlk 4 Madde Analizi',
      type: LectureSectionType.ruleList,
      leadText: '1982 Anayasası\'nın 4. maddesi uyarınca; ilk 3 maddede yer alan hükümler değiştirilemez ve değiştirilmesi teklif dahi edilemez.',
      bulletPoints: [
        'MADDE 1 - DEVLETİN ŞEKLİ: Türkiye Devleti bir Cumhuriyettir.',
        'MADDE 2 - CUMHURİYETİN NİTELİKLERİ: Türkiye Cumhuriyeti, toplumun huzuru, millî dayanışma ve adalet anlayışı içinde, insan haklarına saygılı, Atatürk milliyetçiliğine bağlı, başlangıçta belirtilen temel ilkelere dayanan, demokratik, lâik ve sosyal bir hukuk Devletidir.',
        'MADDE 3 - DEVLETİN BÜTÜNLÜĞÜ, RESMİ DİLİ, BAYRAĞI, MİLLİ MARŞI VE BAŞKENTİ:',
        '  - Türkiye Devleti, ülkesi ve milletiyle bölünmez bir bütündür (Üniter Devlet İlkesi).',
        '  - Dili Türkçe\'dir (DİKKAT: Resmi dili Türkçe\'dir ifadesi geçer).',
        '  - Bayrağı, şekli kanununda belirtilen, beyaz ay yıldızlı al bayraktır.',
        '  - Millî marşı \'İstiklal Marşı\'dır.',
        '  - Başkenti Ankara\'dır.',
        'MADDE 4 - DEĞİŞTİRİLEMEZLİK GÜVENCESİ: Anayasanın 1 inci maddesindeki Devletin şeklinin Cumhuriyet olduğu hakkındaki hüküm ile, 2 nci maddesindeki Cumhuriyetin nitelikleri ve 3 üncü maddesi hükümleri değiştirilemez ve değiştirilmesi teklif edilemez.'
      ],
      goldenRule: 'İLK 3 MADDE KİLİTLİDİR. 4. madde bu kilidin anahtarıdır. 4. maddenin kendisi ilk 3 maddede sayılmadığı için teorik tartışmalar olsa da yerleşik içtihatlara göre 4. madde de dolaylı olarak koruma altındadır.',
      osymTrap: 'ÖSYM KELİME OYUNU: 1961 Anayasası \'İnsan haklarına DAYANAN\' ifadesini kullanırken; 1982 Anayasası devleti önceleyerek \'İnsan haklarına SAYGILI\' ifadesini kullanmıştır! Sınavda \'dayanan\' derse 1961, \'saygılı\' derse 1982\'dir!'
    ),
    LectureSection(
      title: 'Madde 2: Cumhuriyetin Temel Niteliklerinin Derin İncelenmesi',
      type: LectureSectionType.comparison,
      leadText: 'Madde 2\'de yer alan kavramlar KPSS\'de hem öncüllü hem de müstakil sorular olarak sıkça test edilir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Hukuk Devleti: Devletin tüm eylem ve işlemlerinin hukuk kurallarına bağlı olması, yargı denetimine açık bulunmasıdır. Şartları: Kuvvetler ayrılığı, Yargı bağımsızlığı ve hakim teminatı, İdarenin yargısal denetimi, Temel hakların güvenceye alınması, Kanuni hakim güvencesi, Kanunların geriye yürümemesi, Anayasanın üstünlüğü.',
          wrong: 'Kanun Devleti ile karıştırılması: Kanun devleti sadece kanunların uygulanmasıdır (Hitler Almanya\'sı da kanun devletiydi). Hukuk devleti ise adil, evrensel insan haklarına uygun hukukun üstünlüğüdür.',
          note: 'Yargı yolu kapatılamayan işlemler hukuk devletinin olmazsa olmazıdır.'
        ),
        ComparisonRow(
          correct: 'Sosyal Devlet: Devletin ekonomik ve sosyal hayata müdahale ederek herkese insan onuruna yaraşır asgari bir yaşam standardı sağlamasıdır. Araçları: Vergi adaleti (artan oranlı vergilendirme), Kamulaştırma, Sosyal güvenlik hakları, Fırsat eşitliği, Asgari ücret tespiti, Tüketicinin ve güçsüzlerin korunması.',
          wrong: 'Sosyalist devlet sanılması: Sosyal devlet özel mülkiyeti ve piyasa ekonomisini yok etmez; sadece gelir dağılımındaki adaletsizliği telafi eder.',
          note: 'Sosyal haklar ilk kez 1961 Anayasası ile anayasamıza girmiştir.'
        ),
        ComparisonRow(
          correct: 'Laik Devlet: Din ve devlet işlerinin ayrılması, din hürriyeti ve inanç hürriyetinin teminat altına alınması, devletin hiçbir dine karşı taraf veya ayrıcalıklı olmamasıdır. Din ve vicdan hürriyeti (iç alem) mutlaktır, sınırlanamaz; ibadet hürriyeti (dış alem) kamu düzeniyle sınırlanabilir.',
          wrong: 'Dinsizlik sanılması: Laiklik inançsızlık değil, devletin inançlar karşısında tarafsız kalması ve herkese vicdan hürriyeti tanımasıdır.',
          note: 'Laiklik ilkesi anayasaya ilk kez 1937\'de girmiştir.'
        )
      ],
      goldenRule: 'Hukuk devletinin en büyük güvencesi: İDARENİN TÜM EYLEM VE İŞLEMLERİNE KARŞI YARGI YOLUNUN AÇIK OLMASIDIR (Madde 125).',
      osymTrap: 'ÖSYM Tuzağı: \'Kanuni hakim güvencesi (Doğal Hakim ilkesi)\': Hiç kimse kanunen tabi olduğu mahkemeden başka bir merci önüne çıkarılamaz. Suç işlendikten sonra o suçu yargılamak üzere özel mahkeme KURULAMAZ!'
    ),
    LectureSection(
      title: '1982 Anayasası Temel İlkeleri - Pekiştirme Testi',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre aşağıdakilerden hangisi Anayasa\'nın 2. maddesinde sayılan \'Cumhuriyetin Nitelikleri\' arasında doğrudan yer ALMAZ?',
          options: [
            'A) Demokratik devlet',
            'B) Sosyal devlet',
            'C) Eşitlikçi devlet',
            'D) Lâik devlet',
            'E) İnsan haklarına saygılı devlet'
          ],
          correctIndex: 2,
          explanation: '1982 Anayasası Madde 2\'ye göre Cumhuriyetin nitelikleri: İnsan haklarına saygılı, Atatürk milliyetçiliğine bağlı, başlangıç ilkelerine dayanan, demokratik, lâik ve sosyal bir hukuk devletidir. Metinde doğrudan \'Eşitlikçi devlet\' diye bir cumhuriyet niteliği sayılmamıştır (Eşitlik ilkesi Madde 10\'dadır).',
          ruleTag: 'Madde 2 Cumhuriyetin Nitelikleri'
        )
      ]
    )
  ],
);
