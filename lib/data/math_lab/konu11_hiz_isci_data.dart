import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 11: Hız (Hareket) ve İşçi Problemleri İnteraktif Veri Kümesi
class Konu11HizIsciData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 11,
    title: 'Hız (Hareket) ve İşçi Problemleri',
    subtitle: 'Ortalama Hız Tuzağı, Zıt/Aynı Yön Formülleri, Tren-Tünel Mesafesi ve 1 Günde Yapılan İş Modeli',
    icon: Icons.speed_rounded,
    themeColor: Color(0xFFEA580C), // Orange-600
    osymWeight: '2 - 3 Soru (Klasik Problem Alanı)',
    keyOutcomes: [
      'Gidiş-dönüş ortalama hızının hızların aritmetik ortalaması değil harmonik ortalaması (2V₁V₂ / (V₁+V₂)) olduğunu refleks yapmak',
      'Zıt yönde hızların toplandığını (V₁ + V₂), aynı yönde yakalamada hızların farkının alındığını (V₁ - V₂) bilmek',
      'Tren-tünel problemlerinde katedilen toplam yolun "Tren Boyu + Tünel Boyu" olduğunu ve km/sa - m/sn birim dönüşümünü hatasız yapmak',
      'İşçi problemlerini "1 günde yapılan iş" (1/A + 1/B = 1/T) mantığıyla saniyeler içinde çözmek',
    ],
    socraticProblems: [
      // PROBLEM 1: Gidiş-Dönüş Ortalama Hız Tuzağı
      SocraticProblem(
        id: 'socratic_k11_p1',
        title: 'Ortalama Hız Tuzağı: Gidiş 60 km/sa, Dönüş 40 km/sa',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Hız Sorusu',
        rawQuestion: 'Bir araç A kentinden B kentine 60 km/sa hızla gidip, hiç durmadan 40 km/sa hızla geri dönüyor.\nBu aracın tüm yolculuktaki ORTALAMA HIZI saatte kaç km\'dir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Ortalama Hız Tanımı',
            prompt: 'Ortalama hız nasıl hesaplanır? (60 + 40) / 2 = 50 km/sa midir?',
            mathematicalHint: 'V_ort = Toplam Yol / Toplam Zaman. Hızların aritmetik ortalaması değildir!',
            options: [
              'Hayır, 50 km/sa DEĞİLDİR! V_ort = (Toplam Yol) / (Toplam Zaman) formülüyle hesaplanır.',
              'Evet, doğrudan hızların aritmetik ortalamasıdır: (60 + 40)/2 = 50.',
              '60 · 40 = 2400 / 100 = 24 km/sa\'dir.',
              'Araba yavaş döndüğü için 40 km/sa\'dir.',
            ],
            correctOptionIndex: 0,
            explanation: 'Büyük tuzak! Yavaş hızda daha fazla zaman harcandığı için ortalama hız yavaş olan hıza daha yakındır (50\'den küçüktür).',
            goldenTactic: '🎯 TUZAK İKAZI: Ortalama hız ASLA hızların aritmetik ortalaması değildir!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Yola Değer Verme (EKOK) veya Harmonik Ortalama',
            prompt: 'Yol mesafesine EKOK(60, 40) = 120 km diyelim. Gidiş süresi t₁ ve dönüş süresi t₂ kaç saat sürer?',
            mathematicalHint: 't₁ = 120 / 60 = 2 saat. t₂ = 120 / 40 = 3 saat. Toplam Zaman = 5 saat.',
            options: [
              'Gidiş 2 saat, dönüş 3 saat sürer (Toplam = 5 saat).',
              'Gidiş 3 saat, dönüş 2 saat sürer.',
              'Her ikisi de 2.5 saat sürer.',
              'Toplam 6 saat sürer.',
            ],
            correctOptionIndex: 0,
            explanation: 't₁ = 120 / 60 = 2 saat; t₂ = 120 / 40 = 3 saat. Toplam süre: 2 + 3 = 5 saattir.',
            goldenTactic: 'Hız problemlerinde yola hızların EKOK\'u kadar değer vermek rasyonel işlem yükünü sıfırlar.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Toplam Yol / Toplam Zaman Hesabı',
            prompt: 'Gidiş 120 km, dönüş 120 km olduğuna göre Toplam Yol = 240 km\'dir. V_ort = 240 / 5 kaçtır?',
            mathematicalHint: '240 / 5 = 48 km/sa.',
            options: [
              '48 km/sa (veya Formül: 2·60·40 / (60+40) = 4800 / 100 = 48).',
              '50 km/sa',
              '45 km/sa',
              '52 km/sa',
            ],
            correctOptionIndex: 0,
            explanation: 'V_ort = 240 / 5 = 48 km/sa bulunur. Gidiş-dönüşte pratik formül: 2·V₁·V₂ / (V₁ + V₂) = 2·60·40 / 100 = 48.',
            goldenTactic: 'Eşit yolda gidiş-dönüş ortalama hız formülü: 2·V₁·V₂ / (V₁ + V₂).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Ortalama hız saatte 48 km\'dir.',
      ),

      // PROBLEM 2: Zıt Yönlü Karşılaşma
      SocraticProblem(
        id: 'socratic_k11_p2',
        title: 'Zıt Yönlü Karşılaşma: 450 km Mesafe, 40 ve 50 km/sa',
        examYear: 'KPSS Genel Yetenek Standart Hareket Sorusu',
        rawQuestion: 'Aralarındaki mesafe 450 km olan iki şehirden aynı anda birbirlerine doğru saatte 40 km ve 50 km hızla iki araç hareket ediyor.\nBu iki araç hareket ettikten KAÇ SAAT SONRA karşılaşırlar?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Zıt Yönlü Harekette Bağıl Hız',
            prompt: 'İki araç birbirine doğru (zıt yönde) hareket ettiğinde 1 saatte birbirlerine ne kadar yaklaşırlar?',
            mathematicalHint: 'Hızlar toplanır: V_toplam = V₁ + V₂ = 40 + 50 = 90 km/sa.',
            options: [
              'Hızlar toplanır: 40 + 50 = 90 km/sa hızla yaklaşırlar.',
              'Hızlar çıkarılır: 50 - 40 = 10 km/sa.',
              'Hızlar çarpılır.',
              '45 km yaklaşırlar.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Birbirlerine doğru geldiklerinde aralarındaki mesafe saatte hızlarının toplamı (40 + 50 = 90 km) kadar kapanır.',
            goldenTactic: 'Karşılaşma formülü: Yol = (V₁ + V₂) · t.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Karşılaşma Süresini Hesaplama',
            prompt: 'Aralarındaki 450 km mesafe saatte 90 km hızla kapanıyorsa t süresi kaçtır?',
            mathematicalHint: 't = 450 / 90 = 5 saat.',
            options: [
              't = 450 / 90 = 5 saat.',
              't = 450 / 10 = 45 saat.',
              't = 4 saat.',
              't = 6 saat.',
            ],
            correctOptionIndex: 0,
            explanation: 't = Yol / (V₁ + V₂) = 450 / 90 = 5 saat sonra karşılaşırlar.',
            goldenTactic: 'Eğer aynı yönde gitselerdi hızlar farkı alınırdı: t = Yol / (V₁ - V₂).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 5 saat sonra karşılaşırlar.',
      ),

      // PROBLEM 3: Tren - Tünel Problemi ve Birim Çevirme
      SocraticProblem(
        id: 'socratic_k11_p3',
        title: 'Tren ve Tünel: 150m Tren, 350m Tünel, 72 km/sa Hız',
        examYear: 'KPSS Lisans / Seçici Hareket Problemi',
        rawQuestion: 'Boyu 150 metre olan bir tren, 350 metre uzunluğundaki bir tüneli saatte 72 km sabit hızla KAÇ SANİYEDE tamamen geçer?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Alınan Toplam Yolu Belirleme',
            prompt: 'Bir trenin bir tüneli tamamen geçmesi için trenin son vagonunun da tünelden çıkması gerekir. Alınan toplam yol kaç metredir?',
            mathematicalHint: 'Toplam Yol = Tren Boyu + Tünel Boyu = 150 + 350 = 500 metre.',
            options: [
              'Toplam Yol = 150 + 350 = 500 metredir.',
              'Toplam Yol sadece tüneldir (350 metre).',
              'Toplam Yol sadece trendir (150 metre).',
              'Toplam Yol 150 · 350 metredir.',
            ],
            correctOptionIndex: 0,
            explanation: 'Trenin tüneli tamamen terk etmesi için kendi boyunu da katetmesi şarttır: Yol = 150 + 350 = 500 metre.',
            goldenTactic: '🎯 KURAL: Tren tüneli geçerken Yol = Tren + Tünel olur!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: km/sa Hızı m/sn\'ye Çevirme',
            prompt: 'Yol metre ve zaman saniye sorulduğuna göre 72 km/saat hızı metre/saniyeye nasıl çeviririz?',
            mathematicalHint: '72 · (1000 m / 3600 sn) = 72 / 3.6 = 20 m/sn.',
            options: [
              '72 / 3.6 = 20 m/sn (veya 72 · 10/36 = 20 m/sn).',
              '72 m/sn aynen kalır.',
              '72 · 3.6 = 259.2 m/sn.',
              '7.2 m/sn.',
            ],
            correctOptionIndex: 0,
            explanation: '1 km/sa = 1000m / 3600sn = 1/3.6 m/sn. 72 / 3.6 = 20 m/sn olur.',
            goldenTactic: 'km/sa\'den m/sn\'ye geçerken sayıyı 3.6\'ya bölün (veya 10/36 ile çarpın).',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Geçiş Süresini Bulma',
            prompt: '500 metre yol 20 m/sn hızla kaç saniyede tamamlanır?',
            mathematicalHint: 't = 500 / 20 = 25 saniye.',
            options: [
              '25 saniyede geçer.',
              '50 saniyede geçer.',
              '17.5 saniyede geçer.',
              '20 saniyede geçer.',
            ],
            correctOptionIndex: 0,
            explanation: 't = Yol / Hız = 500 / 20 = 25 saniye sürer.',
            goldenTactic: 'Birim uyumuna dikkat: metre ile m/sn, km ile km/sa eşleşmelidir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Tren tüneli 25 saniyede tamamen geçer.',
      ),

      // PROBLEM 4: İşçi Problemi (Birlikte Çalışma)
      SocraticProblem(
        id: 'socratic_k11_p4',
        title: 'Birlikte İş Yapma: Ali 12 Gün, Veli 6 Gün',
        examYear: 'KPSS Standart İşçi Problemi',
        rawQuestion: 'Ali bir işi tek başına 12 günde, Veli ise aynı işi tek başına 6 günde bitirebiliyor.\nİkisi birlikte çalışırlarsa bu işi KAÇ GÜNDE bitirirler?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: 1 Günde Yapılan İş Miktarını Yazma',
            prompt: 'Ali 1 günde işin 1/12\'sini, Veli 1/6\'sını yapar. İkisi 1 günde işin kaçta kaçını bitirir?',
            mathematicalHint: '1/12 + 1/6 = 1/12 + 2/12 = 3/12 = 1/4.',
            options: [
              '1/12 + 1/6 = 3/12 = 1/4\'ünü bitirirler.',
              '12 + 6 = 18 günde bitirirler (Büyük Hata!).',
              '1/18\'ini bitirirler.',
              'İşin yarısını bitirirler.',
            ],
            correctOptionIndex: 0,
            explanation: '1 günde yapılan toplam iş = 1/12 + 1/6 = 1/12 + 2/12 = 3/12 = 1/4\'tür.',
            goldenTactic: 'İşçi problemlerinde temel mantık: 1 günde yapılan işleri toplamaktır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: İşin Tamamının Bitme Süresi',
            prompt: 'İkisi 1 günde işin 1/4\'ünü bitiriyorsa işin tamamı (4/4) kaç günde biter?',
            mathematicalHint: '1 / (1/4) = 4 gün.',
            options: [
              '4 günde biter.',
              '6 günde biter.',
              '3 günde biter.',
              '9 günde biter.',
            ],
            correctOptionIndex: 0,
            explanation: '1 günde 1/4\'ü bitiyorsa tamamı 4 günde biter. (Pratik Formül: (A · B) / (A + B) = (12 · 6) / (12 + 6) = 72 / 18 = 4 gün).',
            goldenTactic: 'İki işçi için pratik süre: (A · B) / (A + B).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: İkisi birlikte 4 günde bitirir.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k11_1',
        questionText: 'Gidiş hızı 60 km/sa, dönüş hızı 40 km/sa olan bir aracın ortalama hızı nedir?',
        studentSteps: [
          'Adım 1: Hızlar 60 ve 40\'tır.',
          'Adım 2: Ortalama hız = (60 + 40) / 2 = 50 km/sa buldum.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci ortalama hızı aritmetik ortalama sanmıştır. Yavaş hızda daha uzun süre gidildiği için ortalama hız yavaş tarafa kayar: V_ort = 2·V₁·V₂ / (V₁+V₂) = 48 km/sa olmalıdır.',
        correctSolution: 'V_ort = (Toplam Yol) / (Toplam Zaman) = 2·60·40 / (60+40) = 48 km/sa.',
        trapRule: 'Gidiş-dönüş ortalama hızı ASLA aritmetik ortalama değildir, harmonik ortalamadır (48 km/sa)!',
      ),
      TrapScenario(
        id: 'trap_k11_2',
        questionText: 'Tren bir tüneli geçerken aldığı yol ne kadardır?',
        studentSteps: [
          'Adım 1: Tren tünelin başından girip sonundan çıkar.',
          'Adım 2: Dolayısıyla aldığı yol sadece tünelin uzunluğudur.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci trenin kendi boyunu hesaba katmamıştır. Trenin tüneli tamamen geçmesi için son vagonun da dışarı çıkması gerekir; yani kendi boyu kadar ek yol almalıdır.',
        correctSolution: 'Alınan Yol = Trenin Boyu + Tünelin Boyu olmalıdır.',
        trapRule: 'Tren tünel, köprü veya istasyon geçerken kendi boyunu da katetmek zorundadır.',
      ),
      TrapScenario(
        id: 'trap_k11_3',
        questionText: 'Ali işi 10 günde, Veli 15 günde bitiriyor. Birlikte kaç günde bitirirler?',
        studentSteps: [
          'Adım 1: Ali 10 gün, Veli 15 gün çalışır.',
          'Adım 2: Günleri toplarım: 10 + 15 = 25 gün sürer.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci günleri toplamıştır! İki kişi beraber çalışınca iş DAHA KISA sürede biter (en hızlı işçiden bile daha kısa sürmelidir, yani 10 günden az olmalıdır).',
        correctSolution: '(10 · 15) / (10 + 15) = 150 / 25 = 6 gün sürer.',
        trapRule: 'Birlikte çalışma süresi her zaman tek başına çalışan en hızlı işçinin süresinden daha küçüktür!',
      ),
    ],
  );
}
