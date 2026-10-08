import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';
import '../services/theme_service.dart';
import '../services/pdf_service.dart';
import '../services/security_service.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';

class TestListScreen extends StatefulWidget {
  final String courseId;
  final String courseTitle;

  const TestListScreen({
    super.key,
    required this.courseId,
    required this.courseTitle,
  });

  @override
  State<TestListScreen> createState() => _TestListScreenState();
}

class _TopicMeta {
  final int index;
  final String shortName;
  final String fullName;
  final String description;
  final int startTest;
  final int endTest;
  final int questionCount;

  const _TopicMeta({
    required this.index,
    required this.shortName,
    required this.fullName,
    required this.description,
    required this.startTest,
    required this.endTest,
    required this.questionCount,
  });
}

class _TestListScreenState extends State<TestListScreen> {
  String _searchQuery = '';
  int _selectedTopicIndex = 0; // 0 = Tümü, 1..9 = Konu 1..9
  late List<TestSummary> _allTests;

  static const List<_TopicMeta> _tarihTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tümü (140 Test)',
      fullName: 'KPSS Tarih - Tüm Konular',
      description: '14 Konu • 140 Test • 2.800 Detaylı ve Çözümlü Soru',
      startTest: 1,
      endTest: 140,
      questionCount: 2800,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. İslamiyet Öncesi',
      fullName: '1. İslamiyet Öncesi Türk Tarihi',
      description: 'Orta Asya göçleri, İskitler, Hunlar, Göktürkler, Uygurlar, teşkilat ve kültür',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Türk-İslam Devletleri',
      fullName: '2. İlk Türk-İslam Devletleri ve Medeniyeti',
      description: 'Karahanlılar, Gazneliler, Büyük Selçuklular, Mısır Türk devletleri, bilim insanları',
      startTest: 11,
      endTest: 20,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. Türkiye Selçuklu & Beylikler',
      fullName: '3. Türkiye Selçuklu Devleti ve Anadolu Beylikleri',
      description: 'Miryokefalon, Kösedağ, II. Dönem Beylikleri, mimari, ticaret ve tasavvuf',
      startTest: 21,
      endTest: 30,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 4,
      shortName: '4. Osmanlı Kuruluş & Yükselme',
      fullName: '4. Osmanlı Devleti Kuruluş ve Yükselme Dönemleri',
      description: 'Kayı Boyu, beylikten devlete, Fatih, Yavuz, Kanuni ve dünya gücü Osmanlı',
      startTest: 31,
      endTest: 40,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 5,
      shortName: '5. Osmanlı Kültür & Medeniyet',
      fullName: '5. Osmanlı Kültür ve Medeniyeti',
      description: 'Merkez/saray, divan, seyfiye-ilmiye-kalemiye, taşra, ordu, toprak, lonca ve hukuk',
      startTest: 41,
      endTest: 50,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 6,
      shortName: '6. XVII. Yüzyıl (Duraklama)',
      fullName: '6. XVII. Yüzyıl Osmanlı Devleti (Duraklama / Arayış Yılları)',
      description: 'Celali isyanları, İstanbul ayaklanmaları, II. Osman, IV. Murad, Köprülüler, Karlofça',
      startTest: 51,
      endTest: 60,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 7,
      shortName: '7. XVIII. Yüzyıl (Gerileme)',
      fullName: '7. XVIII. Yüzyıl Osmanlı Devleti (Gerileme / Değişim ve Diplomasi)',
      description: 'Prut, Pasarofça, Lale Devri, Belgrad, Küçük Kaynarca, Kırım, III. Selim, Nizam-ı Cedid',
      startTest: 61,
      endTest: 70,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 8,
      shortName: '8. XIX. Yüzyıl (Dağılma)',
      fullName: '8. XIX. Yüzyıl Osmanlı Devleti (En Uzun Yüzyıl / Dağılma Dönemi ve Islahatlar)',
      description: 'Sened-i İttifak, II. Mahmud, Tanzimat, Kırım Savaşı, Paris Barışı, I. Meşrutiyet, 93 Harbi, Berlin',
      startTest: 71,
      endTest: 80,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 9,
      shortName: '9. XX. Yy. Başları Osmanlı',
      fullName: '9. XX. Yüzyıl Başlarında Osmanlı Devleti (II. Meşrutiyet, Trablusgarp ve Balkan Savaşları)',
      description: 'II. Meşrutiyet, 31 Mart, Trablusgarp & Uşi, I. ve II. Balkan Savaşları, Babıali Baskını, Fikir Akımları',
      startTest: 81,
      endTest: 90,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 10,
      shortName: '10. I. Dünya Savaşı & Mondros',
      fullName: '10. I. Dünya Savaşı (1914-1918) ve Mondros Ateşkes Antlaşması',
      description: 'Kafkas & Sarıkamış, Çanakkale Zaferi, Kût\'ül-Amâre, Hicaz-Yemen, Suriye-Filistin ve Mondros Ateşkesi',
      startTest: 91,
      endTest: 100,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 11,
      shortName: '11. Kurtuluş Savaşı Hazırlık',
      fullName: '11. Kurtuluş Savaşı Hazırlık Dönemi (Genelgeler, Kongreler ve Misak-ı Milli)',
      description: 'Samsun\'a Çıkış, Havza & Amasya, Erzurum & Sivas Kongreleri, Misak-ı Milli, I. TBMM ve Sevr',
      startTest: 101,
      endTest: 110,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 12,
      shortName: '12. Kurtuluş Savaşı Muharebeler',
      fullName: '12. Kurtuluş Savaşı Muharebeler ve Antlaşmalar Dönemi',
      description: 'Doğu & Güney Cepheleri, İnönü & Sakarya, Başkomutanlık, Mudanya, Saltanatın Kaldırılması ve Lozan Barış Antlaşması',
      startTest: 111,
      endTest: 120,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 13,
      shortName: '13. Atatürkçülük & İnkılaplar',
      fullName: '13. Atatürkçülük ve Türk İnkılâbı',
      description: 'Atatürk İlkeleri, Siyasi, Hukuk, Eğitim, Sosyal, Ekonomi İnkılapları, Çok Partili Hayat, Nutuk ve Eserleri',
      startTest: 121,
      endTest: 130,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 14,
      shortName: '14. Çağdaş Türk & Dünya',
      fullName: '14. Atatürk Dönemi Türk Dış Politikası ve Çağdaş Türk ve Dünya Tarihi',
      description: 'Dış Politika, Musul, Montrö, Sadabat, Hatay, II. Dünya Savaşı, Soğuk Savaş, Kıbrıs ve Türk Cumhuriyetleri',
      startTest: 131,
      endTest: 140,
      questionCount: 200,
    ),
  ];

  static const List<_TopicMeta> _turkceTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tümü (118 Test)',
      fullName: 'KPSS Türkçe - Tüm Konular (118 Test • 2.350 Soru)',
      description: '11 Konu • 118 Test • 2.350 Detaylı, PİSA Odaklı ve Çözümlü Soru',
      startTest: 1,
      endTest: 118,
      questionCount: 2350,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. Sözcükte Anlam',
      fullName: '1. Sözcükte Anlam ve Söz Öbekleri',
      description: 'Gerçek, yan, mecaz, terim anlam, deyimler, atasözleri, ikilemeler, söz sanatları',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Cümlede Anlam',
      fullName: '2. Cümlede Anlam ve Anlatım Özellikleri',
      description: 'Öznel/nesnel, neden-sonuç, amaç-sonuç, örtülü anlam, üslup-içerik, anlatım ilkeleri',
      startTest: 11,
      endTest: 20,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. Paragrafta Anlam',
      fullName: '3. Paragrafta Anlam, Ana Düşünce ve Konu',
      description: 'Ana fikir, konu, başlık, yardımcı düşünceler, şiirde tema, yazarın tutumu',
      startTest: 21,
      endTest: 30,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 4,
      shortName: '4. Paragrafta Yapı',
      fullName: '4. Paragrafta Yapı, Akış ve Anlatım Biçimleri',
      description: 'Akışı bozan cümle, paragrafı bölme, sıralama, anlatım biçimleri ve düşünceyi geliştirme',
      startTest: 31,
      endTest: 40,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 5,
      shortName: '5. Ses Bilgisi',
      fullName: '5. Ses Bilgisi ve Ses Olayları',
      description: 'Ünlü düşmesi/daralması, ünsüz sertleşmesi/yumuşaması, ulama, kaynaştırma',
      startTest: 41,
      endTest: 50,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 6,
      shortName: '6. Yazım Kuralları',
      fullName: '6. Yazım Kuralları ve Standartları',
      description: 'Büyük harfler, de/ki/mi yazımı, birleşik sözcükler, kısaltmalar, sayılar',
      startTest: 51,
      endTest: 60,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 7,
      shortName: '7. Noktalama İşaretleri',
      fullName: '7. Noktalama İşaretleri ve Kullanımları',
      description: 'Nokta, virgül, noktalı virgül, iki nokta, üç nokta, tırnak ve kesme işareti',
      startTest: 61,
      endTest: 70,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 8,
      shortName: '8. Sözcükte Yapı',
      fullName: '8. Sözcükte Yapı ve Ekler',
      description: 'Kökler, isim ve fiil yapım ekleri, çekim ekleri, gövde, basit/türemiş/birleşik sözcükler',
      startTest: 71,
      endTest: 80,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 9,
      shortName: '9. Sözcük Türleri & Fiil',
      fullName: '9. Sözcük Türleri ve Eylemler',
      description: 'İsim, sıfat, zamir, zarf, edat, bağlaç, fiilimsiler ve fiilde çatı özellikleri',
      startTest: 81,
      endTest: 90,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 10,
      shortName: '10. Cümle & Sözel Mantık',
      fullName: '10. Cümle Bilgisi, Anlatım Bozuklukları ve Sözel Mantık',
      description: 'Cümlenin ögeleri, cümle türleri, anlamsal ve yapısal anlatım bozuklukları, sözel mantık',
      startTest: 91,
      endTest: 100,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 11,
      shortName: '11. PİSA / Yeni Nesil Paragraf',
      fullName: '11. PİSA & Yeni Nesil Analitik Paragraf Soruları (350 Soru)',
      description: 'Çoklu metin sentezi, örtük varsayımlar, mantıksal safsatalar, durum-ilke eşleştirme ve eleştirel okuma',
      startTest: 101,
      endTest: 118,
      questionCount: 350,
    ),
  ];

  static const List<_TopicMeta> _matematikTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tümü (138 Test)',
      fullName: 'KPSS Matematik & Geometri - Tüm Konular (138 Test • 2.550 Soru)',
      description: '12 Konu • 138 Test • 2.550 Özgün, Kademeli, Şekilli, PİSA ve Çözümlü Soru',
      startTest: 1,
      endTest: 138,
      questionCount: 2550,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. Temel Kavramlar & Basamak',
      fullName: '1. Temel Kavramlar, Sayı Kümeleri ve Sayı Basamakları',
      description: 'Doğal/tam sayılar, tek-çift, pozitif-negatif, asal sayılar, faktöriyel ve basamak analizi',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Bölme, EBOB - EKOK',
      fullName: '2. Bölme, Bölünebilme Kuralları, Asal Çarpanlar ve EBOB - EKOK',
      description: 'Bölünebilme kuralları, asal bölenler, EBOB-EKOK özellikleri ve periyodik tekrar problemleri',
      startTest: 11,
      endTest: 20,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. Rasyonel & Ondalık',
      fullName: '3. Rasyonel Sayılar, Ondalık Açılımlar ve Sıralama',
      description: 'Dört işlem, devirli ondalık sayılar, kesirlerde sıralama, merdivenli işlemler',
      startTest: 21,
      endTest: 30,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 4,
      shortName: '4. Eşitsizlik & Mutlak Değer',
      fullName: '4. Basit Eşitsizlikler ve Mutlak Değer',
      description: 'Aralıklar, eşitsizlik özellikleri, mutlak değerli denklemler ve eşitsizlikler',
      startTest: 31,
      endTest: 40,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 5,
      shortName: '5. Üslü ve Köklü Sayılar',
      fullName: '5. Üslü ve Köklü Sayılar',
      description: 'Üslü denklemler, kök dışına çıkarma, köklü işlemlerde eşlenik ve iç içe kökler',
      startTest: 41,
      endTest: 50,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 6,
      shortName: '6. Çarpanlara Ayırma & Oran',
      fullName: '6. Çarpanlara Ayırma, Özdeşlikler ve Oran - Orantı',
      description: 'İki kare farkı, tam kare, küp açılımları, sadeleştirme, doğru/ters orantı ve ortalamalar',
      startTest: 51,
      endTest: 60,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 7,
      shortName: '7. Sayı, Kesir & Yaş Prob.',
      fullName: '7. Sayı, Kesir ve Yaş Problemleri',
      description: 'Denklem kurma, tel kesme, kuyruk, merdiven, mum problemleri ve yaş farkı analizleri',
      startTest: 61,
      endTest: 70,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 8,
      shortName: '8. Yüzde, Karışım & Hız',
      fullName: '8. Yüzde, Kâr-Zarar, Karışım, İşçi ve Hareket (Hız) Problemleri',
      description: 'Maliyet/satış/kâr, saf madde oranları, işçi çalışma kapasitesi, zıt/aynı yönlü hız formülleri',
      startTest: 71,
      endTest: 80,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 9,
      shortName: '9. Kümeler, Fonk. & Olasılık',
      fullName: '9. Kümeler, Fonksiyonlar, Permütasyon, Kombinasyon ve Olasılık',
      description: 'Venn şeması, alt kümeler, bileşke/ters fonksiyon, sayma ilkeleri, P(n,r), C(n,r) ve olasılık',
      startTest: 81,
      endTest: 90,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 10,
      shortName: '10. Sayma, Olasılık & İstatistik',
      fullName: '10. Sayma İlkeleri, Permütasyon, Kombinasyon, Binom, Olasılık ve İstatistik',
      description: 'Faktöriyel, tekrarlı permütasyon, dairesel dizilim, seçim problemleri, basit/koşullu olasılık ve istatistik',
      startTest: 91,
      endTest: 100,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 11,
      shortName: '11. Geometri Soru Bankası (200 Soru)',
      fullName: '11. KPSS Geometri Özel Soru Bankası (20 Konu • 20 Test • 200 Soru)',
      description: 'Açılar, dik üçgen, özel üçgenler, benzerlik, alan, çokgenler, dörtgenler, çember-daire, analitik ve katı cisimler',
      startTest: 101,
      endTest: 120,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 12,
      shortName: '12. PİSA / Günlük Hayat Mat.',
      fullName: '12. PİSA & Yeni Nesil Beceri Temelli Matematik (350 Soru)',
      description: 'Kademeli faturalar, veri analitiği, sepet ve oran optimizasyonu, algoritmik akışlar ve gerçek hayat modellemeleri',
      startTest: 121,
      endTest: 138,
      questionCount: 350,
    ),
  ];

  static final List<_TopicMeta> _cografyaTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tüm Konular',
      fullName: 'KPSS Coğrafya Tüm Konular (130 Test • 2.300 Soru)',
      description: 'ÖSYM standartlarında fiziki, beşerî, ekonomik ve 300 haritalı soru bankası',
      startTest: 1,
      endTest: 130,
      questionCount: 2300,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. Coğrafi Konum & Jeopolitik',
      fullName: '1. Türkiye\'nin Coğrafi Konumu, Matematiksel ve Özel Konum, Jeopolitik',
      description: 'Enlem-boylam, yerel saat, güneş ışınları, bakı, gölge, sınırlar, sınır kapıları ve boğazlar',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Yerşekilleri & Jeoloji',
      fullName: '2. Türkiye\'nin Yerşekilleri, Jeolojik Yapısı, Dağlar, Ovalar ve Platolar',
      description: 'Orojenez, epirojenez, volkanizma, fay hatları, karstik, buzul ve rüzgar şekilleri',
      startTest: 11,
      endTest: 20,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. İklim & Bitki Örtüsü',
      fullName: '3. Türkiye\'nin İklim Elemanları, İklim Tipleri ve Bitki Örtüsü',
      description: 'Sıcaklık, basınç, rüzgarlar, nem ve yağış, mikroklima, orman, maki ve bozkır kuşakları',
      startTest: 21,
      endTest: 30,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 4,
      shortName: '4. Su, Toprak & Afetler',
      fullName: '4. Türkiye\'nin Su Varlığı, Toprak Tipleri ve Doğal Afetleri',
      description: 'Akarsular, göller, kıyı tipleri, zonal-azonal topraklar, erozyon, heyelan ve deprem',
      startTest: 31,
      endTest: 40,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 5,
      shortName: '5. Nüfus, Yerleşme & Göç',
      fullName: '5. Türkiye\'de Nüfusun Dağılışı, Nüfus Politikaları, Göçler ve Yerleşme',
      description: 'Nüfus yoğunlukları, demografik yapı, iç-dış göçler, şehir fonksiyonları ve kır yerleşmeleri',
      startTest: 41,
      endTest: 50,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 6,
      shortName: '6. Tarım & Hayvancılık',
      fullName: '6. Türkiye\'de Tarım Ürünleri, Yetişme Alanları ve Hayvancılık',
      description: 'Tarımda verim faktörleri, tahıllar, sanayi bitkileri, meyve/sebze ve hayvancılık kolları',
      startTest: 51,
      endTest: 60,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 7,
      shortName: '7. Madenler & Enerji',
      fullName: '7. Türkiye\'de Madenler, Maden Yatakları ve Enerji Kaynakları',
      description: 'Metalik madenler, linyit, taş kömürü, petrol, jeotermal, rüzgar, güneş ve hidroelektrik',
      startTest: 61,
      endTest: 70,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 8,
      shortName: '8. Sanayi & Ulaşım',
      fullName: '8. Türkiye\'de Sanayi Kollarının Dağılışı ve Ulaşım Sistemleri',
      description: 'Sanayi kuruluş faktörleri, otomotiv, kimya, gıda, karayolu tünelleri, demiryolu ve limanlar',
      startTest: 71,
      endTest: 80,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 9,
      shortName: '9. Ticaret, Turizm & UNESCO',
      fullName: '9. Türkiye\'de İç/Dış Ticaret, Turizm Çeşitleri ve UNESCO Varlıkları',
      description: 'İhracat-ithalat dengesi, serbest bölgeler, kültür/kış/termal turizmi ve dünya miras alanları',
      startTest: 81,
      endTest: 90,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 10,
      shortName: '10. Bölgesel Projeler & Çevre',
      fullName: '10. Bölgesel Kalkınma Projeleri (GAP, DOKAP, DAP, KOP) ve Çevre Sorunları',
      description: 'Bölgesel projeler, sulama-enerji yatırımları, çevre kirliliği ve küresel iklim etkileri',
      startTest: 91,
      endTest: 100,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 11,
      shortName: '11. Haritalı Coğrafya (300 Soru)',
      fullName: '11. ÖSYM Standartlarında Haritalı Coğrafya Özel Soru Bankası (30 Konu)',
      description: 'Delta ovaları, kıvrım-volkanik dağlar, göller, kıyılar, iklim, tarım, hayvancılık, madenler, ulaşım ve jeopolitik',
      startTest: 101,
      endTest: 130,
      questionCount: 300,
    ),
  ];

  static final List<_TopicMeta> _vatandaslikTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tüm Konular',
      fullName: 'KPSS Vatandaşlık Tüm Konular (100 Test • 2.000 Soru)',
      description: 'Hukuk, Anayasa Tarihi, 1982 Anayasası, Yasama, Yürütme, Yargı ve İdare Hukuku soru bankası',
      startTest: 1,
      endTest: 100,
      questionCount: 2000,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. Hukukun Temel Kavramları',
      fullName: '1. Hukukun Temel Kavramları, Yaptırımlar, Hükümsüzlük ve Haklar',
      description: 'Sosyal düzen kuralları, yaptırım türleri, butlan/yokluk, hak ve fiil ehliyeti',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Devlet Biçimleri & Hükümet',
      fullName: '2. Devletin Unsurları, Devlet Biçimleri, Demokrasi ve Hükümet Sistemleri',
      description: 'Üniter/federal devlet, parlamenter, başkanlık ve cumhurbaşkanlığı hükümet sistemi',
      startTest: 11,
      endTest: 16,
      questionCount: 120,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. Türk Anayasa Tarihi',
      fullName: '3. Türk Anayasa Tarihi (Sened-i İttifak, 1876, 1921, 1924, 1961, 1982)',
      description: 'Kanun-i Esasi, 1921-1924 anayasaları, 1961-1982 karşılaştırması ve 2017 değişiklikleri',
      startTest: 17,
      endTest: 24,
      questionCount: 160,
    ),
    _TopicMeta(
      index: 4,
      shortName: '4. Genel Esaslar & Temel Haklar',
      fullName: '4. 1982 Anayasası: Genel Esaslar ve Temel Hak ve Hürriyetler',
      description: 'İlk 3 madde, sert çekirdek haklar, negatif, pozitif ve aktif statü hakları',
      startTest: 25,
      endTest: 34,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 5,
      shortName: '5. Yasama Organı (TBMM)',
      fullName: '5. Yasama Organı: TBMM\'nin Yapısı, Görevleri, Kanun Yapımı ve Denetim',
      description: 'Milletvekili seçimi, dokunulmazlık, kanun yapım süreci, bütçe ve meclis denetimi',
      startTest: 35,
      endTest: 46,
      questionCount: 240,
    ),
    _TopicMeta(
      index: 6,
      shortName: '6. Yürütme Organı',
      fullName: '6. Yürütme Organı: Cumhurbaşkanlığı, CBK\'ler, Bakanlıklar, MGK ve OHAL',
      description: 'Cumhurbaşkanı seçimi, CBK yetkisi, bakanlar, DDK, MGK yapısı ve OHAL rejimi',
      startTest: 47,
      endTest: 58,
      questionCount: 240,
    ),
    _TopicMeta(
      index: 7,
      shortName: '7. Yargı Organı & Mahkemeler',
      fullName: '7. Yargı Organı: Hâkimlik Teminatı, HSK ve Yüksek Mahkemeler',
      description: 'Anayasa Mahkemesi, bireysel başvuru, norm denetimi, Yargıtay, Danıştay, Sayıştay',
      startTest: 59,
      endTest: 70,
      questionCount: 240,
    ),
    _TopicMeta(
      index: 8,
      shortName: '8. İdare Teşkilatı & Yerel',
      fullName: '8. İdare Hukuku: Teşkilat Yapısı, Başkent, Taşra ve Mahalli İdareler',
      description: 'Yetki genişliği, hiyerarşi, idari vesayet, vali/kaymakam, belediye ve il özel idaresi',
      startTest: 71,
      endTest: 82,
      questionCount: 240,
    ),
    _TopicMeta(
      index: 9,
      shortName: '9. Memurlar & İdari Yargı',
      fullName: '9. İdare Hukuku: 657 DMK Memurluk, İdari İşlemler ve İdari Yargı',
      description: 'Memur hakları ve disiplin cezaları, idari işlemlerin unsurları ve kamulaştırma',
      startTest: 83,
      endTest: 90,
      questionCount: 160,
    ),
    _TopicMeta(
      index: 10,
      shortName: '10. Uluslararası Örgütler & Final',
      fullName: '10. Uluslararası Kuruluşlar (BM, NATO, AB), Güncel Hukuk ve Büyük Final',
      description: 'Küresel/bölgesel kuruluşlar, uluslararası sözleşmeler ve 100. Test Büyük Sentez',
      startTest: 91,
      endTest: 100,
      questionCount: 200,
    ),
  ];

  static const List<_TopicMeta> _mantikTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tümü (30 Test)',
      fullName: 'Sözel Mantık - Tüm Testler',
      description: '3 Konu • 30 Test • 600 Tablolu, Şematik ve Detaylı Çözümlü Soru',
      startTest: 1,
      endTest: 30,
      questionCount: 600,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. Sıralama, Kat & Gün',
      fullName: '1. Konu: Sözel Mantık - Sıralama, Kat, Sıra, Masa ve Gün Senaryoları',
      description: 'Apartman katları, kuyruk ve yarış sıralaması, yuvarlak masa ve vardiya senaryoları',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Eşleştirme & Matris',
      fullName: '2. Konu: Sözel Mantık - Eşleştirme, Çapraz Tablolar ve İhtimal Ağaçları',
      description: 'Otopark araç yerleşimi, reyon ve ürün eşleştirmeleri, çok değişkenli ihtimal analizleri',
      startTest: 11,
      endTest: 20,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. Gruplama & Sentez',
      fullName: '3. Konu: Sözel Mantık - Gruplama, Kümeler, Dağılım ve Büyük ÖSYM Sentezi',
      description: 'ÖSYM tarzı büyük senaryolar, nöbet dağılımları ve çoklu öncüllü akıl yürütme soruları',
      startTest: 21,
      endTest: 30,
      questionCount: 200,
    ),
  ];

  static const List<_TopicMeta> _sayisalMantikTopics = [
    _TopicMeta(
      index: 0,
      shortName: 'Tümü (30 Test)',
      fullName: 'Sayısal Mantık - Tüm Testler',
      description: '3 Bölüm • 30 Test • 600 Soru • Vektörel, Şematik ve Çözümlü',
      startTest: 1,
      endTest: 30,
      questionCount: 600,
    ),
    _TopicMeta(
      index: 1,
      shortName: '1. İşlem, Dizi & Piramit',
      fullName: '1. Bölüm: Sayısal Mantık - İşlem Oyunları, Tanımlı Yeni İşlemler, Sayı Dizileri ve Sayı Piramitleri',
      description: 'Pascal piramitleri, işlem makineleri, periyodik döngüler ve özel tanımlı sayılar',
      startTest: 1,
      endTest: 10,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 2,
      shortName: '2. Şekil, Sudoku & Terazi',
      fullName: '2. Bölüm: Sayısal Mantık - Şekil Yeteneği, Sihirli Kareler, Sudoku Matrisleri ve Terazi Dengesi',
      description: 'Sihirli kareler, hücre yerleştirme, eşit kollu terazi denge sistemleri ve kibrit örüntüleri',
      startTest: 11,
      endTest: 20,
      questionCount: 200,
    ),
    _TopicMeta(
      index: 3,
      shortName: '3. Grafik, Rota & Çark',
      fullName: '3. Bölüm: Sayısal Mantık - Tablo/Grafik Yorumlama, Rota/Yol Ağları, Çarklar ve Büyük ÖSYM Sentezi',
      description: 'Grafik dönüşümleri, yol grafikleri, dişli/çark tur hesapları ve optimizasyon kurguları',
      startTest: 21,
      endTest: 30,
      questionCount: 200,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _allTests = QuestionService.instance.getTestsForCourse(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    final isTarih = widget.courseId == 'tarih';
    final isTurkce = widget.courseId == 'turkce';
    final isCografya = widget.courseId == 'cografya';
    final isVatandaslik = widget.courseId == 'vatandaslik';
    final isMantik = widget.courseId == 'mantik';
    final isSayisalMantik = widget.courseId == 'sayisal_mantik';
    final topics = isTarih
        ? _tarihTopics
        : (isTurkce
            ? _turkceTopics
            : (isCografya
                ? _cografyaTopics
                : (isVatandaslik
                    ? _vatandaslikTopics
                    : (isMantik
                        ? _mantikTopics
                        : (isSayisalMantik ? _sayisalMantikTopics : _matematikTopics)))));
    final currentTopic = _selectedTopicIndex < topics.length
        ? topics[_selectedTopicIndex]
        : topics[0];

    final filteredTests = _allTests.where((t) {
      if (_selectedTopicIndex > 0) {
        if (t.testNum < currentTopic.startTest || t.testNum > currentTopic.endTest) {
          return false;
        }
      }
      if (_searchQuery.isEmpty) return true;
      final query = _searchQuery.toLowerCase();
      return t.testNum.toString().contains(query) ||
          t.subtopicTitle.toLowerCase().contains(query);
    }).toList();

    return ValueListenableBuilder<ThemeModeType>(
      valueListenable: ThemeService.instance.modeNotifier,
      builder: (context, themeMode, _) {
        final bool isDark = themeMode == ThemeModeType.dark;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(widget.courseTitle),
            actions: [
              IconButton(
                tooltip: themeMode == ThemeModeType.dark
                    ? 'Gündüz Modu'
                    : (themeMode == ThemeModeType.light
                        ? 'Sepya / Kâğıt Modu'
                        : 'Karanlık Mod'),
                icon: Icon(
                  themeMode == ThemeModeType.dark
                      ? Icons.light_mode_outlined
                      : (themeMode == ThemeModeType.light
                          ? Icons.auto_stories_outlined
                          : Icons.dark_mode_outlined),
                  color: isDark ? const Color(0xFFFBBF24) : AppColors.primary,
                ),
                onPressed: () => ThemeService.instance.toggleTheme(),
              ),
            ],
          ),
          body: Column(
            children: [
              // Topic Tabs (Horizontal scroll chips)
              _buildTopicTabs(topics, widget.courseId),

              // Dynamic Topic Header Card
              Container(
                margin: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isTarih
                        ? [const Color(0xFF312E81), const Color(0xFF4338CA)]
                        : (isTurkce
                            ? [const Color(0xFF0F766E), const Color(0xFF0284C7)]
                            : (isCografya
                                ? [const Color(0xFF065F46), const Color(0xFF059669)]
                                : (isVatandaslik
                                    ? [const Color(0xFF3730A3), const Color(0xFF4F46E5)]
                                    : (isMantik
                                        ? [const Color(0xFF581C87), const Color(0xFF7E22CE)]
                                        : [const Color(0xFF9A3412), const Color(0xFFD97706)])))),
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: (isTarih
                              ? const Color(0xFF4338CA)
                              : (isTurkce
                                  ? const Color(0xFF0F766E)
                                  : (isCografya
                                      ? const Color(0xFF059669)
                                      : (isVatandaslik
                                          ? const Color(0xFF4F46E5)
                                          : (isMantik
                                              ? const Color(0xFF9333EA)
                                              : const Color(0xFFD97706))))))
                          .withValues(alpha: 0.3),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: (isTarih
                                    ? AppColors.accent
                                    : (isTurkce
                                        ? const Color(0xFF2DD4BF)
                                        : (isCografya
                                            ? const Color(0xFF34D399)
                                            : (isVatandaslik
                                                ? const Color(0xFFA5B4FC)
                                                : (isMantik
                                                    ? const Color(0xFFE879F9)
                                                    : const Color(0xFFFDE047))))))
                                .withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: (isTarih
                                      ? AppColors.accent
                                      : (isTurkce
                                          ? const Color(0xFF2DD4BF)
                                          : (isCografya
                                              ? const Color(0xFF34D399)
                                              : (isVatandaslik
                                                  ? const Color(0xFFA5B4FC)
                                                  : (isMantik
                                                      ? const Color(0xFFE879F9)
                                                      : const Color(0xFFFDE047))))))
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                          child: Text(
                            _selectedTopicIndex == 0 ? 'TAM ARŞİV' : '$_selectedTopicIndex. KONU',
                            style: TextStyle(
                              color: isTarih
                                  ? AppColors.accent
                                  : (isTurkce
                                      ? const Color(0xFF2DD4BF)
                                      : (isCografya
                                          ? const Color(0xFF34D399)
                                          : (isVatandaslik
                                              ? const Color(0xFFA5B4FC)
                                              : (isMantik
                                                  ? const Color(0xFFE879F9)
                                                  : const Color(0xFFFDE047))))),
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${currentTopic.questionCount} Soru (${currentTopic.endTest - currentTopic.startTest + 1} Test)',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currentTopic.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currentTopic.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Search input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: TextField(
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Konu veya test no ara...',
                    hintStyle: TextStyle(color: AppColors.textMuted),
                    prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.cardBorder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.cardBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),

              // Test cards list
              Expanded(
                child: filteredTests.isEmpty
                    ? Center(
                        child: Text(
                          'Aramanıza uygun test bulunamadı.',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        itemCount: filteredTests.length,
                        itemBuilder: (context, index) {
                          final test = filteredTests[index];
                          return _buildTestCard(test);
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopicTabs(List<_TopicMeta> topics, String courseId) {
    final isTarih = courseId == 'tarih';
    final isTurkce = courseId == 'turkce';
    final isCografya = courseId == 'cografya';
    final isVatandaslik = courseId == 'vatandaslik';
    final isMantik = courseId == 'mantik';
    final isSayisalMantik = courseId == 'sayisal_mantik';
    final selectedColor = isTarih
        ? AppColors.primary
        : (isTurkce
            ? const Color(0xFF0D9488)
            : (isCografya
                ? const Color(0xFF059669)
                : (isVatandaslik
                    ? const Color(0xFF4F46E5)
                    : (isMantik
                        ? const Color(0xFF9333EA)
                        : (isSayisalMantik
                            ? const Color(0xFF0284C7)
                            : const Color(0xFFD97706))))));
    final activeBorderColor = isTarih
        ? AppColors.primaryLight
        : (isTurkce
            ? const Color(0xFF14B8A6)
            : (isCografya
                ? const Color(0xFF10B981)
                : (isVatandaslik
                    ? const Color(0xFF818CF8)
                    : (isMantik
                        ? const Color(0xFFC084FC)
                        : (isSayisalMantik
                            ? const Color(0xFF38BDF8)
                            : const Color(0xFFF59E0B))))));

    return Container(
      height: 44,
      margin: const EdgeInsets.only(top: 8, bottom: 4),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: topics.length,
        itemBuilder: (context, idx) {
          final isSelected = _selectedTopicIndex == idx;
          final topic = topics[idx];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(topic.shortName),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedTopicIndex = idx);
                }
              },
              backgroundColor: AppColors.surface,
              selectedColor: selectedColor,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isSelected ? activeBorderColor : AppColors.cardBorder,
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildTestCard(TestSummary test) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () async {
            // Defense-in-depth lisans ve kripto imza kontrolü
            final canAccess = await SecurityService.instance.canAccessTest(test.testNum);
            if (!canAccess) {
              if (mounted) {
                SecurityService.instance.showLicenseLockDialog(
                  context: context,
                  featureTitle: '${widget.courseTitle} - Test ${test.testNum}',
                );
              }
              return;
            }

            QuestionService.instance.recordLastStudied(
              courseId: widget.courseId,
              courseTitle: widget.courseTitle,
              testNum: test.testNum,
              subtopicTitle: test.subtopicTitle,
            );
            final questions = QuestionService.instance.getQuestionsForTest(
              widget.courseId,
              test.testNum,
            );
            if (mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamScreen(
                    title: '${widget.courseTitle} - Test ${test.testNum}',
                    questions: questions,
                  ),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Test number icon container
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${test.testNum}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Title and Question count
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        test.subtopicTitle,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.help_outline_rounded, size: 14, color: AppColors.primaryLight),
                          const SizedBox(width: 4),
                          Text(
                            '${test.questionCount} Soru (Çözümlü)',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'PDF Olarak İndir / Yazdır',
                  icon: const Icon(Icons.picture_as_pdf_rounded, size: 20, color: Color(0xFFEF4444)),
                  onPressed: () async {
                    final canPdf = await SecurityService.instance.canExportPdf();
                    if (!canPdf) {
                      if (mounted) {
                        SecurityService.instance.showLicenseLockDialog(
                          context: context,
                          featureTitle: 'A4 PDF Kitapçık Çıktısı',
                        );
                      }
                      return;
                    }
                    final questions = QuestionService.instance.getQuestionsForTest(
                      widget.courseId,
                      test.testNum,
                    );
                    if (mounted) {
                      PdfService.instance.exportQuestionsAsPdf(
                        context: context,
                        title: '${widget.courseTitle} - Test ${test.testNum}',
                        questions: questions,
                      );
                    }
                  },
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
