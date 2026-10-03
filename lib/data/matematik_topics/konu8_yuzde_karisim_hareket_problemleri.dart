// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu8 = LectureTopic(
  id: 'matematik_konu_8',
  courseId: 'matematik',
  order: 8,
  title: 'Yüzde, Kâr-Zarar, Karışım ve Hız Problemleri',
  subtitle: 'Maliyet-Satış Hesapları, Karışım Formülü, İşçi Kapasitesi, Ortalama Hız ve Karşılaşma Bağıntıları',
  icon: Icons.trending_up,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 71 - 80',
  startTestNum: 71,
  endTestNum: 80,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'Yüzde ve Kâr - Zarar Problemleri',
      type: LectureSectionType.overview,
      leadText: 'A sayısının %x\'i: A · (x / 100) formülüyle hesaplanır (matematik1.pdf s. 84):',
      bulletPoints: [
        '▸ 1. Temel 100x Kabulü:\n• Bir ürünün maliyetine veya alış fiyatına daima 100x denir.\n• %20 kârla satış: 100x + 20x = 120x\n• %30 zararla satış: 100x - 30x = 70x\n• Satış (Etiket) Fiyatı = Maliyet + Kâr = Maliyet - Zarar.',
        '▸ 2. İndirim (İskonto) ve Zam:\n• İndirim daima ETIKET FIYATI üzerinden yapılır:\n• 120x etiket fiyatlı ürüne %10 indirim yapılırsa: 120x · (10/100) = 12x indirim → Yeni Satış = 108x (Hâlâ %8 kârdadır!).',
        '▸ 3. Enflasyon ve Alım Gücü:\n• Maaşa %20 zam yapılırken enflasyon %50 ise:\n• Başlangıçta 100 TL maaş ile 100 TL\'lik ürün alınıyordu.\n• Yeni maaş = 120 TL, ürünün yeni fiyatı = 150 TL.\n• Alım gücündeki kayıp = (30 / 150) = %20 azalır.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
Bir mağaza bir ceketi %40 kârla satmaktadır. Sezon sonunda satış fiyatı üzerinden %20 indirim yapıldığında son durumdaki kâr oranı yüzde kaç olur?

💡 ÇÖZÜM:
1. Ceketin maliyetine 100 TL diyelim.
2. %40 kârlı satış fiyatı: 100 + 40 = 140 TL.
3. Satış fiyatı üzerinden %20 indirim uygulayalım:
İndirim tutarı = 140 · (20/100) = 28 TL.
4. Yeni satış fiyatı: 140 - 28 = 112 TL.
5. Maliyet 100 TL, nihai satış 112 TL olduğuna göre mağazanın son kârı %12'dir.

🎯 PRATİK İPUCU: Maliyet bilinmiyorsa doğrudan 100 seçin; indirimlerin maliyetten değil, satış fiyatı üzerinden yapıldığına dikkat edin!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
Bir satıcı bir ürünü %20 kârla satarken etiket fiyatı üzerinden %25 indirim yapmıştır.
Buna göre, satıcının son durumdaki kâr-zarar durumu nedir?

💡 ÇÖZÜM:
1. Maliyete 100 TL diyelim.
2. %20 kârla etiket fiyatı = 100 + 20 = 120 TL olur.
3. 120 TL üzerinden %25 (yani 1/4) indirim yapalım:
İndirim Tutarı = 120 · (25/100) = 30 TL.
4. Yeni Satış Fiyatı = 120 - 30 = 90 TL.
5. Sonuç: 100 TL'ye mal olan ürün 90 TL'ye satılmıştır.
100 - 90 = 10 TL zarar, yani %10 ZARAR etmiştir.

🎯 PRATİK İPUCU: İndirim maliyet üzerinden değil etiket fiyatı üzerinden yapılır! 120'nin %25'i 30 TL indirim demektir!''',
      ],
      goldenRule: 'Maliyete daima 100x deyin! İndirim yaparken maliyetten değil, zamlı satış fiyatından düşmeyi unutmayın.',
      osymTrap: 'Bir ürüne önce %20 zam, sonra zamlı fiyat üzerinden %20 indirim yapılırsa fiyat başlangıca dönmez; %4 zarar edilir: 100 → 120 → 120 - 24 = 96.'
    ),
    LectureSection(
      title: 'Karışım Problemleri ve Saf Madde Yüzdesi',
      type: LectureSectionType.formula,
      leadText: 'Karışımlarda oran hesabı ve karışım formülü (matematik1.pdf s. 84-85):',
      bulletPoints: [
        '▸ 1. Temel Yüzde Tanımı:\n• Yüzde = (Saf Madde Miktarı / Toplam Karışım Miktarı) · 100',
        '▸ 2. GENEL KARIŞIM FORMÜLÜ:\n• m1 gram %x\'lik karışım ile m2 gram %y\'lik karışım karıştırılırsa:\n• m1 · x + m2 · y = (m1 + m2). A (A = Yeni karışımın yüzdesi).\n• A · Saf Madde Eklenirse (Tuz, Şeker): Yüzdesi %100 alınır.\n• B · Saf Su Eklenirse: Madde yüzdesi %0 alınır.\n• C · Su Buharlaştırılırsa: Karışımdan %0 madde çıkarılır: m1 · x - msu · 0 = (m1 - msu). A.',
        '▸ 3. Karışımın Bir Kısmı Dökülürse:\n• Dökülen karışımın YÜZDESİ DEĞİŞMEZ! Kalan kısmın yüzdesi başlangıçtaki ile tamamen aynıdır.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
Şeker oranı %20 olan 40 kg şekerli su ile şeker oranı %40 olan 60 kg şekerli su karıştırılıyor. Yeni karışımın şeker oranı yüzde kaçtır?

💡 ÇÖZÜM:
1. Altın Karışım Formülü: M₁ · Y₁ + M₂ · Y₂ = M_toplam · Y_son
2. Verileri formüle yerleştirelim:
40 · 20 + 60 · 40 = (40 + 60) · Y_son
3. Çarpımları hesaplayalım:
800 + 2400 = 100 · Y_son
3200 = 100 · Y_son ⇒ Y_son = 32.
4. Yeni karışımın şeker oranı %32 bulunur.

🎯 PRATİK İPUCU: Saf su eklenirse yüzdesi 0, saf şeker/tuz eklenirse yüzdesi 100 alınır; su buharlaşırsa çıkarma yapılır!''',
      ],
      goldenRule: 'Karışıma saf su eklenirse yüzdesi %0, saf tuz/şeker eklenirse yüzdesi %100 kabul edilir!',
      osymTrap: 'Karışımın yarısı dökülürse kalan karışımın tuz oranı YARIYA İNMEZ; oranı aynı kalır, sadece miktarı azalır.'
    ),
    LectureSection(
      title: 'İşçi ve Havuz Problemleri',
      type: LectureSectionType.ruleList,
      leadText: 'Birim zamanda yapılan iş üzerinden kurulan denklem modelleri (matematik1.pdf s. 85):',
      bulletPoints: [
        '▸ 1. Birim Zaman Mantığı:\n• Bir işçi bir işi tek başına t günde bitirebiliyorsa, 1 günde işin 1/t\'sini bitirir.\n• t günde yapılan iş: zaman · (1 günde yapılan iş) = 1 (İşin tamamı 1 kabul edilir).',
        '▸ 2. Birlikte Çalışma Formülü:\n• A işçisi a günde, B işçisi b günde bitiriyorsa ikisi birlikte t günde bitirsin:\n• (1/a + 1/b) · t = 1\n• Havuz problemlerinde musluk dolduruyorsa (+), dipteki musluk boşaltıyorsa (-) alınır:\n• (1/a - 1/b) · t = 1.',
        '▸ 3. İşçi Kapasitesi ve Hız İlişkisi:\n• İşçinin çalışma hızı (kapasitesi) ile işi bitirme süresi TERS ORANTILIDIR.\n• Hızı 2 katına çıkarılırsa işi bitirme süresi yarıya iner.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
Ahmet bir işi tek başına 12 günde, Mehmet ise aynı işi 18 günde bitirebilmektedir.
İkisi birlikte 4 gün çalıştıktan sonra Ahmet işi bırakıyor. Geriye kalan işi Mehmet tek başına kaç günde bitirir?

💡 ÇÖZÜM:
1. Toplam işe 12 ve 18'in EKOK'u olan 36 birim diyelim.
• Ahmet'in günlük kapasitesi = 36 / 12 = 3 birim/gün.
• Mehmet'in günlük kapasitesi = 36 / 18 = 2 birim/gün.
2. İkisi birlikte 1 günde 3 + 2 = 5 birim iş yapar.
3. 4 günde yapılan iş = 4 · 5 = 20 birim.
4. Geriye kalan iş = 36 - 20 = 16 birim.
5. Kalan işi Mehmet tek başına (2 birim/gün) bitirecektir:
Süre = 16 / 2 = 8 gün sürer.

🎯 PRATİK İPUCU: Kesirlerle uğraşmak yerine günlerin EKOK'unu toplam iş (36 birim) seçip günlük güç hesabı yapın!''',
      ],
      goldenRule: 'İşçi sayısı arttıkça süre azalır (ters orantı); yapılan iş miktarı arttıkça süre artar (doğru orantı).',
      osymTrap: 'İşçi problemlerinde işi bırakan veya sonradan katılan işçiler için her aşamada kaç gün çalıştıkları tek tek çarpılarak toplanır: (1/a) · 3 + (1/a + 1/b) · 2 = 1.'
    ),
    LectureSection(
      title: 'Hareket (Hız) Problemleri',
      type: LectureSectionType.comparison,
      leadText: 'Yol, hız ve zaman arasındaki fiziksel bağıntılar (matematik1.pdf s. 85-86):',
      bulletPoints: [
        '▸ 1. Temel Bağıntı:\n• Yol = Hız · Zaman → x = v · t\n• Birim uyumu şarttır: Yol km ise zaman saat, hız km/sa olmalıdır (1 km/sa = 5/18 m/sn).',
        '▸ 2. Zıt Yönlü Hareket (Karşılaşma):\n• Aralarındaki mesafe x olan iki araç birbirine doğru v1 ve v2 hızlarıyla hareket ederse:\n• x = (v1 + v2) · t_karşılaşma (Hızlar toplanır!).',
        '▸ 3. Aynı Yönlü Hareket (Yetişme):\n• Arkadaki araç öndekini yakalamak istiyorsa (v1 > v2):\n• x = (v1 - v2) · t_yetişme (Hızlar farkı alınır!).',
        '▸ 4. Ortalama Hız Formülü:\n• V_ort = Toplam Yol / Toplam Zaman\n• Gidiş-dönüşte hızlar v1 ve v2 ise (yol aynı): V_ort = (2 · v1 · v2) / (v1 + v2) (Harmonik ortalama).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
Bir araç A kentinden B kentine 60 km/sa hızla gitmiş ve hiç durmadan 40 km/sa hızla geri dönmüştür. Bu aracın tüm yolculuktaki ortalama hızı kaç km/sa'tir?

💡 ÇÖZÜM:
1. Hata Tuzağı: Ortalama hız, hızların aritmetik ortalaması değildir! (60 + 40)/2 = 50 YANLIŞTIR!
2. Yol mesafesine 60 ve 40'ın EKOK'u olan x = 120 km diyelim.
3. Gidiş süresi t₁ = 120 / 60 = 2 saat.
4. Dönüş süresi t₂ = 120 / 40 = 3 saat.
5. Toplam yol = 120 + 120 = 240 km. Toplam süre = 2 + 3 = 5 saat.
6. V_ort = Toplam Yol / Toplam Zaman = 240 / 5 = 48 km/sa bulunur.
(Veya pratik harmonik hız formülü: 2 · V₁ · V₂ / (V₁ + V₂) = 2 · 60 · 40 / 100 = 48 km/sa).

🎯 PRATİK İPUCU: Eşit mesafeli gidiş-dönüşlerde ortalama hız daima düşük hıza daha yakındır: 2·v₁·v₂ / (v₁ + v₂).''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
Aralarında 480 km mesafe bulunan iki şehirden hızları 70 km/sa ve 90 km/sa olan iki araç aynı anda birbirlerine doğru hareket ediyorlar.
Araçlar kaç saat sonra karşılaşırlar ve karşılaşma noktasının hızlı olanın çıktığı şehre uzaklığı nedir?

💡 ÇÖZÜM:
1. Karşılıklı (Zıt Yönlü) Hareket Kuralı: İki araç birbirine doğru geliyorsa hızlar toplanır:
V_toplam = 70 + 90 = 160 km/sa.
2. Karşılaşma süresi:
t = Yol / V_toplam = 480 / 160 = 3 saat sonra karşılaşırlar.
3. Hızlı aracın (90 km/sa) aldığı yol:
x = 90 · 3 = 270 km bulunur.

🎯 PRATİK İPUCU: Birbirine doğru gelen araçlarda hızlar toplanır (V₁ + V₂); aynı yönde gidenlerde ise hızlar çıkarılır (V₁ - V₂)!''',
      ],
      goldenRule: 'Ortalama hız asla hızların aritmetik ortalaması değildir! V_ort = Toplam Yol / Toplam Zaman formülüyle bulunur.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Zıt Yönlü Hareket (Karşılaşma): x = (V₁ + V₂) · t (Birbirine doğru gelirken hızlar toplanır)',
          wrong: 'x = (V₁ - V₂) · t (Hata: Karşılaşmada hızlar çıkarılmaz, toplanır!)',
          note: 'Karşılaşma süresi t = Yol / (V₁ + V₂) formülüyle hesaplanır.'
        ),
        ComparisonRow(
          correct: 'Aynı Yönlü Hareket (Yetişme): x = (V₁ - V₂) · t (Aradaki fark hızlar farkıyla kapanır)',
          wrong: 'x = (V₁ + V₂) · t (Hata: Kovalayan araç öndekine yetişirken hızlar toplanmaz!)',
          note: 'Yetişme süresi t = Başlangıçtaki Mesafe / (V₁ - V₂) formülüyle hesaplanır (V₁ > V₂).'
        ),
        ComparisonRow(
          correct: 'Gidiş - Dönüş Ortalama Hız: V_ort = 2·V₁·V₂ / (V₁ + V₂) (Harmonik Ortalama)',
          wrong: 'V_ort = (V₁ + V₂) / 2 (Hata: Ortalama hız asla hızların aritmetik ortalaması değildir!)',
          note: 'Ortalama hız daima (Toplam Yol) / (Toplam Süre) ile hesaplanır.'
        )
      ]
    ),
    LectureSection(
      title: 'Yüzde, Karışım ve Hız Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 12 değerlendirme soruları:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Bir satıcı bir malı %40 kârla 280 TL\'ye satmaktadır · Bu malın maliyet fiyatı kaç TL\'dir? (MEB Bölüm 12 Yüzde Testi Soru 1)',
          options: [
            'A) 180',
            'B) 200',
            'C) 210',
            'D) 220',
            'E) 240'
          ],
          correctIndex: 1,
          explanation: 'Maliyet fiyatına 100x diyelim.\n%40 kârlı satış fiyatı = 100x + 40x = 140x olur.\n140x = 280 TL ise x = 280 / 140 = 2 TL\'dir.\nMaliyet = 100x = 100 · 2 = 200 TL bulunur.',
          ruleTag: 'Yüzde ve Kâr Hesabı'
        ),
        LectureInteractiveQuiz(
          prompt: 'Maliyeti üzerinden %25 kârla satılan bir mala, satış fiyatı üzerinden %20 indirim uygulanırsa son kâr-zarar durumu ne olur? (MEB Bölüm 12 Yüzde Testi)',
          options: [
            'A) %5 kâr',
            'B) %5 zarar',
            'C) Ne kâr ne zarar',
            'D) %10 kâr',
            'E) %2 zarar'
          ],
          correctIndex: 2,
          explanation: 'Maliyete 100 TL diyelim:\n1. %25 kârlı satış = 100 + 25 = 125 TL olur.\n2 · Satış fiyatı (125 TL) üzerinden %20 indirim: 125 · (20 / 100) = 25 TL indirim.\n3. İndirimli yeni fiyat: 125 - 25 = 100 TL olur.\nBaşlangıçtaki maliyet 100 TL, son satış da 100 TL olduğundan: Ne kâr ne zarar edilir (%0).',
          ruleTag: 'Art Arda Yüzde ve İndirim'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aralarında 480 km mesafe bulunan iki şehirden aynı anda birbirlerine doğru hareket eden iki aracın hızları 70 km/sa ve 50 km/sa\'tir. Bu araçlar kaç saat sonra karşılaşırlar?',
          options: [
            'A) 3',
            'B) 4',
            'C) 5',
            'D) 6',
            'E) 8'
          ],
          correctIndex: 1,
          explanation: 'Zıt yönlü harekette hızlar toplanır:\nYol = (v1 + v2) · t\n480 = (70 + 50) · t\n480 = 120 · t\nt = 480 / 120 = 4 saat sonra karşılaşırlar.',
          ruleTag: 'Hız Karşılaşma Problemi'
        ),
        LectureInteractiveQuiz(
          prompt: 'Ağırlıkça %20\'si şeker olan 40 kg şekerli su karışımına 10 kg saf şeker eklenirse yeni karışımın şeker oranı yüzde kaç olur?',
          options: [
            'A) 28',
            'B) 32',
            'C) 36',
            'D) 40',
            'E) 45'
          ],
          correctIndex: 2,
          explanation: 'Karışım formülünden (Saf şekerin yüzdesi %100\'dür):\nm1 . %1 + m2 . %2 = (m1 + m2) . %son\n40 · 20 + 10 · 100 = (40 + 10). A\n800 + 1000 = 50 · A\n1800 = 50 · A\nA = 1800 / 50 = 36 (%36) bulunur.',
          ruleTag: 'Karışım Problemleri'
        )
      ]
    )
  ],
);

final LectureTopic matematikYuzdeKarisimHareket = matematikKonu8;
