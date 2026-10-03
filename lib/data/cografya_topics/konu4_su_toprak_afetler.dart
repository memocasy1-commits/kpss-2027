// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu4SuToprakAfetler = LectureTopic(
  id: 'cografya_su_toprak_afetler',
  courseId: 'cografya',
  order: 4,
  title: 'Türkiye\'nin Su Varlığı, Toprak Tipleri ve Doğal Afetler',
  subtitle: 'Akarsular, Göller, Kaynaklar, Zonal-Azonal Topraklar, Depremler ve Kütle Hareketleri',
  icon: Icons.water_drop_rounded,
  color: const Color(0xFF0284C7),
  testRange: 'Test 31 - 40',
  startTestNum: 31,
  endTestNum: 40,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Toprak Oluşumu, Katmanları ve Türkiye\'nin Toprak Tipleri',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/cografya/cografya_toprak_turleri_semasi.png',
      imageCaption: 'Görsel: Türkiye\'de Görülen Toprak Tipleri Şeması (Zonal, İntrazonal, Azonal Topraklar)',
      leadText: 'Kayaçların fiziksel (mekanik) ve kimyasal çözünmesi sonucu toprak oluşur. Nemli ve sıcak bölgelerde kimyasal çözünme (kıyılarda), kurak ve soğuk bölgelerde ise fiziksel parçalanma (iç kesimlerde) etkilidir.',
      bulletPoints: [
        'Zonal (Yerli) Topraklar: Bulundukları bölgenin iklim ve bitki örtüsünün etkisiyle oluşan, A-B-C-D horizonları tam gelişmiş topraklardır:',
        '• Kahverengi Orman Toprakları: Karadeniz\'in nemli geniş yapraklı ormanları altında oluşur; humusça zengin ve verimlidir.\n• Kırmızı Akdeniz Toprağı (Terra Rossa): Kalker (kireçtaşı) üzerinde oluşan, demir oksit nedeniyle kırmızı renkli olan topraklardır. Kireçli ama gübreleme ile verimli olur.\n• Çernezyom (Kara Toprak): Erzurum-Kars platosunda yaz yağışlarıyla oluşan gür çayırlar altında gelişir. Dünyanın ve Türkiye\'nin organik maddece en zengin, en verimli yerli toprağıdır.\n• Kahverengi ve Kestane Renkli Bozkır (Step) Toprakları: İç Anadolu ve Güneydoğu\'da görülür. Yağış azlığı nedeniyle kireç ve tuz birikimi fazladır.\n• Podzol: Batı Karadeniz\'in yükseklerinde (Bolu, Kastamonu) soğuk ve nemli iğne yapraklı ormanlar altında aşırı yıkanmış, açık renkli, asidik ve verimsiz topraklardır.',
        'İntrazonal Topraklar: Yer şekilleri ve ana kayanın etkisiyle oluşan topraklardır:',
        '• Halomorfik (Tuzlu): Tuz Gölü çevresinde suyun buharlaşmasıyla tuzun yüzeyde biriktiği çorak topraklardır.\n• Hidromorfik (Bataklık): Drenajı bozuk bataklık ve sazlık alanlarda oluşur.\n• Kalsimorfik: Kireçli ana kaya üzerinde oluşur. İkiye ayrılır: Vertisol (Taşdoğuran / Dönen toprak; killi topraktır, Trakya Ergene ve Muş\'ta yaygındır) ve Rendzina (yumuşak kireçtaşları üzerinde).',
        'Azonal (Taşınmış) Topraklar: Akarsu, rüzgâr ve buzulların taşıyıp biriktirdiği, horizonları (katmanları) OLMAYAN son derece verimli topraklardır: Alüvyal (akarsu taşır; Çukurova, Bafra, Çarşamba vb.), Kolüvyal (dağ eteğinde birikir), Litosol (taşlı toprak), Regosol (volkanik kumlu arazi), Lös (rüzgar taşır).'
      ],
      goldenRule: 'AZONAL TOPRAKLARIN HORİZONU YOKTUR: Alüvyal topraklar akarsuların taşıdığı malzemelerden oluştuğu için tabakalanma (A, B, C horizonu) göstermez; fakat mineral yönünden zengin oldukları için tarımsal verimleri en yüksek topraklardır.',
      osymTrap: 'ÖSYM TUZAĞI: Çernezyom Türkiye\'nin en verimli toprağı olmasına rağmen, Erzurum-Kars\'ta kışların çok soğuk ve yazların kısa olması (iklim engeli) yüzünden üzerinde tarım DEĞİL, büyükbaş mera hayvancılığı yapılır!'
    ),
    LectureSection(
      title: 'Toprağın Katmanları (A, B, C, D Horizonları)',
      type: LectureSectionType.ruleList,
      imageAssetPath: 'assets/images/cografya/cografya_toprak_horizonlari.png',
      imageCaption: 'Görsel: Toprak Katmanları (A Humus/Organik, B Birikim, C Ayrışma, D Ana Kaya Horizonları)',
      leadText: 'Ana kayanın zamanla ayrışması ve organik maddelerin birikmesiyle dikey kesitte belirgin toprak horizonları (katmanları) meydana gelir:',
      bulletPoints: [
        'A Horizonu (Yıkanma Katı): En üstteki organik maddece (humusça) en zengin, canlı organizmaların ve bitki köklerinin bulunduğu verimli kattır. Yağmur sularıyla tuz ve kireç aşağıya yıkanır.',
        'B Horizonu (Birikme Katı): A horizonundan sızan kireç, tuz ve kil minerallerinin biriktiği kattır.',
        'C Horizonu (Ayrışma Katı): Ana kayanın iri bloklar ve parçalar halinde fiziksel ve kimyasal olarak çözündüğü geçiş katıdır.',
        'D Horizonu (Ana Kaya): Henüz ayrışmaya uğramamış, toprağın üzerinde geliştiği sert masif ana kayadır.'
      ],
      goldenRule: 'TAŞINMIŞ (AZONAL) TOPRAKLARDA HORİZONLAŞMA OLMAZ: Delta ovalarındaki alüvyonlar sürekli yeni sediment birikimiyle beslendiği için katmanlaşma (horizon) oluşmaz.',
      osymTrap: 'ÖSYM TUZAĞI: "Horizon" kavramı yalnızca ZONAL (yerli) topraklarda tam gelişir. Alüvyal, lös ve moren gibi taşınmış topraklarda horizon bulunmaz!'
    ),
    LectureSection(
      title: 'Türkiye\'nin Akarsuları, Havzaları ve Gölleri',
      imageAssetPath: 'assets/images/cografya/vadi_tipleri_semasi.png',
      imageCaption: 'Şekil 4.1: Türkiye Akarsu Vadi Profilleri ve Karstik Kanyon Kesiti',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'nin akarsuları genellikle kısa boylu, dar ve derin vadilerde akan, akış hızları ve aşındırma güçleri yüksek sulardır:',
      bulletPoints: [
        'Akarsularımızın Genel Özellikleri: Üç tarafı denizlerle çevrili ve engebeli olduğu için boyları kısadır. Yatak eğimleri ve akış hızları fazladır. Hidroelektrik enerji potansiyelleri çok yüksektir. Denge profiline ulaşmamışlardır. Rejimleri genellikle düzensizdir (Karadeniz hariç). Taşımacılığa elverişli değillerdir (yalnızca Bartın Çayı\'nın ağzında kısa mesafe hariç).',
        'Sınırlarımızı Aşan Akarsular: Ülkemizden doğup dışarıya dökülenler: Fırat ve Dicle (Basra Körfezi), Aras ve Kura (Hazar Denizi), Çoruh (Gürcistan\'dan Karadeniz). Dışarıdan doğup ülkemize dökülenler: Meriç (Bulgaristan\'dan doğar), Asi (Lübnan\'dan doğar).',
        'Tektonik Göller: Fay hatlarındaki çanaklarda oluşur: Tuz Gölü, Manyas (Kuş), Ulubat, İznik, Sapanca, Beyşehir, Eğirdir, Burdur, Akşehir, Eber, Hazar.',
        'Karstik Göller: Kalkerli arazide çözünme ile oluşan çanaklarda gelişir: Salda Gölü (Türkiye\'nin Maldivleri), Kestel, Elmalı, Suğla gölleri.',
        'Volkanik Göller: Krater, kaldera ve maar çukurlarında birikir: Nemrut Krater Gölü (Bitlis), Meke Maarı (Konya Karapınar - Dünyanın nazar boncuğu), Gölcük (Isparta).',
        'Doğal Set Gölleri: Heyelan Set (Tortum, Sera, Abant, Yedigöller, Zinav), Alüvyon Set (Eymir, Mogan, Köyceğiz, Bafa/Çamiçi), Kıyı Set / Lagün (Terkos/Durusu, Büyükçekmece, Küçükçekmece), Volkanik Set (Van Gölü - Türkiye\'nin en büyüğü, Çıldır, Erçek, Nazik, Balık).'
      ],
      goldenRule: 'GİDEĞENİ (AYAĞI) OLAN GÖLÜN SUYU TATLIDIR: Bir göl fazla sularını bir akarsu aracılığıyla dışarı boşaltabiliyorsa (gideğeni varsa) suyu tatlıdır (Beyşehir, Eğirdir, Manyas). Gideğeni olmayan kapalı göllerin suyu ise acı, tuzlu veya sodalıdır (Tuz Gölü, Van Gölü sodalı, Burdur acı).',
      osymTrap: 'ÖSYM TUZAĞI: Van Gölü hem tektonik hem de volkanik set gölüdür (karma oluşumlu). Dünyanın en büyük sodalı gölüdür ve içinde sadece İnci Kefali yaşar.'
    ),
    LectureSection(
      title: 'Türkiye Boğazları ve Akıntılar Haritası (Üst ve Alt Akıntı Mekanizması)',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_bogazlar_ve_akintilar_haritasi.png',
      imageCaption: 'Şekil 4.1: İstanbul ve Çanakkale Boğazları Üst Akıntı (Seviye) ve Alt Akıntı (Tuzluluk/Yoğunluk) Kesiti',
      type: LectureSectionType.overview,
      leadText: 'Türkiye boğazlarında Karadeniz ile Akdeniz arasındaki seviye ve yoğunluk farklarından kaynaklanan iki yönlü akıntı sistemi bulunur:',
      bulletPoints: [
        'Üst Akıntı: Karadeniz\'den Marmara ve Ege\'ye doğru akar. Temel nedeni SEVİYE FARKIDIR (Karadeniz\'e bol akarsu dökülmesi ve buharlaşmanın azlığı yüzünden su seviyesi Akdeniz\'den yaklaşık 40 cm yüksektir).',
        'Alt Akıntı: Ege ve Akdeniz\'den Marmara üzerinden Karadeniz\'e doğru akar. Temel nedeni YOĞUNLUK VE TUZLULUK FARKIDIR (Akdeniz\'in suyu aşırı buharlaşma nedeniyle çok daha tuzlu ve ağırdır; dipte dibe çökerek Karadeniz\'e akar).',
        'Boğazlarda Balık Göçü: Boğazlar Karadeniz ile Akdeniz arasındaki balık göç koridorudur; akıntılar deniz canlılarının dağılımını doğrudan yönetir.'
      ],
      goldenRule: 'ÜST AKINTI = SEVİYE FARKI, ALT AKINTI = TUZLULUK FARKI: Üst akıntıyı akarsular ve az buharlaşma; alt akıntıyı ise Akdeniz\'in yüksek tuzluluğu yönetir.',
      osymTrap: 'ÖSYM TUZAĞI: "Boğazlardaki üst akıntının nedeni tuzluluktur" demek YANLIŞTIR! Üst akıntının nedeni seviye farkıdır; tuzluluk alt akıntıyı oluşturur.'
    ),
    LectureSection(
      title: 'Türkiye\'de Yeraltı Suları ve Kaynak Tipleri',
      imageAssetPath: 'assets/images/cografya/cografya_artezyen_kaynagi.png',
      imageCaption: 'Görsel: Artezyen Kaynağı (İki Geçirimsiz Tabaka Arasında Sıkışmış Basınçlı Yeraltı Suyu Akifer Kesiti)',
      type: LectureSectionType.overview,
      leadText: 'Yer altına sızan suların oluşturduğu kaynaklar yapısal özelliklerine göre farklılaşır:',
      bulletPoints: [
        'Artezyen Kaynağı: İki geçirimsiz tabaka arasındaki geçirimli akiferde biriken basınçlı sudur; sondajla delindiğinde yüzeye fışkırarak çıkar (Trakya, İç Anadolu, Güneydoğu).',
        'Vadi (Yamaç) Kaynağı: Akarsu vadisinin yer altı su tablasını kesmesiyle ortaya çıkan soğuk tatlı su kaynaklarıdır.',
        'Karstik Kaynak (Voklüz): Kireçtaşı boşluklarından fışkıran kireçli, soğuk ve debisi mevsimsel değişen sulardır (Toroslar).',
        'Fay Kaynağı (Jeotermal / Termal): Kırık hatları boyunca derinden gelen mineralce zengin, sıcak sulardır (Ege, Marmara, KAF boyu).'
      ],
      goldenRule: 'DEBİSİ VE SICAKLIĞI DEĞİŞMEYEN TEK KAYNAK FAY KAYNAĞIDIR: Çünkü su yüzlerce metre derinden gelir; iklim ve mevsim şartlarından etkilenmez.',
      osymTrap: 'ÖSYM TUZAĞI: Artezyen insan müdahalesi (sondaj) ile fışkırır; gayzer ile karıştırılmamalıdır (Türkiye\'de aktif volkanizma olmadığı için Gayzer YOKTUR).'
    ),
    LectureSection(
      title: 'Yamaç (Vadi) Kaynağı Yapısı ve Akifer Şeması',
      imageAssetPath: 'assets/images/cografya/cografya_vadi_kaynagi.png',
      imageCaption: 'Şekil 4.2: Yamaç (Vadi) Kaynağı Yapısı (Yer Altı Su Seviyesinin Vadi Yamacında Yüzeye Çıkışı)',
      type: LectureSectionType.ruleList,
      leadText: 'Akarsu vadilerinin yer altı su tablasını kestiği yerlerde oluşan soğuk kaynaklardır:',
      bulletPoints: [
        'Oluşum Şekli: Dağlık ve engebeli arazilerde akarsular derin vadiler açtıkça yer altındaki su tabakasını keser ve su yamaç boyunca dışarı sızar.',
        'Su Kalitesi: Genellikle tatlı ve soğuktur; içme suyu ve dere beslemesinde kullanılır.',
        'Debi Değişimi: Yağışlı dönemlerde ve ilkbahar kar erimelerinde debisi artar, yaz kuraklığında azalır veya kurur.'
      ],
      goldenRule: 'YAMAÇ KAYNAĞI İKLİMDEN DOĞRUDAN ETKİLENİR: Kar erimeleri ve yağış azlığı kaynağın debisini hemen değiştirir.',
      osymTrap: 'ÖSYM TUZAĞI: Yamaç kaynaklarının suları sıcaktır ifadesi YANLIŞTIR; suları daima soğuktur.'
    ),
    LectureSection(
      title: 'Karstik Kaynak (Voklüz) ve Yer Altı Mağara Suları',
      imageAssetPath: 'assets/images/cografya/cografya_karstik_kaynak_vokluz.png',
      imageCaption: 'Şekil 4.3: Karstik Kaynak / Voklüz (Kalker Çözünme Kanalları ve Yeraltı Suyu Basınçlı Çıkışı)',
      type: LectureSectionType.overview,
      leadText: 'Kireçtaşı (kalker), jips ve kaya tuzu gibi eriyebilen arazilerde yer altı boşluklarında toplanan suların yüzeye çıktığı noktalardır:',
      bulletPoints: [
        'En Yaygın Bölge: Akdeniz Bölgesi (Batı ve Orta Toroslar, Teke ve Taşeli platoları).',
        'Su Özellikleri: Bol miktarda kireç ve bikarbonat içerir, soğuktur.',
        'Nehirleri Besleme Gücü: Manavgat, Köprüçay, Aksu ve Düden gibi akarsular dev karstik kaynaklarla (voklüzlerle) beslendiği için yaz kuraklığında bile debileri çok düşmez.',
        'Düzensiz Rejim İstisnası: Karstik kaynakla beslenen Akdeniz nehirleri, yaz kuraklığına rağmen diğer iç bölge nehirlerine kıyasla daha düzenli akış gösterir.'
      ],
      goldenRule: 'MANAVGAT\'IN YAZIN AKMA SEBEBİ KARSTİK VOKLÜZLERDİR: Karstik kaynaklar yer altındaki dev haznelerden beslendiği için yaz kuraklığında nehrin kurumasını engeller.',
      osymTrap: 'ÖSYM TUZAĞI: Karstik kaynakların suları kireçlidir; mineral zengini fay suyuyla karıştırılmamalıdır.'
    ),
    LectureSection(
      title: 'Fay Kaynağı (Jeotermal / Kaplıca / Ilıca) Yapısı',
      imageAssetPath: 'assets/images/cografya/cografya_fay_kaynagi_jeotermal.png',
      imageCaption: 'Şekil 4.4: Fay Kaynağı ve Jeotermal Akifer Yapısı (Kırık Boyunca Magmatik Isıyla Isınan Derin Sular)',
      type: LectureSectionType.ruleList,
      leadText: 'Yer kabuğunun fay (kırık) hatları boyunca derinlere sızan ve magmaya yaklaşarak ısınıp mineralleşerek yukarı yükselen sulardır:',
      bulletPoints: [
        'Görüldüğü Alanlar: KAF, DAF ve BAF tektonik hatları; en zengin bölge Ege Grabenleridir (Denizli Sarayköy, Aydın Germencik).',
        'Sıcaklık ve Mineral: Suları daima sıcaktır (30°C - 100°C arası) ve bol mineral/kükürt içerir.',
        'Kullanım Alanları: Jeotermal elektrik üretimi, seracılık ısıtması, konut ısıtması (Afyon, Gönen, Kırşehir) ve termal sağlık turizmi.',
        'Depremle Paralellik: Deprem bölgeleri, genç volkanizma ve kaplıcalar aynı fay kuşaklarında bir arada bulunur.'
      ],
      goldenRule: 'FAY KAYNAĞI = GENÇ OLUŞUM KANITI: Bir yerde fay kaynakları ve kaplıcalar yaygınsa orası genç oluşumlu, kırıklı ve tektonik hareketliliği olan bir sahadır.',
      osymTrap: 'ÖSYM TUZAĞI: Fay kaynakları yağışlardan ve kuraklıktan etkilenmez; yıl boyu sıcaklığı ve debisi sabittir.'
    ),
    LectureSection(
      title: 'Türkiye Deprem Riski ve Fay Hatları Haritası',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_deprem_fay_hatlari_haritasi.png',
      imageCaption: 'Şekil 4.5: Türkiye Deprem Tehlike Haritası (1. Derece Deprem Kuşakları KAF, DAF, BAF ve Masif Alanlar)',
      type: LectureSectionType.overview,
      leadText: 'Alp-Himalaya orojenez kuşağında yer alan Türkiye\'nin ana fay hatları ve sismik risk kuşakları haritada gösterilmiştir:',
      bulletPoints: [
        'Kuzey Anadolu Fay Hattı (KAF): Saros Körfezi - Marmara Denizi - Bolu - Tokat - Erzincan - Karlıova doğrultusunda uzanır.',
        'Doğu Anadolu Fay Hattı (DAF): Hatay Amik - Maraş - Malatya - Elazığ - Bingöl Karlıova doğrultusunda KAF ile birleşir.',
        'Batı Anadolu Fay Kuşağı (BAF): Ege grabenleri boyunca çok sayıda kırık hattından oluşur.',
        'Deprem Riski En Düşük Alanlar: Konya-Karaman ovası, Taşeli platosu, Mardin eşiği, Ergene havzası ve Sinop kıyı kuşağı.'
      ],
      goldenRule: 'MASİF ALANLARDA DEPREM RİSKİ AZDIR: 1. Jeolojik Zamanda oluşmuş eski sert kıta çekirdeklerinde (masiflerde) fay geçmediği sürece sismik risk düşüktür.',
      osymTrap: 'ÖSYM TUZAĞI: "Türkiye\'de deprem riski olmayan yer vardır" ifadesi YANLIŞTIR; "riski düşük olan yerler" vardır.'
    ),
    LectureSection(
      title: 'Türkiye Sel ve Taşkın Risk Alanları Haritası',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_sel_taskin_risk_haritasi.png',
      imageCaption: 'Şekil 4.6: Türkiye Sel ve Akarsu Taşkın Risk Kuşakları Haritası',
      type: LectureSectionType.ruleList,
      leadText: 'Ani sağanak yağışlar, dere yataklarının daraltılması ve kar erimeleriyle meydana gelen hidrolojik afetlerdir:',
      bulletPoints: [
        'En Yüksek Risk Kuşağı: Karadeniz kıyı şeridi (Kastamonu Bozkurt, Sinop Ayancık, Trabzon, Rize, Giresun).',
        'Marmara ve Trakya Riski: Meriç ve Ergene nehirleri (Bulgaristan\'daki baraj kapaklarının açılması ve taşkın yatakları).',
        'Kentsel Seller: İstanbul, İzmir, Ankara gibi büyükşehirlerde betonlaşma ve dere yataklarının imara açılması.',
        'Önleme Yolları: Dere yataklarının imara kapatılması, ıslah bentleri ve havza ağaçlandırması.'
      ],
      goldenRule: 'KARADENİZ\'DE EĞİM VE ANİ SAĞANAK SELİ TETİKLER: Dağların dik yamaçlarından inen sular dar vadi tabanlarında birleşerek yıkıcı sellere dönüşür.',
      osymTrap: 'ÖSYM TUZAĞI: Sel afeti sadece bol yağış alan yerde değil, İç Anadolu\'da Kırkikindi sağanaklarında da ani su baskınları şeklinde görülebilir.'
    ),
    LectureSection(
      title: 'Türkiye Çığ ve Heyelan Risk Kuşakları Haritası',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_cig_ve_heyelan_haritasi.png',
      imageCaption: 'Şekil 4.7: Türkiye Çığ Düşme ve Heyelan Tehlike Bölgeleri Haritası',
      type: LectureSectionType.overview,
      leadText: 'Engebeli dağ yamaçlarında kar örtüsünün veya toprak kütlesinin yerçekimi etkisiyle kayması sonucu oluşur:',
      bulletPoints: [
        'Çığ Kuşağı: Doğu Anadolu\'nun yüksek ve dik dağlık alanları (Hakkari, Van, Bitlis, Erzurum, Bingöl) ile Doğu Karadeniz yaylaları.',
        'Heyelan Kuşağı: Doğu ve Batı Karadeniz (Eğim + Yağış + Killi Toprak + Tabakaların eğim yönünde uzanması).',
        'En Tehlikeli Mevsim: Heyelan da çığ da en çok İLKBAHARDA meydana gelir (Karların erimesi ve toprağın suya doyması).'
      ],
      goldenRule: 'AĞAÇLANDIRMA HEYELANI TEK BAŞINA ENGELLEYEMEZ: Çünkü heyelan derin ana kayayla birlikte kütle hareketidir; ağaç kökleri sadece yüzeysel erozyonu tutar.',
      osymTrap: 'ÖSYM TUZAĞI: Karadeniz en çok yağışı sonbaharda alır ama heyelan en çok İLKBAHARDA olur; nedeni karların erimesidir.'
    ),
    LectureSection(
      title: 'Türkiye\'de Buzul ve Buzul Aşınım Dağları Haritası',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_buzul_daglari_haritasi.png',
      imageCaption: 'Şekil 4.8: Türkiye Güncel Buzulları ve Kuaterner Buzul İzleri Dağılış Haritası',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye Orta Kuşak\'ta yer aldığı için buzullar kıyılara hiçbir zaman inmemiş; ancak 3.000 metrenin üzerindeki yüksek doruklarda sirk, buzul vadisi ve morenler oluşmuştur:',
      bulletPoints: [
        'Güncel Buzul Bulunan Dağlar: Cilo (Uludoruk/Reşko - Türkiye\'nin en büyük vadi buzulu İsbir), Büyük Ağrı Dağı (en büyük takke buzulu), Kaçkar Dağları, Süphan Dağı, Erciyes Dağı, Bolkar ve Aladağlar.',
        'Buzul İzi Bulunup Güncel Buzul Bulunmayan Dağ: Bursa ULUDAĞ (Sirk çukurları ve gölleri vardır fakat güncel buzul erimiştir).',
        'Buzul İzi ASLA Bulunmayan Dağlar: Yıldız Dağları, Karacadağ, Aydın Dağları, Canik Dağları (Yükseltileri yetersizdir).'
      ],
      goldenRule: 'TÜRKİYE KIYILARINDA BUZUL ŞEKLİ YOKTUR: Sebebi mutlak konumdur (Ekvator\'a yakın olması).',
      osymTrap: 'ÖSYM TUZAĞI: Uludağ\'da buzul aşınım şekli (sirk gölleri) VARDIR; ancak güncel buzul YOKTUR.'
    ),
    LectureSection(
      title: 'Türkiye Diri Fay Hatları, Deprem ve Afet Bölgeleri Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin aktif fay kuşakları, tektonik çöküntü alanları ve afet bölgeleri harita üzerinde gösterilmiştir.',
      mapData: LectureMapData(
        title: 'TÜRKİYE FAY HATLARI, SU VARLIĞI VE DOĞAL AFETLER HARİTASI',
        subtitle: 'Aktif Tektonik Kuşaklar, Deprem Risk Alanları, Akarsu Havzaları ve Göller',
        mapId: 'cografya_deprem_haritasi_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_deprem_haritasi.jpg',
        mapSource: 'cografyaharita.com - Türkiye Deprem ve Fay Hatları Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🔴', label: 'Kuzey Anadolu Fay Hattı (KAF)', description: 'Saros Körfezi\'nden başlar; Marmara Denizi, Düzce, Bolu, Tokat, Erzincan\'dan geçerek Bingöl Karlıova\'ya uzanır. Dünyanın en aktif doğrultu atımlı faylarındandır.'),
          MapLegendItem(symbol: '🟠', label: 'Doğu Anadolu Fay Hattı (DAF)', description: 'Hatay Amik Ovası\'ndan başlar; Kahramanmaraş, Adıyaman, Malatya, Elazığ, Bingöl Karlıova\'da KAF ile birleşir.'),
          MapLegendItem(symbol: '🟡', label: 'Batı Anadolu Fay Kuşağı (BAF)', description: 'Ege grabenleri (Bakırçay, Gediz, Küçük ve Büyük Menderes havzaları) boyunca uzanan düşey atımlı çok sayıda kırık hattından oluşur.'),
          MapLegendItem(symbol: '🛡️', label: 'Deprem Riski En Az Masif Alanlar', description: 'Konya-Karaman havzası, Taşeli Platosu, Mardin Eşiği, Ergene Havzası, Sinop-Kastamonu kıyı şeridi, Alanya-Anamur hattı.'),
          MapLegendItem(symbol: '🌊', label: 'Doğal Göller ve Oluşum Tipleri', description: 'Karstik (Salda, Kestel), Tektonik (Tuz, Beyşehir, Eğirdir, Manyas), Volkanik (Nemrut krateri, Meke maarı), Set Gölleri (Heyelan, Alüvyal, Kıyı set).')
        ],
        points: [
          MapFrontItem(
            name: 'Kuzey Anadolu Fayı (KAF Hattı)',
            category: 'En Yıkıcı Fay Kuşağı',
            commander: 'Marmara - Karadeniz İçi - Doğu Anadolu',
            keyEvent: 'Yaklaşık 1.500 km uzunluğunda sağ yönlü doğrultu atımlı faydır. 1939 Erzincan, 1999 Gölcük/Düzce gibi cumhuriyet tarihinin en büyük sarsıntılarını üretmiştir.',
            outcome: 'ÖSYM Çıkmış Soru: KAF boyunca yerleşmeler, kaplıcalar ve tektonik ova dizilimleri paralellik gösterir.'
          ),
          MapFrontItem(
            name: 'Doğu Anadolu Fayı (DAF Hattı)',
            category: 'Arap & Anadolu Levha Sınırı',
            commander: 'Hatay - Maraş - Malatya - Elazığ - Bingöl',
            keyEvent: 'Arap Levhası\'nın kuzeye hareketi sonucu sıkışan bölgedir. 6 Şubat 2023 Kahramanmaraş-Pazarcık/Elbistan merkezli asrın depremleri bu kuşak üzerinde kırılmıştır.',
            outcome: 'ÖSYM Sınav Odaklı: Bingöl Karlıova, KAF ve DAF hatlarının birleştiği kilit düğüm noktasıdır.'
          ),
          MapFrontItem(
            name: 'Batı Anadolu Fay Kuşağı (BAF)',
            category: 'Graben Açılma Kuşağı',
            commander: 'Ege Bölgesi (Horst-Graben Havzaları)',
            keyEvent: 'Kabuğun gerilmesi sonucu oluşan normal faylardan oluşur. Deprem frekansı (sıklığı) en yüksek bölgedir; jeotermal enerji ve sıcak su kaynakları en zengin yöredir.',
            outcome: 'ÖSYM Sorusu: Ege\'de jeotermal santrallerin (Sarayköy, Germencik) varlığı doğrudan BAF kırıklarıyla açıklanır.'
          ),
          MapFrontItem(
            name: 'Meke Gölü & Salda Gölü',
            category: 'Nadir Doğal Göller',
            commander: 'Konya (Karapınar) & Burdur (Yeşilova)',
            keyEvent: 'Meke Maar Gölü volkanik patlama çukuru (maar) gölüdür ve dünyanın nazar boncuğu olarak bilinir. Salda ise magnezyum zengini beyaz kumlarıyla karstik tektonik bir göldür.',
            outcome: 'ÖSYM Çıkmış Soru: Meke Gölü gaz patlaması sonucu oluşan bir maar gölüdür.'
          )
        ],
        historicalNote: '📌 ÖSYM DEPREM VE AFETLER KRİTİK SINAV NOTLARI:\n'
            '1. Deprem Tehlikesi En Düşük 5 Merkez:\n'
            '   - Konya - Karaman Yöresi (1. Jeolojik Zaman masif arazisi)\n'
            '   - Mardin Eşiği (Güneydoğu Anadolu güneyi)\n'
            '   - Taşeli Platosu (Akdeniz)\n'
            '   - Ergene Havzası (Trakya - Edirne/Kırklareli)\n'
            '   - Sinop ve Doğu Karadeniz kıyı çizgisi.\n'
            '2. Heyelan En Çok Nerede Görülür? Doğu Karadeniz (Eğim + Killi Toprak + Yağış + İlkbaharda Kar Erimesi).\n'
            '3. Erozyon En Çok Nerede Görülür? İç Anadolu ve Güneydoğu (Bitki örtüsü yetersizliği + Kuraklık).'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Su Varlığı ve Doğal Afetler',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Türkiye\'de heyelan olaylarının en fazla İLKBAHAR mevsiminde görülmesinin temel nedeni aşağıdakilerden hangisidir?',
          options: [
            'A) Şiddetli rüzgarların toprağı gevşetmesi',
            'B) İlkbaharda yerçekiminin artması',
            'C) Kar erimeleriyle killi toprak tabakasının aşırı suya doyup kayganlaşması',
            'D) İlkbaharda akarsu seviyelerinin en düşük seviyeye inmesi',
            'E) Ağaçların yaprak açması'
          ],
          correctIndex: 2,
          explanation: 'Karadeniz\'de en çok yağış sonbaharda düşmesine rağmen heyelanlar en çok İLKBAHARDA olur. Bunun sebebi, eriyen kar sularının killi tabakayı aşırı derecede suya doyurarak kaygan hale getirmesidir.',
          ruleTag: 'Heyelan Oluşum Dinamiği'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu4 = konu4SuToprakAfetler;
