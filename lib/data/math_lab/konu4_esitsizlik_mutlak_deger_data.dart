import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 4: Basit Eşitsizlikler ve Mutlak Değer İnteraktif Veri Kümesi
class Konu4EsitsizlikMutlakDegerData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 4,
    title: 'Basit Eşitsizlikler ve Mutlak Değer',
    subtitle: 'Yön Değiştirme, Kare Alma Sıfır Tuzağı, a² < a Kuralı ve Sayı Doğrusu Mesafe Modeli',
    icon: Icons.compare_arrows_rounded,
    themeColor: Color(0xFFF59E0B), // Amber / Gold Math
    osymWeight: '3 - 4 Soru (Sınavın 11. - 14. Soruları)',
    keyOutcomes: [
      'Negatif sayıyla çarpma veya bölmede eşitsizliğin kesinlikle yön değiştirdiğini refleks yapmak',
      'Sıfır içeren aralıklarda çift kuvvet alırken alt sınırın daima 0 (0 ≤ x²) olduğunu unutmamak',
      'a² < a ifadesini gördüğü an tereddütsüz 0 < a < 1 pozitif basit kesir aralığını yazmak',
      'Soru kökündeki "gerçel sayı" (aralık genişletme) ile "tam sayı" (değer seçme) ayrımını hatasız yapmak',
      '|x - a| + |x - b| toplamının en küçük değerinin iki kritik nokta arasındaki sabit mesafe |a - b| olduğunu bilmek',
    ],
    socraticProblems: [
      // PROBLEM 1: Aralıkta Kare Alma ve Sıfır Tuzağı
      SocraticProblem(
        id: 'socratic_k4_p1',
        title: 'Kuvvet Alma: -3 < x < 5 için x² Aralığı',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: 'x bir gerçel sayı olmak üzere,\n-3 < x < 5\nolduğuna göre, x² ifadesinin alabileceği EN GENİŞ DEĞER ARALIĞI nedir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Aralıkta Sıfırın Varlığını İnceleme',
            prompt: 'x aralığı (-3 ile 5 arası) negatif bir sayıdan pozitif bir sayıya geçmektedir. Bu aralıkta 0 (sıfır) sayısı var mıdır?',
            mathematicalHint: '-3 < 0 < 5 olduğuna göre 0 bu aralığın içindedir.',
            options: [
              'Hayır, sadece pozitif sayılar vardır.',
              'Evet, 0 bu aralıktadır. Bir gerçel sayının karesi en az 0 olabilir (x² ≥ 0)!',
              '0 çift kuvveti etkilemez.',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! 0 aralıktadır. Bir gerçel sayının karesi asla negatif olamaz ve en küçük değerini 0\'da (x=0 için x²=0) alır.',
            goldenTactic: '🎯 ALTIN KURAL: Aralık negatif ile pozitif arasındaysa karesinin alt sınırı DAİMA 0\'dır ve dahildir (0 ≤ x²).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Uç Noktaların Karelerini Karşılaştırma',
            prompt: 'Uç noktalar olan -3 ve 5\'in kareleri nedir ve üst sınır hangisi olmalıdır?',
            mathematicalHint: '(-3)² = 9 ve 5² = 25. En büyük kare üst sınırdır.',
            options: [
              'Üst sınır 9\'dur.',
              '(-3)² = 9 ve 5² = 25 olduğundan, üst sınır büyük olan karedir: max(9, 25) = 25.',
              'Üst sınır 5\'tir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! (-3)² = 9 iken 5² = 25\'tir. Üst sınır 25 olmalıdır. 5 dahil olmadığı için 25 de dahil değildir (< 25).',
            goldenTactic: '🎯 Üst sınır, uç noktaların karelerinden büyük olanıdır: max(9, 25) = 25.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: En Geniş Aralığı Yazma',
            prompt: 'Alt sınır 0 (dahil) ve üst sınır 25 (açık) olduğuna göre en geniş değer aralığı hangisidir?',
            mathematicalHint: '0 ≤ x² < 25 yani [0, 25).',
            options: [
              '9 < x² < 25 (Hata: (-3)² alt sınır değildir!)',
              '0 ≤ x² < 25 yani [0, 25)',
              '0 < x² < 25',
            ],
            correctOptionIndex: 1,
            explanation: 'Tebrikler! Doğru aralık [0, 25)\'dir. En sık düşülen tuzak alt sınıra 9 yazmaktır; 0\'ı atlamadınız!',
            goldenTactic: '🎯 TUZAK DEŞİFRESİ: -3 < x < 5 iken 9 < x² < 25 demek ÖSYM\'nin en klasik çeldiricisidir!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: [0, 25) yarı açık aralığı (0 ≤ x² < 25).',
      ),

      // PROBLEM 2: a² < a ÖSYM Şifre Kuralı
      SocraticProblem(
        id: 'socratic_k4_p2',
        title: 'ÖSYM Şifresi: a² < a ve İşaret Analizi',
        examYear: 'KPSS Genel Yetenek / Lisans Klasik Soru',
        rawQuestion: 'a ve b birer gerçel sayıdır.\na² < a\na · b > b\nolduğuna göre, b sayısı için aşağıdakilerden hangisi DAİMA doğrudur?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: a² < a Şifresini Çözme',
            prompt: 'Bir sayının karesi kendisinden küçükse (a² < a) bu sayı hangi sayı kümesine aittir?',
            mathematicalHint: 'Örneğin (1/2)² = 1/4 < 1/2. Pozitif basit kesirlerin kareleri kendilerinden küçüktür.',
            options: [
              'a < 0 (Negatif sayılardır)',
              '0 < a < 1 (0 ile 1 arasındaki pozitif basit kesirlerdir)',
              'a > 1',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! Karesi kendisinden küçük olan sayılar YALNIZCA 0 ile 1 arasındaki sayılardır: 0 < a < 1. Bu ÖSYM\'nin her yıl sorduğu şifredir.',
            goldenTactic: '🎯 EZBERLE: a² < a gördüğünüz an tereddütsüz "0 < a < 1" yazın!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: İkinci Eşitsizliği Çarpanlara Ayırma',
            prompt: 'a · b > b eşitsizliğinde sağdaki b\'yi sola atıp paranteze alırsak ne elde ederiz?',
            mathematicalHint: 'a · b - b > 0 ⇒ b(a - 1) > 0.',
            options: [
              'a > 1 (b\'ye bölmek hatadır çünkü b\'nin işaretini bilmiyoruz!)',
              'b · (a - 1) > 0',
              'b > 0',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika dikkat! b\'nin işaretini bilmeden her tarafı b\'ye bölemezsiniz (eşitsizlik yön değiştirebilir). Doğru hamle sola atıp b(a - 1) > 0 yazmaktır.',
            goldenTactic: '🎯 TUZAK: İşaretini bilmediğiniz bir bilinmeyene eşitsizliği ASLA BÖLMEYİN; sola atıp paranteze alın!',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: (a - 1) İşaretinden b\'yi Bulma',
            prompt: '0 < a < 1 olduğuna göre (a - 1) ifadesinin işareti nedir ve dolayısıyla b(a - 1) > 0 olması için b ne olmalıdır?',
            mathematicalHint: 'a sayısı 1\'den küçük olduğundan (a - 1) < 0 (negatiftir). (-) ile neyin çarpımı > 0 (pozitif) olur?',
            options: [
              '(a - 1) pozitiftir, b > 0 olmalıdır.',
              '(a - 1) kesinlikle negatiftir (-). Çarpımın pozitif (> 0) olması için b de NEGATİF OLMALIDIR (b < 0).',
              'b hakkında yorum yapılamaz.',
            ],
            correctOptionIndex: 1,
            explanation: 'Bravo! a < 1 olduğundan a - 1 negatiftir (-). (-) · (-) = (+) olduğundan b de negatif olmak zorundadır: b < 0!',
            goldenTactic: '🎯 Sonuç: b < 0 (b negatif bir gerçel sayıdır).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: b < 0 (b negatif sayıdır).',
      ),

      // PROBLEM 3: "Gerçel Sayı" vs. "Tam Sayı" Tuzağı
      SocraticProblem(
        id: 'socratic_k4_p3',
        title: 'Gerçel Sayılarda Aralık Genişletme (2x - 3y)',
        examYear: 'KPSS Lisans Standart Soru Tipi',
        rawQuestion: 'x ve y GERÇEL SAYILAR olmak üzere,\n-2 < x ≤ 5\n-4 ≤ y < 3\nolduğuna göre, 2x - 3y ifadesinin alabileceği EN BÜYÜK tam sayı değeri kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Gerçel Sayı Kuralı (Değer Seçilmez!)',
            prompt: 'Soru kökünde x ve y için "gerçel sayı" dendiğinde nasıl ilerlenmelidir?',
            mathematicalHint: '"Tam sayı" deseydi x=5, y=-4 seçerdik; "gerçel sayı" dendiğinde aralıklar genişletilip toplanır!',
            options: [
              'x = 5 ve y = -4 seçip yerine koymalıyız.',
              'Değer seçilemez! 2x ve -3y aralıkları oluşturulup TARAF TARAFA TOPLANMALIDIR.',
              'Eşitsizlikler birbirinden çıkarılmalıdır.',
            ],
            correctOptionIndex: 1,
            explanation: 'Kesinlikle doğru! Gerçel sayı denildiğinde asla değer seçilmez; eşitsizlikler genişletilip taraf tarafa toplanır. Eşitsizlikler çıkarılamaz!',
            goldenTactic: '🎯 SÖZLÜK: "Tam sayı" = Değer seç. "Gerçel sayı" = Aralık genişlet ve topla!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: 2x ve -3y Aralıklarını Bulma',
            prompt: '-2 < x ≤ 5 ifadesini 2 ile; -4 ≤ y < 3 ifadesini ise -3 ile çarparsak ne olur?',
            mathematicalHint: '-3 ile çarpınca eşitsizlik YÖN DEĞİŞTİRİR: (-3)·3 < -3y ≤ (-3)·(-4) ⇒ -9 < -3y ≤ 12.',
            options: [
              '2x: -4 < 2x ≤ 10  ve  -3y: 12 ≤ -3y < -9',
              '2x: -4 < 2x ≤ 10  ve  -3y: -9 < -3y ≤ 12 (Yön değişti!)',
              '-3y: -12 ≤ -3y < 9',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! -3 ile çarptığımızda yön değişir ve küçükten büyüğe yazılır: -9 < -3y ≤ 12.',
            goldenTactic: '🎯 Negatif sayıyla çarpınca yön değiştirmeyi ve sayıları küçükten büyüğe hizalamayı unutmayın.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Taraf Tarafa Toplama ve En Büyük Değer',
            prompt: '-4 < 2x ≤ 10 ve -9 < -3y ≤ 12 aralıklarını taraf tarafa toplarsak 2x - 3y aralığı ve alabileceği en büyük tam sayı değeri ne olur?',
            mathematicalHint: '(-4) + (-9) < 2x - 3y ≤ (10 + 12) ⇒ -13 < 2x - 3y ≤ 22.',
            options: [
              '-13 < 2x - 3y ≤ 22 ⇒ En büyük tam sayı = 22',
              '-13 ≤ 2x - 3y < 22 ⇒ En büyük tam sayı = 21',
              '-13 < 2x - 3y < 20 ⇒ En büyük tam sayı = 19',
            ],
            correctOptionIndex: 0,
            explanation: 'Tebrikler! -4 + (-9) = -13 < 2x - 3y ≤ 22 (Her iki uçta da eşitlik olduğu için sağ uç ≤ 22 olur). En büyük tam sayı değeri 22\'dir!',
            goldenTactic: '🎯 Her iki uçta da eşitlik (≤) varsa toplamda da ≤ kalır: 10 + 12 = 22.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 22. Aralık: -13 < 2x - 3y ≤ 22.',
      ),

      // PROBLEM 4: Mutlak Değerde Mesafe ve En Küçük Değer
      SocraticProblem(
        id: 'socratic_k4_p4',
        title: 'Mutlak Değer: Sayı Doğrusu Mesafe ve En Küçük Değer',
        examYear: 'KPSS Genel Yetenek / Ön Lisans Soru Tipi',
        rawQuestion: '|x - 3| + |x + 5|\nifadesinin alabileceği EN KÜÇÜK DEĞER kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Kritik Noktaları Tespit Etme',
            prompt: 'Mutlak değerlerin içini sıfır yapan kritik noktalar (kökler) nelerdir?',
            mathematicalHint: 'x - 3 = 0 ⇒ x = 3 ve x + 5 = 0 ⇒ x = -5.',
            options: [
              'x = -3 ve x = 5',
              'x = 3 ve x = -5',
              'x = 0',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! Kritik noktalar x = 3 ve x = -5\'tir.',
            goldenTactic: '🎯 Mutlak değerin en küçük değer sorularında kritik noktalar doğrudan denenir.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Geometrik Mesafe Mantığı',
            prompt: '|x - 3| + |x - (-5)| ifadesi geometrik olarak neyi ifade eder?',
            mathematicalHint: 'Bir x noktasının 3 ve -5 noktalarına olan uzaklıkları toplamıdır.',
            options: [
              'x noktasının sıfıra olan uzaklığıdır.',
              'Sayı doğrusunda bir x noktasının 3 ve -5 sayılarına olan uzaklıkları toplamıdır.',
              'x ile 3\'ün çarpımıdır.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika bakış açısı! x noktası 3 ile -5 arasında seçildiğinde bu iki noktaya olan uzaklıklar toplamı SABİTTİR ve bu iki nokta arasındaki mesafeye eşittir.',
            goldenTactic: '🎯 ALTIN KURAL: |x - a| + |x - b| toplamının en küçük değeri |a - b| mesafesidir!',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: En Küçük Değeri Hesaplama',
            prompt: 'Kritik noktalardan birini (örn: x = 3) yerine koyarak veya |3 - (-5)| mesafesini alarak en küçük değeri bulunuz.',
            mathematicalHint: 'x = 3 için: |3 - 3| + |3 + 5| = 0 + 8 = 8.',
            options: [
              'En küçük değer = 0',
              'En küçük değer = 8',
              'En küçük değer = 2',
            ],
            correctOptionIndex: 1,
            explanation: 'Mükemmel! |3 - (-5)| = |8| = 8 bulunur. x hangi aralıkta olursa olsun toplam asla 8\'den küçük olamaz!',
            goldenTactic: '🎯 |x - 3| + |x + 5| ifadesinin minimum değeri 8\'dir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 8. Mesafe: |3 - (-5)| = 8.',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k4_1',
        questionText: '-4 < x < 3 olduğuna göre x²\'nin alabileceği en geniş değer aralığı nedir?',
        studentSteps: [
          '1. Adım: Uç noktaların kareleri alınır.',
          '2. Adım: (-4)² = 16 ve 3² = 9.',
          '3. Adım: Küçük olan 9 alt sınır, büyük olan 16 üst sınır yapılır: 9 < x² < 16 bulunur.',
        ],
        wrongStepIndex: 2, // 3. Adım hatalı (0 unutuldu)
        mistakeExplanation: '3. Adımda vahim bir ÖSYM tuzağına düşüldü! -4 ile 3 arasında 0 vardır ve x = 0 için x² = 0\'dır. 0 sayısı 9\'dan çok daha küçüktür! Alt sınır kesinlikle 0 ≤ x² olmalıdır: [0, 16) aralığıdır!',
        correctSolution: '0 aralıkta olduğundan minimum değer 0\'dır: 0 ≤ x² < 16 yani [0, 16).',
        trapRule: 'Negatif ve pozitif sayılar arasındaki bir aralığın karesi alınırken alt sınır DAİMA 0\'dır (0 ≤ x²)!',
      ),
      TrapScenario(
        id: 'trap_k4_2',
        questionText: 'x bir tam sayı değil, GERÇEL SAYIDIR. -1 < x < 4 ve -3 < y < 2 olduğuna göre 3x - 2y\'nin en büyük tam sayı değeri kaçtır?',
        studentSteps: [
          '1. Adım: 3x - 2y\'nin en büyük olması için x en büyük, y en küçük seçilmelidir.',
          '2. Adım: x < 4 olduğundan x = 3 seçilir.',
          '3. Adım: y > -3 olduğundan y = -2 seçilir.',
          '4. Adım: 3(3) - 2(-2) = 9 + 4 = 13 bulunur.',
        ],
        wrongStepIndex: 1, // 2. Adım hatalı (Değer seçilemez!)
        mistakeExplanation: '2. Adımda öğrenci soru kökündeki "GERÇEL SAYI" şartını göz ardı etti ve tam sayı gibi x=3, y=-2 değerlerini seçti! Gerçel sayılarda x = 3,999... olabilir! Doğru çözüm aralıkları genişletmektir: -3 < 3x < 12 ve -4 < -2y < 6 ⇒ Taraf tarafa toplanır: -7 < 3x - 2y < 18 ⇒ En büyük tam sayı 17\'dir!',
        correctSolution: 'Aralıklar genişletilir: -3 < 3x < 12 ve -4 < -2y < 6 ⇒ -7 < 3x - 2y < 18. En büyük tam sayı 17.',
        trapRule: 'Gerçel sayı sorularında değer seçilmez, aralık genişletilip toplanır! 13 cevabı tuzağa düşen öğrencinin cevabıdır.',
      ),
      TrapScenario(
        id: 'trap_k4_3',
        questionText: '-2x < 10 eşitsizliğinin çözüm kümesi nedir?',
        studentSteps: [
          '1. Adım: x\'i yalnız bırakmak için her iki taraf -2\'ye bölünür.',
          '2. Adım: 10 / (-2) = -5.',
          '3. Adım: Eşitsizlik aynen korunur: x < -5 bulunur.',
        ],
        wrongStepIndex: 2, // 3. Adım hatalı (Yön değişmedi!)
        mistakeExplanation: '3. Adımda eşitsizlik yön değiştirilmedi! Eşitsizliğin her iki tarafı NEGATİF bir sayıya bölündüğünde (<) işareti (>) işaretine DÖNÜŞMEK ZORUNDADIR! Doğru çözüm: x > -5 olmalıdır.',
        correctSolution: 'Her taraf -2\'ye bölündüğünde yön değişir: x > -5.',
        trapRule: 'Negatif sayıyla çarpma veya bölmede eşitsizlik kesinlikle yön değiştirir: (<) → (>).',
      ),
    ],
  );
}
