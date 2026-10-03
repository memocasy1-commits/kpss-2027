// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu3 = LectureTopic(
  id: 'matematik_konu_3',
  courseId: 'matematik',
  order: 3,
  title: 'Rasyonel Sayılar ve Ondalık Açılımlar',
  subtitle: 'Kesir Çeşitleri, Dört İşlem, Merdivenli Kesirler, Devirli Sayılar ve Sıralama Kuralları',
  icon: Icons.pie_chart_outline,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 21 - 30',
  startTestNum: 21,
  endTestNum: 30,
  estimatedMinutes: 45,
  sections: [
    LectureSection(
      title: 'Kesir Kavramı ve Çeşitleri',
      type: LectureSectionType.overview,
      leadText: 'a ve b birer tam sayı ve b ≠ 0 olmak üzere a/b ifadesine kesir denir (matematik1.pdf s. 31-33):',
      bulletPoints: [
        '▸ 1. Basit Kesir: Payının mutlak değeri paydasının mutlak değerinden KÜÇÜK olan kesirlerdir (|a| < |b|):\n• 1/2, 3/5, -2/7, 0/4.\n• Basit kesirler daima -1 ile +1 arasındadır: -1 < Basit Kesir < 1.',
        '▸ 2. Bileşik Kesir: Payının mutlak değeri paydasına eşit ya da paydasından BÜYÜK olan kesirlerdir (|a| ≥ |b|):\n• 4/3, 7/2, 5/5, -8/3.\n• Bileşik kesirler: Kesir ≥ 1 veya Kesir ≤ -1 aralığındadır.',
        '▸ 3. Tam Sayılı Kesir: Bir tam sayı ve bir basit kesirden oluşan kesirlerdir: A b/c = A + (b/c) = (A · c + b) / c.\n• ⚠️ DİKKAT: -2 tam 1/3 kesrinde eksi işareti tamamına aittir: -(2 + 1/3) = -7/3.',
        '▸ 4. Genişletme ve Sadeleştirme:\n• Kesrin pay ve paydası aynı sıfırdan farklı (k ≠ 0) sayıyla çarpılırsa genişler, bölünürse sadeleşir; kesrin sayısal değeri DEĞİŞMEZ.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
(2x - 5) / 7
ifadesi bir basit kesir olduğuna göre, x tam sayısının alabileceği kaç farklı değer vardır?

💡 ÇÖZÜM:
1. Basit kesir kuralı: |Pay| < |Payda| olmalıdır.
2. |2x - 5| < 7
3. Mutlak değer eşitsizliği açılır:
-7 < 2x - 5 < 7
4. Her tarafa 5 ekleyelim:
-2 < 2x < 12
5. Her tarafı 2'ye bölelim:
-1 < x < 6
6. x'in alabileceği tam sayı değerleri: {0, 1, 2, 3, 4, 5} olmak üzere 6 tanedir.

🎯 PRATİK İPUCU: Basit kesir sorularında eksi tarafı da unutmamak için daima -Payda < Pay < Payda eşitsizliğini kurun.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
Değeri 3/5 olan bir kesrin payına 4 eklenip paydasından 2 çıkarıldığında kesrin değeri 2/3 olmaktadır.
Buna göre, ilk kesrin pay ve paydasının toplamı kaçtır?

💡 ÇÖZÜM:
1. Değeri 3/5 olan kesrin payına 3k, paydasına 5k diyelim.
2. Verilen işlem: (3k + 4) / (5k - 2) = 2/3.
3. İçler dışlar çarpımı yapalım:
3 · (3k + 4) = 2 · (5k - 2)
9k + 12 = 10k - 4
10k - 9k = 12 + 4 ⇒ k = 16 bulunur.
4. İlk kesir: Pay = 3k = 3 · 16 = 48, Payda = 5k = 5 · 16 = 80.
5. Pay ve payda toplamı: 48 + 80 = 128 elde edilir.

🎯 PRATİK İPUCU: Kesir değeri verildiğinde kesri doğrudan 3/5 almak yerine daima katı olan 3k / 5k olarak kurgulayın!''',
      ],
      goldenRule: '0 / a = 0\'dır (a ≠ 0). Ancak a / 0 TANIMSIZDIR! 0 / 0 ise BELİRSİZDİR.',
      osymTrap: 'Negatif tam sayılı kesirlerde eksi işareti hem tam kısma hem kesir kısmına dağıtılır: -3 tam 1/2 = -3 - 1/2 = -7/2.'
    ),
    LectureSection(
      title: 'Rasyonel Sayılarda Dört İşlem ve Merdivenli Kesirler',
      type: LectureSectionType.formula,
      leadText: 'Rasyonel sayılarda işlem önceliği ve pratik hesaplama teknikleri (matematik1.pdf s. 34-35):',
      bulletPoints: [
        '▸ 1. Toplama ve Çıkarma:\n• Paydalar eşit değilse önce EKOK\'larında paydalar eşitlenir:\n• a/b ± c/d = (a · d ± b · c) / (b · d)',
        '▸ 2. Çarpma ve Bölme:\n• Çarpma: Pay ile pay, payda ile payda çarpılır: (a/b) · (c/d) = (a · c) / (b · d). İşlem öncesi sadeleştirme yapılır.\n• Bölme: Birinci kesir aynen yazılır, ikinci kesir TERS ÇEVRİLİP ÇARPILIR:\n• (a/b) ÷ (c/d) = (a/b) · (d/c) = (a · d) / (b · c)',
        '▸ 3. Ana Kesir Çizgisi Kuralı:\n• Ana kesir çizgisi daima "eşittir (=)" veya işlem işaretinin hizasındaki çizgidir.\n• a / (b/c) = a · (c/b) = (a · c) / b\n• (a/b) / c = (a/b) · (1/c) = a / (b · c)',
        '▸ 4. Sonsuz Merdivenli Kesirler:\n• Sonsuza giden merdivenli ifadede tekrar eden kalıba x denir ve ifadenin tamamı x\'e eşitlenerek denklem çözülür.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
1 + [ 1 / (1 - 1/3) ]
işleminin sonucu kaçtır?

💡 ÇÖZÜM:
1. En içteki/alttaki çıkarma işlemi yapılır:
1 - 1/3 = (3 - 1) / 3 = 2/3.
2. Kesir çizgisi ters çevirip çarpma kuralı uygulanır:
1 / (2/3) = 1 · (3/2) = 3/2.
3. Baştaki 1 tam sayısı eklenir:
1 + 3/2 = (2 · 1 + 3) / 2 = 5/2 bulunur.

🎯 PRATİK İPUCU: Merdivenli kesirlerde en içteki işlemi daire içine alıp adım adım dışarıya doğru ilerleyin.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
x = 3 + 4 / (3 + 4 / (3 + 4 / ...))
sonsuz devirli merdivenli kesrinin pozitif değeri kaçtır?

💡 ÇÖZÜM:
1. Sonsuz merdivenli kesirlerde tekrar eden parçaya ifadenin tamamı olan x atanır.
2. Kesrin paydasındaki (3 + 4 / ...) kalıbı da ifadenin aynısı olduğundan yerine x yazılır:
x = 3 + 4 / x
3. Her tarafı x ile çarpalım:
x² = 3x + 4
x² - 3x - 4 = 0
4. Çarpanlarına ayıralım: (x - 4)(x + 1) = 0 ⇒ x = 4 veya x = -1.
5. İşlemler pozitif sayılarla yapıldığından sonuç pozitif olmalıdır: x = 4 bulunur.

🎯 PRATİK İPUCU: Sonsuz tekrarlı kesirlerde sonsuza giden alt bloğu kutu içine alıp doğrudan kesrin ana eşitliğine (x) eşitleyin!''',
      ],
      goldenRule: 'Ana kesir çizgisini belirlemek hayati önem taşır: Eşittir (=) işaretinin tam karşısındaki çizgi ana kesir çizgisidir! Üstündeki pay, altındaki paydadır.',
      osymTrap: 'Merdivenli kesirlerde işleme en içteki/en alttaki basamaktan başlanarak adım adım yukarıya doğru çıkılır.'
    ),
    LectureSection(
      title: 'Ondalık ve Devirli Ondalık Sayılar',
      type: LectureSectionType.ruleList,
      leadText: 'Paydası 10\'un kuvveti olan veya devreden sayıların rasyonel gösterimi (matematik1.pdf s. 36-37):',
      bulletPoints: [
        '▸ 1. Ondalık Gösterim:\n• Paydası 10, 100, 1000 olan sayılardır:\n• 3/10 = 0,3;  7/100 = 0,07;  125/1000 = 0,125.\n• Ondalık sayılarda toplama ve çıkarma yapılırken virgüller alt alta hizalanır.',
        '▸ 2. Devirli Ondalık Açılımı Rasyonel Yapma Formülü:\n• Kesir = (Tüm Sayı - Devretmeyen Kısım) / (Virgülden sonraki devreden kadar 9, devretmeyen kadar 0)\n• Örnek 1: 0,3̅ (3 devirli) = (3 - 0) / 9 = 3/9 = 1/3\n• Örnek 2: 1,23̅ (3 devirli) = (123 - 12) / 90 = 111/90\n• Örnek 3: 2,45̅ (45 devirli) = (245 - 2) / 99 = 243/99',
        '▸ 3. Devreden Rakam 9 İse Pratik Kural:\n• Devreden rakam 9 ise bir önceki rakam 1 artırılır ve 9 atılır:\n• 0,9̅ = 1\n• 2,39̅ = 2,4\n• 4,9̅ = 5',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
x = 0,47̅ (yalnızca 7 devirli)
y = 0,23̅ (yalnızca 3 devirli)
olduğuna göre, x + y toplamı kaçtır?

💡 ÇÖZÜM:
1. x devirli sayısını rasyonel yapalım:
x = (47 - 4) / 90 = 43/90.
2. y devirli sayısını rasyonel yapalım:
y = (23 - 2) / 90 = 21/90.
3. Paydaları zaten eşit olduğundan doğrudan toplayalım:
x + y = (43 + 21) / 90 = 64/90.
4. Kesri 2 ile sadeleştirelim:
64 / 90 = 32 / 45 bulunur.

🎯 PRATİK İPUCU: Formül: (Tüm Sayı - Devretmeyen Kısım) / (Devreden kadar 9, devretmeyen kadar 0). Sadece virgülden sonrasına 9 ve 0 konur!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 7:
(0,004 / 0,02) + (0,15 / 0,005) - (0,8 / 0,04)
işleminin sonucu kaçtır?

💡 ÇÖZÜM:
1. Virgül Kaydırma Kuralı: Kesrin pay ve paydasında virgülden sonraki basamak sayıları sıfır eklenerek eşitlenir ve virgüller tamamen atılır:
• 0,004 / 0,02 = 0,004 / 0,020 = 4 / 20 = 1 / 5 = 0,2.
• 0,15 / 0,005 = 0,150 / 0,005 = 150 / 5 = 30.
• 0,8 / 0,04 = 0,80 / 0,04 = 80 / 4 = 20.
2. İşlemi toparlayalım:
0,2 + 30 - 20 = 10 + 0,2 = 10,2 (veya kesirli olarak 51 / 5).

🎯 PRATİK İPUCU: Ondalık bölmelerde basamak sayısı eksik olan tarafa sıfır ekleyip virgülleri kaldırın; kesirlerle uğraşmaktan çok daha hızlıdır!''',
      ],
      goldenRule: 'Devreden 9 ise bir önceki basamak 1 artırılır: 0,29̅ = 0,3; 1,9̅ = 2.',
      osymTrap: 'Formüldeki paydaya konulacak 9 ve 0 sayısı YALNIZCA virgülden sonraki kısma bakılarak belirlenir; virgülden önceki kısım paydayı etkilemez!'
    ),
    LectureSection(
      title: 'Kesirlerde Sıralama Kuralları',
      type: LectureSectionType.comparison,
      leadText: 'Kesirleri karşılaştırırken uygulanan 4 temel strateji (matematik1.pdf s. 38):',
      bulletPoints: [
        '▸ 1. Paydaları Eşit Olan Pozitif Kesirler: Payı büyük olan kesir DAİMA DAHA BÜYÜKTÜR (5/7 > 3/7 > 1/7).',
        '▸ 2. Payları Eşit Olan Pozitif Kesirler: Paydası KÜÇÜK olan kesir DAİMA DAHA BÜYÜKTÜR (7/2 > 7/3 > 7/5).',
        '▸ 3. Pay ile Payda Arasındaki Fark Eşit İse:\n• Basit Kesirlerde: Pay ve paydası büyük olan kesir DAHA BÜYÜKTÜR (99/100 > 9/10 > 2/3).\n• Bileşik Kesirlerde: Pay ve paydası küçük olan kesir DAHA BÜYÜKTÜR (3/2 > 10/9 > 100/99).',
        '▸ 4. Negatif Kesirlerde Sıralama:\n• Sayılar önce pozitifmiş gibi sıralanır, ardından eşitsizlik sembolü TAM TERSİNE çevrilir.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
a = 21/23, b = 41/43, c = 81/83
kesirlerini küçükten büyüğe doğru sıralayınız.

💡 ÇÖZÜM:
1. Pay ile payda arasındaki farkları inceleyelim:
23 - 21 = 2, 43 - 41 = 2, 83 - 81 = 2.
Tüm kesirlerde pay ile payda arasındaki fark 2'dir ve eşittir.
2. Kesirler pozitif basit kesirdir (|pay| < |payda|).
3. Altın Kural: Aralarındaki fark eşit olan pozitif basit kesirlerde terimleri büyük olan kesir DAHA BÜYÜKTÜR (Çünkü sayılar büyüdükçe 1 bütüne daha çok yaklaşır).
4. Buradan: 21/23 < 41/43 < 81/83 yani a < b < c bulunur.

🎯 PRATİK İPUCU: Payda eşitlemek çok büyük sayılar getirecekse hemen pay-payda farkını kontrol edin; farklar eşitse basit kesirlerde sayılar büyüdükçe kesir büyür!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 8:
a = 2023 / 2024, b = 2024 / 2025, c = 2025 / 2026
sayılarını küçükten büyüğe doğru sıralayınız.

💡 ÇÖZÜM:
1. Sayıların pay ve paydaları arasındaki farklara bakalım:
• 2024 - 2023 = 1
• 2025 - 2024 = 1
• 2026 - 2025 = 1
2. Bütün kesirler pozitif BASİT KESİRDİR (Pay < Payda) ve aralarındaki farklar eşittir (1).
3. Altın Sıralama Kuralı: Pay ve paydası arasındaki fark eşit olan pozitif basit kesirlerde payı (veya paydası) BÜYÜK olan kesir 1 bütüne daha yakın olduğundan DAİMA DAHA BÜYÜKTÜR!
4. Payları karşılaştıralım: 2023 < 2024 < 2025 olduğundan:
a < b < c sıralaması elde edilir.

🎯 PRATİK İPUCU: Pay-payda farkı eşit pozitif basit kesirlerde büyük sayılardan oluşan kesir daima daha büyüktür (Bileşik kesirlerde ise tam tersidir)!''',
      ],
      goldenRule: 'Farkı eşit basit kesirlerde sayılar büyüdükçe 1\'e yaklaşır, bu yüzden büyür (99/100 > 2/3). Bileşik kesirlerde ise sayılar büyüdükçe küçülür (3/2 > 100/99).',
      comparisonRows: [
        ComparisonRow(
          correct: 'Farkları Eşit Pozitif Basit Kesirler: 99/100 > 9/10 (Terimler büyüdükçe kesir 1\'e yaklaşır ve değeri BÜYÜR)',
          wrong: '9/10 > 99/100 (Hata: Pay ve paydası küçük olan basit kesri daha büyük sanmak!)',
          note: 'Basit kesirlerde (|pay| < |payda|) pay ile payda arasındaki fark eşitken terimler büyüdükçe kesir 1\'e yaklaşarak büyür.'
        ),
        ComparisonRow(
          correct: 'Farkları Eşit Pozitif Bileşik Kesirler: 3/2 > 100/99 (Terimler büyüdükçe kesir 1\'e yaklaşır ve değeri KÜÇÜLÜR)',
          wrong: '100/99 > 3/2 (Hata: Bileşik kesirlerde sayıların büyümesini kesrin büyümesi sanmak!)',
          note: 'Bileşik kesirlerde (|pay| ≥ |payda|) pay ile payda arasındaki fark eşitken terimler büyüdükçe kesir 1\'e yaklaşarak küçülür (1,5 > 1,01).'
        )
      ]
    ),
    LectureSection(
      title: 'Rasyonel Sayılar Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 4 değerlendirme soruları ve çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '[ (1/2 - 1/3) ÷ (1/4 + 1/6) ] işleminin sonucu kaçtır? (MEB Bölüm 4 Rasyonel Sayılar)',
          options: [
            'A) 2/5',
            'B) 1/2',
            'C) 3/5',
            'D) 4/5',
            'E) 1'
          ],
          correctIndex: 0,
          explanation: '1 · Parantez içi pay: 1/2 - 1/3 = (3 - 2) / 6 = 1/6.\n2 · Parantez içi payda: 1/4 + 1/6 = (3 + 2) / 12 = 5/12.\n3 · Bölme işlemi ters çevrilip çarpılır:\n(1/6) ÷ (5/12) = (1/6) · (12/5) = 12/30 = 2/5 bulunur.',
          ruleTag: 'Rasyonel Dört İşlem'
        ),
        LectureInteractiveQuiz(
          prompt: '(0,12 / 0,04) + (0,45 / 0,09) - (0,8 / 0,2) işleminin sonucu kaçtır? (MEB Bölüm 5 Ondalık Sayılar)',
          options: [
            'A) 2',
            'B) 3',
            'C) 4',
            'D) 5',
            'E) 6'
          ],
          correctIndex: 2,
          explanation: 'Ondalık kesirlerde bölme yapılırken virgülden sonraki basamak sayıları eşitlenerek virgüller kaldırılır:\n1 · 0,12 / 0,04 = 12/4 = 3\n2 · 0,45 / 0,09 = 45/9 = 5\n3 · 0,8 / 0,2 = 8/2 = 4\nİşlem: 3 + 5 - 4 = 4 bulunur.',
          ruleTag: 'Ondalık Sayılarda Bölme'
        ),
        LectureInteractiveQuiz(
          prompt: 'a = 11/13, b = 13/15, c = 15/17 sayılarının doğru sıralanışı aşağıdakilerden hangisidir? (MEB Bölüm 4 Sıralama)',
          options: [
            'A) a > b > c',
            'B) a > c > b',
            'C) b > c > a',
            'D) c > b > a',
            'E) c > a > b'
          ],
          correctIndex: 3,
          explanation: 'Tüm kesirler basit kesirdir ve her birinin pay ile paydası arasındaki fark 2\'dir (13 - 11 = 2, 15 - 13 = 2, 17 - 15 = 2).\nKural: Pay ile paydası arasındaki fark eşit olan pozitif basit kesirlerde payı ve paydası büyük olan kesir DAİMA daha büyüktür.\nBuna göre: 15/17 > 13/15 > 11/13 yani c > b > a bulunur.',
          ruleTag: 'Basit Kesirlerde Sıralama Kuralı'
        )
      ]
    )
  ],
);

final LectureTopic matematikRasyonelSayilar = matematikKonu3;
