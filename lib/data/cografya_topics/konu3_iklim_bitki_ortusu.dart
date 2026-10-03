// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu3IklimBitkiOrtusu = LectureTopic(
  id: 'cografya_iklim_bitki_ortusu',
  courseId: 'cografya',
  order: 3,
  title: 'Türkiye\'nin İklimi, Sıcaklık ve Bitki Örtüsü',
  subtitle: 'Sıcaklık Dağılışı, Basınç Merkezleri, Rüzgarlar, Nem, Yağış Tipleri ve Bitki Formasyonları',
  icon: Icons.wb_sunny_rounded,
  color: const Color(0xFFF59E0B),
  testRange: 'Test 21 - 30',
  startTestNum: 21,
  endTestNum: 30,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'nin İklimini Etkileyen Faktörler ve Sıcaklık Dağılışı',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin iklimi; matematik konum (Orta Kuşak, Yengeç Dönencesi dışı) ve özel konum şartlarının (etrafındaki denizler, yükselti, dağların uzanışı, çevresindeki basınç merkezleri) ortak etkisiyle şekillenir. Türkiye\'de kısa mesafelerde çok farklı iklim tiplerine rastlanır.',
      bulletPoints: [
        'Enlem ve Güneş Işınları: Güneyden kuzeye doğru gidildikçe Güneş ışınlarının geliş açısı küçülür, bu nedenle yıllık ortalama sıcaklıklar güneyden kuzeye doğru genel olarak azalır (Akdeniz > Marmara > Karadeniz).',
        'Denizellik ve Karasallık: Deniz kıyısındaki yerlerde nem oranı yüksek olduğu için aşırı ısınma ve aşırı soğuma gerçekleşmez, günlük ve yıllık sıcaklık farkları azdır. İç kesimlerde ise karasallık ve nemsizlik nedeniyle sıcaklık farkları çok yüksektir.',
        'Yükseltinin Sıcaklığa Etkisi: Troposferde her 200 metrede sıcaklık 1°C azalır. Batıdan doğuya doğru yükselti arttığı için ortalama sıcaklıklar azalır ve donlu gün sayısı artar.',
        'Gerçek Sıcaklık vs İndirgenmiş Sıcaklık: Bir yerin termometreyle ölçülen sıcaklığına gerçek sıcaklık denir. Yükseltinin yok sayılarak deniz seviyesine (0 m) uyarlandığı sıcaklığa ise indirgenmiş sıcaklık denir. İki sıcaklık arasındaki fark o yerin yükseltisini gösterir (En büyük fark Doğu Anadolu\'da, en az fark Marmara\'dadır).',
        'Dağların Uzanışı ve Bakı: Dağların güney yamaçları (bakı) daha fazla ısınır. Karadeniz ve Akdeniz\'de dağlar kıyıya paralel uzandığı için denizel hava iç kısımlara giremez; Ege\'de ise dağlar dik uzandığı için 150-200 km içerilere kadar sokulur.'
      ],
      goldenRule: 'İNDİRGENMİŞ SICAKLIK FARKI: Gerçek sıcaklık ile indirgenmiş sıcaklık arasındaki fark ne kadar fazlaysa oranın ortalama yükseltisi o kadar FAZLADIR (Erzurum-Kars en fazla). Farkın en az olduğu bölge ise Marmara\'dır.',
      osymTrap: 'ÖSYM TUZAĞI: "İndirgenmiş sıcaklık" haritalarında YÜKSELTİNİN HİÇBİR ETKİSİ YOKTUR! İndirgenmiş haritada sıcaklık farkı görülüyorsa sebebi yükselti olamaz; enlem veya denizellik/karasallıktır.'
    ),
    LectureSection(
      title: 'Türkiye İklim Tipleri ve Dağılış Alanları Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_iklim_tipleri_haritasi.png',
      imageCaption: 'Şekil 3.1: Türkiye Makroklima Alanları Haritası (Akdeniz, Karadeniz, Karasal ve Sert Karasal)',
      leadText: 'Türkiye\'de yer şekillerinin çeşitliliği ve denizel etkilerin iç kesimlere sokulamaması 4 ana makroklima kuşağını ortaya çıkarmıştır:',
      bulletPoints: [
        'Karadeniz İklimi: Yıl boyu nemli ve yağışlıdır. En çok yağışı sonbaharda alır. Bitki örtüsü gür ormanlardır.',
        'Akdeniz İklimi: Yazlar sıcak ve kurak, kışlar ılık ve bol yağışlıdır. En çok yağışı kışın cephesel olarak alır. Bitki örtüsü kızılçam ve makidir.',
        'Ilıman Karasal (Step) İklimi: İç Anadolu, Doğu Anadolu vadileri ve Güneydoğu\'da etkilidir. En çok yağışını ilkbaharda konveksiyonel alır. Bitki örtüsü bozkırdır.',
        'Sert Karasal İklim: Erzurum, Kars ve Ardahan platolarında etkilidir. Kışlar çok sert ve uzun geçer. En çok yağışını yaz başında konveksiyonel alır. Bitki örtüsü alpin çayırlardır.'
      ],
      goldenRule: 'YAĞIŞ REJİMİ EN DÜZENLİ İKLİM KARADENİZDİR: Türkiye\'de sadece Karadeniz ikliminde kurak mevsim yoktur; her mevsim yağış görülür.',
      osymTrap: 'ÖSYM TUZAĞI: Akdeniz iklimi sadece Akdeniz kıyısında değil; Ege kıyılarında ve Güney Marmara kıyılarında da görülür.'
    ),
    LectureSection(
      title: 'Türkiye\'yi Etkileyen Basınç Merkezleri ve Rüzgârlar',
      type: LectureSectionType.formula,
      leadText: 'Türkiye, dinamik ve termik kökenli dört ana basınç merkezinin mevsimsel etkisi altındadır:',
      bulletPoints: [
        'Sibirya Termik Yüksek Basıncı (TYB): Kışın etkilidir. Doğu Anadolu ve tüm yurtta aşırı ayaz, dondurucu soğuk ve kar yağışı getirir.',
        'İzlanda Dinamik Alçak Basıncı (DAB): Kışın etkilidir. 60° enleminden gelir; kış mevsiminin ılık, yağışlı ve fırtınalı geçmesini sağlar.',
        'Asor Dinamik Yüksek Basıncı (DYB): 30° enleminden gelir. Yıl boyunca etkilidir ancak yazın Türkiye geneline yayılarak yaz kuraklığı ve kavurucu sıcaklara yol açar.',
        'Basra Termik Alçak Basıncı (TAB): Yazın Güneydoğu\'dan sokulur. Çöl kökenlidir; Güneydoğu ve İç Anadolu\'da aşırı sıcak, kuraklık ve buharlaşmaya neden olur.',
        'Yerel Rüzgârlar (KAYIP SAKAL Kodu):',
        '• Karayel (Kuzeybatı): Soğuk ve kuru, kışın kar getirir.\n• Yıldız (Kuzey): Karadeniz üzerinden gelir, serinletici ve yağış bırakır.\n• Poyraz (Kuzeydoğu): Kışın çok soğuk ve ayaz, yazın serinletir.\n• Samyeli/Keşişleme (Güneydoğu): Çöl kökenli, sıcak ve kurutucu, buharlaşmayı artırır.\n• Kıble (Güney): Akdeniz\'den gelir, sıcak ve nemlidir.\n• Lodos (Güneybatı): Sıcak ve nemli, kışın karları eritir (soba zehirlenmesi uyarısı).',
        'Fön Rüzgârı: Dağı aşıp yamaçtan aşağı inen havanın sürtünmeyle her 100 metrede 1°C ısınmasıyla oluşur. Havadaki nemi kurutur, karları hızla eritir (çığ riski), tarım ürünlerini erken olgunlaştırır (Rize\'de turunçgil mikroklimasını sağlar).'
      ],
      goldenRule: 'KAYIP SAKAL ŞİFRESİ: Kuzeyden esenler sıcaklığı DÜŞÜRÜR (Karayel, Yıldız, Poyraz); güneyden esenler sıcaklığı YÜKSELTİR (Samyeli, Kıble, Lodos). Bu durum Türkiye\'nin Kuzey Yarım Küre\'de olmasının doğrudan sonucudur.',
      osymTrap: 'ÖSYM TUZAĞI: Normalde yükselen hava her 200 m\'de 1°C soğur; ancak FÖN rüzgarı alçalırken her 100 METREDE 1°C ISINIR (iki kat daha hızlı ısınır)!'
    ),
    LectureSection(
      title: 'Türkiye\'yi Etkileyen Rüzgarlar ve Basınç Etki Alanları Haritası',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_yerel_ruzgarlar_kayip_sakal.png',
      imageCaption: 'Şekil 3.2: Türkiye Yerel Rüzgârları (KAYIP SAKAL Kodlaması) ve 4 Büyük Basınç Merkezi Atlası',
      leadText: 'Kuzey ve güney sektörlü rüzgarlar ile mevsimlik basınç koridorları harita üzerinde analiz edilmiştir:',
      bulletPoints: [
        'Kuzey Sektörlü Rüzgarlar: Karayel, Yıldız ve Poyraz kuzey yarımküre enlem etkisiyle sıcaklığı düşürür ve kışın kar yağışını tetikler.',
        'Güney Sektörlü Rüzgarlar: Lodos, Kıble ve Samyeli güneyden gelerek sıcaklığı artırır; lodos kış aylarında karları eritip taşkınlara sebep olur.',
        'Etezyen Rüzgarı: Yazın Ege Denizi üzerinden kuzeyden esen kuru ve serin rüzgardır.',
        'Meltem Rüzgarları: Günlük sıcaklık ve basınç farkıyla deniz-kara veya dağ-vadi arasında esen hafif yerel rüzgarlardır (yağış bırakmazlar).'
      ],
      goldenRule: 'MELTEM YAĞIŞ BIRAKMAZ: Meltem rüzgarları günlük rüzgarlardır ve etki alanları dar olduğu için kesinlikle yağış oluşturmazlar.',
      osymTrap: 'ÖSYM TUZAĞI: Lodos güneybatıdan estiği için sıcak ve nemlidir; kışın soba zehirlenmelerine ve ani kar erimeleriyle taşkınlara yol açar.'
    ),
    LectureSection(
      title: 'Türkiye\'de Nem, Yağış Çeşitleri ve Yağış Rejimleri',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye\'de üç farklı yağış oluşum tipi görülür ve dört belirgin iklim tipi egemendir:',
      comparisonRows: [
        ComparisonRow(
          correct: 'Orografik (Yamaç) Yağışlar',
          wrong: 'Denizden gelen nemli hava kütlelerinin kıyıya paralel uzanan dağ yamaçlarına çarparak yükselmesiyle oluşur.\nEn çok görüldüğü yerler: Doğu ve Batı Karadeniz, Muğla Menteşe Yöresi, Nur Dağları.\nEn fazla yağış SONBAHAR\'da düşer.',
          note: 'Dağların kıyıya paralel uzandığı kıyılarda yaygındır.'
        ),
        ComparisonRow(
          correct: 'Konveksiyonel (Yükselim) Yağışlar',
          wrong: 'Isınan havanın genleşerek dikey yönde yükselip soğumasıyla oluşur.\nİç Anadolu\'da İLKBAHARDA görülür (Halk arasında Kırkikindi Yağışları).\nErzurum-Kars platosunda ise YAZ mevsiminde görülür.',
          note: 'Güneşli günlerde yerin aşırı ısınması tetikler.'
        ),
        ComparisonRow(
          correct: 'Cephesel (Frontal) Yağışlar',
          wrong: 'Sıcak ve soğuk hava kütlelerinin karşılaşma alanlarında oluşur.\nTürkiye\'de Akdeniz, Ege ve Marmara\'da KIŞ aylarında yaygındır.\nTürkiye\'nin Orta Kuşak\'ta olmasının doğrudan kanıtıdır.',
          note: 'Mutlak konumun kanıtı olan tek yağış tipidir.'
        ),
        ComparisonRow(
          correct: 'Türkiye\'nin Başlıca İklim Tipleri',
          wrong: '1) Karadeniz İklimi: Her mevsim yağışlı, en çok sonbaharda, nem yüksek, yıllık sıcaklık farkı en az.\n2) Akdeniz İklimi: Yazlar sıcak ve kurak, kışlar ılık ve yağışlı, en çok kışın yağış alır.\n3) Karasal İklim: Yazlar sıcak-kurak, kışlar soğuk-kar yağışlı, en çok ilkbaharda yağış alır.\n4) Sert Karasal (Erzurum-Kars): Kışlar çok sert ve uzun, en çok yağış YAZIN düşer.',
          note: 'Yağış rejimleri ve en çok yağış aldıkları mevsimler farklıdır.'
        ),
      ],
      goldenRule: 'YAĞIŞ REJİMİ EN DÜZENLİ İKLİM: Türkiye\'de sadece Karadeniz İklimi her mevsim yağışlıdır ve rejimi düzenlidir. Türkiye\'nin en çok yağış alan yeri Rize (2400 mm üzeri), en az yağış alan yerleri ise Iğdır Ovası ve Tuz Gölü çevresidir.',
      osymTrap: 'ÖSYM TUZAĞI: İç Anadolu en çok yağışı İLKBAHARDA alır (Kırkikindi); Erzurum-Kars ise en çok yağışı YAZIN alır! İkisi de karasaldır ama yağış mevsimleri tamamen farklıdır.'
    ),
    LectureSection(
      title: 'Türkiye\'de Bitki Toplulukları ve Kuşakları',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye, iklim ve yer şekilleri çeşitliliği sayesinde 12.000\'den fazla bitki türüne ev sahipliği yapar; bunların yaklaşık üçte biri (%30) endemiktir (dünyada sadece Türkiye\'de yetişir):',
      bulletPoints: [
        'Orman Formasyonu: Türkiye\'nin orman bakımından en zengin bölgesi Karadeniz\'dir (%25), ardından Akdeniz (%24) gelir. Karadeniz\'de kayın, kestane, gürgen, ladin, göknar; Akdeniz ve Ege\'de kızılçam, karaçam, sedir, ardıç yaygındır. Orman üst sınırını sıcaklık (enlem), orman alt sınırını ise nem ve yağış belirler.',
        'Çalı Formasyonu (Maki): Akdeniz iklim bölgesinde kızılçam ormanlarının tahrip edilmesiyle oluşan bodur, sert ve parlak yapraklı her dem yeşil çalılardır. Başlıcaları: Zeytin, zakkum, mersin, defne, kocayemiş, lavanta, keçiboynuzu.',
        'Garig (Frigana): Makilerin de tahrip edildiği kurak alanlarda oluşan diz boyu dikenli kısa çalılardır (Lavanta, abdestbozan, kekik).',
        'Psödomaki (Yalancı Maki): Karadeniz ormanlarının tahrip edildiği nemli yerlerde oluşan yaprak döken çalı türleridir (Fındık, kızılcık, şimşir).',
        'Ot Formasyonu (Bozkır / Step): İlkbahar yağışlarıyla yeşeren, yaz kuraklığıyla sararıp kuruyan kısa boylu ot topluluğudur (Geven, yavşan otu, gelincik, sığırkuyruğu). İç Anadolu ve Güneydoğu\'da küçükbaş hayvancılığın temelidir.',
        'Antropojen Bozkır: İç kesimlerde meşe ormanlarının insanlar tarafından tahrip edilmesi sonucu ortaya çıkan bozkırlardır.',
        'Dağ (Alpin) Çayırları: Orman üst sınırının üzerinde, yaz yağışlarıyla yeşil kalan gür otlardır (Erzurum-Kars ve Karadeniz yaylaları). Büyükbaş hayvancılığı destekler.'
      ],
      goldenRule: 'ORMAN ÜST SINIRI ENLEM İLE, ALT SINIRI NEM İLE İLGİLİDİR: Orman üst sınırı en yüksek Doğu Anadolu ve Akdeniz\'dedir (sıcaklık/enlem). Orman alt sınırı ise deniz seviyesinden başlayan tek yer Karadeniz\'dir (nem/yağış).',
      osymTrap: 'ÖSYM TUZAĞI: Akdeniz\'in doğal ağacı KIZILÇAM\'dır; MAKİ ise kızılçamın tahrip edilmesiyle oluşmuş ikincil bir çalı türüdür!'
    ),
    LectureSection(
      title: 'Türkiye Doğal Bitki Örtüsü ve Formasyonları Haritası',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_bitki_topluluklari_haritasi.png',
      imageCaption: 'Şekil 3.3: Türkiye Bitki Örtüsü Haritası (Geniş/İğne Yapraklı Ormanlar, Maki, Bozkır ve Çayırlar)',
      leadText: 'Türkiye\'nin bitki örtüsü haritası incelendiğinde iklim kuşaklarıyla tam bir uyum gözlenir:',
      bulletPoints: [
        'Kıyı Kuşağı Ormanları: Karadeniz boyunca yaprak döken nemli ormanlar, Akdeniz ve Güney Ege\'de ise kuraklığa dayanıklı kızılçam ormanları egemendir.',
        'Maki Kuşağı: Akdeniz, Ege ve Güney Marmara kıyılarında deniz seviyesinden itibaren belirli yükseltiye kadar uzanır.',
        'Bozkır (Step) Kuşağı: İç Anadolu, Güneydoğu ve Doğu Anadolu çöküntü havzalarında geniş yer kaplar.',
        'Alpin Çayırlar: Kuzeydoğu Anadolu platosu ve yüksek dağ zirvelerinde orman üst sınırından sonra başlar.'
      ],
      goldenRule: 'MAKİ ÜST SINIRI ENLEM ETKİSİYLE KUZEYE GİTTİKÇE ALÇALIR: Akdeniz\'de 800-900 m\'ye, Ege\'de 500-600 m\'ye, Marmara\'da 300-400 m\'ye kadar çıkabilir.',
      osymTrap: 'ÖSYM TUZAĞI: Bozkırların İç Anadolu\'da yaygın olmasının sebebi sadece az yağış değil, yüzyıllardır süren orman tahribatıdır (antropojen bozkır).'
    ),
    LectureSection(
      title: 'Türkiye\'de Maki (Çalı) Bitki Örtüsü Dağılış Haritası',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_cayir_alpin_haritasi.png',
      imageCaption: 'Şekil 3.4: Türkiye\'de Maki Bitki Örtüsü Dağılış Haritası (Akdeniz, Ege ve Güney Marmara Kuşağı)',
      leadText: 'Akdeniz iklim bölgesinde kızılçam ormanlarının tahrip edilmesiyle ortaya çıkan maki çalı topluluğunun coğrafi dağılışı:',
      bulletPoints: [
        '🌿 Coğrafi Dağılım Sahası: Akdeniz kıyı kuşağı, Ege Bölgesi kıyıları ve Güney Marmara kıyı kuşağı (Çanakkale, Balıkesir, Yalova).',
        '🌿 Bitki Karakteristiği: Kuraklığa dayanıklı, yaprakları sert, parlak ve cilalı, kökleri derin, her dem yeşil bodur ağaççıklardır (zeytin, zakkum, mersin, defne, kocayemiş, lavanta, keçiboynuzu).',
        '🌿 Maki Üst Sınırı Enlem İlişkisi: Sıcaklık ve enleme bağlı olarak Akdeniz\'de 700-800 m, Ege\'de 500-600 m, Güney Marmara\'da 300-400 metreye kadar çıkar. Kuzeye gidildikçe enlem etkisiyle maki üst sınırı alçalır.',
        '🌿 Garig ve Psödomaki: Makilerin tahrip edildiği kurak alanlarda diz boyu dikenli garig (lavanta, abdestbozan); Karadeniz kıyılarında orman tahribiyle ise psödomaki (fındık, kızılcık, şimşir) oluşur.'
      ],
      goldenRule: 'MAKİ ÜST SINIRI ENLEM İLE ALÇALIR: Akdeniz\'de 800 m, Ege\'de 500 m, Marmara\'da 300 m seviyesine kadar inmesi MATEMATİKSEL KONUMUN (enlem/sıcaklık) doğrudan sonucudur.',
      osymTrap: 'ÖSYM TUZAĞI: Maki birincil doğal orman DEĞİLDİR; KIZILÇAM ORMANLARININ TAHRİP EDİLMESİYLE oluşan ikincil (antropojen) bir çalı türüdür!'
    ),
    LectureSection(
      title: 'Türkiye İklim Tipleri, Sıcaklık ve Yağış Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin iklim kuşakları, yıllık ortalama sıcaklık eğrileri ve yağış dağılım alanları harita üzerinde analiz edilmiştir.',
      mapData: LectureMapData(
        title: 'TÜRKİYE İKLİM TİPLERİ, YAĞIŞ VE BİTKİ ÖRTÜSÜ HARİTASI',
        subtitle: 'Makroklima Kuşakları, Yağış Rejimleri ve Doğal Bitki Formasyonları',
        mapId: 'cografya_iklim_tipleri_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_iklim_tipleri.jpg',
        mapSource: 'cografyaharita.com - Türkiye İklim Tipleri Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🌊', label: 'Karadeniz İklimi', description: 'Her mevsim yağışlı, en çok yağış sonbaharda. Yıllık sıcaklık farkı en az, bağıl nem ve bulutluluk en yüksek iklimdir. Doğal bitki örtüsü geniş ve iğne yapraklı ormanlardır.'),
          MapLegendItem(symbol: '☀️', label: 'Akdeniz İklimi', description: 'Yazlar sıcak ve kurak, kışlar ılık ve yağışlı. En çok yağış kışın düşer (cephesel yağışlar). Kar ve don olayı en azdır. Doğal bitki örtüsü kızılçam ve makidir (zeytin, defne, mersin, zakkum).'),
          MapLegendItem(symbol: '🌾', label: 'Ilıman Karasal (Step) İklimi', description: 'İç Anadolu, Doğu Anadolu havzaları ve Güneydoğu\'da etkilidir. En çok yağış ilkbaharda konveksiyonel (kırkikindi) olarak düşer. Doğal bitki örtüsü bozkırdır (step).'),
          MapLegendItem(symbol: '❄️', label: 'Sert Karasal İklim', description: 'Erzurum-Kars-Ardahan platosunda etkilidir. Kışlar çok uzun, karlı ve aşırı soğuktur. En çok yağış yaz başında konveksiyonel olarak düşer. Doğal bitki örtüsü Alpin çayırlardır.'),
          MapLegendItem(symbol: '🍊', label: 'Mikroklima (Özel Konum) Alanları', description: 'Rize (Turunçgil & Kivi - Fön rüzgarı), Artvin-Yusufeli (Zeytin), Iğdır Ovası (Pamuk), Alanya-Gazipaşa (Muz).')
        ],
        points: [
          MapFrontItem(
            name: 'Rize ve Doğu Karadeniz Kıyıları',
            category: 'En Çok Yağış Alan Yöre',
            commander: 'Doğu Karadeniz Kıyı Kuşağı',
            keyEvent: 'Türkiye\'nin yıllık 2.400 mm ile en fazla yağış alan merkezidir. Yamaç (orografik) yağışları hakimdir. Fön rüzgarları sayesinde kışlar ılık geçer ve turunçgil mikrokliması oluşur.',
            outcome: 'ÖSYM Çıkmış Soru: Türkiye\'de kimyasal çözünmenin ve bağıl nemin en yüksek olduğu yöre Doğu Karadeniz kıyılarıdır.'
          ),
          MapFrontItem(
            name: 'Tuz Gölü Çevresi & Iğdır Ovası',
            category: 'En Az Yağış Alan Yöreler',
            commander: 'İç Anadolu & Doğu Anadolu Çukurluğu',
            keyEvent: 'Etrafı yüksek dağlarla çevrili çukur (çanak) alanlar oldukları için nemli hava kütleleri içeri sokulamaz. Yıllık yağış 300-350 mm civarındadır.',
            outcome: 'ÖSYM Sorusu: Tuz Gölü çevresi ve Iğdır Ovası Türkiye\'nin en kurak / en az yağış alan yerleridir.'
          ),
          MapFrontItem(
            name: 'Erzurum - Kars Platosu',
            category: 'Yaz Yağışları & Alpin Çayırlar',
            commander: 'Kuzeydoğu Anadolu Yüksek Platosu',
            keyEvent: 'Yüksek rakım nedeniyle en fazla yağışını yaz başında konveksiyonel olarak alır. Yaz yağışları çayırların yeşil kalmasını sağlar, bu da büyükbaş mera hayvancılığını doğurur.',
            outcome: 'ÖSYM Püf Noktası: Yaz yağışı alan tek karasal yöremiz Erzurum-Kars\'tır; buna bağlı olarak Çernezyom (kara toprak) oluşmuştur.'
          ),
          MapFrontItem(
            name: 'Güneydoğu Anadolu (Şanlıurfa - Mardin)',
            category: 'Yazın En Yüksek Sıcaklık & Kuraklık',
            commander: 'Güneydoğu Anadolu Bölgesi',
            keyEvent: 'Basra Alçak Basıncı ve Samyeli (Keşişleme) rüzgarlarının etkisiyle yaz sıcaklıklarının ve buharlaşma şiddetinin Türkiye genelinde en yüksek olduğu bölgedir.',
            outcome: 'ÖSYM Çıkmış Soru: Yazın en sıcak bölge Akdeniz değil, Güneydoğu Anadolu\'dur (enlem + karasallık + çöl rüzgarları).'
          )
        ],
        historicalNote: '📌 ÖSYM İKLİM VE YAĞIŞ REJİMİ TUZAKLARI:\n'
            '1. Yağışın Mevsimlere Dağılışı (E Kuralı):\n'
            '   - İç Anadolu: İLKBAHAR (Konveksiyonel - Kırkikindi)\n'
            '   - Erzurum-Kars: YAZ (Konveksiyonel - Çayır oluşumu)\n'
            '   - Karadeniz: SONBAHAR (Orografik - Yamaç yağışı)\n'
            '   - Akdeniz & Ege: KIŞ (Frontal - Cephesel yağış)\n'
            '2. Don Olayının En Az Olduğu Yer: Akdeniz Kıyıları (seracılık gelişmiştir).\n'
            '3. Don Olayının En Çok Olduğu Yer: Doğu Anadolu (Erzurum-Kars).\n'
            '4. Güneşlenme Süresi En Fazla Olan: Güneydoğu Anadolu; En Az Olan: Doğu Karadeniz.'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: İklim ve Bitki Örtüsü',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Türkiye\'de yıllık toplam yağış miktarının en fazla olduğu yer ile yağış rejiminin en düzenli olduğu yer aşağıdakilerden hangisinde doğru eşleştirilmiştir?',
          options: [
            'A) Antalya - Muğla',
            'B) Rize - Rize (Doğu Karadeniz)',
            'C) Sinop - Trabzon',
            'D) Adana - Samsun',
            'E) Konya - Kars'
          ],
          correctIndex: 1,
          explanation: 'Türkiye\'de hem yıllık yağış miktarının en yüksek olduğu (2400 mm üzeri) hem de her mevsim yağış alarak yağış rejiminin en düzenli olduğu yer Doğu Karadeniz\'de Rize\'dir.',
          ruleTag: 'Yağış Dağılışı ve Rejimleri'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu3 = konu3IklimBitkiOrtusu;
