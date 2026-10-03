// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu1 = LectureTopic(
  id: 'matematik_konu_1',
  courseId: 'matematik',
  order: 1,
  title: 'Temel Kavramlar ve Sayı Basamakları',
  subtitle: 'Rakamlar, Sayı Kümeleri, Teklik-Çiftlik, Pozitif-Negatiflik, Basamak Analizi ve Faktöriyel',
  icon: Icons.calculate,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 1 - 10',
  startTestNum: 1,
  endTestNum: 10,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Rakam ve Sayı Kümeleri',
      type: LectureSectionType.overview,
      leadText: 'Sayıları ifade etmek için kullanılan sembollere rakam denir · Onluk sayı sisteminde 10 adet rakam vardır: {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}. Her rakam bir sayıdır fakat her sayı bir rakam değildir (matematik1.pdf s. 11).',
      bulletPoints: [
        '▸ 1. Sayma Sayıları (N+): 1\'den başlayıp sonsuza kadar giden sayılardır: N+ = {1, 2, 3, 4, 5, ...}. En küçük sayma sayısı 1\'dir.',
        '▸ 2. Doğal Sayılar (N): 0\'dan başlayarak pozitif yönde sonsuza ilerleyen sayılardır: N = {0, 1, 2, 3, 4, ...}. En küçük doğal sayı 0\'dır.',
        '▸ 3. Tam Sayılar (Z): Sıfır başlangıç (referans) noktası olmak üzere negatif ve pozitif sonsuz arasındaki tüm tam değerlerdir:\n• Z = {..., -3, -2, -1, 0, 1, 2, 3, ...}\n• Pozitif Tam Sayılar (Z+): {1, 2, 3, 4, ...}\n• Negatif Tam Sayılar (Z-): {..., -4, -3, -2, -1}\n• ⚠️ DİKKAT: 0 (sıfır) tam sayıdır ancak İŞARETSİZDİR (ne pozitif ne de negatiftir). Z = Z- U {0} U Z+',
        '▸ 4. Rasyonel Sayılar (Q): a ve b birer tam sayı ve b ≠ 0 olmak üzere a/b şeklinde yazılabilen sayılardır.',
        '▸ 5. İrrasyonel Sayılar (Q\'): a/b şeklinde yazılamayan, virgülden sonrası devretmeksizin sonsuza giden sayılardır (kök 2, kök 3, pi, e sayısı).',
        '▸ 6. Gerçek (Reel) Sayılar (R): Rasyonel ve irrasyonel sayı kümelerinin birleşimidir: R = Q U Q\'.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
a, b ve c birbirinden farklı rakamlardır.
2a + 3b - 4c
ifadesinin alabileceği EN BÜYÜK değer kaçtır?

💡 ÇÖZÜM:
1. İfadenin en büyük olması için katsayısı pozitif ve büyük olan terimlere en büyük rakamlar, negatif terime ise en küçük rakam verilmelidir.
2. Rakamlar kümesi: {0, 1, 2, ..., 9} ve elemanlar birbirinden farklıdır.
3. En büyük pozitif katsayı +3 olduğundan b = 9 seçilir.
4. İkinci büyük katsayı +2 olduğundan a = 8 seçilir.
5. Çıkarılan -4c teriminin değeri küçültmemesi için c = 0 seçilir.
6. Sonuç: 2 · (8) + 3 · (9) - 4 · (0) = 16 + 27 - 0 = 43 bulunur.

🎯 PRATİK İPUCU: Pozitif katsayılardan büyük olana en büyük rakamı (9), negatif katsayılı terime en küçük rakamı (0) atayın.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
x, y ve z birer pozitif tam sayıdır.
3x + 4y + 5z = 82
olduğuna göre, x'in alabileceği EN BÜYÜK değer kaçtır?

💡 ÇÖZÜM:
1. x'in en büyük olması için diğer pozitif terimlerin (y ve z) mümkün olan EN KÜÇÜK pozitif tam sayı değerini (1 veya en küçük pozitif değer) alması gerekir.
2. Pozitif tam sayılar kümesi: Z⁺ = {1, 2, 3, ...}.
3. Katsayısı büyük olan terime (5z) küçük değer verirken 3x için kalanın 3'e tam bölünmesini sağlamalıyız:
• z = 1 ve y = 1 seçilirse: 3x + 4(1) + 5(1) = 82 ⇒ 3x + 9 = 82 ⇒ 3x = 73 (73, 3'e bölünmez).
• z = 1 ve y = 2 seçilirse: 3x + 4(2) + 5(1) = 82 ⇒ 3x + 13 = 82 ⇒ 3x = 69 (69 = 3 · 23 tam bölünür!).
4. Buradan 3x = 69 ⇒ x = 23 bulunur.

🎯 PRATİK İPUCU: Bir bilinmeyenin en büyük değeri için diğerlerine en küçük pozitif tam sayıları verin ve kalan sayının aranan katsayıya tam bölünmesini sağlayacak en küçük çifti deneyin!''',
      ],
      goldenRule: '0 sayısı bir doğal sayıdır ve tam sayıdır; ancak pozitif ya da negatif değildir, nötrdür! Soru kökündeki "pozitif tam sayı" ifadesine dikkat edin; 0 bu kümeye dahil edilemez!',
      osymTrap: 'Soru kökündeki küme tanımı cevabı belirler! "a ve b birer rakam" dediğinde a ve b en fazla 9 olabilir; "a ve b birer doğal sayı" dediğinde üst sınır yoktur.'
    ),
    LectureSection(
      title: 'Teklik - Çiftlik ve İşaret Analizleri',
      type: LectureSectionType.formula,
      leadText: 'Tam sayılarda teklik-çiftlik kuralları ve işaret analizleri (matematik1.pdf s. 12-14):',
      bulletPoints: [
        '▸ 1. Çift ve Tek Sayı Tanımları:\n• n bir tam sayı olmak üzere; 2n genel terimiyle gösterilen sayılara ÇİFT TAM SAYI, 2n-1 (veya 2n+1) genel terimiyle gösterilen sayılara TEK TAM SAYI denir.\n• Çift sayılar = {..., -4, -2, 0, 2, 4, ...} (0 çift sayıdır!)\n• Tek sayılar = {..., -3, -1, 1, 3, 5, ...}',
        '▸ 2. Toplama ve Çıkarma Kuralları:\n• Ç ± Ç = Ç (Örn: 4 + 6 = 10, 4 - 6 = -2)\n• T ± T = Ç (Örn: 3 + 5 = 8, 3 - 5 = -2)\n• Ç ± T = T (Örn: 4 + 3 = 7, 4 - 3 = 1)\n• T ± Ç = T (Örn: 3 + 4 = 7, 3 - 4 = -1)',
        '▸ 3. Çarpma ve Kuvvet Kuralları:\n• Ç . Ç = Ç, Ç . T = Ç, T . Ç = Ç\n• T · T = T\n• KRİTİK SONUÇ: Çarpılan tam sayılardan EN AZ BİRİ ÇİFT İSE çarpımın sonucu DAİMA ÇİFTTİR! Çarpımın tek olması için çarpanların HEPSİNİN TEK OLMASI ZORUNDADIR.\n• n pozitif bir tam sayı olmak üzere: T^n = T, Ç^n = Ç (Kuvvet tabanın teklik/çiftliğini değiştirmez; ancak üs 0 ise T^0 = 1, Ç^0 = 1 tek olur).',
        '▸ 4. İşaret Analizleri:\n• (+) · (+) = (+), (-) · (-) = (+)\n• (+) · (-) = (-), (-) · (+) = (-)\n• Çift Kuvvet Kuralı: Negatif bir sayının çift kuvveti daima pozitiftir: (-a)^2n = +; tek kuvveti negatiftir: (-a)^(2n+1) = -.\n• x^2 · y < 0 ise x^2 daima pozitif olduğundan y KESİNLİKLE NEGATİFTİR (y < 0).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
a, b ve c birer tam sayıdır.
(3a + 5b) / 4 = c
olduğuna göre, aşağıdakilerden hangisi DAİMA doğrudur?

💡 ÇÖZÜM:
1. İçler dışlar çarpımı yapalım: 3a + 5b = 4c.
2. Sağ tarafta 4c ifadesi (4 çift çarpanı nedeniyle) c tam sayısının türü ne olursa olsun DAİMA ÇİFTTİR.
3. O halde: 3a + 5b = Çift olmalıdır.
4. İki terimin toplamı çift ise ikisi de tek veya ikisi de çift olmak zorundadır (T + T = Ç veya Ç + Ç = Ç).
5. Katsayılar (3 ve 5) tek olduğundan a ve b aynı teklik-çiftlik durumuna sahiptir:
• a tek ise b de tektir.
• a çift ise b de çifttir.

🎯 PRATİK İPUCU: Kesirli ifadelerde içler dışlar çarpımı yaparak çift katsayılı terimi (4c) tespit edin; çarpanı çift olan harf (c) hakkında kesin hüküm verilemez!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
a, b ve c gerçel sayıları için,
a³ · b⁴ < 0
b⁵ · c³ > 0
a · c > 0
olduğuna göre; a, b ve c'nin işaretleri sırasıyla nedir?

💡 ÇÖZÜM:
1. Altın Kural: Çift kuvvetli terimler (b⁴) taban ne olursa olsun daima pozitiftir (+). Bu nedenle işaret analizine daima çift kuvvetten başlanır:
• a³ · (+) < 0 ⇒ a³ negatiftir ⇒ a = (-) (Eksi).
2. Üçüncü eşitsizliğe bakalım: a · c > 0.
• (-) · c > 0 olması için c de negatif olmalıdır ⇒ c = (-) (Eksi).
3. İkinci eşitsizliğe bakalım: b⁵ · c³ > 0.
• c negatif olduğundan c³ de negatiftir (-).
• b⁵ · (-) > 0 olması için b⁵ negatif olmalıdır ⇒ b = (-) (Eksi).
4. İşaretler sırasıyla: a = (-), b = (-), c = (-) yani (-, -, -) olur.

🎯 PRATİK İPUCU: İşaret sorularına DAİMA çift kuvveti olan terimden başlayın; çift kuvveti komple silip (+) kabul edin!''',
      ],
      goldenRule: 'a · b · c çarpımı tek ise a, b ve c sayılarının ÜÇÜ DE KESİNLİKLE TEKTİR! a · b · c çift ise en az biri çifttir.',
      osymTrap: 'Teklik ve çiftlik kavramı YALNIZCA TAM SAYILAR için geçerlidir! Kesirli sayılarda (2/3 gibi) teklik ya da çiftlik ARANMAZ!'
    ),
    LectureSection(
      title: 'Sayı Basamakları ve Basamak Analizi',
      type: LectureSectionType.comparison,
      leadText: 'Rakamların sayıda bulunduğu yere basamak, basamaktaki değerine basamak değeri denir (matematik1.pdf s. 15-16):',
      bulletPoints: [
        '▸ 1. Basamak Çözümleme Formülleri:\n• İki basamaklı AB sayısı: AB = 10A + B\n• Üç basamaklı ABC sayısı: ABC = 100A + 10B + C\n• Dört basamaklı ABCD sayısı: ABCD = 1000A + 100B + 10C + D',
        '▸ 2. Sık Kullanılan Basamak Özdeşlikleri:\n• AB + BA = 11(A + B)\n• AB - BA = 9(A - B)\n• ABC - CBA = 99(A - C) (B basamağı birbirini götürür!)\n• ABC + BCA + CAB = 111(A + B + C)',
        '▸ 3. Değer Verme ve Sınır Koşulları:\n• Bir sayının en büyük veya en küçük değeri sorulduğunda basamak ağırlığı en büyük olan yüzler/binler basamağına öncelik verilir.\n• Sayılar "rakamları farklı" deniyorsa kullanılan rakam bir daha kullanılamaz.\n• A ve B sıfır olamaz çünkü iki basamaklı sayının baş basamağı 0 olamaz.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
İki basamaklı AB ve BA sayıları için,
AB - BA = 54
olduğuna göre, bu koşulu sağlayan kaç farklı AB sayısı yazılabilir?

💡 ÇÖZÜM:
1. Altın basamak özdeşliğini yazalım: AB - BA = 9(A - B).
2. 9(A - B) = 54 ⇒ A - B = 6 elde edilir.
3. AB ve BA iki basamaklı sayılar olduğundan A ≠ 0 ve B ≠ 0 olmak zorundadır.
4. Farkı 6 olan sıfırdan farklı rakam çiftleri (A, B):
• A = 9 iken B = 3 ⇒ AB = 93
• A = 8 iken B = 2 ⇒ AB = 82
• A = 7 iken B = 1 ⇒ AB = 71
(B = 0 seçilemez, çünkü BA iki basamaklı sayı olamaz!)
5. Dolayısıyla koşulu sağlayan 3 farklı AB sayısı yazılabilir.

🎯 PRATİK İPUCU: Ters basamaklı farklarda daima 9'un katını arayın ve ters sayının baş basamağının sıfır olamayacağını (B ≠ 0) unutmayın!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 7:
Üç basamaklı ABC sayısının sağına 4 yazılarak elde edilen dört basamaklı sayı, soluna 2 yazılarak elde edilen dört basamaklı sayıdan 1836 fazladır.
Buna göre, ABC sayısı kaçtır?

💡 ÇÖZÜM:
1. Sağına 4 yazılan sayı: ABC4 = 10 · ABC + 4.
2. Soluna 2 yazılan sayı: 2ABC = 2000 + ABC.
3. Denklem: ABC4 - 2ABC = 1836
(10 · ABC + 4) - (2000 + ABC) = 1836
4. Benzer terimleri toplayalım:
9 · ABC - 1996 = 1836
9 · ABC = 1836 + 1996 = 3832... Hata kontrolü: 9 · ABC = 3834.
ABC = 3834 / 9 = 426 bulunur.

🎯 PRATİK İPUCU: Bir sayının sağına rakam eklendiğinde sayı 10 ile çarpılıp o rakam eklenir (10·A + x); soluna rakam eklendiğinde basamak değeri doğrudan eklenir!''',
      ],
      goldenRule: 'AB - BA = 9(A - B) formülü ÖSYM\'nin en çok sorduğu kalıptır! İki basamaklı bir sayının rakamları yer değiştirdiğinde fark daima 9\'un katıdır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'AB + BA = 11(A + B) (İki basamaklı ters toplamı daima 11\'in katıdır)',
          wrong: 'AB + BA = 10(A + B) veya A + B (Katsayı 11 unutulmamalıdır!)',
          note: 'Basamak çözümlemesinde (10A + B) + (10B + A) = 11(A + B) elde edilir.'
        ),
        ComparisonRow(
          correct: 'AB - BA = 9(A - B) ve ABC - CBA = 99(A - C)',
          wrong: 'ABC - CBA = 99(A - B - C) veya farkta B\'nin yer alması',
          note: 'Onlar basamağındaki 10B - 10B = 0 olduğu için simetrik üç basamaklı farkta B yer almaz, daima 99(A - C) kalır.'
        )
      ]
    ),
    LectureSection(
      title: 'Faktöriyel Kavramı ve Özellikleri',
      type: LectureSectionType.formula,
      leadText: '1\'den n\'ye kadar olan ardışık doğal sayıların çarpımına n faktöriyel denir ve n! ile gösterilir (matematik1.pdf s. 17):',
      bulletPoints: [
        '▸ 1. Temel Faktöriyel Değerleri:\n• 0! = 1 (Tanım gereği)\n• 1! = 1\n• 2! = 1 · 2 = 2\n• 3! = 1 · 2 · 3 = 6\n• 4! = 1 · 2 · 3 · 4 = 24\n• 5! = 1 · 2 · 3 · 4 · 5 = 120\n• 6! = 720',
        '▸ 2. Faktöriyel Açılım Kuralı:\n• Büyük faktöriyel küçük faktöriyel cinsinden açılabilir:\n• n! = n · (n - 1)! = n · (n - 1) · (n - 2)!\n• Örnek: 8! / 6! = (8 · 7 · 6!) / 6! = 8 · 7 = 56\n• Örnek: (n+1)! / n! = [(n+1) · n!] / n! = n + 1',
        '▸ 3. Sondan Kaç Basamağı Sıfırdır Soruları:\n• Bir sayının sondan kaç basamağının sıfır olduğunu bulmak için sayı sürekli 5\'e bölünür ve bölümler toplanır (Çünkü 10 çarpanı 2 ve 5\'ten oluşur; 5 çarpanı daha azdır).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
(10! + 9!) / (10! - 9!)
işleminin sonucu kaçtır?

💡 ÇÖZÜM:
1. Büyük faktöriyeli en küçük faktöriyel (9!) cinsinden açalım: 10! = 10 · 9!.
2. Payı 9! ortak parantezine alalım: 10 · 9! + 1 · 9! = 9! · (10 + 1) = 9! · 11.
3. Paydayı 9! ortak parantezine alalım: 10 · 9! - 1 · 9! = 9! · (10 - 1) = 9! · 9.
4. Kesirde yerine yazıp 9! çarpanlarını sadeleştirelim:
(9! · 11) / (9! · 9) = 11 / 9 bulunur.

🎯 PRATİK İPUCU: Faktöriyelleri çarparak açmak yerine daima en küçük faktöriyelin parantezine alıp sadeleştirme yapın!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 8:
45! sayısının sondan kaç basamağı sıfırdır ve bu sayı 8'e tam bölünür mü?

💡 ÇÖZÜM:
1. Sondaki sıfır sayısını 10 = 2 · 5 çarpanları belirler. 2 çarpanı 5'ten çok daha fazla olduğundan sadece içindeki 5 asal çarpanlarının sayısı aranır (Ardışık bölme yöntemi):
• 45 ÷ 5 = 9
• 9 ÷ 5 = 1 (1 artık 5'e bölünmez).
2. Bölümler toplanır: 9 + 1 = 10.
Yani 45! sayısının sondan 10 basamağı sıfırdır!
3. 8'e bölünebilme için içinde 8 = 2³ çarpanı aranır. 45! içinde onlarca 2 çarpanı bulunduğundan 8'e kalansız tam bölünür.

🎯 PRATİK İPUCU: n! sayısının sondan sıfır sayısını bulmak için n sayısını sürekli 5'e bölün ve bölümleri toplayın; kalanlarla ilgilenmeyin!''',
      ],
      goldenRule: '0! = 1\'dir! 5! ve sonrasındaki tüm faktöriyellerin (5!, 6!, 7!...) son basamağı daima 0\'dır; birler basamağı tek olan tek faktöriyel 1! ve 0!\'dir.',
      osymTrap: 'Faktöriyelli toplama-çıkarma işlemlerinde en küçük faktöriyelin ortak parantezine almadan işlem yapmaya çalışmayın: 7! + 6! = 6!(7 + 1) = 8 · 6!'
    ),
    LectureSection(
      title: 'Temel Kavramlar Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 1 Değerlendirme Testi soruları ve adım adım çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'a, b ve c pozitif tam sayılardır · a · b = 12 ve b · c = 18 olduğuna göre a + b + c toplamının alabileceği EN KÜÇÜK değer kaçtır?',
          options: [
            'A) 11',
            'B) 13',
            'C) 15',
            'D) 17',
            'E) 31'
          ],
          correctIndex: 0,
          explanation: 'Toplamın en küçük olması için ortak çarpan olan b sayısı en büyük seçilmelidir · b, hem 12 hem 18\'in ortak böleni olmalıdır: EBOB(12, 18) = 6 · b = 6 seçilirse; a = 12 / 6 = 2, c = 18 / 6 = 3 olur · Buradan a + b + c = 2 + 6 + 3 = 11 bulunur.',
          ruleTag: 'Ortak Çarpan ve Ekstremum'
        ),
        LectureInteractiveQuiz(
          prompt: 'İki basamaklı AB ve BA sayılarının farkı AB - BA = 45 olduğuna göre A - B farkı kaçtır?',
          options: [
            'A) 3',
            'B) 4',
            'C) 5',
            'D) 6',
            'E) 9'
          ],
          correctIndex: 2,
          explanation: 'Basamak analizi kuralından: AB - BA = (10A + B) - (10B + A) = 9(A - B) = 45 · Her iki tarafı 9\'a bölersek A - B = 45 / 9 = 5 bulunur.',
          ruleTag: 'Basamak Çözümleme'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki sayılardan hangisi tektir? (MEB Bölüm 1 Testi Soru 1)',
          options: [
            'A) 5² + 2',
            'B) 2³ + 2',
            'C) 3³ + 3',
            'D) 0 · 10¹',
            'E) 6⁴ · 12⁸'
          ],
          correctIndex: 0,
          explanation: 'Seçenekleri inceleyelim:\nA) 5² + 2 = 25 + 2 = 27 (TEK)\nB) 2³ + 2 = 8 + 2 = 10 (ÇİFT)\nC) 3³ + 3 = 27 + 3 = 30 (ÇİFT)\nD) 0 · 10¹ = 0 (ÇİFT)\nE) 6⁴ · 12⁸ = Çift . Çift = ÇİFT.\nDoğru cevap A şıkkıdır.',
          ruleTag: 'Tek ve Çift Sayılar'
        ),
        LectureInteractiveQuiz(
          prompt: '-15 - 14 - 13 - ... - 1 + 1 + 2 + ... + 16 + 17 işleminin sonucu kaçtır? (MEB Bölüm 1 Testi Soru 6)',
          options: [
            'A) 22',
            'B) 33',
            'C) 35',
            'D) 46',
            'E) 48'
          ],
          correctIndex: 1,
          explanation: 'Toplama işleminde zıt işaretli sayılar birbirini nötrler:\n-15 ile +15 arasındaki tüm sayılar toplamı 0 eder: (-15 + 15) + (-14 + 14) + ... + (-1 + 1) = 0.\nGeriye yalnızca son iki pozitif terim kalır:\n16 + 17 = 33 bulunur.',
          ruleTag: 'Ardışık Tam Sayı Toplamı ve Sadeleştirme'
        ),
        LectureInteractiveQuiz(
          prompt: '-2 - 3 + 2 · (-4) - 5 · (-2) · 2 + 10 : (-2) işleminin sonucu kaçtır? (MEB Bölüm 1 Testi Soru 8)',
          options: [
            'A) -38',
            'B) -12',
            'C) -2',
            'D) 2',
            'E) 12'
          ],
          correctIndex: 3,
          explanation: 'İşlem önceliğine göre önce çarpma ve bölmeler yapılır:\n1 · 2 · (-4) = -8\n2. -5 · (-2) · 2 = +20\n3 · 10 : (-2) = -5\nŞimdi baştan sona toplayalım:\n-2 - 3 + (-8) + 20 + (-5) = -5 - 8 + 20 - 5 = -18 + 20 = 2 bulunur.',
          ruleTag: 'İşlem Önceliği ve İşaret Kuralları'
        )
      ]
    )
  ],

);

final LectureTopic matematikTemelKavramlar = matematikKonu1;
