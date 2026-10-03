import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu7YargiMahkemeler = LectureTopic(
  id: 'vat_konu7',
  courseId: 'vatandaslik',
  order: 7,
  title: 'Yargı Organı ve Yüksek Mahkemeler',
  subtitle: 'Anayasa Mahkemesi, Yargıtay, Danıştay, Uyuşmazlık, HSK ve Sayıştay',
  icon: Icons.balance_rounded,
  color: Color(0xFF1E1B4B),
  testRange: 'Test 43 - 50',
  startTestNum: 43,
  endTestNum: 50,
  estimatedMinutes: 65,
  sections: [
    LectureSection(
      title: 'Yargı Kolunun Temel İlkeleri ve Mahkemelerin Bağımsızlığı',
      type: LectureSectionType.overview,
      leadText: 'Yargı yetkisi, Türk Milleti adına BAĞIMSIZ VE TARAFSIZ mahkemelerce kullanılır (Madde 9 - Tarafsızlık ilkesi 2017\'de eklenmiştir).',
      bulletPoints: [
        'HAKİMLİK VE SAVCILIK TEMİNATI (Madde 139):',
        '  - Hakimler ve savcılar azlolunamaz,',
        '  - Kendileri istemedikçe 65 YAŞINDAN ÖNCE emekliye sevk edilemez,',
        '  - Bir mahkemenin veya kadronun kaldırılması sebebiyle de olsa aylık, ödenek ve diğer özlük haklarından yoksun bırakılamaz.',
        'DURUŞMALARIN AÇIKLIĞI VE KARARLARIN GEREKÇELİ OLMASI:',
        '  - Mahkemelerde duruşmalar kural olarak herkese AÇIKTIR. Kamu ahlakı veya kamu güvenliğinin kesin olarak gerekli kıldığı hallerde duruşmanın bir kısmı veya tamamı kapalı yapılabilir.',
        '  - Bütün mahkemelerin her türlü kararları GEREKÇELİ olarak yazılmak zorundadır.',
        'TÜRK HUKUKUNDAKİ 4 YÜKSEK MAHKEME (Anayasa Madde 146-158):',
        '  1. Anayasa Mahkemesi,',
        '  2. Yargıtay,',
        '  3. Danıştay,',
        '  4. Uyuşmazlık Mahkemesi.',
        '2017 İLE KALDIRILAN MAHKEMELER:',
        '  - Askeri Yargıtay KALDIRILDI!',
        '  - Askeri Yüksek İdare Mahkemesi (AYİM) KALDIRILDI!',
        '  - Disiplin mahkemeleri hariç askeri mahkemeler tamamen kapatıldı.'
      ],
      goldenRule: 'TÜRKİYE\'DE SADECE 4 YÜKSEK MAHKEME VARDIR: AYM, Yargıtay, Danıştay, Uyuşmazlık Mahkemesi. Sayıştay, HSK ve YSK yüksek mahkeme DEĞİLDİR!',
      osymTrap: 'ÖSYM\'nin en klasik çeldiricileri: \'Aşağıdakilerden hangisi yüksek mahkemedir?\' şıklarına Sayıştay, HSK veya YSK koyar. Bunlar anayasal kurumlardır ancak YÜKSEK MAHKEME DEĞİLLERDİR!',
      imageAssetPath: 'assets/images/vatandaslik/vatandaslik_yargi_organi_semasi.png',
      imageCaption: 'Türk Yargı Teşkilatı ve Dört Yüksek Mahkeme Şeması (AYM, Yargıtay, Danıştay, Uyuşmazlık)',
    ),
    LectureSection(
      title: 'Anayasa Mahkemesi (AYM) Kuruluşu, Üye Seçimi ve Görevleri',
      type: LectureSectionType.ruleList,
      leadText: '1961 Anayasası ile kurulmuş olan Anayasa Mahkemesi, anayasal düzenin ve temel hakların en üst güvencesidir.',
      bulletPoints: [
        'ÜYE SAYISI VE SEÇİMİ (15 Üye - 2017 Öncesi 17 idi, 2 askeri üye kalktı):',
        '  - TBMM Seçer (3 Üye): 2 üyeyi Sayıştay Genel Kurulu\'nun gösterdiği adaylar arasından, 1 üyeyi baro başkanlarının göstereceği serbest avukatlar arasından gizli oyla seçer.',
        '  - CUMHURBAŞKANI Seçer (12 Üye): 3 üyeyi Yargıtay, 2 üyeyi Danıştay, 3 üyeyi YÖK\'ün gösterdiği öğretim üyeleri arasından; 4 üyeyi ise üst kademe yöneticileri, serbest avukatlar, birinci sınıf hakim ve savcılar ile AYM raportörleri arasından doğrudan seçer.',
        'GÖREV SÜRESİ VE YAŞ SINIRI:',
        '  - AYM üyeleri 12 YIL İÇİN seçilir. Bir kimse İKİ DEFA AYM üyesi seçilemez.',
        '  - Üyeler 65 YAŞINI doldurunca zorunlu emekli olurlar.',
        '  - AYM Başkanı ve başkanvekilleri kendi üyeleri arasından gizli oyla 4 YIL İÇİN seçilir (Tekrar seçilebilirler).',
        'AYM\'NİN TEMEL GÖREVLERİ:',
        '  1. NORM DENETİMİ: Kanunların, CBK\'lerin ve TBMM İçtüzüğünün Anayasaya şekil ve esas bakımından uygunluğunu denetlemek (Anayasa değişikliklerini YALNIZCA ŞEKİL bakımından denetler).',
        '  2. BİREYSEL BAŞVURU: Herkes, Anayasada güvence altına alınmış temel hak ve özgürlüklerinden AİHS kapsamındaki herhangi birinin kamu gücü tarafından ihlal edildiği iddiasıyla olağan kanun yolları tüketildikten sonra AYM\'ye başvurabilir (2010\'da geldi).',
        '  3. YÜCE DİVAN YARGILAMASI: Cumhurbaşkanı, CB Yardımcıları, Bakanlar, AYM, Yargıtay, Danıştay başkan ve üyeleri, Başsavcılar, HSK ve Sayıştay üyeleri ile Genelkurmay Başkanı, Kara, Deniz ve Hava Kuvvetleri Komutanlarını görevleriyle ilgili suçlardan dolayı yargılar (DİKKAT: Jandarma Genel Komutanı ve MİT Başkanı Yüce Divan\'da YARGILANMAZ!).',
        '  4. Siyasi partilerin kapatılması davalarına ve mali denetimine bakmak,',
        '  5. Milletvekillerinin dokunulmazlığının kaldırılması ve vekilliğin düşürülmesi kararlarının iptal istemlerini (7 gün içinde başvurulur, 15 günde karara bağlar) karara bağlamak.'
      ],
      goldenRule: 'AYM = 15 Üye (12\'sini CB, 3\'ünü TBMM seçer). Görev süresi 12 Yıl, yaş haddi 65. Yüce Divan\'da Savcılık görevini YARGITAY CUMHURİYET BAŞSAVCISI yapar.',
      osymTrap: 'ÖSYM Tuzakları: Yüce Divan kararlarına karşı itiraz yolu var mıdır? EVET! Yüce Divan\'ın kararlarına karşı ilgililer YENİDEN İNCELEME (itiraz) talebinde bulunabilirler. Genel Kurulun itiraz üzerine verdiği karar kesindir.'
    ),
    LectureSection(
      title: 'Soyut Norm Denetimi (İptal Davası) Süreleri ve Yetkilileri',
      type: LectureSectionType.comparison,
      leadText: 'Kanunların, CBK\'lerin ve TBMM İçtüzüğünün Resmi Gazete\'de yayımlanmasından sonra doğrudan doğruya AYM\'de iptali için açılan davadır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Kimler İptal Davası Açabilir? (Yalnızca 3 Yetkili Vardır!): 1. Cumhurbaşkanı, 2. TBMM\'de en fazla üyeye sahip İKİ SİYASİ PARTİ GRUBU, 3. TBMM üye tamsayısının en az 1/5\'i (En az 120 Milletvekili).',
          wrong: 'Baroların, vatandaşların veya Meclis Başkanının iptal davası açabileceği sanılması yanlıştır; iptal davası açma hakkı yukarıdaki 3 süjeye münhasırdır.',
          note: 'Anayasa değişikliklerine karşı ise yalnızca Cumhurbaşkanı veya en az 120 milletvekili iptal davası açabilir (Siyasi parti grupları dava açamaz!).'
        ),
        ComparisonRow(
          correct: 'Dava Açma Süreleri: Kanunların ve CBK\'lerin ESAS BAKIMINDAN iptali için Resmi Gazete\'de yayımlandığı günden başlayarak 60 GÜN içinde dava açılmalıdır. Anayasa değişikliklerinin ve kanunların ŞEKİL BAKIMINDAN iptali için ise YALNIZCA 10 GÜN içinde dava açılmalıdır.',
          wrong: 'Tüm davaların 60 gün olduğu sanılması: Şekil bozukluğu iddiasıyla açılacak davalar 10 GÜN ile sınırlandırılmıştır.',
          note: 'Şekil bozukluğuna dayalı iptal davası açıldığında AYM öncelikle bu konuyu inceler ve karara bağlar.'
        )
      ],
      goldenRule: 'İPTAL DAVASI AÇANLAR: CB + En Fazla Üyesi Olan İki Parti Grubu + 120 Milletvekili. Şekil davası = 10 Gün; Esas davası = 60 Gün.',
      osymTrap: 'ÖSYM Çeldiricisi: \'İnkılap Kanunlarının anayasaya aykırılığı iddiasıyla AYM\'de iptal davası açılabilir\' der. ASLA! Anayasa Madde 174 koruması altındaki Tevhid-i Tedrisat, Şapka, Harf İnkılabı gibi İnkılap Kanunlarının anayasaya aykırılığı ileri sürülemez ve iptali istenemez!'
    ),
    LectureSection(
      title: 'Diğer Yüksek Mahkemeler, HSK ve Sayıştay',
      type: LectureSectionType.ruleList,
      leadText: 'Adli yargı, idari yargı ve uyuşmazlık çözümlerinde görev alan yüksek mercilerdir.',
      bulletPoints: [
        'YARGITAY (Adli Yargının Temyiz Mercii):',
        '  - Adliye mahkemelerince verilen ve kanunun başka bir adli yargı merciine bırakmadığı karar ve hükümlerin son inceleme merciidir.',
        '  - Bütün üyelerini HAKİMLER VE SAVCILAR KURULU (HSK) seçer.',
        '  - Yargıtay Birinci Başkanı kendi üyeleri arasından 4 yıl için seçilir.',
        '  - Yargıtay Cumhuriyet Başsavcısı ve Vekilini Yargıtay Genel Kurulunun gösterdiği 5\'er aday arasından CUMHURBAŞKANI 4 YIL İÇİN seçer.',
        'DANIŞTAY (İdari Yargının Temyiz ve Danışma Mercii):',
        '  - İdare mahkemeleri ve vergi mahkemelerince verilen kararların son inceleme merciidir.',
        '  - Üyelerinin 3/4\'ünü HAKİMLER VE SAVCILAR KURULU (HSK), 1/4\'ünü CUMHURBAŞKANI seçer.',
        'UYUŞMAZLIK MAHKEMESİ:',
        '  - Adli ve idari yargı mercileri arasındaki görev ve hüküm uyuşmazlıklarını kesin olarak çözen yüksek mahkemedir.',
        '  - Başkanını ANAYASA MAHKEMESİ kendi üyeleri arasından seçer.',
        'HAKİMLER VE SAVCILAR KURULU (HSK - Anayasal Kurul, Yüksek Mahkeme Değildir):',
        '  - 13 ÜYEDEN oluşur ve 2 Daire halinde çalışır.',
        '  - Başkanı ADALET BAKANI\'dır. Adalet Bakanlığı İlgili Bakan Yardımcısı kurulun DOĞAL ÜYESİDİR.',
        '  - Kalan 11 üyenin: 4\'ünü CUMHURBAŞKANI, 7\'sini TBMM seçer. Üyelerin görev süresi 4 YILDIR (Yeniden seçilebilirler).',
        '  - HSK kararlarına karşı kural olarak yargı yolu kapalıdır; ANCAK \'MESLEKTEN ÇIKARMA KARARLARINA KARŞI YARGI YOLU (DANIŞTAY) AÇIKTIR!\'',
        'SAYIŞTAY (Mali Yargı ve Hesap Mahkemesi - Yüksek Mahkeme Değildir):',
        '  - Kamu idarelerinin gelir, gider ve mallarını TBMM ADINA denetler ve sorumluların hesaplarını kesin hükme bağlar.',
        '  - Başkan ve üyelerini TBMM SEÇER.',
        '  - Sayıştay kararlarına karşı 15 gün içinde bir defaya mahsus karar düzeltme istenebilir; yargı yolu kapalıdır.',
        '  - Vergi uyuşmazlıklarında Danıştay ile Sayıştay kararları çatışırsa DANIŞTAY KARARI ESAS ALINIR!'
      ],
      goldenRule: 'Yargıtay üyelerinin TAMAMINI HSK seçer. Danıştay üyelerinin 3/4\'ünü HSK, 1/4\'ünü CB seçer. Uyuşmazlık Mahkemesi Başkanı AYM\'den gelir. HSK 13 üyedir, Başkanı Adalet Bakanıdır.',
      osymTrap: 'ÖSYM Tuzakları: Vergi konusunda Danıştay ile Sayıştay kararları çelişirse hangisinin kararı üstündür? DANIŞTAY\'IN kararı üstündür!'
    ),
    LectureSection(
      title: 'Yargı Organı ve Yüksek Mahkemeler - ÖSYM Testi',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre Danıştay üyelerinin dörtte üçünü (3/4) ve dörtte birini (1/4) seçmeye yetkili merciler aşağıdakilerden hangisinde doğru olarak verilmiştir?',
          options: [
            'A) TBMM - Cumhurbaşkanı',
            'B) Hakimler ve Savcılar Kurulu (HSK) - Cumhurbaşkanı',
            'C) Yargıtay - Danıştay Genel Kurulu',
            'D) Cumhurbaşkanı - Adalet Bakanı',
            'E) HSK - TBMM'
          ],
          correctIndex: 1,
          explanation: '1982 Anayasası Madde 155 uyarınca Danıştay üyelerinin 3/4\'ünü Hakimler ve Savcılar Kurulu (HSK), 1/4\'ünü ise Cumhurbaşkanı seçer.',
          ruleTag: 'Danıştay Üye Seçimi'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi 1982 Anayasası\'nda yer alan yüksek mahkemelerden biri DEĞİLDİR?',
          options: [
            'A) Anayasa Mahkemesi',
            'B) Danıştay',
            'C) Yargıtay',
            'D) Sayıştay',
            'E) Uyuşmazlık Mahkemesi'
          ],
          correctIndex: 3,
          explanation: '1982 Anayasası\'nda sayılan 4 yüksek mahkeme vardır: Anayasa Mahkemesi, Yargıtay, Danıştay ve Uyuşmazlık Mahkemesi. Sayıştay bütçe ve mali denetim yapan anayasal bir yargı kuruluşudur ancak teknik olarak Anayasa\'da YÜKSEK MAHKEME sayılmamıştır.',
          ruleTag: 'Yüksek Mahkemeler'
        )
      ]
    )
  ],
);
