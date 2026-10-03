// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu1CografiKonum = LectureTopic(
  id: 'cografya_konum_jeopolitik',
  courseId: 'cografya',
  order: 1,
  title: 'Coğrafi Konum ve Türkiye\'nin Jeopolitiği',
  subtitle: 'Coğrafi Koordinat Sistemi, Paralel ve Meridyenler, Yerel Saat, Mutlak ve Göreceli Konum',
  icon: Icons.public_rounded,
  color: const Color(0xFF0284C7),
  testRange: 'Test 1 - 10',
  startTestNum: 1,
  endTestNum: 10,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Coğrafi Koordinat Sistemi, Paralel ve Meridyenlerin Özellikleri',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_paraleller_dunya.png',
      imageCaption: 'Şekil 1.1: Dünya Modeli, Ekvator ve Paralel Daireleri Dereceleri',
      leadText: 'Coğrafi koordinat sistemi, dünya üzerindeki bir yerin konumunu (zaman ve yere ait özelliklerini) belirleyebilmek amacıyla oluşturulmuştur. Bu sistem; teknolojik gelişmelerle cep telefonlarındaki konum bildiriminde, araç navigasyon sistemlerinde (yol kılavuzu), hava ve deniz ulaşımında rotaların çizilmesinde ve savunma sanayisinde yaygın olarak kullanılmaktadır.',
      bulletPoints: [
        'Kutup Noktaları ve Ekvator: Dünya\'nın kendi ekseni etrafında dönüş hareketi sırasında dönmeyen, hareketsiz noktalara kutup adı verilir. Kuzey ve Güney Kutup Noktaları ile Dünya\'yı kuzey ve güney olarak iki eşit yarım küreye bölen en büyük paralel dairesine Ekvator denir.',
        'Paralellerin Temel Özellikleri: Başlangıç paraleli 0° Ekvator\'dur. 90 Kuzey ve 90 Güney olmak üzere toplam 180 paralel dairesi bulunur. Ekvator\'dan kutuplara doğru gidildikçe paralellerin çevre uzunlukları daralır ve kutuplarda nokta halini alır.',
        'Paraleller Arası Kuş Uçumu Uzaklık: Dünya\'nın her yerinde ardışık iki paralel dairesi arasındaki mesafe sabittir ve 111 km\'dir.',
        'Enlem Kavramı: Dünya üzerindeki herhangi bir noktanın Ekvator\'a olan uzaklığının açı cinsinden değeridir (Derece, dakika, saniye). Güneş ışınlarının geliş açısı, sıcaklık, gölge boyu ve çizgisel hız doğrudan enleme bağlı olarak değişir.',
        'Meridyenlerin Özellikleri: Bir kutup noktasından başlayıp diğer kutup noktasında birleşen, paralelleri dik kesen yarım çember yaylarıdır. Başlangıç meridyeni İngiltere\'deki Greenwich (0°) gözlemevidir.',
        'Meridyen Sayısı ve Boyları: 180 Doğu ve 180 Batı olmak üzere toplam 360 meridyen yayı vardır. Bütün meridyenlerin boyları birbirine eşittir.',
        'Meridyenler Arası Mesafe: İki meridyen arasındaki mesafe sadece Ekvator üzerinde 111 km\'dir; kutuplara doğru gidildikçe meridyenler kutup noktalarında birleştiği için aralarındaki mesafe daralır. Türkiye\'de ardışık iki meridyen arası mesafe yaklaşık 85-86 km\'dir.',
        'Zaman Farkı Sabiti: Çizgisel hızın kutuplara doğru azalması nedeniyle ardışık iki meridyen arasındaki yerel saat farkı Dünya\'nın her yerinde değişmez biçimde tam 4 DAKİKADIR.'
      ],
      goldenRule: 'PARALEL MESAFESİ SABİT, MERİDYEN MESAFESİ DEĞİŞKENDİR: Ardışık iki paralel arasındaki mesafe Dünya\'nın her yerinde 111 km iken; meridyenler arasındaki mesafe sadece Ekvator\'da 111 km\'dir ve kutuplara gidildikçe daralır.',
      osymTrap: 'ÖSYM TUZAĞI: Türkiye\'de kuzeye gidildikçe iki meridyen arasındaki mesafe daralır; fakat ardışık iki paralel arasındaki 111 km\'lik mesafe KESİNLİKLE DEĞİŞMEZ!'
    ),
    LectureSection(
      title: 'Türkiye\'nin Göreceli (Özel) Konumu, Jeopolitiği ve Sınır Kapıları Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye; Asya, Avrupa ve Afrika kıtalarının birbirine en çok yaklaştığı kavşak noktasında yer alır. Karadeniz ile Akdeniz\'i birbirine bağlayan İstanbul ve Çanakkale boğazlarına sahiptir. Kafkasya, Orta Doğu ve Hazar havzasının zengin petrol/doğalgaz rezervleri ile sanayileşmiş Avrupa tüketim merkezleri arasında stratejik bir enerji ve transit ticaret köprüsüdür.',
      bulletPoints: [
        'Üç Tarafı Denizlerle Çevrili Yarımada Konumu: Kıyı kesimlerinde ılıman denizel iklim, iç kesimlerde ise yüksek dağ sıralarının etkisiyle karasal iklim egemendir.',
        'Ortalama Yükselti ve Engebe: Türkiye ortalama 1132 metre yükseltiye sahiptir. Batıdan doğuya doğru yükselti artar; bu durum sıcaklıkların azalmasına, tarım ürünlerinin daha geç olgunlaşmasına ve kış mevsiminin daha sert geçmesine yol açar.',
        'Kısa Mesafelerde İklim ve Bitki Değişimi: Yer şekillerinin kısa mesafelerde büyük farklılıklar göstermesi nedeniyle aynı anda farklı iklim ve mevsim özellikleri yaşanır; bu da tarım ve turizm çeşitliliğini olağanüstü zenginleştirir.',
        'Genç Oluşumlu Arazi: Alp-Himalaya orojenez kuşağında yer alması nedeniyle diri fay hatları, depremsellik, sıcak su kaynakları ve jeotermal potansiyel çok yüksektir.'
      ],
      mapData: LectureMapData(
        title: 'TÜRKİYE\'NİN SINIRLARI, UÇ NOKTALARI VE GÜMRÜK KAPILARI',
        subtitle: 'ÖSYM Sınav Formatında Kara Sınırları, Demiryolu Hatları ve Transit Koridorlar',
        mapId: 'cografya_sinir_kapilari_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_sinir_kapilari.jpg',
        mapSource: 'cografyaharita.com - Türkiye Sınır Kapıları Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '▲', label: 'En İşlek Kara ve Transit Kapıları', description: 'Kapıkule (Bulgaristan / Avrupa tır koridoru) ve Habur (Irak / Orta Doğu tır arteri).'),
          MapLegendItem(symbol: '🚂', label: 'Demiryolu Bağlantılı Sınır Kapıları', description: 'Kapıkule, Uzunköprü (Yunanistan), Kapıköy (İran), Canbaz (Gürcistan / Bakü-Tiflis-Kars), Nusaybin, Çobanbey, İslahiye (Suriye).'),
          MapLegendItem(symbol: '🪪', label: 'Kimlikle (Pasaportsuz) Geçiş Kapıları', description: 'Sarp (Gürcistan / Hopa) ve Dilucu (Nahçıvan-Azerbaycan / Iğdır - Hasret Köprüsü).'),
          MapLegendItem(symbol: '🚫', label: 'Siyasi Nedenlerle Kapalı Kapılar', description: 'Akyaka (demiryolu) ve Alican (karayolu) - Ermenistan sınırında 1993\'ten beri kapalıdır.'),
          MapLegendItem(symbol: '📏', label: 'Sınır Uzunlukları & Tarihî Antlaşmalar', description: 'En uzun sınır: Suriye (911 km), En kısa sınır: Nahçıvan (18 km). En eski sınır: İran (1639 Kasr-ı Şirin), En yeni sınır: Suriye (1939 Hatay\'ın katılımı).'),
          MapLegendItem(symbol: '📍', label: 'Türkiye\'nin Coğrafi Uç Noktaları', description: 'Kuzey: Sinop İnceburun (42° K), Güney: Hatay Topraktutan / Beysun (36° K), Doğu: Iğdır Dilucu (45° D), Batı: Çanakkale Gökçeada İnceburun (26° D).')
        ],
        points: [
          MapFrontItem(
            name: 'Kapıkule Sınır Kapısı (Edirne / Bulgaristan)',
            category: 'Avrupa\'ya En İşlek Kapı',
            commander: 'Marmara / Edirne (Meriç Hattı)',
            keyEvent: 'Türkiye\'nin ve dünyanın en işlek kara sınır kapılarından biridir. Hem karayolu hem demiryolu bağlantısı bulunur. Avrupa Birliği ile Türkiye arasındaki dış ticaret ve gurbetçi trafiğinin ana merkezidir.',
            outcome: 'ÖSYM Çıkmış Soru: Türkiye\'nin dış ticaret hacmi ve araç giriş-çıkışında 1 numaralı sınır kapısıdır.'
          ),
          MapFrontItem(
            name: 'Habur Sınır Kapısı (Şırnak - Silopi / Irak)',
            category: 'Orta Doğu Transit Koridoru',
            commander: 'Güneydoğu Anadolu / Şırnak (Dicle Havzası)',
            keyEvent: 'Türkiye\'nin Orta Doğu pazarına açılan en stratejik kapısıdır. Kapıkule\'den sonra Türkiye\'nin en çok tır giriş-çıkışı yapılan 2. sınır kapısıdır.',
            outcome: 'ÖSYM Kritik Tuzak: Irak ile demiryolu bağlantımız YOKTUR; Habur yalnızca karayolu transit kapısıdır!'
          ),
          MapFrontItem(
            name: 'Sarp Sınır Kapısı (Artvin - Hopa / Gürcistan)',
            category: 'Kafkasya & Karadeniz Koridoru',
            commander: 'Doğu Karadeniz / Artvin (Sarp Köyü)',
            keyEvent: 'Karadeniz sahil yolu güzergahında yer alır. Türk vatandaşlarının Gürcistan\'a yeni çipli kimlik kartıyla pasaportsuz giriş yapabildiği çok yoğun bir turizm ve ticaret kapısıdır.',
            outcome: 'ÖSYM Sorusu: Doğu Karadeniz sahilinde yer alan ve Kafkaslara açılan en önemli kapımızdır.'
          ),
          MapFrontItem(
            name: 'Canbaz İstasyonu / Türkgözü & Aktaş (Ardahan / Gürcistan)',
            category: 'Bakü-Tiflis-Kars Demiryolu',
            commander: 'Doğu Anadolu / Ardahan (Çıldır Havzası)',
            keyEvent: 'Tarihi İpek Yolu\'nu raylarla Pekin\'den Londra\'ya bağlayan Bakü-Tiflis-Kars (BTK) demiryolu hattının Türkiye\'deki gümrük kontrol ve sınır istasyonu Canbaz İstasyonu\'dur.',
            outcome: 'ÖSYM Güncel Bilgi: Demir İpek Yolu projesinin Gürcistan sınırındaki demiryolu gümrük kapısı Canbaz\'dır.'
          ),
          MapFrontItem(
            name: 'Gürbulak Sınır Kapısı (Ağrı - Doğubayazıt / İran)',
            category: 'Tarihî İpek Yolu Kapısı',
            commander: 'Doğu Anadolu / Ağrı (Doğubayazıt)',
            keyEvent: 'Türkiye\'nin İran ile olan en işlek ve en büyük karayolu sınır kapısıdır. Trabzon Limanı\'ndan gelen transit tırların Tebriz ve Tahran\'a ulaştığı E-80 uluslararası karayolunun kilit noktasıdır.',
            outcome: 'ÖSYM Sorusu: İran ile en büyük transit ticaret ve tır taşımacılığı Gürbulak üzerinden yürütülür.'
          ),
          MapFrontItem(
            name: 'Kapıköy Sınır Kapısı (Van - Saray / İran)',
            category: 'İran Demiryolu Hattı',
            commander: 'Doğu Anadolu / Van (Saray)',
            keyEvent: 'Türkiye ile İran arasındaki demiryolu taşımacılığının yapıldığı kapıdır. Trenler Van Gölü feribotu (Tatvan-Van) üzerinden geçerek Kapıköy\'den Tahran\'a ulaşır.',
            outcome: 'ÖSYM Sorusu: İran ile demiryolu bağlantısı bulunan tek sınır kapımız Kapıköy\'dür.'
          ),
          MapFrontItem(
            name: 'Dilucu Sınır Kapısı (Iğdır - Aralık / Nahçıvan - Azerbaycan)',
            category: 'Türk Dünyasına Açılan Kapı',
            commander: 'Doğu Anadolu / Iğdır (Aras Nehri / Hasret Köprüsü)',
            keyEvent: 'Türkiye\'nin Azerbaycan toprağı olan Nahçıvan Özerk Cumhuriyeti ile olan tek doğrudan sınır kapısıdır. Zengezur Koridoru açıldığında stratejik önemi katlanarak artacaktır.',
            outcome: 'ÖSYM Sınav Bilgisi: En kısa kara sınırımız Nahçıvan (Azerbaycan) iledir (~18 km) ve Dilucu Kapısı buradadır.'
          ),
          MapFrontItem(
            name: 'İpsala & Uzunköprü Sınır Kapıları (Edirne / Yunanistan)',
            category: 'Yunanistan ve Ege Bağlantısı',
            commander: 'Marmara / Edirne (Meriç Nehri Boyu)',
            keyEvent: 'İpsala karayolu ile Selanik ve Atina\'ya en yoğun geçiş noktasıdır. Uzunköprü ise Türkiye\'nin Yunanistan ile demiryolu bağlantısını sağlayan tarihi kapıdır.',
            outcome: 'ÖSYM Püf Noktası: Yunanistan ile demiryolu kapısı Uzunköprü, en işlek karayolu kapısı ise İpsala\'dır.'
          ),
          MapFrontItem(
            name: 'Cilvegözü & Öncüpınar & Nusaybin (Suriye Sınırı)',
            category: 'En Uzun Sınırımız (911 km)',
            commander: 'Akdeniz - Güneydoğu / Hatay, Kilis, Mardin',
            keyEvent: 'Türkiye\'nin en uzun kara sınırı Suriye iledir. Nusaybin ve Çobanbey demiryolu bağlantısına sahiptir. Cilvegözü (Hatay/Reyhanlı) insani ve ticari geçişlerde öne çıkar.',
            outcome: 'ÖSYM Sorusu: Türkiye\'nin en son çizilen ve en uzun kara sınırı Suriye sınırıdır (1939).'
          ),
          MapFrontItem(
            name: 'Akyaka & Alican Kapıları (Kars - Iğdır / Ermenistan)',
            category: 'Siyasi Nedenlerle Kapalı',
            commander: 'Doğu Anadolu / Kars (Akyaka) & Iğdır (Alican)',
            keyEvent: 'Ermenistan\'ın Karabağ\'ı işgali sonrası 1993 yılında kapatılmıştır. Akyaka demiryolu, Alican ise karayolu kapısıdır.',
            outcome: 'ÖSYM Soru Tuzağı: Ermenistan ile demiryolu rayları fiziki olarak mevcut olmasına rağmen siyasi sebeplerle fiilen kapalıdır.'
          )
        ],
        historicalNote: '📌 ÖSYM KPSS SINAVINDA EN ÇOK SORULAN SINIR KAPISI VE KONUM TUZAKLARI:\n'
            '1. Demiryolu Bağlantısı OLMAYAN Komşularımız: Irak (Habur sadece karayoludur) ve fiilen kapalı olan Ermenistan.\n'
            '2. Demiryolu Bağlantısı OLAN Komşularımız: Bulgaristan (Kapıkule), Yunanistan (Uzunköprü), Gürcistan (Canbaz), İran (Kapıköy), Suriye (Nusaybin, Çobanbey, İslahiye).\n'
            '3. En Eski ve Değişmeyen Sınır: 1639 Kasr-ı Şirin Antlaşması ile İran sınırıdır (Zağros Dağları su bölümü çizgisi doğal sınırdır).\n'
            '4. En Yeni (Son Çizilen) Sınır: 1939\'da Hatay\'ın anavatana katılmasıyla kesinleşen Suriye sınırıdır.\n'
            '5. Pasaportsuz (Kimlikle) Geçilebilen Komşular: Gürcistan (Sarp) ve Azerbaycan-Nahçıvan (Dilucu).'
      )
    ),
    LectureSection(
      title: 'Coğrafi Koordinat Izgarası ve Türkiye\'nin Matematik Sınırları',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_koordinat_izgarasi.png',
      imageCaption: 'Şekil 1.2: 36°-42° Kuzey Paralelleri ile 26°-45° Doğu Meridyenleri Koordinat Şebekesi',
      leadText: 'Türkiye\'nin dünya üzerindeki mutlak koordinatları, sınır uç noktaları ve bu koordinat ağının getirdiği coğrafi sonuçlar:',
      bulletPoints: [
        'Kuzey Sınırı: 42° Kuzey Paraleli - Sinop İnceburun.',
        'Güney Sınırı: 36° Kuzey Paraleli - Hatay Yayladağı Topraktutan Köyü (Beysun).',
        'Doğu Sınırı: 45° Doğu Meridyeni - Iğdır Aralık Dilucu Sınır Kapısı.',
        'Batı Sınırı: 26° Doğu Meridyeni - Çanakkale Gökçeada İnceburun (Avlakaburnu).',
        'Kuzey-Güney Kuş Uçumu Mesafe: 42 - 36 = 6 paralel farkı vardır. 6 x 111 km = 666 km kuş uçumu mesafe bulunur.',
        'Doğu-Batı Meridyen Farkı: 45 - 26 = 19 meridyen farkı vardır. 19 x 4 dk = 76 dakika (1 saat 16 dakika) yerel saat farkı oluşur.'
      ],
      goldenRule: 'KUŞ UÇUMU MESAFE HESABI: Yalnızca kuzey-güney yönlü paralel farkında 111 km ile çarpılarak kesin mesafe bulunabilir. Doğu-batı meridyenleri arası mesafe Türkiye\'de kutuplara yaklaştıkça daraldığı için 111 ile çarpılamaz!',
      osymTrap: 'ÖSYM TUZAĞI: 19 meridyen farkını 111 ile çarpıp doğu-batı mesafesini hesaplamak büyük bir sınav hatasıdır. Meridyenler arası sadece Ekvator üzerinde 111 km\'dir.'
    ),
    LectureSection(
      title: 'Yerel Saat Hesaplamaları, Boylam ve Greenwich Başlangıcı',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/cografya/cografya_meridyenler_greenwich.png',
      imageCaption: 'Şekil 1.3: Başlangıç Meridyeni Greenwich ve Doğu-Batı Meridyen Yayları Dağılımı',
      leadText: 'Dünya kendi ekseni etrafında batıdan doğuya doğru döndüğü için Güneş doğuda daha erken doğar ve daha erken batar. Bu nedenle doğudaki boylamların yerel saati batıdakilere göre daima İLERİDİR.',
      bulletPoints: [
        'Yerel Saat Farkı Formülü: İki merkez arasındaki boylam farkı hesaplanır. Merkezler aynı yarım kürede ise boylam dereceleri çıkarılır; farklı yarım kürelerde ise toplanır. Bulunan meridyen farkı 4 dakika ile çarpılarak zaman farkı bulunur.',
        'Doğu-Batı Yön Kuralı: Daha doğudaki bir noktanın yerel saati hesaplanırken bulunan zaman farkı EKLENİR; daha batıdaki bir nokta hesaplanırken bulunan zaman farkı ÇIKARILIR.',
        'Güneşin Ufuktaki Tepe Konumu: Bir noktada Güneş gökyüzünde en yüksek noktaya ulaştığı an (öğle vakti) yerel saat tam 12.00\'dir. Güneş daha doğudaki bir merkezde tepe noktasını geçmişken, batıdaki bir merkezde henüz tepe noktasına ulaşmamıştır.',
        'Gölge Boyu Dinamiği: Yerel saat 12.00 olduğunda Güneş o günkü en dik açısıyla gelir ve cisimlerin gün içindeki gölge boyu EN KISA seviyesine ulaşır.'
      ],
      goldenRule: 'AYNI BOYLAM ÜZERİNDEKİ TÜM NOKTALARDA: Yıl boyunca yerel saat, öğle vakti (Güneşin en tepeye çıktığı an) ve gün içindeki en kısa gölge anı AYNIDIR. Ancak Güneşin doğuş ve batış saati sadece 21 Mart ve 23 Eylül ekinokslarında aynıdır.',
      osymTrap: 'ÖSYM TUZAĞI: Aynı boylam üzerindeki noktalarda yerel saat her gün aynıdır; fakat Güneşin doğuş ve batış saatleri ekinokslar (21 Mart - 23 Eylül) DIŞINDA ASLA AYNI DEĞİLDİR!'
    ),
    LectureSection(
      title: 'Uluslararası Saat Dilimleri ve Türkiye\'nin İleri Saat Uygulaması (+3 GMT)',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_saat_dilimleri_haritasi.png',
      imageCaption: 'Şekil 1.4: Dünya Saat Dilimleri Haritası ve Türkiye (+3 Iğdır / GMT+3)',
      leadText: 'Dünya üzerinde her 15 derecelik meridyen yayı bir uluslararası saat dilimini oluşturur (360° / 24 saat = 15°):',
      bulletPoints: [
        'Saat Dilimi Dağılımı: Başlangıç Meridyeni Greenwich (0°) merkezli 7.5° Batı ile 7.5° Doğu arası 0. (ve 24.) saat dilimidir. Doğuya doğru +1, +2, +3... +12; batıya doğru -1, -2, -3... -12 şeklinde ilerler.',
        'Türkiye\'nin Saat Dilimleri: Türkiye\'den 2. Saat Dilimi (30° Doğu - İzmit) ve 3. Saat Dilimi (45° Doğu - Iğdır) geçer.',
        'Kalıcı Yaz Saati Uygulaması: 2016 yılından itibaren Türkiye\'de kış saati uygulaması kaldırılmış olup, yıl boyunca 45° Doğu Iğdır meridyeninin yerel saati Ulusal (Ortak) Saat (+3. Saat Dilimi) olarak kullanılmaktadır.',
        'Ulusal Saat ile Yerel Saat Farkı: Kışın batı illerimizde (İzmir, Çanakkale, Edirne) ulusal saat ile yerel saat arasındaki fark artar; Iğdır ve çevre illerde ise fark sıfıra yaklaşır.'
      ],
      goldenRule: 'ORTAK SAAT FARKI KURALI: 45° Doğu Iğdır\'a ne kadar uzaksanız (yani ne kadar batıdaysanız) ulusal ortak saat ile yerel saatiniz arasındaki fark o kadar BÜYÜKTÜR (Edirne ve Çanakkale\'de fark en fazladır).',
      osymTrap: 'ÖSYM TUZAĞI: Türkiye artık kışın 2. saat dilimine GEÇMEMEKTEDİR! Yıl boyunca kesintisiz +3. Saat Dilimi (45° Doğu Iğdır) kullanılmaktadır.'
    ),
    LectureSection(
      title: 'Türkiye\'nin Mutlak (Matematik) Konumu ve Coğrafi Sonuçları',
      type: LectureSectionType.comparison,
      imageAssetPath: 'assets/images/cografya/cografya_turkiyenin_ozel_konumu_dort_mevsim.png',
      imageCaption: 'Şekil 1.5: Türkiye\'nin Coğrafi Konumu, Matematik Kuşak ve Dört Mevsim Karakteri',
      leadText: 'Türkiye, 36° - 42° Kuzey Paralelleri ile 26° - 45° Doğu Meridyenleri arasında, Kuzey Yarım Küre\'de ve Orta Kuşak\'ta yer alır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Orta Kuşak\'ta Yer Alması (A-B-C-D Kuralı)',
          wrong: '1) Akdeniz İklim kuşağında yer alır.\n2) Batı rüzgarları kuşağındadır.\n3) Cephesel (Frontal) yağışlar görülür.\n4) Dört mevsim belirgin yaşanır.',
          note: 'Matematiksel enlem konumunun doğrudan sonucudur.'
        ),
        ComparisonRow(
          correct: 'Yengeç Dönencesi Dışında Yer Alması',
          wrong: 'Güneş ışınları hiçbir zaman dik (90°) açıyla gelmez.\nGölge boyu hiçbir zaman sıfır olmaz.\nBakı yönü daima güneydir. Dağların güney yamaçları daha çok ısınır.',
          note: 'Dönenceler dışında kalan tüm Kuzey Yarım Küre ülkeleri için geçerlidir.'
        ),
        ComparisonRow(
          correct: 'Güneyden Kuzeye Gidildikçe Değişenler (Enlem Etkisi)',
          wrong: 'Güneş ışınlarının geliş açısı küçülür, sıcaklıklar azalır.\nÇizgisel dönüş hızı azalır, yerçekimi artar.\nAlacakaranlık (şafak/grup) süresi uzar.\nDenizlerin tuzluluk oranı azalır (Akdeniz %38 > Ege %33 > Karadeniz %18).',
          note: 'Ekvator\'dan kutuplara doğru küresel şekil ve enlem sonucudur.'
        ),
        ComparisonRow(
          correct: 'Doğu - Batı Boylam Farkının Sonuçları',
          wrong: 'En doğusu (45° Iğdır Dilucu) ile en batısı (26° Çanakkale Gökçeada) arasında 19 meridyen ve 76 dakikalık yerel saat farkı bulunur.',
          note: 'Doğu-batı yönlü genişlik zaman farkını belirler.'
        ),
      ],
      goldenRule: 'TÜRKİYE DÖNENCELER DIŞINDADIR: Türkiye\'de dağların güney yamaçları yıl boyunca daima kuzey yamaçlardan daha fazla güneş enerjisi alır (Bakı Etkisi). Karadeniz kıyısındaki dağların kuzey yamacının kışın daha ılık olması ise denizellikten kaynaklanan bir ÖZEL KONUM istisnasıdır.',
      osymTrap: 'ÖSYM TUZAĞI: "Aynı anda farklı mevsim özelliklerinin yaşanması" (örneğin Antalya\'da denize girilirken aynı gün Toroslar\'da kayak yapılması) ÖZEL KONUMDUR. "Yıl içinde dört mevsimin belirgin yaşanması" ise MUTLAK KONUMDUR.'
    ),
    LectureSection(
      title: 'Özel Tarihler ve Gündönümlerinde Türkiye (Solstisler ve Ekinokslar)',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_21haziran_solstis.png',
      imageCaption: 'Şekil 1.6: 21 Haziran Yaz Gündönümü ve Güneş Işınlarının Geliş Açısı',
      leadText: 'Dünya\'nın 23° 27\' eksen eğikliği ve yıllık hareketi nedeniyle yıl içinde mevsimler değişir, Güneşin geliş açısı ve gündüz-gece süreleri farklılaşır:',
      bulletPoints: [
        '21 Haziran (Yaz Gündönümü - Solstis): Güneş ışınları Yengeç Dönencesi\'ne dik gelir. Kuzey Yarım Küre\'de ve Türkiye\'de yaz mevsimi başlar. Türkiye\'de yılın en uzun gündüzü ve en kısa gecesi yaşanır. Türkiye\'de güneyden kuzeye doğru gidildikçe gündüz süresi uzar (En uzun gündüz Sinop İnceburun\'da). Bu tarihten sonra gündüzler kısalmaya, geceler uzamaya başlar.',
        '21 Aralık (Kış Gündönümü - Solstis): Güneş ışınları Oğlak Dönencesi\'ne dik gelir. Türkiye\'de kış mevsimi başlar. Yılın en uzun gecesi ve en kısa gündüzü yaşanır. Türkiye\'de kuzeyden güneye doğru gidildikçe gündüz süresi uzar (En uzun gündüz Hatay Topraktutan\'da). Bu tarihten sonra gündüzler uzamaya, geceler kısalmaya başlar.',
        '21 Mart ve 23 Eylül (Ekinoks - Gece Gündüz Eşitliği): Güneş ışınları Ekvator\'a dik düşer. Aydınlanma çemberi kutup noktalarından teğet geçer. Dünyanın her yerinde gece ve gündüz süreleri eşittir (12 saat gündüz, 12 saat gece). Aynı meridyen üzerindeki bütün noktalarda Güneş aynı anda doğar ve aynı anda batar.',
        'Aydınlanma Çemberinin Hareketi: Aydınlanma çemberi yıl içinde kutup noktaları (ekinokslar) ile kutup daireleri (solstisler) arasında sürekli yer değiştirir.'
      ],
      goldenRule: 'GÜNDÜZ SÜRESİ KURALI: 21 Haziran\'da Türkiye\'de ne kadar KUZEYE giderseniz gündüz o kadar uzundur (Sinop en uzun gündüz). 21 Aralık\'ta ise ne kadar GÜNEYE giderseniz gündüz o kadar uzundur (Hatay en uzun gündüz).',
      osymTrap: 'ÖSYM TUZAĞI: 21 Haziran\'dan sonra gündüzler kısalmaya başlar; fakat 23 Eylül\'e kadar gündüz süreleri gecelerden DAHA UZUNDUR! Kısaldı diye geceden kısa sanmak en yaygın sınav hatasıdır.'
    ),
    LectureSection(
      title: '21 Haziran Yaz Gündönümü ve Aydınlanma Çemberi Şeması',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_21haziran_gunes_isinlari_aydinlanma.png',
      imageCaption: 'Şekil 1.7: 21 Haziran Güneş Işınlarının Geliş Açısı ve Aydınlanma Çemberi Konumu',
      leadText: '21 Haziran tarihinde Güneş ışınları 23° 27\' Kuzey enlemi olan Yengeç Dönencesi\'ne öğle vakti 90° dik açıyla düşer:',
      bulletPoints: [
        'Aydınlanma Çemberi: Kuzey Kutup Dairesi\'ne (66° 33\' K) ve Güney Kutup Dairesi\'ne (66° 33\' G) teğet geçer.',
        'Kuzey Kutup Bölgesi: Kuzey Kutup Dairesi içerisinde kalan alanlar 24 saat boyunca aydınlıktır (gündüz yaşanır).',
        'Türkiye\'de Güneş Açısı: Türkiye\'ye güneş ışınları yıl içindeki en büyük açıyla gelir (Hatay\'a yaklaşık 77.5°, Sinop\'a yaklaşık 71.5°).',
        'Gölge Boyu: Türkiye\'de cisimlerin yıl içindeki en kısa gölge boyu 21 Haziran günü öğle saat 12.00\'de ölçülür.'
      ],
      goldenRule: 'GÖLGE ASLA SIFIR OLMAZ: Türkiye Yengeç Dönencesi\'nin kuzeyinde yer aldığı için 21 Haziran\'da bile gölge boyu hiçbir zaman sıfır (yok) olmaz.',
      osymTrap: 'ÖSYM TUZAĞI: "21 Haziran\'da Türkiye\'de öğle vakti gölge oluşmaz" ifadesi kesinlikle YANLIŞTIR. Yalnızca dönenceler arasına dik düşer.'
    ),
    LectureSection(
      title: '21 Aralık Kış Gündönümü ve Gece-Gündüz Süreleri Dağılımı',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_21aralik_gunes_isinlari_gece_gunduz.png',
      imageCaption: 'Şekil 1.8: 21 Aralık Kış Solstisi ve Türkiye\'de Gece-Gündüz Süreleri Dağılımı',
      leadText: '21 Aralık tarihinde Güneş ışınları 23° 27\' Güney enlemi olan Oğlak Dönencesi\'ne dik düşer:',
      bulletPoints: [
        'Türkiye\'de En Uzun Gece: Kuzey Yarım Küre\'de ve Türkiye\'de yılın en uzun gecesi, en kısa gündüzü yaşanır.',
        'Kuzeye Gidildikçe Gece Uzar: Sinop\'ta gece süresi yaklaşık 15 saat 6 dakika iken, Hatay\'da yaklaşık 14 saattir.',
        'Gölge Boyu: Türkiye\'de güneş ışınları yıl içindeki en dar/eğik açıyla gelir; bu nedenle yılın EN UZUN gölge boyu 21 Aralık günü öğle vakti ölçülür.',
        'Gündüzlerin Uzamaya Başlaması: 21 Aralık\'tan sonra gündüzler uzamaya, geceler kısalmaya başlar; ancak 21 Mart\'a kadar geceler gündüzlerden uzundur.'
      ],
      goldenRule: '21 ARALIKTA GÜNEYE GİDEN GÜNDÜZÜ UZATIR: Kışın Türkiye\'de güneye doğru seyahat eden biri gündüzlerin uzadığını, gecelerin kısaldığını gözlemler.',
      osymTrap: 'ÖSYM TUZAĞI: 21 Aralık\'tan sonra geceler kısalmaya başlar fakat 21 Mart\'a kadar geceler gündüzlerden UZUNDUR.'
    ),
    LectureSection(
      title: '21 Aralık Kış Solstisi ve Güneş Işınlarının Geliş Açısı',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_21aralik_solstis.png',
      imageCaption: 'Şekil 1.9: 21 Aralık Kış Gündönümünde Oğlak Dönencesi ve Türkiye\'de Gölge Boyları',
      leadText: 'Dünya\'nın kış gündönümü geometrisi ve güneş ışınlarının açısı:',
      bulletPoints: [
        'Aydınlanma Çemberi: Kutup dairelerinden teğet geçer. Kuzey Kutup Dairesi tamamen karanlıkta (24 saat gece) kalır.',
        'Isı Kaybı: Güneş ışınları atmosferde çok uzun yol katettiği için tutulma oranı artar ve yüzeye ulaşan enerji azalır (kış mevsimi).',
        'Bakı Yamaçları: Güneş ışınları güneyden geldiği için dağların güney yamaçları daha fazla ışık alır.'
      ],
      goldenRule: 'BAKI ETKİSİ KIŞIN DAHA BELİRGİNDİR: Kışın güneş ışınlarının açısı daraldığı için güney yamaçlar ile kuzey yamaçlar arasındaki sıcaklık farkı belirginleşir.',
      osymTrap: 'ÖSYM TUZAĞI: Karadeniz dağlarının kuzey yamacının kışın ılık olması bakı değil denizelliktir.'
    ),
    LectureSection(
      title: '21 Mart ve 23 Eylül Ekinoksları (Gece-Gündüz Eşitliği)',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_ekinoks_21mart_23eylul.png',
      imageCaption: 'Şekil 1.10: Ekinoks Tarihlerinde Güneş Işınlarının Ekvator\'a Gelişi ve Aydınlanma',
      leadText: '21 Mart ve 23 Eylül ekinoks tarihlerinde Dünya\'nın her yerinde 12 saat gündüz ve 12 saat gece yaşanır:',
      bulletPoints: [
        'Ekvator\'a Dik Geliş: Güneş ışınları öğle vakti Ekvator\'a 90° dik açıyla düşer.',
        'Aydınlanma Çemberi: Kutup noktalarından (90° K ve 90° G) teğet geçer.',
        'Aynı Boylamda Güneş: Yalnızca ekinoks günlerinde, aynı boylam üzerindeki bütün noktalarda Güneş aynı anda doğar ve 12 saat sonra aynı anda batar.',
        'Bahar Başlangıçları: 21 Mart Türkiye\'de ilkbaharın, 23 Eylül ise sonbaharın başlangıcıdır.'
      ],
      goldenRule: 'AYNI ANDA DOĞUŞ SADECE EKİNOKSTA: Aynı meridyen üzerinde güneşin aynı anda doğup batması SADECE 21 Mart ve 23 Eylül tarihlerinde gerçekleşir!',
      osymTrap: 'ÖSYM TUZAĞI: "Aynı boylamda yerel saat her gün aynıdır, güneş her gün aynı anda doğar" yanılgısına düşmeyin. Güneş sadece ekinokslarda aynı anda doğar.'
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Coğrafi Konum ve Jeopolitik',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Türkiye\'de aynı gün ve saatte Antalya kıyılarında denize girilebilirken, Erzurum Palandöken\'de kayak yapılabilmesi aşağıdakilerden hangisiyle doğrudan açıklanır?',
          options: [
            'A) Türkiye\'nin Orta Kuşak\'ta yer almasıyla',
            'B) Başlangıç Meridyeni\'nin doğusunda bulunmasıyla',
            'C) Kısa mesafelerde yer şekilleri ve yükseltinin hızla değişmesiyle',
            'D) Yıllık sıcaklık farkının batıdan doğuya azalmasıyla',
            'E) Bakı yönünün daima güney olmasıyla'
          ],
          correctIndex: 2,
          explanation: 'Aynı anda farklı mevsim ve iklim özelliklerinin yaşanması (Antalya\'da deniz, Erzurum\'da kar) kısa mesafede yükselti ve yer şekillerinin değişmesinin yani GÖRECELİ (ÖZEL) KONUMUN sonucudur. Yıl içinde 4 mevsimin belirgin yaşanması ise Orta Kuşak (Mutlak Konum) sonucudur.',
          ruleTag: 'Göreceli Konum vs Mutlak Konum'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu1 = konu1CografiKonum;
