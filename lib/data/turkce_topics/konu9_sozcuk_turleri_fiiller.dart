// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu9SozcukTurleri = LectureTopic(
  id: 'turkce_konu_9',
  courseId: 'turkce',
  order: 9,
  title: 'Sözcük Türleri ve Eylemler',
  subtitle: 'İsim, Sıfat, Zamir, Zarf, Edat-Bağlaç-Ünlem, Fiil, Fiilimsi ve Fiilde Çatı',
  icon: Icons.category,
  color: const Color(0xFF0284C7),
  testRange: 'Test 81 - 90',
  startTestNum: 81,
  endTestNum: 90,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'İsimler (Adlar) ve İsim Tamlamaları',
      type: LectureSectionType.overview,
      leadText: 'Varlıkları, kavramları ve durumları karşılayan sözcükler ile aralarında kurulan tamlamalar:',
      bulletPoints: [
        '▸ 1. İsimlerin Sınıflandırılması:\n• A. Varlıklara Verilişine Göre: Özel İsim (tek varlığı karşılar: Atatürk, Türkiye, Karabaş) / Cins (Tür) İsim (aynı türden varlıkları karşılar: kitap, nehir, kedi).\n• B. Varlıkların Sayısına Göre: Tekil İsim (çoğul eki almamış: ağaç, masa) / Çoğul İsim (-lar/-ler almış: ağaçlar, masalar) / Topluluk İsmi (biçimce tekil ama anlamca çokluk bildirir: ordu, deste, meclis, sürü, aile, komisyon, orman).\n• C. Maddelerine Göre: Somut İsim (beş duyu organıyla algılanabilen: rüzgâr, ses, ışık, hava, koku) / Soyut İsim (akıl ve duyguyla kavranan: sevgi, rüya, nefret, saygı, akıl).',
        '▸ 2. İsim Tamlamaları:\n• En az iki ismin birbirini tamlama ekleriyle anlamca tamamlamasıdır:\n• A. Belirtili İsim Tamlaması: Tamlayan (-ın/-in ilgi eki) ve Tamlanan (-(s)i iyelik eki) her ikisi de ek alır: "kapı-n-ın kol-u", "okul-un bahçe-s-i".\n  • *Özellikler:* Araya sıfat girebilir ("kapının kırık kolu"), tamlayanla tamlanan yer değiştirebilir ("Rengi solmuştu bu güzel gömleğin").\n• B. Belirtisiz İsim Tamlaması: Tamlayan ek almaz, tamlanan iyelik eki alır: "okul müdür-ü", "Türk bayrağ-ı", "ceviz ağac-ı".\n  • *Özellik:* Araya sıfat GİREMEZ! Başa gelen sıfat tamlamanın tamamını niteler ("Eski okul müdürü").\n• C. Zincirleme İsim Tamlaması: En az üç ismin birbirine tamlama bağıyla bağlandığı isim tamlamasıdır: "okul müdürünün odası", "Türk edebiyatının dönemleri", "çocuk odasının duvar kâğıdı".\n• D. Takısız İsim Tamlaması: Her iki öge de tamlama eki almaz; tamlayan tamlananın neyden yapıldığını (hammaddesini: "altın kolye", "çelik tencere", "tahta masa") veya neye benzediğini ("ipek saçlar", "kömür gözler", "aslan asker") bildirir.'
      ],
      goldenRule: 'Belirtisiz isim tamlamasının başına gelen sıfat SADECE İLK SÖZCÜĞÜ DEĞİL, TAMAMLAMAYI BİRDEN NİTELER! "Eski okul müdürü" ifadesinde eski olan okul değil, okul müdürüdür.',
      osymTrap: 'Takısız isim tamlaması ile Sıfat tamlamasını karıştırmayın: "Neyden yapılmış?" sorusuna cevap veriyorsa (altın bilezik, taş bina) takısız isim tamlamasıdır; "Nasıl?" sorusuna cevap veriyorsa (kırmızı araba, geniş cadde) niteleme sıfatıdır.'
    ),
    LectureSection(
      title: 'Sıfatlar (Ön Adlar) ve Zamirler (Adıllar)',
      type: LectureSectionType.comparison,
      leadText: 'İsimlerin önüne gelerek onları niteleyen/belirten sıfatlar ile isimlerin yerini tutan zamirlerin kesin ayrımı:',
      bulletPoints: [
        '▸ A. SIFATLAR (ÖN ADLAR): Daima ismin önüne gelir ve ismi etkiler:\n• 1. Niteleme Sıfatları: İsme sorulan "Nasıl?" sorusuna cevap verir: "çalışkan öğrenci", "mavi gökyüzü".\n• 2. Belirtme Sıfatları:\n  • İşaret Sıfatı: bu yol, şu masa, o ev, öteki sokak.\n  • Sayı Sıfatı: üç gün (asıl), ikinci kat (sıra), ikişer elma (üleştirme), yarım ekmek (kesir).\n  • Belgisiz Sıfat: birkaç kişi, birçok sorun, her gün, hiçbir zaman, bazı öğrenciler.\n  • Soru Sıfatı: hangi soru, kaç gün, nasıl bir araba, ne kadar para.\n• Adlaşmış Sıfat: Niteleme sıfatının önündeki isim düştüğünde sıfatın tek başına kalıp isimleşmesidir: "Genç insanlara yol verin" -> "Gençlere yol verin."',
        '▸ B. ZAMİRLER (ADILLAR): İsmin yerini tutan sözcük veya eklerdir:\n• 1. Kişi (Şahıs) Zamirleri: ben, sen, o, biz, siz, onlar ve Dönüşlülük zamiri ("kendi").\n• 2. İşaret Zamirleri: bu, şu, o, bunlar, şunlar, onlar, burası, şurası, orası, öteki, beriki (İsmin yerine geçerler: "Bunu masaya bırak").\n• 3. Belgisiz Zamirler: biri, birkaçı, birçoğu, herkes, kimse, hepsi, falan, şey ("Birçoğu sınava girdi").\n• 4. Soru Zamirleri: kim, ne, nereye, hangisi, kaçı ("Seni kim aradı?").\n• 5. Ek Halindeki Zamirler: İyelik zamiri (ev-im, kalem-i) ve İlgi zamiri ("-ki": benimki, seninki).'
      ],
      goldenRule: 'Önünde isim varsa SIFAT ("o kitap"), ismin yerini tutuyorsa ve ek alabiliyorsa ZAMİR ("onu al"), fiili etkiliyorsa ZARF ("oraya hızlı gitti")!',
      comparisonRows: [
        ComparisonRow(
          correct: 'Bu kitabı çok beğendim. (İşaret Sıfatı - ismin önünde)',
          wrong: 'Bunu çok beğendim. (İşaret Zamiri - ismin yerini tutar)',
          note: 'Sıfatlar çekim eki almaz (alırsa adlaşır/zamirleşir); zamirler çekim eki alır.'
        ),
        ComparisonRow(
          correct: 'Birkaç öğrenci dışarı çıktı. (Belgisiz Sıfat)',
          wrong: 'Birkaçı dışarı çıktı. (Belgisiz Zamir)',
          note: 'Ek alan sözcük sıfatlıktan çıkıp zamire dönüşür.'
        )
      ]
    ),
    LectureSection(
      title: 'Zarflar (Belirteçler) ve Edat - Bağlaç - Ünlem',
      type: LectureSectionType.ruleList,
      leadText: 'Fiilleri, fiilimsileri, sıfatları veya zarfları niteleyen zarflar ve görevli sözcükler:',
      bulletPoints: [
        '▸ A. ZARF TÜRLERİ:\n• 1. Durum (Hâl) Zarfı: Fiile veya fiilimsiye sorulan "Nasıl?" sorusuna cevap verir: "Hızlı koştu", "Gülerek içeri girdi", "Konuyu etraflıca anlattı".\n• 2. Zaman Zarfı: Fiile sorulan "Ne zaman?" sorusuna cevap verir: "Dün akşam bize geldi", "Sabah erkenden yola çıkacağız".\n• 3. Yer - Yön Zarfı: Fiile sorulan "Nereye?" sorusuna cevap verir: içeri, dışarı, ileri, geri, aşağı, yukarı, öte, beri.\n  • ÇOK KRİTİK KURAL: Yer-yön bildiren sözcükler HÂL EKİ ALMADAN YALIN kullanılırsa zarftır! Ek alırlarsa doğrudan İSİM olurlar:\n    • "Aşağı indi." -> Yer-yön zarfı.\n    • "Aşağıya indi." -> İsim (yönelme eki almıştır!).\n    • "Aşağı mahalle" -> Sıfat (ismin önündedir!).\n• 4. Miktar (Azlık-Çokluk) Zarfı: Fiile, fiilimsiye, sıfata veya zarfa sorulan "Ne kadar?" sorusuna cevap verir: çok, az, biraz, gayet, fazla.\n  • Üstünlük ve Derecelendirme Zarfları: "en, daha, pek, çok" sözcükleri sıfatın veya zarfın önüne gelerek derecelendirme zarfı olur: "en güzel şiir", "daha hızlı koştu".\n• 5. Soru Zarfı: Fiilin anlamını soru yoluyla tamamlar: nasıl, ne zaman, ne kadar, neden, niçin, niye.',
        '▸ B. EDAT - BAĞLAÇ - ÜNLEM AYRIMI:\n• Edat (İlgeç): Tek başına anlamı yoktur; cümledeki sözcükler arasında anlam bağı kurar ("gibi, kadar, için, göre, ile, doğru, karşı, dolayı, ötürü, rağmen, yalnız [sadece]"). Edat cümleden çıkarılırsa cümlenin anlamı bozulur!\n• Bağlaç: Eş görevli sözcükleri veya cümleleri birbirine bağlar ("ve, veya, de, ki, ama, fakat, lakin, ancak, oysa, çünkü, ne... ne"). Bağlaç cümleden çıkarıldığında cümlenin yapısı bozulmaz, anlam hafifçe daralabilir.\n• Ünlem: Coşku, korku, heyecan, şaşma, acı ve seslenme bildirir ("Eyvah!, Ah!, Hey!, Vah!").'
      ],
      goldenRule: '"Yalnız / Ancak" Sözcüklerinin Gizli Kimliği: "Sadece" anlamındaysa EDAT\'tır ("Bu soruyu yalnız sen çözebilirsin"); "Ama / Fakat" anlamındaysa BAĞLAÇ\'tır ("Gelirim yalnız fazla kalamam").',
      osymTrap: 'Yer-yön zarfları ek aldıkları anda zarf olmaktan çıkıp İSİM olurlar: "İçeri (zarf) - İçeriye (isim)", "Yukarı (zarf) - Yukarıda (isim)".'
    ),
    LectureSection(
      title: 'Fiiller (Eylemler), Kip, Kişi ve Ek Fiil',
      type: LectureSectionType.formula,
      leadText: 'Hareket, iş, oluş bildiren fiiller, çekimleri ve ek fiilin iki büyük mucizesi:',
      bulletPoints: [
        '▸ 1. Anlamına Göre Fiiller:\n• İş (Kılış) Fiili: Öznenin iradesiyle nesne üzerinde gerçekleşir; başına "onu" gelebilir: "(onu) oku-", "(onu) yaz-", "(onu) kır-", "(onu) sev-".\n• Durum Fiili: Öznenin iradesindedir ama nesne almaz; başına "onu" GELEMEZ: "(onu) uyu- [olmaz]", "(onu) gül-", "(onu) dur-", "(onu) otur-".\n• Oluş Fiili: Öznenin iradesi dışında kendiliğinden doğa kanunlarıyla zamanla gerçekleşir; başına "onu" gelmez: sarar-, paslan-, bayatla-, uzan-, yaşlan-, büyü-.',
        '▸ 2. Fiil Kipleri (Haber ve Dilek):\n• Haber (Bildirme) Kipleri (Zaman bildirir): Görülen geçmiş zaman (-di), Duyulan geçmiş zaman (-miş), Şimdiki zaman (-yor), Gelecek zaman (-ecek), Geniş zaman (-r / olumsuzu -mez).\n• Dilek (Tasarlama) Kipleri (Zaman bildirmez): Gereklilik (-malı), Dilek-Şart (-se), İstek (-e / -elim), Emir (özel eki yoktur, şahıs ekleriyle yapılır).',
        '▸ 3. Ek Fiil (Ek Eylem - İ-mek Fiili: idi, imiş, ise, -dir):\n• GÖREV 1: İsim ve İsim Soylu Sözcüklere Gelerek Onları Yüklem Yapar:\n  • "O gün hava çok soğuk-tu (soğuk idi)." / "Bu çocuk çok zeki-ymiş." / "Ben bir öğretmen-im."\n• GÖREV 2: Basit Zamanlı Fiillere Gelerek Onları BİRLEŞİK ZAMANLI FİİL Yapar:\n  • Hikâye Birleşik Zamanı (-di): geli-yor-du (şimdiki zamanın hikâyesi), oku-muş-tu, yaz-acak-tı.\n  • Rivayet Birleşik Zamanı (-miş): geli-yor-muş (şimdiki zamanın rivayeti), uyu-r-muş, bil-meli-ymiş.\n  • Şart Birleşik Zamanı (-se): geli-yor-sa (şimdiki zamanın şartı), oku-r-sa, bitir-di-yse.'
      ],
      goldenRule: 'Ek Fiilin Geniş Zamanı "-dir / -dır" genellikle cümlede düşer: "O çok çalışkan (çalışkandır)." Bu tür cümlelerde ek fiil düşmüş olsa da isim yüklem olduğu için EK FİİL VAR KABUL EDİLİR!',
      osymTrap: 'Birleşik Zamanlı Fiil ile Birleşik Yapılı Fiil karıştırılmamalıdır! "Gelebildi" yapısına göre birleşiktir (tek kip); "Geliyordu" zamanına göre birleşiktir (iki kip).'
    ),
    LectureSection(
      title: 'Fiilimsiler (Eylemsiler) ve Fiilde Çatı',
      type: LectureSectionType.comparison,
      leadText: 'ÖSYM\'nin dil bilgisinde en çok soru sorduğu iki temel konu:',
      bulletPoints: [
        '▸ A. FİİLİMSİLER (EYLEMSİLER):\n• Fiil kök veya gövdesinden yapım ekiyle türeyip cümlede isim, sıfat veya zarf görevinde kullanılan sözcüklerdir:\n• 1. İsim-Fiil (Mastar): -ma, -ış, -mak (MAYIŞMAK)\n  • *Örnek:* "Kitap oku-mak en büyük tutkusuydu.", "Gül-üş-ü ömre bedeldi."\n  • *Kalıcı İsim Tuzağı:* Fiilimsi özelliğini yitirip somut eşya/yiyecek adı olanlar fiilimsi DEĞİLDİR: dondurma, dolma, sarma, çakmak, ekmek, giriş, çıkış.\n• 2. Sıfat-Fiil (Ortaç): -an, -ası, -mez, -ar, -dik, -ecek, -miş (ANASI MEZAR DİKECEKMİŞ)\n  • *Örnek:* "Yıkıl-ası dünya", "Dönül-mez akşamın ufkundayız", "Görün-ür kaza", "Bilindik olaylar".\n  • *Adlaşmış Sıfat-Fiil:* Önündeki isim düşebilir: "Gelen gideni aratır (Gelen insan giden insanı)."\n• 3. Zarf-Fiil (Bağ-Fiil / Ulaç): -ken, -alı, -esiye, -meden, -ince, -ip, -erek, -dıkça, -e...-e, -r...-mez, -casına, -meksizin, -dığında\n  • Cümleye zaman ("eve varınca") veya durum ("gülerek anlattı") anlamı katar.',
        '▸ B. FİİLDE ÇATI:\n• ÖNEMLİ: İsim cümlelerinde çatı özelliği ARANMAZ! ("Hava çok güzeldi" cümlesinde çatı aranmaz).\n• 1. Öznesine Göre Çatılar:\n  • Etken Fiil: İşi yapan özne bellidir (gerçek veya gizli özne vardır). Çatı eki almaz: "Ahmet kapıyı açtı."\n  • Edilgen Fiil: İşi yapan belli değildir; fiil "-l / -n" eki alır; cümlede "sözde özne" bulunur: "Kapı açıldı."\n  • Dönüşlü Fiil: İşi yapan da işten etkilenen de aynı öznedir (kendi kendine). Fiil "-l / -n" eki alır; özne gerçektir: "Ahmet aynada süslendi."\n  • İşteş Fiil: Birden çok özne tarafından birlikte veya karşılıklı yapılır. Fiil "-ş" eki alır: "mektuplaş-, kaçış-, bakış-".\n• 2. Nesnesine Göre Çatılar:\n  • Geçişli Fiil: Nesne alabilen fiildir; başına "onu" gelebilir: "(onu) gördüm", "(onu) yazdı".\n  • Geçişsiz Fiil: Nesne alamayan fiildir; başına "onu" GELEMEZ: "(onu) güldü [olmaz]", "(onu) uyudu".\n  • Oldurgan Fiil: Geçişsiz fiile "-r, -t, -dır" eklenerek geçişli yapılmasıdır: uyu- (geçişsiz) -> uyut- (oldurgan).\n  • Ettirgen Fiil: Geçişli fiile "-r, -t, -dır" eklenerek geçişlilik derecesinin artırılması ve işin başkasına yaptırılmasıdır: oku- (geçişli) -> okut- (ettirgen).'
      ],
      goldenRule: 'İsim cümlelerinde çatı aranmaz! Bir soru kökünde "Aşağıdaki cümlelerin hangisinde çatı özelliği aranmaz?" deniyorsa doğrudan yüklemi isim soylu olan cümleyi arayınız.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Ahmet odayı temizledi. (Etken - işi yapan belli)',
          wrong: 'Oda temizlendi. (Edilgen - işi yapan meçhul, "oda" sözde özne)',
          note: 'Edilgen fiiller "-l / -n" eki alır ve iş başkası tarafından yapılmıştır.'
        ),
        ComparisonRow(
          correct: 'Ahmet yıkandı. (Dönüşlü - işi kendi kendine yaptı, özne gerçek)',
          wrong: 'Çamaşırlar yıkandı. (Edilgen - çamaşır kendi kendini yıkayamaz!)',
          note: 'Dönüşlü ile edilgen ayrımı: Özne işi bizzat kendi mi yapıyor, başkası mı yapıyor?'
        )
      ]
    ),
    LectureSection(
      title: 'Sözcük Türleri ve Eylemler Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Ünite değerlendirme çıkmış ayarındaki sözcük türleri ve fiil soruları:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde "çatı özelliği" aranmaz?',
          options: [
            'A) Akşam saatlerinde başlayan kar yağışı yolları kapattı.',
            'B) Küçük çocuk dedesinin anlattığı masalları dikkatle dinliyordu.',
            'C) Şairin son yayımlanan eseri oldukça etkileyiciydi.',
            'D) Misafirler gelmeden önce bütün hazırlıklar tamamlandı.',
            'E) Sınav sonuçlarını öğrenince arkadaşlarıyla sevinçle kucaklaştı.'
          ],
          correctIndex: 2,
          explanation: 'C seçeneğindeki cümlenin yüklemi "etkileyiciydi" sözcüğüdür ve isim soyludur (ek fiil almıştır). Türkçede isim cümlelerinde fiilde çatı özelliği aranmaz.',
          ruleTag: 'İsim Cümlelerinde Çatı Aranmaz'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki altı çizili sözcüklerden hangisi türü bakımından diğerlerinden farklıdır?\n(I) Bu sabah hava oldukça soğuktu. (II) Yaşlı adam ağır adımlarla parkta yürüyordu. (III) Birçok insan hafta sonunu evinde geçirmeyi tercih etti. (IV) Olayın bu yönünü daha önce hiç düşünmemiştik. (V) Kardeşim dün akşam buraya geldi.',
          options: [
            'A) Bu (I)',
            'B) Yaşlı (II)',
            'C) Birçok (III)',
            'D) bu (IV)',
            'E) buraya (V)'
          ],
          correctIndex: 4,
          explanation: 'I\'de "Bu sabah" sıfat, II\'de "Yaşlı adam" sıfat, III\'te "Birçok insan" belgisiz sıfat, IV\'te "bu yön" sıfattır. Ancak V\'teki "buraya" sözcüğü ismin yönelme hâl ekini almış bir İŞARET ZAMİRİDİR.',
          ruleTag: 'Sözcük Türleri Ayrımı'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu9 = konu9SozcukTurleri;
