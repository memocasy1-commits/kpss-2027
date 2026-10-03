// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu2 = LectureTopic(
  id: 'matematik_konu_2',
  courseId: 'matematik',
  order: 2,
  title: 'Bölünebilme Kuralları ve EBOB - EKOK',
  subtitle: 'Bölme İşlemi, Asal Sayılar, Bölen Sayıları, Bölünebilme Kuralları ve EBOB-EKOK Problemleri',
  icon: Icons.alt_route,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 11 - 20',
  startTestNum: 11,
  endTestNum: 20,
  estimatedMinutes: 55,
  sections: [
    LectureSection(
      title: 'Bölme Bağıntısı ve Asal Sayılar',
      type: LectureSectionType.overview,
      leadText: 'A sayısının B sayısına bölünmesinde bölüm C ve kalan K olsun (matematik1.pdf s. 19-21):',
      bulletPoints: [
        '▸ 1. Bölmenin Temel Kuralları:\n• A = B · C + K (Bölünen = Bölen · Bölüm + Kalan)\n• 0 ≤ K < B (Kalan daima sıfır veya sıfırdan büyük, BÖLENDEN KESİNLİKLE KÜÇÜKTÜR!).\n• K = 0 ise A sayısı B\'ye kalansız (tam) bölünür.\n• Kalan, bölümden de küçükse (K < C), bölen ile bölüm yer değiştirebilir.',
        '▸ 2. Asal Sayılar:\n• 1 ve kendisinden başka pozitif tam sayı böleni olmayan 1\'den büyük doğal sayılara ASAL SAYI denir.\n• Asal sayılar: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, ...\n• EN KÜÇÜK ASAL SAYI 2\'DİR · 2 dışında çift asal sayı YOKTUR!\n• 1 sayısı asal sayı DEĞİLDİR.',
        '▸ 3. Aralarında Asal Sayılar:\n• 1\'den başka ortak pozitif böleni olmayan sayılardır (Sayıların kendisinin asal olması gerekmez: Örn 8 ve 15 aralarında asaldır).\n• Ardışık iki pozitif tam sayı DAİMA aralarında asaldır: (n, n+1).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
Bir A doğal sayısı 12 ile bölündüğünde bölüm B, kalan 7'dir.
B sayısı 8 ile bölündüğünde kalan 3 olduğuna göre, A sayısının 16 ile bölümünden kalan kaçtır?

💡 ÇÖZÜM:
1. Birinci bölme bağıntısı: A = 12 · B + 7
2. İkinci bölme bağıntısı: B = 8 · k + 3 (k bir tam sayı)
3. B'yi birinci denklemde yerine yazalım:
A = 12 · (8k + 3) + 7 = 96k + 36 + 7 = 96k + 43
4. 96k terimi 16'nın tam katıdır (96 = 16 · 6). Dolayısıyla kalanı 43 sayısı belirler.
5. 43'ü 16'ya bölelim: 43 = 16 · 2 + 11.
6. Kalan 11 olarak bulunur.

🎯 PRATİK İPUCU: İç içe bölmelerde ikinci bölüneni ilk denklemde doğrudan yerine yazarak tek bir denklem elde edin.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
A ve B pozitif tam sayılarının 9 ile bölümünden kalanlar sırasıyla 4 ve 7'dir.
Buna göre, A² + 2AB + B ifadesinin 9 ile bölümünden kalan kaçtır?

💡 ÇÖZÜM:
1. Kalan Aritmetiği Kuralı: Bir ifadenin kalanını bulmak için sayıların kendileri yerine kalanları doğrudan yazılabilir.
2. A yerine 4, B yerine 7 yazalım:
• A² = 4² = 16
• 2AB = 2 · 4 · 7 = 56
• B = 7
3. Toplam = 16 + 56 + 7 = 79.
4. Çıkan 79 sayısını 9'a bölelim:
79 = 9 · 8 + 7 (Rakamlar toplamı: 7 + 9 = 16 ⇒ 1 + 6 = 7).
5. Kalan 7 olarak bulunur.

🎯 PRATİK İPUCU: Bölümünden kalan sorularında cebirsel ifadede harflerin yerine doğrudan verilen kalanları yazıp sonucu mod değerine bölün!''',
      ],
      goldenRule: 'Kalan daima bölenden küçüktür (K < B)! Bir sayının 12\'ye bölümünden kalan en fazla 11 olabilir.',
      osymTrap: 'Aralarında asal sayıların EBOB\'u daima 1\'dir, EKOK\'u ise bu iki sayının çarpımına eşittir: EBOB(a, b) = 1, EKOK(a, b) = a · b.'
    ),
    LectureSection(
      title: 'Asal Çarpanlara Ayırma ve Bölen Sayıları Formülleri',
      type: LectureSectionType.formula,
      leadText: 'Bir A doğal sayısı asal çarpanlarına ayrılsın: A = aˣ · bʸ · cᶻ (a, b, c farklı asallar):',
      bulletPoints: [
        '▸ 1. Pozitif Tam Sayı Bölenleri Sayısı (PBS):\n• PBS = (x + 1) · (y + 1) · (z + 1) (Üsler birer artırılıp çarpılır).\n• Örnek: 72 = 2^3 · 3^2 → PBS = (3 + 1)(2 + 1) = 4 · 3 = 12 tane.',
        '▸ 2. Tüm Tam Sayı Bölenleri Sayısı (TBS):\n• Negatif bölenler de dahil edildiğinden pozitif bölenlerin 2 katıdır:\n• TBS = 2 · PBS = 2 · (x + 1) · (y + 1) · (z + 1)\n• 72\'nin tüm tam sayı bölenleri: 2 · 12 = 24 tanedir.',
        '▸ 3. Asal Bölenlerin Sayısı ve Toplamı:\n• A\'nın asal bölenleri a, b, c olup 3 tanedir.\n• Asal olmayan pozitif bölen sayısı = PBS - 3\'tür.\n• Tüm tam sayı bölenlerinin toplamı DAİMA 0\'DIR (çünkü her +d böleninin bir de -d simetriği vardır).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
120 sayısının pozitif tam sayı bölenleri sayısı kaçtır ve bu bölenlerden kaç tanesi tek sayıdır?

💡 ÇÖZÜM:
1. 120 sayısını asal çarpanlarına ayıralım:
120 = 2³ · 3¹ · 5¹
2. Pozitif Bölen Sayısı (PBS) = Üsler birer artırılıp çarpılır:
PBS = (3 + 1) · (1 + 1) · (1 + 1) = 4 · 2 · 2 = 16 tanedir.
3. Tek bölen sayısı istendiğinde 2 çarpanı tamamen atılır, sadece tek asalların üsleri alınır:
3¹ · 5¹ ⇒ (1 + 1) · (1 + 1) = 2 · 2 = 4 tane tek pozitif böleni vardır.
(Geriye kalan 16 - 4 = 12 bölen ise çifttir).

🎯 PRATİK İPUCU: Tek bölen sayısı sorulduğunda 2 çarpanını devre dışı bırakın; çift bölen sayısı sorulduğunda tüm bölenlerden tek bölenleri çıkarın!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
360 sayısının pozitif tam sayı bölenlerinden kaç tanesi 3'ün tam katıdır?

💡 ÇÖZÜM:
1. 360 sayısını asal çarpanlarına ayıralım:
360 = 36 · 10 = (2² · 3²) · (2 · 5) = 2³ · 3² · 5¹.
2. Bir bölenin 3'ün katı olması için içinde en az bir tane 3 çarpanı bulunmalıdır.
3. Bu nedenle sayıyı 3 parantezine alıp dışarı bir 3 çarpanı kilitleriz:
360 = 3 · (2³ · 3¹ · 5¹)
4. Parantez içindeki sayının Pozitif Bölen Sayısını (PBS) hesaplayalım:
PBS = (3 + 1) · (1 + 1) · (1 + 1) = 4 · 2 · 2 = 16.
5. Dolayısıyla 360'ın pozitif bölenlerinden 16 tanesi 3'ün tam katıdır.

🎯 PRATİK İPUCU: 'k' sayısının katı olan bölenler sorulduğunda sayıyı k parantezine alın ve içeride kalan ifadenin pozitif bölen sayısını hesaplayın!''',
      ],
      goldenRule: 'Bir sayının tam sayı bölenlerinin toplamı sıfırdır! Eğer "asal olmayan tam sayı bölenlerinin toplamı" sorulursa cevap asal bölenlerinin toplamının EKSİLİSİDİR (-a - b - c).',
      osymTrap: 'Asal çarpanlara ayırmadan önce tabanların kesinlikle ASAL olduğundan emin olun! Örneğin 12³ ifadesi doğrudan (3+1) yapılamaz; önce 12 = 2² · 3 şeklinde asallara parçalanmalıdır: (2² · 3)^3 = 2^6 · 3^3.'
    ),
    LectureSection(
      title: 'Bölünebilme Kuralları Tablosu',
      type: LectureSectionType.ruleList,
      leadText: 'matematik1.pdf Bölüm 3 (s. 25-30) bölünebilme kuralları özeti:',
      bulletPoints: [
        '2 ile Bölünebilme: Birler basamağı çift rakam (0, 2, 4, 6, 8) olan sayılar 2 ile tam bölünür.',
        '3 ile Bölünebilme: Rakamları toplamı 3 veya 3\'ün katı olan sayılar 3 ile tam bölünür · Kalan, rakamlar toplamının 3\'e bölümünden kalandır.',
        '4 ile Bölünebilme: Son iki basamağı 00 veya 4\'ün katı (04, 08, 12, ..., 96) olan sayılar 4 ile tam bölünür.',
        '5 ile Bölünebilme: Birler basamağı 0 veya 5 olan sayılar 5 ile tam bölünür.',
        '8 ile Bölünebilme: Son üç basamağı 000 veya 8\'in katı olan sayılar 8 ile tam bölünür.',
        '9 ile Bölünebilme: Rakamları toplamı 9 veya 9\'un katı olan sayılar 9 ile tam bölünür.',
        '10 ile Bölünebilme: Birler basamağı 0 olan sayılar 10 ile tam bölünür · Birler basamağındaki rakam kalandır.',
        '11 ile Bölünebilme: Sayının rakamları birler basamağından başlanarak sola doğru sırasıyla (+, -, +, -, ...) işaretlenir · Artılıların toplamından eksililerin toplamı çıkarılır; fark 11\'in katı ise sayı 11\'e tam bölünür.',
        'Bileşik Sayıların Bölünebilme Kuralı (Aralarında Asal Çarpanlar):\n• 6 ile bölünebilme: Hem 2 hem 3\'e bölünenler\n• 12 ile bölünebilme: Hem 3 hem 4\'e bölünenler\n• 15 ile bölünebilme: Hem 3 hem 5\'e bölünenler\n• 18 ile bölünebilme: Hem 2 hem 9\'a bölünenler\n• 36 ile bölünebilme: Hem 4 hem 9\'a bölünenler\n• 45 ile bölünebilme: Hem 5 hem 9\'a bölünenler',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
Dört basamaklı 5a7b sayısı 36 ile tam bölünebildiğine göre, a'nın alabileceği değerler toplamı kaçtır?

💡 ÇÖZÜM:
1. 36 ile tam bölünebilme için sayı aralarında asal olan 4 ve 9 ile tam bölünmelidir.
2. Önce son iki basamağı ilgilendiren 4 kuralı uygulanır: 7b sayısı 4'ün katı olmalıdır ⇒ b = 2 veya b = 6.
3. Durum 1 (b = 2): Sayı 5a72 olur. 9 ile bölünmesi için rakamlar toplamı 9'un katı olmalıdır:
5 + a + 7 + 2 = 14 + a ⇒ a = 4.
4. Durum 2 (b = 6): Sayı 5a76 olur. Rakamlar toplamı:
5 + a + 7 + 6 = 18 + a ⇒ a = 0 veya a = 9.
5. a'nın alabileceği değerler: {0, 4, 9}.
6. Değerler toplamı: 0 + 4 + 9 = 13 bulunur.

🎯 PRATİK İPUCU: Bileşik kurallarda daima son basamakları bağlayan kuralı (4, 5, 8) önce, rakamlar toplamını bağlayan kuralı (3, 9) sonra uygulayın.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 7:
Beş basamaklı 4a53b sayısı 15 ile tam bölünebilmektedir.
a ≠ b olduğuna göre, a'nın alabileceği değerler toplamı kaçtır?

💡 ÇÖZÜM:
1. 15 ile bölünebilme kuralı: Sayı aralarında asal olan 3 ve 5 ile tam bölünmelidir.
2. Önce son basamağı bağlayan 5 kuralı uygulanır: b = 0 veya b = 5 olmalıdır.
3. Durum 1 (b = 0): Sayı 4a530 olur.
• 3 ile bölünmesi için rakamlar toplamı 3'ün katı olmalıdır:
4 + a + 5 + 3 + 0 = 12 + a ⇒ a ∈ {0, 3, 6, 9}.
• Ancak a ≠ b koşulundan a ≠ 0'dır ⇒ a ∈ {3, 6, 9}.
4. Durum 2 (b = 5): Sayı 4a535 olur.
• Rakamlar toplamı: 4 + a + 5 + 3 + 5 = 17 + a ⇒ a ∈ {1, 4, 7}.
• a ≠ 5 koşulu sağlanır (1, 4, 7).
5. a'nın tüm değerleri: {3, 6, 9, 1, 4, 7}.
6. Toplam: 3 + 6 + 9 + 1 + 4 + 7 = 30 bulunur.

🎯 PRATİK İPUCU: Bileşik kuralda önce son basamağı (5) sabitleyip iki ayrı dal açın ve soru kökündeki 'rakamları farklı / a ≠ b' tuzağına mutlaka dikkat edin!''',
      ],
      goldenRule: 'Bileşik bölünebilme sorularında (örneğin 36 ile bölünebilme: 4 ve 9), DAİMA ÖNCE son basamağı ilgilendiren kural (4 kuralı), EN SON ise tüm basamakları ilgilendiren kural (9 kuralı) uygulanır!',
      osymTrap: 'Bir sayının 15 ile bölümünden kalan 7 ise: 5 ile bölümünden kalan 7 mod 5 = 2; 3 ile bölümünden kalan 7 mod 3 = 1 olur · Bu mantık ÖSYM sorularının can damarıdır.'
    ),
    LectureSection(
      title: 'EBOB ve EKOK Özellikleri ve Problem Ayrımı',
      type: LectureSectionType.comparison,
      leadText: 'En Büyük Ortak Bölen (EBOB) ve En Küçük Ortak Kat (EKOK) prensipleri (matematik1.pdf s. 21-24):',
      bulletPoints: [
        '▸ 1. Temel EBOB - EKOK Bağıntıları:\n• İki pozitif tam sayı a ve b için:\n• a · b = EBOB(a, b). EKOK(a, b) (İki sayının çarpımı EBOB\'ları ile EKOK\'larının çarpımına eşittir).\n• a ve b aralarında asal ise: EBOB(a, b) = 1 ve EKOK(a, b) = a · b.\n• a sayısı b\'nin tam katı ise: EBOB(a, b) = küçük sayı (b), EKOK(a, b) = büyük sayı (a).',
        '▸ 2. EBOB Problemleri (Bütünden Parçaya - BÖLME):\n• Büyük çuvallardaki un/şekerlerin eşit hacimli küçük poşetlere paylaştırılması,\n• Dikdörtgen şeklindeki tarlanın çevresine eşit aralıklarla ağaç/direk dikilmesi,\n• Kumaş toplarının eşit uzunlukta parçalara kesilmesi.\n• Parola: Büyük parçalar BÖLÜNÜYORSA → EBOB kullanılır!',
        '▸ 3. EKOK Problemleri (Parçadan Bütüne - KATLANMA):\n• Küçük fayanslar/tuğlalar yan yana konularak kare zemin/küp oluşturulması,\n• Farklı aralıklarla çalan zillerin veya nöbet tutan asker/doktorların tekrar birlikte nöbet tutması,\n• Bilyelerin üçer, beşer, yedişer sayıldığında artması problemleri.\n• Parola: Küçük parçalar BİRLEŞİP BÜYÜYORSA → EKOK kullanılır!',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
Boyutları 24 m, 36 m ve 60 m olan bir deponun içine eşit hacimli küp şeklinde en az kaç koli yerleştirilebilir?

💡 ÇÖZÜM:
1. Koli sayısının EN AZ olması için küp kolinin bir ayrıtı EN BÜYÜK olmalıdır.
2. Küpün bir ayrıtı x = EBOB(24, 36, 60) olmalıdır.
3. EBOB(24, 36, 60) = 12 metredir.
4. Koli sayısı = (Depo Hacmi) / (Koli Hacmi)
Koli sayısı = (24 · 36 · 60) / (12 · 12 · 12) = 2 · 3 · 5 = 30 adet koli gerekir.

🎯 PRATİK İPUCU: Büyük bir hacmi küçük eş küplere bölme soruları klasik EBOB problemidir; ayrıtları tek tek EBOB'a bölüp sonuçları çarpın.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 8:
Bir sepetteki cevizler 5'er 5'er sayıldığında 3, 6'şar 6'şar sayıldığında 4, 8'er 8'er sayıldığında 6 ceviz artmaktadır.
Sepetteki ceviz sayısı 300'den fazla olduğuna göre, sepette EN AZ kaç ceviz vardır?

💡 ÇÖZÜM:
1. Ceviz sayısına A diyelim:
A = 5x + 3 = 6y + 4 = 8z + 6
2. Dikkat edilirse her bir bölenden kalan çıkarıldığında fark sabittir:
5 - 3 = 2, 6 - 4 = 2, 8 - 6 = 2.
3. Eşitliğin her tarafına 2 ekleyelim:
A + 2 = 5x + 5 = 6y + 6 = 8z + 8
A + 2 = 5(x + 1) = 6(y + 1) = 8(z + 1).
4. Yani (A + 2) sayısı 5, 6 ve 8'in ortak katıdır (EKOK):
EKOK(5, 6, 8) = 120.
5. A + 2 sayısı 120'nin katlarıdır: 120, 240, 360, ...
6. Ceviz sayısı 300'den fazla dendiğinden en küçük kat 360 seçilir:
A + 2 = 360 ⇒ A = 358 ceviz bulunur.

🎯 PRATİK İPUCU: Bölünen ile kalan arasındaki farklar eşitse (Bölen - Kalan = Sabit k), ifadenin tamamına bu k farkını ekleyip EKOK hesaplayın!''',
      ],
      goldenRule: 'Bütünü parçalıyorsan EBOB, parçaları birleştirip büyütüyorsan EKOK! Tarlaya ağaç dikiyorsan EBOB; ziller birlikte çalıyorsa EKOK!',
      comparisonRows: [
        ComparisonRow(
          correct: 'Parçalama / Paylaştırma (Çuvalları torbalara bölme) → EBOB',
          wrong: 'Parçalama probleminde EKOK kullanmak (Büyük parça küçültülürken EKOK alınmaz!)',
          note: 'Büyük parçaları eşit bölüyorsak EBOB; küçük parçaları birleştirip katlıyorsak EKOK kullanılır.'
        ),
        ComparisonRow(
          correct: 'Ağaç Sayısı = Bahçenin Çevresi / EBOB',
          wrong: 'Ağaç Sayısı = Çevre / EKOK (Aralıklar küçük parçadır, EKOK değil EBOB ile bölünür!)',
          note: 'Köşelere de dikilmek şartıyla çevre EBOB\'a bölünerek ağaç sayısı bulunur.'
        ),
        ComparisonRow(
          correct: 'Zemin Kaplama Fayans Sayısı = Büyük Alan / Küçük Alan',
          wrong: 'Zemin kaplamada adet bulurken Çevre / EBOB yapmak (Alan kaplamada çevre değil alan oranı alınır!)',
          note: '2 boyutlu alan kaplamasında (a · b) / (EBOB · EBOB) formülü toplam adedi verir.'
        )
      ]
    ),
    LectureSection(
      title: 'Bölünebilme ve EBOB-EKOK Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 2-3 çıkmış formatındaki sorular ve detaylı çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Bir bakkal 96 L su ve 108 L sütü birbirine karıştırmadan ve hiç artmayacak şekilde eşit hacimli en büyük şişelere dolduracaktır · Bu işlem için en az kaç şişe gerekir? (MEB Bölüm 2 EBOB Testi Soru 1)',
          options: [
            'A) 16',
            'B) 17',
            'C) 36',
            'D) 54',
            'E) 48'
          ],
          correctIndex: 1,
          explanation: 'Şişe sayısının en az olması için bir şişenin hacmi 96 ve 108\'in en büyük ortak böleni (EBOB) olmalıdır:\n1 · EBOB(96, 108) = 12 Litredir.\n2 · Su için gereken şişe sayısı = 96 / 12 = 8 adet.\n3 · Süt için gereken şişe sayısı = 108 / 12 = 9 adet.\n4 · Toplam şişe sayısı = 8 + 9 = 17 adet şişe gerekir.',
          ruleTag: 'EBOB ile Paylaştırma'
        ),
        LectureInteractiveQuiz(
          prompt: 'Boyutları 24 m ve 36 m olan dikdörtgen biçimindeki bir bahçenin çevresine ve köşelerine de dikilmek şartıyla eşit aralıklarla ağaç dikilecektir · En az kaç ağaç gerekir?',
          options: [
            'A) 8',
            'B) 10',
            'C) 12',
            'D) 14',
            'E) 16'
          ],
          correctIndex: 1,
          explanation: 'Ağaç sayısının en az olması için iki ağaç arasındaki mesafe EN BÜYÜK olmalıdır: EBOB(24, 36) = 12 m.\nBahçenin çevresi = 2 · (24 + 36) = 2 · 60 = 120 m.\nAğaç sayısı = Çevre / EBOB = 120 / 12 = 10 ağaç gerekir.',
          ruleTag: 'EBOB Bahçe Problemi'
        ),
        LectureInteractiveQuiz(
          prompt: 'Üç basamaklı 53a sayısı 5 ile tam bölünebildiğine göre a\'nın alabileceği değerler toplamı kaçtır? (MEB Bölüm 3 Bölünebilme Soru 1)',
          options: [
            'A) 5',
            'B) 0',
            'C) 6',
            'D) 9',
            'E) 12'
          ],
          correctIndex: 0,
          explanation: 'Bir sayının 5 ile tam bölünebilmesi için birler basamağının 0 veya 5 olması gerekir.\na rakamı 0 veya 5 olabilir.\na\'nın alabileceği değerler toplamı = 0 + 5 = 5 bulunur.',
          ruleTag: '5 İle Bölünebilme Kuralı'
        ),
        LectureInteractiveQuiz(
          prompt: 'Dört basamaklı 222c sayısı 4 ile tam bölünebildiğine göre c\'nin alabileceği değerler toplamı kaçtır? (MEB Bölüm 3 Bölünebilme Soru 3)',
          options: [
            'A) 0',
            'B) 4',
            'C) 8',
            'D) 12',
            'E) 16'
          ],
          correctIndex: 3,
          explanation: 'Bir sayının 4 ile tam bölünebilmesi için son iki basamağının 4\'ün katı olması gerekir.\nSon iki basamak 2c sayısıdır: 20, 24, 28 sayıları 4\'ün katıdır.\nBuna göre c rakamı 0, 4 veya 8 olabilir.\nc\'nin alabileceği değerler toplamı = 0 + 4 + 8 = 12 bulunur.',
          ruleTag: '4 İle Bölünebilme Kuralı'
        )
      ]
    )
  ],

);

final LectureTopic matematikBolmeEbobEkok = matematikKonu2;
