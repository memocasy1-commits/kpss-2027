// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu7Noktalama = LectureTopic(
  id: 'turkce_konu_7',
  courseId: 'turkce',
  order: 7,
  title: 'Noktalama İşaretleri',
  subtitle: 'Tüm Noktalama İşaretleri, Görevleri ve Virgülün Yasak Olduğu 6 Kritik Durum',
  icon: Icons.format_quote,
  color: const Color(0xFF0284C7),
  testRange: 'Test 61 - 70',
  startTestNum: 61,
  endTestNum: 70,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Nokta (.), Virgül (,) ve Virgülün Kullanıldığı Yerler',
      type: LectureSectionType.overview,
      leadText: 'Duygu ve düşünceleri daha açık ifade etmek, cümlenin yapısını ve duraklama noktalarını belirlemek için kullanılan noktalama işaretleri:',
      bulletPoints: [
        '▸ A. NOKTA (.):\n• 1. Anlamca tamamlanmış cümlenin sonuna konur: "Türk Dil Kurumu 1932 yılında kurulmuştur."\n• 2. Bazı kısaltmaların sonuna konur: Alb. (albay), Prof. (profesör), Cad. (cadde), Sok. (sokak), sf. (sayfa), vb. (ve benzeri).\n• 3. Sayılardan sonra sıra bildirmek için (-inci anlamında) konur: 3. (üçüncü), II. Mehmet, 15. yüzyıl.\n• 4. Arka arkaya sıralanan sayılarda sadece son sayının ardına konur: 3, 4 ve 7. maddeler.\n• 5. Tarihlerin yazılışında gün, ay ve yılı gösteren sayıları ayırmak için konur: 29.10.1923, 15.05.2024.\n• 6. Saat ve dakika gösteren sayıları ayırmak için TEK NOKTA konur: "Toplantı 14.30\'da başlayacak." (Dijital saatlerdeki iki nokta yazı dilinde YANLIŞTIR!).\n• 7. Dört ve daha çok basamaklı sayılarda üçlü basamak gruplarını ayırmak için konur: 1.000, 326.197, 49.200.000.\n• 8. Kitap, makale künyelerinin sonuna konur.',
        '▸ B. VİRGÜL (,):\n• 1. Birbiri ardınca sıralanan eş görevli kelime ve kelime gruplarının arasına konur: "Fırtınadan, soğuktan, karanlıktan korkuyordu."\n• 2. Sıralı cümleleri birbirinden ayırmak için konur: "Geldik, gördük, başardık.", "Boyaları hazırladı, fırçayı eline aldı, tuvale ilk çizgiyi vurdu."\n• 3. Uzun cümlelerde yüklemden uzak düşmüş olan özneyi belirtmek için konur: "Yaşlı adam, yıllardır adım atmadığı bu tenha sokakta anılarını arıyordu."\n• 4. Cümle içindeki ara sözlerin veya ara cümlelerin başına ve sonuna konur: "Bu kasabayı, çocukluğumun geçtiği yeri, asla unutamam."\n• 5. Tırnak içine alınmamış alıntı cümlelerinden sonra konur: "Yarın sabah erkenden yola çıkacağız, dedi."\n• 6. Anlam karışıklığını (anlam belirsizliğini) önlemek için konur: "Genç, doktora derdini anlattı." (Genç bir doktor mu, yoksa genç bir kişi mi?).\n• 7. Ret, kabul, teşvik bildiren "hayır, yok, evet, peki, pekâlâ, tamam, elbette, hayhay" gibi sözlerden sonra konur: "Peki, bu akşam senin dediğin yere gidelim."',
        '• 8. Hitap için kullanılan sözcüklerden sonra konur: "Sayın Başkan,", "Değerli Öğrenciler,".'
      ],
      goldenRule: 'Saat ve dakika arasına İKİ NOKTA DEĞİL, DAİMA TEK NOKTA KONUR! "14:30" YAZIMI YANLIŞTIR, DOĞRUSU "14.30"DUR!',
      osymTrap: 'Anlam karışıklığını önleme görevi ÖSYM tarafından çok sevilir: "Hırsız, çocuğu kovaladı" ile "Hırsız çocuğu kovaladı" arasındaki fark virgülle sağlanır.'
    ),
    LectureSection(
      title: 'Virgülün KESİNLİKLE KULLANILAMAYACAĞI 6 Kritik Durum',
      type: LectureSectionType.warning,
      leadText: 'ÖSYM ve EKPSS\'de noktalama sorularında en çok soru getiren ve hatalı konulan yerler:',
      bulletPoints: [
        '▸ 1. Metin İçinde Zarf-Fiil Eklerinden Sonra Virgül Konmaz!:\n• "-ıp, -erek, -ken, -alı, -ınca, -dıkça, -madan, -maksızın" eklerini alan tek bir kelimeden sonra ASLA virgül konamaz:\n  • Yanlış: "Sınavı kazanıp, memleketine döndü."\n  • Doğru: "Sınavı kazanıp memleketine döndü."\n  • TEK İSTİSNA: Metinde art arda sıralanmış birden fazla zarf-fiil varsa bunlar eş görevli sayıldığından aralarına virgül konur: "Arkadaşlarıyla gülüşerek, şakalaşarak sınıfa girdi."',
        '▸ 2. Şart Ekinden (-se / -sa) Sonra Virgül Konmaz!:\n• Cümlede şart bildiren "-se / -sa" ekinden sonra asla virgül kullanılmaz:\n  • Yanlış: "Görüşmeler erken biterse, seni ararım."\n  • Doğru: "Görüşmeler erken biterse seni ararım."',
        '▸ 3. "ve, veya, yahut, ya... ya, hem... hem, ne... ne" Bağlaçlarından Önce ve Sonra Virgül Konmaz!:\n• Tekli veya tekrarlı bağlaçların önünde de ardında da virgül bulunamaz:\n  • Yanlış: "Hem çalışıyor, hem okuyor."\n  • Doğru: "Hem çalışıyor hem okuyor."\n  • Yanlış: "Ahmet, ve Mehmet geldiler."\n  • Doğru: "Ahmet ve Mehmet geldiler."',
        '▸ 4. Pekiştirme ve Bağlama Görevi Yapan "de / da" Bağlacından Sonra Virgül Konmaz!:\n• Yanlış: "Bu konuyu o da, çok iyi biliyor."\n• Doğru: "Bu konuyu o da çok iyi biliyor."',
        '▸ 5. "-ınca / -ince" Anlamında Zarf-Fiil Göreviyle Kullanılan "mı / mi"den Sonra Virgül Konmaz!:\n• Yanlış: "Hava karardı mı, sokaklarda kimse kalmazdı."\n• Doğru: "Hava karardı mı sokaklarda kimse kalmazdı."',
        '▸ 6. İkilemelerin Araya Virgül Konmaz!:\n• Yanlış: "Ağır, ağır çıkacaksın bu merdivenlerden."\n• Doğru: "Ağır ağır çıkacaksın bu merdivenlerden."'
      ],
      goldenRule: 'Şart eki (-se/-sa), tek zarf-fiil eki (-ıp, -erek, -ken, -ince), tekrarlı bağlaçlar (hem... hem, ne... ne), "de" bağlacı ve ikilemelerin yanına VİRGÜL ASLA YAKLAŞAMAZ!',
      osymTrap: 'Eğer cümlede TEK bir zarf-fiil varsa virgül KESİNLİKLE konmaz! Ancak İKİ ya da DAHA FAZLA zarf-fiil art arda sıralanmışsa ("koşarak, nefes nefese kalarak...") araya virgül KONUR!'
    ),
    LectureSection(
      title: 'Noktalı Virgül (;), İki Nokta (:) ve Üç Nokta (...) Ayrımı',
      type: LectureSectionType.comparison,
      leadText: 'Öğrencilerin en çok karıştırdığı 3 noktalama işaretinin kesin ayrımı:',
      bulletPoints: [
        '▸ A. NOKTALI VİRGÜL (;):\n• 1. Kural: Cümle içinde virgüllerle ayrılmış tür veya takımları birbirinden ayırmak için konur:\n  • "Erkek çocuklara Doğan, Tuğrul, Orhan; kız çocuklara ise İnci, Çiçek, Gönül adları verilir."\n  • "Pazardan elma, armut, muz; patates, soğan, domates aldık."\n• 2. Kural: Ögeleri arasında virgül bulunan sıralı cümleleri birbirinden ayırmak için konur:\n  • "Sevinçten, heyecandan içim içime sığmıyor; bağırmak, kahkahalar atmak istiyorum."\n  • "At ölür, meydan kalır; yiğit ölür, şan kalır."\n• 3. Kural: İkiden fazla eş değer ögesi arasında virgül bulunan cümlelerde özneden sonra konur:\n  • "Yeni şiirimiz; zevksiz, köksüz, acemice görünüyordu."',
        '▸ B. İKİ NOKTA (:):\n• 1. Kural: Kendisiyle ilgili ÖRNEK verilecek cümlenin sonuna konur:\n  • "Milli Edebiyat akımının temsilcilerinden bazılarını sayalım: Ömer Seyfettin, Ziya Gökalp, Ali Canip Yöntem."\n• 2. Kural: Kendisiyle ilgili AÇIKLAMA yapılacak cümlenin sonuna konur:\n  • "Kendimi takdim edeyim: Meclis kâtiplerindenim."\n• 3. Kural: Edebi eserlerde konuşma bölümünden önce konuşan kişinin adından sonra konur:\n  • "Bilge Kağan: Türklerim, işitin!"\n• BÜYÜK/KÜÇÜK HARF KURALI: İki noktadan sonra gelen kısım TAM BİR CÜMLE ise büyük harfle başlar; sadece ÖRNEKLER sıralanıyorsa küçük harfle başlar!',
        '▸ C. ÜÇ NOKTA (...):\n• 1. Anlatım olarak tamamlanmamış (yüklemi olmayan) eksiltili cümlelerin sonuna konur: "Karşımızda yemyeşil bir vadi..."\n• 2. Kaba sayıldığı veya gizlenmek istendiği için yazılmayan sözlerin yerine konur: "Kılavuzu karga olanın burnu b...tan çıkmaz.", "Arabacı B...\'ya doğru sürdü."\n• 3. Alıntılarda başta, ortada veya sonda atlanan kısımların yerine konur: "... derken birden kapı açıldı ..."\n• 4. Ünlem ve seslenmelerde anlatımı pekiştirmek için konur: "Koca Ali... Koca Ali, be!" (Ünlemle üç nokta birleştiğinde iki nokta konur: "!.." şeklinde yazılır).'
      ],
      goldenRule: 'Noktalı virgül (;) olan bir cümlede MUTLAKA önceden kullanılmış en az bir virgül (,) bulunmak zorundadır! İçinde hiç virgül olmayan basit bir cümleye durup dururken noktalı virgül KONAMAZ!',
      comparisonRows: [
        ComparisonRow(
          correct: 'Kendimi takdim edeyim: Meclis kâtiplerindenim. (Tam cümle -> büyük harf)',
          wrong: 'Kendimi takdim edeyim; Meclis kâtiplerindenim.',
          note: 'Açıklama yapılacağı için iki nokta konur.'
        ),
        ComparisonRow(
          correct: 'Bahçede birçok çiçek vardı: gül, lale, karanfil... (Örnekler -> küçük harf)',
          wrong: 'Bahçede birçok çiçek vardı; gül, lale, karanfil...',
          note: 'Örnek sıralanırken iki nokta konur; benzerleri sürdüğü için üç nokta ile biter.'
        ),
        ComparisonRow(
          correct: 'At ölür, meydan kalır; yiğit ölür, şan kalır.',
          wrong: 'At ölür, meydan kalır: yiğit ölür, şan kalır.',
          note: 'Virgüllü sıralı cümleleri bağlamak için noktalı virgül kullanılır.'
        )
      ]
    ),
    LectureSection(
      title: 'Soru (?), Ünlem (!), Kısa Çizgi (-), Tırnak ("") ve Kesme (\') İşaretleri',
      type: LectureSectionType.ruleList,
      leadText: 'Metin düzeni ve anlam vurgusunu sağlayan diğer temel noktalama işaretleri:',
      bulletPoints: [
        '▸ 1. Soru İşareti (?):\n• Soru eki veya soru sözü içeren cümlelerin sonuna konur: "Sular mı yandı?", "Ne zaman tükenecek bu yollar?"\n• ⚠️ DİKKAT: Soru ifadesi taşıyan sıralı cümlelerde soru işareti EN SONA konur, aralara virgül atılır: "Yarın sinemaya mı gidelim, tiyatroya mı?"\n• Kesin olmayan, şüpheli tarih ve bilgilerin yanına yay ayraç içinde (?) konur: "Yunus Emre (1240?-1320)", "Ankara\'dan Konya\'ya iki saatte (?) gitmiş."',
        '▸ 2. Ünlem İşareti (!):\n• Sevinç, korku, acı, şaşma bildiren cümlelerin veya hitapların sonuna konur: "Hava ne kadar da soğuk!", "Ordular! İlk hedefiniz Akdeniz\'dir, ileri!"\n• Alay, kinaye veya küçümseme anlamı katmak için yay ayraç içinde (!) kullanılır: "İsteseymiş bir günde bitirirmiş (!) ama ne yazık ki vakti yokmuş (!)."',
        '▸ 3. Kısa Çizgi (-):\n• Satıra sığmayan kelimeler hecelere bölünürken satır sonuna konur.\n• Cümledeki ara sözlerin ve ara cümlelerin başına ve sonuna konur (virgül yerine de kullanılabilir).\n• Sözcükler arasında "-den... -e", "ile", "ve", "arasında" anlamı vermek için kullanılır: "Ankara-İstanbul hızlı treni", "Fenerbahçe-Galatasaray derbisi", "Türk-Alman ilişkileri", "09.00-17.00 saatleri".',
        '▸ 4. Tırnak İşareti (" "):\n• Başka bir kimseden veya yazıdan olduğu gibi aktarılan sözler tırnak içine alınır.\n• Tırnak içindeki alıntının sonundaki noktalama işareti (nokta, soru, ünlem) tırnağın İÇİNDE kalır: "Atatürk: \'Ne mutlu Türk\'üm diyene!\' demiştir."\n• Özel olarak vurgulanmak istenen sözcükler ve eser adları tırnak içine alınır.',
        '5. Kesme İşareti (\'):\n• Özel adlara getirilen iyelik, durum ve bildirme eklerini ayırmak için konur: "Kurtuluş Savaşı\'nı", "Ahmet\'e", "Türkiye\'miz".\n• Kısaltmalara ve sayılara gelen ekleri ayırmak için konur: "TBMM\'nin", "1923\'te", "8\'inci".\n• KESME İŞARETİNİN KULLANILMADIĞI YERLER:\n  • Kurum, kuruluş ve kurul adlarına gelen ekler kesmeyle AYRILMAZ ("Türk Dil Kurumuna", "Milli Eğitim Bakanlığında").\n  • Özel adlara getirilen yapım ekleri, çokluk eki (-ler) ve bunlardan sonra gelen çekim ekleri kesmeyle AYRILMAZ: "Türkleşmek", "Türkçenin", "Ahmetler", "Ankaralıdan", "Avrupalılaşmak".'
      ],
      goldenRule: 'Özel ada yapım eki (-lı, -ce, -gil, -siz) veya çoğul eki (-ler) geldiyse kesme işareti DÜŞER ve bundan sonra gelen hiçbir çekim eki de kesmeyle ayrılamaz! "Türkçe\'nin" YANLIŞ, "Türkçenin" DOĞRUDUR! "Ahmet\'ler" YANLIŞ, "Ahmetler" DOĞRUDUR!',
      osymTrap: 'Sıralı soru cümlelerinde her cümlenin sonuna soru işareti konmaz: "Nereden geliyorsun, nereye gidiyorsun?" şeklinde araya virgül, en sona soru işareti konur.'
    ),
    LectureSection(
      title: 'Noktalama İşaretleri Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Karma noktalama değerlendirme soruları ve çözümleri:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde noktalama hatası yapılmıştır?',
          options: [
            'A) Erken saatte kalkıp, temiz hava almak için yürüyüşe çıktı.',
            'B) Bahçede güller, laleler, sümbüller; ağaçlarda erikler, kirazlar vardı.',
            'C) Şairin yeni kitabı; akıcı, yalın ve etkileyici bir dille kaleme alınmış.',
            'D) Türk Dil Kurumuna dilekçe vererek son durumu sordu.',
            'E) 19 Mayıs 1919\'da Samsun\'a çıkan Mustafa Kemal bağımsızlık ateşini yaktı.'
          ],
          correctIndex: 0,
          explanation: 'A seçeneğinde "-ıp" zarf-fiil ekini almış "kalkıp" sözcüğünden sonra tek olduğu için VİRGÜL KONAMAZ. Metinde art arda sıralanmış başka zarf-fiil bulunmadığı için virgül kullanımı doğrudan bir noktalama hatasıdır.',
          ruleTag: 'Virgülün Kullanılmayacağı Yerler'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdaki cümlelerin hangisinde kesme işaretinin kullanımı yanlıştır?',
          options: [
            'A) Bakanlar Kurulunun dünkü toplantısı beş saat sürdü.',
            'B) Türkiye Büyük Millet Meclisi\'ne sunulan yasa tasarısı kabul edildi.',
            'C) Ankara Kalesi\'nden başkentin manzarasını seyrettiler.',
            'D) Türkçenin zengin söz varlığı araştırmacılar tarafından inceleniyor.',
            'E) Prof. Dr. Mehmet Kaplan\'ın eserleri üniversitelerde okutuluyor.'
          ],
          correctIndex: 1,
          explanation: 'B seçeneğinde TBMM bir kurum ve kurul adıdır. Kurum, kuruluş ve kurul adlarına gelen çekim ekleri kesme işaretiyle AYRILMAZ. Doğrusu "Türkiye Büyük Millet Meclisine" olmalıdır. D seçeneğinde ise yapım eki almış özel ada gelen çekim eki ayrılmaz (Türkçenin - doğrudur).',
          ruleTag: 'Kesme İşareti Yasakları'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu7 = konu7Noktalama;
