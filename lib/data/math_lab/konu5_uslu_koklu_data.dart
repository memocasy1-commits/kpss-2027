import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 5: Üslü ve Köklü Sayılar İnteraktif Veri Kümesi
class Konu5UsluKokluData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 5,
    title: 'Üslü ve Köklü Sayılar',
    subtitle: 'Kuvvet Kuralları, Üslü Denklemler, Çift Kökte Mutlak Değer ve Eşlenik ile Kök Kurtarma',
    icon: Icons.superscript_rounded,
    themeColor: Color(0xFFD97706), // Amber-600
    osymWeight: '3 - 4 Soru (Sınavın 13. - 16. Soruları)',
    keyOutcomes: [
      'Parantezli (-a)ⁿ ile parantezsiz -aⁿ kuvvet farkını kusursuz ayırt edebilme',
      'aˣ = 1 denkleminin 3 kritik şartını (üs=0, taban=1, taban=-1) eksiksiz test etme',
      'Çift dereceli köklerin kök dışına DAİMA mutlak değerle çıktığını (|x|) uygulama',
      'Paydada kök bırakmama (eşlenik) ve √(A ± 2√B) pratik açılımını saniyeler içinde çözme',
    ],
    socraticProblems: [
      // PROBLEM 1: aᵇ = 1 Denklemi
      SocraticProblem(
        id: 'socratic_k5_p1',
        title: 'Üslü Denklem: (x - 3)ˣ⁺² = 1 Kökleri',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: '(x - 3)ˣ⁺² = 1\ndenklemini sağlayan x gerçel sayılarının toplamı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: 1. Durum - Üssün Sıfır (0) Olması',
            prompt: 'aᵇ = 1 eşitliğinde ilk kural üssün 0 olmasıdır (taban sıfır olmamak şartıyla). x + 2 = 0 eşitliğinden gelen kök ve taban kontrolü nedir?',
            mathematicalHint: 'x + 2 = 0 ⟹ x = -2. Taban kontrolü: -2 - 3 = -5 ≠ 0.',
            options: [
              'x = -2\'dir ve taban (-2 - 3 = -5 ≠ 0) olduğu için geçerli bir köktür.',
              'x = 2\'dir ve taban sıfır olduğu için kök iptal edilir.',
              'x = -2\'dir ancak negatif sayılar taban olamaz, kök kabul edilmez.',
              'x = 0\'dır, her sayının sıfırıncı kuvveti 1\'dir.',
            ],
            correctOptionIndex: 0,
            explanation: 'b = 0 olduğunda a⁰ = 1 olur (0⁰ belirsizliği hariç). x + 2 = 0 ⟹ x = -2. Taban: (-2 - 3) = -5 ≠ 0 olduğundan (-5)⁰ = 1 sağlanır. x = -2 ilk kökümüzdür.',
            goldenTactic: 'Üs sıfır olduğunda mutlaka tabanın sıfır olup olmadığını denetleyin (0⁰ tanımsızdır!).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: 2. Durum - Tabanın Bir (1) Olması',
            prompt: '1\'in tüm reel kuvvetleri 1\'dir (1ⁿ = 1). Tabanı 1 yapan x değeri kaçtır?',
            mathematicalHint: 'x - 3 = 1 ⟹ x = 4.',
            options: [
              'x - 3 = 1 ⟹ x = 4',
              'x - 3 = 1 ⟹ x = 2',
              'x - 3 = 1 ⟹ x = 3',
              'x - 3 = 1 ⟹ x = -4',
            ],
            correctOptionIndex: 0,
            explanation: 'Taban 1 olduğunda üssün ne olduğu fark etmez: x - 3 = 1 ⟹ x = 4. Üs: 4 + 2 = 6 olup 1⁶ = 1 sağlanır. x = 4 ikinci kökümüzdür.',
            goldenTactic: 'Tabanı 1 yapan kök için üsse herhangi bir kısıtlama gerekmez, doğrudan çözümdür.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: 3. Durum - Tabanın Eksi Bir (-1) ve Üssün ÇİFT Olması',
            prompt: '(-1) çift kuvveti 1\'dir. Tabanı -1 yapan x değeri nedir ve bu değer üssü çift yapıyor mu?',
            mathematicalHint: 'x - 3 = -1 ⟹ x = 2. Üs: 2 + 2 = 4 (Çift!).',
            options: [
              'x - 3 = -1 ⟹ x = 2. Üs: 2 + 2 = 4 (ÇİFT) olduğundan x = 2 geçerli köktür.',
              'x - 3 = -1 ⟹ x = 2. Üs tektir, dolayısıyla kök kabul edilemez.',
              'x - 3 = -1 ⟹ x = -2. Taban eksi olamaz.',
              'x = -1 doğrudan köktür, kontrole gerek yoktur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Taban -1 olmalıdır: x - 3 = -1 ⟹ x = 2. Bu değeri üste yazalım: x + 2 = 2 + 2 = 4 (Çift!). (-1)⁴ = 1 sağlandığı için x = 2 üçüncü köktür.',
            goldenTactic: 'Tabanı -1 yapan aday kökü mutlaka üste koyup üssün TEK mi ÇİFT mi olduğunu test edin!',
          ),
          SocraticStep(
            stepNumber: 4,
            title: '4. Adım: Kökler Toplamını Hesaplama',
            prompt: 'Bulunan tüm geçerli köklerin (-2, 4, 2) toplamı kaçtır?',
            mathematicalHint: '(-2) + 4 + 2 = 4.',
            options: [
              '(-2) + 4 + 2 = 4',
              '4 + 2 = 6',
              '(-2) + 4 = 2',
              '(-2) + (-1) + 4 = 1',
            ],
            correctOptionIndex: 0,
            explanation: 'Geçerli kökler x = -2, x = 4 ve x = 2\'dir. Toplamları: (-2) + 4 + 2 = 4 bulunur.',
            goldenTactic: 'aᵇ = 1 denklemlerinde daima bu 3 adımı sırayla inceleyin; biri bile atlanırsa soru gider!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Kökler toplamı (-2) + 4 + 2 = 4\'tür.',
      ),

      // PROBLEM 2: Ortak Parantez ve Sadeleştirme
      SocraticProblem(
        id: 'socratic_k5_p2',
        title: 'Üslü Sadeleştirme: (3ˣ⁺³ + 3ˣ⁺¹) / (3ˣ⁺² - 3ˣ)',
        examYear: 'KPSS Lisans Standart Soru Tipi',
        rawQuestion: '(3ˣ⁺³ + 3ˣ⁺¹) / (3ˣ⁺² - 3ˣ)\nişleminin sonucu kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Ortak Çarpan Parantezine Alma',
            prompt: 'Hem pay hem paydada yer alan en küçük ortak üslü terim 3ˣ\'tir. İfadeleri 3ˣ parantezine alırsak parantez içleri ne olur?',
            mathematicalHint: '3ˣ⁺³ = 3ˣ · 27 ve 3ˣ⁺¹ = 3ˣ · 3. 3ˣ⁺² = 3ˣ · 9.',
            options: [
              'Pay: 3ˣ(3³ + 3¹) = 3ˣ(27 + 3) | Payda: 3ˣ(3² - 1) = 3ˣ(9 - 1)',
              'Pay: 3ˣ(3 + 1) = 3ˣ(4) | Payda: 3ˣ(3 - 0) = 3ˣ(3)',
              'Pay: 3²ˣ⁺⁴ | Payda: 3²ˣ⁺²',
              'Pay: 3ˣ(27 + 1) | Payda: 3ˣ(9 - 3)',
            ],
            correctOptionIndex: 0,
            explanation: '3ˣ⁺³ = 3ˣ · 3³ = 27 · 3ˣ ve 3ˣ⁺¹ = 3ˣ · 3¹ = 3 · 3ˣ. Pay = 3ˣ(27 + 3) = 30 · 3ˣ. Payda = 3ˣ⁺² - 3ˣ = 3ˣ(3² - 1) = 3ˣ(9 - 1) = 8 · 3ˣ.',
            goldenTactic: 'Üslü toplam/fark ifadelerinde daima en küçük kuvvetin parantezine alarak bilinmeyenden kurtulun.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Sadeleştirme ve Sonuç',
            prompt: '3ˣ terimleri sadeleştiğinde geriye kalan 30 / 8 kesrinin en sade hali nedir?',
            mathematicalHint: '30 / 8 kesrini 2 ile sadeleştiriniz.',
            options: [
              '15 / 4',
              '15 / 2',
              '5 / 2',
              '30 / 8 sadeleşmez.',
            ],
            correctOptionIndex: 0,
            explanation: '(30 · 3ˣ) / (8 · 3ˣ) ⟹ 30 / 8. Her iki tarafı 2\'ye bölersek 15 / 4 elde edilir.',
            goldenTactic: 'Bilinmeyen x pay ve paydada eşit derecede varsa, x\'e özel bir değer (örn: x=0) vererek de saniyeler içinde test edebilirsiniz!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 15 / 4.',
      ),

      // PROBLEM 3: Köklü Sayıda Çift Dereceden Çıkarma & Mutlak Değer Tuzağı
      SocraticProblem(
        id: 'socratic_k5_p3',
        title: 'Kök Derecesi: √(x²) + ³√(-y³) + √((x - y)²)',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: 'x < 0 < y olmak üzere,\n√(x²) + ³√(-y³) + √((x - y)²)\nifadesinin en sade hali nedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Kök Derecesine Göre Dışarı Çıkarma Kuralı',
            prompt: 'Çift dereceli kökler (²√) ve tek dereceli kökler (³√) kök dışına nasıl çıkar?',
            mathematicalHint: '²√(a²) = |a| ve ³√(b³) = b.',
            options: [
              'Çift dereceli kökler MUTLAK DEĞERLE (|a|) çıkar, tek dereceli kökler ise İŞARETİYLE AYNEN çıkar.',
              'Her iki kök de daima parantezsiz aynen çıkar.',
              'Çift kökler negatif çıkar, tek kökler pozitif çıkar.',
              'Kök derecesi ne olursa olsun tüm terimler pozitif çıkar.',
            ],
            correctOptionIndex: 0,
            explanation: '²√(a²) = |a| (Asla negatif çıkamaz!). ³√(b³) = b (Tek kuvvet işareti korur). Dolayısıyla: √(x²) = |x|, ³√(-y³) = -y ve √((x-y)²) = |x - y| olur.',
            goldenTactic: '√(x²) = x DEĞİLDİR! √(x²) = |x|\'tir. KPSS\'de bu kural her yıl en az bir soruda test edilir.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: İşaret Tespiti ve Mutlak Değerden Kurtulma',
            prompt: 'x < 0 ve x < y (dolayısıyla x - y < 0) olduğuna göre |x| ve |x - y| dışarı nasıl çıkar?',
            mathematicalHint: 'x < 0 ⟹ |x| = -x. x - y < 0 ⟹ |x - y| = -(x - y) = -x + y.',
            options: [
              'x negatif olduğu için |x| = -x; (x - y) negatif olduğu için |x - y| = -(x - y) = -x + y',
              '|x| = x ve |x - y| = x - y olarak aynen çıkar.',
              '|x| = -x ve |x - y| = x + y olarak çıkar.',
              '|x| = 0 ve |x - y| = y - x olarak çıkar.',
            ],
            correctOptionIndex: 0,
            explanation: 'x < 0 olduğu için negatif sayının mutlak değeri önüne eksi alarak çıkar: |x| = -x. x < y olduğundan küçükten büyük çıkarsa negatif olur: x - y < 0 ⟹ |x - y| = -(x - y) = -x + y.',
            goldenTactic: 'Mutlak değerin içi negatifse dışarı çıkarken tüm terimlerin işareti tersine döner.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: İfadeleri Toplama',
            prompt: 'Bulunan terimleri yerlerine yazıp toplayalım: (-x) + (-y) + (-x + y) sonucu nedir?',
            mathematicalHint: '(-x) + (-y) + (-x + y) = -x - y - x + y = -2x.',
            options: [
              '-2x',
              '0',
              '-2x + 2y',
              '2y',
            ],
            correctOptionIndex: 0,
            explanation: '(-x) + (-y) + (-x + y) = -x - y - x + y = -2x. (+y ile -y birbirini sıfırlar).',
            goldenTactic: 'Toplama aşamasında zıt işaretli harflerin birbirini götürdüğüne dikkat edin.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: -2x.',
      ),

      // PROBLEM 4: Eşlenik Çarpımı ile Köklü Toplam
      SocraticProblem(
        id: 'socratic_k5_p4',
        title: 'Eşlenik: 6 / (√5 - √2) - √20',
        examYear: 'KPSS Klasik Köklü Sayı Sorusu',
        rawQuestion: '6 / (√5 - √2) - √20\nişleminin sonucu kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Paydayı Eşlenik ile Çarpma',
            prompt: '6 / (√5 - √2) kesrinde paydayı rasyonel yapmak için kesir ne ile genişletilmelidir ve payda kaç olur?',
            mathematicalHint: '(√5 - √2)(√5 + √2) = 5 - 2 = 3.',
            options: [
              '(√5 + √2) ile genişletilir; payda (√5)² - (√2)² = 5 - 2 = 3 olur.',
              '√5 ile genişletilir; payda 5 - √10 olur.',
              '(√5 - √2) ile genişletilir; payda 3 olur.',
              '(√5 + √2) ile genişletilir; payda 5 + 2 = 7 olur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Paydanın eşleniği (√5 + √2)\'dir. Pay ile payda çarpıldığında iki kare farkından: (√5 - √2)(√5 + √2) = 5 - 2 = 3 elde edilir.',
            goldenTactic: '(√a - √b) ifadesinin eşleniği (√a + √b)\'dir ve çarpımları daima (a - b) tam sayısıdır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Pay ile Sadeleştirme',
            prompt: 'Pay kısmı 6(√5 + √2) oldu. Paydadaki 3 ile 6 sadeleşince geriye ne kalır?',
            mathematicalHint: '6 / 3 = 2 ⟹ 2(√5 + √2).',
            options: [
              '2(√5 + √2) = 2√5 + 2√2',
              '3(√5 + √2) = 3√5 + 3√2',
              '2√5 - 2√2',
              '6√5 + 6√2',
            ],
            correctOptionIndex: 0,
            explanation: '6(√5 + √2) / 3 = 2(√5 + √2) = 2√5 + 2√2 bulunur.',
            goldenTactic: 'Dağıtma yapmadan önce pay katsayısı ile paydanın sadeleşip sadeleşmediğini kontrol edin.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: √20 Terimini Çıkarma',
            prompt: '√20 terimi kök dışına 2√5 olarak çıkar. (2√5 + 2√2) - 2√5 işleminin sonucu nedir?',
            mathematicalHint: '2√5 + 2√2 - 2√5 = 2√2.',
            options: [
              '2√2',
              '4√5 + 2√2',
              '0',
              '√2',
            ],
            correctOptionIndex: 0,
            explanation: '20 = 4 · 5 olduğundan √20 = 2√5\'tir. 2√5 + 2√2 - 2√5 = 2√2 kalır.',
            goldenTactic: 'Köklü sayılarda kök içleri ve dereceleri aynı olan terimlerin katsayıları toplanır/çıkarılır.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 2√2.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k5_1',
        questionText: '-3² + (-2)⁴ - (-1)⁵ işleminin sonucunu bulunuz.',
        studentSteps: [
          'Adım 1: -3² ifadesi (-3) · (-3) = +9 olur.',
          'Adım 2: (-2)⁴ ifadesinde çift kuvvet olduğu için +16 olur.',
          'Adım 3: (-1)⁵ ifadesinde tek kuvvet olduğu için -1 olur.',
          'Adım 4: 9 + 16 - (-1) = 25 + 1 = 26 buldum.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci 1. adımda parantez olmayan -3² ifadesini (-3)² gibi düşünerek +9 almıştır. Halbuki kare kuvveti sadece 3\'e aittir, eksiye değil! -3² = -(3 · 3) = -9 olmalıdır.',
        correctSolution: '-3² = -9. (-2)⁴ = +16. (-1)⁵ = -1. İşlem: -9 + 16 - (-1) = 7 + 1 = 8 olmalıdır.',
        trapRule: 'Parantez yoksa çift kuvvet eksi işaretini yutamaz! -a² ≠ (-a)². Sadece parantez içindeki negatif sayının çift kuvveti pozitiftir.',
      ),
      TrapScenario(
        id: 'trap_k5_2',
        questionText: '√(16 + 9) işleminin sonucunu bulunuz.',
        studentSteps: [
          'Adım 1: Kök içindeki sayıları ayrı ayrı dışarı çıkarırım: √16 + √9.',
          'Adım 2: √16 = 4 ve √9 = 3 olur.',
          'Adım 3: 4 + 3 = 7 olarak sonucu bulurum.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci 1. adımda kök içindeki toplamayı köklerin toplamı olarak ayırmıştır. Köklü sayılarda toplama/çıkarma kök dışına ayrı ayrı dağıtılamaz! √(a + b) ≠ √a + √b.',
        correctSolution: 'Önce kök içi toplanmalıdır: 16 + 9 = 25. Ardından kök alınır: √25 = 5.',
        trapRule: '√(a² + b²) = a + b DEĞİLDİR! Kök içindeki toplama veya çıkarma işlemi bitirilmeden asla kök dışına çıkılamaz.',
      ),
      TrapScenario(
        id: 'trap_k5_3',
        questionText: 'a < 0 olduğuna göre √(a²) + a işleminin sonucunu bulunuz.',
        studentSteps: [
          'Adım 1: √(a²) ifadesinde kare ile karekök birbirini götürür ve geriye a kalır.',
          'Adım 2: a + a = 2a olarak sonucu bulurum.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci 1. adımda çift dereceli kökten ifadeyi mutlak değersiz çıkarmıştır. a < 0 iken √(a²) = |a| = -a olur.',
        correctSolution: '√(a²) = |a|. a < 0 olduğundan |a| = -a\'dır. İşlem: (-a) + a = 0 olur.',
        trapRule: 'Çift dereceli kök asla negatif çıkamaz! ²ⁿ√(x²ⁿ) = |x|\'tir. x negatif ise dışarı -x olarak çıkar.',
      ),
    ],
  );
}
