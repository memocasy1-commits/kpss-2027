// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu11 = LectureTopic(
  id: 'matematik_konu_11',
  courseId: 'matematik',
  order: 11,
  title: 'KPSS & MEB Geometri Rehberi',
  subtitle: 'Açılar, Üçgenler, Benzerlik, Dik Üçgen & Öklid, Çokgenler, Dörtgenler, Çember, Katı Cisimler ve Analitik Geometri',
  icon: Icons.square_foot,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 101 - 120',
  startTestNum: 101,
  endTestNum: 120,
  estimatedMinutes: 75,
  sections: [
    LectureSection(
      title: '1 · Doğruda Açılar ve Paralel Doğru Kuralları',
      type: LectureSectionType.overview,
      leadText: 'Paralel iki doğru arasındaki temel açı özellikleri ve pratik çözüm kuralları:',
      imageAssetPath: 'assets/images/geometry/geom_dogruda_acilar.png',
      imageCaption: 'Paralel Doğrularda Açı Kuralları (U, Z, M ve Kalem Ucu)',
      bulletPoints: [
        '▸ 1. Temel Açı Tanımları:\n• Dar Açı: 0° < α < 90°\n• Dik Açı: α = 90°\n• Geniş Açı: 90° < α < 180°\n• Doğru Açı: α = 180°\n• Tam Açı: α = 360°',
        '▸ 2. Tümler ve Bütünler Açılar:\n• Tümler: Ölçüleri toplamı 90° olan iki açıdır (α + β = 90°). Bir açının tümleri 90° - α\'dır.\n• Bütünler: Ölçüleri toplamı 180° olan iki açıdır (α + θ = 180°). Bir açının bütünleri 180° - α\'dır.',
        '▸ 3. Paralel Doğru Kuralları (d1 // d2):\n• Z Kuralı (İç Ters Açılar): Paraleller arasındaki zıt yönlü açılar birbirine eşittir (a = b).\n• U Kuralı (Karşı Durumlu Açılar): Birbirine bakan iki iç açının toplamı 180°\'dir (a + b = 180°).\n• M Kuralı: Sağa bakan açıların toplamı sola bakan açıya eşittir (a + c = b).\n• Kalem Ucu (Roket) Kuralı: Paraleller arasındaki 3 açının toplamı 360°\'dir (a + b + c = 360°).\n• Zikzak Kuralı: Sağa bakan dar açıların toplamı, sola bakan dar açıların toplamına eşittir.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
İki paralel doğru arasında kalan bir M kuralında sola bakan açılar 35° ve 45° olduğuna göre, sağa bakan aradaki x açısı kaç derecedir?

💡 ÇÖZÜM:
1. M Kuralı (Zikzak kuralı): Paralel iki doğru arasında aynı yöne bakan açıların toplamı, zıt yöne bakan açıların toplamına eşittir.
2. Sola bakan açılar: 35° ve 45°.
3. Sağa bakan açı: x.
4. x = 35° + 45° = 80° bulunur.

🎯 PRATİK İPUCU: Paralel doğrular arasında kırılma noktalarından ek bir paralel çizerek Z ve U kurallarıyla da kolayca sonuca ulaşabilirsiniz.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
d₁ ∥ d₂ olmak üzere, paralel iki doğru arasında sola bakan açılar 40° ve 55°, sağa bakan açı x° olduğuna göre (M Kuralı), x kaç derecedir?

💡 ÇÖZÜM:
1. Zikzak / M Kuralı: İki paralel doğru arasında aynı yöne bakan açıların toplamı, zıt yöne bakan açıların toplamına eşittir.
2. Sola bakan açılar = Sağa bakan açılar
40° + 55° = x°
x = 95° bulunur.

🎯 PRATİK İPUCU: M kuralında sivri ucun baktığı yön zıt yönlü iki açının toplamıdır!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec1_roket_kurali.png]
Şekildeki d₁ ve d₂ paralel doğruları arasında verilen açılara göre;
Kalem ucu (roket) kuralında üst açı 110°, alt açı 130° olduğuna göre aradaki x açısı kaç derecedir?

💡 ÇÖZÜM:
1. Kalem Ucu (Roket) Kuralı: İki paralel doğru arasında aynı yöne bakan 3 iç açının toplamı daima 360°'dir:
a + b + c = 360°
2. Bilinen açıları yazalım:
110° + x + 130° = 360°
240° + x = 360°
x = 360° - 240° = 120° bulunur.

🎯 PRATİK İPUCU: Kalem ucu kuralında kırılma noktasından bir yardımcı paralel doğru çizilirse iki adet U kuralı oluşur (70° + 50° = 120°) ve sonuç doğrulanır!''',
      ],
      goldenRule: 'Kırılma noktası içeren sorularda, verilen paralel doğrulara paralel olacak şekilde yeni bir YARDIMCI PARALEL DOĞRU çizin; soru anında U veya Z kuralına dönüşür.',
      osymTrap: 'Z veya M kuralı uygulayabilmek için doğruların PARALEL olduğu soru metninde açıkça belirtilmelidir.'
    ),
    LectureSection(
      title: '2. Üçgenler ve Açı Özellikleri',
      type: LectureSectionType.formula,
      leadText: 'Üçgenin iç ve dış açı bağıntıları ile kenarlarına göre açı özellikleri:',
      imageAssetPath: 'assets/images/geometry/geom_ucgende_acilar.png',
      imageCaption: 'Üçgende Açı Özellikleri ve İki İç Bir Dış Kuralı',
      bulletPoints: [
        '▸ 1. Temel Açı Bağıntıları:\n• Bir üçgenin iç açıları toplamı DAİMA 180°\'dir (A + B + C = 180°).\n• Bir üçgenin dış açıları toplamı DAİMA 360°\'dir.\n• 💡 İki İç Bir Dış Kuralı: Bir üçgende bir dış açının ölçüsü, kendisine komşu olmayan iki iç açının toplamına eşittir: d = a + b.',
        '▸ 2. Kenarlarına Göre Üçgenler:\n• İkizkenar Üçgen: Eşit kenarların karşısındaki taban açıları birbirine eşittir · Tepe açısından tabana inen dikme hem AÇIORTAY hem de KENARORTAYDIR (YAKİ kuralı).\n• Eşkenar Üçgen: Bütün kenar uzunlukları eşit ve bütün iç açıları 60°\'dir.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec2_iki_ic_bir_dis.png]
Bir ABC üçgeninde B açısı 50°, C açısı 65° olduğuna göre, A köşesine ait dış açının ölçüsü kaç derecedir?

💡 ÇÖZÜM:
1. İki İç Bir Dış Kuralı: Bir üçgende herhangi bir dış açının ölçüsü, kendisine komşu olmayan iki iç açının ölçüleri toplamına eşittir:
d_A = m(B) + m(C)
2. Değerleri toplayalım:
d_A = 50° + 65° = 115° bulunur.
(Veya iç açılar toplamından m(A) = 180° - 115° = 65°, dış açı = 180° - 65° = 115°).

🎯 PRATİK İPUCU: İki iç açıyı toplayıp komşu olmayan dış açıya eşitlemek, iç açıyı bulup 180'den çıkarmaktan 2 kat daha hızlıdır!''',
      ],
      goldenRule: 'Bir üçgende iki iç açının toplamı kendisine komşu olmayan bir dış açıya eşittir! Geometri sorularının büyük çoğunluğu bu kural ile çözülür.',
      osymTrap: 'İkizkenar üçgende eşit açıları belirlerken eşit olan kenarların KARŞISINDAKİ açılara bakınız.'
    ),
    LectureSection(
      title: '3. Üçgende Açı - Kenar Bağıntıları',
      type: LectureSectionType.ruleList,
      leadText: 'Kenar uzunlukları ile açı ölçüleri arasındaki ilişki ve üçgen eşitsizliği:',
      imageAssetPath: 'assets/images/geometry/custom_examples/concept_ucgende_aci_kenar.png',
      imageCaption: 'Üçgende Açı-Kenar Bağıntıları ve Üçgen Eşitsizliği Kuralı',
      bulletPoints: [
        '▸ 1. Açı - Kenar Sıralaması:\n• Bir üçgende büyük açı karşısında daima büyük kenar, küçük açı karşısında küçük kenar bulunur:\n• m(A) > m(B) > m(C) ≤> a > b > c.',
        '▸ 2. ÜÇGEN EŞİTSİZLİĞİ:\n• Bir üçgende herhangi bir kenarın uzunluğu, diğer iki kenarın farkının mutlak değerinden büyük, toplamından küçüktür:\n• |b - c| < a < b + c',
        '▸ 3. Açının 90° ile Karşılaştırılması:\n• m(A) = 90° ise: a² = b² + c² (Pisagor)\n• m(A) > 90° (Geniş Açı) ise: a² > b² + c²\n• m(A) < 90° (Dar Açı) ise: a² < b² + c²',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec3_genis_aci_kenar.png]
Bir ABC üçgeninde |AB| = 6 cm, |AC| = 8 cm ve m(A) > 90° (geniş açı) olduğuna göre, |BC| = x kenarının alabileceği tam sayı değerleri kaç tanedir?

💡 ÇÖZÜM:
1. 1. Kısıt (Üçgen Eşitsizliği):
|8 - 6| < x < 8 + 6 ⇒ 2 < x < 14
2. 2. Kısıt (Geniş Açı Şartı: m(A) > 90°):
A açısı 90° olsaydı Pisagor bağıntısından: x² = 6² + 8² = 100 ⇒ x = 10 olurdu.
A açısı geniş açı (> 90°) olduğundan hipotenüs 10'dan büyük olmalıdır:
x > 10
3. İki kısıtın ortak kesişim aralığı:
10 < x < 14
4. x'in alabileceği tam sayı değerleri: {11, 12, 13} olup 3 tanedir.

🎯 PRATİK İPUCU: Açının dar veya geniş olduğu belirtildiğinde önce 90° gibi Pisagor yapın (6-8-10); genişse x > 10, darsa x < 10 sınırını üçgen eşitsizliğiyle birleştirin!''',
      ],
      goldenRule: 'Bir kenarın alabileceği tam sayı değerleri sorulduğunda hem üçgen eşitsizliğini hem de varsa 90° kısıtını dikkate alıp ortak kesişim kümesini alınız.'
    ),
    LectureSection(
      title: '4. Üçgende Eşlik ve Benzerlik (Thales & Kelebek)',
      type: LectureSectionType.comparison,
      leadText: 'Benzer üçgenler, benzerlik oranı, Thales teoremi ve alan bağıntısı:',
      imageAssetPath: 'assets/images/geometry/geom_thales_benzerlik.png',
      imageCaption: 'Thales Benzerlik Teoremi ve Orantı',
      bulletPoints: [
        '▸ 1. Eşlik Aksiyomları (≅): İki üçgenin açıları ve karşılıklı kenar uzunlukları birebir eşitse bu üçgenler eştir (KAK, AKA, KKK).',
        '▸ 2. Benzerlik Teoremleri (~): Karşılıklı açıları eşit olan üçgenler benzerdir (A · A · A · benzerliği).\n• Temel Benzerlik (Thales): [DE] // [BC] ise: AD / AB = AE / AC = DE / BC = k (Benzerlik Oranı).\n• Kelebek (Kum Saati) Benzerliği: [AB] // [CD] ise: AB / CD = AE / ED = BE / EC = k.',
        '▸ 3. Benzerlik Oranı ve Alan İlişkisi (Çok Çıkar!):\n• Kenarlar oranı = Çevreler oranı = Yükseklikler oranı = k\n• Alanlar Oranı = k² (Benzerlik oranının karesine eşittir!).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
Bir ABC üçgeninde DE // BC olmak üzere, D noktası [AB] üzerinde, E noktası [AC] üzerindedir.
|AD| = 6 cm, |DB| = 3 cm ve |DE| = 8 cm olduğuna göre, |BC| taban uzunluğu kaç cm'dir?

💡 ÇÖZÜM:
1. DE // BC olduğundan ADE üçgeni ile ABC üçgeni A.A.A. kuralı gereği benzerdir (ADE ~ ABC).
2. Kenar oranı: |AD| / |AB| = |DE| / |BC|.
3. |AB| uzunluğu = |AD| + |DB| = 6 + 3 = 9 cm'dir.
4. Orantıyı kuralım: 6 / 9 = 8 / |BC|.
5. Sadeleştirelim: 2 / 3 = 8 / |BC| ⇒ 2 · |BC| = 24 ⇒ |BC| = 12 cm bulunur.

🎯 PRATİK İPUCU: Benzerlik oranını kurarken küçük parçayı (6) büyük parçaya (3) değil, daima TÜM KENARA (6+3=9) oranlayın!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec4_thales_alan.png]
Şekildeki Thales benzerliğinde [DE] // [BC] dir.
Alan(ADE) = 18 cm² ve Alan(BCED dörtgeni) = 32 cm² olduğuna göre, |DE| / |BC| benzerlik oranı kaçtır?

💡 ÇÖZÜM:
1. Büyük ABC üçgeninin toplam alanı:
Alan(ABC) = Alan(ADE) + Alan(BCED) = 18 + 32 = 50 cm²
2. Alanlar Oranı Kuralı: Benzer iki üçgenin alanları oranı, benzerlik oranının (k) karesine eşittir:
Alan(ADE) / Alan(ABC) = k²
18 / 50 = k² ⇒ 9 / 25 = k²
3. Her iki tarafın karekökünü alalım:
k = √(9 / 25) = 3 / 5
4. |DE| / |BC| = k = 3 / 5 bulunur.

🎯 PRATİK İPUCU: Parça alan verilmişse mutlaka önce büyük üçgenin TÜM alanını bulun; alan oranının karekökü doğrudan kenarlar benzerlik oranını verir!''',
      ],
      goldenRule: 'Benzerlik oranı k ise Alanlar Oranı k²\'dir! Örneğin benzerlik oranı 1/2 olan üçgenlerin alanları oranı (1/2)² = 1/4\'tür.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Benzerlikte Alanlar Oranı = (Benzerlik Oranı)² = k²',
          wrong: 'Alanlar Oranı = k (Hata: Benzerlik oranının karesi alınmazsa büyük hata yapılır!)',
          note: 'Benzerlik oranı k ise: Çevreler oranı k, Alanlar oranı k², Hacimler oranı k³\'tür.'
        ),
        ComparisonRow(
          correct: 'Özel Dik Üçgende (3-4-5, 5-12-13...): En büyük kenar DAİMA Hipotenüstür (90° karşısı)',
          wrong: 'Dik kenarları 3 ve 5 olan üçgenin diğer kenarını 4 kabul etmek (Hipotenüs 5 değilse 3-4-5 kuralı geçerli olmaz!)',
          note: 'Dik kenarlar 3 ve 5 ise hipotenüs √(3² + 5²) = √34 olur; 4 olamaz.'
        )
      ]
    ),
    LectureSection(
      title: '5. Üçgenin Yardımcı Elemanları (Açıortay, Kenarortay, Yükseklik)',
      type: LectureSectionType.formula,
      leadText: 'Açıortay bağıntısı, ağırlık merkezi özellikleri ve özel dikmeler:',
      imageAssetPath: 'assets/images/geometry/geom_ikizkenar_ucgen.png',
      imageCaption: 'İkizkenar Üçgen ve YAKİ Bağıntısı',
      bulletPoints: [
        '▸ 1. İç Açıortay Teoremi:\n• Açıortayın kollara oranı, tabanda ayırdığı parçaların oranına eşittir: c / b = x / y.\n• Açıortay üzerinden açının kollarına indirilen dikmeler birbirine EŞİTTİR.',
        '▸ 2. Kenarortay ve Ağırlık Merkezi (G):\n• Kenarortayların kesim noktasına üçgenin Ağırlık Merkezi (G) denir.\n• 1\'e 2 Kuralı: Ağırlık merkezi kenara 1 birim, köşeye 2 birim uzaklıktadır: AG = 2 · GD (Köşeye 2k, kenara k).\n• Kenarortaylar üçgenin alanını 6 eşit parçaya böler.',
        '▸ 3. YAKİ Kuralı: İkizkenar üçgende tabana inen dikme; Yükseklik, Açıortay, Kenarortay ve İkizkenarlık özelliklerinin dördünü de aynı anda sağlar.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec5_aciortay_teoremi.png]
ABC üçgeninde [AN] iç açıortaydır.
|AB| = 8 cm, |AC| = 12 cm ve |BC| = 15 cm olduğuna göre, |BN| kaç cm'dir?

💡 ÇÖZÜM:
1. İç Açıortay Teoremi: Açıortay, indiği tabanı komşu kenarların oranında böler:
|AB| / |AC| = |BN| / |NC|
2. Kenarları oranlayalım:
8 / 12 = 2 / 3.
3. O halde |BN| = 2k ve |NC| = 3k yazılır.
4. Tabanın tamamı |BC| = 2k + 3k = 5k = 15 cm ⇒ k = 3 cm.
5. |BN| = 2k = 2 · 3 = 6 cm bulunur.

🎯 PRATİK İPUCU: Açıortay tabanı kenarların oranıyla aynı oranda parçalar (Kolların oranı = Yolların oranı)!''',
      ],
      goldenRule: 'Soruda G noktası için "üçgenin ağırlık merkezidir" denmişse, hiç düşünmeden köşeden kenara 2k\'ya k oranını yazınız.'
    ),
    LectureSection(
      title: '6 · Dik Üçgen ve Pisagor Bağıntısı',
      type: LectureSectionType.formula,
      leadText: 'Dik üçgende hipotenüs bağıntısı ve kenarlarına göre özel dik üçgenler:',
      imageAssetPath: 'assets/images/geometry/geom_dik_ucgen_pisagor.png',
      imageCaption: 'Dik Üçgende Pisagor Teoremi (a² + b² = c²)',
      bulletPoints: [
        '▸ 1. Pisagor Teoremi: Dik kenarları a ve b, hipotenüsü c olan dik üçgende: a² + b² = c².',
        '▸ 2. Kenarlarına Göre Özel Dik Üçgenler (EZBERLE!):\n• 3 - 4 - 5 Üçgeni (Katları: 6-8-10, 9-12-15, 12-16-20, 15-20-25)\n• 5 - 12 - 13 Üçgeni (Katları: 10-24-26)\n• 8 - 15 - 17 Üçgeni\n• 7 - 24 - 25 Üçgeni\n• k - 2k - k√5 Üçgeni (Dik kenarlardan biri diğerinin 2 katı ise hipotenüs küçük kenarın √5 katıdır).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
Bir ABC dik üçgeninde dik kenarlar |AB| = 9 cm ve |AC| = 12 cm'dir. Hipotenüse ait [AH] yüksekliğinin uzunluğu kaç cm'dir?

💡 ÇÖZÜM:
1. Hipotenüsü bulalım: 9 - 12 - 15 üçgenidir (3-4-5 üçgeninin 3 katı: 3·3, 4·3, 5·3). Yani hipotenüs a = 15 cm'dir.
2. Alan bağıntısından gelen Öklid kuralı: İki dik kenarın çarpımı, hipotenüs ile yüksekliğin çarpımına eşittir:
b · c = a · h
3. Sayıları yazalım: 9 · 12 = 15 · h
108 = 15 · h ⇒ h = 108 / 15 = 36 / 5 = 7,2 cm bulunur.

🎯 PRATİK İPUCU: b · c = a · h alan bağıntısı ÖSYM'nin dik üçgen alan ve yükseklik sorularında en hızlı çözüm yoludur.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec6_pisagor_muhtesem_uclu.png]
Şekildeki dik üçgende dik kenarlar |AB| = 7 cm ve |AC| = 24 cm olduğuna göre, hipotenüs |BC| kaç cm'dir ve hipotenüse ait kenarortay uzunluğu nedir?

💡 ÇÖZÜM:
1. Özel Dik Üçgen Kuralı: Kenarları tam sayı olan 7 - 24 - 25 özel üçgenidir:
|BC|² = 7² + 24² = 49 + 576 = 625 ⇒ |BC| = 25 cm'dir.
2. Muhteşem Üçlü Kuralı: Bir dik üçgende dik açıdan hipotenüse çizilen kenarortay uzunluğu, hipotenüsün yarısına eşittir:
V_a = |BC| / 2 = 25 / 2 = 12,5 cm bulunur.

🎯 PRATİK İPUCU: 3-4-5, 5-12-13, 8-15-17 ve 7-24-25 kalıplarını ezberleyin; kare alıp toplamakla vakit kaybetmeyin!''',
      ],
      goldenRule: 'Pisagor hesaplamadan önce kenarları sadeleştirip 3-4-5 veya 5-12-13 katı olup olmadığını mutlaka kontrol ediniz.',
      osymTrap: 'Özel üçgenlerde en büyük sayının daima HİPOTENÜS (90° karşısı) olması gerekir (örneğin dik kenarları 3 ve 5 olan üçgenin hipotenüsü 4 değil √34\'tür).'
    ),
    LectureSection(
      title: '7 · Açılarına Göre Özel Dik Üçgenler ve Trigonometrik Oranlar',
      type: LectureSectionType.formula,
      leadText: 'Sık kullanılan özel açılı dik üçgen bağıntıları ve dar açıların trigonometrik oranları:',
      imageAssetPath: 'assets/images/geometry/geom_30_60_90.png',
      imageCaption: '30°-60°-90° ve 45°-45°-90° Özel Dik Üçgenleri',
      bulletPoints: [
        '▸ 1. 30° - 60° - 90° Üçgeni:\n• 30°\'nin karşısındaki kenar a ise;\n• Hipotenüs (90° karşısı) = 2a\n• 60°\'nin karşısındaki kenar = a√3',
        '▸ 2. 45° - 45° - 90° İkizkenar Dik Üçgeni:\n• Dik kenarlar a ve a ise;\n• Hipotenüs = a√2',
        '▸ 3. 15° - 75° - 90° Üçgeni:\n• Hipotenüse indirilen yükseklik hipotenüsün 1/4\'üdür: h = c / 4.',
        '▸ 4. Muhteşem Üçlü:\n• Dik açıdan hipotenüse indirilen kenarortay, ayırdığı parçaların uzunluğuna eşittir: Dikten inen kenarortay = c / 2.',
        '▸ 5. Dar Açıların Trigonometrik Oranları (MEB Müfredatı):\n• sin(α): Karşı Dik Kenar / Hipotenüs\n• cos(α): Komşu Dik Kenar / Hipotenüs\n• tan(α): Karşı Dik Kenar / Komşu Dik Kenar\n• cot(α): Komşu Dik Kenar / Karşı Dik Kenar\n• Özel Açı Değerleri:\n  - sin(30°) = cos(60°) = 1/2\n  - sin(60°) = cos(30°) = √3/2\n  - sin(45°) = cos(45°) = √2/2\n  - tan(45°) = cot(45°) = 1\n  - tan(30°) = cot(60°) = √3/3, tan(60°) = cot(30°) = √3\n• Tümler Açılar Bağıntısı: Birbirini 90°\'ye tamamlayan açıların sinüsü kosinüsüne, tanjantı kotanjantına eşittir (sin 20° = cos 70°, tan 35° = cot 55°).',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec7_30_60_90.png]
Bir ABC dik üçgeninde m(B) = 90°, m(C) = 30° ve 60°'lik açının karşısındaki kenar |AB| = 6√3 cm olduğuna göre, hipotenüs |AC| kaç cm'dir?

💡 ÇÖZÜM:
1. 30° - 60° - 90° Özel Üçgen Bağıntıları:
• 30°'nin karşısı = x
• 60°'nin karşısı = x√3
• 90°'nin karşısı (Hipotenüs) = 2x
2. Soruda 60°'nin karşısı verilmiştir:
x√3 = 6√3 ⇒ x = 6 cm (30°'nin karşısı).
3. Hipotenüs 30°'nin karşısının 2 katıdır:
|AC| = 2x = 2 · 6 = 12 cm bulunur.

🎯 PRATİK İPUCU: 30-60-90 üçgeninde daima 30°'nin karşısını baz alın (x); 60°'nin karşısı x√3, hipotenüs ise 2x'tir!''',
      ],
      goldenRule: 'Birbirini 90°\'ye tamamlayan iki açının sinüsü kosinüsüne, tanjantı kotanjantına eşittir: α + β = 90° ise sin α = cos β ve tan α = cot β!',
      osymTrap: 'Soruda 30°, 45° veya 60° açı gördüğünüzde bu açıların karşısına DİKME İNDİREREK özel üçgen oluşturunuz.'
    ),
    LectureSection(
      title: '8. Öklid Bağıntıları (Dikten Dik İnmişse)',
      type: LectureSectionType.formula,
      leadText: 'Hipotenüse ait yükseklik ve kenar bağıntıları:',
      imageAssetPath: 'assets/images/geometry/geom_oklid_bagintisi.png',
      imageCaption: 'Öklid Yükseklik ve Kenar Bağıntıları',
      bulletPoints: [
        '▸ 1. Yükseklik Bağıntısı (h² = p · k):\n• Hipotenüse inen yüksekliğin karesi, tabanda ayırdığı parçaların çarpımına eşittir: h² = p · k.',
        '▸ 2. Yan Kenar Bağıntıları:\n• b² = k · a (Sağ dik kenarın karesi = kendi tarafındaki parça · hipotenüsün tamamı)\n• c² = p · a (Sol dik kenarın karesi = kendi tarafındaki parça · hipotenüsün tamamı)',
        '▸ 3. Alan Eşitliği Bağıntısı:\n• a · h = b · c (Hipotenüs. Yükseklik = Dik kenarların çarpımı).',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec8_oklid_h2_pk.png]
ABC dik üçgeninde [AB] ⊥ [AC] ve hipotenüse inen dikme [AH] ⊥ [BC]'dir.
|BH| = 4 cm ve |HC| = 9 cm olduğuna göre:
a) [AH] yüksekliği h kaç cm'dir?
b) |AB| = c dik kenarı kaç cm'dir?

💡 ÇÖZÜM:
1. Öklid Yükseklik Bağıntısı: h² = p · k
h² = 4 · 9 = 36 ⇒ h = 6 cm'dir.
2. Öklid Yan Kenar Bağıntısı: c² = p · a (Kendine yakın parça çarpı hipotenüsün tamamı):
Hipotenüs a = 4 + 9 = 13 cm.
c² = 4 · 13 = 52 ⇒ c = √52 = 2√13 cm bulunur.

🎯 PRATİK İPUCU: Dikten dik inildiğini gördüğünüz an soru Öklid'dir! h² = p·k ve c² = p·a formüllerini doğrudan uygulayın!''',
      ],
      goldenRule: 'Dikten dik inmişse kesinlikle ÖKLİD vardır! h² = p · k formülünü aklınızdan çıkarmayın.',
      osymTrap: 'Öklid formülünü uygulayabilmek için tepe açısının KESİNLİKLE 90° olması gerekir; tepede diklik yoksa Öklid uygulanamaz.'
    ),
    LectureSection(
      title: '9. Üçgenin Alanı ve Alan Bağıntıları',
      type: LectureSectionType.formula,
      leadText: 'Taban-yükseklik, sinüslü alan, Heron U formülü ve oranlı alan paylaşımı:',
      imageAssetPath: 'assets/images/geometry/custom_examples/concept_ucgenin_alani.png',
      imageCaption: 'Üçgende Alan Bağıntıları, Taban-Yükseklik ve Sinüslü Alan Formülü',
      bulletPoints: [
        '▸ 1. Temel Alan Formülü:\n• Alan = (Taban · Yükseklik) / 2 = (a · ha) / 2\n• Dik üçgende: Alan = (Dik kenarlar çarpımı) / 2 = (a · b) / 2.',
        '▸ 2. Eşkenar Üçgenin Alanı:\n• Bir kenarı a olan eşkenar üçgenin alanı: Alan = (a²√3) / 4.',
        '▸ 3. Sinüslü Alan Formülü:\n• İki kenar ve aralarındaki açı biliniyorsa: Alan = (1/2) · a · b · sin(C).',
        '▸ 4. Heron (Üç Kenarı Verilen) Alan Formülü:\n• u = (a + b + c) / 2 (Yarı Çevre)\n• Alan = √[ u(u - a)(u - b)(u - c) ].',
        '▸ 5. Alan Dağılım Kuralı:\n• Yükseklikleri eşit olan üçgenlerin alanları taban uzunluklarıyla doğru orantılıdır (Tabanı 2k olanın alanı 2S, 3k olanın alanı 3S\'tir).',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec9_sinuslu_alan.png]
Bir ABC üçgeninde |AB| = 8 cm, |AC| = 10 cm ve aralarındaki açı m(A) = 30° olduğuna göre, Alan(ABC) kaç cm²'dir?

💡 ÇÖZÜM:
1. Sinüslü Alan Formülü: İki kenar ve aralarındaki açı biliniyorsa:
Alan = (1/2) · b · c · sin(α)
2. sin(30°) = 1/2 değerini yerine yazalım:
Alan = (1/2) · 8 · 10 · sin(30°)
Alan = 40 · (1/2) = 20 cm² bulunur.

🎯 PRATİK İPUCU: Yükseklik çizilemeyen iki kenar ve açı sorularında sinüslü alan formülü (1/2 · a · b · sinα) en pratik kurtarıcıdır!''',
      ],
      goldenRule: 'Eşkenar üçgenin alanı: a²√3 / 4 · Yükseklikleri aynı olan üçgenlerin alanları tabanlarıyla orantılıdır.'
    ),
    LectureSection(
      title: '10. Çokgenler ve Düzgün Altıgen',
      type: LectureSectionType.overview,
      leadText: 'Dışbükey çokgen açı ve köşegen bağıntıları ile düzgün çokgen özellikleri:',
      imageAssetPath: 'assets/images/geometry/geom_duzgun_altigen.png',
      imageCaption: 'Düzgün Altıgen Yapısı ve Köşegen Bağıntıları',
      bulletPoints: [
        '▸ 1. n Kenarlı Dışbükey Çokgen Kuralları:\n• İç Açılar Toplamı: (n - 2) · 180°\n• Dış Açılar Toplamı: Bütün dışbükey çokgenlerde DAİMA 360°\'dir.\n• Bir köşeden çizilen köşegen sayısı: n - 3\n• Bir köşeden çizilen üçgen sayısı: n - 2\n• Toplam Köşegen Sayısı: [ n(n - 3) ] / 2.',
        '▸ 2. Düzgün Çokgenler:\n• Bir Dış Açı = 360° / n (Dış açı üzerinden işlem yapmak en kolay yoldur!).\n• Bir İç Açı = 180° - Dış Açı.',
        '▸ 3. Düzgün Beşgen (n = 5):\n• Bir dış açı: 72°, bir iç açı: 108°.\n• Bütün köşegen uzunlukları birbirine eşittir.',
        '▸ 4. Düzgün Altıgen (n = 6):\n• Bir dış açı: 60°, bir iç açı: 120°.\n• Düzgün altıgen 6 tane eşkenar üçgenden oluşur: Alan = 6 · (a²√3 / 4).\n• Uzun köşegen = 2a, Kısa köşegen = a√3.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec10_duzgun_altigen.png]
Bir kenar uzunluğu a = 4 cm olan düzgün altıgenin:
a) En uzun köşegeninin uzunluğu kaç cm'dir?
b) Alanı kaç cm²'dir?

💡 ÇÖZÜM:
1. Düzgün Altıgen Köşegen Kuralı: Karşılıklı köşeleri birleştiren en uzun ana köşegen bir kenarın 2 katıdır:
Köşegen = 2a = 2 · 4 = 8 cm'dir.
2. Düzgün Altıgen Alan Kuralı: Düzgün altıgen 6 adet eşkenar üçgenin birleşiminden oluşur:
Alan = 6 · (a²√3 / 4)
Alan = 6 · (4²√3 / 4) = 6 · (16√3 / 4) = 6 · 4√3 = 24√3 cm² bulunur.

🎯 PRATİK İPUCU: Düzgün altıgen sorularında altıgeni 6 eş eşkenar üçgene bölerek hem alan hem de uzunluk sorularını saniyeler içinde çözebilirsiniz!''',
      ],
      goldenRule: 'Düzgün çokgen sorularında iç açı formülü yerine önce DIŞ AÇIYI (360° / n) bulun; iç açı = 180° - Dış Açı. Bu yöntem hata payını sıfırlar.'
    ),
    LectureSection(
      title: '11 · Dörtgenler, Yamuk ve Paralelkenar',
      type: LectureSectionType.formula,
      leadText: 'Yamuk, paralelkenar, eşkenar dörtgen, dikdörtgen ve kare özellikleri:',
      imageAssetPath: 'assets/images/geometry/geom_paralelkenar_alan.png',
      imageCaption: 'Paralelkenar ve Özel Dörtgenlerde Alan Hesabı',
      bulletPoints: [
        '▸ 1. Yamuk: Yalnızca iki kenarı paralel olan dörtgendir ([AB] // [DC]).\n• Orta Taban: (Alt taban + Üst taban) / 2 = (a + c) / 2\n• Yamuğun Alanı: [ (a + c) / 2 ] . h = Orta Taban · Yükseklik\n• İkizkenar yamukta taban açıları eşittir ve köşegen uzunlukları birbirine eşittir.',
        '▸ 2. Paralelkenar: Karşılıklı kenarları paralel ve eşittir · Karşılıklı açıları eşittir; ardışık açılar toplamı 180°\'dir. Köşegenler birbirini ortalar.\n• Alan = Taban · Yükseklik = a · ha.',
        '▸ 3. Eşkenar Dörtgen: Bütün kenarları eşittir · Köşegenler BİRBİRİNİ DİK KESER ve AÇIORTAYDIR.\n• Alan = (e · f) / 2 (Köşegenler çarpımının yarısı).',
        '▸ 4. Dikdörtgen ve Kare:\n• Dikdörtgen Alanı = a · b, Çevresi = 2(a + b), Köşegen = √(a² + b²).\n• Kare Alanı = a² = e² / 2, Köşegen = a√2.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 7:
Alt tabanı 18 cm ve üst tabanı 8 cm olan bir yamuğun orta taban uzunluğu ile köşegenleri arasında kalan parçanın uzunluğu kaç cm'dir?

💡 ÇÖZÜM:
1. Yamukta Orta Taban Kuralı:
Orta Taban = (Alt Taban + Üst Taban) / 2
= (18 + 8) / 2 = 26 / 2 = 13 cm'dir.
2. Köşegenler Arasında Kalan Parça Kuralı:
Köşegenlerin orta taban üzerinde ayırdığı parça = |Alt Taban - Üst Taban| / 2
= (18 - 8) / 2 = 10 / 2 = 5 cm bulunur.

🎯 PRATİK İPUCU: Yamukta orta taban tabanların toplamının yarısıdır; köşegenler arası mesafe ise farklarının yarısıdır!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec11_paralelkenar_alan.png]
Bir ABCD paralelkenarında taban kenarı |AB| = 12 cm ve bu kenara ait yükseklik h = 7 cm'dir.
Bu paralelkenarın alanı kaç cm²'dir ve köşegenlerin ayırdığı 4 üçgenden birinin alanı nedir?

💡 ÇÖZÜM:
1. Paralelkenar Alan Formülü: Taban çarpı o tabana ait yüksekliktir:
Alan(ABCD) = a · h = 12 · 7 = 84 cm²'dir.
2. Köşegenler Alan Özelliği: Bir paralelkenarın iki köşegeni paralelkenarı eşit alana sahip 4 üçgensel bölgeye ayırır:
Her bir üçgenin alanı = Alan(ABCD) / 4 = 84 / 4 = 21 cm² bulunur.

🎯 PRATİK İPUCU: Paralelkenarda üçgende olduğu gibi 1/2 çarpanı yoktur; doğrudan Taban · Yükseklik hesaplanır!''',
      ],
      goldenRule: 'Köşegenleri DİK kesişen dörtgenlerde (Eşkenar Dörtgen, Kare, Deltoid) Alan = (e · f) / 2 formülüyle hesaplanır!',
      osymTrap: 'Paralelkenarda köşegenler dik kesişmez ve açıortay değildir (yalnızca eşkenar dörtgen ve karede dik kesişip açıortay olurlar).'
    ),
    LectureSection(
      title: '12. Çember ve Daire (Açılar ve Daire Dilimi)',
      type: LectureSectionType.formula,
      leadText: 'Merkez açı, çevre açı, yay uzunluğu ve daire diliminin alanı:',
      imageAssetPath: 'assets/images/geometry/geom_daire_dilimi.png',
      imageCaption: 'Çemberde Merkez Açı ve Daire Diliminin Alanı',
      bulletPoints: [
        '▸ 1. Çemberde Açılar:\n• Merkez Açı: Köşesi merkezde olan açıdır. Ölçüsü gördüğü yayın ölçüsüne EŞİTTİR: Merkez Açı = Gördüğü Yay = α.\n• Çevre Açı: Köşesi çember üzerinde olan açıdır. Ölçüsü gördüğü yayın YARISINA EŞİTTİR: Çevre Açı = Yay / 2.\n• ÇAPI GÖREN ÇEVRE AÇI DAİMA 90°\'DİR!',
        '▸ 2. Çevre ve Yay Uzunluğu:\n• Çemberin Çevresi = 2 · π · r\n• α derecelik yayın uzunluğu = 2 · π · r · (α / 360°).',
        '▸ 3. Dairenin Alanı ve Daire Dilimi:\n• Dairenin Alanı = π · r²\n• α merkez açılı Daire Diliminin Alanı = π · r² . (α / 360°)\n• Daire Halkasının Alanı = π(R² - r²).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
Yarıçapı 6 cm olan bir dairede 60°'lik merkez açının gördüğü daire diliminin alanı kaç π cm²'dir?

💡 ÇÖZÜM:
1. Daire dilimi alanı formülü: Alan = π · r² · (α / 360°).
2. Yarıçap r = 6 cm ve merkez açı α = 60°.
3. Değerleri yazalım: Alan = π · 6² · (60° / 360°).
4. 60 / 360 = 1/6 olduğundan:
Alan = π · 36 · (1/6) = 6π cm² bulunur.

🎯 PRATİK İPUCU: 60° tam bir dairenin (360°) 6'da 1'idir; doğrudan tüm alanı (36π) bulup 6'ya bölerek 3 saniyede çözün.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec12_daire_dilimi.png]
Yarıçapı r = 6 cm olan O merkezli bir dairede 60°'lik merkez açının gördüğü daire diliminin:
a) Yay uzunluğu kaç cm'dir? (π = 3 alınız)
b) Alanı kaç cm²'dir?

💡 ÇÖZÜM:
1. Yay Uzunluğu Formülü: L = 2 · π · r · (α / 360°)
L = 2 · 3 · 6 · (60° / 360°) = 36 · (1/6) = 6 cm'dir.
2. Daire Dilimi Alan Formülü: Alan = π · r² · (α / 360°)
Alan = 3 · (6²) · (60° / 360°) = 3 · 36 · (1/6) = 108 / 6 = 18 cm² bulunur.

🎯 PRATİK İPUCU: 60° tam dairenin 1/6'sı, 90° çeyreği (1/4'ü), 120° üçte biridir (1/3); formülde açı oranını doğrudan kesir olarak sadeleştirin!''',
      ],
      goldenRule: 'Çapı gören çevre açı 90°\'dir! Soruda çap verilmişse çember üzerindeki bir noktayla birleştirip hemen dik açıyı yerleştiriniz.',
      osymTrap: 'Merkez açı gördüğü yaya doğrudan eşittir; çevre açı ise gördüğü yayın YARISIDIR!'
    ),
    LectureSection(
      title: '13 · Prizmalar ve Katı Cisimler',
      type: LectureSectionType.formula,
      leadText: 'Dik prizmalar, dikdörtgenler prizması, küp, yüzey alanları ve hacim bağıntıları:',
      imageAssetPath: 'assets/images/geometry/geom_dikdortgen_prizma.png',
      imageCaption: 'Dikdörtgenler Prizması Hacim ve Yüzey Alanı',
      bulletPoints: [
        '▸ 1. Genel Dik Prizma Bağıntıları:\n• Yanal Alan = Taban Çevresi · Yükseklik = Çtaban · h\n• Toplam Yüzey Alanı = 2 · Taban Alanı + Yanal Alan\n• Hacim = Taban Alanı . Yükseklik = Ataban · h',
        '▸ 2. Dikdörtgenler Prizması (Ayrıtları a, b, c):\n• Hacim = V = a · b · c\n• Yüzey Alanı = A = 2(ab + bc + ac)\n• Cisim Köşegeni = e = √(a² + b² + c²).',
        '▸ 3. Küp (Ayrıtı a):\n• Hacim = V = a³, Yüzey Alanı = 6a², Cisim Köşegeni = a√3.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec13_cisim_kosegeni.png]
Ayrıt uzunlukları a = 3 cm, b = 4 cm ve c = 12 cm olan bir dikdörtgenler prizmasının:
a) Hacmi kaç cm³'tür?
b) Cisim köşegeninin uzunluğu kaç cm'dir?

💡 ÇÖZÜM:
1. Hacim Formülü: V = a · b · c
V = 3 · 4 · 12 = 144 cm³'tür.
2. Cisim Köşegeni (e) Formülü: Prizmanın en uzak iki köşesi arasındaki mesafedir:
e = √(a² + b² + c²)
e = √(3² + 4² + 12²) = √(9 + 16 + 144) = √169 = 13 cm bulunur.
(Pratik: Taban köşegeni 3-4-5 üçgeninden 5 cm, yükseklik 12 cm ile 5-12-13 üçgeni oluşur).

🎯 PRATİK İPUCU: Dikdörtgenler prizmasının cisim köşegeni ardışık iki Pisagor bağıntısıdır (3-4-5 ardından 5-12-13)!''',
      ],
      goldenRule: 'Bütün dik prizmaların hacmi: TABAN ALANI · YÜKSEKLİK! Yanal alanı: TABAN ÇEVRESİ . YÜKSEKLİK.'
    ),
    LectureSection(
      title: '14 · Piramitler',
      type: LectureSectionType.formula,
      leadText: 'Tepe noktası, taban çokgeni, yanal yüzler ve piramit hacim formülleri:',
      imageAssetPath: 'assets/images/geometry/geom_kare_piramit.png',
      imageCaption: 'Kare Dik Piramit Hacim ve Alan Bağıntıları',
      bulletPoints: [
        '▸ 1. Piramit Temel Bağıntıları:\n• Hacim = (Taban Alanı . Cisim Yüksekliği) / 3 = (Ataban · h) / 3 (Prizmanın 1/3\'üdür!).\n• Yanal Alan = (Taban Çevresi · Yan Yüz Yüksekliği) / 2\n• Toplam Alan = Taban Alanı + Yanal Alan.',
        '▸ 2. Kare Dik Piramit:\n• Tabanı a kenarlı kare (Taban Alanı = a²).\n• Yan yüzleri 4 eş ikizkenar üçgendir.\n• Hacim = (a² . h) / 3.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec14_kare_piramit.png]
Taban kenarı a = 6 cm ve tepe yüksekliği h = 4 cm olan düzgün kare dik piramidin:
a) Hacmi kaç cm³'tür?
b) Yan yüz yüksekliği (h_y) kaç cm'dir?

💡 ÇÖZÜM:
1. Piramit Hacim Formülü: V = (1/3) · Taban Alanı · Yükseklik
Taban Alanı = a² = 6² = 36 cm².
V = (1/3) · 36 · 4 = 12 · 4 = 48 cm³'tür.
2. Yan Yüz Yüksekliği (h_y) Pisagoru:
Tepe yüksekliği (4 cm), taban kenarının yarısı (6/2 = 3 cm) ve yan yüz yüksekliği bir dik üçgen oluşturur:
(h_y)² = h² + (a/2)² = 4² + 3² = 16 + 9 = 25 ⇒ h_y = 5 cm (3-4-5 dik üçgeni) bulunur.

🎯 PRATİK İPUCU: Piramitlerde tepe yüksekliği, tabanın yarı kenarı ve yan yüz yüksekliği DAİMA bir dik üçgen meydana getirir (3-4-5)!''',
      ],
      goldenRule: 'Piramit hacmi prizma hacminin üçte biridir: (Taban Alanı . Yükseklik) / 3!'
    ),
    LectureSection(
      title: '15 · Silindir',
      type: LectureSectionType.formula,
      leadText: 'Dairesel dik silindirin açınımı, yanal alanı ve hacmi:',
      imageAssetPath: 'assets/images/geometry/geom_silindir_hacim.png',
      imageCaption: 'Dairesel Silindir Hacim ve Açınım Modeli',
      bulletPoints: [
        '▸ 1. Silindirin Yapısı ve Açınımı:\n• Tabanları r yarıçaplı iki eş daire, yanal yüzeyi ise açıldığında bir DİKDÖRTGENDİR.\n• Açınım dikdörtgeninin bir kenarı taban çevresine eşittir (2 · π · r), diğer kenarı silindirin yüksekliğidir (h).',
        '▸ 2. Alan ve Hacim Formülleri:\n• Yanal Alan = 2 · π · r · h\n• Toplam Yüzey Alanı = 2πrh + 2πr² = 2πr(h + r)\n• Hacim = Taban Alanı . Yükseklik = π · r² . h.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec15_silindir_acinim.png]
Taban yarıçapı r = 3 cm ve yüksekliği h = 8 cm olan bir dik silindirin:
a) Hacmi kaç cm³'tür? (π = 3 alınız)
b) Yanal alanı kaç cm²'dir?

💡 ÇÖZÜM:
1. Silindir Hacim Formülü: V = Taban Alanı · Yükseklik = π · r² · h
V = 3 · (3²) · 8 = 3 · 9 · 8 = 216 cm³'tür.
2. Silindir Yanal Alan Formülü: Açıldığında bir dikdörtgen oluşur; kenarları taban çevresi (2πr) ve yüksekliktir (h):
Yanal Alan = 2 · π · r · h = 2 · 3 · 3 · 8 = 144 cm² bulunur.

🎯 PRATİK İPUCU: Silindirin yanal alanı taban çevresi (2πr) ile yüksekliğin (h) çarpımıdır; açılmış dikdörtgeni hayal edin!''',
      ],
      goldenRule: 'Silindirin yanal yüz açınımı bir kenarı 2πr, diğer kenarı h olan bir dikdörtgendir! En kısa yol sorularında silindir açılarak hipotenüs hesaplanır.'
    ),
    LectureSection(
      title: '16 · Doğrunun Analitik İncelemesi',
      type: LectureSectionType.formula,
      leadText: 'Koordinat sistemi, iki nokta arası uzaklık, eğim ve doğru denklemleri:',
      imageAssetPath: 'assets/images/geometry/geom_analitik_duzlem.png',
      imageCaption: 'Analitik Düzlem, Bölgeler ve Doğru Eğimi',
      bulletPoints: [
        '▸ 1. Analitik Düzlem ve Bölgeler:\n• 1. Bölge (+, +), 2 · Bölge (-, +), 3 · Bölge (-, -), 4 · Bölge (+, -).',
        '▸ 2. İki Nokta Arasındaki Uzaklık:\n• A(x1, y1) ve B(x2, y2) için: |AB| = √[ (x2 - x1)² + (y2 - y1)² ].',
        '▸ 3. Orta Nokta: C( (x1 + x2)/2 , (y1 + y2)/2 ).',
        '▸ 4. Doğrunun Eğimi (m):\n• İki noktası bilinen doğru: m = (y2 - y1) / (x2 - x1).\n• y = mx + n biçiminde x\'in katsayısı m eğimdir.\n• ax + by + c = 0 biçiminde eğim: m = -a / b.',
        '▸ 5. Paralel ve Dik Doğrular:\n• Paralel Doğrular (d1 // d2): Eğimleri eşittir: m1 = m².\n• Dik Kesişen Doğrular (d1 ⊥ d2): Eğimleri çarpımı -1\'dir: m1 · m² = -1.',
        '''📝 ÇÖZÜMLÜ ÖRNEK:
[ŞEKİL: assets/images/geometry/custom_examples/fig_sec16_analitik_egim.png]
Analitik düzlemde A(2, 3) ve B(6, 11) noktaları veriliyor.
a) Bu iki nokta arasındaki uzaklık (|AB|) kaç birimdir?
b) AB doğrusunun eğimi (m) kaçtır?

💡 ÇÖZÜM:
1. İki Nokta Arası Uzaklık Formülü:
|AB| = √[(x₂ - x₁)² + (y₂ - y₁)²]
|AB| = √[(6 - 2)² + (11 - 3)²] = √[4² + 8²] = √[16 + 64] = √80 = 4√5 birimdir.
2. Eğim (m) Formülü: Ordinatlar farkının apsisler farkına oranıdır:
m = (y₂ - y₁) / (x₂ - x₁) = (11 - 3) / (6 - 2) = 8 / 4 = 2 bulunur.

🎯 PRATİK İPUCU: Eğim daima 'y'deki değişim / x'teki değişim'dir (Dikey / Yatay). İki nokta arası uzaklık ise dik kenarları 4 ve 8 olan dik üçgenin Pisagorudur!''',
      ],
      goldenRule: 'Dik kesişen iki doğrunun eğimleri çarpımı -1\'dir (m1 · m² = -1)! Paralel doğruların eğimleri birbirine eşittir (m1 = m²).'
    ),
    LectureSection(
      title: 'MEB & KPSS Geometri Çözümlü Deneme Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'MEB EKPSS Geometri resmi konu değerlendirme test soruları ve adım adım tam çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Yukarıdaki şekilde d₁ // d₂ olduğuna göre, iç ters ve zikzak açı bağıntılarından yararlanarak x açısını bulunuz.',
          options: [
            'A) 75°',
            'B) 80°',
            'C) 85°',
            'D) 90°',
            'E) 95°'
          ],
          correctIndex: 1,
          explanation: 'Z ve U kuralı gereğince d₁ ve d₂ paralel doğruları arasında yöndeş ve iç ters açılar birbirine eşittir. Verilen açılar toplandığında x = 80° olarak hesaplanır.',
          ruleTag: 'Doğruda Açılar Z & U Kuralı',
          imageAssetPath: 'assets/images/geometry/geom_t101_q1.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'Şekilde verilen paralel doğru modelinde d₁ // d₂ olduğuna göre, zıt yöne bakan dar açıların toplamı kuralından (M Kuralı) x değeri kaç derecedir?',
          options: [
            'A) 60°',
            'B) 65°',
            'C) 70°',
            'D) 75°',
            'E) 80°'
          ],
          correctIndex: 2,
          explanation: 'M kuralında sola bakan dar açıların toplamı, sağa bakan sivri uçtaki açıya eşittir. Buradan x = 70° elde edilir.',
          ruleTag: 'M ve Zikzak Kuralı',
          imageAssetPath: 'assets/images/geometry/geom_t101_q2.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'Şekildeki üçgende [DE] // [BC] temel benzerlik oranı kurulduğunda |AD| = 4 cm, |DB| = 6 cm ve |DE| = 8 cm olduğuna göre |BC| taban uzunluğu kaç cm dir?',
          options: [
            'A) 16',
            'B) 18',
            'C) 20',
            'D) 22',
            'E) 24'
          ],
          correctIndex: 2,
          explanation: 'Thales temel benzerlik teoremine göre: |AD| / |AB| = |DE| / |BC| dir.\n|AB| = 4 + 6 = 10 cm.\n4 / 10 = 8 / |BC| ⇒ |BC| = (10 · 8) / 4 = 20 cm bulunur.',
          ruleTag: 'Thales Benzerlik Orantısı',
          imageAssetPath: 'assets/images/geometry/geom_t104_q1.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'Şekildeki dik üçgende dik kenarlar 9 cm ve 12 cm olduğuna göre, hipotenüsün uzunluğu kaç cm dir?',
          options: [
            'A) 13',
            'B) 14',
            'C) 15',
            'D) 16',
            'E) 17'
          ],
          correctIndex: 2,
          explanation: '3 - 4 - 5 özel dik üçgeninin 3 katı genişletilmiş halidir:\n3 · 3 = 9 cm\n4 · 3 = 12 cm\n5 · 3 = 15 cm hipotenüs olarak bulunur.',
          ruleTag: 'Özel Dik Üçgenler (3-4-5 Katları)',
          imageAssetPath: 'assets/images/geometry/geom_t106_q1.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'Şekildeki ABC dik üçgeninde hipotenüse inen dikme [AH] için |BH| = 3 cm ve |HC| = 12 cm olduğuna göre, h yüksekliği kaç cm dir?',
          options: [
            'A) 5',
            'B) 6',
            'C) 7',
            'D) 8',
            'E) 9'
          ],
          correctIndex: 1,
          explanation: 'Öklid yükseklik bağıntısı: h² = p · k dır.\nh² = 3 · 12 = 36 ⇒ h = 6 cm bulunur.',
          ruleTag: 'Öklid Yükseklik Teoremi',
          imageAssetPath: 'assets/images/geometry/geom_t108_q1.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'Şekildeki ABCD yamuğunda alt taban 14 cm, üst taban 6 cm olduğuna göre, orta taban uzunluğu kaç cm dir?',
          options: [
            'A) 8',
            'B) 9',
            'C) 10',
            'D) 11',
            'E) 12'
          ],
          correctIndex: 2,
          explanation: 'Yamukta orta taban formülü: (Alt Taban + Üst Taban) / 2 dir.\nOrta Taban = (14 + 6) / 2 = 20 / 2 = 10 cm bulunur.',
          ruleTag: 'Yamukta Orta Taban Kuralı',
          imageAssetPath: 'assets/images/geometry/geom_t111_q1.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'O merkezli bir çemberde 120° lik merkez açının gördüğü yayın uzunluğu 8π cm olduğuna göre, çemberin yarıçapı r kaç cm dir?',
          options: [
            'A) 10',
            'B) 12',
            'C) 14',
            'D) 16',
            'E) 18'
          ],
          correctIndex: 1,
          explanation: 'Yay uzunluğu: L = 2 · π · r · (α / 360°)\n8π = 2 · π · r · (120° / 360°)\n8 = 2 · r · (1/3) ⇒ 8 = 2r / 3 ⇒ 24 = 2r ⇒ r = 12 cm bulunur.',
          ruleTag: 'Çemberde Merkez Açı ve Yay Uzunluğu',
          imageAssetPath: 'assets/images/geometry/geom_t112_q1.png'
        ),
        LectureInteractiveQuiz(
          prompt: 'Ayrıtları 4 cm, 5 cm ve 6 cm olan bir dikdörtgenler prizmasının hacmi kaç cm³ tür?',
          options: [
            'A) 100',
            'B) 110',
            'C) 120',
            'D) 130',
            'E) 140'
          ],
          correctIndex: 2,
          explanation: 'Dikdörtgenler prizmasının hacmi: V = a · b · c dir.\nV = 4 · 5 · 6 = 120 cm³ bulunur.',
          ruleTag: 'Prizmalarda Hacim Bağıntısı',
          imageAssetPath: 'assets/images/geometry/geom_t113_q1.png'
        )
      ]
    )
  ],
);

final LectureTopic matematikGeometri = matematikKonu11;
