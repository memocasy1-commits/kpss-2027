import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 12: Kümeler ve Fonksiyonlar İnteraktif Veri Kümesi
class Konu12KumelerFonksiyonlarData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 12,
    title: 'Kümeler ve Fonksiyonlar',
    subtitle: 'Kesişim-Birleşim Dengesi, 2ⁿ Alt Küme Modeli, f(2x+1) İçini Eşitleme Tuzağı ve Bileşke Fonksiyon',
    icon: Icons.hub_rounded,
    themeColor: Color(0xFF7C3AED), // Violet-600
    osymWeight: '2 - 3 Soru (Cebirsel ve Mantıksal Yapı)',
    keyOutcomes: [
      's(A ∪ B) = s(A) + s(B) - s(A ∩ B) formülünde kesişimi çift saymamak için mutlaka çıkarmak',
      'n elemanlı kümenin alt küme sayısının 2ⁿ olduğunu ve artış farkı problemlerini çözebilmek',
      'f(2x + 1) ifadesinde f(7) sorulduğunda x yerine 7 değil, 2x + 1 = 7 ⟹ x = 3 yazılması gerektiğini refleks yapmak',
      '(f ∘ g)(x) bileşke işleminde kuralın daima "sağdan sola / içten dışa" f(g(x)) çalıştığını uygulamak',
    ],
    socraticProblems: [
      // PROBLEM 1: Küme Birleşimi Eleman Sayısı
      SocraticProblem(
        id: 'socratic_k12_p1',
        title: 'Birleşim Formülü: s(A) = 14, s(B) = 11, s(A ∩ B) = 5',
        examYear: 'KPSS Lisans / Ön Lisans Standart Küme Sorusu',
        rawQuestion: 'A ve B iki kümedir.\ns(A) = 14\ns(B) = 11\ns(A ∩ B) = 5\nolduğuna göre, s(A ∪ B) kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Birleşim Eleman Sayısı Formülü',
            prompt: 's(A ∪ B) bulunurken s(A) ve s(B) toplanınca ortak kesişim bölgesi neden çıkarılır?',
            mathematicalHint: 'Kesişim bölgesi hem A\'da hem B\'de olduğu için 2 kez sayılmıştır: s(A ∪ B) = s(A) + s(B) - s(A ∩ B).',
            options: [
              'Kesişim iki kez sayıldığı için 1 kez çıkarılmalıdır.',
              'Kesişimin birleşimle ilgisi yoktur.',
              'Kesişim iki kez eklenmelidir.',
              'Doğrudan s(A) + s(B) toplanır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! s(A) + s(B) toplamında ortadaki (A ∩ B) kesişim bölgesi iki kez toplanmış olur; bu yüzden 1 kez çıkarılır.',
            goldenTactic: '🎯 FORMÜL: s(A ∪ B) = s(A) + s(B) - s(A ∩ B).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: s(A ∪ B) Değerini Hesaplama',
            prompt: '14 + 11 - 5 işleminin sonucu kaçtır?',
            mathematicalHint: '25 - 5 = 20.',
            options: [
              '20',
              '25 (Kesişimi çıkarmayı unutanların bulduğu hatalı cevap)',
              '19',
              '30',
            ],
            correctOptionIndex: 0,
            explanation: 's(A ∪ B) = 14 + 11 - 5 = 25 - 5 = 20 bulunur.',
            goldenTactic: 'Venn şeması çizerek: Yalnız A = 9, Kesişim = 5, Yalnız B = 6 ⟹ 9 + 5 + 6 = 20.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: s(A ∪ B) = 20.',
      ),

      // PROBLEM 2: Alt Küme Sayısı Farkı
      SocraticProblem(
        id: 'socratic_k12_p2',
        title: 'Alt Küme Artışı: Eleman Sayısı 2 Artınca 48 Artan Küme',
        examYear: 'KPSS Genel Yetenek Klasik Küme Sorusu',
        rawQuestion: 'Bir kümenin eleman sayısı 2 artırıldığında, alt küme sayısı 48 artmaktadır.\nBuna göre, bu kümenin BAŞLANGIÇTAKİ eleman sayısı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Alt Küme Sayısı Formülü ve Denklem',
            prompt: 'n elemanlı bir kümenin alt küme sayısı 2ⁿ\'dir. Eleman sayısı n + 2 olunca alt küme sayısı 2ⁿ⁺² olur. Aradaki fark denklemi nedir?',
            mathematicalHint: '2ⁿ⁺² - 2ⁿ = 48.',
            options: [
              '2ⁿ⁺² - 2ⁿ = 48',
              '2(n + 2) - 2n = 48',
              '(n + 2)² - n² = 48',
              '2ⁿ + 2 = 48',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Alt küme sayısı 2\'nin kuvvetidir: Yeni alt küme sayısı 2ⁿ⁺², eskisi 2ⁿ\'dir. Fark: 2ⁿ⁺² - 2ⁿ = 48.',
            goldenTactic: '2ⁿ⁺² = 2ⁿ · 2² = 4 · 2ⁿ olduğuna dikkat edin.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Ortak Paranteze Alıp n\'yi Bulma',
            prompt: '4 · 2ⁿ - 2ⁿ = 3 · 2ⁿ = 48 eşitliğinden n kaçtır?',
            mathematicalHint: '3 · 2ⁿ = 48 ⟹ 2ⁿ = 16 ⟹ 2⁴ = 16 ⟹ n = 4.',
            options: [
              'n = 4 (Çünkü 2⁴ = 16 ve 2⁶ = 64. Fark = 64 - 16 = 48).',
              'n = 5',
              'n = 3',
              'n = 6',
            ],
            correctOptionIndex: 0,
            explanation: '3 · 2ⁿ = 48 ⟹ 2ⁿ = 16 ⟹ n = 4 bulunur.',
            goldenTactic: '2\'nin kuvvetlerini ezbere bilin: 2, 4, 8, 16, 32, 64, 128, 256.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Kümenin başlangıçtaki eleman sayısı 4\'tür.',
      ),

      // PROBLEM 3: f(2x + 1) Fonksiyon Değeri
      SocraticProblem(
        id: 'socratic_k12_p3',
        title: 'İçini Eşitleme Tuzağı: f(2x + 1) = x² - 3x + 5 için f(7)',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Fonksiyon Sorusu',
        rawQuestion: 'f(2x + 1) = x² - 3x + 5\nolduğuna göre, f(7) değeri kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: x Yerine Ne Yazılacağını Bulma',
            prompt: 'f(7)\'yi bulmak için f\'nin içindeki (2x + 1) ifadesini 7\'ye eşitleriz. x yerine kaç yazılmalıdır?',
            mathematicalHint: '2x + 1 = 7 ⟹ 2x = 6 ⟹ x = 3. x yerine 7 DEĞİL, 3 yazılmalıdır!',
            options: [
              'x = 3 yazılmalıdır (Çünkü 2·3 + 1 = 7 yapar).',
              'Doğrudan x = 7 yazılmalıdır (Büyük Hata!).',
              'x = 4 yazılmalıdır.',
              'x = 2 yazılmalıdır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Tuzak! f(x) verilmediği için x yerine doğrudan 7 yazılmaz. Parantezin içinin 7 olması istenir: 2x + 1 = 7 ⟹ x = 3 yazılmalıdır.',
            goldenTactic: '🎯 BÜYÜK KURAL: Fonksiyonun içi neye eşitlenmek isteniyorsa o denklem çözülüp x bulunur!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: x = 3 Değerini Yerine Koyup Sonucu Bulma',
            prompt: 'x = 3 değerini sağ taraftaki (x² - 3x + 5) ifadesinde yerine yazarsak f(7) kaç çıkar?',
            mathematicalHint: '3² - 3·3 + 5 = 9 - 9 + 5 = 5.',
            options: [
              '3² - 3·3 + 5 = 9 - 9 + 5 = 5',
              '7² - 3·7 + 5 = 33 (x yerine 7 yazanların bulduğu hatalı cevap)',
              '10',
              '14',
            ],
            correctOptionIndex: 0,
            explanation: 'x = 3 için f(2·3 + 1) = f(7) = 3² - 3·3 + 5 = 9 - 9 + 5 = 5 bulunur.',
            goldenTactic: 'x yerine 7 yazıp 33 bulan adaylar ÖSYM\'nin en yaygın tuzağına düşenlerdir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: f(7) = 5.',
      ),

      // PROBLEM 4: Bileşke Fonksiyon
      SocraticProblem(
        id: 'socratic_k12_p4',
        title: 'Bileşke Fonksiyon: (f ∘ g)(2)',
        examYear: 'KPSS Genel Yetenek Standart Fonksiyon Sorusu',
        rawQuestion: 'f(x) = 2x - 3\ng(x) = 3x + 1\nolduğuna göre, (f ∘ g)(2) değeri kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Bileşke Fonksiyonun Açılımı ve g(2) Hesabı',
            prompt: '(f ∘ g)(2) ifadesi f(g(2)) demektir. Önce İÇTEKİ g(2) değeri hesaplanır. g(2) kaçtır?',
            mathematicalHint: 'g(2) = 3 · 2 + 1 = 7.',
            options: [
              'g(2) = 3 · 2 + 1 = 7',
              'g(2) = 2 · 2 - 3 = 1',
              'g(2) = 6',
              'g(2) = 8',
            ],
            correctOptionIndex: 0,
            explanation: 'Bileşkede işlem sağdan sola / içten dışa yapılır: (f ∘ g)(2) = f(g(2)). g(2) = 3(2) + 1 = 7.',
            goldenTactic: '(f ∘ g)(x) daima f(g(x)) olarak açılır ve en içteki fonksiyondan başlanır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: f(7) Değerini Hesaplama',
            prompt: 'g(2) = 7 olduğuna göre f(g(2)) = f(7) kaç olur?',
            mathematicalHint: 'f(7) = 2 · 7 - 3 = 14 - 3 = 11.',
            options: [
              'f(7) = 2 · 7 - 3 = 11',
              'f(7) = 14',
              'f(7) = 17',
              'f(7) = 9',
            ],
            correctOptionIndex: 0,
            explanation: 'f(7) = 2(7) - 3 = 14 - 3 = 11 bulunur.',
            goldenTactic: 'Önce g sonra f uygulandığına dikkat edin.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: (f ∘ g)(2) = 11.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k12_1',
        questionText: 'f(3x - 2) = 4x + 1 olduğuna göre f(4) kaçtır?',
        studentSteps: [
          'Adım 1: f(4) sorulduğu için x yerine 4 yazarım.',
          'Adım 2: 4 · 4 + 1 = 17 bulurum.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci x yerine doğrudan 4 yazmıştır! Parantezin içinin 4 olması gerekir: 3x - 2 = 4 ⟹ 3x = 6 ⟹ x = 2 yazılmalıdır. f(4) = 4·2 + 1 = 9 olmalıdır.',
        correctSolution: '3x - 2 = 4 ⟹ x = 2. f(4) = 4(2) + 1 = 9.',
        trapRule: 'Fonksiyon parantezinin içi x değilse doğrudan x yerine sayı yazılamaz; iç kısım eşitlenir!',
      ),
      TrapScenario(
        id: 'trap_k12_2',
        questionText: 's(A) = 10, s(B) = 8 ve kesişim 3 elemanlı ise s(A ∪ B) kaçtır?',
        studentSteps: [
          'Adım 1: A kümesinde 10, B kümesinde 8 eleman vardır.',
          'Adım 2: Birleşim için ikisini toplarım: 10 + 8 = 18 derim.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci kesişim bölgesindeki 3 elemanın hem A hem B\'de iki kez sayıldığını unutmuştur. 10 + 8 - 3 = 15 olmalıdır.',
        correctSolution: 's(A ∪ B) = s(A) + s(B) - s(A ∩ B) = 10 + 8 - 3 = 15.',
        trapRule: 'Küme birleşiminde kesişim çift sayılmaması için mutlaka 1 kez çıkarılmalıdır!',
      ),
      TrapScenario(
        id: 'trap_k12_3',
        questionText: 'f(x) = 2x ve g(x) = x + 3 olduğuna göre (f ∘ g)(1) kaçtır?',
        studentSteps: [
          'Adım 1: Önce f(1) hesaplarım: 2 · 1 = 2.',
          'Adım 2: Sonra g(2) hesaplarım: 2 + 3 = 5 derim.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci bileşkeyi soldan sağa uygulamıştır. Bileşke fonksiyon (f ∘ g)(1) = f(g(1)) şeklinde sağdan sola / içten dışa çalışır! Önce g(1)=4, sonra f(4)=8 bulunmalıdır.',
        correctSolution: '(f ∘ g)(1) = f(g(1)). g(1) = 1 + 3 = 4. f(4) = 2 · 4 = 8.',
        trapRule: 'Bileşke fonksiyonda işlem sırası daima sağdan soladır (içten dışa).',
      ),
    ],
  );
}
