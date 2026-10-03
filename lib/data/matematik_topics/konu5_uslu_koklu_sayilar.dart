// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu5 = LectureTopic(
  id: 'matematik_konu_5',
  courseId: 'matematik',
  order: 5,
  title: 'Üslü ve Köklü Sayılar',
  subtitle: 'Üslü İfadeler, Kuvvet Özellikleri, Üslü Denklemler, Kök Dereceleri, Eşlenik ve İç İçe Kökler',
  icon: Icons.superscript,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 41 - 50',
  startTestNum: 41,
  endTestNum: 50,
  estimatedMinutes: 55,
  sections: [
    LectureSection(
      title: 'Üslü Sayıların Tanımı ve Temel Özellikleri',
      type: LectureSectionType.overview,
      leadText: 'a bir gerçek sayı ve n pozitif bir tam sayı olmak üzere n tane a\'nın çarpımına üslü sayı denir: a^n = a · a . ... . a (matematik1.pdf s. 39-42):',
      bulletPoints: [
        '▸ 1. Temel Kurallar:\n• a⁰ = 1 (a ≠ 0 olmak şartıyla; 0⁰ belirsizdir).\n• a^1 = a\n• 1ⁿ = 1\n• Negatif Üs Kuralı: Sayıyı ters çevirir: a^(-n) = 1 / a^n, (a/b)^(-n) = (b/a)^n.',
        '▸ 2. Taban ve Kuvvet İşlemleri:\n• Çarpma: Tabanlar aynı ise üsler toplanır: a^x · a^y = a^(x + y).\n• Bölme: Tabanlar aynı ise payın üssünden paydanın üssü çıkarılır: a^x / a^y = a^(x - y).\n• Üssün Üssü: Üsler birbiriyle çarpılır: (a^x)^y = a^(x · y).\n• Üsler Eşit İse Çarpma/Bölme: a^x · b^x = (a · b)^x, a^x / b^x = (a / b)^x.',
        '▸ 3. Parantez ve İşaret Farkı:\n• (-2)⁴ = +16 (Üs çift ve parantez dışında → Pozitif).\n• -2⁴ = -16 (Kuvvet sadece 2\'ye aittir → Negatif).\n• (-2)^3 = -8 (Tek kuvvet işareti korur).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
2ˣ = 3 ve 3ʸ = 32
olduğuna göre, x · y çarpımı kaçtır?

💡 ÇÖZÜM:
1. İkinci denklemde 3 yerine birinci denklemdeki 2ˣ ifadesini yazalım:
(2ˣ)ʸ = 32
2. Üssün üssü çarpılır: 2ˣ·ʸ = 32.
3. 32 sayısı 2'nin 5. kuvvetidir: 32 = 2⁵.
4. Tabanlar eşit olduğundan üsler de eşittir:
2ˣ·ʸ = 2⁵ ⇒ x · y = 5 bulunur.

🎯 PRATİK İPUCU: aˣ = b ve bʸ = aᵏ zincirleme üslü sistemlerinde üslerin çapraz çarpımı eşittir: x · y = 1 · k.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
2^x = a ve 3^x = b olduğuna göre,
72^x ifadesinin a ve b türünden eşiti nedir?

💡 ÇÖZÜM:
1. 72 sayısını asal çarpanlarına ayıralım:
72 = 8 · 9 = 2³ · 3².
2. 72^x ifadesinde tabanı yerine yazalım:
72^x = (2³ · 3²)^x = (2³)^x · (3²)^x.
3. Üssün üssü kuralında üsler yer değiştirebilir: (a^m)^n = (a^n)^m:
= (2^x)³ · (3^x)².
4. Şimdi 2^x = a ve 3^x = b değerlerini yerlerine yazalım:
= a³ · b² bulunur.

🎯 PRATİK İPUCU: Tabanı asal çarpanlarına ayırıp üsleri yer değiştirin: (2³)^x = (2^x)³ = a³!''',
      ],
      goldenRule: '(-a)^çift = Pozitiftir; ancak -a^çift = Negatiftir! Parantezin olup olmaması işaretin kaderini belirler: (-3)² = 9 iken -3² = -9\'dur.',
      osymTrap: 'Toplama işleminde üsler toplanmaz! 2⁵ + 2⁵ = 2 · 2⁵ = 2⁶\'dır (2^10 değildir!).'
    ),
    LectureSection(
      title: 'Üslü Denklemler ve Çözüm Durumları',
      type: LectureSectionType.formula,
      leadText: 'Üslü denklemlerde karşılaşılan 3 ana durum (matematik1.pdf s. 43-44):',
      bulletPoints: [
        '▸ 1. Durum (Tabanlar Eşit İse):\n• a^x = a^y ve a not in {-1, 0, 1} ise x = y\'dir.',
        '▸ 2. Durum (Üsler Eşit İse):\n• x^n = y^n durumunda:\n  • n tek sayı ise: x = y\n  • n çift sayı ise: x = y veya x = -y (|x| = |y|).',
        '▸ 3. Durum (a^x = 1 Eşitliği - 3 İhtimal):\n• 1. İhtimal: Üs sıfır olabilir: x = 0 (a ≠ 0 olmalı).\n• 2. İhtimal: Taban 1 olabilir: a = 1 (x her şey olabilir).\n• 3. İhtimal: Taban -1 olabilir: a = -1 (x ÇİFT TAM SAYI olmalıdır).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
(x - 3)ˣ⁺⁴ = 1
denklemini sağlayan x gerçel sayılarının toplamı kaçtır?

💡 ÇÖZÜM:
Bir üslü ifadenin 1'e eşit olması için 3 bağımsız durum incelenir:
1. Durum (Üs sıfır): x + 4 = 0 ⇒ x = -4. (Taban -4 - 3 = -7 ≠ 0 olduğundan -4 geçerlidir).
2. Durum (Taban 1): x - 3 = 1 ⇒ x = 4. (1⁸ = 1 olduğundan 4 geçerlidir).
3. Durum (Taban -1 ve üs çift): x - 3 = -1 ⇒ x = 2. Şimdi üssü kontrol edelim: 2 + 4 = 6 (Çift sayıdır!). (-1)⁶ = 1 sağlandığından 2 geçerlidir.
4. x değerleri toplamı: (-4) + 4 + 2 = 2 bulunur.

🎯 PRATİK İPUCU: A^B = 1 sorularında Taban = -1 durumunda üssün ÇİFT olup olmadığını mutlaka kontrol edin!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
(x - 3)^(x² - 9) = 1
denklemini sağlayan x gerçel sayılarının toplamı kaçtır?

💡 ÇÖZÜM:
A^B = 1 eşitliği 3 farklı durumda sağlanır:
1. Durum: Üs sıfır olmalıdır (Taban sıfır olmamak şartıyla):
x² - 9 = 0 ⇒ x = 3 veya x = -3.
• x = 3 tabanı 3 - 3 = 0 yapar (0⁰ belirsizdir, elenir!).
• x = -3 için taban -3 - 3 = -6 ≠ 0 sağlar. Demek ki x = -3 köktür.
2. Durum: Taban 1 olmalıdır:
x - 3 = 1 ⇒ x = 4 (Üs 4² - 9 = 7 olur, 1⁷ = 1 sağlar). Demek ki x = 4 köktür.
3. Durum: Taban -1 ve üs ÇİFT tam sayı olmalıdır:
x - 3 = -1 ⇒ x = 2.
• Üssü kontrol edelim: 2² - 9 = 4 - 9 = -5 (Tek sayıdır! (-1)⁻⁵ = -1 ≠ 1 sağlamaz, elenir!).
4. Sağlayan kökler: {-3, 4}. Toplamları: -3 + 4 = 1 bulunur.

🎯 PRATİK İPUCU: A^B = 1 denklemlerinde taban 0 olamaz (0⁰ belirsiz) ve taban -1 iken üssün çift olduğunu MUTLAKA test edin!''',
      ],
      goldenRule: 'a^x = 1 denkleminde taban -1 olduğunda üssün çift olup olmadığı mutlaka kontrol edilmelidir!',
      osymTrap: 'x² = 9 denkleminde kökler x = 3 ve x = -3\'tür. Çift kuvvette eksi kökü unutmak en yaygın hatadır.'
    ),
    LectureSection(
      title: 'Kareköklü İfadeler ve Özellikleri',
      type: LectureSectionType.ruleList,
      leadText: 'n ≥ 2 ve n bir tam sayı olmak üzere x^n = a denklemini sağlayan x değerine a\'nın n · dereceden kökü denir (matematik1.pdf s. 47-50):',
      bulletPoints: [
        '▸ 1. Tanım ve Reel Sayı Olma Şartı:\n• Derece ÇİFT ise kök içindeki ifade negatif OLAMAZ: a ≥ 0 (Örn: kök(-4) reel sayı değildir!).\n• Derece TEK ise kök içi her reel sayı olabilir (Küp kök(-8) = -2 reel sayıdır).',
        '▸ 2. Kök Dışına Çıkarma ve Mutlak Değer:\n• n ÇİFT ise: n · kök(a^n) = |a| (Mutlak değerle çıkar!).\n• n TEK ise: n · kök(a^n) = a (Olduğu gibi çıkar).',
        '▸ 3. Köklü Sayıyı Üslü Sayıya Çevirme:\n• n · kök(a^m) = a^(m/n) (Kök derecesi daima paydadır!).',
        '▸ 4. Köklü Sayılarda Dört İşlem:\n• Toplama/Çıkarma: Yalnızca kök derecesi ve kök içi AYNI olan sayılar toplanır/çıkarılır: a kök(x) + b kök(x) = (a + b) kök(x).\n• Çarpma ve Bölme: Kök dereceleri eşitse aynı kök içinde çarpılır/bölünür:\n  • √a · √b = kök(a · b)\n  • √a / √b = kök(a / b)',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
[ 6 / √3 ] - [ 2 / (√5 - √3) ]
işleminin sonucu kaçtır?

💡 ÇÖZÜM:
1. Birinci kesrin pay ve paydası √3 ile çarpılır:
(6 · √3) / (√3 · √3) = 6√3 / 3 = 2√3.
2. İkinci kesir eşleniği olan (√5 + √3) ile çarpılır:
[2 · (√5 + √3)] / [(√5 - √3)(√5 + √3)] = [2(√5 + √3)] / (5 - 3) = [2(√5 + √3)] / 2 = √5 + √3.
3. Çıkarma işlemini yapalım:
2√3 - (√5 + √3) = 2√3 - √5 - √3 = √3 - √5 bulunur.

🎯 PRATİK İPUCU: Paydada kök bırakılmaz; tek terimli kök kendisiyle, iki terimli kök ise eşleniğiyle (aradaki işaretin zıddıyla) genişletilir.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 7:
√(7 - 2√10) + √(7 + 2√10)
işleminin sonucu kaçtır?

💡 ÇÖZÜM:
1. √(a ± 2√b) Özel Kök Formülü:
Çarpımları b'yi, toplamları a'yı veren iki pozitif sayı m ve n (m > n) olsun:
m · n = b ve m + n = a ise √(a ± 2√b) = √m ± √n'dir.
2. 10 sayısının çarpanlarına bakalım: 5 · 2 = 10 ve toplamları 5 + 2 = 7'dir.
3. O halde:
• √(7 - 2√10) = √5 - √2
• √(7 + 2√10) = √5 + √2
4. Bu iki ifadeyi toplayalım:
(√5 - √2) + (√5 + √2) = 2√5 bulunur.

🎯 PRATİK İPUCU: İçteki kökün başında 2 katsayısı varsa çarpımları içtekini, toplamları baştakini veren sayı çiftini (5 ve 2) bulun!''',
      ],
      goldenRule: 'Çift dereceli kökten çıkan sayı DAİMA mutlak değerle çıkar: √(x²) = |x|\'tir! x < 0 ise √(x²) = -x olur.',
      osymTrap: '√(a + b) ifadesi √a + √b\'ye EŞİT DEĞİLDİR! Örneğin √(9 + 16) = √25 = 5\'tir (3 + 4 = 7 değildir!).'
    ),
    LectureSection(
      title: 'Eşlenik Çarpımı ve İç İçe Kökler',
      type: LectureSectionType.comparison,
      leadText: 'Paydayı rasyonel yapma (eşlenik) ve özel iç içe kök formülleri (matematik1.pdf s. 51-52):',
      bulletPoints: [
        '▸ 1. Paydanın Eşleniği ile Çarpılması:\n• Paydada kök bırakmamak için pay ve payda eşlenikle genişletilir:\n• √a\'nın eşleniği √a\'dır: √a · √a = a.\n• (√a - √b)\'nin eşleniği (√a + √b)\'dir:\n• (√a - √b) · (√a + √b) = a - b (İki kare farkı).',
        '▸ 2. İç İçe Özel Kök Formülü: kök[ a ± 2 √b ]\n• Çarpımları b, toplamları a olan iki pozitif tam sayı m ve n olsun (m > n):\n• m · n = b ve m + n = a olmak üzere;\n• kök[ a + 2 √b ] = kök(m) + kök(n)\n• kök[ a - 2 √b ] = kök(m) - kök(n)\n• Örnek: kök[ 8 + 2 kök(15) ] → Çarpımları 15, toplamları 8 olan sayılar 5 ve 3\'tür → √5 + √3.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
√(8 + 2√15) - √(8 - 2√15)
işleminin sonucu kaçtır?

💡 ÇÖZÜM:
1. İçteki kökün önünde '2' katsayısı vardır. Çarpımları 15, toplamları 8 olan iki sayı aranır:
5 · 3 = 15 ve 5 + 3 = 8 olduğundan sayılar 5 ve 3'tür.
2. Birinci kök: √(8 + 2√15) = √5 + √3.
3. İkinci kök: √(8 - 2√15) = √5 - √3.
4. Aradaki çıkarma işlemini uygulayalım:
(√5 + √3) - (√5 - √3) = √5 + √3 - √5 + √3 = 2√3 bulunur.

🎯 PRATİK İPUCU: √(a ± 2√b) kalıbında m · n = b ve m + n = a ise sonuç √m ± √n'dir (m > n).''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 8:
A = √(12 + √(12 + √(12 + ...)))
B = √(20 - √(20 - √(20 - ...)))
olduğuna göre, A · B çarpımı kaçtır?

💡 ÇÖZÜM:
1. Sonsuz Kök Pratik Kuralı:
Kök içindeki sayı ardışık iki sayının çarpımı şeklinde yazılıyorsa (n · (n + 1)):
• Aradaki işaret (+) ise sonuç BÜYÜK olan sayıdır (n + 1).
• Aradaki işaret (-) ise sonuç KÜÇÜK olan sayıdır (n).
2. A için: 12 = 3 · 4 (Ardışık sayılar).
İşaret (+) olduğundan A = 4'tür.
3. B için: 20 = 4 · 5 (Ardışık sayılar).
İşaret (-) olduğundan B = 4'tür.
4. Çarpım: A · B = 4 · 4 = 16 bulunur.

🎯 PRATİK İPUCU: Ardışık çarpanlı sonsuz köklerde arada artı varsa büyük çarpanı, eksi varsa küçük çarpanı doğrudan işaretleyin!''',
      ],
      goldenRule: 'İç içe kök formülünün çalışması için içerideki kökün önünde MUTLAKA 2 ÇARPANI OLMALIDIR! 2 yoksa içeriden 4 çıkarılarak 2 üretilir.',
      comparisonRows: [
        ComparisonRow(
          correct: '√(8 - 2√15) = √5 - √3 (Çıkarma durumunda daima büyük kök başa yazılır)',
          wrong: '√3 - √5 (Hata: Çift dereceli kök sonucu asla negatif olamaz!)',
          note: 'm · n = 15 ve m + n = 8 için kökler √m - √n açılırken daima m > n olmalıdır.'
        ),
        ComparisonRow(
          correct: '√(a² + b²) = √(a² + b²) (Toplam kök dışına ayrı ayrı ÇIKMAZ)',
          wrong: '√(a² + b²) = a + b (Hata: Toplam durumundaki terimler ayrı ayrı kökten çıkarılamaz!)',
          note: 'Örnek: √(9 + 16) = √25 = 5\'tir; 3 + 4 = 7 değildir!'
        )
      ]
    ),
    LectureSection(
      title: 'Üslü ve Köklü Sayılar Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 5 ve 6 değerlendirme soruları:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '(2^(x+3) + 2^(x+1)) / 2^(x-1) işleminin sonucu kaçtır?',
          options: [
            'A) 10',
            'B) 16',
            'C) 20',
            'D) 24',
            'E) 32'
          ],
          correctIndex: 2,
          explanation: 'İfadeyi 2^x parantezine alalım:\nPay: 2^x · 2^3 + 2^x · 2^1 = 2^x (8 + 2) = 10 · 2^x.\nPayda: 2^x · 2^(-1) = 2^x · (1/2).\nBölme: (10 · 2^x) / [(1/2) · 2^x] = 10 / (1/2) = 10 · 2 = 20 bulunur.',
          ruleTag: 'Üslü İfadelerde Ortak Parantez'
        ),
        LectureInteractiveQuiz(
          prompt: '2048 sayısının %50\'si aşağıdakilerden hangisine eşittir? (MEB Üslü Sayılar Testi)',
          options: [
            'A) 2^10',
            'B) 2^11',
            'C) 2^9',
            'D) 2^8',
            'E) 2^6'
          ],
          correctIndex: 0,
          explanation: '1 · 2048 sayısını 2\'nin kuvveti olarak yazalım: 2048 = 2^11.\n2 · Bir sayının %50\'si o sayının yarısıdır (1/2 ile çarpımıdır):\n2^11 · (1/2) = 2^11 / 2^1 = 2^(11 - 1) = 2^10 bulunur.',
          ruleTag: 'Üslü Sayılarda Bölme ve Yüzde'
        ),
        LectureInteractiveQuiz(
          prompt: '6^(a - 1) = 3^(a + 1) olduğuna göre 2^a kaçtır? (MEB Üslü Denklem Testi)',
          options: [
            'A) 2',
            'B) 9',
            'C) 12',
            'D) 18',
            'E) 24'
          ],
          correctIndex: 3,
          explanation: '1. Üslü ifadeleri ayıralım:\n6^a / 6^1 = 3^a · 3^1\n2. İçler dışlar çarpımı yapalım:\n6^a = 18 · 3^a\n3 · Her iki tarafı 3^a ya bölelim:\n(6 / 3)^a = 18\n2^a = 18 bulunur.',
          ruleTag: 'Üslü Denklem Çözümü'
        ),
        LectureInteractiveQuiz(
          prompt: '√48\'in yaklaşık değerini hesaplamak için aşağıdakilerden hangisinin yaklaşık değeri bilinmelidir? (MEB Köklü Sayılar Testi)',
          options: [
            'A) √2',
            'B) √3',
            'C) √5',
            'D) √6',
            'E) √7'
          ],
          correctIndex: 1,
          explanation: 'Kök içindeki sayıyı çarpanlarına ayıralım:\n√48 = √(16 · 3) = 4 · √3\nBu ifadenin yaklaşık değerini bulmak için kök dışına çıkamayan √3 sayısının yaklaşık değerinin bilinmesi yeterlidir (√3 ≈ 1,732).',
          ruleTag: 'Köklü Sayılarda Yaklaşık Değer'
        ),
        LectureInteractiveQuiz(
          prompt: 'kök[ 7 - 2 √10 ] + kök[ 7 + 2 √10 ] işleminin sonucu kaçtır?',
          options: [
            'A) 2 √2',
            'B) 2 √5',
            'C) √5',
            'D) 4',
            'E) 2 √7'
          ],
          correctIndex: 1,
          explanation: 'Çarpımları 10, toplamları 7 olan sayılar 5 ve 2\'dir.\n1 · terim: √5 - √2\n2 · terim: √5 + √2\nToplam: [√5 - √2] + [√5 + √2] = 2 √5 bulunur.',
          ruleTag: 'İç İçe Kök Açılımı'
        )
      ]
    )
  ],
);

final LectureTopic matematikUsluKokluSayilar = matematikKonu5;
