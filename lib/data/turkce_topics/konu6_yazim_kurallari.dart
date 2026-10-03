// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu6YazimKurallari = LectureTopic(
  id: 'turkce_konu_6',
  courseId: 'turkce',
  order: 6,
  title: 'Yazım Kuralları',
  subtitle: 'Büyük Harfler, Bitişik ve Ayrı Yazılan Sözcükler, Ekler, Kısaltmalar ve Sayılar',
  icon: Icons.spellcheck,
  color: const Color(0xFF0284C7),
  testRange: 'Test 51 - 60',
  startTestNum: 51,
  endTestNum: 60,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Büyük Harflerin Kullanıldığı Yerler',
      type: LectureSectionType.ruleList,
      leadText: 'TDK güncel kılavuzuna ve turkce1.pdf Sayfa 277-282\'ye göre büyük harflerin yazımıyla ilgili temel kurallar:',
      bulletPoints: [
        '▸ 1. Cümleler ve Dizeler: Cümleler ve şiir dizeleri daima büyük harfle başlar.',
        '▸ 2. Kişi Adları, Soyadları, Unvanlar ve Saygı Sözleri:\n• Kişi adlarından önce ve sonra gelen unvanlar, meslek adları, saygı sözleri ve lakaplar büyük harfle başlar:\n  • Prof. Dr. Zeynep Korkmaz, Kaymakam Erol Bey, Sayın Bakan, Avukat Kemal, Mustafa Efendi, Deli Petro, Genç Osman.\n• Akrabalık Bildiren Sözcükler:\n  • Gerçek öz akrabalık bildiriyorsa KÜÇÜK yazılır: Ayşe teyzem, Ali amcam, Zeynep ablam.\n  • Lakap, unvan veya tarihi kişilik olmuşsa BÜYÜK yazılır: Nene Hatun, Müslüm Baba, Gül Baba, Susuz Dede, Dayı Kemal.',
        '▸ 3. Millet, Boy, Dil, Din ve Mezhep Adları:\n• Türk, Kazak, İngiliz; Türkçe, Arapça; İslamiyet, Hristiyanlık; Musevi, Hanefi, Sünni.',
        '▸ 4. Gezegen ve Yıldız Adları:\n• Astronomi ve coğrafya terimi olarak kullanıldığında BÜYÜK harfle başlar: "Dünya, Güneş\'in etrafında döner.", "Mars ve Venüs araştırmaları."\n• Günlük mecaz dilde kullanıldığında KÜÇÜK harfle başlar: "Sen benim dünyamı aydınlattın.", "Odaya hiç güneş girmiyor."',
        '▸ 5. Yer Adları (Kıta, Ülke, Bölge, İl, İlçe, Köy, Semt):\n• Asya, Türkiye, İç Anadolu Bölgesi, Ankara, Kadıköy, Bahçelievler.\n• UYARI - İl, İlçe, Köy Sözcükleri: Yer adlarında il, ilçe, kasaba, köy sözcükleri KÜÇÜK yazılır:\n  • Ankara ili, Polatlı ilçesi, Taflan köyü, Uzungöl beldesi.',
        '▸ 6. Yer Adlarındaki Dağ, Deniz, Göl, Nehir, Boğaz, Geçit Adları:\n• İkinci kelimeler tür bildirse de özel ada dahil olduğu için BÜYÜK başlar ve ekler kesmeyle ayrılır:\n  • Ağrı Dağı, Van Gölü, Çanakkale Boğazı, Dicle Nehri, Zigana Geçidi, Ege Denizi, Süveyş Kanalı.',
        '▸ 7. Mahalle, Meydan, Bulvar, Cadde, Sokak Adları:\n• Bunların adlarında geçen "Mahalle, Meydan, Bulvar, Cadde, Sokak" sözcükleri BÜYÜK yazılır:\n  • Zafer Mahallesi, Kızılay Meydanı, Gazi Mustafa Kemal Bulvarı, Nenehatun Caddesi, Çiçek Sokak.',
        '▸ 8. Saray, Köşk, Han, Kale, Köprü, Kule, Anıt Adları:\n• Topkapı Sarayı, Çankaya Köşkü, Horozlu Han, Ankara Kalesi, Boğaziçi Köprüsü, Galata Kulesi, Bilge Kağan Anıtı.',
        '▸ 9. Kurum, Kuruluş ve Kurul Adları:\n• Her kelimesi büyük harfle başlar: Türkiye Büyük Millet Meclisi, Türk Dil Kurumu, Talim ve Terbiye Kurulu Başkanlığı, Çankaya Lisesi.\n• ÇOK ÖNEMLİ KURAL: Kurum, kuruluş, kurul, merkez, bakanlık ve üniversite adlarına gelen çekim ekleri KESME İŞARETİYLE AYRILMAZ! ("Türk Dil Kurumuna", "Türkiye Büyük Millet Meclisinde", "Milli Eğitim Bakanlığına").',
        '▸ 10. Kanun, Tüzük, Yönetmelik, Yönerge, Genelge Adları:\n• Medeni Kanun, Türk Bayrağı Tüzüğü, Telif Hakkı Yayın ve Satış Yönetmeliği.',
        '▸ 11. Kitap, Dergi, Gazete, Eser Adları:\n• Nutuk, Çalıkuşu, Varlık, Türk Dili, Resmi Gazete.\n• ⚠️ UYARI: "Gazete" ve "dergi" sözcüğü özel ada dahil değilse küçük yazılır: Hürriyet gazetesi, Milliyet gazetesi, Bilim Çocuk dergisi (İstisna: "Resmi Gazete"nin kendi adında gazete vardır).',
        '▸ 12. Tarihî Olay, Çağ ve Dönem Adları:\n• Kurtuluş Savaşı, Cilalı Taş Devri, İlk Çağ, Tanzimat Dönemi, Milli Edebiyat Dönemi.',
        '▸ 13. Belirli Bir Tarih Bildiren Ay ve Gün Adları:\n• Belli bir rakam/tarihe bağlıysa BÜYÜK yazılır: "29 Ekim 1923 Pazartesi günü", "19 Mayıs 1919\'da", "Gelecek yılın nisan ayında" (rakam yoksa KÜÇÜK).'
      ],
      goldenRule: 'Kurum ve kuruluş adlarına gelen ekler ASLA kesme işaretiyle ayrılmaz! "Türk Dil Kurumu\'na" YANLIŞ, "Türk Dil Kurumuna" DOĞRUDUR. "Milli Eğitim Bakanlığı\'nda" YANLIŞ, "Milli Eğitim Bakanlığında" DOĞRUDUR.',
      osymTrap: '"Ankara ili", "Bodrum ilçesi", "Avşar köyü" yazarken "il, ilçe, köy, kasaba" kelimeleri küçük harfle başlar! Ancak "Zafer Mahallesi", "Atatürk Caddesi" yazarken "Mahalle, Cadde, Sokak" büyük harfle başlar.'
    ),
    LectureSection(
      title: 'Birleşik Sözcüklerin Yazımı (Bitişik ve Ayrı Yazılanlar)',
      type: LectureSectionType.comparison,
      leadText: 'ÖSYM\'nin yazım kurallarında en çok elediği konu: Bitişik mi, ayrı mı? (turkce1.pdf Sayfa 273-276):',
      bulletPoints: [
        '▸ A. BİTİŞİK YAZILAN BİRLEŞİK KELİMELER:\n• 1. Ses Düşmesi veya Türemesine Uğrayanlar: kaynana, cumartesi, nasıl, niçin, hissetmek, reddetmek, affetmek, emretmek.\n• 2. Kelimelerden Biri veya İkisi Anlam Kaymasına Uğrayanlar:\n  • Bitki adları: aslanağzı, civanperçemi, keçiboynuzu, kuşburnu.\n  • Hayvan adları: danaburnu (böcek), karafatma, yalıçapkını (kuş).\n  • Hastalık/Alet/Yiyecek: itdirseği (arpacık), kargaburnu (pense), dilberdudağı (tatlı), hanımgöbeği, kadınbudu (köfte).\n• 3. "-an/-en, -ar/-er, -maz/-mez, -mış/-miş" Sıfat-Fiil Ekleriyle Kurulan Kalıplaşmış Sözcükler:\n  • gökdelen, barışsever, vatansever, cankurtaran, dalgakıran, karıncaezmez, çokbilmiş, yurtsever.\n• 4. İkinci Kelimesi Emir Kipiyle veya İki Fiilin Birleşmesiyle Kurulanlar:\n  • çekyat, kapkaç, tutkal, örtbas, biçerdöver, uyurgezer, dedikodu, kaptıkaçtı, oldu bitti.\n• 5. "Somut Olarak Yer Bildirmeyen" Alt, Üst ve Üzeri Sözleri:\n  • bilinçaltı, şuuraltı, ayakaltı, akşamüstü, ayaküstü, olağanüstü, gerçeküstü, suçüstü, yüzüstü.\n• 6. Hane, Name, Zade, Perver, Sever ile Bitenler:\n  • yazıhane, dershane, beyanname, amcazade, yardımsever, müziksever.\n• 7. Ara Yönler Daima Bitişik Yazılır:\n  • kuzeydoğu, kuzeybatı, güneydoğu, güneybatı.',
        '▸ B. AYRI YAZILAN BİRLEŞİK KELİMELER:\n• 1. Birleşme Sırasında Hiçbir Kelimesi Anlam Değişikliğine Uğramayanlar:\n  • Hayvan türleri: köpek balığı, deve kuşu, cırcır böceği, ateş böceği, dağ keçisi.\n  • Bitki türleri: çam fıstığı, kuru fasulye, yer elması, çörek otu, lale soğanı.\n  • Yiyecek/İçecek: talaş böreği, çiğ köfte, kuru yemiş, maden suyu, tulum peyniri.\n• 2. "Etmek, Olmak, Kılmak" Yardımcı Fiillerinde Ses Olayı Yoksa:\n  • terk etmek, ayırt etmek, fark etmek, terk olmak, arz etmek, yok etmek, dans etmek, sağ olmak.\n• 3. Somut Olarak Yer / Mekân Bildiren Alt ve Üst Sözleri:\n  • yer altı (maden/zemin kastedilirse), su altı, deri altı, böbrek üstü bezi, tepe üstü.\n• 4. Dış, İç, Sıra Sözleriyle Oluşturulan Sözler AYRI Yazılır:\n  • çağ dışı, din dışı, ahlak dışı, kanun dışı, olağan dışı, ceviz içi, hafta içi, yurt içi, yurt dışı, aklı sıra, ardı sıra, peşi sıra, yanı sıra.\n• 5. Durum, Olgu, Bilim ve Yol Bildiren Birleşikler:\n  • açık oturum, açık öğretim, dil bilgisi, ses bilgisi, ana dili, ön lisans, hava yolu, kara yolu, deniz yolu, çevre yolu.'
      ],
      goldenRule: '"Somut yer bildirmeyen" alt/üst bitişiktir: "bilinçaltı, akşamüstü, suçüstü, olağanüstü". Somut yer bildirenler ayrıdır: "yer altı suları, deri altı enjeksiyonu".',
      comparisonRows: [
        ComparisonRow(
          correct: 'Fark etmek, terk etmek, ayırt etmek',
          wrong: 'Farketmek, terketmek, ayırtetmek',
          note: 'Ses olayı (düşme/türeme) yoksa yardımcı eylemler ayrı yazılır.'
        ),
        ComparisonRow(
          correct: 'Yanı sıra, peşi sıra, ardı sıra',
          wrong: 'Yanı sıra (bitişik), peşisıra, ardısıra',
          note: '"Sıra" ile yapılan sözcükler her zaman ayrı yazılır.'
        ),
        ComparisonRow(
          correct: 'Hafta içi, yurt içi, yurt dışı',
          wrong: 'Haftaiçi, yurtiçi, yurtdışı',
          note: '"İç" ve "dış" sözleriyle kurulan terimler ayrı yazılır.'
        ),
        ComparisonRow(
          correct: 'Kuru yemiş, kuru fasulye',
          wrong: 'Kuruyemiş, kurufasulye',
          note: 'Anlam kayması olmadığı için ayrı yazılır.'
        )
      ]
    ),
    LectureSection(
      title: 'Kritik Ek ve Bağlaçların Yazımı (de, ki, mi)',
      type: LectureSectionType.comparison,
      leadText: 'ÖSYM sınavlarının vazgeçilmez 3 yazım kuralı (turkce1.pdf Sayfa 270-272):',
      bulletPoints: [
        '▸ 1. "de / da" Bağlacı ve "-de / -da" Bulunma Hâl Eki:\n• "de / da" Bağlacı: Cümleden çıkarıldığında cümlenin anlamı bozulmaz (sadece daralabilir). Daima AYRI yazılır. Asla "te / ta" şekli yoktur ("Sen de mi brütüs?" - Sente YAZILMAZ).\n• "-de / -da / -te / -ta" Bulunma Eki: İsme bitişik yazılır. Cümleden çıkarıldığında anlam tamamen bozulur. Ünsüz sertleşmesine uğrayabilir ("evde", "okulda", "sınıfta", "1923\'te").\n• *Pratik Test:* Cümleden "de"yi çıkarıp okuyun; anlam bozulmuyorsa bağlaçtır (ayrı yaz), anlam çöküyorsa ektir (bitişik yaz).',
        '▸ 2. "ki" Bağlacı ve "-ki" Ekinin Yazımı:\n• A. Bağlaç Olan "ki": Sözcükten ayrı yazılır. İki cümleyi bağlar ("Duydum ki unutmuşsun.", "Öyle bir insan ki herkes sever."). Kendisine "-ler" çoğul eki alamaz ("Duydum kiler" denmez!).\n• B. Kalıplaşmış Olarak Bitişik Yazılan "ki" Bağlaçları (SOMBAHÇEMİ Formülü):\n  • Sanki\n  • Oysaki\n  • Madenki\n  • Belki\n  • A (boş)\n  • Halbuki\n  • Çünkü\n  • E (boş)\n  • Meğerki\n  • İllaki\n• C. Sıfat Yapan "-ki": Eklendiği sözcüğü sıfat yapar, bitişik yazılır ("evdeki hesap", "bahçedeki ağaçlar", "akşamki maç"). "-ler" eki alabilir ("evdekiler").\n• D. İlgi Zamiri Olan "-ki": İsmin yerini tutar, bitişik yazılır ("Benim kalemim kırıldı, seninkini alabilir miyim?", "Bizimki yine geç kaldı").',
        '▸ 3. "mi / mı / mu / mü" Soru Ekinin Yazımı:\n• Daima kendinden önceki sözcükten AYRI yazılır.\n• Kendisine gelen ekler (şahıs ekleri) soru ekine BİTİŞİK yazılır:\n  • "Gelecek misin?", "Okudun mu?", "Güzel mi güzel bir ev" (pekiştirme görevi görse bile ayrı yazılır), "Geldin mi gideriz" (zaman anlamı katsa bile ayrı yazılır).'
      ],
      goldenRule: 'SOMBAHÇEMİ: Sanki, Oysaki, Madenki, Belki, Halbuki, Çünkü, Meğerki, İllaki. Bu 8 bağlaç kural dışı olarak DAİMA BİTİŞİK yazılır!',
      comparisonRows: [
        ComparisonRow(
          correct: 'Evde kimse yoktu. (Bulunma eki)',
          wrong: 'Ev de kimse yoktu.',
          note: '"Ev kimse yoktu" denemez, anlam bozulur -> bitişik yazılır.'
        ),
        ComparisonRow(
          correct: 'Sen de bizimle gel. (Bağlaç)',
          wrong: 'Sende bizimle gel.',
          note: '"Sen bizimle gel" anlamlıdır -> ayrı yazılır.'
        ),
        ComparisonRow(
          correct: 'Masadaki kitaplar, seninki nerede?',
          wrong: 'Masa daki kitaplar, senin ki nerede?',
          note: 'Sıfat yapan ve ilgi zamiri olan -ki daima bitişiktir.'
        )
      ]
    ),
    LectureSection(
      title: 'Kısaltmaların ve Sayıların Yazımı',
      type: LectureSectionType.ruleList,
      leadText: 'ÖSYM\'nin sıkça yokladığı teknik yazım detayları (turkce1.pdf Sayfa 283-286):',
      bulletPoints: [
        '▸ 1. Büyük Harfle Yapılan Kısaltmalar:\n• Büyük harfli kısaltmalara getirilen eklerde kısaltmanın SON HARFİNİN OKUNUŞU esas alınır:\n  • TDK\'ye (TDK\'ya YANLIŞ, çünkü Türkçede "ka" sesi yoktur, "ke" denir),\n  • TBMM\'nin, MEB\'e, THY\'de, SGK\'nin (SGK\'nın YANLIŞ).\n• Nokta Kuralı: Büyük harfli kısaltmalarda araya ve sona NOKTA KONMAZ! (İki istisna: "T.C." ve "T." [Türkçe]).',
        '▸ 2. Küçük Harfle Yapılan Kısaltmalar:\n• Ölçü birimleri uluslararası simgelerle yazılır ve sonuna nokta konmaz: m (metre), kg (kilogram), cm (santimetre), km (kilometre).\n• Küçük harfli kısaltmalara getirilen eklerde KELİMENİN AÇILIMI esas alınır:\n  • kg\'dan (kilosundan değil kilogramdan),\n  • cm\'yi (santimetreyi),\n  • mm\'den (milimetreden).\n• Sonunda nokta bulunan kısaltmalara ek getirilirken kesme işareti KULLANILMAZ: vb.leri, mad.nin, yy.da.',
        '▸ 3. Sayıların Yazımı:\n• Metin içindeki sayılar harflerle yazılabilir: "üç ay sonra", "bin yıldan beri".\n• Birden fazla sözcükten oluşan sayılar daima AYRI yazılır: "üç yüz altmış beş", "on altı", "yirmi beş". (İstisna: Çek, senet ve banka işlemlerinde sahteciliği önlemek için bitişik yazılır: "üçyüzaltmışbeşTL").\n• Sıra sayıları rakamla ve ekle gösterilirken kesme ve nokta kullanımına dikkat edilir:\n  • Doğru: 2\'nci (ikinci), 8\'inci (sekizinci), 5\'inci (beşinci).\n  • Yanlış: 2\'inci (iki-inci olur, çift i yanlıştır), 8\'nci (sekiz-nci olmaz).\n• ÜLEŞTİRME SAYILARI ASLA RAKAMLA YAZILAMAZ:\n  • Doğru: "ikişer ikişer", "beşer", "yedişer".\n  • Yanlış: "2\'şer", "5\'er", "7\'şer" yazımı doğrudan YAZIM YANLIŞIDIR!'
      ],
      goldenRule: 'Üleştirme sayıları (2\'şer, 5\'er, 10\'ar) KESİNLİKLE RAKAMLA YAZILAMAZ! Her zaman "ikişer, beşer, onar" şeklinde harfle yazılmak zorundadır!',
      osymTrap: 'TDK kısaltmasına ek getirirken "TDK\'nın" yazmak en büyük tuzaktır. Türkçede "ka" harfi yoktur, "ke" harfi vardır. Doğrusu "TDK\'ye"dir.'
    ),
    LectureSection(
      title: 'Yazım Kuralları Çözümlü Uygulamalar',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'turkce1.pdf Ünite Değerlendirme Testi (Sayfa 288-289) soruları ve detaylı çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde altı çizili sözün yazımı yanlıştır?',
          options: [
            'A) Türk Dil Kurumunun yeni binasını çok beğendim.',
            'B) Hafta sonu çocuklara ikişer elma dağıttı.',
            'C) Bu meseleyi ancak Avukat Kemal Bey çözebilir.',
            'D) Yarışmada dereceye girenlere 5\'er bin lira ödül verildi.',
            'E) İç Anadolu Bölgesi\'nde kuraklık etkisini gösteriyor.'
          ],
          correctIndex: 3,
          explanation: 'D seçeneğindeki "5\'er" yazımı yanlıştır. Türkçede üleştirme sayıları rakamla değil, yazıyla (beşer) yazılmak zorundadır.',
          ruleTag: 'Üleştirme Sayılarının Yazımı'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde bir yazım yanlışı vardır?',
          options: [
            'A) Bu romanı ben de ilk gençlik yıllarımda okumuştum.',
            'B) O kadar çalıştıki sınavı kazanmayı fazlasıyla hak etti.',
            'C) Halbuki onun bize ne kadar yardım ettiğini herkes bilirdi.',
            'D) Bilinçaltında yatan korkularını uzman bir psikologla paylaştı.',
            'E) Türkiye Büyük Millet Meclisine yeni kanun teklifleri sunuldu.'
          ],
          correctIndex: 1,
          explanation: 'B seçeneğinde "çalıştıki" bağlaç olan "ki"dir ve fiilden sonra geldiği için ayrı yazılmalıdır: "çalıştı ki". C\'deki "Halbuki" SOMBAHÇEMİ kuralına göre bitişik yazılır (doğrudur). D\'deki "Bilinçaltı" somut yer bildirmediği için bitişiktir (doğrudur). E\'deki TBMM kurum adı olduğundan ek kesmeyle ayrılmaz (doğrudur).',
          ruleTag: 'ki Bağlacının Yazımı'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu6 = konu6YazimKurallari;
