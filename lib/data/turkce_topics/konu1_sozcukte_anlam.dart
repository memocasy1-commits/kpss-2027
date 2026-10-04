// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu1SozcukteAnlam = LectureTopic(
  id: 'turkce_sozcukte_anlam',
  courseId: 'turkce',
  order: 1,
  title: 'Sözcükte Anlam ve Söz Öbekleri',
  subtitle: 'Temel, Yan, Mecaz, Terim Anlam, Anlam Olayları, İkilemeler, Deyimler, Atasözleri & Söz Sanatları',
  icon: Icons.auto_stories_rounded,
  color: const Color(0xFF0284C7),
  testRange: 'Test 1 - 10',
  startTestNum: 1,
  endTestNum: 10,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: '1. Sözcükte Anlam Özellikleri (Temel, Yan, Mecaz ve Terim Anlam)',
      type: LectureSectionType.overview,
      leadText: 'Harflerin bir araya gelmesiyle sözcükler, sözcüklerin bir araya gelmesiyle cümleler oluşur. Cümlenin anlamlı en küçük birimine sözcük (kelime) denir. Sözcük, dilin anlamlı en küçük parçasıdır ve bu parçaları anlamlarına uygun olarak bir araya getirerek iletişim sağlarız.',
      bulletPoints: [
        '1. Gerçek (Temel / Baş Anlam): Bir sözcüğün akla gelen ilk anlamıdır. Sözlükte bir numarayla gösterilen, herkesçe bilinen yaygın anlamdır.\n  • "Gözüme toz kaçınca gözüm çok acıdı." (Görme organı)\n  • "Çocuğun ateşi kırk dereceye çıktı." (Vücut sıcaklığı)\n  • "Ağır çuvalı tek başına kaldıramadı." (Kütlesi çok olan)\n  • "Annem dün bütün perdeleri yıkadı." (Pencere örtüsü)\n  • "Kuru odunları sobanın içine attı." (Nemli olmayan)\n  • "Yemekten sonra sıcak bir çay içtik." (Isısı yüksek)',
        '2. Yan Anlam: Bir sözcüğün temel (gerçek) anlamından tamamen kopmadan; şekilsel, konumsal ya da işlevsel bir benzerlik sonucunda kazandığı yeni anlamdır.\n  • "Masanın gözünde kitaplarım kaldı." -> Göz insan vücudunda çukurda kalan bir bölümdür. Masanın gözü de çukurda kalan çekmece bölümüdür; şekil benzerliğiyle yan anlam kazanmıştır.\n  • "Köprünün ayağında çatlaklar oluştu." -> İnsanın ayağı gövdeyi taşır; köprünün ayağı da yapıyı taşır; konumsal ve işlevsel benzerlikle yan anlamdır.\n  • "Uçağın kanadı havada arızalandı." -> Kuşun kanadından uçağın kanadına işlev benzerliğiyle aktarılmıştır.\n  • "Kapının kolu, nehrin kolu, çekmecenin gözü, dağın sırtı, geminin burnu, testinin ağzı".',
        '3. Mecaz Anlam: Bir sözcüğün gerçek ve yan anlamlarından tamamen uzaklaşarak kazandığı yeni ve soyut anlamdır. Genellikle benzetmeler ve duygu aktarımları yoluyla doğar.\n  • "Aşkından gözlerine perde indi." -> Perde artık pencere örtüsü değil; gerçeği görememe, basiretsizlik anlamında mecazlaşmıştır.\n  • "Arkadaşımın soğuk tavırları beni çok kırdı." -> Soğuk ısı düşüklüğü değil, ilgisizlik/sevgisizliktir; kırmak parçalamak değil, üzmek incitmektir.\n  • "Bu karanlık işlerden bir an önce uzak durmalısın." -> Karanlık ışıksızlık değil, yasa dışı/gizli işlerdir.\n  • "Müdürün ağır sözleri kalbini çok yaraladı." -> Ağır kütlece fazla değil, incitici/ağırına giden anlamındadır.\n  • "Sınavı kazanamayınca hayalleri suya düştü / söndü."',
        '4. Terim Anlam: Bilim, sanat, spor, meslek veya edebiyat gibi özel bir alana ait kavramları karşılayan sözcüklerdir. Günlük dilde kullanılmaz, mecaz anlam kazanmazlar.\n  • Edebiyat: aruz, kafiye, redif, beyit, dize, teşbih, bent, sone.\n  • Tiyatro: perde, dekor, suflör, kostüm, replik, monolog, diyalog.\n  • Müzik: nota, solfej, porte, akor, koma, diyez, bemol.\n  • Matematik & Geometri: üçgen, açı, kök, teğet, karekök, rasyonel sayı.\n  • Tıp & Biyoloji: narkoz, teşhis, stetoskop, neşter, alyuvar, enzim, DNA.\n  • Coğrafya: meridyen, paralel, vadi, izohips, plato, epirojenez, fay.'
      ],
      goldenRule: 'BAĞLAM KURALI: Bir sözcüğün terim, yan veya mecaz olup olmadığı kelimenin geçtiği cümlenin bağlamına göre değişir: "Annem perdeleri yıkadı" (Gerçek) vs "Gözlerine perde indi" (Mecaz) vs "Oyun iki perdelikti" (Tiyatro terimi).',
      osymTrap: 'ÖSYM TUZAĞI: Terim anlamlı sözcükler günlük dilde kullanıldığında terim özelliğini yitirir: "Hakem penaltı noktasını gösterdi." (Terim anlam) vs "Bu olay hayatımın dönüm noktası oldu." (Mecaz anlam, terim değildir).'
    ),
    LectureSection(
      title: '2. Sözcükler Arası Anlam İlişkileri (Eş, Zıt, Eş Sesli, Somut-Soyut Anlam)',
      type: LectureSectionType.ruleList,
      leadText: 'Sözcüklerin birbirleriyle kurdukları anlamsal ilişkiler ve anlam olayları:',
      bulletPoints: [
        '1. Eş Anlamlı (Anlamdaş) Sözcükler: Yazılış ve okunuşları farklı, anlamları tamamen aynı olan sözcüklerdir:\n  • al - kırmızı, ak - beyaz, kara - siyah, yaşlı - ihtiyar, muallim - öğretmen, talebe - öğrenci, hekim - doktor, lisan - dil, sözcük - kelime, tümce - cümle, yanıt - cevap, yöntem - metot, kılavuz - rehber, vatan - yurt, uygarlık - medeniyet, görev - vazife.\n  • DİKKAT: Cümlede eş anlamlı iki sözcüğün bir arada kullanılması GEREKSİZ SÖZCÜK KULLANIMI kaynaklı bir ANLATIM BOZUKLUĞUDUR: "Bari hiç olmazsa sen ara." ("bari" ile "hiç olmazsa" aynıdır).',
        '2. Zıt (Karşıt) Anlamlı Sözcükler: Anlamca birbirinin tam tersi olan kavramları karşılayan sözcüklerdir:\n  • iyi - kötü, zengin - fakir, acı - tatlı, taze - bayat, uzak - yakın, sıcak - soğuk, yüksek - alçak, inmek - çıkmak, gelmek - gitmek, dost - düşman.\n  • KESİN KURAL: Bir sözcüğün olumsuzu onun ZITTI DEĞİLDİR! "Gelmek" sözcüğünün zıttı "gitmek"tir; "gelmemek" ise yalnızca olumsuzudur. "Gülmek" sözcüğünün zıttı "ağlamak"tır; "gülmemek" zıttı değildir.',
        '3. Eş Sesli (Sesteş) Sözcükler: Yazılışları ve okunuşları tamamen aynı, fakat anlamları arasında hiçbir ilgi bulunmayan sözcüklerdir:\n  • gül: çiçek / gülmek eylemi\n  • yüz: çehre, surat / 100 sayısı / derisini yüzmek / suda yüzmek\n  • kır: beyaz saç / yeşillik alan / kırmak eylemi\n  • çay: akarsu / içecek\n  • yaş: ıslak / ömür birimi\n  • bin: 1000 sayısı / ata binmek eylemi\n  • DİKKAT: Üzerinde inceltme/düzeltme işareti (^) olan sözcükler SESTEŞ DEĞİLDİR: kar (yağış) - kâr (kazanç), adet (sayı) - âdet (gelenek), hala (akraba) - hâlâ (henüz).',
        '4. Somut ve Soyut Anlam:\n  • Somut Anlam: Beş duyu organımızdan (görme, işitme, tatma, koklama, dokunma) en az biriyle algılanabilen varlıklardır: rüzgâr, ses, ışık, deniz, koku, hava, acı biber, soğuk su, gürültü.\n  • Soyut Anlam: Duyu organlarıyla algılanamayıp akıl, zihin ve kalp yoluyla kavranan kavramlardır: sevgi, korku, akıl, rüya, melek, vicdan, mutluluk, hüzün, saygı, nefret.',
        '5. Somutlaştırma ve Soyutlaştırma:\n  • Somutlaştırma: Soyut bir kavramı zihinde daha belirgin kılmak için somut bir nesneye benzeterek anlatmaktır: "Felek ona sillesini vurdu." (Talihsizlik soyuttur, tokat/sille somutuna benzetilmiştir), "Aşk bir alevdir, dokunanı yakar." (Aşk soyutu alev somutuyla anlatılmıştır).\n  • Soyutlaştırma: Somut bir sözcüğün anlam genişlemesiyle soyut bir duruma bürünmesidir: "Bu işte onun parmağı var." (Parmak somuttur, burada yetki/etki/müdahale soyut anlamındadır).'
      ],
      goldenRule: 'SESTEŞLİKTE İNCELTME İŞARETİ KURALI: TDK kurallarına göre inceltme işareti (şapka ^) bulunan sözcük çiftleri (kar-kâr, adet-âdet, yar-yâr) sesteş KABUL EDİLMEZ; çünkü ses değerleri ve telaffuzları birbirinden farklıdır.',
      osymTrap: 'ÖSYM TUZAĞI: "Ses" ve "rüzgâr" soyut değil SOMUTTUR; çünkü ses işitme duyumuzla, rüzgâr ise dokunma (tenimizde hissetme) duyumuzla algılanabilir.'
    ),
    LectureSection(
      title: '3. Anlam Genişlemeleri: Genel-Özel, Nicel-Nitel, Yansıma ve Ad Aktarması',
      type: LectureSectionType.ruleList,
      leadText: 'Sözcüklerin kapsam ve nitelik bakımından gösterdiği anlam özellikleri:',
      bulletPoints: [
        'Genel ve Özel Anlamlı Sözcükler:\n  • Genel Anlam: Bir türün tamamını, bütününü içine alan sözcüklerdir.\n  • Özel Anlam: Bir türün sadece tek bir bireyini, sınırlı bir parçasını karşılayan sözcüklerdir.\n  • Genelden Özele Sıralama: Varlık -> Canlı -> Hayvan -> Kuş -> Serçe.\n  • Özelden Genele Sıralama: Çam -> Ağaç -> Bitki -> Canlı -> Varlık.\n  • Örnek: "Kitap, insanın en sadık dostudur." (Tüm kitaplar kastedildiği için GENEL anlamlıdır).\n  • Örnek: "Masadaki kitabı çantasına koydu." (Tek bir somut nesne kastedildiği için ÖZEL anlamlıdır).',
        'Nicel ve Nitel Anlamlı Sözcükler:\n  • Nicel Anlam: Varlıkların sayılabilen, ölçülebilen, tartılabilen miktarını, azlığını veya çokluğunu bildiren sözcüklerdir: "Ağır bir bavul" (tartılabilir), "Geniş bir salon" (metrekare ölçülebilir), "Yüksek bir bina" (metre ölçülebilir), "Uzun bir yol" (kilometre ölçülebilir).\n  • Nitel Anlam: Varlıkların sayılamayan, ölçülemeyen, kalitesini, özelliğini ve nasıl olduğunu bildiren sözcüklerdir: "Ağır bir sorumluluk" (ölçülemez), "Geniş bir yürek" (kalite), "Yüksek fikirler" (nitelik), "Tatlı bir tebessüm" (nitelik).',
        'Yansıma Sözcükler:\n  • Doğadaki canlı veya cansız varlıkların çıkardığı seslerin taklit edilmesiyle oluşan sözcüklerdir:\n  • İnsan kaynaklı sesler: hapşırık, hıçkırık, horultu, fısıltı, öksürük.\n  • Hayvan kaynaklı sesler: havlama, miyavlama, meleme, vızıltı, kişneme, ötüşmek.\n  • Cansız varlık sesleri: şırıltı, patırtı, gıcırtı, çıtırtı, gürültü, takırtı, çağıltı, gümbürtü, şapırtı.\n  • KESİN KURAL: Görme veya ışıkla ilgili sözcükler ses içermediği için YANSIMA DEĞİLDİR: "ışıl ışıl", "pırıl pırıl", "parıltı" ses olmadığı için yansıma sayılamaz!'
      ],
      goldenRule: 'YANSIMADA KULAK ŞARTI: Bir sözcüğün yansıma olması için mutlaka doğadaki fiziksel bir sesten türemiş olması şarttır. "Işıltı" göze hitap eder, yansıma değildir; "şırıltı" kulağa hitap eder, yansımadır.',
      osymTrap: 'ÖSYM TUZAĞI: "Kuşlar gökyüzünde neşeyle ötüşüyordu." cümlesindeki "ötüşmek" yansıma DEĞİLDİR; çünkü kuşların çıkardığı ses "öt" sesi değildir ("cik cik" sestir ama ötüşmek ses taklidi değildir).'
    ),
    LectureSection(
      title: '4. Kalıplaşmış Söz Öbekleri: İkilemeler, Deyimler ve Atasözleri',
      type: LectureSectionType.comparison,
      leadText: 'Türkçenin anlatım zenginliğini oluşturan kalıplaşmış söz öbeklerinin yapısal ve işlevsel analizi:',
      bulletPoints: const [],
      goldenRule: 'DEYİM vs ATASÖZÜ AYRIMI: Söz öbeği tam bir cümle olup ahlaki öğüt ve hayat dersi veriyorsa ATASÖZÜDÜR ("İşleyen demir pas tutmaz"). Eğer öğüt vermeyip sadece bir durumu, duyguyu betimliyor ve çoğunlukla mastarla bitiyorsa DEYİMDİR ("Göz boyamak", "Etekleri tutuşmak").',
      osymTrap: 'ÖSYM TUZAĞI: Deyimlerin kalıbını bozmak ANLATIM BOZUKLUĞUDUR: "Sevincinden etekleri tutuştu" (YANLIŞ -> etekleri zil çaldı olmalı; etekleri tutuşmak telaş ve korku bildirir).',
      comparisonRows: [
        ComparisonRow(
          correct: 'İkilemelerin Kuruluş Yolları ve Yazımı',
          wrong: '1) Aynı sözcüğün tekrarı: koşa koşa, ağır ağır, deste deste, yavaş yavaş.\\n2) Eş anlamlı sözcüklerle: akıllı uslu, ses seda, köşe bucak, kılık kıyafet, şan şöhret.\\n3) Yakın anlamlı sözcüklerle: eş dost, yalan yanlış, doğru dürüst, mal mülk, delik deşik.\\n4) Karşıt anlamlı sözcüklerle: az çok, iyi kötü, ileri geri, aşağı yukarı, er geç, bata çıka.\\n5) Biri anlamlı biri anlamsız: eski püskü, eğri büğrü, ufak tefek, yırtık pırtık, tek tük.\\n6) İkisi de anlamsız sözcüklerle: eciş bücüş, abur cubur, abuk sabuk, mırın kırın, çıtkırıldım.\\n7) Yansıma sözcüklerle: şıkır şıkır, çatır çutur, şapır şupur, gümbür gümbür, vızır vızır.',
          note: 'İkilemeler DAİMA AYRI yazılır ve aralarına KESİNLİKLE virgül konmaz! İstisna: "gitgide" bitişik yazılır.'
        ),
        ComparisonRow(
          correct: 'Deyimlerin Ayırt Edici Özellikleri',
          wrong: '• Çoğunlukla iki veya daha fazla sözcükten oluşur ve mastarla (-mak/-mek) biter: göze girmek, etekleri zil çalmak, burnu sürtülmek, çam devirmek, pabucu dama atılmak.\\n• Kalıplaşmış söz öbekleridir; sözcüklerin yeri değiştirilemez ve yerine eş anlamlıları konamaz ("Ayıkla pirincin taşını" yerine "ayıklamak bulgurun taşını" denemez).\\n• Çoğu mecaz anlamlıdır; ancak gerçek anlamını koruyan deyimler de vardır: "Çoğu gitti azı kaldı", "Kimi kimsesi olmamak", "Yükte hafif pahada ağır", "Adı çıkmak".\\n• Cümle biçiminde deyimler de vardır: "Atı alan Üsküdar\'ı geçti", "Dostlar alışverişte görsün".\\n• Genel kural ve ahlaki öğüt İÇERMEZLER; anlık bir durumu, tavrı, duyguyu betimlerler.',
          note: 'Deyimler genel ahlak dersi vermez, sadece anlık ruh halini ve durumu yansıtır.'
        ),
        ComparisonRow(
          correct: 'Atasözlerinin Ayırt Edici Özellikleri',
          wrong: '• Yargı bildiren tam bir cümle biçimindedir: "Damlaya damlaya göl olur.", "Ağaç yaşken eğilir.", "Gülme komşuna, gelir başına."\\n• Toplumun yüzlerce yıllık tecrübesine dayanan evrensel hayat dersleri, ahlaki öğütler ve genel doğrular bildirir.\\n• Sözcük dizilişi kesinlikle değiştirilemez (Kalıplaşmıştır).\\n• Hem gerçek anlamlı ("Dost ile ye, iç; alışveriş etme.", "Son pişmanlık fayda etmez.") hem de mecaz anlamlı ("Tatlı dil yılanı deliğinden çıkarır.", "Minareyi çalan kılıfını hazırlar.") olabilirler.',
          note: 'Atasözü evrensel hayat dersi verir ve tam bir cümledir; deyim ise öğüt vermez, anlık durumu bildirir.'
        )
      ]
    ),
    LectureSection(
      title: '5. Edebi Sanatlar (Söz Sanatları) Atlası',
      type: LectureSectionType.ruleList,
      leadText: 'Şiirde ve düzyazıda kullanılan sözcüklerin kendine özgü bir dili vardır. Bu dil, günlük dilden farklıdır. Şiirde bu farklılığı sağlayan en önemli unsur imgedir. Edebi sanatlar bu imgesel anlatımın omurgasıdır:',
      bulletPoints: [
        '1. Benzetme (Teşbih): Aralarında ilgi bulunan iki unsurdan güçsüz olanın güçlü olana benzetildiği söz sanatıdır. Dört unsuru vardır:\n  • Benzeyen (güçsüz unsur): asker\n  • Kendisine Benzetilen (güçlü unsur): aslan\n  • Benzetme Yönü (ortak nitelik): kuvvetli/cesur olmak\n  • Benzetme Edatı: gibi, kadar, sanki, misali\n  • Tam Benzetme Örneği: "Askerlerimiz aslan gibi cesurca savaştı."\n  • Teşbihibeliğ (Güzel Benzetme): Yalnızca benzeyen ve kendisine benzetilenle yapılan benzetmedir: "Gül tenli yarim", "Kömür gözlüm", "Çelik bilekli pehlivan".',
        '2. Kişileştirme (Teşhis): İnsana ait duygu, düşünce ve eylemlerin insan dışındaki varlıklara (hayvanlara, bitkilere, nesnelere, doğa olaylarına) aktarılmasıdır:\n  • "Rüzgâr hüzünlü hüzünlü fısıldıyordu sokaklarda."\n  • "Ağaçlar sonbaharda yaprak dökerek ağlaşıyordu."\n  • "Yorgun deniz sahili usulca dövüyordu."',
        '3. Konuşturma (İntak): İnsan dışındaki varlıkların bizzat insan gibi konuşturulması sanatıdır. Fabllar bu sanata dayanır:\n  • "Dal bir gün dedi ki tomurcuğuna: / Tenimde bir yara işler gibisin."\n  • "Küçük serçe ağlayarak sordu: / Bahar nerede kaldı?"\n  • ALTIN KURAL: Her intak sanatında MUTLAKA teşhis (kişileştirme) sanatı da vardır; fakat her teşhis sanatında intak olmak zorunda değildir!',
        '4. Tezat (Zıtlık / Karşıtlık): Birbirine karşıt duygu, düşünce, hayal ve kavramların bir arada kullanılması sanatıdır:\n  • "Ağlarım hatıra geldikçe gülüştüklerimiz." (Ağlamak - gülüşmek)\n  • "Neden böyle düşman görünürsünüz / Yıllar yılı dost bildiğim aynalar?" (Düşman - dost)\n  • "İçimde bir yangın var, dışım buz kesmiş." (Yangın - buz)',
        '5. Ad Aktarması (Mecazımürsel): Bir sözcüğün, BENZETME AMACI GÜDÜLMEKSİZİN, parça-bütün, iç-dış, yazar-eser, yer-insan gibi çeşitli anlam ilgileriyle başka bir sözcük yerine kullanılmasıdır:\n  • "Sobayı yakınca oda sıcacık oldu." (İç-dış: odun/kömür yerine soba söylenmiştir)\n  • "Tüm stadyum ayağa kalktı." (Yer-insan: seyirciler yerine stadyum söylenmiştir)\n  • "Bu akşam evde Dostoyevski okuyacağım." (Yazar-eser: kitap yerine yazarın adı)\n  • "Boğaz\'dan gemiler geçiyor." (Parça-bütün: Çanakkale veya İstanbul Boğazı)\n  • "Ankara bu karara sert tepki gösterdi." (Yer-yönetim: hükümet yerine başkent).',
        '6. Abartma (Mübalağa): Bir durumu, olayı veya özelliği olduğundan çok daha büyük ya da çok daha küçük göstererek anlatmaktır:\n  • "Bir of çeksem karşıki dağlar yıkılır."\n  • "Sana olan hasretimden bir deniz dolusu gözyaşı döktüm."\n  • "Çocuk açlıktan bir deri bir kemik kalmıştı."'
      ],
      goldenRule: 'İNTAK = TEŞHİS: Konuşan her varlık doğrudan kişileştirilmiş sayılır. Bu nedenle intak sanatının bulunduğu her dizede istisnasız teşhis sanatı da yer alır.',
      osymTrap: 'ÖSYM TUZAĞI: "Deniz kıyıya küsmüştü." cümlesinde kişileştirme (teşhis) vardır; ancak deniz fiilen konuşmadığı için İNTAK YOKTUR!'
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Sözcükte Anlam ve Söz Sanatları',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Ünite değerlendirme testlerinden çözümlü pekiştirme sorusu:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki dizelerin hangisinde hem "ad aktarması (mecazımürsel)" hem de "karşıtlık (tezat)" sanatı bir arada kullanılmıştır?',
          options: [
            'A) Akşamın matemine bürünen sokaklar sessizce uykuya daldı.',
            'B) Marmara dün gece yine hırçın dalgalarıyla sahili dövüyordu.',
            'C) Bütün bir salon kahkahalarla gülerken o köşede sessizce ağlıyordu.',
            'D) Gençliğimde ekmeğimi taştan çıkarır, hiç kimseye boyun eğmezdim.',
            'E) Kömür gözlü yarim gelmeyince gecelerim gündüz gibi zindan oldu.'
          ],
          correctIndex: 2,
          explanation: 'C seçeneğinde "bütün bir salon" ifadesiyle içindeki seyirciler/insanlar kastedilerek iç-dış ilgisiyle AD AKTARMASI (mecazımürsel) yapılmıştır. Aynı cümlede "gülerken" ve "ağlıyordu" eylemleriyle birbirine zıt duygusal durumlar belirtilerek TEZAT (karşıtlık) sanatı uygulanmıştır. Her iki sanat da mevcuttur.',
          ruleTag: 'Söz Sanatları Analizi'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu1 = konu1SozcukteAnlam;
