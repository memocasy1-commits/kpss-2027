import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 7: Oran - Orantı İnteraktif Veri Kümesi
class Konu7OranOrantiData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 7,
    title: 'Oran - Orantı',
    subtitle: 'Doğru & Ters Orantı, Ortak Harf Senkronizasyonu, Orantı Sabiti ve Yapılan İş Formülü',
    icon: Icons.balance_rounded,
    themeColor: Color(0xFF0284C7), // Sky-600
    osymWeight: '1 - 2 Soru (Problemlerin Temeli)',
    keyOutcomes: [
      'Doğru orantıda bölümlerin (y/x=k), ters orantıda çarpımların (x·y=k) sabit olduğunu kavramak',
      'İkili oranlarda ortak harfi EKOK ile eşitleyerek tek orantı sabiti (k) kurabilmek',
      'Orantı sabiti kurallarında toplama ile çarpma farkını (k vs kⁿ) hatasız uygulamak',
      'Bileşik orantı problemlerini "1. İş / 1. Diğerleri = 2. İş / 2. Diğerleri" şablonuyla saniyeler içinde çözmek',
    ],
    socraticProblems: [
      // PROBLEM 1: İkili Oranları Birleştirme
      SocraticProblem(
        id: 'socratic_k7_p1',
        title: 'Ortak Harf Eşitleme: a/b = 2/3 ve b/c = 5/4',
        examYear: 'KPSS Lisans / Ön Lisans Temel Soru',
        rawQuestion: 'a/b = 2/3\nb/c = 5/4\na + b + c = 74\nolduğuna göre, b kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Ortak Değişkeni (b) Eşitleme',
            prompt: 'Her iki oranda da ortak olan değişken b\'dir. Birinci oranda b = 3\'ün katı, ikinci oranda b = 5\'in katıdır. b kaçta eşitlenmelidir?',
            mathematicalHint: 'EKOK(3, 5) = 15.',
            options: [
              'EKOK(3, 5) = 15\'te eşitlenir: a/b kesri 5 ile, b/c kesri 3 ile genişletilir.',
              'b = 3 + 5 = 8\'de eşitlenir.',
              'Eşitlemeye gerek yoktur, doğrudan a=2, b=3, c=4 alınır.',
              'b = 3 · 4 = 12\'de eşitlenir.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Ortak harf b\'dir ve EKOK(3, 5) = 15\'te eşitlenir: a/b = (2·5)/(3·5) = 10/15 ve b/c = (5·3)/(4·3) = 15/12.',
            goldenTactic: 'İkili oran sorularında ilk refleks daima ortak harfin katsayılarını EKOK\'ta eşitlemektir.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Tek Orantı Sabitine (k) Bağlama',
            prompt: 'Genişletilmiş oranlara göre a, b ve c sırasıyla kaç k olur?',
            mathematicalHint: 'a = 10k, b = 15k, c = 12k.',
            options: [
              'a = 10k, b = 15k, c = 12k',
              'a = 2k, b = 3k, c = 4k',
              'a = 5k, b = 15k, c = 3k',
              'a = 10k, b = 5k, c = 4k',
            ],
            correctOptionIndex: 0,
            explanation: 'Harika! a = 10k, b = 15k ve c = 12k haline geldi. Artık tek bir bilinmeyen (k) ile çalışabiliriz.',
            goldenTactic: 'Ortak harf eşitlendikten sonra tüm değişkenler tek bir orantı sabiti k cinsinden yazılır.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: k Sabitini ve b Değerini Hesaplama',
            prompt: 'a + b + c = 10k + 15k + 12k = 37k = 74 olduğuna göre k ve b kaçtır?',
            mathematicalHint: 'k = 74 / 37 = 2. b = 15 · 2 = 30.',
            options: [
              'k = 2 ve b = 15 · 2 = 30',
              'k = 1 ve b = 15',
              'k = 2 ve b = 20',
              'k = 3 ve b = 45',
            ],
            correctOptionIndex: 0,
            explanation: '37k = 74 ⟹ k = 2 bulunur. b = 15k olduğundan b = 15 · 2 = 30 elde edilir.',
            goldenTactic: 'Toplam denkleminden k bulunduktan sonra istenen değişkenin katsayısıyla çarpılır.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: b = 30.',
      ),

      // PROBLEM 2: Orantı Sabitinin Korunumu
      SocraticProblem(
        id: 'socratic_k7_p2',
        title: 'Orantı Sabiti: (3a + 2c - e) / (3b + 2d - f)',
        examYear: 'KPSS Genel Yetenek Klasik Orantı Kuralı',
        rawQuestion: 'a/b = c/d = e/f = 4\nolduğuna göre,\n(3a + 2c - e) / (3b + 2d - f)\nifadesinin değeri kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Genişletme ve Orantı Sabiti Kuralı',
            prompt: 'Bir orantıda paylar ve paydalar aynı sayılarla çarpılıp taraf tarafa toplanırsa orantı sabiti (k=4) nasıl değişir?',
            mathematicalHint: '3a/3b = 4, 2c/2d = 4, -e/-f = 4. Toplamların oranı k\'ya eşittir.',
            options: [
              'Orantı sabiti DEĞİŞMEZ, sonuç yine 4 kalır.',
              'Katsayılar toplandığı için 3 + 2 - 1 = 4 ile çarpılır ve 16 olur.',
              'Sonuç 4³ = 64 olur.',
              'Payda sıfır olur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Temel orantı kuralı: Pay ve payda aynı katsayılarla genişletilip toplanır veya çıkarılırsa orantı sabiti ASLA değişmez: (3a + 2c - e)/(3b + 2d - f) = 4.',
            goldenTactic: '🎯 ALTIN KURAL: a/b = c/d = k ise (m·a + n·c)/(m·b + n·d) = k daima korunur!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 4.',
      ),

      // PROBLEM 3: Ters Orantılı Paylaştırma
      SocraticProblem(
        id: 'socratic_k7_p3',
        title: 'Ters Orantılı Paylaştırma: 180 TL, 2 ve 3 Yaş',
        examYear: 'KPSS Standart Problem Soru Tipi',
        rawQuestion: '180 TL para, 2 ve 3 yaşlarındaki iki kardeşe yaşlarıyla TERS orantılı olacak şekilde paylaştırılıyor.\nBuna göre, KÜÇÜK kardeş kaç TL alır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Ters Orantı Katsayılarını Belirleme',
            prompt: 'Ters orantıda çarpımlar sabittir (2 · x = 3 · y = k). Pratik olarak x ve y paylarına kaç kat (m) verilir?',
            mathematicalHint: '2 · (3m) = 3 · (2m) = 6m. Küçük kardeş (2 yaş) 3m, büyük kardeş (3 yaş) 2m alır.',
            options: [
              'Küçük kardeş 3m, büyük kardeş 2m alır.',
              'Küçük kardeş 2m, büyük kardeş 3m alır (Doğru orantı).',
              'Her ikisi de 2.5m alır.',
              'Küçük kardeş 5m, büyük kardeş 1m alır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Ters orantıda küçük yaşa büyük katsayı düşer: 2 ile ters orantılı olan 3m, 3 ile ters orantılı olan 2m alır (2 · 3m = 3 · 2m = 6m).',
            goldenTactic: '2 ve 3 ile ters orantılı denildiğinde hemen çaprazlayıp 3m ve 2m yazın!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Toplam Para ve m Katsayısını Bulma',
            prompt: '3m + 2m = 5m = 180 TL olduğuna göre m kaçtır?',
            mathematicalHint: '180 / 5 = 36.',
            options: [
              'm = 36',
              'm = 40',
              'm = 30',
              'm = 45',
            ],
            correctOptionIndex: 0,
            explanation: '5m = 180 ⟹ m = 36 TL bulunur.',
            goldenTactic: 'Toplam parayı katlar toplamına bölerek m birim hissesi bulunur.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Küçük Kardeşin Payı',
            prompt: 'Küçük kardeş 3m aldığına göre kaç TL alır?',
            mathematicalHint: '3 · 36 = 108 TL.',
            options: [
              '3 · 36 = 108 TL',
              '2 · 36 = 72 TL',
              '90 TL',
              '120 TL',
            ],
            correctOptionIndex: 0,
            explanation: 'Küçük kardeşin hissesi 3m = 3 · 36 = 108 TL\'dir. (Büyük kardeş 2 · 36 = 72 TL alır).',
            goldenTactic: 'Ters orantıda küçük olanın DAİMA daha çok pay aldığını sağlamayla kontrol edin.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Küçük kardeş 108 TL alır.',
      ),

      // PROBLEM 4: Bileşik Orantı & Yapılan İş Formülü
      SocraticProblem(
        id: 'socratic_k7_p4',
        title: 'Bileşik Orantı: Halı Dokuma Problemi',
        examYear: 'KPSS Lisans / Ön Lisans Klasik İşçi-İş Orantısı',
        rawQuestion: '6 işçi, günde 8 saat çalışarak 10 günde 40 m² halı dokuyabiliyor.\nBuna göre, aynı nitelikteki 4 işçi günde 6 saat çalışarak 15 günde KAÇ m² halı dokur?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: "Yapılan İş" Formülünü Kurma',
            prompt: 'Bileşik orantı formülü: (1. Yapılan İş) / (1. Diğer Veriler) = (2. Yapılan İş) / (2. Diğer Veriler). 1. ve 2. yapılan işler nelerdir?',
            mathematicalHint: '1. İş = 40 m², 2. İş = X m².',
            options: [
              '1. İş = 40 m², 2. İş = X m² (Dokunan halı miktarı iştir, diğerleri işçi, gün ve saattir).',
              'İş = 10 gündür.',
              'İş = 6 işçidir.',
              'Her şey birbiriyle doğrudan çarpılır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Harika! Yapılan iş yalnızca dokunan halıdır (40 ve X). Kalan veriler (işçi, gün, saat) paydaya çarpım olarak yazılır.',
            goldenTactic: '🎯 FORMÜL: (1. Yapılan İş) / (İşçi₁ · Gün₁ · Saat₁) = (2. Yapılan İş) / (İşçi₂ · Gün₂ · Saat₂).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Eşitliği Yazıp Çözme',
            prompt: '40 / (6 · 8 · 10) = X / (4 · 6 · 15) denkleminden X kaçtır?',
            mathematicalHint: '40 / 480 = X / 360 ⟹ 1/12 = X / 360 ⟹ X = 30.',
            options: [
              'X = 30 m²',
              'X = 40 m²',
              'X = 25 m²',
              'X = 35 m²',
            ],
            correctOptionIndex: 0,
            explanation: '40 / 480 = 1/12. 1/12 = X / 360 ⟹ 12X = 360 ⟹ X = 30 m² dokunur.',
            goldenTactic: 'Oklar ve ters/doğru orantı karmaşasına girmeden tek formülle soru çözülür!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 30 m².',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k7_1',
        questionText: '60 bilye 2 ve 3 yaşlarındaki iki çocuğa yaşlarıyla TERS orantılı paylaştırılıyor. Küçük çocuk kaç bilye alır?',
        studentSteps: [
          'Adım 1: Yaşlar 2 ve 3 olduğuna göre 2k ve 3k bilye alırlar.',
          'Adım 2: 2k + 3k = 5k = 60 bilye ⟹ k = 12.',
          'Adım 3: Küçük çocuk 2 yaşında olduğu için 2 · 12 = 24 bilye alır.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci 1. adımda TERS orantıyı DOĞRU orantı gibi çözmüştür! Ters orantıda küçük yaşa büyük pay düşer. 2k ve 3k değil, 3k ve 2k katları verilmelidir.',
        correctSolution: 'Ters orantıda: Küçük = 3k, Büyük = 2k. 3k + 2k = 5k = 60 ⟹ k = 12. Küçük çocuk = 3 · 12 = 36 bilye alır.',
        trapRule: 'Ters orantıda çarpımlar sabittir: 2 · A = 3 · B ⟹ A = 3k, B = 2k.',
      ),
      TrapScenario(
        id: 'trap_k7_2',
        questionText: 'a/b = c/d = 3 olduğuna göre (a · c) / (b · d) işleminin sonucu kaçtır?',
        studentSteps: [
          'Adım 1: Orantı sabiti k = 3\'tür.',
          'Adım 2: Orantıda işlemler sabiti değiştirmez, sonuç yine 3\'tür.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci çarpma işleminde orantı sabitinin karesi alınacağını unutmuştur! (a/b) · (c/d) = 3 · 3 = 9 = k² olmalıdır. Sabit sadece toplama/çıkarmada korunur.',
        correctSolution: '(a · c) / (b · d) = (a/b) · (c/d) = 3 · 3 = 9 olur.',
        trapRule: 'Orantılar çarpıldığında orantı sabiti de çarpılır: k · k = k².',
      ),
      TrapScenario(
        id: 'trap_k7_3',
        questionText: 'a/b = 2/3 ve b/c = 4/5 olduğuna göre a + b + c en az kaçtır (a,b,c pozitif tam sayı)?',
        studentSteps: [
          'Adım 1: a = 2, b = 3 alırım.',
          'Adım 2: b = 4, c = 5 alırım.',
          'Adım 3: Toplam: a + b + c = 2 + 3 + 5 = 10 derim.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci aynı b değişkeninin iki farklı değerini (3 ve 4) eşitlemeden rastgele toplamıştır! b aynı anda hem 3 hem 4 olamaz. EKOK(3, 4) = 12\'de eşitlenmelidir.',
        correctSolution: 'b = 12 yapılır: a/b = 8/12, b/c = 12/15. a = 8, b = 12, c = 15. En küçük toplam = 8 + 12 + 15 = 35 olur.',
        trapRule: 'Ortak harf eşitlenmeden değişkenlere asla sayısal değer verilemez!',
      ),
    ],
  );
}
