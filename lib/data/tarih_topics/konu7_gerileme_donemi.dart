import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu7GerilemeDonemi = LectureTopic(
  id: 'tarih_gerileme_donemi',
  courseId: 'tarih',
  order: 7,
  title: 'Osmanlı Devleti Gerileme Dönemi (XVIII. Yüzyıl)',
  subtitle: 'Karlofça\'dan Yaş\'a, Lale Devri, Batılılaşma, Coğrafi Keşifler & Fransız İhtilali',
  icon: Icons.trending_down_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 61 - 70',
  startTestNum: 61,
  endTestNum: 70,
  estimatedMinutes: 65,
  sections: [
    // BÖLÜM 1: DÖNEMİN GENEL POLİTİKASI VE SINIRLARI
    LectureSection(
      title: '1. XVIII. Yüzyıl Genel Politikası & Karlofça Sonrası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_osmanli_17_yy_sinirlari.png',
      imageCaption: 'Harita 7.1: Osmanlı Devleti\'nin XVII. ve XVIII. Yüzyıl Genişleme ve Gerileme Sınırları',
      leadText: '1699 Karlofça Antlaşması ile başlayan ve 1792 Yaş Antlaşması\'na kadar süren evre "Gerileme Dönemi" olarak adlandırılır.',
      bulletPoints: [
        'Dış Politika Hedeflerindeki Değişim:\n'
            '  • 1. Aşama (1718\'e kadar): Karlofça ve İstanbul antlaşmalarıyla kaybedilen toprakları GERİ ALMA politikası izlenmiştir.\n'
            '  • 2. Aşama (1718 Pasarofça Antlaşması sonrası): Kaybedilen toprakların geri alınamayacağı anlaşılınca MEVCUT TOPRAKLARI KORUMA ve BARIŞ politikasına geçilmiştir.\n'
            '  • 3. İlk Kez Batı\'nın Üstünlüğü Kabul Edildi: Avrupa\'nın askeri ve teknik üstünlüğü kabul edilerek BATI TARZI İLK ISLAHATLAR bu yüzyılda başlatılmıştır.',
      ],
    ),

    // BÖLÜM 2: XVIII. YÜZYIL SİYASİ GELİŞMELERİ VE SAVAŞLARI
    LectureSection(
      title: '2. XVIII. Yüzyıl Siyasi Olayları ve Antlaşmaları',
      type: LectureSectionType.formula,
      leadText: 'Rusya, Avusturya, Venedik ve İran ile yapılan savaşlar ve dönüm noktası niteliğindeki antlaşmalar:',
      bulletPoints: [
        '1. 1711 PRUT ANTLAŞMASI (Osmanlı - Rusya):\n'
            '  • Baltacı Mehmed Paşa Prut bataklığında Çar I. Petro\'nun ordusunu kuşatmış; Rusların barış teklifi üzerine antlaşma yapılmıştır.\n'
            '  • Sonuç: Azak Kalesi geri alınmış; Rusların İstanbul\'da elçi bulundurma hakkı kaldırılmıştır. Karlofça\'da kaybedilen toprakların geri alınabileceği ümidi doğmuştur.',
        '2. 1718 PASAROFÇA ANTLAŞMASI (Osmanlı - Avusturya & Venedik):\n'
            '  • Mora Venedik\'ten geri alınmış; ancak Petervaradin Savaşı\'nda Avusturya\'ya yenilince Belgrad ve Banat Avusturya\'ya bırakılmıştır.\n'
            '  • ÖNEMİ: Batı\'nın askeri üstünlüğü kesin olarak kabul edilmiş ve LALE DEVRİ (1718-1730) başlamıştır.',
        '3. 1739 BELGRAD ANTLAŞMASI (Osmanlı - Rusya & Avusturya):\n'
            '  • I. Mahmud döneminde Fransız asıllı Kont de Bonneval\'in (Humbaracı Ahmed Paşa) askeri ıslahatları sayesinde ordu hem Rusya\'yı hem Avusturya\'yı yenmiştir.\n'
            '  • Fransa\'nın arabuluculuğuyla Belgrad geri alınmış; Karadeniz\'de Rusların donanma ve tersane bulundurması yasaklanmıştır.\n'
            '  • ÖNEMİ: OSMANLI DEVLETİ\'NİN BATI\'DA İMZALADIĞI SON KAZANÇLI VE AVANTAJLI ANTLAŞMADIR. Karadeniz\'in bir Türk gölü olduğu SON KEZ tescil edilmiştir.\n'
            '  • UYARI: Arabuluculuk yapan Fransa\'ya 1740 yılında kapitülasyonlar SÜREKLİ HALE getirilmiştir.',
        '4. 1774 KÜÇÜK KAYNARCA ANTLAŞMASI (Osmanlı - Rusya):\n'
            '  • 1770 Çeşme Baskını ile Ruslar Osmanlı donanmasını yakmış; ağır yenilgi sonrası Küçük Kaynarca imzalanmıştır.\n'
            '  • Maddeleri ve Tarihi Önemi:\n'
            '    - 1. KIRIM BAĞIMSIZ OLDU (Kırım halkı dini yönden Osmanlı Halifesine bağlı kalacaktı - Halifeliğin siyasi gücü ilk kez kullanıldı). İLK KEZ HALKI TAMAMEN MÜSLÜMAN VE TÜRK OLAN BİR TOPRAK KAYBEDİLMİŞTİR!\n'
            '    - 2. Rusya Karadeniz ve Akdeniz\'de serbestçe ticaret yapma ve Boğazlardan geçme hakkı kazandı (Karadeniz Türk gölü olmaktan çıktı).\n'
            '    - 3. Rusya\'ya ilk kez KAPİTÜLASYON verildi.\n'
            '    - 4. Osmanlı Devleti tarihinde İLK KEZ SAVAŞ TAZMİNATI ödemek zorunda kaldı.\n'
            '    - 5. Rusya Osmanlı topraklarındaki Ortodoksları himaye etme ve Balkanlarda konsolosluk açma hakkı kazandı (İç işlerimize müdahale kapısı açıldı).',
        '5. 1779 Aynalıkavak Tenkihnamesi ve 1792 YAŞ ANTLAŞMASI:\n'
            '  • 1779 Aynalıkavak ile Rus yanlısı Şahin Giray\'ın Kırım Hanlığı tanındı.\n'
            '  • 1792 Yaş Antlaşması: Rusya ile imzalandı. KIRIM\'IN RUSYA\'YA AİT OLDUĞU KESİN OLARAK KABUL EDİLDİ. Gerileme dönemi sona erdi, DAĞILMA VE ÇÖKÜŞ DÖNEMİ başladı.',
      ],
      goldenRule: '💡 GERİLEMENİN SON KAZANÇLI ANTLAŞMASI = BELGRAD (1739):\n'
          'Osmanlı\'nın XVIII. yüzyılda imzaladığı son kazançlı antlaşma 1739 BELGRAD; en ağır hezimeti ve kırılma noktası ise 1774 KÜÇÜK KAYNARCA\'dır.',
    ),

    // BÖLÜM 3: LALE DEVRİ (1718 - 1730)
    LectureSection(
      title: '3. Lale Devri (1718 - 1730) & Batılılaşma İlkleri',
      type: LectureSectionType.ruleList,
      leadText: '1718 Pasarofça Antlaşması ile başlayıp 1730 Patrona Halil İsyanı ile sona eren, zevk, sefa, sanat ve barış dönemidir.',
      bulletPoints: [
        'Dönemin Aktörleri:\n'
            '  • Padişah: III. AHMED\n'
            '  • Sadrazam: NEVŞEHİRLİ DAMAT İBRAHİM PAŞA\n'
            '  • Şairi: NEDİM | Minyatür Sanatçısı: LEVNÎ.',
        'Lale Devri\'nde Yapılan Batı Tarzı Islahatlar:\n'
            '  • İLK OSMANLI MATBAASI: 1727 yılında İBRAHİM MÜTEFERRİKA ve SAİD EFENDİ tarafından ilk özel Türk matbaası kurulmuştur. Hattatların işsiz kalmaması için dini kitapların basımı yasaklanmış; ilk basılan eser "VANKULU LÜGATİ" (Sözlük) olmuştur.\n'
            '  • Geçici Elçilikler Açıldı: Avrupa diplomasisini ve gelişmelerini yakından tanımak amacıyla Paris, Viyana, Londra gibi merkezlere ilk geçici elçiler gönderilmiştir. İlk geçici elçi YİRMİSEKİZ ÇELEBİ MEHMED\'dir ("PARİS SEFARETNAMESİ" adlı eseri Batı\'ya açılan ilk penceredir).\n'
            '  • Tulumbacılar Ocağı: Yeniçerilerden ilk itfaiye teşkilatı kurulmuştur.\n'
            '  • Sağlık ve Sanayi: Çiçek aşısı uygulanmış; Yalova\'da ilk kâğıt fabrikası ve İstanbul\'da kumaş-çini imalathaneleri açılmıştır.\n'
            '  • Mimari: Avrupa\'nın Barok ve Rokoko tarzı benimsenmiş; III. Ahmed Çeşmesi inşa edilmiştir.\n'
            '  • UYARI: Lale Devri\'nde KESİNLİKLE ASKERİ ISLAHAT YAPILMAMIŞTIR!',
        'Dönemin Sonu: PATRONA HALİL İSYANI (1730):\n'
            '  • Sarayın aşırı lüks ve israfına, İran savaşlarındaki başarısızlıklara tepki olarak çıkan isyandır. Sadrazam idam edilmiş, III. Ahmed tahttan indirilmiş, köşkler yakılmış; ancak matbaaya dokunulmamıştır.',
      ],
      goldenRule: '💡 LALE DEVRİNDE ASKERİ ISLAHAT YOKTUR:\n'
          'Lale Devri bir barış ve sefa devri olduğu için askeri alanda hiçbir yenilik yapılmamıştır. İlk askeri ıslahatlar I. Mahmud devrinde başlayacaktır.',
    ),

    // BÖLÜM 4: AVRUPA'DAKİ GELİŞMELER: COĞRAFİ KEŞİFLER, RÖNESANS, REFORM
    LectureSection(
      title: '4. Avrupa\'daki Gelişmeler: Coğrafi Keşifler, Rönesans, Reform',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_cografi_kesifler.png',
      imageCaption: 'Harita 7.2: Coğrafi Keşifler ve Ticaret Yollarının Okyanuslara Kayması',
      leadText: 'XV. ve XVI. yüzyıllarda Avrupa\'da meydana gelen köklü dönüşümler dünya dengelerini altüst etmiş ve Osmanlı\'yı derinden sarsmıştır.',
      bulletPoints: [
        '1. Coğrafi Keşifler (Pusula, Yeni Kıtalar ve Okyanuslar):\n'
            '  • Nedenleri: İpek ve Baharat yollarının Türklerin kontrolüne geçmesi; Avrupalıların Hindistan ve Çin\'e doğrudan denizden ulaşma arzusu.\n'
            '  • Önemli Keşifler: Bartelmi Diyaz Ümit Burnu\'nu buldu; Vasko dö Gama Hindistan\'a ulaştı; Kristof Kolomb Amerika\'yı keşfetti; Macellan ve Del Kano dünyayı dolaştı.\n'
            '  • Osmanlı\'ya Yıkıcı Etkileri: Akdeniz limanları ve İpek-Baharat yolları önemini kaybetti; Atlas Okyanusu limanları zenginleşti; Osmanlı gümrük gelirleri bıçak gibi kesildi; Avrupa\'ya taşınan tonlarca altın ve gümüş Osmanlı\'ya kaçak girdi ve akçenin değerini düşürerek tarihin ilk büyük enflasyonunu başlattı.',
        '2. Rönesans ve Reform Hareketleri:\n'
            '  • Rönesans (İtalya): Edebiyat, güzel sanatlar, felsefe ve bilimde hümanizm akımı doğdu; skolastik düşünce çöktü; akıl ve deney çağı başladı.\n'
            '  • Reform (Almanya - Martin Luther): Katolik kilisesinin sömürüsüne karşı Protestanlık, Kalvenizm, Anglikanizm mezhepleri doğdu. Kiliselerin malları yağmalandı, eğitim laikleşti.\n'
            '  • Osmanlı\'ya Etkisi: Osmanlı Protestanları destekleyerek Avrupa\'daki mezhep savaşlarından (Otuz Yıl Savaşları) faydalanmış ve Balkanlarda hızlı fetihler yapmıştır.',
        '3. Aydınlanma Çağı (XVIII. Yüzyıl):\n'
            '  • Akıl, bilim, insan hakları, özgürlük ve laik düşünce hakim oldu (Newton, Descartes, Rousseau, Voltaire, Montesquieu). Sanayi İnkılabı ve Fransız İhtilali\'nin fikri altyapısı hazırlandı.',
      ],
    ),

    // BÖLÜM 5: 1789 FRANSIZ İHTİLALİ VE SANAYİ İNKILABI
    LectureSection(
      title: '5. 1789 Fransız İhtilali, Milliyetçilik & Sanayi İnkılabı',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/tarih/tarih_fransiz_ihtilali_tablosu.png',
      imageCaption: 'Tablo 7.3: Fransız İhtilali İnsan ve Yurttaş Hakları Bildirisi ve Osmanlı\'ya Etkileri',
      leadText: '1789 Fransız İhtilali ve İngiltere\'de başlayan Sanayi İnkılabı, Osmanlı İmparatorluğu\'nun siyasi ve ekonomik çöküşünü hazırlayan iki ana dinamiktir.',
      bulletPoints: [
        '1. 1789 Fransız İhtilali ve Osmanlı\'ya Etkileri:\n'
            '  • İhtilalin Yaydığı İlkeler: Milliyetçilik (Ulusçuluk), Adalet, Eşitlik, Özgürlük, Demokrasi ve İnsan Hakları.\n'
            '  • YIKICI ETKİSİ (Milliyetçilik Akımı): "Her millete bir devlet" sloganı çok uluslu Osmanlı İmparatorluğu\'nu derinden sarstı. Rusya ve İngiltere\'nin kışkırtmasıyla Balkan milletleri (Sırplar, Rumlar, Bulgarlar) isyan etmeye başladı ve imparatorluk parçalanma sürecine girdi.\n'
            '  • OLUMLU ETKİSİ: İhtilalin yaydığı demokrasi ve eşitlik fikirleri Osmanlı aydınlarını etkiledi; Tanzimat, Islahat Fermanları, Kanun-i Esasi ve Meşrutiyet ile demokratikleşme hareketleri başladı.',
        '2. Sanayi İnkılabı (İngiltere - Buhar Gücü):\n'
            '  • Üretimde el tezgahlarından fabrika ve makineli üretime geçildi. Hammadde ve pazar arayışı SÖMÜRGECİLİK YARIŞINI başlattı.\n'
            '  • Osmanlı\'ya Etkileri: Osmanlı sanayisi rekabet edemeyerek el tezgahları kapandı; ülke Avrupa fabrikalarının açık pazarı ve hammadde deposu haline geldi; dış ticaret dengesi tamamen çöktü.',
      ],
      goldenRule: '💡 MİLLİYETÇİLİK İLK KİMLERİ AYAKLANDIRDI?\n'
          '• Fransız İhtilali\'nden etkilenerek Osmanlı\'da İLK İSYAN EDEN azınlık = SIRPLAR (1804 Karayorgi).\n'
          '• Osmanlı\'dan ayrılarak İLK BAĞIMSIZLIK KAZANAN azınlık = RUMLAR / YUNANİSTAN (1829 Edirne Antlaşması).',
    ),

    // BÖLÜM 6: XVIII. YÜZYIL ISLAHATÇILARI (ŞİFRE: 31313)
    LectureSection(
      title: '6. XVIII. Yüzyıl Islahatçıları (Şifre: 31313)',
      type: LectureSectionType.comparison,
      leadText: 'XVIII. yüzyılda Batı\'nın askeri üstünlüğünün kabul edilmesiyle padişahlar Avrupa tarzı askeri okullar ve ordular kurmuşlardır.',
      bulletPoints: [
        'XVIII. Yüzyıl Islahatlarının Genel Nitelikleri:\n'
            '  • 1. Avrupa (Batı) İLK KEZ örnek alınmıştır.\n'
            '  • 2. Ağırlıklı olarak ASKERİ ve TEKNİK alanlarda yoğunlaşmıştır.\n'
            '  • 3. Islahatlar yeniçeriler ve tutucu ulemanın isyanlarıyla sık sık kesintiye uğramıştır.\n'
            '  • 4. Hukuk ve anayasa alanında hiçbir yenilik yapılmamıştır.',
        'Padişahlar ve Yaptıkları Islahatlar (31313):\n'
            '  • 3 - III. Ahmed: Lale Devri padişahıdır. İlk sivil matbaa, tulumbacılar ocağı, geçici elçilikler.\n'
            '  • 1 - I. Mahmud: BATI TARZI İLK ASKERİ ISLAHATÇIDIR. Fransız Kont de Bonneval\'i (Humbaracı Ahmed Paşa) getirerek Humbaracı Ocağı\'nı ıslah ettirmiştir. BATI TARZI İLK ASKERİ TEKNİK OKUL olan HENDESEHANE\'yi (Kara Mühendishanesi) açmıştır.\n'
            '  • 3 - III. Mustafa: Fransız Baron de Tott\'a Sürat Topçuları Ocağı\'nı kurdurmuştur. Deniz Mühendishanesi (Mühendishane-i Bahrî-i Hümayun) temelleri atılmıştır. ESHAM SİSTEMİ (İç borçlanma senedi) hazırlanmıştır.\n'
            '  • 1 - I. Abdülhamid: Esham sistemini fiilen uygulamış ve ilk iç borçlanmayı yapmıştır. Cülus bahşişini kaldırmış, yeniçeri sayımı yaptırmış, ulufe alım-satımını yasaklamıştır. İstihkâm Mektebi\'ni açmıştır.\n'
            '  • 3 - III. Selim: Kapsamlı ve köklü reformlar yapan padişahtır. Yaptığı tüm ıslahatlara NİZÂM-I CEDİD (Yeni Düzen) denir:\n'
            '    - Batı tarzı ilk modern ordu olan NİZÂM-I CEDİD ORDUSU kurulmuştur (Akka Kalesi\'nde Napolyon\'u yenen ordudur - Cezzar Ahmed Paşa).\n'
            '    - Bu ordunun giderleri için İRÂD-I CEDİD HAZİNESİ kurulmuştur.\n'
            '    - Selimiye ve Levent Kışlaları inşa edilmiştir.\n'
            '    - İLK DAİMİ ELÇİLİKLER Londra, Paris, Viyana ve Berlin\'de açılmıştır (İlk daimi elçi Londra\'ya atanan YUSUF ÂGAH EFENDİ\'dir).\n'
            '    - Fransızca ilk resmi yabancı dil ilan edilmiştir.\n'
            '    - KABAKÇI MUSTAFA İSYANI (1807) ile III. Selim tahttan indirilmiş ve Nizam-ı Cedid dönemi sona ermiştir.',
      ],
      goldenRule: '💡 GEÇİCİ ELÇİLİK VS DAİMİ ELÇİLİK:\n'
          '• İlk GEÇİCİ Elçi = Lale Devri (III. Ahmed) ➜ YİRMİSEKİZ ÇELEBİ MEHMED (Paris).\n'
          '• İlk DAİMİ Elçi = Nizam-ı Cedid (III. Selim) ➜ YUSUF ÂGAH EFENDİ (Londra).',
    ),
  ],
);
