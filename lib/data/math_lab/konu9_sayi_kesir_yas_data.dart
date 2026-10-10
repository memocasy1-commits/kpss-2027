import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 9: Sayı, Kesir ve Yaş Problemleri İnteraktif Veri Kümesi
class Konu9SayiKesirYasData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 9,
    title: 'Sayı, Kesir ve Yaş Problemleri',
    subtitle: 'Kalanın Kalanı Kesir Tuzağı, Yaş Farkının Korunumu ve Tel Orta Noktası Kestirmesi',
    icon: Icons.calculate_rounded,
    themeColor: Color(0xFF059669), // Emerald-600
    osymWeight: '4 - 6 Soru (Sınavın En Yüksek Ağırlıklı Bölümü)',
    keyOutcomes: [
      'Kesir problemlerinde bütüne x yerine paydaların EKOK\'u kadar (15x, 24x) değer vererek rasyonel sayı karmaşasından kurtulmak',
      '"Kalanın kalanı" ifadesine dikkat edip her harcamadan sonra kalan miktarı hesaplamak',
      'Yaş problemlerinde iki kişi arasındaki yaş farkının zamanla ASLA değişmediğini refleks yapmak',
      'Bir telin ucundan kesilen parçanın YARISI kadar (kesilen / 2) orta noktasının kaydığını saniyeler içinde çözmek',
    ],
    socraticProblems: [
      // PROBLEM 1: Kalanın Kalanı Kesir Problemi
      SocraticProblem(
        id: 'socratic_k9_p1',
        title: 'Kalanın Kalanı: Maaşın 1/3\'ü ve Kalanın 2/5\'i',
        examYear: 'KPSS Lisans / Ön Lisans Klasik Kesir Sorusu',
        rawQuestion: 'Bir memur maaşının 1/3\'ünü kiraya, KALAN parasının 2/5\'ini ise mutfak masraflarına harcıyor.\nGeriye 4800 TL kaldığına göre, bu memurun MAAŞI kaç TL\'dir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Paydaların Çarpımını Bütüne Atama',
            prompt: 'Paydalar 3 ve 5\'tir. Kesirlerle uğraşmamak için memurun tüm maaşına kaç x demeliyiz?',
            mathematicalHint: 'EKOK(3, 5) = 15. Maaşa 15x diyelim.',
            options: [
              'Maaş = 15x olsun (3 ve 5\'in ortak katı).',
              'Maaş = 8x olsun.',
              'Maaş = x olsun.',
              'Maaş = 100x olsun.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Maaşa 15x dersek kesirli işlemlerle uğraşmadan tam sayılarla adım adım ilerleriz.',
            goldenTactic: '🎯 ALTIN KURAL: Kesir problemlerinde paydaların çarpımını (3·5 = 15x) bütüne verin.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Kira ve "Kalanın" Hesabı',
            prompt: '15x maaşın 1/3\'ü kiraya giderse kira kaç x olur ve geriye ne kadar kalır?',
            mathematicalHint: 'Kira = 15x / 3 = 5x. Kalan = 15x - 5x = 10x.',
            options: [
              'Kira = 5x ve Kalan Para = 10x olur.',
              'Kira = 3x ve Kalan = 12x olur.',
              'Kira = 5x ve Kalan = 15x kalır.',
              'Kira = 10x olur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Kira = 15x · (1/3) = 5x. Kalan para = 15x - 5x = 10x\'tir. İkinci harcama bu 10x üzerinden yapılacaktır!',
            goldenTactic: '"Kalanın" kelimesi varsa yeni işlemi 15x üzerinden değil, kalan 10x üzerinden yapın.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Mutfak Harcaması ve Geriye Kalan Para',
            prompt: 'Kalan 10x paranın 2/5\'i mutfağa harcanırsa mutfak masrafı ve cepte en son kalan para kaç x olur?',
            mathematicalHint: 'Mutfak = 10x · (2/5) = 4x. Kalan = 10x - 4x = 6x.',
            options: [
              'Mutfak = 4x ve En Son Kalan = 6x olur.',
              'Mutfak = 2x ve Kalan = 8x olur.',
              'Mutfak = 6x ve Kalan = 4x olur.',
              'Mutfak = 4x ve Kalan = 11x olur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Mutfak = 10x · (2/5) = 4x harcanır. Cepte kalan para: 10x - 4x = 6x olur.',
            goldenTactic: 'Kalanın kalanı adımlarında her aşamayı çıkarma yaparak netleştirin.',
          ),
          SocraticStep(
            stepNumber: 4,
            title: '4. Adım: x Değeri ve Toplam Maaş',
            prompt: 'Geriye kalan 6x para 4800 TL olduğuna göre x ve toplam maaş (15x) kaç TL\'dir?',
            mathematicalHint: '6x = 4800 ⟹ x = 800 TL. Maaş = 15 · 800 = 12.000 TL.',
            options: [
              'x = 800 TL ve Maaş = 15 · 800 = 12.000 TL',
              'x = 600 TL ve Maaş = 9.000 TL',
              'x = 800 TL ve Maaş = 8.000 TL',
              'Maaş = 14.400 TL',
            ],
            correctOptionIndex: 0,
            explanation: '6x = 4800 ⟹ x = 800 TL. Toplam maaş: 15x = 15 · 800 = 12.000 TL bulunur.',
            goldenTactic: 'x bulunduktan sonra soru kökünde neyin istendiğine (Maaş mı, kira mı?) dikkat edin.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Memurun maaşı 12.000 TL\'dir.',
      ),

      // PROBLEM 2: Yaş Farkının Değişmezliği
      SocraticProblem(
        id: 'socratic_k9_p2',
        title: 'Yaş Farkı Sabiti: Anne ve İki Çocuğu',
        examYear: 'KPSS Yaş Problemi Standart Kalıp',
        rawQuestion: 'Bir annenin yaşı, iki çocuğunun YAŞLARI FARKI\'nın 6 katıdır.\n12 yıl sonra annenin yaşı, çocukların yaşları farkının 8 katı olacağına göre, annenin BUGÜNKÜ yaşı kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Yaş Farkının Zamanla Değişmediğini Görme',
            prompt: 'Çocukların bugünkü yaşları farkı F olsun. 12 yıl sonra çocukların yaşları farkı ne olur?',
            mathematicalHint: 'Yıllar geçse de iki insan arasındaki yaş farkı F olarak daima sabit kalır.',
            options: [
              'Yaş farkı değişmez, yine F olarak kalır.',
              'F + 12 olur.',
              'F + 24 olur.',
              '2F olur.',
            ],
            correctOptionIndex: 0,
            explanation: 'Harika! Her iki çocuk da 12 yaş büyüyeceğinden aralarındaki yaş farkı (F) HİÇBİR ZAMAN DEĞİŞMEZ.',
            goldenTactic: '🎯 YAŞ PROBLEMİ SIRRI: Yaş farkı zamana bağlı değildir, daima sabittir!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Denklemi Kurup F\'yi Bulma',
            prompt: 'Bugün Anne = 6F. 12 yıl sonra Anne = 6F + 12 olur. Bu değer 8F\'ye eşit olduğuna göre F kaçtır?',
            mathematicalHint: '6F + 12 = 8F ⟹ 2F = 12 ⟹ F = 6.',
            options: [
              '6F + 12 = 8F ⟹ 2F = 12 ⟹ F = 6',
              'F = 4',
              'F = 12',
              'F = 8',
            ],
            correctOptionIndex: 0,
            explanation: '12 yıl sonra annenin yaşı 6F + 12 olur. 6F + 12 = 8F ⟹ 2F = 12 ⟹ F = 6 (Yaş farkı 6\'dır).',
            goldenTactic: 'Tek bir bilinmeyen (F) ile problemi tek satırda çözebilirsiniz.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Annenin Bugünkü Yaşı',
            prompt: 'Annenin bugünkü yaşı 6F olduğuna göre anne bugün kaç yaşındadır?',
            mathematicalHint: '6 · 6 = 36.',
            options: [
              '6 · 6 = 36 yaşındadır.',
              '42 yaşındadır.',
              '30 yaşındadır.',
              '48 yaşındadır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Annenin bugünkü yaşı = 6F = 6 · 6 = 36\'dır.',
            goldenTactic: '12 yıl sonrasını sorsaydı 36 + 12 = 48 derdik.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Anne 36 yaşındadır.',
      ),

      // PROBLEM 3: Telin Orta Noktası Kestirmesi
      SocraticProblem(
        id: 'socratic_k9_p3',
        title: 'Tel Orta Noktası: 1/6\'sı Kesilince 5 cm Kayma',
        examYear: 'KPSS Klasik Kesir-Geometri Problemi',
        rawQuestion: 'Bir telin bir ucundan 1/6\'sı kesildiğinde, telin ORTA NOKTASI ilk durumuna göre 5 cm kayıyor.\nBuna göre, telin BAŞLANGIÇTAKİ boyu kaç cm\'dir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Telin Orta Noktası Kuralını Hatırlama',
            prompt: 'Bir telin bir ucundan K boyunda parça kesilirse, orta nokta kesilen parçanın ne kadarı kadar kayar?',
            mathematicalHint: 'Orta nokta daima kesilen parçanın yarısı kadar (K / 2) kayar.',
            options: [
              'Kesilen parçanın YARISI kadar (K / 2) kayar.',
              'Kesilen parça kadar (K) kayar.',
              'Kesilen parçanın iki katı kadar kayar.',
              'Kayma miktarı telin cinsine bağlıdır.',
            ],
            correctOptionIndex: 0,
            explanation: 'Doğru! Telin bir ucundan K cm kesildiğinde yeni orta nokta eski orta noktadan tam K / 2 cm uzaklaşır.',
            goldenTactic: '🎯 ALTIN FORMÜL: Kayma Miktarı = (Kesilen Parça) / 2.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Kesilen Parçayı ve Telin Boyunu Hesaplama',
            prompt: 'Kayma miktarı 5 cm olduğuna göre kesilen parça K ve telin tamamı kaç cm\'dir?',
            mathematicalHint: 'K / 2 = 5 ⟹ K = 10 cm kesilmiştir. Telin 1/6\'sı 10 cm ise tamamı 10 · 6 = 60 cm\'dir.',
            options: [
              'Kesilen = 10 cm ve Telin Boyu = 10 · 6 = 60 cm',
              'Kesilen = 5 cm ve Telin Boyu = 30 cm',
              'Telin Boyu = 120 cm',
              'Telin Boyu = 50 cm',
            ],
            correctOptionIndex: 0,
            explanation: 'Kayma = K / 2 = 5 cm ⟹ K = 10 cm kesilmiştir. Telin 1/6\'sı 10 cm olduğuna göre tamamı 10 · 6 = 60 cm\'dir.',
            goldenTactic: 'İki ucundan kesilirse farklarının yarısı kadar kayar: |K₁ - K₂| / 2.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Telin başlangıç boyu 60 cm\'dir.',
      ),

      // PROBLEM 4: Kuyruk Problemi
      SocraticProblem(
        id: 'socratic_k9_p4',
        title: 'Bilet Kuyruğu: Baştan (n + 3), Sondan (2n - 1)',
        examYear: 'KPSS Sayı Problemi Standart Tip',
        rawQuestion: 'Bir bilet kuyruğunda Ahmet baştan (n + 3). sırada, sondan ise (2n - 1). sıradadır.\nKuyrukta toplam 37 kişi olduğuna göre, Ahmet baştan KAÇINCI sıradadır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Kuyruk Kişi Sayısı Formülü',
            prompt: 'Bir kişi baştan A, sondan B sırasında ise kuyrukta toplam kişi sayısı nasıl bulunur?',
            mathematicalHint: 'Ahmet hem baştan hem sondan sayıldığı için 1 kez çıkarılır: Toplam = A + B - 1.',
            options: [
              'Toplam = Baştan + Sondan - 1 (Çünkü Ahmet iki kez sayılmıştır).',
              'Toplam = Baştan + Sondan.',
              'Toplam = Baştan + Sondan + 1.',
              'Toplam = (Baştan · Sondan) / 2.',
            ],
            correctOptionIndex: 0,
            explanation: 'Ahmet hem baştan hem sondan sayıldığı için çift sayılmış olur; bu yüzden 1 çıkarılır: Toplam = (n + 3) + (2n - 1) - 1 = 37.',
            goldenTactic: 'Kuyrukta aynı kişi iki yönden sayıldığında formül daima: Baştan + Sondan - 1 = Toplam.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: n Değerini ve Ahmet\'in Sırasını Bulma',
            prompt: '3n + 1 = 37 denkleminden n kaçtır ve Ahmet baştan kaçıncı sıradadır (n + 3)?',
            mathematicalHint: '3n = 36 ⟹ n = 12. Ahmet baştan = 12 + 3 = 15. sıradadır.',
            options: [
              'n = 12 ve Ahmet baştan 12 + 3 = 15. sıradadır.',
              'n = 12 ve Ahmet baştan 12. sıradadır.',
              'n = 11 ve Ahmet baştan 14. sıradadır.',
              'Ahmet baştan 23. sıradadır.',
            ],
            correctOptionIndex: 0,
            explanation: '3n + 1 = 37 ⟹ 3n = 36 ⟹ n = 12. Ahmet baştan (n + 3) = 12 + 3 = 15. sıradadır.',
            goldenTactic: 'n bulunduktan sonra soru Ahmet\'in sırasını sorduğu için n + 3 hesaplanır.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: Ahmet baştan 15. sıradadır.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k9_1',
        questionText: 'Parasın 1/3\'ünü harcayıp kalanın 1/2\'sini harcayan kişinin parası nasıl biter?',
        studentSteps: [
          'Adım 1: Önce 1/3, sonra 1/2 harcandı.',
          'Adım 2: 1/3 + 1/2 = 5/6 harcanmıştır.',
          'Adım 3: Geriye 1/6 parası kalır.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci 2. adımda "kalanın" ifadesini atlayıp kesirleri doğrudan toplamıştır! 1/3 harcanınca geriye 2/3 kalır. Kalanın yarısı 2/3 · 1/2 = 1/3\'tür. Toplam 1/3 + 1/3 = 2/3 harcanır, geriye 1/3 kalır.',
        correctSolution: 'Kalan = 1 - 1/3 = 2/3. Harcanan = (2/3) · (1/2) = 1/3. Geriye kalan = 2/3 - 1/3 = 1/3.',
        trapRule: '"Kalanın" denildiğinde yeni kesir bütünden değil, arta kalan miktardan hesaplanır!',
      ),
      TrapScenario(
        id: 'trap_k9_2',
        questionText: 'Bir telin bir ucundan 12 cm kesilirse orta noktası kaç cm kayar?',
        studentSteps: [
          'Adım 1: Telden 12 cm kesilmiştir.',
          'Adım 2: Orta nokta da tel kadar, yani 12 cm kayar.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci orta noktanın kesilen parça kadar kayacağını zannetmiştir. Telin bir ucundan kesilen parçanın YARISI kadar orta nokta yer değiştirir!',
        correctSolution: 'Kayma = (Kesilen Parça) / 2 = 12 / 2 = 6 cm kayar.',
        trapRule: 'Tel orta noktası daima kesilen boyun YARISI kadar kayar (K / 2).',
      ),
      TrapScenario(
        id: 'trap_k9_3',
        questionText: 'Bugün yaşları farkı 5 olan iki kardeşin 10 yıl sonra yaşları farkı kaç olur?',
        studentSteps: [
          'Adım 1: Aradan 10 yıl geçmektedir.',
          'Adım 2: Yaş farkı 5 + 10 = 15 olur.',
        ],
        wrongStepIndex: 1,
        mistakeExplanation: 'Öğrenci yıllar geçtikçe iki insanın yaş farkının açılacağını düşünmüştür. Her iki kişi de aynı anda ve aynı miktarda büyüdüğü için yaş farkı ASLA değişmez!',
        correctSolution: '10 yıl sonra da yaşları farkı 5 olarak kalır.',
        trapRule: 'İki insan arasındaki yaş farkı zamanla ASLA değişmez!',
      ),
    ],
  );
}
