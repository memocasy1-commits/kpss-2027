import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 1: Temel Kavramlar ve Sayı Basamakları İnteraktif Veri Kümesi
class Konu1TemelKavramlarData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 1,
    title: 'Temel Kavramlar ve Sayı Basamakları',
    subtitle: 'Rakamlar, Sayı Kümeleri, Teklik-Çiftlik, Pozitif-Negatiflik, Basamak Analizi ve Faktöriyel',
    icon: Icons.functions_rounded,
    themeColor: Color(0xFF4F46E5), // Indigo Math
    osymWeight: '3 - 4 Soru (Sınavın 1. - 4. Soruları)',
    keyOutcomes: [
      'Rakam {0..9} ile Sayı kümesi ayrımını ve 0\'ın işaretsiz nötr tam sayı olduğunu refleks haline getirmek',
      'Teklik-çiftlikte "Çift ile çarpılan terimin daima çift sonuç vermesi" kuralıyla bilinmeyeni elemek',
      'Pozitif-negatiflikte "Çift kuvvet daima pozitiftir" ilkesiyle domino taşı gibi işaretleri çözmek',
      'İki basamaklı çözümlemede AB - BA = 9(A - B) ve AB + BA = 11(A + B) formüllerini 5 saniyede uygulamak',
      'Ardışık sayılarda toplamı terim adedine bölerek doğrudan ortanca terimi bulmak',
    ],
    socraticProblems: [
      // PROBLEM 1: Rakam ve Katsayı Analizi
      SocraticProblem(
        id: 'socratic_k1_p1',
        title: 'Katsayı Optimizasyonu ve En Büyük Değer',
        examYear: 'KPSS Lisans / Ön Lisans Çıkmış Tarzı',
        rawQuestion: 'a, b ve c birbirinden farklı rakamlardır.\n3a + 5b - 2c\nifadesinin alabileceği EN BÜYÜK değer kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Küme ve Kural Tespiti',
            prompt: 'Soru kökündeki "rakam" ve "birbirinden farklı" ifadelerine göre kullanabileceğimiz elemanlar kümesi nedir?',
            mathematicalHint: 'Rakamlar onluk sistemde 0\'dan 9\'a kadardır: {0, 1, 2, ..., 9}.',
            options: [
              '{1, 2, 3, 4, 5, 6, 7, 8, 9}',
              '{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}',
              '{..., -2, -1, 0, 1, 2, ...}',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! Rakamlar kümesi 0\'ı da kapsar: {0, 1, 2, ..., 9}. 0 bir rakamdır!',
            goldenTactic: '🎯 0\'ı unutmak ÖSYM\'nin en sık düşürdüğü tuzaktır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Katsayı Stratejisi',
            prompt: 'İfadenin sonucunun EN BÜYÜK olması için katsayıları +5, +3 ve -2 olan a, b, c rakamlarını nasıl dağıtmalıyız?',
            mathematicalHint: 'Pozitif katsayısı en büyük olana en büyük rakamı, negatif katsayılı olana en küçük rakamı verin.',
            options: [
              'En büyük rakamı (9) c\'ye vermeliyiz çünkü -2 küçültür.',
              'En büyük pozitif katsayı (+5) b\'de olduğundan b=9, sonra a=8, negatif olan c\'ye ise en küçük rakam (0) verilmelidir.',
              'Tüm harflere 9 vermeliyiz: a=9, b=9, c=9.',
            ],
            correctOptionIndex: 1,
            explanation: 'Mükemmel mantık! +5b terimi değeri en çok büyütecek olandır, bu yüzden b = 9. Ardından +3a için a = 8. Çıkarılan -2c teriminin değeri küçültmemesi için c = 0 seçilir.',
            goldenTactic: '🎯 Katsayısı büyük olan pozitif terime en büyük rakamı verin.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Sonucu Hesaplama',
            prompt: 'b = 9, a = 8 ve c = 0 değerlerini yerine koyarsak 3a + 5b - 2c sonucu kaç çıkar?',
            mathematicalHint: '3·(8) + 5·(9) - 2·(0) işlemini yapın.',
            options: [
              '24 + 45 - 0 = 69',
              '27 + 40 - 2 = 65',
              '24 + 45 - 2 = 67',
            ],
            correctOptionIndex: 0,
            explanation: 'Tebrikler! 3·(8) + 5·(9) - 2·(0) = 24 + 45 - 0 = 69 bulunur.',
            goldenTactic: '🎯 c = 0 seçildiğinde -2c terimi tamamen sıfırlanır ve sonuç maksimum 69 olur.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 69. b=9, a=8, c=0 seçildi.',
      ),

      // PROBLEM 2: Teklik - Çiftlik ve Bölme Tuzağı
      SocraticProblem(
        id: 'socratic_k1_p2',
        title: 'Teklik - Çiftlik Analizi ve Payda Tuzağı',
        examYear: 'KPSS Lisans / EKPSS Standardı',
        rawQuestion: 'a, b ve c pozitif tam sayılardır.\n(3ab + 5) / 2 = c\nolduğuna göre, aşağıdakilerden hangisi KESİNLİKLE doğrudur?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Paydadan Kurtulma',
            prompt: 'Kesirli ifadelerde teklik-çiftlik yorumu yapabilmek için ilk hamle ne olmalıdır?',
            mathematicalHint: 'İçler dışlar çarpımı yaparak paydayı karşı tarafa çarpım olarak atın.',
            options: [
              '3ab + 5 ifadesini 2\'ye bölmeye çalışmalıyız.',
              'İçler dışlar çarpımı yaparak 3ab + 5 = 2c eşitliğini elde etmeliyiz.',
              'c yerine doğrudan 1 yazmalıyız.',
            ],
            correctOptionIndex: 1,
            explanation: 'Kesinlikle doğru! İçler-dışlar çarpımı yaptığımızda 3ab + 5 = 2c denklemi karşımıza çıkar.',
            goldenTactic: '🎯 Kesirli teklik-çiftlik sorularında İLK İŞ İÇLER-DIŞLAR ÇARPIMI yapmaktır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Çift Katsayılı Terimi İnceleme',
            prompt: '2c terimi hakkında ne söyleyebiliriz?',
            mathematicalHint: 'c pozitif tam sayı olduğundan, 2 ile çarpılan herhangi bir tam sayı kesinlikle çifttir.',
            options: [
              'c tek ise 2c tektir.',
              'c ne olursa olsun (tek veya çift), 2c KESİNLİKLE ÇİFTTİR. Ancak c\'nin kendisi hakkında bir şey bilinemez!',
              '2c negatiftir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika tespit! 2c ifadesi daima ÇİFTTİR. c tek de olsa çift de olsa 2 ile çarpılınca çift olur. Dolayısıyla c\'nin teklik-çiftliği BİLİNEMEZ.',
            goldenTactic: '🎯 Çift katsayılı bilinmeyenin (2c, 4x) kendisi hakkında YORUM YAPILAMAZ.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Eşitliğin Sol Tarafını Çözme',
            prompt: '3ab + 5 = ÇİFT olduğuna göre, 5 tek sayı olduğuna göre 3ab ve dolayısıyla a ile b hakkında kesin hüküm nedir?',
            mathematicalHint: 'TEK + TEK = ÇİFT kuralını hatırlayın: 3ab + TEK = ÇİFT ⇒ 3ab TEK olmalıdır.',
            options: [
              'a çift, b tektir.',
              'a ve b sayılarının HER İKİSİ DE TEKTİR.',
              'a + b kesinlikle tektir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Bravo! 3ab tek olmalıdır. Çarpımın tek olması için içindeki tüm çarpanlar tek olmalıdır. 3 tektir, o halde hem a hem de b KESİNLİKLE TEKTİR!',
            goldenTactic: '🎯 İki sayının çarpımı tek ise ikisi de TEK olmak zorundadır (T · T = T).',
          ),
        ],
        finalAnswerSummary: 'Kesin Hüküm: "a ve b tektir." (c hakkında kesinlik yoktur).',
      ),

      // PROBLEM 3: Pozitif - Negatiflik ve Çift Kuvvet Kuralı
      SocraticProblem(
        id: 'socratic_k1_p3',
        title: 'İşaret İncelemesi ve Çift Kuvvet İlkesi',
        examYear: 'KPSS Genel Yetenek Klasik Soru',
        rawQuestion: 'a, b ve c sıfırdan farklı gerçel sayılardır.\na² · b < 0\nb · c³ > 0\na · c < 0\nolduğuna göre; a, b ve c\'nin işaretleri sırasıyla nedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Çift Kuvveti Çiz ve Yok Say',
            prompt: 'a² · b < 0 eşitsizliğinde nereden başlamalıyız?',
            mathematicalHint: 'Sıfırdan farklı her sayının çift kuvveti (a²) daima POZİTİFTİR (+).',
            options: [
              'a\'ya değer vererek denemeliyiz.',
              'a² daima pozitif (+) olduğundan, çarpımın negatif (< 0) olması için b KESİNLİKLE NEGATİF (-) olmalıdır.',
              'a negatif olmalıdır.',
            ],
            correctOptionIndex: 1,
            explanation: 'Tam isabet! a² kesinlikle (+)\'dır. (+) ile neyi çarparsan negatif (< 0) olur? (-)\'yi! Yani b < 0 (b negatiftir).',
            goldenTactic: '🎯 Çözüme daima ÇİFT KUVVETİN bulunduğu eşitsizlikten başlayın ve çift kuvveti tamamen silin!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: İkinci Eşitsizlikten c\'yi Bulma',
            prompt: 'b < 0 (negatif) olduğunu bulduk. b · c³ > 0 olduğuna göre c³ ve dolayısıyla c\'nin işareti nedir?',
            mathematicalHint: '(-) · (-) = (+). Çarpımın pozitif (> 0) olması için diğer terim de negatif olmalıdır.',
            options: [
              'c pozitif (+)\'dır.',
              'c negatif (-)\'dir.',
              'c sıfırdır.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! b negatif olduğundan b · c³ > 0 olması için c³ de negatif olmalıdır. Tek kuvvet işareti korur, dolayısıyla c < 0 (c negatiftir).',
            goldenTactic: '🎯 Tek kuvvetler işaret değiştirmeden aynen kalır (c³ negatifse c de negatiftir).',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: a\'nın İşaretini Bulma',
            prompt: 'c < 0 (negatif) olduğunu biliyoruz. a · c < 0 olduğuna göre a\'nın işareti nedir?',
            mathematicalHint: 'a · (-) < 0 olması için a ne olmalıdır?',
            options: [
              'a pozitif (+)\'dır.',
              'a negatif (-)\'dir.',
              'a işaretsizdir.',
            ],
            correctOptionIndex: 0,
            explanation: 'Tebrikler! a · (-) < 0 olduğuna göre a pozitif (+) olmalıdır. Böylece sıralama: a = (+), b = (-), c = (-) olur!',
            goldenTactic: '🎯 Domino taşı gibi sırayla çözüldü: b(-) → c(-) → a(+). Cevap: (+, -, -).',
          ),
        ],
        finalAnswerSummary: 'Sırasıyla İşaretler: (+, -, -)',
      ),

      // PROBLEM 4: İki Basamaklı Sayılarda Fark Sihirbazı
      SocraticProblem(
        id: 'socratic_k1_p4',
        title: 'Sayı Basamakları: AB - BA Sihirbazı',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: 'AB ve BA iki basamaklı doğal sayılardır.\nAB - BA = 54\nolduğuna göre, bu koşulu sağlayan KAÇ FARKLI AB sayısı yazılabilir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Basamak Açılımı ve 9 Parantezi',
            prompt: 'AB = 10A + B ve BA = 10B + A olduğuna göre AB - BA farkı en sade nasıl yazılır?',
            mathematicalHint: '(10A + B) - (10B + A) = 9A - 9B = 9(A - B).',
            options: [
              '10(A - B)',
              '9(A - B)',
              '11(A + B)',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! AB - BA daima 9(A - B) formülüne eşittir. Bu KPSS\'nin en popüler özdeşliğidir.',
            goldenTactic: '🎯 Altın Kural: AB - BA = 9(A - B) ve AB + BA = 11(A + B).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: A - B Farkını Bulma',
            prompt: '9(A - B) = 54 ise A - B farkı kaçtır?',
            mathematicalHint: '54\'ü 9\'a bölün.',
            options: [
              'A - B = 4',
              'A - B = 6',
              'A - B = 7',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! 54 / 9 = 6, yani A - B = 6 olmalıdır.',
            goldenTactic: '🎯 A ve B birer rakamdır ve iki basamaklı olduklarından BA için B ≠ 0 olmalıdır!',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Rakam Çiftlerini Sayma (ÖSYM Tuzağı)',
            prompt: 'A - B = 6 şartını sağlayan ve BA iki basamaklı olduğu için B ≠ 0 şartına uyan (A, B) çiftleri hangileridir?',
            mathematicalHint: 'B = 1, 2, 3 olabilir. B = 0 olursa BA iki basamaklı olamaz!',
            options: [
              '(6, 0), (7, 1), (8, 2), (9, 3) → 4 tane',
              '(7, 1), (8, 2), (9, 3) → 3 tane (Çünkü BA için B sıfır olamaz!)',
              '(9, 3) → 1 tane',
            ],
            correctOptionIndex: 1,
            explanation: 'ÖSYM tuzağını atladınız! B = 0 seçilirse BA sayısı 06 olur ve iki basamaklı sayı kuralı bozulur. Dolayısıyla sadece (7,1), (8,2), (9,3) olmak üzere 3 farklı AB sayısı (71, 82, 93) yazılabilir.',
            goldenTactic: '🎯 TUZAK: Soru kökündeki "BA iki basamaklıdır" şartı B\'nin 0 olamayacağını söyler!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 3 tane (71, 82, 93). B=0 tuzağına düşülmedi!',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k1_1',
        questionText: 'a ve b birbirinden farklı doğal sayılardır. 3a + 4b = 48 olduğuna göre a\'nın alabileceği en büyük değer kaçtır?',
        studentSteps: [
          '1. Adım: a\'nın en büyük olması için b\'ye en küçük değer verilmelidir.',
          '2. Adım: Doğal sayılar dediği için b\'ye en küçük pozitif sayı olan 1 verilir: 3a + 4(1) = 48 ⇒ 3a = 44 (bölünmez).',
          '3. Adım: b = 2 denenir: 3a + 4(2) = 48 ⇒ 3a = 40 (bölünmez).',
          '4. Adım: b = 3 denenir: 3a + 12 = 48 ⇒ 3a = 36 ⇒ a = 12 bulunur.',
        ],
        wrongStepIndex: 1, // 2. Adımda hata yapıldı (0 verilmedi)
        mistakeExplanation: 'Öğrenci 2. adımda "Doğal Sayılar" kümesinin 0 ile başladığını unuttu! En küçük doğal sayı 0\'dır. b = 0 seçilirse 3a + 4(0) = 48 ⇒ 3a = 48 ⇒ a = 16 bulunur!',
        correctSolution: 'b = 0 seçilirse: 3a + 0 = 48 ⇒ a = 16 bulunur. Cevap 12 değil 16\'dır.',
        trapRule: 'Doğal Sayılar kümesi N = {0, 1, 2, ...} olup EN KÜÇÜK ELEMANI 0\'dır. "Pozitif doğal sayı" demedikçe 0\'ı mutlaka deneyin!',
      ),
      TrapScenario(
        id: 'trap_k1_2',
        questionText: 'x bir tam sayı olmak üzere 4x + 3 ifadesi tek sayıdır. Buna göre hangisi kesinlikle çifttir?',
        studentSteps: [
          '1. Adım: 4x + 3 tek sayıdır.',
          '2. Adım: 3 tek olduğuna göre 4x çift olmalıdır (Çift + Tek = Tek).',
          '3. Adım: 4x çift olduğuna göre x sayısı da kesinlikle çift olmak zorundadır.',
          '4. Adım: x çift olduğu için x² + 2 de çifttir.',
        ],
        wrongStepIndex: 2, // 3. Adım hatalı
        mistakeExplanation: '3. Adımda vahim bir hata var: 4x çift olduğu için x\'in çift olması GEREKMEZ! 4 zaten çift bir katsayıdır, x tek bir tam sayı da olsa (örn: x=1, x=3) 4x DAİMA çifttir. x hakkında teklik-çiftlik bilinemez!',
        correctSolution: '4x daima çifttir, x tek de olabilir çift de. Bu yüzden içinde x çarpanı serbest olan hiçbir şık kesin değildir. Ancak 2x, 4x gibi çift katsayılı terimler kesinlikle çifttir.',
        trapRule: 'Çift katsayı ile çarpılan terimin (2x, 4x, 6x) içi (x\'in kendisi) bilinemez; gizli kutudur!',
      ),
      TrapScenario(
        id: 'trap_k1_3',
        questionText: 'Ardışık 3 tek tam sayının toplamı 81 olduğuna göre en büyük sayı kaçtır?',
        studentSteps: [
          '1. Adım: Sayılara x, x+1 ve x+2 diyelim.',
          '2. Adım: Toplam = 3x + 3 = 81.',
          '3. Adım: 3x = 78 ⇒ x = 26.',
          '4. Adım: En büyük sayı x + 2 = 28\'dir.',
        ],
        wrongStepIndex: 0, // 1. Adım hatalı
        mistakeExplanation: '1. Adımda ardışık TEK sayılar 1\'er 1\'er değil, 2\'şer 2\'şer artar! (x, x+2, x+4 olmalıydı). Ayrıca KPSS Pratik Taktik ile 81 / 3 = 27 (Ortanca Sayı) bulunur. Sayılar: 25, 27, 29 olup en büyük sayı 29\'dur!',
        correctSolution: 'Pratik Taktik: 81 / 3 = 27 (ortanca). Sayılar tek olduğundan 25, 27, 29\'dur. En büyük sayı 29.',
        trapRule: 'Ardışık tek ve ardışık çift sayılar daima 2\'şer 2\'şer artar: x, x+2, x+4...',
      ),
    ],
  );
}
