// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu4 = LectureTopic(
  id: 'matematik_konu_4',
  courseId: 'matematik',
  order: 4,
  title: 'Basit Eşitsizlikler ve Mutlak Değer',
  subtitle: 'Aralık Kavramı, Eşitsizlik Özellikleri, Yön Değiştirme, Mutlak Değerin Tanımı ve Denklemleri',
  icon: Icons.compare_arrows,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 31 - 40',
  startTestNum: 31,
  endTestNum: 40,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Basit Eşitsizliklerin Temel Özellikleri',
      type: LectureSectionType.overview,
      leadText: '<, ≤, >, ≥ sembolleriyle kurulan ifadelere eşitsizlik denir (matematik1.pdf s. 53-56):',
      bulletPoints: [
        '▸ 1. Ekleme ve Çıkarma: Eşitsizliğin her iki tarafına aynı sayı eklenebilir veya çıkarılabilir; eşitsizlik YÖN DEĞİŞTİRMEZ:\n• a < b ise a + c < b + c ve a - c < b - c.',
        '▸ 2. Pozitif Sayıyla Çarpma ve Bölme: Eşitsizliğin her iki tarafı pozitif bir sayıyla çarpılır veya bölünürse YÖN DEĞİŞTİRMEZ:\n• c > 0 ve a < b ise a · c < b · c ve a/c < b/c.',
        '▸ 3. NEGATİF SAYIYLA ÇARPMA VEYA BÖLME (EN KRİTİK KURAL):\n• Eşitsizliğin her iki tarafı negatif bir sayıyla çarpılır veya bölünürse EŞİTSİZLİK YÖN DEĞİŞTİRİR!\n• c < 0 ve a < b ise a · c > b · c ve a/c > b/c.\n• Örnek: -2x < 6 → x > -3.',
        '▸ 4. Taraf Tarafa Toplama: Aynı yönlü eşitsizlikler taraf tarafa toplanabilir:\n• a < b ve c < d ise a + c < b + d.\n• ⚠️ DİKKAT: Eşitsizlikler taraf tarafa ASLA ÇIKARILAMAZ veya BÖLÜNEMEZ! Çıkarma yapmak için ikinci eşitsizlik (-) ile çarpılıp toplanır.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
x bir gerçel sayı olmak üzere,
-3 < x < 5
olduğuna göre, x² ifadesinin alabileceği en geniş değer aralığı nedir?

💡 ÇÖZÜM:
1. x aralığı negatif bir sayı (-3) ile pozitif bir sayı (5) arasındadır. Yani bu aralıkta 0 mevcuttur.
2. Bir gerçel sayının karesi EN AZ 0 olabilir: x² ≥ 0.
3. Uç noktaların kareleri hesaplanır: (-3)² = 9 ve 5² = 25.
4. Üst sınır bu karelerin en büyüğüdür: max(9, 25) = 25.
5. Dolayısıyla değer aralığı: 0 ≤ x² < 25 yani [0, 25) yarı açık aralığıdır.

🎯 PRATİK İPUCU: Aralık 0 içeriyorsa karesinin alt sınırı DAİMA 0'dır ve dahildir [0,...). Uç noktaların karelerinden büyük olanı da üst sınırdır.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
x ve y gerçel sayılar olmak üzere,
-2 < x ≤ 5
-4 ≤ y < 3
olduğuna göre, 2x - 3y ifadesinin alabileceği EN BÜYÜK tam sayı değeri kaçtır?

💡 ÇÖZÜM:
1. x ve y 'gerçel (reel) sayı' dendiği için değer seçilmez, aralık genişletilip taraf tarafa toplanır!
2. 2x aralığını bulalım (2 ile çarp):
-4 < 2x ≤ 10
3. -3y aralığını bulalım (-3 ile çarpınca eşitsizlik yön değiştirir):
-4 ≤ y < 3 ⇒ (-3) · 3 < -3y ≤ (-3) · (-4) ⇒ -9 < -3y ≤ 12.
4. Taraf tarafa toplayalım (Bir uçta eşitlik var diğerinde yoksa sonuçta eşitlik alınmaz!):
-4 < 2x ≤ 10
-9 < -3y ≤ 12
+ -------------------
-13 < 2x - 3y ≤ 22
5. 2x - 3y ifadesinin alabileceği en büyük tam sayı değeri 22'dir.

🎯 PRATİK İPUCU: Eşitsizlik sorularında 'gerçel sayı' deniyorsa aralıkları genişletip toplayın; asla değer seçmeyin (Değer seçmek yalnızca 'tam sayı' denirse geçerlidir)!''',
      ],
      goldenRule: 'Negatif bir sayıyla çarpar veya bölerseniz eşitsizlik kesinlikle yön değiştirir (< iken > olur)! Eşitsizlikler taraf tarafa asla çıkarılamaz!',
      osymTrap: 'a² < a eşitsizliği ÖSYM\'nin en meşhur tuzağıdır! Karesi kendisinden küçük olan sayılar 0 ile 1 arasındaki pozitif basit kesirlerdir: 0 < a < 1.'
    ),
    LectureSection(
      title: 'Aralıklar ve Kuvvet Alma Kuralları',
      type: LectureSectionType.formula,
      leadText: 'Aralıklarda kuvvet alma ve çarpma işlemlerinde sınır belirleme (matematik1.pdf s. 56-57):',
      bulletPoints: [
        '▸ 1. Tek Kuvvet Alma: Eşitsizliğin her iki tarafının tek kuvveti alınırken yön değişmez:\n• a < b ise a³ < b³ ve a^5 < b^5.',
        '▸ 2. Çift Kuvvet Alma:\n• A · Sınırların İkisi de Pozitifse: 2 < x < 5 → 4 < x² < 25.\n• B · Sınırların Biri Negatif Biri Pozitifse (0 aralıktaysa): -3 < x < 4 ifadesinde x²\'nin en küçük değeri DAİMA 0\'DIR! Sınırların karelerinden büyük olanı üst sınır yapılır:\n• 0 ≤ x² < 16 (Çünkü 0\'ın karesi 0\'dır ve reel sayılarda çift kuvvet negatif olamaz!).',
        '▸ 3. Aralıkların Çarpımı: a < x < b ve c < y < d ise x · y\'nin aralığını bulmak için 4 köşe birbiriyle çarpılır (a · c, a · d, b · c, b · d); en küçük çıkan alt sınır, en büyük çıkan üst sınır olur.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
-2 < x < 4 ve 3 < y < 6 olduğuna göre, x · y çarpımının alabileceği değer aralığı nedir?

💡 ÇÖZÜM:
1. Çarpım aralığı bulunurken tüm uç noktaların birbirleriyle çarpımları hesaplanır:
• (-2) · 3 = -6
• (-2) · 6 = -12
• 4 · 3 = 12
• 4 · 6 = 24
2. En küçük çarpım alt sınır, en büyük çarpım üst sınırdır:
• Alt sınır = min(-6, -12, 12, 24) = -12
• Üst sınır = max(-6, -12, 12, 24) = 24
3. Hiçbir uçta eşitlik olmadığından aralık: (-12, 24) açık aralığıdır.

🎯 PRATİK İPUCU: Eşitsizliklerde taraf tarafa çarpma yapılmaz; daima 4 uç çarpımı hesaplanıp en küçük ve en büyük değerler sınır seçilir.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
a² < a ve a · b > b
olduğuna göre, b sayısı için aşağıdakilerden hangisi daima doğrudur?

💡 ÇÖZÜM:
1. Birinci eşitsizlik: a² < a.
Karesi kendisinden küçük olan sayılar yalnızca 0 ile 1 arasındaki pozitif basit kesirlerdir:
0 < a < 1 (Demek ki a pozitiftir ve 1'den küçüktür).
2. İkinci eşitsizlik: a · b > b.
Sağdaki b'yi sola atalım: a · b - b > 0 ⇒ b(a - 1) > 0.
3. a sayısı (0, 1) aralığında olduğundan (a - 1) ifadesi KESİNLİKLE NEGATİFTİR (-).
4. b · (-) > 0 olması için b sayısının da NEGATİF olması zorunludur:
b < 0 bulunur.

🎯 PRATİK İPUCU: ÖSYM'nin en sevdiği kalıp: a² < a gördüğünüz an tereddütsüz 0 < a < 1 yazın!''',
      ],
      goldenRule: '-3 < x < 5 ise x² aralığı: 0 ≤ x² < 25\'tir! Alt sınıra kesinlikle 0 ≤ yazılır!',
      osymTrap: 'Eğer x ve y "tam sayı" deniyorsa değer seçilir; "gerçek (reel) sayı" deniyorsa aralık işlemleri (genişletme, taraf tarafa toplama) uygulanır!'
    ),
    LectureSection(
      title: 'Mutlak Değer Tanımı ve Özellikleri',
      type: LectureSectionType.comparison,
      leadText: 'Bir gerçek sayının sayı doğrusu üzerinde sıfıra (başlangıç noktasına) olan uzaklığına mutlak değer denir (matematik1.pdf s. 59-62):',
      bulletPoints: [
        '▸ 1. Mutlak Değerin Tanımı:\n• x ≥ 0 ise |x| = x\n• x < 0 ise |x| = -x (Önüne eksi alarak pozitif çıkar: |-5| = -(-5) = 5).\n• Uzaklık negatif olamayacağından mutlak değerin sonucu hiçbir zaman negatif olamaz: |x| ≥ 0.',
        '▸ 2. Temel Özellikler:\n• |-x| = |x|\n• |a - b| = |b - a|\n• |x · y| = |x| . |y|\n• |x / y| = |x| / |y| (y ≠ 0)\n• |x^n| = |x|^n',
        '▸ 3. Mutlak Değerli Denklemler:\n• |x| = a (a ≥ 0) ise: x = a veya x = -a.\n• |x| = |y| ise: x = y veya x = -y.\n• |x| = Negatif Sayı ise: Çözüm Kümesi BOŞ KÜMEDİR (Ç.K = Ø).',
        '▸ 4. Mutlak Değerli Eşitsizlikler:\n• |x| ≤ a (a > 0) ise: -a ≤ x ≤ a (Sandviç kuralı).\n• |x| ≥ a (a > 0) ise: x ≥ a veya x ≤ -a.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
|2x - 6| = x + 3
denkleminin çözüm kümesini bulunuz.

💡 ÇÖZÜM:
1. Mutlak değerli bir ifade pozitif bir değere eşit olmalıdır: x + 3 ≥ 0 ⇒ x ≥ -3 koşulu vardır.
2. İfade iki durumda incelenir:
• Durum 1: 2x - 6 = x + 3 ⇒ x = 9 (Koşulu sağlar: 9 ≥ -3).
• Durum 2: 2x - 6 = -(x + 3) ⇒ 2x - 6 = -x - 3 ⇒ 3x = 3 ⇒ x = 1 (Koşulu sağlar: 1 ≥ -3).
3. Her iki kök de denklemi doğrular.
4. Çözüm Kümesi: Ç = {1, 9} bulunur.

🎯 PRATİK İPUCU: Eşitliğin sağında bilinmeyen (x) varsa bulduğunuz kökleri mutlaka denklemde yerine koyup sağ tarafın pozitif olduğunu doğrulayın!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
|x - 3| + |x + 5|
ifadesinin alabileceği EN KÜÇÜK değer kaçtır?

💡 ÇÖZÜM:
1. Geometrik Yorum: Bu ifade, sayı doğrusu üzerinde bir x noktasının 3 ve -5 noktalarına olan uzaklıkları toplamıdır.
2. İki nokta arasındaki uzaklık toplamının en küçük değeri, x bu iki noktanın arasında seçildiğinde elde edilir ve bu noktalar arasındaki sabit mesafeye eşittir:
En Küçük Değer = |3 - (-5)| = |3 + 5| = 8'dir.
3. Kritik Nokta Yöntemiyle Doğrulama:
• x = 3 için: |3 - 3| + |3 + 5| = 0 + 8 = 8.
• x = -5 için: |-5 - 3| + |-5 + 5| = 8 + 0 = 8.
4. İfade hiçbir zaman 8'den daha küçük olamaz!

🎯 PRATİK İPUCU: |x - a| + |x - b| toplamının en küçük değeri daima kritik noktaların farkı olan |a - b|'ye eşittir!''',
      ],
      goldenRule: '|x| = -5 denkleminin çözüm kümesi BOŞ KÜMEDİR! Mutlak değer hiçbir zaman negatif bir sayıya eşit olamaz.',
      comparisonRows: [
        ComparisonRow(
          correct: '|x| ≤ 4  =>  -4 ≤ x ≤ 4 (Küçüktür: Sandviç / Kapalı Aralık)',
          wrong: '|x| ≤ 4  =>  x ≤ 4 (Hata: Negatif alt sınır -4 ≤ x unutulmamalıdır!)',
          note: '|x| ≤ a (a > 0) ifadesinde alt ve üst sınır simetriktir: -a ≤ x ≤ a şeklinde sandviç yapılır.'
        ),
        ComparisonRow(
          correct: '|x| ≥ 4  =>  x ≥ 4 veya x ≤ -4 (Büyüktür: İki ayrı ayrık bölge)',
          wrong: '|x| ≥ 4  =>  -4 ≥ x ≥ 4 veya 4 ≤ x ≤ -4 (Hata: Büyüktür sandviç yapılamaz!)',
          note: '|x| ≥ a olduğunda x değeri a\'dan büyük ya da -a\'dan küçük iki ayrı kola ayrılır.'
        )
      ]
    ),
    LectureSection(
      title: 'Eşitsizlik ve Mutlak Değer Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 7 ve 8 sınav formatındaki sorular:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '|2x - 3| = 7 denklemini sağlayan x değerlerinin toplamı kaçtır? (MEB Bölüm 8 Mutlak Değer)',
          options: [
            'A) 2',
            'B) 3',
            'C) 5',
            'D) 7',
            'E) 10'
          ],
          correctIndex: 1,
          explanation: 'Mutlak değer kuralından:\n1) 2x - 3 = 7 → 2x = 10 → x = 5\n2) 2x - 3 = -7 → 2x = -4 → x = -2\nx değerleri toplamı = 5 + (-2) = 3 bulunur · (Pratik kural: |ax + b| = c denkleminin kökler toplamı 2 · (-b/a) = 2 · (3/2) = 3).',
          ruleTag: 'Mutlak Değerli Denklem'
        ),
        LectureInteractiveQuiz(
          prompt: '-3 < x ≤ 5 ve -2 ≤ y < 4 olduğuna göre 2x - 3y ifadesinin alabileceği EN BÜYÜK tam sayı değeri kaçtır? (MEB Bölüm 7 Eşitsizlik Testi Soru 4)',
          options: [
            'A) 10',
            'B) 12',
            'C) 14',
            'D) 16',
            'E) 18'
          ],
          correctIndex: 3,
          explanation: 'Taraf tarafa toplama kuralı uygulanır:\n1 · 2 ile çarpalım: -6 < 2x ≤ 10\n2. -3 ile çarpalım (eşitsizlik yön değiştirir): 6 ≥ -3y > -12 yani -12 < -3y ≤ 6\n3 · Taraf tarafa toplayalım:\n-6 + (-12) < 2x - 3y ≤ 10 + 6\n-18 < 2x - 3y ≤ 16\nEn büyük tam sayı değeri 16 bulunur.',
          ruleTag: 'Eşitsizliklerde Taraf Tarafa Toplama'
        ),
        LectureInteractiveQuiz(
          prompt: '|x - 4| ≤ 3 eşitsizliğini sağlayan x tam sayılarının toplamı kaçtır? (MEB Bölüm 8 Mutlak Değer)',
          options: [
            'A) 20',
            'B) 24',
            'C) 28',
            'D) 32',
            'E) 35'
          ],
          correctIndex: 2,
          explanation: '|f(x)| ≤ a kuralından: -a ≤ f(x) ≤ a\n-3 ≤ x - 4 ≤ 3\nHer tarafa +4 ekleyelim:\n1 ≤ x ≤ 7\nx tam sayıları: 1, 2, 3, 4, 5, 6, 7\'dir.\nToplam = (7 · 8) / 2 = 28 bulunur.',
          ruleTag: 'Mutlak Değerli Eşitsizlik'
        )
      ]
    )
  ],
);

final LectureTopic matematikEsitsizlikMutlakDeger = matematikKonu4;
