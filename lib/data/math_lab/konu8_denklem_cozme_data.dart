import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 8: Birinci Dereceden Denklemler İnteraktif Veri Kümesi
class Konu8DenklemCozmeData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 8,
    title: 'Birinci Dereceden Denklemler',
    subtitle: 'Denklem Çözme, Sonsuz/Boş Çözüm Şartları, Yok Etme Metodu ve Paydayı Sıfırlayan Kök Tuzağı',
    icon: Icons.functions_rounded,
    themeColor: Color(0xFF4F46E5), // Indigo-600
    osymWeight: '1 - 2 Soru (Problemlerin Temeli)',
    keyOutcomes: [
      'ax + b = 0 denkleminde sonsuz çözüm (a=0, b=0) ve boş küme (a=0, b≠0) şartlarını eksiksiz uygulamak',
      'İki bilinmeyenli denklem sistemlerini yok etme veya yerine koyma metoduyla saniyeler içinde çözmek',
      'Tam karelerin toplamı sıfır olduğunda ((A)² + (B)² = 0) her iki ifadenin içinin sıfır olduğunu görmek',
      'Rasyonel denklemlerde bulunan kökün paydayı sıfır yapıp yapmadığını (tanımsızlık) daima denetlemek',
    ],
    socraticProblems: [
      // PROBLEM 1: Sonsuz Çözüm (Tüm Gerçel Sayılar)
      SocraticProblem(
        id: 'socratic_k8_p1',
        title: 'Her x İçin Sağlanan Denklem: (a - 3)x + b + 5 = 0',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Soru',
        rawQuestion: '(a - 3)x + b + 5 = 0\ndenklemi HER x GERÇEL SAYISI İÇİN sağlandığına göre, a · b çarpımı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Sonsuz Çözüm Şartını Belirleme',
            prompt: 'ax + b = 0 denkleminin her x için sağlanması (çözüm kümesinin sonsuz elemanlı olması) için x\'in katsayısı ve sabit terim ne olmalıdır?',
            mathematicalHint: '0 · x + 0 = 0 eşitliği her x için doğrudur.',
            options: [
              'Hem x\'in katsayısı hem sabit terim sıfır olmalıdır: a - 3 = 0 ve b + 5 = 0.',
              'x = 0 olmalıdır.',
              'Katsayılar 1 olmalıdır.',
              'a = b olmalıdır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! 0 · x + 0 = 0 olmalıdır ki x yerine hangi reel sayı yazılırsa yazılsın sonuç 0 çıksın.',
            goldenTactic: '🎯 "Her x için sağlanır" veya "ÇK = R" diyorsa tüm katsayıları ve sabiti sıfıra eşitleyin!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: a ve b Değerlerini Bulup Çarpma',
            prompt: 'a - 3 = 0 ve b + 5 = 0 eşitliklerinden a ve b kaçtır ve çarpımları ne olur?',
            mathematicalHint: 'a = 3, b = -5. a · b = 3 · (-5) = -15.',
            options: [
              'a = 3, b = -5 ve a · b = -15',
              'a = -3, b = 5 ve a · b = -15',
              'a = 3, b = 5 ve a · b = 15',
              'a = 0, b = 0 ve a · b = 0',
            ],
            correctOptionIndex: 0,
            explanation: 'a = 3 ve b = -5 olur. Çarpımları: 3 · (-5) = -15\'tir.',
            goldenTactic: 'Eğer "Çözüm kümesi boş kümedir (ÇK = ∅)" deseydi; a - 3 = 0 ve b + 5 ≠ 0 olurdu!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: a · b = -15.',
      ),

      // PROBLEM 2: İki Bilinmeyenli Denklemde Yok Etme
      SocraticProblem(
        id: 'socratic_k8_p2',
        title: 'Yok Etme Metodu: 3x + 2y = 19 ve 2x - y = 8',
        examYear: 'KPSS Genel Yetenek Standart Denklem',
        rawQuestion: '3x + 2y = 19\n2x - y = 8\nolduğuna göre, x + y toplamı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: y Değişkenini Yok Etme',
            prompt: 'İkinci denklemi 2 ile çarparak taraf tarafa toplarsak y değişkeni yok olur. Yeni denklem toplamı ne olur?',
            mathematicalHint: '2 · (2x - y = 8) ⟹ 4x - 2y = 16. (3x + 2y) + (4x - 2y) = 19 + 16.',
            options: [
              '7x = 35 ⟹ x = 5',
              '5x = 27 ⟹ x = 5.4',
              '7x = 27',
              'x = 3',
            ],
            correctOptionIndex: 0,
            explanation: '4x - 2y = 16 ile 3x + 2y = 19 toplanınca (+2y ile -2y gider): 7x = 35 ⟹ x = 5 bulunur.',
            goldenTactic: 'Zıt işaretli olan katsayıları eşitleyip toplamak en hızlı yok etme yoludur.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: y Değerini ve Toplamı Bulma',
            prompt: 'x = 5 değerini 2x - y = 8 denkleminde yerine yazarsak y ve x + y kaç olur?',
            mathematicalHint: '2 · 5 - y = 8 ⟹ 10 - y = 8 ⟹ y = 2. x + y = 5 + 2 = 7.',
            options: [
              'y = 2 ve x + y = 5 + 2 = 7',
              'y = 3 ve x + y = 8',
              'y = 1 ve x + y = 6',
              'y = -2 ve x + y = 3',
            ],
            correctOptionIndex: 0,
            explanation: '2(5) - y = 8 ⟹ y = 2. Buradan x + y = 5 + 2 = 7 elde edilir.',
            goldenTactic: 'Bulunan ilk değişkeni katsayıları en küçük ve pozitif olan denklemde yerine yazın.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: x + y = 7.',
      ),

      // PROBLEM 3: Kareler Toplamı Sıfır
      SocraticProblem(
        id: 'socratic_k8_p3',
        title: 'Tam Kareler Toplamı Sıfır: (x - y - 3)² + (2x + y - 12)² = 0',
        examYear: 'KPSS Lisans / Seçici Soru Tipi',
        rawQuestion: 'x ve y gerçel sayılar olmak üzere,\n(x - y - 3)² + (2x + y - 12)² = 0\nolduğuna göre, x · y çarpımı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: İki Tam Karenin Toplamının Sıfır Olma Şartı',
            prompt: 'İki gerçel sayının kareleri toplamı sıfır ise bu karelerin içleri ne olmalıdır?',
            mathematicalHint: 'Kareler daima ≥ 0 olduğundan toplamın 0 olması için ikisi de aynı anda 0 olmalıdır.',
            options: [
              'Her iki parantezin içi de ayrı ayrı sıfır olmalıdır: x - y - 3 = 0 ve 2x + y - 12 = 0.',
              'Biri pozitif diğeri negatif olmalıdır.',
              'Parantezlerin toplamı sıfır olmalıdır.',
              'x = 0 ve y = 0 olmalıdır.',
            ],
            correctOptionIndex: 0,
            explanation: 'A² + B² = 0 ancak ve ancak A = 0 ve B = 0 iken sağlanır (hiçbir gerçel sayının karesi negatif olamaz).',
            goldenTactic: 'Kareler toplamı veya mutlak değerler toplamı sıfırsa içlerin her birini sıfıra eşitleyin!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: x ve y Değerlerini Çözme',
            prompt: 'x - y = 3 ve 2x + y = 12 denklemlerini taraf tarafa toplarsak x ve y kaç çıkar?',
            mathematicalHint: '3x = 15 ⟹ x = 5. 5 - y = 3 ⟹ y = 2. x · y = 5 · 2 = 10.',
            options: [
              'x = 5, y = 2 ve x · y = 10',
              'x = 4, y = 1 ve x · y = 4',
              'x = 3, y = 0 ve x · y = 0',
              'x = 6, y = 3 ve x · y = 18',
            ],
            correctOptionIndex: 0,
            explanation: 'Taraf tarafa toplarsak: 3x = 15 ⟹ x = 5. x - y = 3 ⟹ y = 2. Çarpımları: 5 · 2 = 10.',
            goldenTactic: 'Katsayıları sade olan yok etme sistemi doğrudan çözümü verir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: x · y = 10.',
      ),

      // PROBLEM 4: Rasyonel Denklemde Yalancı Kök
      SocraticProblem(
        id: 'socratic_k8_p4',
        title: 'Yalancı Kök Tuzağı: (2x - 6)/(x - 3) = x - 1',
        examYear: 'KPSS Klasik Tuzaklı Soru',
        rawQuestion: '[(2x - 6) / (x - 3)] = x - 1\ndenkleminin ÇÖZÜM KÜMESİ nedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Payı Çarpanlarına Ayırıp Sadeleştirme',
            prompt: '2x - 6 = 2(x - 3) olduğuna göre sol taraf neye eşittir (x ≠ 3 olmak şartıyla)?',
            mathematicalHint: '2(x - 3) / (x - 3) = 2 (x ≠ 3 iken).',
            options: [
              '2 = x - 1 ⟹ x = 3 aday köktür.',
              'x = 2',
              'x = 1',
              'x = 0',
            ],
            correctOptionIndex: 0,
            explanation: 'Pay 2 parantezine alınırsa: 2(x - 3)/(x - 3) = 2 kalır. 2 = x - 1 ⟹ x = 3 aday kök olarak bulunur.',
            goldenTactic: 'Rasyonel denklemlerde paydada bilinmeyen varsa ilk iş paydayı sıfır yapan değeri kenara not etmektir!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Payda Tanımsızlık Denetimi ve Çözüm Kümesi',
            prompt: 'Bulunan x = 3 değeri orijinal denklemdeki paydayı (x - 3) sıfır yapmaktadır. Çözüm kümesi ne olmalıdır?',
            mathematicalHint: 'x = 3 için payda 3 - 3 = 0 olur (Tanımsız!). Dolayısıyla x = 3 kök kabul edilemez.',
            options: [
              'Çözüm Kümesi BOŞ KÜMEDİR (ÇK = ∅). Çünkü x = 3 paydayı sıfır yapar!',
              'ÇK = {3}',
              'ÇK = {2}',
              'ÇK = R',
            ],
            correctOptionIndex: 0,
            explanation: 'x = 3 paydayı 0 yaptığı için tanımsızlık yaratır ve elenir. Başka aday kök olmadığından çözüm kümesi BOŞ KÜMEDİR (∅).',
            goldenTactic: '🎯 BÜYÜK TUZAK: Bulduğunuz kök paydayı sıfırlıyorsa onu asla çözüm kümesine alamazsınız!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: ÇK = ∅ (Boş Küme).',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k8_1',
        questionText: '(x² - 4)/(x - 2) = 4 denkleminin çözüm kümesini bulunuz.',
        studentSteps: [
          'Adım 1: x² - 4 = (x - 2)(x + 2) olarak açarım.',
          'Adım 2: (x - 2) terimlerini sadeleştiririm: x + 2 = 4.',
          'Adım 3: x = 2 bulurum. ÇK = {2} derim.',
        ],
        wrongStepIndex: 2,
        mistakeExplanation: 'Öğrenci bulduğu x = 2 kökünü paydaya yazıp kontrol etmemiştir. x = 2 yazıldığında payda 2 - 2 = 0 olur ve kesir tanımsız hale gelir! Dolayısıyla 2 bir kök olamaz.',
        correctSolution: 'x ≠ 2 olmalıdır. x + 2 = 4 ⟹ x = 2 çıkar ancak payda sıfır olduğu için kök iptal edilir. ÇK = ∅ olur.',
        trapRule: 'Paydayı sıfır yapan aday kök yalancı köktür, çözüm kümesine KESİNLİKLE alınamaz!',
      ),
      TrapScenario(
        id: 'trap_k8_2',
        questionText: 'x² = 5x denkleminin çözüm kümesini bulunuz.',
        studentSteps: [
          'Adım 1: Her iki tarafı x ile sadeleştiririm.',
          'Adım 2: x = 5 bulurum ve ÇK = {5} derim.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci denklemin her iki tarafını bilinmeyen x ile sadeleştirirken x = 0 kökünü yok etmiştir! Bilinmeyenle sadeleştirme yapılmaz, çarpanlara ayrılır.',
        correctSolution: 'x² - 5x = 0 ⟹ x(x - 5) = 0 ⟹ x = 0 veya x = 5. ÇK = {0, 5} olmalıdır.',
        trapRule: 'Denklemde bilinmeyenle sadeleştirme yaparsanız o kökü kaybedersiniz! İfadeyi sola toplayıp ortak paranteze alın.',
      ),
      TrapScenario(
        id: 'trap_k8_3',
        questionText: '(m - 2)x + 7 = 0 denkleminin çözüm kümesi boş küme olduğuna göre m kaçtır?',
        studentSteps: [
          'Adım 1: Boş küme olması için m - 2 = 0 ve sabit de sıfır olmalıdır.',
          'Adım 2: 7 = 0 olamayacağı için m bulunamaz dedim.',
        ],
        wrongStepIndex: 0,
        mistakeExplanation: 'Öğrenci boş küme şartı ile sonsuz çözüm şartını karıştırmıştır. ax + b = 0 için ÇK = ∅ olması şartı: a = 0 ve b ≠ 0\'dır. Sabit terim zaten 7 ≠ 0 olduğundan sadece m - 2 = 0 olması yeterlidir.',
        correctSolution: 'm - 2 = 0 ⟹ m = 2 olmalıdır. m = 2 için 0 · x + 7 = 0 ⟹ 7 = 0 çelişkisi doğar ve ÇK = ∅ olur.',
        trapRule: 'ÇK = ∅ için katsayı 0, sabit terim SIFIRDAN FARKLI olmalıdır (0·x + b = 0 çelişkisi).',
      ),
    ],
  );
}
