// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu9 = LectureTopic(
  id: 'matematik_konu_9',
  courseId: 'matematik',
  order: 9,
  title: 'Kümeler, Fonksiyonlar ve Modüler Aritmetik',
  subtitle: 'Küme İşlemleri, Alt Küme Formülü, Fonksiyon Türleri, Bileşke/Ters Fonksiyon, İşlem ve Mod Kavramı',
  icon: Icons.hub,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 81 - 90',
  startTestNum: 81,
  endTestNum: 90,
  estimatedMinutes: 55,
  sections: [
    LectureSection(
      title: 'Kümeler ve Küme İşlemleri',
      type: LectureSectionType.overview,
      leadText: 'İyi tanımlanmış, birbirinden farklı nesneler topluluğuna küme denir (matematik1.pdf s. 95-98):',
      bulletPoints: [
        '▸ 1. Alt Küme Bağıntıları:\n• n elemanlı bir kümenin:\n  • Alt küme sayısı = 2ⁿ\n  • Öz alt küme sayısı (kendisi hariç) = 2ⁿ - 1\n  • r elemanlı alt küme sayısı = C(n, r) = n! / [r! . (n - r)!].',
        '▸ 2. Küme İşlemleri:\n• Birleşim (A U B): A veya B\'deki tüm elemanlar: s(A ∪ B) = s(A) + s(B) - s(A ∩ B)\n• Kesişim (A n B): Hem A\'da hem B\'de bulunan ortak elemanlar · A n B = Ø ise A ve B ayrık kümelerdir.\n• Fark (A \\ B): A\'da olup B\'de olmayan elemanlar: s(A) = s(A \\ B) + s(A ∩ B).\n• Tümleyen (A\'): Evrensel kümede olup A\'da olmayan elemanlar: s(A) + s(A\') = s(E).',
        '▸ 3. De Morgan Kuralları:\n• (A U B)\' = A\' n B\'\n• (A n B)\' = A\' U B\'',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
35 kişilik bir sınıfta herkes en az bir yabancı dil bilmektedir. İngilizce bilen 22 kişi, Almanca bilen 19 kişi olduğuna göre, her iki dili de bilen kaç kişi vardır?

💡 ÇÖZÜM:
1. Birleşim eleman sayısı formülü: s(İ U A) = s(İ) + s(A) - s(İ ∩ A).
2. Herkes en az bir dil bildiğinden s(İ U A) = 35'tir.
3. Değerleri yerine koyalım:
35 = 22 + 19 - s(İ ∩ A)
35 = 41 - s(İ ∩ A) ⇒ s(İ ∩ A) = 41 - 35 = 6.
4. Her iki dili de bilen 6 öğrenci vardır.

🎯 PRATİK İPUCU: Ayrı ayrı toplam (22 + 19 = 41) mevcudu ne kadar aşıyorsa (41 - 35 = 6), aradaki fark kesişim kümesidir.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
35 kişilik bir sınıfta futbol oynayanların sayısı 20, basketbol oynayanların sayısı 18 ve her iki sporu da oynayanların sayısı 7'dir.
Buna göre, bu sınıfta bu iki spordan hiçbirini oynamayan kaç kişi vardır?

💡 ÇÖZÜM:
1. Birleşim Formülü: s(F ∪ B) = s(F) + s(B) - s(F ∩ B)
s(F ∪ B) = 20 + 18 - 7 = 31 kişi en az bir sporu oynamaktadır.
2. Hiçbir sporu oynamayanlar evrensel kümeden birleşimin çıkarılmasıyla bulunur:
Hiç oynamayanlar = Sınıf Mevcudu - s(F ∪ B)
= 35 - 31 = 4 kişi bulunur.

🎯 PRATİK İPUCU: Kesişim iki kez sayıldığı için toplamdan çıkarılır; en az birini yapanları bulup sınıftan düşerek hiçbirini yapmayanları bulun!''',
      ],
      goldenRule: 's(A ∪ B) = s(A) + s(B) - s(A ∩ B) formülünde kesişim iki kere toplanmış olduğu için 1 kez çıkarılır.',
      osymTrap: 'Boş kümenin alt küme sayısı 2⁰ = 1\'dir (Boş küme her kümenin alt kümesidir!).'
    ),
    LectureSection(
      title: 'Fonksiyon Kavramı ve Türleri',
      type: LectureSectionType.formula,
      leadText: 'A kümesinin her elemanını B kümesinin yalnız bir elemanıyla eşleyen bağıntıya fonksiyon denir: f: A → B (matematik1.pdf s. 101-104):',
      bulletPoints: [
        '▸ 1. Fonksiyon Olma Şartı:\n• Tanım kümesinde (A) açıkta eleman KALAMAZ.\n• Tanım kümesindeki bir eleman değer kümesinden (B) BİRDEN FAZLA elemana gidemez (Her çocuğun yalnız bir biyolojik annesi vardır kuralı).',
        '▸ 2. Fonksiyon Çeşitleri:\n• Bire Bir Fonksiyon: Farklı elemanların görüntüleri de farklıdır: x₁ ≠ x₂ ise f(x₁) ≠ f(x₂).\n• Örten Fonksiyon: Değer kümesinde (B) açıkta eleman kalmaz: f(A) = B.\n• Sabit Fonksiyon: Tanım kümesindeki her eleman tek bir sabite gider: f(x) = c.\n• Birim (Özdeşlik) Fonksiyon: İçi dışı bir olan fonksiyondur: f(x) = x (f(5)=5, f(2x+1)=2x+1).\n• Doğrusal Fonksiyon: Grafiği doğru olan fonksiyon: f(x) = ax + b.\n• Tek ve Çift Fonksiyonlar:\n  • f(-x) = f(x) ise ÇİFT fonksiyondur (y eksenine göre simetrik: f(x)=x^2, cosx).\n  • f(-x) = -f(x) ise TEK fonksiyondur (orijine göre simetrik: f(x)=x^3, sinx).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
f(2x - 3) = 4x + 5
olduğuna göre, f(7) değeri kaçtır?

💡 ÇÖZÜM:
1. Fonksiyonun parantez içi 7'ye eşitlenir: 2x - 3 = 7.
2. 2x = 10 ⇒ x = 5 yazılmalıdır.
3. Şimdi eşitliğin sağ tarafında x yerine 5 koyalım:
f(7) = 4·(5) + 5 = 20 + 5 = 25 bulunur.

🎯 PRATİK İPUCU: f(a) sorulduğunda parantezin içine a yazmayın; parantezin İÇİNİ a'ya eşitleyip gereken x değerini bulun!''',
      ],
      goldenRule: 'Birim fonksiyonda f(ne varsa) = o çıkar: f(x) = x, f(3x - 1) = 3x - 1 · Sabit fonksiyonda x\'li terim bulunamaz (katsayıları sıfırlanır).',
      osymTrap: 'Doğrusal fonksiyon dendiğinde soru kökünde formülü aramayın; doğrudan f(x) = ax + b yazıp verilen noktaları yerine koyarak a ve b\'yi bulun.'
    ),
    LectureSection(
      title: 'Bileşke ve Ters Fonksiyon',
      type: LectureSectionType.comparison,
      leadText: 'Fonksiyonların bileşkesi ve tersinin alınması kuralları (matematik1.pdf s. 105-106):',
      bulletPoints: [
        '▸ 1. Bileşke Fonksiyon ((f o g)(x)):\n• (f o g)(x) = f(g(x)) (Önce içerideki g hesaplanır, çıkan sonuç f\'e yazılır).\n• Bileşke işleminde değişme özelliği YOKTUR: f o g ≠ g o f.',
        '▸ 2. Ters Fonksiyon (f⁻¹(x)):\n• Bir fonksiyonun tersinin olabilmesi için fonksiyonun BİRE BİR VE ÖRTEN olması şarttır!\n• f(a) = b ≤> f⁻¹(b) = a (Girdi ile çıktı yer değiştirir).\n• Pratik Ters Alma Formülleri:\n  • f(x) = ax + b ise → f⁻¹(x) = (x - b) / a\n  • f(x) = (ax + b) / (cx + d) ise → f⁻¹(x) = (-dx + b) / (cx - a) (Çaprazdaki a ile d hem yer hem işaret değiştirir!).\n• (f o f⁻¹)(x) = I(x) = x (Bir fonksiyon tersiyle işleme girerse birim fonksiyon çıkar).',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
f(x) = (3x + 2) / (2x - 5)
fonksiyonunun tersi olan f⁻¹(x) fonksiyonunu bulunuz.

💡 ÇÖZÜM:
1. Altın Kural: f(x) = (ax + b) / (cx + d) rasyonel fonksiyonunun tersinde paydaki x'in katsayısı (a) ile paydadaki sabit sayı (d) HEM YER HEM İŞARET DEĞİŞTİRİR:
f⁻¹(x) = (-dx + b) / (cx - a).
2. Burada a = 3, b = 2, c = 2, d = -5'tir.
3. a ve d yer ve işaret değiştirirse: -5 yukarıya +5 olarak, +3 aşağıya -3 olarak geçer.
4. f⁻¹(x) = (5x + 2) / (2x - 3) bulunur.

🎯 PRATİK İPUCU: Çapraz yer ve işaret değişimi kuralını unutmayın: sol üstteki katsayı ile sağ alttaki sabit sayı zıt işaretle yer değiştirir.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
f(x) = (3x + 5) / (2x - 4) olduğuna göre,
f⁻¹(x) ters fonksiyonu nedir ve tanımsız yapan x değerleri nelerdir?

💡 ÇÖZÜM:
1. Rasyonel Fonksiyonun Tersi Kuralı:
f(x) = (ax + b) / (cx + d) ise f⁻¹(x) = (-dx + b) / (cx - a)'dır.
(Paydaki x'in katsayısı ile paydadaki sabit sayı hem yer hem işaret değiştirir!).
2. f(x) = (3x + 5) / (2x - 4) ifadesinde:
a = 3 ve d = -4'tür.
İşaret değiştirip yer değiştirelim: -4 sayısı paya +4x olarak, 3 sayısı paydaya -3 olarak geçer:
f⁻¹(x) = (4x + 5) / (2x - 3) bulunur.
3. f(x)'i tanımsız yapan değer: 2x - 4 = 0 ⇒ x = 2.
f⁻¹(x)'i tanımsız yapan değer: 2x - 3 = 0 ⇒ x = 3/2.

🎯 PRATİK İPUCU: (ax + b) / (cx + d) kalıbında sol üst (a) ile sağ alt (d) çaprazını hem yer hem işaret değiştirerek tersi 2 saniyede yazın!''',
      ],
      goldenRule: 'f(ax + b) = c ise tersini almaya uğraşmayın: f⁻¹(c) = ax + b kuralıyla parantezin içi ile dışını doğrudan yer değiştirin!',
      comparisonRows: [
        ComparisonRow(
          correct: 'f(x) = (2x + 3) / (4x - 5)  =>  f⁻¹(x) = (5x + 3) / (4x - 2)',
          wrong: 'f⁻¹(x) = (-5x + 3) / (4x + 2) veya sadece katsayıların yerini değiştirmek (İşaretler değişmezse yanlış olur!)',
          note: 'f(x) = (ax + b) / (cx + d) kuralında paydaki a ile paydadaki d HEM YER HEM İŞARET değiştirir: f⁻¹(x) = (-dx + b) / (cx - a).'
        ),
        ComparisonRow(
          correct: '(f o g)(x) = f(g(x)) (Önce sağdaki g(x) hesaplanır, sonra f\'e yazılır)',
          wrong: '(f o g)(x) = (g o f)(x) (Hata: Bileşke işleminde değişme özelliği YOKTUR!)',
          note: 'Fonksiyon bileşkesinde sıra hayati önem taşır; f(g(x)) ile g(f(x)) kural olarak birbirine eşit değildir.'
        )
      ]
    ),
    LectureSection(
      title: 'İşlem ve Modüler Aritmetik (Periyodik Tekrarlar)',
      type: LectureSectionType.ruleList,
      leadText: 'Özel tanımlı işlemler ve kalan sınıfları (matematik1.pdf s. 107-110):',
      bulletPoints: [
        '▸ 1. Özel Tanımlı İşlem:\n• a * b = 2a + 3b - 5 şeklinde kuralı soru tarafından verilen cebirsel bağıntılardır.\n• Etkisiz eleman e: a * e = a eşitliğiyle bulunur.\n• Ters eleman a^(-1): a * a^(-1) = e eşitliğiyle bulunur.',
        '▸ 2. Modüler Aritmetik Mantığı:\n• a = b (mod m) demek: a\'nın m ile bölümünden kalan b\'dir demektir.\n• Gün / Saat / Nöbet Problemleri:\n  • Haftanın günleri 7 günde bir devreder (mod 7).\n  • Saat soruları 24 saatte bir devreder (mod 24).\n  • n nöbet soruları: 1 · nöbet tutulduktan sonra geriye kalan (n - 1) nöbet gün aralığıyla çarpılıp mod 7\'ye bölünür.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
Reel sayılar kümesinde tanımlı x Δ y = 2x + 2y - xy - 2 işlemi veriliyor.
Buna göre, bu işlemin birim (etkisiz) elemanı kaçtır?

💡 ÇÖZÜM:
1. Birim Eleman Tanımı: Bir e elemanı için her x reel sayısı x Δ e = x eşitliğini sağlamalıdır.
2. İşlemde y yerine e yazıp x'e eşitleyelim:
2x + 2e - x · e - 2 = x
3. x terimini sol tarafa alalım ve e parantezine ayıralım:
x - 2 + e(2 - x) = 0
(x - 2) - e(x - 2) = 0
(x - 2) · (1 - e) = 0
4. Bu eşitliğin tüm x değerleri için daima sıfır olması için:
1 - e = 0 ⇒ e = 1 bulunur.

🎯 PRATİK İPUCU: Birim eleman sorularında işlemde y yerine e yazıp doğrudan x'e eşitleyin ve e'yi yalnız bırakın!''',
      ],
      goldenRule: 'Nöbet sorularında İLK NÖBET TUTULDUĞU İÇİN geriye (n - 1) nöbet kalır! 5 · nöbeti arıyorsanız 4 periyot ilerletirsiniz.',
      osymTrap: 'Geriye doğru gün sayarken kalanı 7\'den çıkararak veya modu ekleyerek pozitif güne çevirmeyi unutmayın.'
    ),
    LectureSection(
      title: 'Kümeler ve Fonksiyonlar Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 14 ve 15 değerlendirme soruları:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 's(A) = 8, s(B) = 12 ve s(A ∩ B) = 3 olduğuna göre s(A ∪ B) kaçtır? (MEB Bölüm 14 Kümeler Testi)',
          options: [
            'A) 15',
            'B) 17',
            'C) 20',
            'D) 23',
            'E) 24'
          ],
          correctIndex: 1,
          explanation: 'Kümelerde birleşim eleman sayısı formülü:\ns(A ∪ B) = s(A) + s(B) - s(A ∩ B)\ns(A ∪ B) = 8 + 12 - 3 = 20 - 3 = 17 bulunur.',
          ruleTag: 'Kümelerde Birleşim Formülü'
        ),
        LectureInteractiveQuiz(
          prompt: 'f(2x - 1) = 3x + 5 olduğuna göre f(5) değeri kaçtır? (MEB Bölüm 15 Fonksiyonlar Testi)',
          options: [
            'A) 11',
            'B) 14',
            'C) 17',
            'D) 20',
            'E) 23'
          ],
          correctIndex: 1,
          explanation: 'f(5) değerini bulmak için parantezin içini 5 yapan x değerini buluruz:\n2x - 1 = 5\n2x = 6\nx = 3\nŞimdi fonksiyonda x yerine 3 yazalım:\nf(2 · 3 - 1) = 3 · (3) + 5\nf(5) = 9 + 5 = 14 bulunur.',
          ruleTag: 'Fonksiyonda Değer Hesaplama'
        ),
        LectureInteractiveQuiz(
          prompt: 'f(x) doğrusal bir fonksiyondur · f(1) = 5 ve f(3) = 11 olduğuna göre f(5) kaçtır?',
          options: [
            'A) 15',
            'B) 16',
            'C) 17',
            'D) 18',
            'E) 20'
          ],
          correctIndex: 2,
          explanation: 'f(x) doğrusal fonksiyon ise f(x) = ax + b şeklindedir.\n1) f(1) = a + b = 5\n2) f(3) = 3a + b = 11\nTaraf tarafa çıkarırsak: 2a = 6 → a = 3.\na = 3 ise 3 + b = 5 → b = 2.\nO halde f(x) = 3x + 2\'dir.\nf(5) = 3 · (5) + 2 = 15 + 2 = 17 bulunur.',
          ruleTag: 'Doğrusal Fonksiyon'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bugün günlerden Salı olduğuna göre 100 gün sonra hangi gün olur? (Modüler Aritmetik Periyodik Durumlar)',
          options: [
            'A) Çarşamba',
            'B) Perşembe',
            'C) Cuma',
            'D) Cumartesi',
            'E) Pazar'
          ],
          correctIndex: 1,
          explanation: 'Günler 7 günde bir kendini tekrarlar (mod 7).\n100 sayısını 7\'ye bölelim:\n100 = 7 · 14 + 2 (Kalan = 2).\nBugün Salı olduğuna göre 2 gün ileri sayarız:\n1 · gün: Çarşamba\n2 · gün: Perşembe bulunur.',
          ruleTag: 'Periyodik Tekrar ve Modüler Aritmetik'
        )
      ]
    )
  ],
);

final LectureTopic matematikKumelerFonksiyonlarModuler = matematikKonu9;
