// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu10 = LectureTopic(
  id: 'matematik_konu_10',
  courseId: 'matematik',
  order: 10,
  title: 'Sayma İlkeleri, Olasılık ve İstatistik',
  subtitle: 'Permütasyon, Tekrarlı Sıralama, Kombinasyon, Basit ve Koşullu Olasılık, Veri Analizi ve Grafikler',
  icon: Icons.casino,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 91 - 100',
  startTestNum: 91,
  endTestNum: 100,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'Temel Sayma İlkeleri ve Permütasyon (Sıralama)',
      type: LectureSectionType.overview,
      leadText: 'Saymanın iki temel yolu ve nesnelerin sıralanması (matematik1.pdf Bölüm 16 s. 111-112):',
      bulletPoints: [
        '▸ 1. Temel Sayma Yöntemleri:\n• Toplama Yoluyla Sayma ("VEYA"): Ayrık olaylardan biri veya diğeri seçilirken seçenekler toplanır (3 kazak veya 2 pantolondan biri: 3 + 2 = 5).\n• Çarpma Yoluyla Sayma ("VE"): Art arda gerçekleşen bağımlı seçimlerde seçenekler çarpılır (3 kazak ve 2 pantolon: 3 · 2 = 6 farklı kombin).',
        '▸ 2. Permütasyon (Sıralama / Dizilim):\n• n farklı elemanın r\'li sıralanışlarının sayısı:\n• P(n, r) = n! / (n - r)!\n• n elemanın tamamının yan yana sıralanışı = n! (3 kişi yan yana 3! = 6 farklı şekilde oturur).\n• Yan Yana Olma Şartı: Yan yana olması istenen elemanlar iple bağlanıp TEK BİR ELEMAN kabul edilir; ardından kendi aralarındaki yer değişimiyle çarpılır.',
        '▸ 3. Tekrarlı Permütasyon:\n• Bazı elemanları özdeş olan dizilimlerin sayısı:\n• n! / (n1! . n2! ... nk!)\n• Örnek: KELEBEK kelimesindeki harflerle kaç farklı kelime yazılır? Toplam 7 harf (3 tane E, 2 tane K): 7! / (3! . 2!).\n• Şehir ızgara yol soruları tekrarlı permütasyonla çözülür.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
3 öğretmen ve 4 öğrenci yan yana düz bir sıraya oturacaktır. Öğretmenlerin daima yan yana olması koşuluyla kaç farklı şekilde oturabilirler?

💡 ÇÖZÜM:
1. 'Yan yana olma' sorularında öğretmenler tek bir kişi gibi bağlanır/paketlenir: [Ö₁ Ö₂ Ö₃] = 1 kişi.
2. Sırada artık 1 paket + 4 öğrenci = toplam 5 kişi varmış gibi düşünülür.
3. Bu 5 eleman kendi arasında 5! şekilde dizilir.
4. Paketin içindeki 3 öğretmen de kendi arasında 3! şekilde yer değiştirebilir.
5. Çarpma kuralı gereği toplam diziliş sayısı:
5! · 3! = 120 · 6 = 720 farklı şekilde oturabilirler.

🎯 PRATİK İPUCU: Yan yana olması istenen elemanları tek bir blok kabul edip genel sıralamayla çarpın, sonra bloğun kendi iç dizilişini (3!) ekleyin.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
ANKARA kelimesinin harflerinin yerleri değiştirilerek anlamlı ya da anlamsız 6 harfli kaç farklı kelime yazılabilir?

💡 ÇÖZÜM:
1. Tekrarlı Permütasyon Kuralı: Toplam eleman sayısının faktöriyeli, tekrar eden harflerin faktöriyellerinin çarpımına bölünür.
2. Harf Dağılımı:
• Toplam: 6 harf (6!).
• A harfi: 3 adet.
• N harfi: 1 adet.
• K harfi: 1 adet.
• R harfi: 1 adet.
3. Formül:
Kelime Sayısı = 6! / (3! · 1! · 1! · 1!)
= (720) / (6 · 1) = 120 farklı kelime yazılabilir.

🎯 PRATİK İPUCU: Tekrar eden harflerin kendi arasındaki yer değişimi yeni kelime üretmez; bu yüzden toplam faktöriyeli tekrar sayılarına bölün!''',
      ],
      goldenRule: 'Permütasyon SIRALAMADIR (sıra önemlidir: yarışta 1., 2., 3 · olmak, yan yana dizilmek). Kombinasyon SEÇİMDİR (sıra önemsizdir: gruptan 3 kişi seçmek).',
      osymTrap: 'Yan yana olan elemanların kendi aralarında yer değiştirmesini (iç permütasyon) çarpmayı unutmayın: Anne-baba yan yana ise (Anne-Baba bloku) 2! ile çarpılır.'
    ),
    LectureSection(
      title: 'Kombinasyon (Grup Seçimi)',
      type: LectureSectionType.formula,
      leadText: 'n farklı eleman arasından sıraya bakılmaksızın r eleman seçme sayısı (matematik1.pdf s. 112-113):',
      bulletPoints: [
        '▸ 1. Kombinasyon Formülü:\n• C(n, r) = n! / [ r! . (n - r)! ]\n• Pratik Hesap: Pay n\'den geriye r adım açılır, payda r! kadar açılır:\n  • C(7, 3) = (7 · 6 · 5) / (3 · 2 · 1) = 35.',
        '▸ 2. Kombinasyonun Temel Özellikleri:\n• C(n, r) = C(n, n - r) (Altların toplamı üstü verirse eşittir: C(10, 8) = C(10, 2) = 45).\n• C(n, 0) = 1, C(n, n) = 1\n• C(n, 1) = n\n• C(n, 0) + C(n, 1) + ... + C(n, n) = 2ⁿ (Tüm alt kümelerin toplamı).',
        '▸ 3. Geometrik Kombinasyon:\n• Herhangi üçü doğrusal olmayan n noktadan:\n  • Doğru Sayısı = C(n, 2)\n  • Üçgen Sayısı = C(n, 3) (Doğrusal noktalardan oluşan üçgenler çıkarılır).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
5 doktor ve 6 hemşire arasından en az 2'si doktor olan 4 kişilik bir sağlık ekibi kaç farklı şekilde seçilebilir?

💡 ÇÖZÜM:
1. Toplam 4 kişilik ekip kurulacaktır. 'En az 2 doktor' şartı 3 farklı senaryo içerir:
• Senaryo 1: 2 Doktor ve 2 Hemşire: C(5, 2) · C(6, 2) = 10 · 15 = 150
• Senaryo 2: 3 Doktor ve 1 Hemşire: C(5, 3) · C(6, 1) = 10 · 6 = 60
• Senaryo 3: 4 Doktor ve 0 Hemşire: C(5, 4) · C(6, 0) = 5 · 1 = 5
2. Tüm bu senaryolar toplanır:
150 + 60 + 5 = 215 farklı şekilde seçilebilir.

🎯 PRATİK İPUCU: 'En az' sorularında şartı sağlayan tüm olasılık gruplarını listeleyip kombinasyonlarını hesaplayarak toplayın.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
Düzlemde herhangi üçü doğrusal olmayan 8 farklı nokta ile köşeleri bu noktalar olan kaç farklı üçgen çizilebilir?

💡 ÇÖZÜM:
1. Üçgen Çizme Kuralı: Üçgen oluşturmak için doğrusal olmayan herhangi 3 nokta seçilmelidir.
2. Kombinasyon formülü: C(n, 3) = n! / (3! · (n - 3)!).
3. C(8, 3) hesabı:
C(8, 3) = (8 · 7 · 6) / (3 · 2 · 1) = 336 / 6 = 56 farklı üçgen çizilebilir.
4. Doğrusal noktalar olsaydı, o doğrusal noktalardan seçilen üçlüler üçgen oluşturmayacağı için toplamdan çıkarılırdı!

🎯 PRATİK İPUCU: n noktadan üçgen sayısı C(n, 3), doğru sayısı C(n, 2), dörtgen sayısı C(n, 4) ile hesaplanır!''',
      ],
      goldenRule: 'C(n, a) = C(n, b) ise ya a = b\'dir ya da a + b = n\'dir. C(10, 8) yerine kolayca C(10, 2) hesaplanır.',
      osymTrap: 'Doğrusal noktalar üçgen oluşturamaz! Aynı doğru üzerinde 4 nokta varsa C(4, 3) adet üçgen hesaptan düşülmelidir.'
    ),
    LectureSection(
      title: 'Olasılık Kavramı ve Hesaplama Yöntemleri',
      type: LectureSectionType.comparison,
      leadText: 'Bir olayın gerçekleşme ihtimalinin matematiksel oranı (matematik1.pdf s. 113-114):',
      bulletPoints: [
        '▸ 1. Temel Olasılık Formülü:\n• P(A) = İstenen Durumların Sayısı / Tüm Durumların Sayısı = s(A) / s(E)\n• Olasılık değeri DAİMA 0 ile 1 arasındadır: 0 ≤ P(A) ≤ 1.\n• İmkânsız Olay: Gerçekleşmesi mümkün olmayan olaydır, P(A) = 0.\n• Kesin Olay: Her koşulda gerçekleşecek olaydır, P(A) = 1.\n• Bir olayın olma olasılığı ile olmama olasılığı toplamı 1\'dir: P(A) + P(A\') = 1.',
        '▸ 2. Bağımsız Olaylar:\n• Birbirini etkilemeyen olayların birlikte gerçekleşme olasılığı çarpılır:\n• P(A ve B) = P(A). P(B) (Zar atılması ve paranın atılması).',
        '▸ 3. Tüm Durumdan Çıkartma Taktiği ("En Az Bir" Soruları):\n• Soru kökünde "en az bir" geçiyorsa tersten gidilir:\n• P(En az bir) = 1 - P(Hiç olmama olasılığı).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
Bir torbada 4 kırmızı ve 5 beyaz bilye vardır. Torbadan rastgele çekilen 2 bilyenin DE AYNI RENKTE olma olasılığı kaçtır?

💡 ÇÖZÜM:
1. Toplam bilye sayısı: 4 + 5 = 9 bilye.
2. Örnek uzay (Tüm durumlar): 9 bilyeden 2 bilye seçimi:
C(9, 2) = (9 · 8) / (2 · 1) = 36.
3. İstenen durum: İkisinin de kırmızı VEYA ikisinin de beyaz olmasıdır:
• 2 Kırmızı seçimi: C(4, 2) = (4 · 3) / 2 = 6
• 2 Beyaz seçimi: C(5, 2) = (5 · 4) / 2 = 10
• İstenen toplam durum = 6 + 10 = 16.
4. Olasılık = İstenen / Tüm Durumlar = 16 / 36.
5. 4 ile sadeleştirelim: 16/36 = 4/9 bulunur.

🎯 PRATİK İPUCU: 'Veya' bağlacı durumları toplamayı gerektirir; istenen durumları ayrı ayrı kombinasyonla hesaplayıp toplayın.''',
      ],
      goldenRule: '"En az biri..." sorularında tersten gidin: 1\'den "hiç olmama" olasılığını çıkarın! Bu işlem çözümü 5 kat kısaltır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Torbada 4 beyaz, 6 siyah bilye var: İkisinin de beyaz olma olasılığı = C(4, 2) / C(10, 2) = 6 / 45 = 2/15.',
          wrong: '4/10 · 4/10 (Geri bırakılmadığı için ikinci çekilişte pay ve payda birer azalmalıdır: 4/10 · 3/9 = 2/15).',
          note: 'Geri bırakılmaksızın yapılan çekilişlerde pay ve payda birer eksilir.'
        ),
        ComparisonRow(
          correct: '5 kişilik gruptan 3 kişilik ekip seçimi = C(5, 3) = 10 (Sırasız seçim / Kombinasyon)',
          wrong: 'P(5, 3) = 60 (Hata: Sıralama değil ekip/komite seçildiğinde permütasyon kullanılmaz!)',
          note: 'Ekip, kurul, alt küme seçiminde sıra önemsizdir ve kombinasyon C(n, r) uygulanır.'
        )
      ]
    ),
    LectureSection(
      title: 'Veri Analizi: Daire ve Çizgi Grafikleri',
      type: LectureSectionType.ruleList,
      leadText: 'Daire grafiğinde açı dönüşümleri ve zaman serilerinde çizgi grafiği prensipleri:',
      imageAssetPath: 'assets/images/matematik/cicek_dagilim_daire_grafigi.png',
      imageCaption: 'Daire Grafiğinde Açı ve Yüzde Dağılımı Modeli (360° = %100)',
      bulletPoints: [
        '▸ 1. Daire Grafiği Prensipleri:\n• Daire grafiği bir bütünün parçalarını göstermek için en ideal modeldir.\n• Bir dairenin tamamı 360° ve %100 kabul edilir.\n• Derece Bağıntısı: Merkez Açı = (Kategori Değeri / Toplam Değer) · 360°.\n• Örnek: Toplam 720 adet çiçeğin 144 tanesi gül ise: (144 / 720) · 360° = 72° (Gül dilimi).',
        '▸ 2. Çizgi Grafiği Prensipleri:\n• Verilerin zaman içindeki artış ve azalış eğilimlerini (trendleri) kesintisiz gösterir.\n• Sıcaklık değişimleri, borsa kurları, aylara göre yağış miktarı çizgi grafiğiyle gösterilir.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
Bir çiçekçideki çiçeklerin türlerine göre dağılımında; Karanfil 144°, Zambak 108°, Gül 72° ve Nergis 36° merkez açıya sahiptir.
Bu çiçekçide toplam 360 adet çiçek olduğuna göre, kaç adet karanfil ve kaç adet nergis vardır?

💡 ÇÖZÜM:
1. Daire grafiğinin tamamı 360°'dir ve bu 360 adet çiçeğe karşılık gelmektedir.
2. 1 derecelik merkez açıya düşen çiçek sayısı:
360 / 360 = 1 çiçek/derece.
3. Karanfil açısı 144° olduğundan: 144 · 1 = 144 adet Karanfil vardır.
4. Nergis açısı 36° olduğundan: 36 · 1 = 36 adet Nergis vardır.
(Zambak: 108, Gül: 72; Toplam: 144 + 108 + 72 + 36 = 360 sağlar).

🎯 PRATİK İPUCU: Daire grafiklerinde toplam adedi 360'a bölerek 1 dereceye düşen birim miktarı bulun, ardından istenen açıyla çarpın!''',
      ],
      goldenRule: 'Daire grafiğinde daima doğru orantı kurun: Toplam Veri → 360° ise Parça Veri → x°!',
      osymTrap: 'Daire grafiğindeki açılar doğrudan miktarı göstermez, sadece ORANI gösterir; toplam miktar bilinmeden parça sayısı bulunamaz.'
    ),
    LectureSection(
      title: 'Veri Analizi: Sütun Grafiği ve Grafik Dönüşümleri',
      type: LectureSectionType.formula,
      leadText: 'Farklı kategorilerin karşılaştırılması ve sütun verilerinin daire dilimlerine dönüştürülmesi:',
      imageAssetPath: 'assets/images/matematik/urun_sutun_ve_daire_grafigi.png',
      imageCaption: 'Sütun Grafiğinin Daire Grafiğine Dönüştürülmesi (Toplam = 36.000 kg → 360°)',
      bulletPoints: [
        '▸ 1. Sütun Grafiği:\n• Veri gruplarını dikey veya yatay sütunlarla karşılaştırır.\n• Sütunların genişlikleri eşit, yükseklikleri ise temsil ettikleri veri miktarıyla orantılıdır.',
        '▸ 2. Sütun Grafiğini Daire Grafiğine Çevirme:\n• 1. Adım: Bütün sütunların değerleri toplanıp TOPLAM MİKTAR bulunur.\n• 2. Adım: Her bir sütun değeri toplam miktara bölünüp 360° ile çarpılarak o kategoriye ait merkez açı hesaplanır.'
      ],
      goldenRule: 'Grafik dönüşümünde anahtar sayı TOPLAMDIR! Önce toplamı bulun, sonra 360 dereceye oranlayın.'
    ),
    LectureSection(
      title: 'Sayma, Olasılık ve İstatistik Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'MEB matematik1.pdf Bölüm 13 ve 16 değerlendirme sınav soruları ve ayrıntılı çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Rize\'den Ankara\'ya 4 farklı yol, Ankara\'dan İstanbul\'a 3 farklı yol vardır · Rize\'den İstanbul\'a gitmek isteyen bir kişi Ankara\'ya uğramak şartıyla kaç farklı yoldan gidebilir? (MEB Bölüm 16 Soru 1)',
          options: [
            'A) 7',
            'B) 10',
            'C) 12',
            'D) 15',
            'E) 16'
          ],
          correctIndex: 2,
          explanation: 'Çarpma yoluyla sayma kuralına göre ardışık gerçekleşen yollar çarpılır:\nToplam Yol = 4 · 3 = 12 farklı yoldan gidebilir.',
          ruleTag: 'Çarpma Yoluyla Sayma'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bir torbada 4 beyaz ve 6 siyah bilye vardır · Torbadan rastgele çekilen iki bilyenin ikisinin de beyaz olma olasılığı kaçtır? (MEB Bölüm 16 Olasılık)',
          options: [
            'A) 2/15',
            'B) 1/5',
            'C) 4/15',
            'D) 1/3',
            'E) 2/5'
          ],
          correctIndex: 0,
          explanation: 'İstenen durum / Tüm durumlar:\n1 · Torbada toplam 4 + 6 = 10 bilye vardır.\n2 · 10 bilyeden 2 bilye seçimi: C(10, 2) = (10 · 9) / (2 · 1) = 45 tüm durumlar.\n3 · 4 beyaz bilyeden 2 beyaz bilye seçimi: C(4, 2) = (4 · 3) / (2 · 1) = 6 istenen durumlar.\n4 · Olasılık = 6 / 45 = 2 / 15 bulunur.',
          ruleTag: 'Kombinasyonlu Basit Olasılık'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bir sınıftaki öğrencilerin kan grupları dağılımı bir daire grafiğinde gösterildiğinde A grubu 120°, B grubu 90°, AB grubu 30° ve 0 grubu kalan açıyla temsil ediliyor · Sınıfta 60 öğrenci olduğuna göre 0 kan grubuna sahip kaç öğrenci vardır? (MEB Bölüm 13 Veri Analizi)',
          options: [
            'A) 15',
            'B) 18',
            'C) 20',
            'D) 24',
            'E) 25'
          ],
          correctIndex: 2,
          explanation: '1 · Dairenin tamamı 360° dir.\n2 · Verilen açıları toplayalım: 120° + 90° + 30° = 240°.\n3 · 0 grubuna kalan açı: 360° - 240° = 120° dir.\n4 · 360° de 120° dilim, dairenin 120/360 = 1/3\'üdür.\n5 · Sınıfta toplam 60 öğrenci olduğuna göre: 60 · (1/3) = 20 öğrenci bulunur.',
          ruleTag: 'Daire Grafiğinde Açı ve Miktar Hesabı'
        ),
        LectureInteractiveQuiz(
          prompt: '7 kişilik bir gruptan 3 kişilik bir çalışma komisyonu kaç farklı şekilde seçilebilir? (MEB Bölüm 16 Kombinasyon)',
          options: [
            'A) 21',
            'B) 35',
            'C) 42',
            'D) 70',
            'E) 210'
          ],
          correctIndex: 1,
          explanation: 'Grup seçimi kombinasyon (sırasız seçim) formülü ile yapılır:\nC(7, 3) = (7 · 6 · 5) / (3 · 2 · 1) = 210 / 6 = 35 farklı şekilde seçilebilir.',
          ruleTag: 'Kombinasyon Formülü'
        )
      ]
    )
  ],
);

final LectureTopic matematikSaymaOlasilikIstatistik = matematikKonu10;
