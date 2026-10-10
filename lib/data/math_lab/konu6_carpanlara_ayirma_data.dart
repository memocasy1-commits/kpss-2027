import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 6: Çarpanlara Ayırma ve Özdeşlikler İnteraktif Veri Kümesi
class Konu6CarpanlaraAyirmaData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 6,
    title: 'Çarpanlara Ayırma ve Özdeşlikler',
    subtitle: 'İki Kare Farkı, Tam Kare Açılımı, x + 1/x Karesel Kestirmeleri ve Sadeleştirme Sanatı',
    icon: Icons.pie_chart_outline_rounded,
    themeColor: Color(0xFF0D9488), // Teal-600
    osymWeight: '2 - 3 Soru (Sınavın 15. - 17. Soruları)',
    keyOutcomes: [
      '(a ± b)² açılımında ortadaki 2ab terimini kesinlikle unutmamak',
      'a² - b² = (a - b)(a + b) iki kare farkını hem cebirsel hem sayısal hesaplarda refleks yapmak',
      'x + 1/x = k verildiğinde k² - 2 kuralıyla saniyeler içinde x² + 1/x² değerine ulaşmak',
      'Kesirli cebirsel ifadelerde pay ve paydayı çarpanlarına ayırıp hatasız sadeleştirme yapmak',
    ],
    socraticProblems: [
      // PROBLEM 1: Sadeleştirme ve İki Kare Farkı
      SocraticProblem(
        id: 'socratic_k6_p1',
        title: 'Cebirsel Sadeleştirme: (x² - 9)/(x² + 5x + 6) : (x - 3)/(x + 2)',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Soru',
        rawQuestion: '[(x² - 9) / (x² + 5x + 6)] : [(x - 3) / (x + 2)]\nişleminin en sade hali nedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Paydaki İki Kare Farkını Açma',
            prompt: 'Birinci kesrin payında yer alan (x² - 9) ifadesi nasıl çarpanlarına ayrılır?',
            mathematicalHint: '9 = 3² olduğuna göre a² - b² = (a - b)(a + b) kuralı uygulanır.',
            options: [
              '(x - 3)(x + 3)',
              '(x - 3)²',
              '(x + 3)²',
              'x(x - 9)',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! x² - 9 = x² - 3² = (x - 3)(x + 3) iki kare farkıdır.',
            goldenTactic: 'a² - b² = (a - b)(a + b) özdeşliği KPSS\'nin en popüler çarpanlara ayırma kuralıdır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Paydadaki Üç Terimliyi Çarpanlarına Ayırma',
            prompt: 'x² + 5x + 6 ifadesinde çarpımları 6, toplamları 5 olan iki sayı hangileridir?',
            mathematicalHint: '2 · 3 = 6 ve 2 + 3 = 5.',
            options: [
              '(x + 2)(x + 3)',
              '(x + 1)(x + 6)',
              '(x - 2)(x - 3)',
              '(x + 5)(x + 1)',
            ],
            correctOptionIndex: 0,
            explanation: 'Çarpımları +6, toplamları +5 olan sayılar +2 ve +3\'tür. Dolayısıyla x² + 5x + 6 = (x + 2)(x + 3) olur.',
            goldenTactic: 'x² + bx + c ifadesinde çarpımı c, toplamı b olan iki sayı aranır.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Bölme İşlemini Çarpmaya Çevirip Sadeleştirme',
            prompt: 'İkinci kesri ters çevirip çarpalım: [(x - 3)(x + 3) / ((x + 2)(x + 3))] · [(x + 2) / (x - 3)]. Tüm terimler sadeleştiğinde sonuç ne kalır?',
            mathematicalHint: '(x - 3), (x + 3) ve (x + 2) terimlerinin tamamı pay ve paydada birbirini götürür.',
            options: [
              '1',
              'x',
              '(x + 3) / (x - 3)',
              '0',
            ],
            correctOptionIndex: 0,
            explanation: 'Tüm çarpanlar birbiriyle sadeleşir: Pay ve payda birebir aynı terimlerden oluştuğundan sonuç 1\'dir.',
            goldenTactic: 'Rasyonel bölmelerde ikinci kesir ters çevrilip çarpılır ve ortak çarpanlar yok edilir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 1.',
      ),

      // PROBLEM 2: x + 1/x Karesel Açılımı
      SocraticProblem(
        id: 'socratic_k6_p2',
        title: 'Özdeşlik Kestirmesi: x + 1/x = 4 ise x² + 1/x²',
        examYear: 'KPSS Genel Yetenek Standart Soru Tipi',
        rawQuestion: 'x + 1/x = 4\nolduğuna göre, x² + 1/x² ifadesinin değeri kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Eşitliğin Her İki Tarafının Karesini Alma',
            prompt: '(x + 1/x)² ifadesinin tam kare açılımı nedir?',
            mathematicalHint: '(a + b)² = a² + 2ab + b².',
            options: [
              'x² + 2 · x · (1/x) + (1/x)² = x² + 2 + 1/x²',
              'x² + 1/x²',
              'x² + 4 + 1/x²',
              '2x + 2/x',
            ],
            correctOptionIndex: 0,
            explanation: 'Tam kare açılımında ortada 2ab terimi oluşur: 2 · x · (1/x) = 2. Açılım: x² + 2 + 1/x² olur.',
            goldenTactic: 'x ile 1/x çarpımı 1 olduğu için ortadaki terim daima sabit +2 (veya -2) kalır!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Değeri Hesaplama',
            prompt: 'x² + 2 + 1/x² = 4² = 16 olduğuna göre, x² + 1/x² kaç olur?',
            mathematicalHint: '16 - 2 = 14.',
            options: [
              '16 - 2 = 14',
              '16 + 2 = 18',
              '16',
              '12',
            ],
            correctOptionIndex: 0,
            explanation: 'Eşitliğin sağındaki 16\'dan ortadaki 2 çıkarılır: x² + 1/x² = 16 - 2 = 14.',
            goldenTactic: 'Pratik kural: x + 1/x = k ise x² + 1/x² = k² - 2\'dir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 14.',
      ),

      // PROBLEM 3: Tam Kareye Tamamlama ile Minimum Değer
      SocraticProblem(
        id: 'socratic_k6_p3',
        title: 'Tam Kareye Tamamlama: x² - 6x + y² + 4y + 20 Minimum Değeri',
        examYear: 'KPSS Lisans / Zor Seviye Soru Tipi',
        rawQuestion: 'x ve y birer gerçel sayı olmak üzere,\nx² - 6x + y² + 4y + 20\nifadesinin alabileceği EN KÜÇÜK değer kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: x Terimini Tam Kare Yapma',
            prompt: 'x² - 6x ifadesini tam kare yapmak için hangi sayı eklenmelidir?',
            mathematicalHint: '(-6 / 2)² = (-3)² = 9. İfade (x - 3)² olur.',
            options: [
              '9 eklenir ve (x - 3)² elde edilir.',
              '6 eklenir.',
              '36 eklenir.',
              '3 eklenir.',
            ],
            correctOptionIndex: 0,
            explanation: 'x\'in katsayısının yarısının karesi: (-6/2)² = 9. Böylece x² - 6x + 9 = (x - 3)² tam karesi oluşturulur.',
            goldenTactic: 'Tam kareye tamamlarken x\'in katsayısının yarısının karesi eklenip çıkarılır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: y Terimini Tam Kare Yapma',
            prompt: 'y² + 4y ifadesini tam kare yapmak için hangi sayı eklenmelidir?',
            mathematicalHint: '(4 / 2)² = 2² = 4. İfade (y + 2)² olur.',
            options: [
              '4 eklenir ve (y + 2)² elde edilir.',
              '2 eklenir.',
              '16 eklenir.',
              '8 eklenir.',
            ],
            correctOptionIndex: 0,
            explanation: 'y\'nin katsayısının yarısının karesi: (4/2)² = 4. Böylece y² + 4y + 4 = (y + 2)² olur.',
            goldenTactic: 'Her iki değişken bağımsız olarak ayrı ayrı tam kareye tamamlanır.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Sabiti Dengeleme ve En Küçük Değeri Bulma',
            prompt: 'Kullanılan sabitler 9 + 4 = 13\'tür. Başlangıçtaki sabit 20 olduğuna göre kalan sabit ve minimum değer nedir?',
            mathematicalHint: '(x - 3)² + (y + 2)² + (20 - 13) = (x - 3)² + (y + 2)² + 7.',
            options: [
              'Tam kareler en az 0 olabileceğinden en küçük değer 20 - 13 = 7\'dir.',
              'En küçük değer 0\'dır.',
              'En küçük değer 20\'dir.',
              'En küçük değer 13\'tür.',
            ],
            correctOptionIndex: 0,
            explanation: 'İfade (x - 3)² + (y + 2)² + 7 haline gelir. Reel sayıların kareleri en az 0 olabileceğinden x=3 ve y=-2 için minimum değer 7 olur.',
            goldenTactic: 'Gerçel sayıların kareleri negatif olamaz ((A)² ≥ 0); minimum değer tam karelerin içleri sıfır yapılarak bulunur.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 7.',
      ),

      // PROBLEM 4: Sayısal İki Kare Farkı
      SocraticProblem(
        id: 'socratic_k6_p4',
        title: 'Büyük Sayılarda İki Kare Farkı: 105² - 95² = 400 · x',
        examYear: 'KPSS Pratik Hesap Soru Tipi',
        rawQuestion: '105² - 95² = 400 · x\nolduğuna göre, x kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Sol Tarafı İki Kare Farkı Olarak Çarpanlara Ayırma',
            prompt: '105² - 95² ifadesini karelerini almadan iki kare farkıyla çarpanlarına nasıl ayırırız?',
            mathematicalHint: 'a² - b² = (a - b)(a + b).',
            options: [
              '(105 - 95) · (105 + 95)',
              '(105 - 95)²',
              '(105 + 95)²',
              '2 · (105 - 95)',
            ],
            correctOptionIndex: 0,
            explanation: 'a² - b² = (a - b)(a + b) kuralından: (105 - 95) · (105 + 95) = 10 · 200 = 2000 bulunur.',
            goldenTactic: 'Büyük sayıların karelerini almak yerine farkları ile toplamlarını çarpmak saniyeler kazandırır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: x Değerini Bulma',
            prompt: '2000 = 400 · x eşitliğinden x kaçtır?',
            mathematicalHint: '2000 / 400 = 5.',
            options: [
              '5',
              '4',
              '10',
              '50',
            ],
            correctOptionIndex: 0,
            explanation: '2000 = 400 · x ⟹ x = 2000 / 400 = 5.',
            goldenTactic: 'ÖSYM büyük sayılarla işlem yaptırmaz; arkasında daima iki kare farkı gibi bir özdeşlik gizlidir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 5.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k6_1',
        questionText: '(x + 5)² ifadesini açınız.',
        studentSteps: [
          'Adım 1: Birinci terimin karesini alırım: x².',
          'Adım 2: İkinci terimin karesini alırım: 5² = 25.',
          'Adım 3: İkisini toplar ve sonucu x² + 25 bulurum.',
        ],
        wrongStepIndex: 2,
        mistakeExplanation: 'Öğrenci tam kare açılımında ortadaki 2 · a · b terimini (2 · x · 5 = 10x) tamamen unutmuştur! (a + b)² ≠ a² + b².',
        correctSolution: '(x + 5)² = x² + 2 · x · 5 + 5² = x² + 10x + 25 olmalıdır.',
        trapRule: 'Tam karede ortadaki "birinciyle ikincinin çarpımının iki katı (2ab)" asla unutulamaz!',
      ),
      TrapScenario(
        id: 'trap_k6_2',
        questionText: '(x² + 4) / (x + 2) kesrini en sade hale getiriniz.',
        studentSteps: [
          'Adım 1: Paydaki x² ile paydadaki x sadeleşir, geriye x kalır.',
          'Adım 2: Paydaki 4 ile paydadaki 2 sadeleşir, geriye 2 kalır.',
          'Adım 3: Sonuç x + 2 olur.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci arada toplama (+) işareti varken terimleri tek tek sadeleştirmiştir! Arada toplama veya çıkarma varken sadeleştirme YAPILAMAZ; önce ortak paranteze veya çarpım haline getirilmelidir. Ayrıca x² + 4 reel sayılarda çarpanlarına ayrılamaz.',
        correctSolution: '(x² + 4) / (x + 2) kesri reel sayılarda daha fazla sadeleşemez; en sade hali kendisidir.',
        trapRule: 'Arada toplama/çıkarma varken sadeleştirme yapılmaz! Sadece çarpım durumundaki çarpanlar sadeleştirilebilir.',
      ),
      TrapScenario(
        id: 'trap_k6_3',
        questionText: '(x + 2)² - (x - 3)² ifadesini açıp sadeleştiriniz.',
        studentSteps: [
          'Adım 1: İki kare farkı uygularım: [(x + 2) - (x - 3)] · [(x + 2) + (x - 3)].',
          'Adım 2: Birinci parantezde eksiyi dağıtırım: x + 2 - x - 3 = -1.',
          'Adım 3: İkinci parantez: 2x - 1.',
          'Adım 4: Sonuç: -1 · (2x - 1) = -2x + 1.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci 2. adımda eksiyi paranteze dağıtırken -(x - 3) ifadesini -x - 3 olarak yazmıştır! Doğrusu -x + 3 olmalıdır: x + 2 - x + 3 = 5.',
        correctSolution: '[(x + 2) - (x - 3)] = x + 2 - x + 3 = 5. İkinci parantez: (x + 2) + (x - 3) = 2x - 1. Çarpım: 5 · (2x - 1) = 10x - 5 olur.',
        trapRule: 'Eksiyi paranteze dağıtırken tüm işaretler tersine döner: -(a - b) = -a + b.',
      ),
    ],
  );
}
