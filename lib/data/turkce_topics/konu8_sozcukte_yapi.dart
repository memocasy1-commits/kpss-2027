// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu8SozcukteYapi = LectureTopic(
  id: 'turkce_konu_8',
  courseId: 'turkce',
  order: 8,
  title: 'Sözcükte Yapı',
  subtitle: 'Kök Türleri, Gövde, Yapım ve Çekim Ekleri, Basit, Türemiş ve Birleşik Sözcükler',
  icon: Icons.account_tree,
  color: const Color(0xFF0284C7),
  testRange: 'Test 71 - 80',
  startTestNum: 71,
  endTestNum: 80,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Kök Kavramı ve Kök Türleri',
      type: LectureSectionType.overview,
      leadText: 'Kelimenin parçalanamayan, anlamlı en küçük yapı birimine "kök" denir. Türkçe sondan eklemeli bir dil olduğu için kökler kelimenin en başında yer alır (turkce1.pdf Sayfa 83-85):',
      bulletPoints: [
        '▸ Kökün Temel Özellikleri:\n• Kök ile kelimenin aldığı ekler arasında mutlaka anlamsal bir bağ bulunmalıdır.\n  • "balık" sözcüğünün kökü "bal" OLAMAZ; çünkü arı balı ile deniz balığı arasında anlamsal bağ yoktur!\n  • "kelebek" sözcüğünün kökü "kel" OLAMAZ.\n  • "kalemlik" sözcüğünün kökü "kalem"dir; çünkü kalemlik kalem koymaya yarar, aralarında bağ vardır.',
        '▸ 1. İsim Kökü:\n• Varlıkların, kavramların, duyguların adıdır. Sonuna mastar eki ("-mak / -mek") ALAMAZLAR:\n  • at, araba, çiçek, anahtar, telefon, anne, taş, göz, ev, su, yol.\n• Yansıma Kökler de İsim Köküdür: Doğadaki seslerin taklidiyle oluşan kökler isim kökü sayılır: "pat, çat, şır, hav, vız, güm, hor, fıs".',
        '▸ 2. Fiil (Eylem) Kökü:\n• İş, oluş veya durum bildiren köklerdir. Sonuna mastar eki ("-mak / -mek") ALABİLİRLER:\n  • aç-, at-, kal-, çiz-, al-, kaç-, gel-, gör-, sev-, dur-, bil-.\n• Fiil kökleri tek başına söylenemez; sonuna kısa çizgi (-) konularak ifade edilir.',
        '▸ 3. Sesteş (Eş Sesli) Kökler:\n• Yazılışları ve okunuşları aynı olmasına rağmen ANLAMLARI VE TÜRLERİ TAMAMEN FARKLI olan, aralarında hiçbir anlam ilişkisi bulunmayan köklerdir:\n  • "gül" (çiçek adı - isim kökü) / "gül-" (gülümsemek - fiil kökü)\n  • "kaz" (kümes hayvanı - isim kökü) / "kaz-" (toprağı kazmak - fiil kökü)\n  • "yaz" (mevsim adı - isim kökü) / "yaz-" (yazı yazmak - fiil kökü)\n  • "çay" (akarsu veya içecek - isim) / "yüz" (sayı, surat - isim) / "yüz-" (suda yüzmek, derisini yüzmek - fiil).',
        '▸ 4. Ortak (Kökteş) Kökler:\n• Hem isim hem de fiil olarak kullanılabilen ve aralarında BELİRGİN ANLAM İLİŞKİSİ BULUNAN köklerdir:\n  • boya (isim) / boya- (fiil) -> Aralarında duvarı boyama ilişkisi vardır.\n  • sıva (isim) / sıva- (fiil)\n  • güreş (isim) / güreş- (fiil)\n  • barış (isim) / barış- (fiil)\n  • savaş (isim) / savaş- (fiil)\n  • tat (isim) / tat- (fiil)\n  • göç (isim) / göç- (fiil)\n  • güven (isim) / güven- (fiil).'
      ],
      goldenRule: 'Sesteş Kök ile Ortak Kök Farkı: Sesteş kökler arasında ANLAM İLİŞKİSİ ASLA YOKTUR (kaz hayvanı ile çukur kazmak ilgisizdir). Ortak kökler arasında ise DOĞRUDAN ANLAM İLİŞKİSİ VARDIR (boya malzemesi ile boyamak eylemi aynı kaynaktır).',
      osymTrap: 'Bir sözcüğün kökünü bulurken sözcükten ekleri attıktan sonra kalan parçanın sözcüğün tamamıyla anlam ilgisi olup olmadığına dikkat edin! "Balta" sözcüğünün kökü "bal" değildir!'
    ),
    LectureSection(
      title: 'Gövde ve Dört Temel Yapım Eki Türü',
      type: LectureSectionType.formula,
      leadText: 'En az bir yapım eki almış sözcüklere "gövde" denir. Yapım ekleri eklendiği sözcüğün anlamını veya türünü değiştiren eklerdir (turkce1.pdf Sayfa 84-88):',
      bulletPoints: [
        '▸ GÖVDE TÜRLERİ:\n• İsim Gövdesi: İsimden veya fiilden yapım eki alarak isim olan gövdedir: sev-gi (fiilden isim), ev-li (isimden isim).\n• Fiil Gövdesi: İsimden veya fiilden yapım eki alarak fiil olan gövdedir: otur-t- (fiilden fiil), göz-le- (isimden fiil).',
        '▸ 1. İsimden İsim Yapan Ekler:\n• İsim kök veya gövdelerine gelerek yeni isimler türetir:\n  • -lık / -lik: kitap-lık, insan-lık, tuz-luk, kış-lık, göz-lük\n  • -cı / -ci: simit-çi, yol-cu, demir-ci, sanat-çı, saat-çi\n  • -lı / -li: köy-lü, şeker-li, bilgi-li, dert-li\n  • -sız / -siz: su-suz, ev-siz, vicdan-sız, kimse-siz\n  • -daş / -deş: yurt-taş, meslek-taş, yol-daş, arka-daş\n  • -ce / -ca: Türk-çe, kardeş-çe, dost-ça\n  • -cık / -cik: ev-cik, tepe-cik, ada-cık\n  • -inci: bir-inci, üç-üncü\n  • -er / -ar: iki-ş-er, üç-er',
        '▸ 2. İsimden Fiil Yapan Ekler:\n• İsim kök veya gövdelerine gelerek eylem türetir:\n  • -la / -le: baş-la-, su-la-, göz-le-, temiz-le-, kilit-le-\n  • -al / -el: az-al-, çok-al-, dar-al-\n  • -l-: kısa-l-, ince-l-, sivri-l-\n  • -a / -e: kan-a-, yaş-a-, boş-a-\n  • -ar / -er: sarı-ar- -> sarar-, yaş-ar-, mor-ar-\n  • -da / -de (yansımalara): fısıl-da-, horul-da-, patır-da-, gürül-de-',
        '▸ 3. Fiilden Fiil Yapan Ekler:\n• Eylem kök veya gövdelerine gelerek fiilin anlamını ya da çatısını değiştirir:\n  • -dır / -dir: yap-tır-, gül-dür-, öl-dür-, bil-dir-\n  • -t-: oku-t-, uyu-t-, boya-t-, yürüt-\n  • -r-: iç-ir-, doy-ur-, düş-ür-, kaç-ır-\n  • -ıl / -il (edilgenlik): yaz-ıl-, kır-ıl-, yap-ıl-, aç-ıl-\n  • -ın / -in (dönüşlülük): yıka-n-, giy-in-, tara-n-, bak-ın-\n  • -ış / -iş (işteşlik): gör-üş-, kaç-ış-, uç-uş-, yaz-ış-',
        '▸ 4. Fiilden İsim Yapan Ekler:\n• Eylem kök veya gövdelerine gelerek ad, sıfat veya zarf türetir:\n  • -gi / -gü: sev-gi, say-gı, gör-gü, çiz-gi, ver-gi, bil-gi\n  • -k: açık (aç-ık), kırık, delik, yatık, bölük, donuk\n  • -ım / -im: seç-im, ver-im, al-ım, üretim, bölüm, ölüm\n  • -ıcı / -ici: sat-ıcı, yüz-ücü, kur-ucu, yık-ıcı, bak-ıcı\n  • -ak / -ek: dur-ak, yat-ak, kaç-ak, kon-ak, dön-ek\n  • -tı / -ti: belir-ti, kızar-tı, karar-tı, akın-tı\n  • -ce: düşün-ce, eğlen-ce\n  • -i: yaz-ı, gez-i, yap-ı, say-ı, diz-i\n  • -gın / -gin: yor-gun, bit-kin, kır-gın, bas-kın, ger-gin\n  • Fiilimsilerin tamamı (-mak, -me, -iş; -an, -ası, -mez, -ar, -dik, -ecek, -miş; -ken, -alı, -erek) fiilden isim yapım ekidir!'
      ],
      goldenRule: 'Tüm Fiilimsiler Yapım Ekidir! Fiilimsi eki alan her sözcük kökü ne olursa olsun fiilden isim türemiş bir sözcüktür (gövdedir) ve yapısı bakımından TÜREMİŞTİR.',
      osymTrap: 'Gövdeden türemiş sözcük: En az İKİ yapım eki almış sözcüktür! Örneğin: göz (kök) -> göz-lük (1. yapım eki / gövde) -> gözlük-çü (2. yapım eki / gövdeden türemiş).'
    ),
    LectureSection(
      title: 'Çekim Ekleri (İsim ve Fiil Çekim Ekleri)',
      type: LectureSectionType.comparison,
      leadText: 'Sözcüğün anlamını veya türünü değiştirmeyen; cümle içinde görev almasını, diğer sözcüklerle bağ kurmasını sağlayan ekler (turkce1.pdf Sayfa 88-91):',
      bulletPoints: [
        '▸ A. İSİM ÇEKİM EKLERİ:\n• 1. Çoğul Eki (-lar / -ler): İsimlere çokluk anlamı katar: ev-ler, kitap-lar. (Bazen aile, millet, abartma veya yaklaşıklık katar: Aliler, Türkler, ateşler içinde, otuz yaşlarında).\n• 2. Hâl (Durum) Ekleri:\n  • Yalın Hâl: İsmin hâl eki almamış durumudur (yapım eki veya çoğul eki alsa bile hâl eki almamışsa yalındır!).\n  • Belirtme Hâli (-ı, -i, -u, -ü): Neyi, kimi sorusuna cevap verir: ev-i gördüm, kapı-y-ı açtı.\n  • Yönelme Hâli (-a, -e): Nereye, kime sorusuna cevap verir: ev-e gitti, okul-a vardı.\n  • Bulunma Hâli (-da, -de, -ta, -te): Nerede, kimde sorusuna cevap verir: ev-de kaldı, sınır-da bekledi.\n  • Ayrılma (Çıkma) Hâli (-dan, -den, -tan, -ten): Nereden, kimden sorusuna cevap verir: ev-den çıktı, okul-dan geldi.\n• 3. İyelik (Aitlik) Ekleri: Bir varlığın kime ya da neye ait olduğunu belirtir:\n  • ev-im (benim), ev-in (senin), ev-i (onun), ev-imiz (bizim), ev-iniz (sizin), ev-leri (onların).\n  • KRİTİK AYRIM: Belirtme Hâli Eki (-i) ile 3. Tekil İyelik Eki (-i) Farkı:\n    • Kelimenin başına "onun" getirilir; uyuyorsa İYELİK ekidir, uymuyorsa BELİRTME hâl ekidir!\n    • *Örnek:* "(Onun) Evi çok güzelmiş." -> İyelik eki.\n    • *Örnek:* "(Onun) Evi dün temizledik." -> Cümle oturmaz, belirtme hâl ekidir.\n• 4. İlgi (Tamlayan) Eki (-(n)ın / -(n)in / -(n)un / -(n)ün): İsim tamlamalarında tamlayana gelir: kapı-n-ın kolu, ev-in çatısı.\n• 5. Eşitlik Eki (-ca / -ce): yaş-ça büyük, boy-ca uzun, ben-ce, insan-ca.\n• 6. Vasıta Eki (-(y)la / -(y)le): araba-y-la geldi, kalem-le yazdı.',
        '▸ B. FİİL ÇEKİM EKLERİ:\n• 1. Kip Ekleri: Fiilin zamanını (Haber kipleri: -di, -miş, -yor, -ecek, -r) veya dileğini (Dilek kipleri: -malı, -se, -e, emir) bildirir.\n• 2. Şahıs Ekleri: Fiili kimin yaptığını bildirir: gel-di-m, gel-di-n, gel-di, gel-di-k, gel-di-niz, gel-di-ler.\n• 3. Ek Fiil (Ek Eylem - idi, imiş, ise, -dir): Fiillere gelerek birleşik zaman yapar (gel-miş-ti, oku-yor-sa).'
      ],
      goldenRule: 'Belirtme Eki (-i) ile İyelik Eki (-i) Sınav Klasiğidir: Başına "Onun" koy! "Kitabı kaybolmuş" -> Onun kitabı (İyelik eki). "Kitabı masaya bıraktı" -> Neyi bıraktı? (Belirtme hâl eki).',
      comparisonRows: [
        ComparisonRow(
          correct: 'Onun arabası kapıda duruyor. (İyelik eki - aitlik bildirir)',
          wrong: 'Arabayı garaja çekti. (Belirtme hâl eki - neyi sorusuna cevap)',
          note: 'Başına "onun" zamiri getirilerek test edilir.'
        ),
        ComparisonRow(
          correct: 'Ev-ler-imiz-den (Kök + Çoğul + İyelik + Ayrılma hâli)',
          wrong: 'Eklerin geliş sırası: Kök -> Yapım Eki -> Çekim Eki',
          note: 'Türkçede kural olarak yapım ekleri çekim eklerinden önce gelir.'
        )
      ]
    ),
    LectureSection(
      title: 'Yapı Bakımından Sözcükler (Basit, Türemiş, Birleşik)',
      type: LectureSectionType.ruleList,
      leadText: 'Sözcüklerin aldıkları eklere ve birleşme biçimlerine göre yapı sınıflandırması (turkce1.pdf Sayfa 91-94):',
      bulletPoints: [
        '▸ 1. Basit Sözcük:\n• Hiçbir yapım eki ALMAMIŞ sözcüklerdir.\n• Çekim eki alabilirler; istedikleri kadar çekim eki alsalar da yapıları basittir:\n  • yol, ev, ev-ler, ev-ler-imiz-den, kitap, kitap-lar-ı, oku-du-k, git-miş-ler.\n  • Yapım eki almadığı sürece sözcüğün anlamı veya türü değişmez.',
        '▸ 2. Türemiş Sözcük (Gövde):\n• Kök veya gövdelere en az bir tane YAPIM EKİ getirilerek oluşturulan sözcüklerdir:\n  • tuz-luk, göz-lük-çü, baş-la-dı, sev-gi-li, yurt-taş, aç-ık, seç-im, gör-üş-me-ler.\n• Bir sözcük yapım eki aldıktan sonra çekim eki alsa da türemiş olma özelliği bozulmaz.',
        '▸ 3. Birleşik Sözcük:\n• Yeni bir kavramı karşılamak üzere en az iki sözcüğün bir araya gelip kaynaşmasıyla oluşan sözcüklerdir:\n  • A. Anlam Kayması Yoluyla: hanımeli, aslanağzı, karafatma, demirbaş.\n  • B. Ses Değişimi / Düşmesi Yoluyla: cumartesi (cuma ertesi), sütlaç (sütlü aş), kaynana (kayın ana), niçin (ne için).\n  • C. Sözcük Türü Değişimi Yoluyla (İki Fiilden): biçerdöver, kapkaç, çekyat, dedikodu, uyurgezer.\n  • D. İsim + Fiil Birleşmesiyle: gecekondu, mirasyedi, gökdelen, cankurtaran.'
      ],
      goldenRule: 'Bir sözcüğün yapısı sorulduğunda bakılacak TEK ŞEY şudur: Yapım eki almış mı (Türemiş), iki sözcük mü birleşmiş (Birleşik), yapım eki almamış mı (Basit). Başka hiçbir ayrıntıya bakılmaz!',
      osymTrap: 'Çekim ekleri sözcüğün yapısını DEĞİŞTİRMEZ! "Evlerimizdeymişsiniz" kelimesinde 5 tane ek vardır ama hepsi çekim eki olduğu için bu sözcük BASİT bir sözcüktür!'
    ),
    LectureSection(
      title: 'Sözcükte Yapı Çözümlü Uygulamalar',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'turkce1.pdf Ünite Değerlendirme Testi (Sayfa 95-97) soruları ve adım adım çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki altı çizili sözcüklerden hangisi yapısı bakımından diğerlerinden farklıdır?\n"Sabah erkenden kalkıp bahçedeki ağaçların sararmış yapraklarını süpürdü."',
          options: [
            'A) sabah',
            'B) ağaçların',
            'C) sararmış',
            'D) yapraklarını',
            'E) süpürdü'
          ],
          correctIndex: 2,
          explanation: '"Sabah" basit, "ağaçların" (ağaç-lar-ın) çekim ekleri almış basittir. "Yapraklarını" çekim ekleri almış basittir. "Süpürdü" basittir. Ancak "sararmış" sözcüğünün kökü "sarı" ismidir; sarı + ar -> sarar- (ünlü düşmesi ve isimden fiil yapım eki) alarak TÜREMİŞTİR.',
          ruleTag: 'Sözcükte Yapı Türleri'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde altı çizili sözcük "gövdeden türemiş"tir (en az iki yapım eki almıştır)?',
          options: [
            'A) Masadaki tuzluğu doldurmayı unuttun.',
            'B) Şehrin en işlek caddesinde bir gözlükçü açıldı.',
            'C) Soğuk havalarda kalın giyinmek gerekir.',
            'D) Yarışmada birinci olan öğrenciyi tebrik ettiler.',
            'E) Yazarın son kitabı büyük bir ilgiyle okundu.'
          ],
          correctIndex: 1,
          explanation: '"Gözlükçü" sözcüğünün analizi:\ngöz (isim kökü) -> göz-lük (1. yapım eki: gövde) -> gözlük-çü (2. yapım eki: gövdeden türemiş sözcük). En az iki yapım eki aldığı için gövdeden türemiştir.',
          ruleTag: 'Gövdeden Türemiş Sözcük'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu8 = konu8SozcukteYapi;
