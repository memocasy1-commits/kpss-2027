import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 10: Yüzde, Kâr - Zarar ve Karışım Problemleri İnteraktif Veri Kümesi
class Konu10YuzdeKarKarisimData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 10,
    title: 'Yüzde, Kâr - Zarar ve Karışım',
    subtitle: '100x Maliyet Modeli, Art Arda İndirim Tuzağı, Eşit Satışta Zarar Paradoksu ve Karışım Dengesi',
    icon: Icons.percent_rounded,
    themeColor: Color(0xFFDC2626), // Red-600
    osymWeight: '3 - 4 Soru (Sınavın Bel Kemiği)',
    keyOutcomes: [
      'Maliyet veya etiket fiyatına 100x diyerek karmaşık formüller olmadan net kâr/zarar hesabı yapabilmek',
      'Art arda yapılan indirimlerin toplanmayacağını (%20 + %30 ≠ %50) indirimli fiyat üzerinden hesaplamak',
      'Aynı fiyata satılan (%k kâr ve %k zarar) iki üründen toplamda daima ZARAR edildiğini bilmek',
      'Karışım problemlerini m₁ · y₁ + m₂ · y₂ = (m₁ + m₂) · yₛₒₙ formülüyle tek hamlede çözmek',
    ],
    socraticProblems: [
      // PROBLEM 1: Art Arda İndirim Tuzağı
      SocraticProblem(
        id: 'socratic_k10_p1',
        title: 'Art Arda İndirim: Önce %20 Sonra %30',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Yüzde Sorusu',
        rawQuestion: 'Bir mağaza bir ceketin etiket fiyatı üzerinden önce %20, daha sonra İNDİRİMLİ FİYAT üzerinden %30 indirim yapıyor.\nBuna göre, bu cekete toplamda YÜZDE KAÇ indirim yapılmıştır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Başlangıç Fiyatına 100x Verme',
            prompt: 'Yüzde problemlerinde işlem kolaylığı için ceketin ilk etiket fiyatına kaç x demeliyiz?',
            mathematicalHint: '100 sayısı doğrudan yüzdeyi gösterir: Fiyat = 100x olsun.',
            options: [
              '100x olsun.',
              'x olsun.',
              '50x olsun.',
              '1000x olsun.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! 100x kabul edersek indirim ve kârlar doğrudan tamsayı olarak ilerler.',
            goldenTactic: '🎯 YÜZDE KURTARICISI: Bilinmeyen fiyata daima 100x deyin!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: 1. İndirim (%20) Hesabı',
            prompt: '100x fiyatlı cekete %20 indirim yapılırsa yeni fiyat ne olur?',
            mathematicalHint: '100x - 20x = 80x.',
            options: [
              '80x olur.',
              '70x olur.',
              '20x olur.',
              '90x olur.',
            ],
            correctOptionIndex: 0,
            explanation: '100x · %20 = 20x indirim. Yeni fiyat: 100x - 20x = 80x olur.',
            goldenTactic: 'İkinci indirim 100x üzerinden değil, bu 80x üzerinden yapılacaktır!',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: 2. İndirim (%30) ve Nihai Fiyat',
            prompt: 'İndirimli fiyat olan 80x üzerinden %30 indirim daha yapılırsa indirim miktarı ve ceketin son satış fiyatı ne olur?',
            mathematicalHint: '80x · (30 / 100) = 24x indirim. Son Fiyat = 80x - 24x = 56x.',
            options: [
              '24x indirim yapılır ve son fiyat 56x olur.',
              '30x indirim yapılır ve son fiyat 50x olur.',
              '20x indirim yapılır ve son fiyat 60x olur.',
              'Son fiyat 44x olur.',
            ],
            correctOptionIndex: 0,
            explanation: '80x\'in %30\'u: 80x · 0.30 = 24x\'tir. Son fiyat: 80x - 24x = 56x olur.',
            goldenTactic: '20 + 30 = 50 deyip fiyata 50x demek ÖSYM\'nin en büyük avlama taktiğidir!',
          ),
          SocraticStep(
            stepNumber: 4,
            title: '4. Adım: Toplam Yapılan İndirim Yüzdesi',
            prompt: 'Ceket 100x iken 56x\'e düştüğüne göre toplamda yapılan indirim yüzde kaçtır?',
            mathematicalHint: '100x - 56x = 44x indirim. 100x\'te 44x indirim %44 demektir.',
            options: [
              '%44 indirim yapılmıştır.',
              '%50 indirim yapılmıştır (Hatalı toplama!).',
              '%56 indirim yapılmıştır.',
              '%36 indirim yapılmıştır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Toplam indirim = 100x - 56x = 44x\'tir. Başlangıç 100x olduğu için toplam indirim %44\'tür.',
            goldenTactic: 'Art arda indirimlerde toplam indirim oranları asla toplanmaz!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Toplam indirim %44\'tür.',
      ),

      // PROBLEM 2: Aynı Fiyata Satılan İki Üründe Kâr-Zarar Paradoksu
      SocraticProblem(
        id: 'socratic_k10_p2',
        title: 'Kâr-Zarar Paradoksu: İkisi de 240 TL\'ye Satılan İki Ürün',
        examYear: 'KPSS Genel Yetenek Klasik Çeldirici Soru',
        rawQuestion: 'Bir tüccar iki üründen birini %20 kârla 240 TL\'ye, diğerini ise %20 zararla 240 TL\'ye satıyor.\nBu tüccarın bu iki satışın toplamındaki KÂR-ZARAR DURUMU nedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: 1. Ürünün Maliyetini Bulma (%20 Kârla 240 TL)',
            prompt: '1. ürünün maliyetine 100a diyelim. %20 kârla satış 120a = 240 TL olduğuna göre bu ürünün maliyeti (100a) kaç TL\'dir?',
            mathematicalHint: '120a = 240 ⟹ a = 2. Maliyet = 100 · 2 = 200 TL.',
            options: [
              '200 TL\'dir.',
              '240 TL\'dir.',
              '192 TL\'dir.',
              '220 TL\'dir.',
            ],
            correctOptionIndex: 0,
            explanation: '120a = 240 ⟹ a = 2. 1. ürünün maliyeti 100a = 200 TL\'dir. (Buradan 40 TL kâr edilmiştir).',
            goldenTactic: 'Satış fiyatından değil maliyet üzerinden kâr oranı kurulur: Maliyet · 1.20 = Satış.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: 2. Ürünün Maliyetini Bulma (%20 Zararla 240 TL)',
            prompt: '2. ürünün maliyetine 100b diyelim. %20 zararla satış 80b = 240 TL olduğuna göre bu ürünün maliyeti (100b) kaç TL\'dir?',
            mathematicalHint: '80b = 240 ⟹ b = 3. Maliyet = 100 · 3 = 300 TL.',
            options: [
              '300 TL\'dir.',
              '288 TL\'dir.',
              '250 TL\'dir.',
              '320 TL\'dir.',
            ],
            correctOptionIndex: 0,
            explanation: '80b = 240 ⟹ b = 3. 2. ürünün maliyeti 100b = 300 TL\'dir. (Buradan 60 TL zarar edilmiştir).',
            goldenTactic: 'Zarar edilen ürünün maliyeti satıştan büyüktür: Maliyet · 0.80 = 240 ⟹ Maliyet = 300 TL.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Toplam Maliyet ve Toplam Satışı Karşılaştırma',
            prompt: 'Toplam Maliyet: 200 + 300 = 500 TL. Toplam Satış: 240 + 240 = 480 TL. Net durum nedir?',
            mathematicalHint: '480 - 500 = -20 TL (20 TL ZARAR).',
            options: [
              '20 TL ZARAR edilmiştir.',
              'Ne kâr ne zarar edilmiştir (Hatalı düşünce!).',
              '20 TL KÂR edilmiştir.',
              '40 TL zarar edilmiştir.',
            ],
            correctOptionIndex: 0,
            explanation: 'Toplam maliyet 500 TL, kasaya giren 480 TL\'dir. 500 - 480 = 20 TL ZARAR vardır.',
            goldenTactic: '🎯 KESTİRME: Eşit fiyata satılan %x kâr ve %x zarar durumunda tüccar DAİMA ZARAR EDER!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Toplamda 20 TL ZARAR edilmiştir.',
      ),

      // PROBLEM 3: Karışım Formülü
      SocraticProblem(
        id: 'socratic_k10_p3',
        title: 'Karışım Dengesi: %30\'luk 40g ve %50\'lik 60g Tuzlu Su',
        examYear: 'KPSS Karışım Problemi Standart Tip',
        rawQuestion: 'Tuz oranı %30 olan 40 gram tuzlu su ile tuz oranı %50 olan 60 gram tuzlu su karıştırılıyor.\nYeni karışımın TUZ ORANI YÜZDE KAÇTIR?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Karışım Formülünü Kurma',
            prompt: 'm₁ · y₁ + m₂ · y₂ = (m₁ + m₂) · yₛₒₙ formülünde verileri yerine yazarsak sol taraf ne olur?',
            mathematicalHint: '40 · 30 + 60 · 50 = 1200 + 3000 = 4200.',
            options: [
              '40 · 30 + 60 · 50 = 4200',
              '40 · 30 + 60 · 50 = 3000',
              '100 · 80 = 8000',
              '40 + 60 = 100',
            ],
            correctOptionIndex: 0,
            explanation: 'Madde miktarı ile yüzdelerin çarpımları toplamı: 40 · 30 + 60 · 50 = 1200 + 3000 = 4200 olur.',
            goldenTactic: 'Yüzdeleri kesre çevirmeden doğrudan katsayı olarak çarpmak işlem kolaylığı sağlar.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Toplam Kütleye Bölüp Son Yüzdeyi Bulma',
            prompt: 'Toplam kütle 40 + 60 = 100 gramdır. 100 · yₛₒₙ = 4200 olduğuna göre son yüzde kaçtır?',
            mathematicalHint: 'yₛₒₙ = 4200 / 100 = 42.',
            options: [
              '%42',
              '%40 (Aritmetik ortalama değildir, ağır basana yakındır!)',
              '%45',
              '%38',
            ],
            correctOptionIndex: 0,
            explanation: '100 · yₛₒₙ = 4200 ⟹ yₛₒₙ = %42 bulunur.',
            goldenTactic: 'Karışımın yüzdesi daima miktarı fazla olan kaba daha yakındır (60g olan %50\'ye daha yakındır: 42).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Yeni karışımın tuz oranı %42\'dir.',
      ),

      // PROBLEM 4: Su Buharlaştırma Problemi
      SocraticProblem(
        id: 'socratic_k10_p4',
        title: 'Su Buharlaştırma: %20\'lik 80g Şekerli Sudan 20g Su Uçurma',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: 'Şeker oranı %20 olan 80 gram şekerli sudan 20 gram su buharlaştırılıyor.\nYeni karışımın ŞEKER ORANI YÜZDE KAÇ olur?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Saf Şeker Miktarının Değişmediğini Görme',
            prompt: 'Buharlaşan madde yalnızca SAF SU\'dur (şeker buharlaşmaz). Başlangıçtaki saf şeker miktarı kaç gramdır?',
            mathematicalHint: '80 · %20 = 80 · 0.20 = 16 gram şeker.',
            options: [
              '16 gram şeker (Buharlaşınca da 16 gram olarak kalır).',
              '20 gram şeker.',
              '10 gram şeker.',
              '4 gram şeker buharlaşır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! 80 gramın %20\'si: 80 · 0.20 = 16 gram şekerdir. Su uçtuğunda şeker miktarı kesinlikle değişmez!',
            goldenTactic: 'Su buharlaştırma sorularında tuz/şeker kütlesi sabittir, sadece toplam kütle azalır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Yeni Toplam Kütle ve Yeni Yüzde',
            prompt: '80 gramdan 20 gram su uçunca kalan kütle 60 gram olur. 60 gramda 16 gram şeker yüzde kaça denk gelir?',
            mathematicalHint: '(16 / 60) · 100 = 160 / 6 = %26.66 (veya kesir olarak 80/3).',
            options: [
              '%26.6 (veya % 80/3)',
              '%25',
              '%30',
              '%20',
            ],
            correctOptionIndex: 0,
            explanation: 'Yeni Kütle = 80 - 20 = 60 gram. Yüzde = (16 / 60) · 100 = %26.6 (80/3) olur.',
            goldenTactic: 'Formülle de çözülebilir: 80 · 20 - 20 · 0 = 60 · y ⟹ 1600 = 60y ⟹ y = 160/6 = 80/3.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Şeker oranı %80/3 (yaklaşık %26.6) olur.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k10_1',
        questionText: 'Bir ürüne önce %20, sonra %30 indirim yapılırsa toplam indirim yüzde kaçtır?',
        studentSteps: [
          'Adım 1: 1. indirim %20\'dir.',
          'Adım 2: 2. indirim %30\'dur.',
          'Adım 3: Toplam indirim 20 + 30 = %50 olur.',
        ],
        wrongStepIndex: 2,
        mistakeExplanation: 'Öğrenci indirim yüzdelerini doğrudan toplamıştır! İkinci indirim ilk fiyat üzerinden değil, indirimli fiyat üzerinden yapılır: 100x ➔ 80x ➔ 56x olup toplam indirim %44\'tür.',
        correctSolution: '100 - 20 = 80. 80\'in %30\'u = 24. Son fiyat = 80 - 24 = 56. Toplam indirim = 100 - 56 = %44.',
        trapRule: 'Art arda yapılan indirim oranları ASLA toplanmaz!',
      ),
      TrapScenario(
        id: 'trap_k10_2',
        questionText: 'Tuzlu suya saf su eklendiğinde tuz oranı nasıl değişir?',
        studentSteps: [
          'Adım 1: Su eklenince karışım büyür.',
          'Adım 2: Karışım büyüdüğü için içindeki tuz da artar.',
          'Adım 3: Tuz yüzdesi artar.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci su eklenince tuz miktarının da artacağını sanmıştır. Su eklenince tuz kütlesi sabit kalır ama toplam kütle arttığı için tuz ORANI (yüzdesi) AZALIR (seyrelir).',
        correctSolution: 'Tuz miktarı değişmez. Toplam kütle arttığı için tuz oranı KESİNLİKLE AZALIR.',
        trapRule: 'Karışıma saf çözücü (su) eklendikçe madde oranı azalır (seyrelme).',
      ),
      TrapScenario(
        id: 'trap_k10_3',
        questionText: 'Aynı fiyata satılan iki üründen birinde %10 kâr, diğerinde %10 zarar edilirse toplam durum ne olur?',
        studentSteps: [
          'Adım 1: Birinden %10 kâr, diğerinden %10 zarar edilmiştir.',
          'Adım 2: +10 ile -10 birbirini sıfırlar.',
          'Adım 3: Sonuçta ne kâr ne zarar edilir.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci satış fiyatları eşit olan ürünlerin maliyetlerini eşit sanmıştır. Zarar edilen ürünün maliyeti daha yüksek olduğu için oradaki zarar miktarı, kâr miktarından büyüktür ve sonuçta ZARAR edilir!',
        correctSolution: 'Satış fiyatları eşit iken %x kâr ve %x zarar varsa tüccar DAİMA ZARAR EDER.',
        trapRule: 'Eşit satış fiyatında aynı oranda kâr ve zarar daima net zararla sonuçlanır.',
      ),
    ],
  );
}
