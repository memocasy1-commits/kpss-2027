// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu12 = LectureTopic(
  id: 'matematik_konu_12',
  courseId: 'matematik',
  order: 12,
  title: 'PİSA, Sayısal Mantık ve Modelleme',
  subtitle: 'Grafik-Tablo Yorumlama, Kademeli Tarife Hesapları, Optimizasyon, Akış Diyagramları ve Sayı Dizileri',
  icon: Icons.insights,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 121 - 138',
  startTestNum: 121,
  endTestNum: 138,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'Yeni Nesil Beceri Temelli Problem Çözme Stratejileri',
      type: LectureSectionType.overview,
      leadText: 'ÖSYM ve PİSA standartlarında gerçek hayat durumlarını matematiksel modellere aktarma:',
      bulletPoints: [
        '▸ 1. Metin ve Veri Analizi:\n• Uzun metinli yeni nesil sorularda sorunun tamamını okumadan önce soru kökünde ne istendiği (maliyet, süre, en az/en çok değer) tespit edilir.\n• Gereksiz hikâye kısımları ayıklanarak sayısal değişkenler ve sınırlar kenara not edilir.',
        '▸ 2. Kademeli Tarife Hesaplamaları (Fatura / Otopark / Vergi):\n• İlk k birim için sabit ücret, aşan her birim için kademeli artan birim fiyat modellemesi:\n• Örnek: İlk 100 kWh için 2 TL, 100 kWh üzerindeki her tüketim için 3 TL ise; 160 kWh harcayan biri: 100 · 2 + 60 · 3 = 200 + 180 = 380 TL öder.',
        '▸ 3. Optimizasyon (En Az / En Çoklaştırma):\n• Sınırlı bütçe veya kapasiteyle maksimum verimi elde etme sorularında birim başına maliyet/getiri oranı en avantajlı olan alternatiften başlanarak dolum yapılır.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
Kibrit çöpleriyle yan yana kareler oluşturulmaktadır: 1 kare için 4 çöp, 2 bitişik kare için 7 çöp, 3 bitişik kare için 10 çöp kullanılmaktadır.
Buna göre, yan yana 25 adet bitişik kare oluşturmak için kaç adet kibrit çöpü gerekir?

💡 ÇÖZÜM:
1. Örüntü dizisini yazalım: 4, 7, 10, 13, ...
2. Terimler arasındaki artış miktarı +3'tür.
3. n. kare için genel formül = 3n + 1 (n = 1 için 3·1 + 1 = 4 sağlar).
4. 25 kare için n = 25 yazalım:
Çöp sayısı = 3 · (25) + 1 = 75 + 1 = 76 adet kibrit çöpü gerekir.

🎯 PRATİK İPUCU: Şekil örüntülerinde artış miktarı genel kuralın n katsayısıdır (artış 3 ise kural 3n + k'dir); ilk terimden sabiti bulun.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
Bir belediyenin kademeli su tarifesi şöyledir:
• İlk 10 m³'e kadar: m³ başına 6 TL
• 10 m³'ten sonraki her m³ için: m³ başına 10 TL
Buna göre, bir ayda 24 m³ su tüketen bir abonenin ödeyeceği fatura tutarı kaç TL'dir?

💡 ÇÖZÜM:
1. Kademeli Tarife Mantığı: Tüketim dilimlere ayrılır ve her dilim kendi birim fiyatından hesaplanır (Tüm tüketim son fiyattan çarpılmaz!).
2. Dilim 1 (İlk 10 m³):
Tutar = 10 · 6 = 60 TL.
3. Kalan tüketim = 24 - 10 = 14 m³.
4. Dilim 2 (Sonraki 14 m³):
Tutar = 14 · 10 = 140 TL.
5. Toplam Fatura = 60 + 140 = 200 TL olarak hesaplanır.

🎯 PRATİK İPUCU: Kademeli tarife sorularında toplam tüketimi dilimlere ayırın; her dilimi ayrı ayrı çarpıp toplayın!''',
      ],
      goldenRule: 'Kademeli problemlerde tüm tüketimi üst kademeden çarpamazsınız! Her tüketim dilimi yalnızca kendi kademesindeki birim fiyatla çarpılır.',
      osymTrap: 'Grafik eksenlerinin birimlerine dikkat edin! Bazen düşey eksen "bin TL" cinsindendir; 5 değeri 5 · 000 TL anlamına gelir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Kademeli Tarife (İlk 5 km 8 TL, kalan 10 km 6 TL): 5·8 + 10·6 = 100 TL (+ Açılış 20 TL = 120 TL)',
          wrong: 'Toplam 15 km\'nin tamamını tek kademeden 6 TL ile çarpmak (İlk dilimin yüksek tarifesi atlanamaz!)',
          note: 'Kademeli tarifelerde her mesafe veya tüketim dilimi yalnızca kendi birim fiyatıyla çarpılır.'
        ),
        ComparisonRow(
          correct: 'Sayı Dizileri & Örüntüler: Kuralın dizideki en az ilk 3-4 terimde sağlandığı teyit edilmelidir.',
          wrong: 'Yalnızca ilk iki terim arasındaki farka bakarak tüm dizinin sabit farkla arttığını varsaymak.',
          note: 'Diziler karesel (n²), geometrik (2ⁿ) veya iki aşamalı artış gösterebilir.'
        )
      ]
    ),
    LectureSection(
      title: 'Sayısal Mantık ve Şifreli Dizilimler',
      type: LectureSectionType.ruleList,
      leadText: 'KPSS Sayısal Yetenek bölümünün belirleyici soru modelleri:',
      bulletPoints: [
        '▸ 1. Sayı Dizileri ve Örüntüler:\n• Terimler arasındaki farkın artış katsayısı incelenir (+3, +5, +7... veya x2+1).\n• İki basamaklı örüntülerde ardışık terimlerin toplamı veya kareleri farkı aranır.',
        '▸ 2. Akış Şemaları ve Algoritmik Adımlar:\n• "x sayısını gir → x çift ise 2\'ye böl, tek ise 3 ile çarp 1 ekle → Sonuç 50\'den küçükse başa dön". Bu tür sorularda verilen adım adım kurallar adım atlamadan işletilir.',
        '▸ 3. Sihirli Kareler ve Sudoku Tipi Tablolar:\n• Satır, sütun ve köşegen toplamlarının eşit olduğu tablolarda önce en çok elemanı bilinen satır veya sütundan eksik terim tamamlanır.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
Bir bilgisayar algoritması girilen pozitif tam sayıyı şu kurala göre işletir:
• Sayı çift ise 2'ye böl.
• Sayı tek ise 3 ile çarpıp 1 ekle.
Algoritmaya 10 sayısı girilirse 4. adım sonunda hangi sayı elde edilir?

💡 ÇÖZÜM:
1. Başlangıç sayısı: 10 (Çift)
2. 1. Adım: 10 / 2 = 5 (Tek)
3. 2. Adım: 3 · (5) + 1 = 16 (Çift)
4. 3. Adım: 16 / 2 = 8 (Çift)
5. 4. Adım: 8 / 2 = 4 bulunur.

🎯 PRATİK İPUCU: Algoritma ve akış şeması sorularında her adımın sonucunu tek/çift olarak not edip adım sayısını kaybetmeden sırayla uygulayın.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
Kibrit çöpleriyle oluşturulan bir örüntüde:
• 1. adımda 1 kare oluşturmak için 4 kibrit çöpü,
• 2. adımda yan yana 2 kare oluşturmak için 7 kibrit çöpü,
• 3. adımda yan yana 3 kare oluşturmak için 10 kibrit çöpü kullanılmaktadır.
Buna göre, 25 kareden oluşan bir dizi için kaç kibrit çöpü gerekir?

💡 ÇÖZÜM:
1. Adımlardaki çöp sayılarına bakalım:
4, 7, 10, ...
2. Artış miktarı sabittir: 7 - 4 = 3, 10 - 7 = 3 (Her yeni kare için ortak kenar hariç 3 yeni çöp eklenir).
3. n. adımın genel terimi: Artış miktarı 3 olduğundan 3n ile başlar.
n = 1 için 4 olması gerektiğinden genel terim = 3n + 1'dir.
4. 25 kare için n = 25 yazalım:
Kibrit Çöpü Sayısı = 3 · 25 + 1 = 75 + 1 = 76 çöp gerekir.

🎯 PRATİK İPUCU: Doğrusal örüntülerde genel terim = (Artış Miktarı · n) + İlk Terim Düzeltmesi formülüyle anında bulunur!''',
      ],
      goldenRule: 'Algoritma ve akış şemalarında verilen döngü şartı sağlanana kadar kurallar sırasıyla uygulanmalıdır; kafadan tahmin yürütülmemelidir.',
      osymTrap: 'Örüntü sorularında tek bir adıma bakarak kural varsaymayın; kuralın dizideki en az 3 terimde sağlandığını teyit edin.'
    ),
    LectureSection(
      title: 'PİSA Modelleme Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Gerçek hayat simülasyonu formatında yeni nesil sayısal mantık sorusu:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Bir taksimetrenin açılış ücreti 20 TL\'dir. Taksimetre ilk 5 km için km başına 8 TL, 5 km\'den sonraki her km için ise km başına 6 TL yazmaktadır · Bu taksiyle 15 km yol giden bir yolcu kaç TL ücret öder?',
          options: [
            'A) 110',
            'B) 120',
            'C) 130',
            'D) 140',
            'E) 150'
          ],
          correctIndex: 1,
          explanation: 'Kademeli tarife hesaplaması:\n1 · Açılış ücreti = 20 TL\n2. İlk 5 km için: 5 · 8 = 40 TL\n3 · 5 km\'den sonraki kalan yol = 15 - 5 = 10 km\n4 · Kalan 10 km için: 10 · 6 = 60 TL\nToplam Ücret = 20 + 40 + 60 = 120 TL öder.',
          ruleTag: 'Kademeli Tarife Modellemesi'
        )
      ]
    )
  ],
);

final LectureTopic matematikPisaModelleme = matematikKonu12;
