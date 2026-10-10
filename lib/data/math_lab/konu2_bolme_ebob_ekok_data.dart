import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 2: Bölünebilme Kuralları ve EBOB - EKOK İnteraktif Veri Kümesi
class Konu2BolmeEbobEkokData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 2,
    title: 'Bölünebilme Kuralları ve EBOB - EKOK',
    subtitle: 'Bölme Bağıntısı, Asal Çarpanlar, Pozitif Bölen Sayısı, Bölünebilme ve EBOB-EKOK Problemleri',
    icon: Icons.alt_route_rounded,
    themeColor: Color(0xFF0284C7), // Sky / Cyan Math Blue
    osymWeight: '2 - 3 Soru (Sınavın 5. - 7. Soruları)',
    keyOutcomes: [
      'Bölme işleminde kalanın daima bölenden küçük (0 ≤ K < B) olduğunu unutmamak',
      'Asal çarpanlara ayırıp üsleri birer artırarak Pozitif Bölen Sayısını (PBS) ve tek/çift bölenleri hesaplamak',
      'Bileşik bölünebilmede (36, 45, 15) DAİMA önce son basamağı (4, 5), sonra rakamlar toplamını (3, 9) uygulamak',
      'Bütünden parçaya gidiliyorsa EBOB (Ağaç dikme, poşetleme); parçadan bütüne gidiliyorsa EKOK (Ziller, nöbet) kullanmak',
      'İki sayının çarpımının EBOB ile EKOK çarpımına eşit olduğunu: a · b = EBOB(a,b) · EKOK(a,b) refleks haline getirmek',
    ],
    socraticProblems: [
      // PROBLEM 1: 36 ile Bölünebilme ve İki Basamaklı İnceleme
      SocraticProblem(
        id: 'socratic_k2_p1',
        title: '36 ile Bölünebilme ve İki Kademeli Kural',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: 'Dört basamaklı 5a7b sayısı 36 ile tam bölünebildiğine göre, a\'nın alabileceği DEĞERLER TOPLAMI kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Aralarında Asal Çarpanları Belirleme',
            prompt: 'Bir sayının 36 ile tam bölünebilmesi için hangi iki aralarında asal sayıya tam bölünmesi gerekir?',
            mathematicalHint: 'Çarpımları 36 olan ve ortak böleni olmayan (aralarında asal) iki sayı seçin.',
            options: [
              '6 ve 6 (Aralarında asal değildir!)',
              '4 ve 9 (Aralarında asaldır: EBOB=1)',
              '2 ve 18',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! 36 ile bölünebilme için sayı aralarında asal olan 4 ve 9 ile tam bölünmelidir. 6 ve 6 aralarında asal değildir!',
            goldenTactic: '🎯 Altın Kural: 36 = 4 · 9, 45 = 5 · 9, 15 = 3 · 5, 12 = 3 · 4 (Çarpanlar aralarında asal olmalıdır).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Önce Son Basamak Kuralını Uygulama (4 Kuralı)',
            prompt: 'Önce hangi kuralı uygulamalıyız ve 5a7b sayısında 4 ile bölünebilmesi için b hangi değerleri alabilir?',
            mathematicalHint: 'Son iki basamak (7b) 4\'ün katı olmalıdır. 70\'li sayılardan hangileri 4\'e bölünür?',
            options: [
              'Önce 9 kuralı uygulanır; b = 1, 3, 5 olabilir.',
              'Önce son basamağı bağlayan 4 kuralı uygulanır: 7b sayısı 4\'ün katı olmalıdır ⇒ b = 2 veya b = 6.',
              'b sadece 0 olabilir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika sıra! Daima ÖNCE son basamağı bağlayan kural uygulanır. 72 ve 76 dörde tam bölünür. Dolayısıyla b = 2 veya b = 6 olabilir.',
            goldenTactic: '🎯 SIRA KURALI: Önce son basamağı bağlayan kurallar (4, 5, 8), en son rakamlar toplamı (3, 9) uygulanır.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: 9 ile Bölünebilmeden a Değerlerini Çözme',
            prompt: 'Durum 1 (b=2): Sayı 5a72 olur.\nDurum 2 (b=6): Sayı 5a76 olur.\n9 ile bölünmesi için rakamlar toplamı 9\'un katı olacağına göre a\'nın değerleri toplamı kaçtır?',
            mathematicalHint: '5+a+7+2 = 14+a ⇒ a=4.\n5+a+7+6 = 18+a ⇒ a=0 veya a=9.',
            options: [
              'a = {4} ⇒ Toplam = 4',
              'a = {0, 4, 9} ⇒ Toplam = 0 + 4 + 9 = 13',
              'a = {4, 6} ⇒ Toplam = 10',
            ],
            correctOptionIndex: 1,
            explanation: 'Bravo! b=2 için 14 + a = 18 ⇒ a = 4. b=6 için 18 + a sayısı 9\'un katı olması için a = 0 veya a = 9 olabilir. Toplam: 0 + 4 + 9 = 13!',
            goldenTactic: '🎯 a birler/yüzler basamağında olduğundan 0 değerini de alabilir! 0\'ı unutmamak kritik puandır.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 13. a ∈ {0, 4, 9} değerlerini alır.',
      ),

      // PROBLEM 2: EBOB Problemi (Hacim ve Küp Koli Paylaştırma)
      SocraticProblem(
        id: 'socratic_k2_p2',
        title: 'EBOB: Depoya Küp Koli Yerleştirme Problemi',
        examYear: 'KPSS Lisans Standart Problem',
        rawQuestion: 'Ayrıtları 24 m, 36 m ve 60 m olan dikdörtgenler prizması şeklindeki bir depoya, hiç boşluk kalmayacak şekilde EŞİT HACİMLİ KÜP KOLİLER yerleştirilecektir.\nBuna göre, EN AZ kaç koli gereklidir?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: EBOB mu EKOK mu Kararı',
            prompt: 'Büyük bir depoyu küçük küp kolilere parçalıyoruz. Koli sayısının EN AZ olması için küpün bir ayrıtı en büyük olmalıdır. Hangi işlem yapılmalıdır?',
            mathematicalHint: 'Bütünden eşit parçalara ayırma (bölme) işlemi yapılıyorsa EBOB kullanılır.',
            options: [
              'Ayrıtların EKOK\'u alınmalıdır.',
              'Ayrıtların EBOB\'u alınmalıdır: Küpün bir ayrıtı = EBOB(24, 36, 60).',
              'Ayrıtlar toplanmalıdır.',
            ],
            correctOptionIndex: 1,
            explanation: 'Kesinlikle doğru! Büyük bir bütünü eşit küçük parçalara bölüyorsak EBOB kullanılır. Küpün bir ayrıtı = EBOB(24, 36, 60).',
            goldenTactic: '🎯 BÜTÜN → PARÇA = EBOB! (Poşetleme, küp koli, ağaç dikme daima EBOB\'dur).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: EBOB Hesabı',
            prompt: '24, 36 ve 60 sayılarının En Büyük Ortak Böleni (EBOB) kaçtır?',
            mathematicalHint: 'Üçünü de aynı anda bölen en büyük sayıyı bulun.',
            options: [
              'EBOB = 6',
              'EBOB = 12',
              'EBOB = 24',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! 24 = 12·2, 36 = 12·3, 60 = 12·5. En büyük ortak bölen 12 metredir. Yani küpün bir kenarı 12 m olmalıdır.',
            goldenTactic: '🎯 Ortak çarpanları en büyük olan sayı 12\'dir.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Toplam Koli Sayısı Hesabı',
            prompt: 'Deponun hacmi (24 · 36 · 60) olduğuna ve her koli (12 · 12 · 12) hacminde olduğuna göre en az kaç koli gerekir?',
            mathematicalHint: 'Her boyutu ayrı ayrı 12\'ye bölüp çarpın: (24/12) · (36/12) · (60/12).',
            options: [
              '2 + 3 + 5 = 10',
              '2 · 3 · 5 = 30 koli',
              '24 · 36 · 60 / 12 = 4320 koli',
            ],
            correctOptionIndex: 1,
            explanation: 'Tebrikler! Enine 24/12 = 2 koli, boyuna 36/12 = 3 koli, yüksekliğine 60/12 = 5 koli sığar. Toplam = 2 · 3 · 5 = 30 adet koli yerleştirilebilir.',
            goldenTactic: '🎯 Hacim bölmelerinde boyutları tek tek EBOB\'a bölüp birbiriyle çarpın: (a/E) · (b/E) · (c/E).',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 30 koli. EBOB(24, 36, 60) = 12 m bulundu.',
      ),

      // PROBLEM 3: EKOK Problemi (Sabit Farklı Kat Problemi)
      SocraticProblem(
        id: 'socratic_k2_p3',
        title: 'EKOK: Kalanlı Sayma ve Ortak Kat Problemi',
        examYear: 'KPSS Genel Yetenek / Ön Lisans Soru Tipi',
        rawQuestion: 'Bir sepetteki cevizler 5\'er 5\'er sayıldığında 3, 6\'şar 6\'şar sayıldığında 4, 8\'er 8\'er sayıldığında 6 ceviz artmaktadır.\nSepetteki ceviz sayısı 300\'den fazla olduğuna göre, sepette EN AZ kaç ceviz vardır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Sabit Farkı Yakalama',
            prompt: 'Bölenler (5, 6, 8) ile kalanlar (3, 4, 6) arasındaki farklara dikkat edin:\n5 - 3 = 2\n6 - 4 = 2\n8 - 6 = 2\nBu sabit fark ne anlama gelir?',
            mathematicalHint: 'Sepetteki ceviz sayısına A dersek; sepete 2 ceviz daha ekleseydik sayı 5, 6 ve 8\'e tam bölünecekti.',
            options: [
              'Ceviz sayısından 2 çıkarırsak tam bölünür.',
              'Ceviz sayısına 2 eklersek (A + 2), hem 5\'in, hem 6\'nın, hem de 8\'in tam katı olur!',
              'Ceviz sayısı 5 · 6 · 8\'dir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika yakaladınız! Her bölenden 2 eksik ceviz var. Eğer 2 ceviz daha olsaydı (A + 2 sayısı) 5, 6 ve 8\'in tam katı olacaktı.',
            goldenTactic: '🎯 Bölen ile kalan arasındaki fark eşitse: Sayıya bu fark eklenir (A + 2 = EKOK).',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: EKOK(5, 6, 8) Hesabı',
            prompt: '5, 6 ve 8 sayılarının En Küçük Ortak Katı (EKOK) kaçtır?',
            mathematicalHint: '5, 6 ve 8\'in en küçük ortak katını bulun.',
            options: [
              '60',
              '120',
              '240',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! 8 = 2³, 6 = 2 · 3, 5 = 5. EKOK = 2³ · 3 · 5 = 8 · 3 · 5 = 120\'dir.',
            goldenTactic: '🎯 Ortak kat 120 ve 120\'nin katlarıdır (120, 240, 360, ...).',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Şartı Sağlayan Katı Bulma ve 2 Çıkarma',
            prompt: 'Ceviz sayısı 300\'den fazla olduğuna göre 120\'nin 300\'den büyük en küçük katı kaçtır ve gerçek ceviz sayısı A nedir?',
            mathematicalHint: 'A + 2 = 120k. 300\'den büyük ilk kat 120 · 3 = 360\'tır. A + 2 = 360 ise A = ?',
            options: [
              'A = 360 + 2 = 362',
              'A = 360 - 2 = 358 ceviz',
              'A = 240 - 2 = 238',
            ],
            correctOptionIndex: 1,
            explanation: 'Mükemmel! A + 2 = 360 olmalıdır. Buradan A = 360 - 2 = 358 ceviz bulunur! Eklediğimiz 2 cevizi geri çıkarmayı unutmadınız.',
            goldenTactic: '🎯 Eklenen 2 ceviz en sonda geri çıkarılır: A = 360 - 2 = 358.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 358 ceviz. EKOK(5,6,8) = 120 ⇒ 360 - 2 = 358.',
      ),

      // PROBLEM 4: Pozitif Bölen Sayısı ve Çift Bölenler
      SocraticProblem(
        id: 'socratic_k2_p4',
        title: 'Asal Çarpanlar ve Çift Bölen Sayısı',
        examYear: 'KPSS Genel Yetenek / Lisans',
        rawQuestion: '120 sayısının pozitif tam sayı bölenlerinden KAÇ TANESİ ÇİFT sayıdır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: 120\'yi Asal Çarpanlarına Ayırma',
            prompt: '120 sayısının asal çarpanlarına ayrılmış hali hangisidir?',
            mathematicalHint: '120 = 12 · 10 = (4 · 3) · (2 · 5).',
            options: [
              '2² · 3 · 10',
              '2³ · 3¹ · 5¹',
              '2 · 3² · 5',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! 120 = 8 · 15 = 2³ · 3¹ · 5¹ şeklinde asal çarpanlarına ayrılır.',
            goldenTactic: '🎯 Tabanların daima ASAL olduğundan emin olun.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Toplam Pozitif Bölen Sayısını (PBS) Bulma',
            prompt: '2³ · 3¹ · 5¹ ifadesinde Pozitif Bölen Sayısı (PBS) formülü nasıl uygulanır?',
            mathematicalHint: 'Üsler birer artırılıp çarpılır: (3+1) · (1+1) · (1+1).',
            options: [
              '3 · 1 · 1 = 3',
              '(3+1) · (1+1) · (1+1) = 4 · 2 · 2 = 16 tane',
              '3 + 1 + 1 = 5',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! 120\'nin toplam 16 adet pozitif tam sayı böleni vardır.',
            goldenTactic: '🎯 PBS = (x+1)(y+1)(z+1).',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Çift Bölen Sayısını Bulma (Taktik)',
            prompt: 'Çift bölen sayısını bulmak için tek bölenleri (2 çarpanını silerek 3¹ · 5¹ bölenlerini) tüm bölenlerden çıkaralım. Tek bölen sayısı ve dolayısıyla çift bölen sayısı kaçtır?',
            mathematicalHint: 'Tek bölenler: (1+1)·(1+1) = 4 tane. Çift bölenler = Toplam (16) - Tek bölenler (4).',
            options: [
              'Tek: 4 tane, Çift: 16 - 4 = 12 tane',
              'Tek: 8 tane, Çift: 8 tane',
              'Çift: 16 tane',
            ],
            correctOptionIndex: 0,
            explanation: 'Tebrikler! 2 çarpanı tamamen atıldığında tek bölenler (1+1)·(1+1) = 4 tanedir. 16 - 4 = 12 tanesi ise ÇİFT böldendir!',
            goldenTactic: '🎯 ÇİFT BÖLEN SAYISI = Tüm Bölenler (16) - Tek Bölenler (4) = 12 tane.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 12 tane çift böleni vardır (Toplam: 16, Tek: 4).',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k2_1',
        questionText: 'Dört basamaklı 4a6b sayısı 15 ile tam bölünebilmektedir. Buna göre a\'nın alabileceği değerler toplamı kaçtır?',
        studentSteps: [
          '1. Adım: 15 ile bölünebilmesi için sayı hem 3 hem 5 ile bölünmelidir.',
          '2. Adım: Önce 3 kuralı uygulanır: 4 + a + 6 + b = 10 + a + b = 3\'ün katı.',
          '3. Adım: Buradan a ve b için değer denemeleri yapılır.',
        ],
        wrongStepIndex: 1, // 2. Adımda hata (sıralama hatası)
        mistakeExplanation: 'Öğrenci 2. adımda sıralamayı yanlış yaptı! İki bilinmeyenli soruda önce 3 kuralını (rakamlar toplamını) uygulamak kör dövüşüne yol açar. ÖNCE son basamağı bağlayan 5 kuralı uygulanarak b = 0 veya b = 5 olarak sabitlenmeli, ardından her iki dal için ayrı ayrı 3 kuralı uygulanmalıdır!',
        correctSolution: 'Önce 5 kuralı: b = 0 veya b = 5.\nDurum 1 (b=0): 4a60 ⇒ 10+a ⇒ a ∈ {2, 5, 8}.\nDurum 2 (b=5): 4a65 ⇒ 15+a ⇒ a ∈ {0, 3, 6, 9}.\nToplam = (2+5+8) + (0+3+6+9) = 15 + 18 = 33.',
        trapRule: 'Bileşik bölünebilme sorularında DAİMA ÖNCE son basamağı bağlayan kural (5, 4, 8) uygulanır, en son rakamlar toplamı (3, 9) incelenir.',
      ),
      TrapScenario(
        id: 'trap_k2_2',
        questionText: 'Bir tarlanın boyutları 48 metre ve 72 metredir. Köşelerine de dikilmek şartıyla tarlanın çevresine eşit aralıklarla en az kaç ağaç dikilir?',
        studentSteps: [
          '1. Adım: Tarlanın çevresine eşit aralıklarla ağaç dikilecektir.',
          '2. Adım: Eşit aralıklar için 48 ve 72 sayılarının EKOK\'u alınır: EKOK(48, 72) = 144.',
          '3. Adım: Ağaç sayısı = Çevre / 144.',
        ],
        wrongStepIndex: 1, // 2. Adım hatalı (EKOK değil EBOB!)
        mistakeExplanation: '2. Adımda vahim bir kavram hatası var! Tarla kenarları eşit küçük parçalara bölünmektedir (bütünden parçaya). Bu yüzden EKOK değil, EBOB alınmalıdır! EBOB(48, 72) = 24 metredir. Ağaç sayısı = Çevre / EBOB = 2(48 + 72) / 24 = 240 / 24 = 10 ağaçtır!',
        correctSolution: 'EBOB(48, 72) = 24 m (ağaçlar arası mesafe). Çevre = 2(48 + 72) = 240 m. Ağaç sayısı = 240 / 24 = 10 ağaç dikilir.',
        trapRule: 'Tarlaya eşit aralıklarla ağaç dikme bütünü parçalama problemidir; kesinlikle EBOB kullanılır! Ağaç Sayısı = Çevre / EBOB.',
      ),
      TrapScenario(
        id: 'trap_k2_3',
        questionText: 'A sayısının 14 ile bölümünden kalan 5\'tir. Buna göre A sayısının 7 ile bölümünden kalan kaçtır?',
        studentSteps: [
          '1. Adım: A = 14k + 5 şeklinde yazılır.',
          '2. Adım: 14 sayısı 7\'nin tam katı olduğundan 14k kısmı 7\'ye tam bölünür (kalan 0).',
          '3. Adım: Kalanı 5 sayısı belirler; 5 sayısı 7\'den küçük olduğundan kalan 5\'tir.',
          '4. Adım: Ancak 14 ile bölümünden kalan 5 ise 7 ile bölümünden kalan da 5 · 2 = 10 olmalıdır.',
        ],
        wrongStepIndex: 3, // 4. Adım hatalı
        mistakeExplanation: '4. Adım tamamen uydurma bir adımdır! 3. Adımda kalan zaten 5 olarak bulunmuştur. Bir sayının 7 ile bölümünden kalan asla 7\'den büyük (10) olamaz! Kalan daima bölenden küçüktür (K < 7). Kalan doğrudan 5\'tir.',
        correctSolution: 'A = 14k + 5 ⇒ 14k kısmı 7\'ye tam bölünür, 5\'in 7\'ye bölümünden kalan ise 5\'tir. Doğru cevap 5.',
        trapRule: 'Kalan daima bölenden KÜÇÜK olmalıdır: 0 ≤ K < Bölen!',
      ),
    ],
  );
}
