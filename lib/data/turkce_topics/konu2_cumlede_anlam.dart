// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu2CumledeAnlam = LectureTopic(
  id: 'turkce_cumlede_anlam',
  courseId: 'turkce',
  order: 2,
  title: 'Cümlede Anlam ve Anlatım Özellikleri',
  subtitle: 'Öznel/Nesnel Yargı, Sebep-Sonuç, Amaç-Sonuç, Koşul, Karşılaştırma, Örtülü Anlam & Duygu/Durum Cümleleri',
  icon: Icons.format_quote_rounded,
  color: const Color(0xFF0284C7),
  testRange: 'Test 11 - 20',
  startTestNum: 11,
  endTestNum: 20,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: '1. Cümlede Temel Anlam Unsurları (Konu, Ana Fikir ve Çıkarımlar)',
      type: LectureSectionType.overview,
      leadText: 'Bir duyguyu, düşünceyi, isteği, haberi, durumu veya olayı ifade etmek için kurulan ve kendi içinde anlam ve yargı bütünlüğü olan sözcüğe veya söz dizisine cümle denir (turkce1.pdf s. 31-36).',
      bulletPoints: [
        '1. Cümlenin Konusu: Cümlede üzerine görüş bildirilen olay ya da durum cümlenin konusudur. "Bu cümle neden söz etmektedir / neyi anlatıyor?" sorusunun cevabıdır.\n  • Örnek: "Düzenli kitap okumak, bireyin kelime dağarcığını ve empati yeteneğini geliştirir." -> Konu: Kitap okumanın bireye zihinsel ve duygusal faydaları.\n  • Örnek: "Tarih boyunca su kenarlarına kurulan medeniyetler daha hızlı kalkınmıştır." -> Konu: Suyun medeniyetlerin gelişimi üzerindeki etkisi.',
        '2. Cümlede Ana Fikir (Ana Düşünce): Cümlede asıl iletilmek istenen temel mesaj, varılmak istenen nihai yargı ve öğüttür. "Yazar bu cümleyi hangi amaçla söyledi, bize neyi kanıtlamak istiyor?" sorusunun yanıtıdır.\n  • Örnek: "Hiçbir rüzgâr, hedefi olmayan bir gemiye yardım edemez." -> Ana fikir: Hayatta başarıya ulaşabilmek için mutlaka belirgin bir amaca ve rotaya sahip olunmalıdır.',
        '3. Cümleden Çıkarılabilecek ve Çıkarılamayacak Yargılar:\n  • Çıkarılabilecek Yargı: Cümlede verilen bilgilerin sınırları dışına çıkmadan, hiçbir kişisel yorum eklemeden yalnızca metindeki verilerden elde edilen tartışmasız doğrudur.\n  • Çıkarılamayacak Yargı: Cümlede geçmeyen, aşırı genelleştirilmiş veya cümleden bağımsız yorum içeren önermelerdir.',
        '4. Cümle Tamamlama ve Cümle Oluşturma:\n  • Cümle Tamamlama: Eksik bırakılan cümlenin anlam akışına, zaman kipine, kişi uyumuna ve mantıksal nedenselliğe uygun olarak tamamlanmasıdır.\n  • Cümle Oluşturma: Karışık olarak verilen sözcük ve söz öbeklerini anlamlı ve kurallı bir cümle haline getirmektir. Çözüm taktiği: Önce yüklemi bulup en sona koyun, sonra özneyi ve tümleçleri mantıksal akışla dizin.'
      ],
      goldenRule: 'KESİN YARGI FORMÜLÜ: "Bu cümleden kesin olarak çıkarılabilecek yargı hangisidir?" sorularında şıklardaki "en, sadece, ilk kez, her zaman, tümüyle" gibi iddialı sözcüklere dikkat edin. Cümlede açıkça belirtilmemiş hiçbir genelleme doğru cevap olamaz.',
      osymTrap: 'ÖSYM TUZAĞI: Cümleden çıkarılacak yargı aranırken metinde bulunmayan kendi genel kültür bilginizi veya kişisel kanaatinizi asla cevaba dahil etmeyin. Cevap yalnızca o cümlenin kelimelerinde saklıdır.'
    ),
    LectureSection(
      title: '2. Anlatımına Göre Cümleler: Öznel vs Nesnel, Üslup vs İçerik, Doğrudan vs Dolaylı',
      type: LectureSectionType.comparison,
      leadText: 'Kanıtlanabilirlik, anlatıcının tavrı ve ifade biçimi bakımından cümle türleri (turkce1.pdf s. 36-41):',
      bulletPoints: const [],
      goldenRule: 'ÜSLUP = NASIL? | İÇERİK = NE?: Bir cümlenin üslup mu içerik mi olduğunu anlamak için yükleme şu soruları sorun: "Yazar neyi anlatıyor?" cevabı İÇERİK; "Yazar nasıl anlatıyor?" cevabı ÜSLUPTUR.',
      osymTrap: 'ÖSYM TUZAĞI: "Yazar, köy yaşamını şiirsel ve akıcı bir dille okuyucuya aktarmış." cümlesinde hem içerik ("köy yaşamını") hem de üslup ("şiirsel ve akıcı bir dille") bir arada verilmiştir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Nesnel (Objektif) Anlatımlı Cümleler',
          wrong: '• Söyleyenin kişisel duygu, düşünce ve beğenilerini içermeyen, herkesçe kabul gören, bilimsel ve kanıtlanabilir yargılardır.\\n• Kişiden kişiye değişmez; doğruluğu veya yanlışlığı deney, gözlem ya da belgelerle ispatlanabilir.\\n• Örnek: "Türkiye\'nin başkenti Ankara\'dır.", "Yazar bu romanında Kurtuluş Savaşı yıllarını ele almıştır.", "Cahit Sıtkı Tarancı\'nın Otuz Beş Yaş şiiri hece ölçüsüyle yazılmıştır.", "Su deniz seviyesinde 100 derecede kaynar."',
          note: 'Yanlış bir bilgi bile nesnel olabilir: "Ankara Karadeniz kıyısındadır" cümlesi yanlışlığı ispatlanabildiği için yine NESNELDİR.'
        ),
        ComparisonRow(
          correct: 'Öznel (Subjektif) Anlatımlı Cümleler',
          wrong: '• Söyleyenin kişisel duygu, beğeni, zevk ve yorumlarını içeren; kanıtlanması mümkün olmayan yargılardır.\\n• Kişiden kişiye değişir; görecelidir.\\n• Cümlede genellikle "harika, büyüleyici, enfes, sıkıcı, muhteşem, kusursuz, etkileyici" gibi niteleme sıfatları yer alır.\\n• Örnek: "İstanbul, dünyanın en büyüleyici ve gizemli şehridir.", "Yazarın akıcı ve kusursuz üslubu okuyucuyu derinden etkiliyor."',
          note: 'Beğeni, estetik değerlendirme ve eleştiri içeren cümleler daima özneldir.'
        ),
        ComparisonRow(
          correct: 'Üslup (Biçem / Nasıl?) Cümleleri',
          wrong: '• Yazarın düşüncelerini "NASIL" anlattığını, anlatım tarzını, dil ve sözcük seçimini, cümle yapısını bildiren cümlelerdir.\\n• "Yazar konuyu nasıl ifade etmiş?" sorusunun yanıtıdır.\\n• Örnek: "Yazar, eserinde kısa, devrik cümleler ve yerel ağız özellikleri kullanmıştır.", "Sanatçı, yabancı sözcüklerden arınmış, son derece yalın ve duru bir Türkçeyle yazmıştır."',
          note: 'Dil, anlatım tarzı, akıcılık, cümle uzunluğu, kelime kadrosu üsluptur.'
        ),
        ComparisonRow(
          correct: 'İçerik (Muhteva / Ne?) Cümleleri',
          wrong: '• Eserde "NEYİN" anlatıldığını, yapıtın konusunu, temasını ve ele aldığı olayları bildiren cümlelerdir.\\n• "Yazar eserinde neyi anlatmış?" sorusunun yanıtıdır.\\n• Örnek: "Roman, Kurtuluş Savaşı döneminde Anadolu köylüsünün yaşadığı zorlukları ele almaktadır.", "Şair bu şiirinde çocukluk günlerine duyduğu derin özlemi dile getirmiştir."',
          note: 'Konu ve tema doğrudan içeriktir.'
        ),
        ComparisonRow(
          correct: 'Doğrudan Anlatım Cümleleri',
          wrong: '• Başkasına ait bir sözün hiç değiştirilmeden, söylendiği gibi tırnak içinde veya virgülle aktarılmasıdır:\\n• Atatürk: "Hayatta en hakiki mürşit ilimdir." dedi.\\n• Yarın erkenden yola çıkacağız, dedi.',
          note: 'Söz olduğu gibi tırnak içinde verilir.'
        ),
        ComparisonRow(
          correct: 'Dolaylı Anlatım Cümleleri',
          wrong: '• Başkasına ait bir sözün anlamı değiştirilmeden, aktaran kişinin kendi cümle yapısıyla ifade edilmesidir:\\n• Atatürk, hayatta en hakiki mürşidin ilim olduğunu söylemiştir.\\n• Yarın erkenden yola çıkacaklarını belirtti.',
          note: 'Genellikle "-dığını söyledi / belirtti" şeklinde biter.'
        )
      ]
    ),
    LectureSection(
      title: '3. Anlam İlişkilerine Göre Cümleler (Neden, Amaç, Koşul ve Örtülü Anlam)',
      type: LectureSectionType.ruleList,
      leadText: 'ÖSYM dil sınavlarında en çok karıştırılan neden-sonuç ve amaç-sonuç bağıntıları (turkce1.pdf s. 41-48):',
      bulletPoints: [
        '1. Neden-Sonuç (Sebep-Sonuç / Gerekçeli) Cümleleri:\n  • Bir eylemin hangi somut gerekçeyle gerçekleştiğini bildiren cümlelerdir. İki yargı da fiilen gerçekleşmiştir.\n  • Yükleme "Neden?, Niçin?, Hangi gerekçeyle?" soruları sorulur.\n  • "-dığı için, -den dolayı, yüzünden, sebebiyle, gerekçesiyle" ekleriyle kurulur.\n  • Örnek: "Kar yağdığı için köy yolları kapandı." (Köy yolları neden kapandı? -> Kar yağdığı için. Kar yağması da yolların kapanması da gerçekleşmiştir).\n  • Örnek: "Uykusuz kaldığından gözleri kanlanmıştı.", "Şiddetli fırtına yüzünden vapur seferleri iptal edildi."',
        '2. Amaç-Sonuç Cümleleri:\n  • Eylemin hangi hedefe, gayeye ulaşmak maksadıyla yapıldığını bildiren cümlelerdir. Amaç henüz gerçekleşmemiştir, bir tasarıdır.\n  • Cümlede "-mek için, amacıyla, maksadıyla, gayesiyle, -mek üzere" ifadeleri yer alır.\n  • Formül: Cümleye "amacıyla" sözcüğünü koyduğunuzda anlamlı oluyorsa AMAÇ-SONUÇTUR!\n  • Örnek: "Sınavı kazanmak için (amacıyla) gece gündüz çalıştı.", "Arkadaşını görmek üzere (amacıyla) hastaneye gitti.", "Kilo vermek maksadıyla diyete başladı."',
        '3. Koşul (Şart)-Sonuç Cümleleri:\n  • Bir eylemin ya da durumun gerçekleşmesinin başka bir koşula bağlandığı cümlelerdir.\n  • "-se / -sa, -dıkça, üzere, ama, yeter ki" kalıplarıyla kurulur.\n  • Örnek: "Düzenli tekrar yaparsan konuları unutmazsın.", "Yarın geri getirmek üzere bu kitabı alabilirsin.", "Hava açtıkça içim ferahlıyor.", "Seninle gelirim ama erken döneceksin."',
        '4. Karşılaştırma Cümleleri:\n  • En az iki kavram, durum veya varlığın benzer ya da farklı yönlerinin kıyaslandığı cümlelerdir.\n  • Cümlede genellikle "en, daha, kadar, göre, ise, nispeten" sözcükleri bulunur.\n  • Örnek: "Sınıfın en çalışkan öğrencisi oydu.", "Bu roman yazarın diğer yapıtlarına göre daha sade bir dille yazılmış."',
        '5. Örtülü Anlam:\n  • Cümlede açıkça söylenmediği halde cümlenin anlamından ve bağlamından çıkarılabilen gizli yargılardır.\n  • Genellikle "de/da" bağlacı, "yine, artık, sadece, en" sözcükleriyle oluşturulur.\n  • Örnek: "Toplantıya Ahmet de katıldı." -> Örtülü Anlam: Toplantıya Ahmet\'ten başka katılanlar da vardır.\n  • Örnek: "Artık sigara içmiyor." -> Örtülü Anlam: Daha önce sigara içiyordu.\n  • Örnek: "Bu yılki sınav geçen yıla göre daha zordu." -> Örtülü Anlam: Geçen yıl da sınav yapılmıştır.'
      ],
      goldenRule: 'AMACIYLA TESTİ: Neden-sonuç ile amaç-sonucu ayırt etmek için cümlenin başına "amacıyla" kelimesini getirin. Uyuyorsa AMAÇ-SONUÇ, uymuyorsa ve "gerekçesiyle / sebebiyle" uyuyorsa NEDEN-SONUÇTUR. "Yağmur yağdığı amacıyla ıslandım" (anlamsız -> neden-sonuç); "Para çekmek amacıyla bankaya gitti" (anlamlı -> amaç-sonuç).',
      osymTrap: 'ÖSYM TUZAĞI: "-mek için" kalıbı amaç bildirirken, "-dığı için" kalıbı daima sebep (neden) bildirir: "Geç kaldığı için özür diledi" (Neden-sonuç) vs "Geç kalmamak için taksiye bindi" (Amaç-sonuç).'
    ),
    LectureSection(
      title: '4. Cümlede Duygu, Durum ve Anlam İfadeleri Rehberi (turkce1.pdf s. 48-56)',
      type: LectureSectionType.formula,
      leadText: 'KPSS testlerinde seçeneklerde sıkça geçen cümle çeşitleri ve şifreleri (turkce1.pdf s. 48-56):',
      bulletPoints: [
        '1. Tanım Cümlesi: "Bu nedir?" sorusunun yanıtıdır. Varlığın veya kavramın değişmez niteliklerini açıklar. Genellikle "-dır/-dir" veya "denir" ile biter: "Cümle, bir duyguyu tam olarak anlatan söz dizisidir."',
        '2. Varsayım Cümlesi: Gerçekte olmadığı halde bir durumu bir an için olmuş gibi kabul etmektir: "Diyelim ki, tut ki, farz edelim ki, kabul edelim ki, varsayalım ki sınav iptal edildi."',
        '3. Olasılık (İhtimal) Cümlesi: Bir durumun gerçekleşip gerçekleşmeyeceğinin kesin olmadığı, gerçekleşebilme payının bulunduğu cümlelerdir: "Belki yarın bize uğrayabilir.", "Bu saatte eve varmış olmalı."',
        '4. Tasarı Cümlesi: Gelecekte yapılması planlanan bir işi, projeyi bildiren cümlelerdir: "Önümüzdeki ay yeni bir kitap çıkarmayı düşünüyoruz."',
        '5. Eleştiri ve Öz Eleştiri Cümleleri:\n  • Eleştiri: Bir yapıtın, kişinin olumlu ya da olumsuz yönlerini ortaya koymaktır: "Yazar karakterleri çok yüzeysel bırakmış."\n  • Öz Eleştiri: Kişinin kendi davranışlarını, eksikliklerini ve hatalarını eleştirmesidir: "Zamanımı iyi yönetemediğim için sınavı yetiştiremedim."',
        '6. Hayıflanma vs Pişmanlık (Çok Karıştırılır!):\n  • Hayıflanma: Yapılmayan, kaçırılan bir fırsat için üzülmektir: "Gençliğimde keşke yabancı dil öğrenseydim.", "Zamanında o arsayı almadığıma çok yanıyorum."\n  • Pişmanlık: Bizzat yapılan bir eylemden, söylenen bir sözden dolayı duyulan vicdani rahatsızlıktır: "Keşke o kırıcı sözleri ona söylemeseydim."',
        '7. Sitem vs Yakınma (Şikayet):\n  • Sitem: Bir kişinin kırıcı veya vefasız davranışından duyulan üzüntüyü doğrudan o kişinin yüzüne söylemektir: "Ankara\'ya kadar geldin de bize hiç uğramadın."\n  • Yakınma: Bir kişinin olumsuz tavrını veya bir durumu başkalarına dert yanarak anlatmaktır: "Çocuklar odalarını hiçbir zaman toplamıyorlar."',
        '8. Kanıksama vs Yadsıma:\n  • Kanıksama: Çok tekrarlanan olumsuz bir duruma zamanla alışmak, artık tepki göstermemektir: "Zam haberlerine artık hiç kimse şaşırmıyor."\n  • Yadsıma: Yapılan bir işi, söylenen bir sözü inkar etmek, kabul etmemektir: "Ben öyle bir şey söylemedim."',
        '9. Aşamalılık Bildiren Cümleler: Bir eylemin veya durumun zaman içinde kademe kademe değiştiğini bildiren cümlelerdir: "Hastanın durumu günden güne iyiye gidiyor.", "Hava giderek soğuyor."'
      ],
      goldenRule: 'HAYIFLANMA YAPILMAYANA, PİŞMANLIK YAPILANA DUYULUR: Yapmadığınız bir şey için üzülüyorsanız HAYIFLANMA ("Keşke daha çok ders çalışsaydım"); yaptığınız bir eylemden ötürü vicdan azabı duyuyorsanız PİŞMANLIKTIR ("Ona bu sırrı vermemeliydim").',
      osymTrap: 'ÖSYM TUZAĞI: Sitem ile yakınma arasındaki tek fark muhataptır: Sitem bizzat o kişinin yüzüne söylenir; yakınma ise o kişi yokken üçüncü şahıslara dert yanmaktır.'
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Cümlede Anlam Analizi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'turkce1.pdf Ünite Değerlendirme Testi kaynaklı çözümlü pekiştirme sorusu:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde "hayıflanma" anlamı vardır?',
          options: [
            'A) Keşke o gün ona o kırıcı lafları hiç söylemeseydim.',
            'B) Elime geçen bu güzel fırsatı zamanında değerlendiremedim.',
            'C) Buralara kadar geldin de bir çayımızı içmeye uğramadın.',
            'D) Ne yaparsam yapayım çocuğa kitap okuma alışkanlığı kazandıramadım.',
            'E) Bizi bu ıssız dağ başında yapayalnız bırakıp gittiler.'
          ],
          correctIndex: 1,
          explanation: 'B seçeneğinde kişinin eline geçen fırsatı "zamanında yapmadığı / değerlendirmediği" için duyduğu üzüntü anlatılmaktadır; yapılmayan eylemlerden duyulan üzüntü HAYIFLANMADIR. A seçeneğinde bizzat yapılan bir davranıştan (kırıcı laflar söylemekten) duyulan üzüntü PİŞMANLIKTIR. C seçeneği SİTEM, D ve E seçenekleri ise YAKINMADIR.',
          ruleTag: 'Duygu ve Anlam Çözümlemesi'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu2 = konu2CumledeAnlam;
