import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu2TurkAnayasaTarihi = LectureTopic(
  id: 'vat_konu2',
  courseId: 'vatandaslik',
  order: 2,
  title: 'Türk Anayasa Tarihi',
  subtitle: 'Sened-i İttifak\'tan 1961 Anayasası\'na Türk Anayasacılık Hareketleri',
  icon: Icons.account_balance_outlined,
  color: Color(0xFF6D28D9),
  testRange: 'Test 9 - 14',
  startTestNum: 9,
  endTestNum: 14,
  estimatedMinutes: 55,
  sections: [
    LectureSection(
      title: 'Osmanlı Dönemi Anayasacılık Hareketleri (1808 - 1876)',
      type: LectureSectionType.overview,
      leadText: 'Türk anayasacılık serüveni, hükümdarın mutlak yetkilerinin sınırlandırılması ve temel insan haklarının güvenceye alınması amacıyla 19. yüzyılda başlamıştır.',
      bulletPoints: [
        'SENED-İ İTTİFAK (1808): Padişah II. Mahmut ile Âyanlar (yerel güç odakları) arasında imzalanmıştır. Türk tarihinde padişahın yetkilerini sınırlandıran İLK BELGEDİR. Hukuki niteliği bir anayasa DEĞİL, sözleşme (misak) niteliğindedir. İngiltere\'deki Magna Carta\'ya (1215) benzetilir.',
        'TANZİMAT FERMANI (Gülhane Hatt-ı Hümayunu - 1839): Sultan Abdülmecit döneminde Hariciye Nazırı Mustafa Reşit Paşa tarafından ilan edilmiştir. Padişah kendi isteğiyle kanun üstünlüğünü ve gücünü kabul etmiştir. Hukuk devleti anlayışına giden ilk büyük adımdır. Müslüman ve gayrimüslim tebaa için can, mal, namus güvencesi, verginin gelire göre alınması ve iltizamın kaldırılması sözü verilmiştir. Padişahın tek taraflı bir fermanıdır.',
        'ISLAHAT FERMANI (1856): Kırım Savaşı sonrası Paris Antlaşması öncesinde Avrupalı devletlerin baskısıyla ilan edilmiştir. Temel hedefi gayrimüslim tebaaya geniş ayrıcalıklar tanıyarak imparatorluğun parçalanmasını önlemektir. Cizye vergisi kaldırılmış, gayrimüslimlere devlet memuru olma, bedelli askerlik yapma ve il meclislerine girme hakkı tanınmıştır.',
        'KANUN-İ ESASİ (1876): Türk tarihinin İLK YAZILI VE RESMİ ANAYASASIDIR. II. Abdülhamit döneminde Mithat Paşa başkanlığındaki komisyon tarafından (Fransa ve Belçika anayasalarından esinlenerek) hazırlanmıştır. I. Meşrutiyet ilan edilmiş, mutlak monarşiden meşruti monarşiye geçilmiştir.'
      ],
      goldenRule: 'İLK BELGE = Sened-i İttifak (1808); İLK HUKUK DEVLETİ ADIMI (Kanun üstünlüğü) = Tanzimat Fermanı (1839); İLK YAZILI ANAYASA = Kanun-i Esasi (1876).',
      osymTrap: 'ÖSYM Sorusu: \'Sened-i İttifak ilk Türk anayasasıdır\' ifadesi YANLIŞTIR. Sened-i İttifak anayasa değil, anayasal nitelik taşıyan bir ikili sözleşmedir. İlk anayasa 1876 Kanun-i Esasi\'dir.'
    ),
    LectureSection(
      title: 'Kanun-i Esasi (1876) ve 1909 Değişikliklerinin Karşılaştırması',
      type: LectureSectionType.comparison,
      leadText: '1876 Kanun-i Esasi\'nin ilk hali son derece sert ve hükümdar odaklı iken, 1909 II. Meşrutiyet değişiklikleriyle ilk kez parlamenter demokrasiye geçilmiştir.',
      comparisonRows: [
        ComparisonRow(
          correct: '1876 İlk Hali: Hükümet (Heyet-i Vükela) Padişaha karşı sorumludur. Padişah meclisi dilediğinde feshedebilir. Padişahın mutlak veto yetkisi vardır. Sürgün yetkisi (Ünlü Madde 113) vardır. Dernek ve parti kurma hakkı yoktur.',
          wrong: '1909 Değişiklikleri: Hükümet artık Padişaha değil MECLİSE (Meclis-i Mebusan\'a) karşı sorumludur. Padişahın meclisi feshetmesi zorlaştırılmıştır. Padişahın mutlak vetosu kaldırılmış, geciktirici veto getirilmiştir. Sürgün yetkisi kaldırılmış, sansür yasaklanmıştır.',
          note: '1909 değişiklikleri ile Osmanlı\'da ilk kez gerçek manada parlamenter sisteme geçilmiştir.'
        ),
        ComparisonRow(
          correct: 'Çift Meclis Sistemi: Meclis-i Umumi iki kanattan oluşur: 1. Meclis-i Ayan (Üyelerini Padişah ömür boyu seçer), 2. Meclis-i Mebusan (Halk tarafından 4 yıllığına seçilir, çift dereceli seçim).',
          wrong: 'Cumhuriyet döneminde çift meclisli tek anayasa 1961 Anayasası\'dır (Millet Meclisi + Cumhuriyet Senatosu). 1921, 1924 ve 1982 anayasaları TEK MECLİSLİDİR.',
          note: 'Kanun-i Esasi ve 1961 Anayasası tarihimizdeki iki çift meclisli anayasadır.'
        )
      ],
      goldenRule: '1876\'da egemenlik saraydaydı; 1909\'da meclise geçti. 1909\'da ilk defa siyasi partiler (İttihat ve Terakki, Ahrar vb.) kurulma hakkına kavuştu.',
      osymTrap: 'ÖSYM Çeldiricisi: \'Kanun-i Esasi ile Cumhuriyet ilan edilmiştir\' der. ASLA! Kanun-i Esasi Meşruti Monarşidir; devlet başkanı babadan oğula geçen padişahtır. Cumhuriyet 1923\'te 1921 Anayasası değişikliğiyle gelmiştir.'
    ),
    LectureSection(
      title: '1921 Teşkilat-ı Esasiye Kanunu ve Özellikleri',
      type: LectureSectionType.ruleList,
      leadText: 'Kurtuluş Savaşı koşullarında I. TBMM tarafından kabul edilen, tarihimizin en kısa ve tek yumuşak anayasasıdır.',
      bulletPoints: [
        'MADDE 1: \'Hâkimiyet bilâkaydü şart milletindir\' (Egemenlik kayıtsız şartsız milletindir) ilkesi ilk kez anayasal metne girmiştir.',
        'HÜKÜMET SİSTEMİ: Meclis Hükümeti Sistemi benimsenmiştir. Meclis başkanı aynı zamanda hükümetin de başkanıdır. Kuvvetler Birliği ve Meclis Üstünlüğü ilkesi geçerlidir (Yasama, yürütme ve hatta İstiklal Mahkemeleri ile yargı meclistedir).',
        'TEK YUMUŞAK ANAYASA: Değiştirilmesi için nitelikli çoğunluk aranmamış, basit çoğunlukla değiştirilebilmiştir. Kanunlarla anayasa aynı usulle değiştirilebildiği için tarihimizin TEK YUMUŞAK ve EN ÇERÇEVE anayasasıdır (23 madde + 1 geçici madde).',
        'YARGI MADDESİ YOKTUR: Olağanüstü savaş şartları nedeniyle temel hak ve hürriyetler ile yargı organına ilişkin hükümler anayasada yer almamış; bu konularda Kanun-i Esasi\'nin çatışmayan maddeleri fiilen uygulanmıştır.',
        '1923 DEĞİŞİKLİKLERİ (29 Ekim 1923):',
        '  - Türkiye Devleti\'nin hükümet şekli CUMHURİYET\'tir hükmü eklendi.',
        '  - Devletin dini İslam, resmi dili Türkçe, başkenti Ankara olarak kabul edildi.',
        '  - Cumhurbaşkanlığı makamı ihdas edildi; Cumhurbaşkanının TBMM üyeleri arasından Meclis tarafından 4 yıl için seçileceği hükme bağlandı.',
        '  - Başbakanı Cumhurbaşkanı atar; bakanları Başbakan meclis üyeleri arasından seçer (Kabine Sistemine geçiş adımı).'
      ],
      goldenRule: '1921 ANAYASASI ÖZETİ: 1. Tek yumuşak anayasa, 2. Tek çerçeve anayasa, 3. İlk kez kuvvetler birliği ve Meclis Hükümeti sistemi, 4. Temel haklar ve yargı bölümü bulunmayan tek anayasa.',
      osymTrap: 'ÖSYM\'nin en popüler sorusu: \'1921 Anayasası ilk kabul edildiğinde devletin rejimi Cumhuriyettir hükmü var mıydı?\' HAYIR! Cumhuriyet 1921 anayasasının ilk halinde yoktur; 29 Ekim 1923 değişikliğiyle anayasaya girmiştir!'
    ),
    LectureSection(
      title: '1924 Anayasası ve Önemli Değişiklikleri',
      type: LectureSectionType.ruleList,
      leadText: 'Yeni Türk Devleti\'nin barış dönemindeki ilk teşkilatlı anayasasıdır. Karma Hükümet Sistemi (Meclis Hükümeti ile Parlamenter Sistem karması) benimsenmiştir.',
      bulletPoints: [
        'KUVVETLER BİRLİĞİ - GÖREVLER AYRILIĞI: Egemenlik TBMM\'dedir. Meclis yasama yetkisini bizzat, yürütme yetkisini Cumhurbaşkanı ve Bakanlar Kurulu eliyle kullanır. Yargı yetkisi bağımsız mahkemelerdedir.',
        'KATI/SERT ANAYASA: İlk kez değiştirilemeyecek hüküm (Devletin şekli Cumhuriyettir - Madde 1) getirilmiş ve anayasa değişiklikleri için 2/3 nitelikli çoğunluk şartı konulmuştur.',
        'ANAYASA MAHKEMESİ YOKTUR: Anayasanın üstünlüğü ilkesi kabul edilmiş ancak kanunların anayasaya uygunluğunu denetleyecek bir yargısal denetim organı kurulmamıştır.',
        'KRONOLOJİK ÖNEMLİ DEĞİŞİKLİKLER:',
        '  - 1928: \'Devletin dini İslam\'dır\' ibaresi ve milletvekillerinin yeminindeki dini ifadeler (Vallahi) anayasadan çıkarıldı (Laikleşme yolunda ilk anayasal adım).',
        '  - 1934: Kadınlara Milletvekili seçme ve seçilme hakkı tanındı (034 BMW kuralı: 1930 Belediye, 1933 Muhtar, 1934 Vekil).',
        '  - 1937: Atatürk\'ün 6 Temel İlkesi (Cumhuriyetçilik, Milliyetçilik, Halkçılık, Devletçilik, Laiklik, İnkılapçılık) anayasaya girdi.',
        '  - 1945: Anayasa dili Türkçeleştirildi (Teşkilat-ı Esasiye Kanunu yerine Anayasa denildi); 1952\'de tekrar eski dile dönüldü.',
        '  - 1946: İlk çok partili genel seçimler yapıldı (Tek dereceli seçim, ancak açık oy - gizli sayım ilkesiyle uygulandı).',
        '  - 1950: İlk kez \'Gizli oy - Açık sayım ve döküm\' ilkesi ile adli denetim (YSK\'nın kurulması) uygulandı.'
      ],
      goldenRule: '1928\'de Din ibaresi çıktı, 1934\'te Kadına vekillik geldi, 1937\'de Laiklik ve 6 ilke girdi. 1924 Anayasası tarihimizin en uzun süre yürürlükte kalan anayasalarından biridir (36 yıl).',
      osymTrap: 'ÖSYM Çeldiricisi: \'Laiklik ilkesi 1924\'te anayasaya girmiştir\' der. YANLIŞ! 1924 ilk halinde \'Devletin dini İslamdır\' yazıyordu. 1928\'de bu madde çıkarıldı, LAİKLİK İLKESİ İSE 1937\'DE ANAYASAYA EKLENDİ!'
    ),
    LectureSection(
      title: '1961 Anayasası ve Getirdiği Büyük Hukuki Yenilikler',
      type: LectureSectionType.overview,
      leadText: '27 Mayıs 1960 askeri müdahalesi sonrası Kurucu Meclis (Milli Birlik Komitesi + Temsilciler Meclisi) tarafından hazırlanmış ve HALKOYU (Referandum) ile kabul edilen İLK ANAYASADIR.',
      bulletPoints: [
        'KUVVETLER AYRILIĞI: İlk kez tam anlamıyla parlamenter sistem ve kuvvetler ayrılığı ilkesi kabul edilmiştir.',
        'ÇİFT MECLİS (Cumhuriyet Döneminde Tek): 1. Millet Meclisi (450 üye, halk seçer), 2. Cumhuriyet Senatosu (150 üye halk seçer + 15 kontenjan üyesi Cumhurbaşkanı seçer + Tabii Senatörler: MBK üyeleri ve eski Cumhurbaşkanları ömür boyu).',
        'TEMEL HAK VE ÖZGÜRLÜKLER: En özgürlükçü anayasa kabul edilir. Sosyal devlet ilkesi, sendika, grev ve toplu sözleşme hakları ilk kez anayasaya girmiştir.',
        'KURULAN YENİ YÜKSEK KURUMLAR (ÖSYM çok sever!):',
        '  1. Anayasa Mahkemesi (AYM) kuruldu (Kanunların anayasaya uygunluğunu denetlemek üzere ilk kez).',
        '  2. Devlet Planlama Teşkilatı (DPT) kuruldu.',
        '  3. Milli Güvenlik Kurulu (MGK) anayasal kurum haline geldi.',
        '  4. Hakimler Yüksek Kurulu (HYK) kuruldu (Yargı bağımsızlığı için).',
        '  5. Diyanet İşleri Başkanlığı anayasaya girdi.',
        '  6. TRT ve Üniversitelere özerklik tanındı.',
        '  7. Yüksek Seçim Kurulu (YSK) ilk kez anayasada düzenlendi.',
        '1971 - 1973 MUHTIRA DEĞİŞİKLİKLERİ (Özgürlüklerin daraltılması):',
        '  - Temel haklara genel sınırlama sebepleri getirildi.',
        '  - Bakanlar Kurulu\'na Kanun Hükmünde Kararname (KHK) çıkarma yetkisi verildi.',
        '  - Askeri Yüksek İdare Mahkemesi (AYİM) ve Devlet Güvenlik Mahkemeleri (DGM) kuruldu.',
        '  - TRT\'nin özerkliği kaldırıldı (tarafsızlık ilkesi getirildi), üniversite özerkliği zayıflatıldı.',
        '  - AYM\'nin anayasa değişikliklerini yalnızca ŞEKİL yönünden denetleyebileceği esası getirildi.'
      ],
      goldenRule: '1961 İLKLERİ: İlk referandumla kabul edilen anayasa, İlk Anayasa Mahkemesi, İlk Sosyal Devlet, İlk MGK, İlk DPT, İlk Grev ve Toplu Sözleşme hakkı, Cumhuriyet döneminin tek ÇİFT MECLİSLİ anayasası.',
      osymTrap: 'ÖSYM Sorusu: KHK çıkarma yetkisi ilk kez hangi anayasa döneminde yürütmeye verilmiştir? CEVAP: 1961 Anayasası 1971 değişikliği ile! 1982 anayasasında zaten vardı ama ilk çıkışı 1971\'dir.'
    ),
    LectureSection(
      title: 'Türk Anayasa Tarihi - ÖSYM Soru Taraması ve Test',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Türk anayasa tarihinde kanunların anayasaya uygunluğunu denetlemek amacıyla \'Anayasa Mahkemesi\' ilk kez hangi anayasa ile kurulmuştur?',
          options: [
            'A) 1876 Kanun-i Esasi',
            'B) 1921 Teşkilat-ı Esasiye',
            'C) 1924 Anayasası',
            'D) 1961 Anayasası',
            'E) 1982 Anayasası'
          ],
          correctIndex: 3,
          explanation: 'Kanunların anayasaya uygunluğunu denetleyecek özel bir yargı organı olan Anayasa Mahkemesi, 1924 anayasasında çoğunluk tahakkümünü engellemek amacıyla ilk kez 1961 Anayasası ile hukuk sistemimize kazandırılmıştır.',
          ruleTag: 'Yargı Denetimi Tarihi'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki gelişmelerden hangisi 1924 Anayasası\'nda 1937 yılında yapılan değişiklikle anayasal hüküm haline gelmiştir?',
          options: [
            'A) Devletin dini İslam\'dır ibaresinin anayasadan çıkarılması',
            'B) Kadınlara milletvekili seçme ve seçilme hakkının tanınması',
            'C) Atatürk\'ün 6 temel ilkesinin anayasa metnine eklenmesi',
            'D) Çok partili hayata geçilerek tek dereceli seçimlerin yapılması',
            'E) Hükümet şeklinin Cumhuriyet olarak tescil edilmesi'
          ],
          correctIndex: 2,
          explanation: 'A seçeneği 1928 yılında; B seçeneği 1934 yılında; C seçeneği 1937 yılında; D seçeneği 1946 yılında; E seçeneği ise 29 Ekim 1923 yılında gerçekleşmiştir. 1937 yılında CHP\'nin 6 temel ilkesi (Laiklik dahil) anayasaya girmiştir.',
          ruleTag: '1924 Anayasası Değişiklikleri'
        )
      ]
    )
  ],
);
