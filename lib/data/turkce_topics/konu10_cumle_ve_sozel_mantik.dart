// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu10CumleVeSozelMantik = LectureTopic(
  id: 'turkce_konu_10',
  courseId: 'turkce',
  order: 10,
  title: 'Cümle Bilgisi, Anlatım Bozukluğu ve Sözel Mantık',
  subtitle: 'Cümlenin Ögeleri, Cümle Türleri, Anlatım Bozuklukları ve Sözel Mantık Çözüm Stratejileri',
  icon: Icons.analytics,
  color: const Color(0xFF0284C7),
  testRange: 'Test 91 - 100',
  startTestNum: 91,
  endTestNum: 100,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'Cümlenin Ögeleri ve Bulma Kuralları',
      type: LectureSectionType.overview,
      leadText: 'Cümleyi meydana getiren sözcük ve söz öbeklerinin görevleri ve bulma algoritması (turkce1.pdf Bölüm 14, Sayfa 217-236):',
      bulletPoints: [
        '▸ Ögeleri Bulma Sıralaması (Y-Ö-N-T Kuralı):\n• Cümlede önce Yüklem, ardından Özne, sonra Nesne, en son Tümleçler bulunur. Bu sıraya uyulmazsa özne ile nesne birbirine karışır!',
        '▸ 1. Temel Ögeler:\n• A. Yüklem: Cümlenin can damarıdır; yargıyı üzerinde taşır. Çekimli bir fiil veya ek fiil almış bir isim olabilir.\n• B. Özne: Yüklemin bildirdiği işi yapan veya yargının konusu olan ögedir. Yükleme sorulan "Kim? / Ne?" veya daha garantisi "Yapan kim? / Olan ne?" sorusuyla bulunur.\n  • *Gerçek Özne:* Cümlede açıkça yazılıdır ("Ahmet geldi").\n  • *Gizli Özne:* Cümlede yazılı değildir, yüklemdeki şahıs ekinden anlaşılır ("(Ben) Kitap okudum").\n  • *Sözde Özne:* Edilgen fiilli cümlelerde işi yapan bilinmediğinden nesne durumundaki öge özne görevi görür ("Sınıf temizlendi" -> Temizlenen ne? Sınıf).\n  • *Örtülü Özne:* Edilgen cümlelerde işi yapanın "... tarafından / -ce" ekiyle belirtilmesidir ("Hırsız polis tarafından yakalandı").',
        '▸ 2. Yardımcı Ögeler:\n• A. Belirtili Nesne: Yükleme sorulan "Neyi? / Kimi?" sorusuna cevap verir; ismin belirtme hâl ekini (-ı, -i, -u, -ü) alır: "Kitab-ı okudum."\n• B. Belirtisiz Nesne: Özne bulunduktan sonra yükleme sorulan "Ne?" sorusuna cevap verir; eksiz ve yalındır: "Pazardan elma aldım."\n• C. Dolaylı Tümleç (Yer Tamlayıcısı): Yüklemi yönelme (-e), bulunma (-de) ve ayrılma (-den) bakımından tamamlayan ögedir. Yükleme sorulan "Kime, kimde, kimden; Nereye, nerede, nereden; Neye, neyde, neyden" sorularına cevap verir.\n• D. Zarf Tümleci (Zarf Tamlayıcısı): Yüklemi durum, zaman, miktar, sebep ve vasıta bakımından tamamlar. Yükleme sorulan "Nasıl, ne zaman, ne kadar, niçin, neden, ne ile, kiminle" sorularına cevap verir.\n• Cümle Dışı Unsurlar: Bağlaçlar, seslenmeler, hitaplar ve ögeye dahil olmayan ara cümleler cümle dışı unsurdur.',
        '▸ ÖGELERİ BULURKEN 3 ALTIN KURAL:\n• 1. İsim ve Sıfat Tamlamaları ASLA BÖLÜNMEZ!\n• 2. Deyimler ve Birleşik Fiiller ASLA BÖLÜNMEZ!\n• 3. Edat Öbekleri ve Fiilimsi Grupları ASLA BÖLÜNMEZ!'
      ],
      goldenRule: 'Tamlamalar, deyimler ve birleşik sözcükler etle tırnak gibidir; ASLA bölünemez! Tek bir öge olarak alınmak zorundadır: "Gözden düştü" -> Deyimdir, tamamı yüklemdir.',
      osymTrap: 'Cümlede vurgu kuralı: Fiil cümlelerinde vurgu YÜKLEMDEN BİR ÖNCEKİ ÖGEDİR. İsim cümlelerinde ise vurgu BİZZAT YÜKLEMİN KENDİSİNDEDİR.'
    ),
    LectureSection(
      title: 'Cümle Türleri (Yapı, Anlam, Yüklemine Göre)',
      type: LectureSectionType.comparison,
      leadText: 'Cümlelerin yüklemin türüne, yerine, anlamına ve yapısına göre 4 temel sınıflaması (turkce1.pdf Bölüm 15, Sayfa 237-254):',
      bulletPoints: [
        '▸ 1. Yüklemin Türüne Göre:\n• Fiil (Eylem) Cümlesi: Yüklemi çekimli bir fiil olan cümlelerdir ("Güneş ufuktan battı").\n• İsim (Ad) Cümlesi: Yüklemi ek fiil almış bir isim veya isim soylu sözcük olan cümlelerdir ("Hava bugün çok güzeldi", "En sevdiği şey okumaktı").',
        '▸ 2. Yüklemin Yerine Göre:\n• Kurallı (Düz) Cümle: Yüklemi cümlenin en sonunda olan cümledir.\n• Devrik Cümle: Yüklemi cümlenin sonunda OLMAYAN (başta veya ortada olan) cümledir.\n• Eksiltili Cümle: Yüklemi söylenmemiş, sonuna üç nokta konan cümledir ("Ufukta masmavi bir deniz...").',
        '▸ 3. Anlamına Göre:\n• Olumlu Cümle: Eylemin gerçekleştiğini veya durumun var olduğunu bildirir.\n• Olumsuz Cümle: Eylemin gerçekleşmediğini ("-me/-ma, -mez, yok, değil, -sız") bildirir.\n  • *Biçimce Olumsuz Anlamca Olumlu:* "Seni sevmiyor değilim (seviyorum)."\n  • *Biçimce Olumlu Anlamca Olumsuz:* "Ne aradı ne sordu (Aramadı ve sormadı).", "Bu soğukta denize mi girilir? (Girilmez)."\n• Soru Cümlesi / Ünlem Cümlesi / Emir Cümlesi',
        '▸ 4. Yapısına Göre Cümleler:\n• A. Basit Cümle: Tek bir yüklemi olan, içinde FİİLİMSİ BULUNMAYAN, tek bir yargı bildiren cümledir: "Dün akşam eve geç geldim."\n• B. Birleşik Cümle: Tek ana yüklemi olan ve içinde YAN CÜMLECİK (fiilimsi, şart kipi veya alıntı cümle) barındıran cümledir:\n  • Girişik Birleşik Cümle: İçinde FİİLİMSİ bulunan cümledir ("Koşarak gelen çocuğu kucakladı").\n  • Şartlı Birleşik Cümle: Yan cümleciği "-se / -sa" şart kipiyle kurulan cümledir ("Erken kalkarsan yetişirsin").\n  • Ki\'li Birleşik Cümle: "ki" bağlacıyla kurulan cümledir ("Duydum ki unutmuşsun").\n  • İç İçe Birleşik Cümle: Bir cümlenin içinde başka bir cümlenin alıntı olarak yer almasıdır ("\'Yarın gelirim,\' dedi").\n• C. Sıralı Cümle: Virgül (,) veya noktalı virgülle (;) birbirine bağlanan en az iki bağımsız cümledir:\n  • Bağımlı Sıralı: Ortak ögesi olan sıralı cümle ("Ahmet geldi, içeri girdi" -> özne ortak).\n  • Bağımsız Sıralı: Hiçbir ögesi ortak olmayan sıralı cümle ("Yağmur yağıyordu, biz evde oturuyorduk").\n• D. Bağlı Cümle: Birbirine BAĞLAÇLARLA ("ve, ama, fakat, çünkü, oysa") bağlanan en az iki cümledir: "Gitti ama aramadı."'
      ],
      goldenRule: 'Yan Cümlecik Sayısı = Cümledeki Fiilimsi Sayısı! Bir cümlede kaç tane fiilimsi varsa o kadar yan cümlecik vardır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Güneş battı, sokaklar boşaldı. (Sıralı cümle - virgülle ayrılmış)',
          wrong: 'Güneş battı ve sokaklar boşaldı. (Bağlı cümle - bağlaçla bağlanmış)',
          note: 'Virgül varsa sıralı, bağlaç varsa bağlı cümledir.'
        ),
        ComparisonRow(
          correct: 'Kitap okumayı çok seviyor. (Girişik Birleşik - içinde fiilimsi var)',
          wrong: 'Kitapları çok seviyor. (Basit Cümle - tek yargı, fiilimsi yok)',
          note: 'Fiilimsi barındıran tek yüklemli cümle girişik birleşiktir.'
        )
      ]
    ),
    LectureSection(
      title: 'Anlatım Bozuklukları (Anlamsal ve Dil Bilgisel)',
      type: LectureSectionType.ruleList,
      leadText: 'Düşüncenin doğru ve pürüzsüz aktarılmasını engelleyen anlamsal ve yapısal bozukluklar (turkce1.pdf Bölüm 16, Sayfa 255-268):',
      bulletPoints: [
        '▸ A. ANLAMA DAYALI ANLATIM BOZUKLUKLARI:\n• 1. Gereksiz Sözcük Kullanımı: Cümleden çıkarıldığında anlamda hiçbir daralma veya bozulma olmayan sözcüklerdir (Eş anlamlı sözlerin bir arada kullanılması: "bari hiç olmazsa", "ses ve seda", "hâlâ henüz", "yaklaşık iki yıla yakın").\n• 2. Sözcüğün Yanlış Anlamda Kullanımı: Anlamca birbiriyle karıştırılan sözcüklerin kullanılmasıdır:\n  • çekimser (kararsız) / çekingen (utangaç)\n  • ekmek (tohum) / dikmek (fidan)\n  • öğretim (eğitim süreci) / öğrenim (kişinin tahsili)\n  • tahrip (yıkma) / tahriş (deride yara)\n  • fiyat (malın ederi) / ücret (emeğin karşılığı)\n  • ayrıntı (detay) / ayrıcalık (üstün tutma).\n• 3. Sözcüğün Yanlış Yerde Kullanımı: Sözcüğün cümledeki yerinin mantığa aykırı olması:\n  • Yanlış: "Yeni okula geldim ki ders zili çaldı." (Yeni bir okul mu?)\n  • Doğru: "Okula yeni geldim ki ders zili çaldı."\n  • Yanlış: "Çok başım ağrıyor." -> Doğru: "Başım çok ağrıyor."\n• 4. Anlamca Çelişen Sözcüklerin Bir Arada Kullanımı: Kesinlik ve olasılık bildiren sözlerin aynı cümlede yer alması: "Şüphesiz bu maçı kazanabilirler.", "Mutlaka yarın gelecektir sanırım."\n• 5. Atasözü ve Deyim Yanlışları: Kalıplaşmış sözlerin değiştirilmesi veya anlamına uygun kullanılmaması: "Gözden geçirdi" yerine "gözden çıkardı" demek.\n• 6. Mantık ve Sıralama Hataları: "Değil patates soymak, yemek bile yapamaz" (Sıralama ters! "Değil yemek yapmak, patates bile soyamaz").\n• 7. Anlam Belirsizliği: Zamir eksikliği ("Okula gelmediğini duydum" -> senin mi, onun mu?) veya virgül eksikliği.',
        '▸ B. YAPIYA DAYALI (DİL BİLGİSİ) ANLATIM BOZUKLUKLARI:\n• 1. Özne - Yüklem Uyumsuzluğu:\n  • Tekillik-Çoğulluk: Özne insan dışı çoğul varlık ise (ağaçlar, kuşlar, düşünceler) yüklem DAİMA TEKİL olur ("Kuşlar uçuyorlar" YANLIŞ, "Kuşlar uçuyor" DOĞRU!). (Kişileştirme varsa çoğul olabilir: "Dalgalar kıyıya vurup ağlaşıyorlar").\n  • Kişi Uyumsuzluğu: Özne "Ben ve Ahmet" ise yüklem "Biz (geldik)" olur. Özne "Sen ve Ahmet" ise yüklem "Siz (geldiniz)" olur.\n  • Olumluluk-Olumsuzluk: "Hiçbiri konuşmuyor, sessizce dinliyordu" (Özne eksikliği: "...hepsi sessizce dinliyordu").\n• 2. Öge Eksiklikleri (Sıralı ve Bağlı Cümlelerde):\n  • Yüklem Eksikliği: "Sabahları çay, akşamları kahve içerim" ("Sabahları çay içerim...").\n  • Nesne Eksikliği: "Arkadaşına güveniyor ve her zaman destekliyordu" ("...onu her zaman destekliyordu").\n  • Dolaylı Tümleç Eksikliği: "İstanbul\'u seviyor ve her fırsatta gidiyordu" ("...oraya her fırsatta gidiyordu").\n• 3. Çatı Uyuşmazlığı: Birleşik veya sıralı cümlelerde yan cümle ile temel cümlenin birinin etken diğerinin edilgen olması: "Bütün sorular dikkatlice okunup (edilgen) doğru şıkkı işaretledi (etken)" -> "...işaretlendi (edilgen)" olmalıdır.\n• 4. Tamlama Yanlışları: Bir sıfat ile bir ismin ortak bir tamlanana bağlanması: "Özel ve kamu kuruluşları" ("Özel kuruluşlar ve kamu kuruluşları" olmalıdır).'
      ],
      goldenRule: 'İnsan dışı çoğul öznelerde yüklem KESİNLİKLE TEKİL olur! "Ağaçlar yapraklarını döküyorlar" YAZIM VE ANLATIM HATASIDIR; doğrusu "Ağaçlar yapraklarını döküyor" şeklindedir!',
      osymTrap: 'Sıralı cümlelerde ikinci cümlenin nesnesi veya dolaylı tümleci eksik bırakılarak tuzak kurulur: "Sana inanıyor ve seviyorum" değil, "Sana inanıyor ve SENİ seviyorum" olmalıdır.'
    ),
    LectureSection(
      title: 'Sözel Mantık Çözüm Stratejileri ve Tablo Kurma',
      type: LectureSectionType.ruleList,
      leadText: 'ÖSYM sınavlarının belirleyici bölümü olan sözel mantık sorularının garantili çözüm metodolojisi (turkce1.pdf Bölüm 20, Sayfa 323-329):',
      bulletPoints: [
        '▸ 1. Değişkenleri Belirleme (Sabit ve Hareketli):\n• Sözel mantık sorularında iki ya da üç küme değişken verilir (Kişiler, Günler/Sıralar, Aldıkları Ürünler).\n• 💡 ALTIN KURAL: Az olan veya sabit olan değişken daima TABLONUN BAŞLIĞI (sütunları) yapılır! Örneğin 7 kişi ve haftanın 7 günü varsa, günler (Pazartesi-Pazar) sabit tutulup başlığa yazılır, kişiler günlerin altına dağıtılır.',
        '▸ 2. Öncülleri Sınıflandırma ve Sırayla Yerleştirme:\n• A. Kesin Bilgiler: Tabloya doğrudan ilk olarak yerleştirilen tartışmasız bilgilerdir ("Ali çarşamba günü nöbetçidir."). Bu bilgi tabloya işlenir ve üzeri çizilir.\n• B. Bağıntılı / Blok Bilgiler: Birbirine bağlı ikili veya üçlü gruplardır ("Ayşe, Fatma\'dan hemen sonraki gündür" -> [F][A] bloku). Bu blok tabloya tek parça halinde yerleştirilir.\n• C. Olumsuz Bilgiler: Tablonun kenarına not düşülür ("Mehmet perşembe günü nöbet tutmamıştır" -> Perşembe sütununa [Mehmet değil] işareti konur).\n• D. İhtimalli (Çift Olasılıklı) Bilgiler: Kesin olmayan durumlar için ASLA kafadan tahmin yapılmaz; ya çift tablo çizilir ya da ok işaretiyle (A/B yer değiştirebilir) gösterilir.',
        '▸ 3. Soru Kökü Tuzakları:\n• "Kesinlikle doğrudur / Kesinlikle yanlıştır:" İhtimallerin değil, her iki olasılıkta da değişmeyen mutlak gerçeğin istendiği sorulardır.\n• "Olabilir / Kesinlik yoktur:" İhtimaller tablosundaki alternatiflerden birinin doğru kabul edildiği sorulardır.\n• Soruda verilen yerleştirme bittiğinde kullanılmayan boşluklar ve kalan kişiler mutlaka kontrol edilmeli, toplam kişi sayısı teyit edilmelidir.'
      ],
      goldenRule: 'Sözel mantıkta soru metnini kafada çözmeye çalışmak en büyük hatadır! Kesin bilgilerle başlanıp mutlaka 1 dakikada basit bir matris/tablo çizilmelidir. Tablo doğru kurulursa 4 sorunun tamamı 2 dakikada çözülür.',
      osymTrap: '"Hemen sonra / hemen önce" ifadesi ile "sonra / önce" ifadesi çok farklıdır! "Ahmet\'ten hemen sonra" bitişik ardışık sıra demektir; "Ahmet\'ten sonra" ise araya başkalarının da girebileceği anlamına gelir.'
    ),
    LectureSection(
      title: 'Cümle Bilgisi ve Sözel Mantık Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM ve EKPSS formatındaki karma cümle bilgisi ve sözel mantık soruları ve çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki sıralı cümlelerin hangisinde bir "öge ortaklığı" (bağımlı sıralı cümle) söz konusudur?',
          options: [
            'A) Yağmur dindi, sokaklar yavaş yavaş kalabalıklaştı.',
            'B) Zil çaldı, öğrenciler hızla sınıflara koştular.',
            'C) Şair şiirini okudu, dinleyiciler ayakta alkışladılar.',
            'D) Genç yazar ilk romanını tamamladı ve yayınevine teslim etti.',
            'E) Sabah rüzgârı esiyor, yapraklar tatlı tatlı fısıldıyordu.'
          ],
          correctIndex: 3,
          explanation: 'D seçeneğinde "tamamladı" ve "teslim etti" sıralı/bağlı yüklemlerdir. Tamamlayan kim? "Genç yazar" (özne). Neyi tamamladı? "İlk romanını" (nesne). Teslim eden kim? "Genç yazar" (özne). Neyi teslim etti? "İlk romanını" (nesne). Cümlede hem özne hem nesne ortaktır.',
          ruleTag: 'Bağımlı Sıralı Cümle'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde bir anlatım bozukluğu vardır?',
          options: [
            'A) Bu konuda herkes kendi düşüncesini özgürce savunabilir.',
            'B) Kitap okumak, insanın düşünce ufkunu genişletir ve zenginleştirir.',
            'C) Bu kararın alınmasında şüphesiz onun da etkisi olmuş olabilir.',
            'D) Ankara Kalesi\'nden başkentin gece manzarasını seyrettiler.',
            'E) Çevre kirliliğini önlemek amacıyla yeni projeler hayata geçiriliyor.'
          ],
          correctIndex: 2,
          explanation: 'C seçeneğinde kesinlik bildiren "şüphesiz" sözcüğü ile olasılık bildiren "olmuş olabilir" ifadesi aynı cümlede kullanılarak "Anlamca Çelişen Sözcüklerin Bir Arada Kullanılması" kaynaklı anlatım bozukluğuna yol açmıştır.',
          ruleTag: 'Anlatım Bozukluğu'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu10 = konu10CumleVeSozelMantik;
