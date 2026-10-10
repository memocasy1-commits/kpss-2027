import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 13: Permütasyon, Kombinasyon ve Olasılık İnteraktif Veri Kümesi
class Konu13OlasilikPermutasyonData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 13,
    title: 'Permütasyon, Kombinasyon & Olasılık',
    subtitle: 'Sıralama (P) vs. Seçme (C) Ayrımı, Tekrarlı Permütasyon ve Tümleyen Olasılık Kestirmesi',
    icon: Icons.casino_rounded,
    themeColor: Color(0xFFDB2777), // Pink-600
    osymWeight: '2 - 3 Soru (Sınavın Belirleyici Soruları)',
    keyOutcomes: [
      'Sıranın önemli olduğu durumlarda Permütasyon (P), seçimin önemli olduğu durumlarda Kombinasyon (C) kullanmayı ayırt etmek',
      'Tekrarlı harf ve yol problemlerinde n! / (a! · b!) formülünü refleks haline getirmek',
      '"En az biri..." sorularında 1 - P(İstenmeyen) tümleyen kuralıyla çözüme saniyeler içinde ulaşmak',
      'Olasılık sorularında İstenen Durum / Tüm Durumlar oranını kombinasyon yardımıyla hatasız kurmak',
    ],
    socraticProblems: [
      // PROBLEM 1: Permütasyon vs. Kombinasyon Ayrımı
      SocraticProblem(
        id: 'socratic_k13_p1',
        title: 'Seçme vs Sıralama: 7 Kişiden 3 Kişilik Komisyon',
        examYear: 'KPSS Lisans / Ön Lisans Temel Kavram Sorusu',
        rawQuestion: '7 kişi arasından 3 kişilik bir çalışma komisyonu KAÇ FARKLI ŞEKİLDE seçilebilir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Permütasyon mu Kombinasyon mu?',
            prompt: 'Komisyonda kişilerin sıralaması veya unvanı (başkan, sekreter gibi) önemli midir, yoksa sadece grubun kendisi mi seçilmektedir?',
            mathematicalHint: 'Sıra önemsiz sadece seçim varsa KOMBİNASYON C(n, r) kullanılır.',
            options: [
              'Sıra önemsizdir, sadece kişi seçimi olduğu için KOMBİNASYON C(7, 3) kullanılır.',
              'Sıra önemlidir, PERMÜTASYON P(7, 3) kullanılır.',
              'Faktöriyel alınır (7!).',
              '7 · 3 = 21 olur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Grup, ekip, komisyon ve takım oluşturmada sıra önemsizdir; dolayısıyla Kombinasyon kullanılır.',
            goldenTactic: '🎯 KURAL: Sıralama/dizilim/unvan varsa PERMÜTASYON, sadece seçim/grup varsa KOMBİNASYON!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: C(7, 3) Kombinasyonunu Hesaplama',
            prompt: 'C(7, 3) = (7 · 6 · 5) / (3 · 2 · 1) işleminin sonucu kaçtır?',
            mathematicalHint: '(7 · 6 · 5) / 6 = 35.',
            options: [
              '35',
              '210 (P(7, 3) permütasyon hesaplayanların cevabı)',
              '42',
              '21',
            ],
            correctOptionIndex: 0,
            explanation: 'C(7, 3) = (7 · 6 · 5) / (3 · 2 · 1) = 210 / 6 = 35 farklı komisyon seçilebilir.',
            goldenTactic: 'Eğer "başkan, yardımcı ve sekreter" seçilseydi P(7, 3) = 210 olurdu.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 35 farklı komisyon seçilebilir.',
      ),

      // PROBLEM 2: Şartlı Kombinasyon (Ekip Kurma)
      SocraticProblem(
        id: 'socratic_k13_p2',
        title: 'Şartlı Seçim: 4 Doktor, 5 Hemşireden 3 Kişilik Ekip',
        examYear: 'KPSS Genel Yetenek Standart Kombinasyon',
        rawQuestion: '4 doktor ve 5 hemşire arasından EN AZ 2\'si doktor olan 3 kişilik bir sağlık ekibi kaç farklı şekilde kurulabilir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Olası Durumları Belirleme',
            prompt: '3 kişilik ekipte "en az 2 doktor" olması hangi durumları kapsar?',
            mathematicalHint: 'Durum 1: 2 Doktor ve 1 Hemşire. Durum 2: 3 Doktor ve 0 Hemşire.',
            options: [
              'Durum 1: (2 Doktor + 1 Hemşire)  VEYA  Durum 2: (3 Doktor + 0 Hemşire).',
              'Yalnızca 2 doktor ve 1 hemşire.',
              '1 doktor ve 2 hemşire.',
              'Tüm doktorlar.',
            ],
            correctOptionIndex: 0,
            explanation: 'En az 2 doktor demek ya tam 2 doktor 1 hemşire, ya da 3 doktor demektir.',
            goldenTactic: '"En az" denildiğinde verilen sayıdan yukarıya doğru durumlar ayrı ayrı toplanır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Kombinasyonları Hesaplayıp Toplama',
            prompt: 'C(4, 2) · C(5, 1) + C(4, 3) · C(5, 0) işleminin sonucu kaçtır?',
            mathematicalHint: 'C(4, 2) · C(5, 1) = 6 · 5 = 30. C(4, 3) · C(5, 0) = 4 · 1 = 4. Toplam = 34.',
            options: [
              '30 + 4 = 34',
              '30',
              '36',
              '24',
            ],
            correctOptionIndex: 0,
            explanation: 'C(4, 2)·C(5, 1) = 6·5 = 30. C(4, 3)·1 = 4·1 = 4. Toplam: 30 + 4 = 34 farklı ekip kurulabilir.',
            goldenTactic: 'VE bağlacında çarparız (D ve H), VEYA bağlacında toplarız.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 34 farklı ekip kurulabilir.',
      ),

      // PROBLEM 3: Tekrarlı Permütasyon
      SocraticProblem(
        id: 'socratic_k13_p3',
        title: 'Tekrarlı Permütasyon: "KELEBEK" Kelimesi',
        examYear: 'KPSS Lisans / Seçici Sayma Sorusu',
        rawQuestion: '"KELEBEK" kelimesinin harfleri yer değiştirilerek 7 harfli anlamlı veya anlamsız KAÇ FARKLI kelime yazılabilir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Harf Sayılarını ve Tekrarları Belirleme',
            prompt: '"KELEBEK" kelimesinde toplam kaç harf vardır ve hangi harfler kaçar kez tekrarlar?',
            mathematicalHint: 'Toplam 7 harf: 3 tane E, 2 tane K, 1 tane L, 1 tane B.',
            options: [
              'Toplam 7 harf vardır: E harfi 3 kez, K harfi 2 kez tekrarlar.',
              'Toplam 7 harf vardır ve tekrar yoktur (7!).',
              'E harfi 2 kez tekrarlar.',
              'Toplam 6 harf vardır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Toplam 7 harf vardır: E (3 tane), K (2 tane), L (1 tane), B (1 tane).',
            goldenTactic: 'Aynı harflerin kendi aralarındaki yer değişimi yeni kelime üretmediği için faktöriyellerine bölünür.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Tekrarlı Permütasyon Formülünü Çözme',
            prompt: '7! / (3! · 2!) işleminin sonucu kaçtır?',
            mathematicalHint: '7! / (6 · 2) = 5040 / 12 = 420.',
            options: [
              '5040 / 12 = 420',
              '5040',
              '210',
              '840',
            ],
            correctOptionIndex: 0,
            explanation: '7! / (3! · 2!) = (7 · 6 · 5 · 4 · 3!) / (3! · 2) = 840 / 2 = 420 farklı kelime yazılabilir.',
            goldenTactic: 'Tekrarlı permütasyon formülü: (Toplam Eleman)! / (Tekrar₁! · Tekrar₂! ...).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 420 farklı kelime yazılabilir.',
      ),

      // PROBLEM 4: Tümleyen Olasılık Kestirmesi
      SocraticProblem(
        id: 'socratic_k13_p4',
        title: 'Tümleyen Olasılık: Torbadan Çekilen 2 Bilyeden En Az Birinin Mavi Olması',
        examYear: 'KPSS Olasılık Standart Kalıp',
        rawQuestion: 'Bir torbada 4 kırmızı ve 6 mavi bilye vardır. Rastgele çekilen 2 bilyeden EN AZ BİRİNİN MAVİ olma olasılığı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Tümleyen Yöntemini Seçme',
            prompt: '"En az bir mavi" durumunu tek tek hesaplamak yerine, TÜM DURUMDAN (1) hangi istenmeyen durumu çıkarmak çok daha pratiktir?',
            mathematicalHint: 'İstenmeyen durum: "İkisinin de KIRMIZI olması" durumudur. P = 1 - P(İkisi de Kırmızı).',
            options: [
              'İkisinin de KIRMIZI olma olasılığını 1\'den çıkarmak: 1 - P(İkisi de Kırmızı).',
              'İkisinin de mavi olma olasılığını çıkarmak.',
              'Doğrudan kırmızı olasılığını hesaplamak.',
              '10 bilye olduğu için 6/10 demektir.',
            ],
            correctOptionIndex: 0,
            explanation: 'Mükemmel! "En az bir" sorularında tersi (tümleyen) tek bir durumdur: İkisinin de kırmızı olması!',
            goldenTactic: '🎯 OLASILIK SİHRİ: P(En az 1) = 1 - P(Hiç olmama).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: İkisinin de Kırmızı Olma Olasılığını ve Sonucu Bulma',
            prompt: 'Tüm durum C(10, 2) = 45. İkisi de kırmızı C(4, 2) = 6. P = 1 - (6 / 45) kaçtır?',
            mathematicalHint: '1 - 6/45 = 39/45 = 13/15.',
            options: [
              '1 - 6/45 = 39/45 = 13/15',
              '6/45 = 2/15',
              '1/2',
              '11/15',
            ],
            correctOptionIndex: 0,
            explanation: 'P(İkisi Kırmızı) = C(4, 2) / C(10, 2) = 6 / 45 = 2/15. İstenen Olasılık = 1 - 2/15 = 13/15 bulunur.',
            goldenTactic: 'Tümleyen kuralı ile 3 farklı durumu toplamak yerine tek çıkarma işlemiyle sonuca gidilir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Olasılık 13/15\'tir.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k13_1',
        questionText: '5 kişi arasından 2 kişilik başkan ve yardımcı kaç farklı şekilde seçilir?',
        studentSteps: [
          'Adım 1: 5 kişiden 2 kişi seçilir: C(5, 2).',
          'Adım 2: C(5, 2) = 10 farklı şekilde seçilir dedim.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci unvan/görev (başkan ve yardımcı) olduğu halde kombinasyon kullanmıştır! Görev dağılımında sıra önemlidir: P(5, 2) = 5 · 4 = 20 olmalıdır.',
        correctSolution: 'Görevler farklı olduğu için permütasyondur: P(5, 2) = 5 · 4 = 20 farklı şekilde seçilir.',
        trapRule: 'Kişilere özel unvanlar (Başkan, Kaptan vb.) veriliyorsa permütasyon kullanılır!',
      ),
      TrapScenario(
        id: 'trap_k13_2',
        questionText: 'Bir madeni para 3 kez atıldığında en az bir tura gelme olasılığı nedir?',
        studentSteps: [
          'Adım 1: Her atışta tura gelme olasılığı 1/2\'dir.',
          'Adım 2: 3 atışta 3 · 1/2 = 3/2 buldum.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci olasılıkları toplamış ve 1\'den büyük (3/2) imkansız bir olasılık bulmuştur! Olasılık asla 1\'i aşamaz. Çözüm tümleyenden yapılır: 1 - (1/2)³ = 1 - 1/8 = 7/8.',
        correctSolution: 'P(En az 1 Tura) = 1 - P(Hepsi Yazı) = 1 - (1/2 · 1/2 · 1/2) = 1 - 1/8 = 7/8.',
        trapRule: 'Bir olayın olasılığı daima 0 ile 1 arasındadır; olasılıklar asla doğrudan toplanıp 1\'i geçemez!',
      ),
      TrapScenario(
        id: 'trap_k13_3',
        questionText: '"ANANAS" kelimesinin harfleriyle kaç kelime yazılır?',
        studentSteps: [
          'Adım 1: 6 harf vardır: 6! = 720 kelime yazılır.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci tekrarlayan 3 tane A ve 2 tane N harfini bölmemiştir. Aynı harflerin yer değiştirmesi yeni kelime üretmez: 6! / (3! · 2!) = 720 / 12 = 60 olmalıdır.',
        correctSolution: '6! / (3! · 2!) = 720 / 12 = 60 farklı kelime yazılır.',
        trapRule: 'Aynı harflerin/rakamların olduğu durumlarda tekrarlı permütasyonla bölme yapılmak zorundadır.',
      ),
    ],
  );
}
