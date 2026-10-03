// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu6 = LectureTopic(
  id: 'matematik_konu_6',
  courseId: 'matematik',
  order: 6,
  title: 'Denklemler, Çarpanlara Ayırma ve Oran - Orantı',
  subtitle: '1 · Dereceden Denklemler, Denklem Sistemleri, Özdeşlikler, İki Kare Farkı, Tam Kare, Orantı ve Ortalamalar',
  icon: Icons.shuffle,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 51 - 60',
  startTestNum: 51,
  endTestNum: 60,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'Birinci Dereceden Bir ve İki Bilinmeyenli Denklemler',
      type: LectureSectionType.overview,
      leadText: 'Bilinmeyenin derecesi 1 olan cebirsel eşitlikler ve denklem çözme yöntemleri (matematik1.pdf Bölüm 9 s. 63-68):',
      bulletPoints: [
        '▸ 1. Birinci Dereceden Bir Bilinmeyenli Denklemler (ax + b = 0):\n• Bilinenler bir tarafa, bilinmeyenler eşitliğin diğer tarafına toplanır.\n• Bir terim eşitliğin diğer tarafına geçerken işareti değişir (+ ise -, - ise + olur).\n• x yalnız bırakılır: ax = -b => x = -b / a.',
        '▸ 2. Çözüm Kümesinin Özel Durumları (ÖSYM Sık Sorar!):\n• Tek Çözüm (Ç.K = {x0}): a ≠ 0 ise denklemin tek bir reel kökü vardır.\n• Sonsuz Çözüm (Ç.K = R): a = 0 ve b = 0 ise (0x = 0 durumu) bütün reel sayılar denklemi sağlar.\n• Boş Küme (Ç.K = ∅): a = 0 ve b ≠ 0 ise (0x = 5 gibi çelişki durumu) denklemi sağlayan hiçbir reel sayı yoktur.',
        '▸ 3. Birinci Dereceden İki Bilinmeyenli Denklem Sistemleri:\n• a1 · x + b1 · y = c1 ve a2 · x + b2 · y = c2 sistemi için:\n• Yok Etme Metodu: Bilinmeyenlerden birinin katsayıları zıt işaretli ve eşitlenerek denklemler taraf tarafa toplanır.\n• Yerine Koyma Metodu: Bir bilinmeyen diğeri cinsinden çekilerek diğer denklemde yerine yazılır.\n• Sonsuz Çözüm Şartı: a1/a2 = b1/b2 = c1/c2 (Doğrular çakışıktır).\n• Boş Küme Şartı (Çözüm Yok): a1/a2 = b1/b2 ≠ c1/c2 (Doğrular paraleldir).\n• Tek Çözüm Şartı: a1/a2 ≠ b1/b2 (Doğrular tek bir noktada kesişir).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
x ve y sıfırdan farklı gerçel sayılar olmak üzere,
x + 1/y = 6
y + 1/x = 4
olduğuna göre, x / y oranı kaçtır?

💡 ÇÖZÜM:
1. Her iki denklemde paydaları eşitleyelim:
• (x · y + 1) / y = 6 ⇒ x · y + 1 = 6y
• (y · x + 1) / x = 4 ⇒ x · y + 1 = 4x
2. Dikkat edilirse her iki denklemin sol tarafları (xy + 1) birbirine eşittir!
3. Eşitliğin sağ taraflarını eşitleyelim:
6y = 4x
4. Buradan x / y oranını çekelim:
x / y = 6 / 4 = 3 / 2 bulunur.

🎯 PRATİK İPUCU: x + 1/y ve y + 1/x kalıbında payda eşitleyince paylar özdeş (xy + 1) çıkar; taraf tarafa böldüğünüzde oran doğrudan gelir!''',
      ],
      goldenRule: 'ax + b = 0 denkleminde "her x reel sayısı için sağlanıyor" deniyorsa a = 0 ve b = 0 olmak zorundadır! "Çözüm kümesi boş küme" deniyorsa a = 0 ve b ≠ 0 olmalıdır.',
      osymTrap: 'Paydasında bilinmeyen bulunan rasyonel denklemlerde (ör · 5 / (x - 2)), bulunan x değeri paydayı 0 yapıyorsa bu kök ÇÖZÜM KÜMESİNE ALINAMAZ (tanımsızlık yapar)!'
    ),
    LectureSection(
      title: 'Çarpanlara Ayırma Yöntemleri ve Özdeşlikler',
      type: LectureSectionType.formula,
      leadText: 'Bir cebirsel ifadeyi iki veya daha fazla ifadenin çarpımı biçiminde yazmaya çarpanlara ayırma denir. Önce ortak çarpan parantezine alma, ardından özdeşlikler uygulanır:',
      imageAssetPath: 'assets/images/matematik/carpan_agaci_sema.png',
      imageCaption: 'Çarpan Ağacı Yöntemiyle Çarpanlara Ayırma ve Tam Kare Özdeşliği Şeması',
      bulletPoints: [
        '''📝 ÇÖZÜMLÜ ÖRNEK:
Yukarıdaki şemada verilen:
169x²y² - 130x²y + 25x²
ifadesinin çarpan ağacındaki boş kutularını bulunuz.

💡 ADIM ADIM ÇÖZÜM:
1. Adım (Ortak Çarpan Parantezi - 1. Seviye Dallar):
Her terimde ortak olan x² çarpanını paranteze alalım:
169x²y² - 130x²y + 25x² = x² · (169y² - 130y + 25)
• Sol ana dalda x² verilmiştir.
• Dolayısıyla SAĞ ANA DALA (büyük boş kutu): 169y² - 130y + 25 = (13y - 5)² gelmelidir.

2. Adım (Sol Alt Dal):
x² ifadesi x · x şeklinde çarpanlarına ayrılır.
• İlk çarpan x olarak verilmiştir.
• Dolayısıyla SOL ALT BOŞ KUTUYA: x gelmelidir.

3. Adım (Sağ Alt Dal - Tam Kare Özdeşliği):
169y² - 130y + 25 üç terimlisini inceleyelim:
• 169y² = (13y)²
• 25 = 5²
• Çarpımlarının iki katı: 2 · (13y) · 5 = 130y (ortadaki terimi verir)
Dolayısıyla bu ifade bir tam karedir: (13y - 5)² = (13y - 5) · (13y - 5)
• İlk çarpan (13y - 5) olarak verilmiştir.
• Dolayısıyla SAĞ ALT BOŞ KUTUYA: 13y - 5 gelmelidir.

🎯 ÖZET:
• Sağ Ana Dal Kutusuna: 169y² - 130y + 25 veya (13y - 5)²
• Sol Alt Kutuya: x
• Sağ Alt Kutuya: 13y - 5''',
        '▸ 1. Ortak Çarpan Parantezine Alma:\n• Her terimde ortak bulunan çarpan paranteze alınır: a · x + a · y = a(x + y).',
        '▸ 2. Gruplandırma Yöntemi:\n• Dört veya daha fazla terimli ifadelerde ikişerli gruplar oluşturulur:\n• ax + ay + bx + by = a(x + y) + b(x + y) = (x + y)(a + b).',
        '▸ 3. İKİ KARE FARKI ÖZDEŞLİĞİ (EN ÇOK ÇIKAN KURAL):\n• a² - b² = (a - b) · (a + b)\n• Örnek: x² - 9 = (x - 3)(x + 3)\n• Örnek: 101^2 - 99^2 = (101 - 99)(101 + 99) = 2 · 200 = 400.',
        '▸ 4. Tam Kare Özdeşlikleri:\n• (a + b)² = a² + 2ab + b² (Birincinin karesi + birinciyle ikincinin çarpımının 2 katı + ikincinin karesi)\n• (a - b)² = a² - 2ab + b²\n• *Türetilmiş Formül:* a^2 + b^2 = (a + b)² - 2ab = (a - b)² + 2ab.',
        '▸ 5. x² + bx + c Üç Terimlisini Çarpanlara Ayırma:\n• Çarpımları c\'yi, toplamları b\'yi veren iki sayı m ve n olsun (m · n = c, m+n = b):\n• x² + bx + c = (x + m)(x + n).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
x - 1/x = 4
olduğuna göre, x² + 1/x² ifadesinin değeri kaçtır?

💡 ÇÖZÜM:
1. Verilen eşitliğin her iki tarafının karesini alalım:
(x - 1/x)² = 4²
2. Tam kare açılımını uygulayalım:
x² - 2 · x · (1/x) + (1/x)² = 16
3. Ortadaki x ile 1/x birbirini sadeleştirir ve -2 kalır:
x² - 2 + 1/x² = 16
4. -2'yi eşitliğin sağ tarafına atalım:
x² + 1/x² = 16 + 2 = 18 bulunur.

🎯 PRATİK İPUCU: (x - 1/x)² açılımında ortadaki terim daima sabit -2'dir; dolayısıyla x² + 1/x² = 4² + 2 = 18 pratikçe hesaplanır.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
x - 1/x = 3 olduğuna göre,
x² + 1/x² ve x³ - 1/x³ ifadelerinin değerleri kaçtır?

💡 ÇÖZÜM:
1. x² + 1/x² için her iki tarafın karesini alalım:
(x - 1/x)² = 3²
x² - 2 · x · (1/x) + 1/x² = 9
x² - 2 + 1/x² = 9 ⇒ x² + 1/x² = 11 bulunur.
2. x³ - 1/x³ için küp açılım formülünü kullanalım:
a³ - b³ = (a - b)³ + 3ab(a - b)
x³ - 1/x³ = (x - 1/x)³ + 3 · x · (1/x) · (x - 1/x)
= 3³ + 3 · (3) = 27 + 9 = 36 bulunur.

🎯 PRATİK İPUCU: (x - 1/x) karesi alınınca ortadaki çarpım terimi daima -2 sabit sayısı olur: Kareler toplamı = k² + 2'dir!''',
      ],
      goldenRule: 'İki kare farkı: a² - b² = (a - b)(a + b). Tam kare: (a + b)² = a² + 2ab + b² · Bu iki formülü birbirine karıştırmayınız!',
      osymTrap: 'a - b = -(b - a)\'dır; ancak karelerinde (a - b)² = (b - a)² eşittir!'
    ),
    LectureSection(
      title: 'Küp Açılımları ve Rasyonel Sadeleştirme',
      type: LectureSectionType.formula,
      leadText: 'Küp toplam ve farkı formülleri (matematik1.pdf s. 73-74):',
      bulletPoints: [
        '▸ 1. İki Küp Farkı ve Toplamı:\n• a³ - b³ = (a - b) · (a² + ab + b²)\n• a³ + b³ = (a + b) · (a² - ab + b²)',
        '▸ 2. İki Terimin Toplamının ve Farkının Küpü:\n• (a + b)³ = a³ + 3a²b + 3ab² + b³ = a³ + b³ + 3ab(a + b)\n• (a - b)³ = a^3 - 3a^2b + 3ab^2 - b^3 = a³ - b³ - 3ab(a - b)',
        '▸ 3. Rasyonel İfadelerin Sadeleştirilmesi:\n• Pay ve payda ayrı ayrı çarpanlarına ayrılır; ortak olan çarpanlar sadeleştirilir.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
[(x² - 16) / (x² + 4x)] · [(x² - 2x) / (x² - 6x + 8)]
ifadesinin en sade biçimini bulunuz.

💡 ÇÖZÜM:
1. Pay ve paydadaki ifadeleri tek tek çarpanlarına ayıralım:
• x² - 16 = (x - 4)(x + 4) (İki kare farkı)
• x² + 4x = x(x + 4) (Ortak parantez)
• x² - 2x = x(x - 2) (Ortak parantez)
• x² - 6x + 8 = (x - 4)(x - 2) (Üç terimli çarpan)
2. İfadeleri yerine yazalım:
[(x - 4)(x + 4) / x(x + 4)] · [x(x - 2) / (x - 4)(x - 2)]
3. Ortak çarpanları sadeleştirelim: (x+4), (x-4), (x-2) ve x sadeleşir.
4. Geriye yalnızca 1 kalır!

🎯 PRATİK İPUCU: Rasyonel sadeleştirmelerde çarpmayı yapmadan önce her kesrin pay ve paydasını en küçük çarpanlarına ayırın.''',
      ],
      goldenRule: 'a³ - b³ açılımındaki ikinci parantezde (a² + ab + b²) 2 çarpanı YOKTUR! Tam kare ile karıştırıp 2ab yazmayınız!',
      osymTrap: 'Sadeleştirme sorularında test tekniği olarak x yerine paydayı sıfır yapmayan basit bir sayı (örneğin 2 veya 0) verilerek seçenekler elenebilir.'
    ),
    LectureSection(
      title: 'Oran - Orantı ve Özellikleri',
      type: LectureSectionType.comparison,
      leadText: 'İki çokluğun bölme yoluyla karşılaştırılmasına oran, iki veya daha fazla oranın eşitliğine orantı denir (matematik1.pdf Bölüm 11 s. 75-78):',
      bulletPoints: [
        '▸ 1. Temel Orantı Özellikleri:\n• a/b = c/d = k (k = Orantı Sabiti)\n• İçler - Dışlar Çarpımı: a · d = b · c.\n• Payların toplamının paydaların toplamına oranı sabiti DEĞİŞTİRMEZ:\n  • (a + c) / (b + d) = k.\n• Oranlar genişletilip toplanırsa da k değişmez: (m · a + n · c) / (m · b + n · d) = k.',
        '▸ 2. Doğru Orantı:\n• İki çokluktan biri artarken diğeri de aynı oranda artıyorsa bu çokluklar DOĞRU ORANTILIDIR.\n• y ile x doğru orantılı ise: y / x = k veya y = k · x (Bölümleri sabittir).\n• Grafiği orijinden geçen düz bir doğrudur.',
        '▸ 3. Ters Orantı:\n• İki çokluktan biri artarken diğeri aynı oranda azalıyorsa bu çokluklar TERS ORANTILIDIR.\n• y ile x ters orantılı ise: x · y = k (Çarpımları sabittir).\n• Grafiği hiperboldür.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
a, b ve c sayıları sırasıyla 2, 3 ve 5 ile doğru orantılıdır.
a + 2b + 3c = 46
olduğuna göre, c sayısı kaçtır?

💡 ÇÖZÜM:
1. Doğru orantılı sayılar ortak bir orantı sabiti k cinsinden yazılır:
a = 2k, b = 3k, c = 5k.
2. Verilen denklemde yerine yazalım:
(2k) + 2·(3k) + 3·(5k) = 46
3. Katsayıları toplayalım:
2k + 6k + 15k = 46 ⇒ 23k = 46 ⇒ k = 2.
4. Bizden istenen c sayısıdır:
c = 5k = 5 · 2 = 10 bulunur.

🎯 PRATİK İPUCU: Doğru orantıda sayılara katsayısı kadar k (2k, 3k, 5k), ters orantıda ise k bölü katsayı (k/2, k/3, k/5) verin.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
Bir çiftlikteki koyun, inek ve keçilerin sayıları sırasıyla 3 ve 4 ile doğru, 2 ile ters orantılıdır.
Çiftlikteki toplam hayvan sayısı 150 olduğuna göre, kaç keçi vardır?

💡 ÇÖZÜM:
1. Doğru orantılı olanlar k sabiti ile çarpılır, ters orantılı olanlar k sabitine bölünür:
• Koyun sayısı = 3k
• İnek sayısı = 4k
• Keçi sayısı = k / 2
2. Toplam hayvan sayısı:
3k + 4k + k/2 = 150
7k + k/2 = 150 ⇒ 15k / 2 = 150
15k = 300 ⇒ k = 20 bulunur.
3. Keçi sayısı = k / 2 = 20 / 2 = 10 tanedir.

🎯 PRATİK İPUCU: Kesirle uğraşmamak için orantı sabitini paydanın katı (2k) seçebilirsiniz: Koyun = 6k, İnek = 8k, Keçi = k ⇒ 15k = 150 ⇒ k = 10!''',
      ],
      goldenRule: 'Doğru orantıda BÖLÜM sabittir (y/x = k); ters orantıda ÇARPIM sabittir (x · y = k)! İşçi sayısı ile işin bitme süresi ters orantılıdır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Doğru Orantı: Çokluklar aynı oranda artar/azalır (y / x = k) → Çapraz çarpım uygulanır',
          wrong: 'Doğru orantı kurarken karşılıklı düz çarpım yapmak (Düz çarpım yalnızca ters orantıda geçerlidir!)',
          note: 'Doğru orantıda a / b = c / d ise a · d = b · c (içler dışlar / çapraz çarpım) yapılır.'
        ),
        ComparisonRow(
          correct: 'Ters Orantı: Biri artarken diğeri aynı oranda azalır (x · y = k) → Karşılıklı düz çarpım uygulanır',
          wrong: 'Ters orantı problemlerinde çapraz çarpım yapmak (İşçi sayısı arttıkça süre azalır, düz çarpılmalıdır!)',
          note: 'Ters orantıda a · b = c · d şeklinde yan yana (karşılıklı) çarpım yapılarak denklem kurulur.'
        )
      ]
    ),
    LectureSection(
      title: 'Ortalamalar (Aritmetik, Geometrik, Harmonik)',
      type: LectureSectionType.formula,
      leadText: 'İstatistik ve problemlerde kullanılan ortalama çeşitleri (matematik1.pdf s. 79-80):',
      bulletPoints: [
        '▸ 1. Aritmetik Ortalama (A · O):\n• Sayıların toplamının sayı adedine bölünmesidir:\n• A · O = (x1 + x2 + ... + xn) / n\n• İki sayı için: (a + b) / 2.\n• Yaş ortalaması sorularında: Toplam Yaş = Kişi Sayısı . Yaş Ortalaması.',
        '▸ 2. Geometrik Ortalama (G · O):\n• n tane sayının çarpımının n · dereceden köküdür:\n• İki sayı için: G · O = √(a · b).\n• Üç sayı için: küp kök(a · b · c).',
        '▸ 3. Kritik Eşitlik:\n• İki pozitif sayının aritmetik ortalaması geometrik ortalamasına EŞİT İSE (A · O = G · O), bu iki sayı KESİNLİKLE BİRBİRİNE EŞİTTİR: a = b!'
      ],
      goldenRule: 'Aritmetik ortalama ile geometrik ortalama birbirine eşitse o sayılar KESİNLİKLE BİRBİRİNE EŞİTTİR (a = b)!',
      osymTrap: 'Gruptan bir kişi ayrıldığında yeni ortalamayı bulmak için toplam yaştan ayrılan kişinin yaşı çıkarılıp yeni kişi sayısına bölünür.'
    ),
    LectureSection(
      title: 'Denklemler, Çarpanlara Ayırma ve Orantı Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'MEB matematik1.pdf Bölüm 9, 10 ve 11 değerlendirme sınav soruları ve ayrıntılı çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '3 · (x - 3) = 2 · (8 - x) olduğuna göre x kaçtır? (MEB Bölüm 9 Testi Soru 1)',
          options: [
            'A) 6',
            'B) 5',
            'C) -3',
            'D) -1',
            'E) 0'
          ],
          correctIndex: 1,
          explanation: '1 · Parantezleri dağıtalım:\n3 · (x - 3) = 3x - 9\n2 · (8 - x) = 16 - 2x\n2 · Eşitliği kuralım:\n3x - 9 = 16 - 2x\n3 · Bilinenleri bir tarafa, bilinmeyenleri diğer tarafa alalım:\n3x + 2x = 16 + 9\n5x = 25\nx = 25 / 5 = 5 bulunur.',
          ruleTag: 'Birinci Dereceden Denklem Çözümü'
        ),
        LectureInteractiveQuiz(
          prompt: '3x - 7 = 5x + 9 denklemini sağlayan x değeri kaçtır? (MEB Bölüm 9 Testi Soru 4)',
          options: [
            'A) -8',
            'B) -6',
            'C) -1',
            'D) 1',
            'E) 8'
          ],
          correctIndex: 0,
          explanation: '1 · Bilinmeyenleri sağ tarafa, sayıları sol tarafa alalım:\n-7 - 9 = 5x - 3x\n-16 = 2x\nx = -16 / 2 = -8 bulunur.',
          ruleTag: 'Denklem Sadeleştirme'
        ),
        LectureInteractiveQuiz(
          prompt: '5 / (2x - 1) = 3 / (2 - x) olduğuna göre x kaçtır? (MEB Bölüm 9 Testi Soru 5)',
          options: [
            'A) 7',
            'B) 10/3',
            'C) 3',
            'D) 13/11',
            'E) 1/2'
          ],
          correctIndex: 3,
          explanation: '1. İçler - dışlar çarpımı yapalım:\n5 · (2 - x) = 3 · (2x - 1)\n10 - 5x = 6x - 3\n2 · x\'leri ve sayıları toplayalım:\n10 + 3 = 6x + 5x\n13 = 11x\nx = 13 / 11 bulunur.',
          ruleTag: 'Rasyonel Denklem ve İçler Dışlar'
        ),
        LectureInteractiveQuiz(
          prompt: '2 + [ 20 / (3 + 12 / (x - 1)) ] = 6 denklemini sağlayan x değeri kaçtır? (MEB Bölüm 9 Testi Soru 6)',
          options: [
            'A) 4',
            'B) 5',
            'C) 6',
            'D) 7',
            'E) 8'
          ],
          correctIndex: 3,
          explanation: 'Merdivenli denklemlerde dıştan içe doğru adım adım gidelim:\n1 · 2 + [ ... ] = 6 ise [ ... ] = 4 olmalıdır.\n2 · 20 / (3 + 12 / (x - 1)) = 4 ise payda: 3 + 12 / (x - 1) = 5 olmalıdır.\n3 · 3 + 12 / (x - 1) = 5 ise 12 / (x - 1) = 2 olmalıdır.\n4 · 12 / (x - 1) = 2 ise x - 1 = 6 olmalıdır.\n5 · x - 1 = 6 ise x = 7 bulunur.',
          ruleTag: 'Merdivenli Rasyonel Denklem'
        ),
        LectureInteractiveQuiz(
          prompt: 'x + y = 6 ve x · y = 4 olduğuna göre x² + y² toplamı kaçtır? (MEB Bölüm 10 Çarpanlara Ayırma)',
          options: [
            'A) 24',
            'B) 28',
            'C) 32',
            'D) 36',
            'E) 40'
          ],
          correctIndex: 1,
          explanation: 'Tam kare özdeşliğinden:\n(x + y)^2 = x^2 + 2xy + y^2\n6² = x² + y² + 2 · (4)\n36 = x² + y² + 8\nx² + y² = 36 - 8 = 28 bulunur.',
          ruleTag: 'Tam Kare Özdeşliği'
        ),
        LectureInteractiveQuiz(
          prompt: 'Birbirini çeviren iki dişli çarktan birinde 30 diş, diğerinde 45 diş vardır · Küçük çark 6 tur attığında büyük çark kaç tur atar? (MEB Bölüm 11 Oran-Orantı)',
          options: [
            'A) 3',
            'B) 4',
            'C) 5',
            'D) 8',
            'E) 9'
          ],
          correctIndex: 1,
          explanation: 'Diş sayısı ile tur sayısı TERS ORANTILIDIR (Çark büyüdükçe tur sayısı azalır).\nDiş . Tur = Sabit\n30 · 6 = 45 · x\n180 = 45 · x\nx = 180 / 45 = 4 tur atar.',
          ruleTag: 'Ters Orantı Problemi'
        )
      ]
    )
  ],
);

final LectureTopic matematikCarpanlaraAyirmaOranOranti = matematikKonu6;
