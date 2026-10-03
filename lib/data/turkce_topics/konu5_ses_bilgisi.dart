// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu5SesBilgisi = LectureTopic(
  id: 'turkce_konu_5',
  courseId: 'turkce',
  order: 5,
  title: 'Ses Bilgisi',
  subtitle: 'Ünlü ve Ünsüz Olayları, Ses Uyumları, Değişimler ve İstisnalar',
  icon: Icons.record_voice_over,
  color: const Color(0xFF0284C7),
  testRange: 'Test 41 - 50',
  startTestNum: 41,
  endTestNum: 50,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkçenin Ses Özellikleri ve Ses Tabloları',
      type: LectureSectionType.overview,
      leadText: 'Türk alfabesinde 29 harf vardır (8 ünlü, 21 ünsüz). Sesler akciğerlerden gelen havanın ses tellerinde titreşmesiyle oluşur (turkce1.pdf Sayfa 99).',
      bulletPoints: [
        '▸ 1. Ünlüler (Sesliler - 8 Adet):\n• Kalın Ünlüler: a, ı, o, u\n• İnce Ünlüler: e, i, ö, ü\n• Düz Ünlüler: a, e, ı, i\n• Yuvarlak Ünlüler: o, ö, u, ü\n• Geniş Ünlüler: a, e, o, ö\n• Dar Ünlüler: ı, i, u, ü',
        '▸ 2. Ünsüzler (Sessizler - 21 Adet):\n• Sert Ünsüzler (Fıstıkçı Şahap): f, s, t, k, ç, ş, h, p\n• Yumuşak Ünsüzler: b, c, d, g, ğ, j, l, m, n, r, v, y, z',
        '▸ 3. Büyük Ünlü Uyumu (Kalınlık-İncelik Uyumu):\n• Bir kelimenin ilk hecesinde kalın ünlü (a, ı, o, u) varsa diğer heceler de kalın; ince ünlü (e, i, ö, ü) varsa diğer heceler de ince ünlüyle devam eder.\n• *Uyanlar:* adım, kavun, çilek, gözlük, kalemlik.\n• *Uymayanlar:* kitap, tiyatro, elma, anne, kardeş (orijinali kalın/ince karışmıştır).\n• Büyük Ünlü Uyumunu Bozan 7 Ek: "-ken, -ki, -yor, -daş, -mtırak, -leyin, -gil" ekleri tek şekilli oldukları için uyumu bozabilir:\n  • bak-arken (bozar), sabah-ki (bozar), gel-i-yor (bozar), meslek-taş (bozmaz ama din-daş bozar), sarı-mtırak (bozar), akşam-leyin (bozar), teyzem-gil (bozmaz ama dayım-gil bozar).',
        '▸ 4. Küçük Ünlü Uyumu (Düzlük-Yuvarlaklık Uyumu):\n• Kural A: Düz ünlüden (a, e, ı, i) sonra düz ünlü (a, e, ı, i) gelir.\n• Kural B: Yuvarlak ünlüden (o, ö, u, ü) sonra ya dar-yuvarlak (u, ü) ya da düz-geniş (a, e) gelir.\n• *Önemli:* Türkçede "o, ö" sesleri sadece birinci (ilk) hecede bulunabilir; sonraki hecelerde "o, ö" bulunamaz (İstisnalar: -yor eki ve yabancı sözcükler: radyo, horoz, balkon).'
      ],
      goldenRule: 'Türkçe bir sözcüğün ilk hecesi dışında "o, ö" ünlüsü ASLA bulunamaz. Bir kelimenin 2. veya 3. hecesinde "o, ö" görüyorsanız o sözcük ya yabancı kökenlidir (doktor, oto, psikolog) ya da "-yor" şimdiki zaman ekini almıştır.',
      osymTrap: 'Birleşik sözcüklerde (Çanakkale, açıkgöz, hanımeli) ve yabancı kökenli alıntı sözcüklerde büyük/küçük ünlü uyumu ARANMAZ.'
    ),
    LectureSection(
      title: 'Ünlü Olayları (Düşme, Daralma, Türeme, Aşınma)',
      type: LectureSectionType.ruleList,
      leadText: 'Ünlülerde gerçekleşen ses değişimleri ve ÖSYM\'nin en sık sorduğu kurallar (turkce1.pdf Sayfa 100-102):',
      bulletPoints: [
        '▸ 1. Ünlü Düşmesi (Hece Düşmesi):\n• A. İki Heceli Organ / Vücut / Akıl Adlarında: İkinci hecesinde dar ünlü (ı, i, u, ü) bulunan sözcükler ünlüyle başlayan ek aldığında ikinci hecedeki dar ünlü düşer:\n  • burun + u -> burnu, akıl + ı -> aklı, karın + ı -> karnı, alın + ı -> alnı, göğüs + ü -> göğsü, omuz + u -> omzu, boyun + u -> boynu, gönül + ü -> gönlü, fikir + i -> fikri, resim + i -> resmi, zehir + i -> zehri.\n• B. Türetilirken (Yapım Eki Alırken) Ünlü Düşmesi:\n  • sarı + ar -> sarar-, koku + la -> kokla-, uyu + ku -> uyku, sızı + la -> sızla-, oyun + a -> oyna-, uyu + u -> uyuşuk / uyu-, ileri + le -> ilerle-, devir + il -> devril-, çevir + e -> çevre, ayır + ım -> ayrım, savur + uk -> savruk, kavuş + ak -> kavşak, besle- (besi-le).\n• C. Birleşik Sözcük Oluşurken (Ünlü Aşınması):\n  • cuma + ertesi -> cumartesi, pazar + ertesi -> pazartesi, ne + için -> niçin, ne + asıl -> nasıl, sütlü + aş -> sütlaç, kahve + altı -> kahvaltı, kayın + ana -> kaynana, biri + biri -> birbiri.\n• D. Yardımcı Eylemle Birleşirken:\n  • kayıp + olmak -> kaybolmak, emir + etmek -> emretmek, şükür + etmek -> şükretmek, sabır + etmek -> sabretmek, hapis + olmak -> hapsolmak.',
        '▸ 2. Ünlü Daralması:\n• Türkçede sonu geniş ünlüyle ("a, e") biten fiillere "-yor" eki getirildiğinde, aradaki geniş ünlü daralarak "ı, i, u, ü"ye dönüşür:\n  • başla-yor -> başlıyor, bekle-yor -> bekliyor, anla-yor -> anlıyor, söyle-yor -> söylüyor, kokla-yor -> kokluyor, kutla-yor -> kutluyor, gözle-yor -> gözlüyor.\n• "Y" Kaynaştırma Harfi Kaynaklı Daralma: Yalnızca iki fiilde kalıcı daralma yapar:\n  • de- (demek) -> di-y-en, di-y-ecek, di-y-e, di-y-elim.\n  • ye- (yemek) -> yi-y-en, yi-y-ecek, yi-y-ince, yi-y-in.\n  • *DİKKAT:* Bu fiiller dışındaki sözcüklerde "y" daralma YAPMAZ! "Anla-y-an" yazılır (anliyan YANLIŞTIR), "başla-y-acak" yazılır (başlıyacak YANLIŞTIR).',
        '▸ 3. Ünlü Türemesi:\n• A. "-cık / -cik" Küçültme Eki Alırken:\n  • dar + cık -> dar-a-cık, bir + cik -> bir-i-cik, az + cık -> az-ı-cık, genç + cik -> genç-e-cik.\n• B. "P, R, S, M" ile Yapılan Pekiştirmelerde:\n  • düz -> düm-düze yerine dün-düz / sap-a-sağlam, çep-e-çevre, yap-a-yalnız, güp-e-gündüz.'
      ],
      goldenRule: '"ye-" ve "de-" fiilleri dışında "y" kaynaştırma harfi yazıda asla daralma yapmaz! "Gelmeyen" yerine "gelmiyen", "başlayacak" yerine "başlıyacak" yazmak YAZIM YANLIŞIDIR!',
      osymTrap: 'İkilemelerde ünlü düşmesi kuralı UYGULANMAZ: "omuz omuza" (omza omuza DEĞİL), "burun buruna" (burna buruna DEĞİL), "nesilden nesile", "şehirden şehire" şeklinde ayrı ve tam yazılır.'
    ),
    LectureSection(
      title: 'Ünsüz Olayları (Yumuşama, Sertleşme, Türeme, Düşme)',
      type: LectureSectionType.comparison,
      leadText: 'Ünsüzlerde meydana gelen ve dilin ahengini sağlayan ses değişim kuralları (turkce1.pdf Sayfa 103-107):',
      bulletPoints: [
        '▸ 1. Ünsüz Yumuşaması (Değişimi):\n• Sonu sert süreksiz ünsüzlerle (p, ç, t, k) biten bir sözcük ünlüyle başlayan bir ek aldığında bu sesler yumuşayarak sırasıyla b, c, d, ğ (g) olur:\n  • kitap + ı -> kitabı, ağaç + a -> ağaca, kanat + ı -> kanadı, sokak + a -> sokağa, renk + i -> rengi.\n• Yumuşama Kuralının İstisnaları:\n  • Tek Heceli Sözcüklerin Bir Kısmı: top-u, ip-i, süt-ü, tek-i, saç-ı, kat-ı, et-i, suç-u, koç-u (yumuşamaz). Fakat bazı tek heceliler yumuşar: çok -> çoğu, kap -> kabı, kurt -> kurdu, cep -> cebi.\n  • Yabancı Kökenli Sözcükler: millet-i, devlet-i, adalet-i, cumhuriyet-i, hukuk-un, evrak-ı, ahlak-ı, tabiat-ı, sanat-ı, merak-ı, dikkat-i (yumuşamaz; "hukuğun", "evrağı" yazmak YAZIM YANLIŞIDIR!).\n  • Özel İsimler: Yazarken yumuşama gösterilmez, kesme işaretiyle ayrılır (Konuşurken yumuşatılabilir): Zonguldak\'a (Zonguldağa YAZILMAZ), Ahmet\'e, Sinop\'a.',
        '▸ 2. Ünsüz Sertleşmesi (Benzeşmesi - Fıstıkçı Şahap):\n• Sonu sert ünsüzlerle (f, s, t, k, ç, ş, h, p) biten bir kelimeye yumuşak ünsüzler olan "c, d, g" ile başlayan bir ek geldiğinde, ekin başındaki ünsüzler sertleşerek "ç, t, k"ye dönüşür:\n  • c -> ç (ağaç + cı -> ağaççı, kitap + cı -> kitapçı)\n  • d -> t (git- + di -> gitti, sınıf + da -> sınıfta, 1923 + de -> 1923\'te)\n  • g -> k (seç- + gin -> seçkin, üret- + genç -> üretken, bit- + gin -> bitkin, ses- + deş -> sesteş)\n• Sertleşme kuralına uymamak doğrudan YAZIM YANLIŞIDIR ("sınıfda", "1923\'de" yazımı yanlıştır).',
        '▸ 3. Ünsüz Türemesi (İkizleşme):\n• Arapça kökenli sözcükler "etmek, olmak" yardımcı eylemleriyle birleştiğinde veya ünlüyle başlayan ek aldığında kök sonundaki ünsüz ikizleşir:\n  • his + etmek -> hissetmek, red + etmek -> reddetmek, af + etmek -> affetmek, hal + olmak -> hallolmak, zan + etmek -> zannetmek.\n  • sır + ı -> sırrı, hat + ı -> hattı, hak + ı -> hakkı, tıp + ı -> tıbbı.',
        '▸ 4. Ünsüz Düşmesi:\n• "-k" Sesinin Düşmesi: Sonu "k" ünsüzüyle biten sözcükler "-cık / -cik" veya "-l-" yapım ekini aldığında "k" sesi düşer:\n  • minik + cik -> minicik, küçük + cük -> küçücük, sıcak + cık -> sıcacık, çabuk + cak -> çabucak, alçak + l -> alçal-, yüksek + l -> yüksel-, seyrek + l -> seyrele-.\n• "ast / üst" Birleşmesinde "t" Düşmesi: ast-teğmen -> asteğmen, üst-teğmen -> üsteğmen.'
      ],
      goldenRule: 'FISTIKÇI ŞAHAP kuralı sayılarda ve kısaltmalarda da harfiyen geçerlidir: "1923\'te" (1923\'de YANLIŞ), "saat 15.00\'te" (15.00\'da YANLIŞ), "TÜBİTAK\'ta" (TÜBİTAK\'da YANLIŞ).',
      comparisonRows: [
        ComparisonRow(
          correct: 'Hukukun üstünlüğü esastır.',
          wrong: 'Hukuğun üstünlüğü esastır.',
          note: 'Yabancı kökenli "hukuk" sözcüğünde yumuşama olmaz.'
        ),
        ComparisonRow(
          correct: 'Sınıfta yirmi öğrenci vardı.',
          wrong: 'Sınıfda yirmi öğrenci vardı.',
          note: 'Sertleşme (f -> t) kuralına uymamak yazım hatasıdır.'
        ),
        ComparisonRow(
          correct: 'Evrakı memura teslim etti.',
          wrong: 'Evrağı memura teslim etti.',
          note: '"Evrak" sözcüğünde "k" yumuşamaz.'
        )
      ]
    ),
    LectureSection(
      title: 'Diğer Ses Olayları (Kaynaştırma, Ulama, Dudak Benzeşmesi)',
      type: LectureSectionType.ruleList,
      leadText: 'Türkçede telaffuzu kolaylaştıran yardımcı ses olayları (turkce1.pdf Sayfa 106-107):',
      bulletPoints: [
        '▸ 1. Kaynaştırma Harfleri (YaŞaSıN - y, ş, s, n):\n• İki ünlü harf Türkçede yan yana gelemeyeceğinden araya kaynaştırma ünsüzü girer:\n  • y: masa-y-a, kapı-y-ı, iki-y-e, dinle-y-en, araba-y-la.\n  • ş: Üleştirme sayılarında kullanılır: iki-ş-er, yedi-ş-er (beş-er kelimesinde kaynaştırma yoktur çünkü kök "beş"tir!).\n  • s: 3. şahıs iyelik ekinde kullanılır: anne-s-i, kapı-s-ı, araba-s-ı, su-y-u ("su" kelimesinde istisna olarak "y" kaynaştırması gelir).\n  • n: İlgi ve durum eklerinde zamir n\'si olarak girer: kapı-n-ın kolu, onun ev-i-n-e, o-n-u, bu-n-dan.',
        '▸ 2. Ulama:\n• Ünsüzle biten bir kelimeden sonra ünlüyle başlayan bir kelime geldiğinde iki kelimenin birbirine bağlanarak okunmasıdır:\n  • "Dönülmez akşamın ufkundayız vakit çok geç" -> dönülme-zakşamı-nufkundayız.\n  • ⚠️ UYARI: İki kelime arasında herhangi bir noktalama işareti (özellikle virgül) varsa ULAMA YAPILAMAZ!\n  • *Örnek:* "Çocuk, ekmeği fırından aldı." (Virgül olduğu için "çocuk" ile "ekmeği" arasında ulama yoktur).',
        '▸ 3. Dudak Ünsüzlerinin Benzeşmesi (N-B Çatışması):\n• Türkçede "b" dudak ünsüzünden önce gelen "n" diş-damak sesi "m"ye dönüşür:\n  • saklanbaç -> saklambaç, dolanbaç -> dolambaç, canbaz -> cambaz, tenbel -> tembel, pembe (orijinali penbe), anbar -> ambar, perşenbe -> perşembe, sünbül -> sümbül, çenber -> çember.\n• İstisnalar: Özel isimlerde ve birleşik sözcüklerde "n" harfi korunur:\n  • İstanbul (İstambul YANLIŞ), Safranbolu, sonbahar, binbaşı, günbatımı, onbaşı.'
      ],
      goldenRule: 'Araya noktalama işareti giren yerde asla ulama aranmaz! "Yolcu, otobüsten indi." cümlesinde virgül ulama yapılmasını engeller.',
      osymTrap: '"Beşer" sözcüğünde "ş" kaynaştırma DEĞİLDİR; sözcüğün kökü "beş"tir. Ancak "iki-ş-er", "yedi-ş-er" sözcüklerinde "ş" kaynaştırmadır.'
    ),
    LectureSection(
      title: 'Ses Bilgisi Çözümlü Uygulamalar ve Soru Tipleri',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'turkce1.pdf Ünite Değerlendirme Testi (Sayfa 109-111) çıkmış ayarındaki ses bilgisi soruları:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki altı çizili sözcüklerin hangisinde birden fazla ses olayı gerçekleşmiştir?\n"Gençliğinde yazdığı şiirlerin hepsini bir defterde toplamıştı."',
          options: [
            'A) Gençliğinde',
            'B) yazdığı',
            'C) şiirlerin',
            'D) defterde',
            'E) toplamıştı'
          ],
          correctIndex: 1,
          explanation: '"Yazdığı" sözcüğünde:\n1. dık/dik sıfat-fiil eki köke gelirken: yaz-dık -> yaz-dığ-ı (k -> ğ ünsüz yumuşaması),\n2. Kelime iyelik ve hâl eki alırken: yazdığı-n-da (n kaynaştırma harfi).\nAyrıca "toplamıştı" sözcüğünde: top-la-mış-dı -> toplamıştı (d -> t sertleşme). Ancak "yazdığı" hem yumuşama hem kaynaştırma barındırır.',
          ruleTag: 'Birden Fazla Ses Olayı'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde ünsüz türemesine uğramış bir sözcük vardır?',
          options: [
            'A) Sabahın olduğunu öğrenince çok sevindi.',
            'B) Sonunda bu zorlu engeli de aştı.',
            'C) Bütün haklarını sonuna kadar savundu.',
            'D) Küçük çocuk parkta neşeyle koşuyordu.',
            'E) Yere düşen bardağın kırıldığını gördü.'
          ],
          correctIndex: 2,
          explanation: '"Haklarını" sözcüğünün kökü "hak"tır. Ünlüyle başlayan ek aldığında kök sonundaki "k" ikizleşerek "hak-k-ı" şeklinde ünsüz türemesi meydana gelmiştir.',
          ruleTag: 'Ünsüz Türemesi'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu5 = konu5SesBilgisi;
