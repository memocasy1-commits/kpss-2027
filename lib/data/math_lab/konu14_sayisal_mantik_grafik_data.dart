import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 14: Sayısal Mantık ve Tablo - Grafik Yorumlama İnteraktif Veri Kümesi
class Konu14SayisalMantikGrafikData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 14,
    title: 'Sayısal Mantık & Grafik Yorumlama',
    subtitle: '360° Daire Grafiği Dönüşümü, Saat-Açı Modeli, Örüntü Şifreleri ve Yüzde Artış Kıyaslaması',
    icon: Icons.query_stats_rounded,
    themeColor: Color(0xFF475569), // Slate-600
    osymWeight: '4 - 6 Soru (Sınavın Son Bölümü)',
    keyOutcomes: [
      'Daire grafiğinde tüm bütünün 360° olduğunu bilip derece-miktar oranını saniyeler içinde kurmak',
      'Saat-açı sorularında |(11·Dakika - 60·Saat) / 2| formülüyle akrebin kaymasını da katarak dar açıyı bulmak',
      'Tablo ve sütun grafiklerinde yüzde artış hesaplarken daima "İlk Değere" bölündüğünü refleks yapmak',
      'Sayısal mantık örüntülerinde farklar dizisini (ardışık artışları) inceleyerek genel terimi yakalamak',
    ],
    socraticProblems: [
      // PROBLEM 1: Daire Grafiği Derece - Kişi Dönüşümü
      SocraticProblem(
        id: 'socratic_k14_p1',
        title: 'Daire Grafiği: 720 Kişilik Şirkette C Departmanı',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Grafik Sorusu',
        rawQuestion: 'Toplam 720 çalışanı olan bir şirkette çalışanların departmanlara dağılımı daire grafiğinde gösterilmiştir.\nA departmanı 100°, B departmanı 140° ve C departmanı geriye kalan açıyı temsil ettiğine göre, C departmanında KAÇ KİŞİ çalışmaktadır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: C Departmanının Merkez Açısını Bulma',
            prompt: 'Daire grafiğinin tamamı 360°\'dir. A (100°) ve B (140°) bilindiğine göre C departmanına kaç derece kalır?',
            mathematicalHint: '360° - (100° + 140°) = 360° - 240° = 120°.',
            options: [
              '360° - 240° = 120°',
              '100° - 40° = 60°',
              '140°',
              '100°',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Dairenin tamamı 360° olduğu için C departmanının merkez açısı 120°\'dir.',
            goldenTactic: 'Daire grafiklerinde ilk işlem eksik merkez açıyı 360°\'ye tamamlamaktır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: 360° ile 720 Kişi Arasındaki Oranı Kurma',
            prompt: '360° tamamı 720 kişiyi temsil ediyorsa her 1° kaç kişiye karşılık gelir?',
            mathematicalHint: '720 / 360 = 2 kişi (1° = 2 kişi).',
            options: [
              '1° = 2 kişi',
              '1° = 1 kişi',
              '1° = 0.5 kişi',
              '1° = 4 kişi',
            ],
            correctOptionIndex: 0,
            explanation: '720 / 360 = 2 kişi. Demek ki her 1 derecelik dilim tam 2 çalışanı temsil etmektedir.',
            goldenTactic: '🎯 KESTİRME: Toplam / 360 oranıyla 1 derecenin değerini bulun, sonra açıyla çarpın!',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: C Departmanındaki Kişi Sayısı',
            prompt: 'C departmanı 120° olduğuna göre kaç kişi çalışmaktadır?',
            mathematicalHint: '120 · 2 = 240 kişi.',
            options: [
              '120 · 2 = 240 kişi',
              '200 kişi',
              '280 kişi',
              '180 kişi',
            ],
            correctOptionIndex: 0,
            explanation: '120° · 2 = 240 kişi çalışmaktadır. (A = 200 kişi, B = 280 kişi, C = 240 kişi. Toplam = 720).',
            goldenTactic: '120° dairenin tam 1/3\'ü olduğu için 720 / 3 = 240 da doğrudan bulunabilir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: C departmanında 240 kişi çalışmaktadır.',
      ),

      // PROBLEM 2: Saat ve Açı Problemi
      SocraticProblem(
        id: 'socratic_k14_p2',
        title: 'Saat-Açı Formülü: Saat 03:40 İken Akrep ile Yelkovan Arasındaki Açı',
        examYear: 'KPSS Sayısal Mantık Seçici Soru',
        rawQuestion: 'Saat 03:40 iken akrep ile yelkovan arasındaki DAR AÇI kaç derecedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Saat - Açı Formülünü Uygulama',
            prompt: 'Akrep ile yelkovan arasındaki açı formülü: Açı = |(11 · Dakika - 60 · Saat) / 2|\'dir. Saat = 3 ve Dakika = 40 için formülü yazalım:',
            mathematicalHint: '|(11 · 40 - 60 · 3) / 2| = |(440 - 180) / 2|.',
            options: [
              '|(440 - 180) / 2| = |260 / 2| = 130°',
              '150° (Akrebin hareketini unutanların cevabı: 5 aralık · 30°)',
              '120°',
              '140°',
            ],
            correctOptionIndex: 0,
            explanation: 'Formülden: |(11·40 - 60·3) / 2| = |(440 - 180) / 2| = 260 / 2 = 130° bulunur.',
            goldenTactic: '🎯 FORMÜL: Açı = |11M - 60H| / 2 (Sonuç 180\'den büyük çıkarsa 360\'tan çıkarıp dar açı alınır).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Dar açı 130 derecedir.',
      ),

      // PROBLEM 3: Yüzde Artış Hesabı
      SocraticProblem(
        id: 'socratic_k14_p3',
        title: 'Grafik Yorumlama: 2022\'de 80 Ton, 2023\'te 100 Ton Üretim',
        examYear: 'KPSS Tablo-Grafik Standart Yüzde Sorusu',
        rawQuestion: 'Bir fabrikanın buğday üretimi 2022 yılında 80 ton iken 2023 yılında 100 tona yükselmiştir.\nBuna göre, buğday üretimindeki ARTIŞ ORANI YÜZDE KAÇTIR?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Artış Miktarını ve Referans Değeri Belirleme',
            prompt: 'Artış miktarı 100 - 80 = 20 tondur. Yüzde hesaplanırken bu 20 ton hangi yıla (hangi değere) oranlanır?',
            mathematicalHint: 'Artış oranı daima İLK YILA (başlangıç değeri 80 tona) oranlanır: 20 / 80.',
            options: [
              'Başlangıç yılı olan 2022\'ye (80 tona) oranlanır: 20 / 80.',
              'Son yıla (100 tona) oranlanır: 20 / 100 = %20.',
              'Ortalamaya oranlanır.',
              'Fark doğrudan yüzdedir: %20.',
            ],
            correctOptionIndex: 0,
            explanation: 'Büyük tuzak! Artış oranı her zaman BAŞLANGIÇ değerine bölünür: 20 / 80 = 1/4 = %25.',
            goldenTactic: '🎯 TUZAK: 100\'e bölüp %20 demek klasik çeldiricidir! Artış = (Fark / İlk Değer) · 100.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Yüzde Değerini Bulma',
            prompt: '20 / 80 = 1/4 kesri yüzde kaça karşılık gelir?',
            mathematicalHint: '(1 / 4) · 100 = %25.',
            options: [
              '%25',
              '%20 (Tuzak şık!)',
              '%15',
              '%30',
            ],
            correctOptionIndex: 0,
            explanation: '(20 / 80) · 100 = %25 artış olmuştur.',
            goldenTactic: 'Paydaya daima "Eski Durum" yazılır.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Artış oranı %25\'tir.',
      ),

      // PROBLEM 4: Sayı Örüntüsü
      SocraticProblem(
        id: 'socratic_k14_p4',
        title: 'Örüntü ve Farklar Dizisi: 3, 7, 13, 21, 31, ...',
        examYear: 'KPSS Sayısal Mantık Örüntü Sorusu',
        rawQuestion: '3, 7, 13, 21, 31, ...\ndizisinin 7. TERİMİ kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Ardışık Terimler Arasındaki Artış Miktarını İnceleme',
            prompt: 'Terimler arasındaki farklara bakalım: 7 - 3 = 4, 13 - 7 = 6, 21 - 13 = 8, 31 - 21 = 10. Artışlar nasıl ilerliyor?',
            mathematicalHint: 'Artışlar 2\'şer 2\'şer artan çift sayılardır: +4, +6, +8, +10, +12, +14...',
            options: [
              'Artışlar 4, 6, 8, 10 şeklinde 2\'şer 2\'şer artmaktadır.',
              'Terimler sabit 4 artmaktadır.',
              'Terimler 2 ile çarpılmaktadır.',
              'Artışlar tek sayılardır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Farklar dizisi: 4, 6, 8, 10... şeklinde ilerlemektedir. Bir sonraki artış +12, ardından +14 olacaktır.',
            goldenTactic: 'Sayısal mantık dizilerinde terimlerin farklarını yazmak kuralı hemen gösterir.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: 6. ve 7. Terimleri Hesaplama',
            prompt: '5. terim 31 olduğuna göre, 6. terim (31 + 12) ve 7. terim (6. terim + 14) kaçtır?',
            mathematicalHint: '6. terim = 31 + 12 = 43. 7. terim = 43 + 14 = 57.',
            options: [
              '57',
              '43',
              '55',
              '61',
            ],
            correctOptionIndex: 0,
            explanation: '6. terim = 31 + 12 = 43. 7. terim = 43 + 14 = 57 bulunur.',
            goldenTactic: 'Kısa adımlarda formül çıkarmak yerine farkları ekleyerek gitmek daha güvenlidir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 7. terim 57\'dir.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k14_1',
        questionText: 'Daire grafiğindeki yüzdelik dilim ile derece ilişkisi nedir?',
        studentSteps: [
          'Adım 1: Grafiğin tamamı %100\'dür.',
          'Adım 2: Açılar da 100 derece üzerinden paylaştırılır.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci dairenin tamamını 100 derece zannetmiştir! Dairenin tamamı 360 DERECEDİR. %100 = 360° eşleşmesi yapılmalıdır.',
        correctSolution: 'Dairenin tamamı 360°\'dir. %100 = 360° ⟹ %10 = 36°.',
        trapRule: 'Daire grafiği daima 360° üzerinden hesaplanır!',
      ),
      TrapScenario(
        id: 'trap_k14_2',
        questionText: 'Saat 06:00\'da akrep ile yelkovan arasındaki açı kaç derecedir?',
        studentSteps: [
          'Adım 1: Akrep 6\'da, yelkovan 12\'dedir.',
          'Adım 2: Açı 90 derecedir.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci kadranı dik açı zannetmiştir. 6 ile 12 tam zıt yöndedir; düz bir doğru oluşturur ve açı 180 DERECEDİR.',
        correctSolution: 'Kadran 12 eşit parçaya bölünür: 360 / 12 = 30°. 6 aralık vardır: 6 · 30° = 180°.',
        trapRule: 'Saat kadranında ardışık iki sayı arası 30 derecedir (360 / 12 = 30°).',
      ),
      TrapScenario(
        id: 'trap_k14_3',
        questionText: 'Fiyatı 50 TL olan ürün 75 TL\'ye çıkarsa artış yüzde kaçtır?',
        studentSteps: [
          'Adım 1: Fark: 75 - 50 = 25 TL.',
          'Adım 2: Yeni fiyata bölerim: 25 / 75 = %33.3 artmıştır dedim.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci artışı yeni fiyata (75 TL) bölmüştür! Artış oranı daima İLK FİYATA (50 TL) bölünür: 25 / 50 = 1/2 = %50 artmıştır.',
        correctSolution: 'Artış Yüzdesi = (Artış Miktarı / İlk Değer) · 100 = (25 / 50) · 100 = %50.',
        trapRule: 'Yüzde değişim daima başlangıç değerine (eski duruma) oranlanır!',
      ),
    ],
  );
}
