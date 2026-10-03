// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic matematikKonu7 = LectureTopic(
  id: 'matematik_konu_7',
  courseId: 'matematik',
  order: 7,
  title: 'Sayı, Kesir ve Yaş Problemleri',
  subtitle: 'Denklem Kurma İlkeleri, Mum, Kuyruk, Tel Kesme ve Yaş Farkı Bağıntıları',
  icon: Icons.auto_stories,
  color: const Color(0xFF4F46E5),
  testRange: 'Test 61 - 70',
  startTestNum: 61,
  endTestNum: 70,
  estimatedMinutes: 55,
  sections: [
    LectureSection(
      title: 'Denklem Kurma ve Sayı Problemleri',
      type: LectureSectionType.overview,
      leadText: 'Metin halinde verilen sözel ifadelerin matematik diline (cebirsel ifadelere) çevrilmesi ve çözülmesi (matematik1.pdf s. 81-82):',
      bulletPoints: [
        '▸ 1. Temel Cebirsel Dönüşümler:\n• Bir sayının 5 fazlası: x + 5\n• Bir sayının 3 katının 4 eksiği: 3x - 4\n• Bir sayının 4 eksiğinin 3 katı: 3(x - 4)\n• Bir sayının karesinin 2 katı: 2x^2\n• Bir sayının 2 katının karesi: (2x)^2\n• İki sayının kareleri farkı: x^2 - y^2\n• İki sayının farkının karesi: (x - y)^2',
        '▸ 2. Ayak Sayısı / Tavuk-Tavşan Problemleri:\n• Tavukların 2 ayağı, tavşanların 4 ayağı vardır.\n• Toplam hayvan sayısı k ise; tavuk sayısı x, tavşan sayısı (k - x) denilerek tek bilinmeyene indirgenir:\n• Toplam Ayak = 2x + 4(k - x).',
        '▸ 3. Sıra / Bank Problemleri:\n• Öğrenciler sıralara ikişer ikişer oturursa 4 öğrenci ayakta kalıyor: Öğrenci = 2x + 4 (x = sıra sayısı).\n• Üçer üçer oturursa 2 sıra boş kalıyor: Öğrenci = 3(x - 2).\n• İki denklem eşitlenerek sıra sayısı bulunur: 2x + 4 = 3(x - 2) → 2x + 4 = 3x - 6 → x = 10 sıra.',
        '▸ 4. Kuyruk Problemleri (Bilet Kuyruğu):\n• Ahmet baştan n · sırada, sondan m · sırada ise:\n• Kuyruktaki Toplam Kişi = n + m - 1 (Ahmet iki kez sayıldığı için 1 çıkarılır).\n• İki kişi arasında k kişi varsa:\n  • En çok kişi: Baştan + Sondan + Aradaki\n  • En az kişi: Baştan + Sondan - Aradaki - 2',
        '''📝 ÇÖZÜMLÜ ÖRNEK 1:
Bir sınıftaki öğrenciler sıralara 2'şerli otururlarsa 6 öğrenci ayakta kalıyor. 3'erli otururlarsa 2 sıra boş kalıyor. Buna göre sınıfta kaç öğrenci vardır?

💡 ÇÖZÜM:
1. Değişmeyen temel büyüklük sıra sayısıdır: Sıra sayısına x diyelim.
2. 2'şerli oturunca 6 kişi ayakta kalıyorsa toplam öğrenci sayısı = 2x + 6.
3. 3'erli oturunca 2 sıra boş kalıyorsa kullanılan sıra sayısı (x - 2)'dir. Toplam öğrenci sayısı = 3(x - 2).
4. Sınıftaki öğrenci sayısı eşit olduğundan denklem kuralım:
2x + 6 = 3(x - 2)
2x + 6 = 3x - 6 ⇒ x = 12 (Sıra sayısı 12'dir).
5. Öğrenci sayısını bulalım:
2x + 6 = 2·(12) + 6 = 30 öğrenci bulunur.

🎯 PRATİK İPUCU: Sıra ve kuyruk problemlerinde bilinmeyeni (x) öğrenciye değil, sıra sayısına vererek tek bilinmeyenli kolay denklem elde edin.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 4:
Bir sınıftaki öğrenciler sıralara 2'şerli oturursa 5 öğrenci ayakta kalıyor; 3'erli oturursa 2 sıra boş kalıyor.
Buna göre, sınıfta kaç öğrenci vardır?

💡 ÇÖZÜM:
1. Sıra sayısına x diyelim.
2. Durum 1'e göre öğrenci sayısı: S = 2x + 5.
3. Durum 2'ye göre: 2 sıra tamamen boş kaldığından kullanılan sıra sayısı (x - 2)'dir ve buralara 3'erli oturulmuştur:
S = 3(x - 2) = 3x - 6.
4. Öğrenci sayıları birbirine eşitlenir:
2x + 5 = 3x - 6 ⇒ 3x - 2x = 5 + 6 ⇒ x = 11 (sıra sayısı).
5. Öğrenci sayısı: S = 2(11) + 5 = 22 + 5 = 27 bulunur.

🎯 PRATİK İPUCU: Sıra problemlerinde sıra sayısına x deyin ve iki farklı oturma düzenindeki öğrenci denklemlerini birbirine eşitleyin!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 7:
Boyları eşit iki mumdan biri 4 saatte, diğeri 6 saatte tamamen yanarak bitmektedir.
İki mum aynı anda yakıldıktan kaç saat sonra birinin boyu diğerinin boyunun 2 katı olur?

💡 ÇÖZÜM:
1. Mumların boyuna 4 ve 6'nın EKOK'u olan 12 birim diyelim.
2. 1. Mum: 4 saatte bittiğinden saatte 12/4 = 3 birim yanar. t saat sonra kalan boy = 12 - 3t.
3. 2. Mum: 6 saatte bittiğinden saatte 12/6 = 2 birim yanar. t saat sonra kalan boy = 12 - 2t.
4. Yavaş yanan mumun (2. mum) boyu daha uzun kalır:
12 - 2t = 2 · (12 - 3t)
12 - 2t = 24 - 6t
6t - 2t = 24 - 12 ⇒ 4t = 12 ⇒ t = 3 saat bulunur.

🎯 PRATİK İPUCU: Mum problemlerinde mum boyunu saatlerin EKOK'u seçin; t saat sonra kalan boyu (Boy - Hız·t) denklemiyle eşitleyin!''',
      ],
      goldenRule: 'Kuyruk sorularında "en az" dendiğinde kişiler birbirini geçmiştir; "Baştan + Sondan - Aradaki - 2" formülü uygulanır.',
      osymTrap: 'Sıra sorularında "öğrenci sayısı" değil "sıra sayısı" x olarak seçilmelidir; sıra sayısını bulduktan sonra öğrencileri hesaplamak çok daha kolaydır.'
    ),
    LectureSection(
      title: 'Kesir Problemleri ve Tel Kesme Kuralı',
      type: LectureSectionType.formula,
      leadText: 'Kesir problemlerinde paydaların EKOK\'u ile bütün belirleme ve orta nokta kayması (matematik1.pdf s. 82-83):',
      bulletPoints: [
        '▸ 1. Paydaların Katını Seçme Taktiği:\n• Bir kişi parasının 1/3\'ünü, sonra kalanın 2/5\'ini harcıyor diyorsa;\n• Paydalar 3 ve 5 olduğu için tüm paraya 3 · 5 = 15x denir.\n• 15x\'in 1/3\'ü = 5x (harcandı), Kalan = 10x.\n• 10x\'in 2/5\'i = 4x (harcandı), Kalan = 6x.',
        '▸ 2. TEL KESME VE ORTA NOKTA KAYMA KURALI:\n• Bir telin bir ucundan a cm kesilirse, telin orta noktası KESİLEN PARÇANIN YARISI KADAR (a / 2 cm) kayar!\n• Örnek: Bir telin bir ucundan 10 cm kesilirse orta nokta 5 cm zıt yöne kayar.\n• İki ucundan birden kesilirse: Orta noktanın kayma miktarı = |a - b| / 2.',
        '▸ 3. Zıplayan Top Problemleri:\n• Belirli yükseklikten bırakılan top her yere vuruşta düştüğü yüksekliğin a/b\'si kadar yükseliyorsa:\n• n · zıplayışında çıktığı yükseklik = h · (a/b)^n.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 2:
Bir memur maaşının önce 1/4'ünü ev kirasına, sonra KALAN parasının 2/5'ini kredi kartına harcıyor. Geriye 18.000 TL'si kaldığına göre, memurun maaşı kaç TL'dir?

💡 ÇÖZÜM:
1. Paydaların EKOK'u alınır: EKOK(4, 5) = 20. Maaşın tamamına 20x diyelim.
2. Ev kirası: 20x · (1/4) = 5x. Kalan para = 20x - 5x = 15x.
3. Kredi kartı: Kalanın 2/5'i = 15x · (2/5) = 6x.
4. Son kalan para: 15x - 6x = 9x.
5. Bu miktar 18.000 TL'ye eşittir: 9x = 18.000 ⇒ x = 2.000 TL.
6. Memurun toplam maaşı: 20x = 20 · 2.000 = 40.000 TL bulunur.

🎯 PRATİK İPUCU: Tel kesme sorularında orta nokta KESİLEN PARÇANIN YARISI KADAR kayar: Bir telin ucundan x kesilirse orta nokta x/2 kayar!''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 5:
Bir telin bir ucundan 1/6'sı kesildiğinde telin orta noktası 5 cm kaymaktadır.
Buna göre, telin başlangıçtaki boyu kaç cm'dir?

💡 ÇÖZÜM:
1. Altın Tel Kuralı: Bir telin bir ucundan x uzunluğunda parça kesilirse, telin orta noktası kesilen parçanın yarısı kadar (x / 2) zıt yöne kayar!
2. Orta nokta 5 cm kaydığına göre, kesilen parça:
Kesilen parça / 2 = 5 ⇒ Kesilen parça = 10 cm'dir.
3. Kesilen parça telin tamamının 1/6'sı olduğuna göre:
Telin Boyu = 10 · 6 = 60 cm bulunur.

🎯 PRATİK İPUCU: Telin orta noktası daima kesilen parçanın YARISI kadar kayar! Kayma miktarını doğrudan 2 ile çarpıp kesilen parçayı bulun!''',
      ],
      goldenRule: 'Telin orta noktası KESİLEN MİKTARIN DAİMA YARISI KADAR KAYAR! "Orta nokta 4 cm kaydı" diyorsa kesilen parça 8 cm\'dir.',
      osymTrap: '"Kalanın kesri" dendiğinde her harcamadan sonra bütünden düşülerek yeni kalan üzerinden kesir hesaplanmalıdır; başlangıçtaki bütünden değil!'
    ),
    LectureSection(
      title: 'Yaş Problemleri ve Değişmeyen Fark Prensibi',
      type: LectureSectionType.comparison,
      leadText: 'Zaman akışında yaş hesaplamaları ve altın formüller (matematik1.pdf s. 83):',
      bulletPoints: [
        '▸ 1. Temel Kurallar:\n• Bir kişinin bugünkü yaşı x ise:\n  • t yıl sonraki yaşı: x + t\n  • t yıl önceki yaşı: x - t\n• n kişinin bugünkü yaşları toplamı T ise:\n  • t yıl sonraki yaşları toplamı: T + n · t\n  • t yıl önceki yaşları toplamı: T - n · t (Her kişi t kadar yaşlanır!).',
        '▸ 2. YAŞ PROBLEMLERİNİN ALTIN KURALI: YAŞ FARKI ASLA DEĞİŞMEZ!\n• İki kişi arasındaki yaş farkı kaç yıl geçerse geçsin ya da kaç yıl önceye gidilirse gidilsin DAİMA SABİTTİR!\n• Ali ile Veli arasındaki yaş farkı bugün 5 ise, 20 yıl sonra da 5\'tir.',
        '▸ 3. "Senin Yaşına Geldiğimde" Soruları:\n• Tablo yapılır: Geçen zaman iki kişi için de eşittir.\n• (Büyüğün Yaşı - Küçüğün Yaşı) = Geçen Zaman.',
        '''📝 ÇÖZÜMLÜ ÖRNEK 3:
Bir babanın yaşı, iki çocuğunun yaşları farkının 6 katıdır. 8 yıl sonra babanın yaşı, çocuklarının yaşları farkının 7 katı olacağına göre, babanın bugünkü yaşı kaçtır?

💡 ÇÖZÜM:
1. Altın Kural: İki insan arasındaki yaş farkı YILLAR GEÇSE DE ASLA DEĞİŞMEZ!
2. Çocukların yaşları farkına F diyelim.
3. Babanın bugünkü yaşı = 6F.
4. 8 yıl sonra babanın yaşı = 6F + 8 olur. Yaş farkı ise yine F'dir!
5. 8 yıl sonraki denklem: 6F + 8 = 7F ⇒ F = 8 bulunur.
6. Babanın bugünkü yaşı: 6F = 6 · 8 = 48 yaşındadır.

🎯 PRATİK İPUCU: Yaş farkı zamana bağlı değildir! Yıllar geçse de yaş farkına yıl eklenmez, fark sabit kalır.''',
        '''📝 ÇÖZÜMLÜ ÖRNEK 6:
Bir babanın yaşı iki çocuğunun yaşları farkının 6 katıdır.
10 yıl sonra babanın yaşı çocuklarının yaşları farkının 8 katı olacağına göre, babanın bugünkü yaşı kaçtır?

💡 ÇÖZÜM:
1. Yaş Problemlerinin Temel İlkesi: İki kişinin yaşları farkı yıllar geçse de ASLA DEĞİŞMEZ!
2. Çocukların yaş farkına x diyelim:
• Bugün: Yaş farkı = x, Babanın yaşı = 6x.
3. 10 yıl sonra:
• Yaş farkı yine x olarak kalır!
• Babanın yaşı = 6x + 10 olur.
4. Denklem: 6x + 10 = 8x ⇒ 2x = 10 ⇒ x = 5 (Yaş farkı).
5. Babanın bugünkü yaşı = 6x = 6 · 5 = 30 bulunur.

🎯 PRATİK İPUCU: Yaş farkı zamana bağlı değildir! Yıl geçse de yaş farkına yıl eklemeyin, farkı sabit (x) tutun!''',
      ],
      goldenRule: 'İki kişinin yaş farkı zaman içinde ASLA değişmez! Kişi sayısı n ise t yıl sonra yaşlar toplamı n · t kadar artar.',
      comparisonRows: [
        ComparisonRow(
          correct: '3 kişinin 5 yıl sonraki yaşları toplamı: Toplam + 3 · 5 = Toplam + 15',
          wrong: 'Toplam + 5 (Hata: Sadece tek bir kişi yaşlandırılmış olur!)',
          note: 'Gruptaki her birey için geçen yıl ayrı ayrı eklenir (n kişi için n · t eklenir).'
        ),
        ComparisonRow(
          correct: 'İki kişi arasındaki yaş farkı zamanla DEĞİŞMEZ (Bugün fark 6 ise 10 yıl sonra da 6\'dır)',
          wrong: '10 yıl sonra yaş farkının da 10 artacağını veya azalacağını düşünmek (Yaş farkı sabittir!)',
          note: 'Zaman herkes için eşit aktığından iki birey arasındaki yaş farkı hiçbir zaman değişmez.'
        )
      ]
    ),
    LectureSection(
      title: 'Sayı, Kesir ve Yaş Problemleri Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'matematik1.pdf Bölüm 12 çıkmış ayarındaki problem soruları:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Bir telin bir ucundan 1/6\'sı kesildiğinde telin orta noktası 5 cm kaymaktadır · Bu telin kesilmeden önceki boyu kaç cm\'dir?',
          options: [
            'A) 30',
            'B) 45',
            'C) 60',
            'D) 75',
            'E) 90'
          ],
          correctIndex: 2,
          explanation: 'Orta nokta kayma kuralı: Orta nokta kayma miktarı = Kesilen parçanın yarısı.\nKesilen parça / 2 = 5 cm → Kesilen parça = 10 cm\'dir.\nTelin 1/6\'sı kesildiğine göre: Telin boyu = 10 · 6 = 60 cm bulunur.',
          ruleTag: 'Tel Kesme Problemi'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bir babanın yaşı, iki çocuğunun yaşları toplamının 3 katıdır · 4 yıl sonra babanın yaşı çocuklarının yaşları toplamının 2 katı olacağına göre babanın bugünkü yaşı kaçtır?',
          options: [
            'A) 36',
            'B) 40',
            'C) 42',
            'D) 45',
            'E) 48'
          ],
          correctIndex: 0,
          explanation: 'Çocukların yaşları toplamına x diyelim.\nBabanın bugünkü yaşı = 3x olur.\n4 yıl sonra:\n• Babanın yaşı = 3x + 4\n• İki çocuğun yaşları toplamı = x + 2 · 4 = x + 8 (İki çocuk olduğu için 8 artar!)\nDenklem: 3x + 4 = 2(x + 8)\n3x + 4 = 2x + 16 → x = 12.\nBabanın bugünkü yaşı = 3x = 3 · 12 = 36 bulunur.',
          ruleTag: 'Yaş Problemleri'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bir bilet kuyruğunda Ahmet baştan 14 · sırada, Mehmet ise sondan 18 · sıradadır · Aralarında 3 kişi olduğuna ve Ahmet gişeye daha yakın olduğuna göre kuyrukta kaç kişi vardır?',
          options: [
            'A) 25',
            'B) 27',
            'C) 29',
            'D) 31',
            'E) 35'
          ],
          correctIndex: 1,
          explanation: 'Ahmet gişeye daha yakın olduğuna göre kişiler birbirini kesmektedir:\nFormül: Toplam = Baştan Sıra + Sondan Sıra - Aradaki Kişi Sayısı - 2 (Ahmet ve Mehmet)\nToplam = 14 + 18 - 3 - 2 = 32 - 5 = 27 kişi vardır.',
          ruleTag: 'Kuyruk Problemi (Örtüşen Durum)'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bir kişi 5 adım ileri, 2 adım geri atarak ilerlemektedir · Toplam 73 adım atan bu kişi başlangıç noktasından kaç adım ileri gitmiş olur?',
          options: [
            'A) 29',
            'B) 31',
            'C) 33',
            'D) 35',
            'E) 37'
          ],
          correctIndex: 2,
          explanation: '1 · Bir döngü: 5 + 2 = 7 adımda 5 - 2 = 3 adım ilerleme sağlar.\n2 · 73 adımı döngüye bölelim: 73 = 7 · 10 + 3 (10 tam döngü ve kalan 3 adım).\n3 · 10 tam döngüde ilerleme = 10 · 3 = 30 adım.\n4 · Kalan 3 adım da ileri atılacağından: 30 + 3 = 33 adım ilerlemiş olur.',
          ruleTag: 'Adım Problemleri'
        )
      ]
    )
  ],
);

final LectureTopic matematikSayiKesirYas = matematikKonu7;
