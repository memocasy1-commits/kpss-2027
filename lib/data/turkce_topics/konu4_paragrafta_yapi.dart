// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu4ParagraftaYapi = LectureTopic(
  id: 'turkce_konu_4',
  courseId: 'turkce',
  order: 4,
  title: 'Paragrafta Yapı ve Anlatım Biçimleri',
  subtitle: 'Paragrafın Yapısı, Anlatım Biçimleri, Düşünceyi Geliştirme Yolları ve Anlatım İlkeleri',
  icon: Icons.view_quilt,
  color: const Color(0xFF0284C7),
  testRange: 'Test 31 - 40',
  startTestNum: 31,
  endTestNum: 40,
  estimatedMinutes: 45,
  sections: [
    LectureSection(
      title: 'Paragrafın Yapısı ve Bölümleri',
      type: LectureSectionType.overview,
      leadText: 'Bir paragraf bağımsız cümleler yığını değildir; giriş, gelişme ve sonuç bölümlerinden oluşan, düşünce birliği ve mantıksal zincir taşıyan bir bütündür.',
      bulletPoints: [
        '▸ 1. Giriş Bölümü (Cümlesi): Paragrafın ilk cümlesidir. Konuyu ortaya koyar ve okuyucuda merak uyandırır.\n• Özellikleri: Kendinden önce bir cümle varmış hissi uyandırmaz.\n• Giriş cümlesinde bulunamayacak sözler: "bu nedenle, bundan dolayı, ama, fakat, lakin, çünkü, oysa, ne var ki, kısacası, demek ki, yine de, bu yüzden, halbuki" gibi bağlayıcı ögelerle ve "bu durum, o olay, böylece" gibi gönderme zamir/sıfatlarıyla BAŞLAYAMAZ.\n• Giriş cümlesi bağımsız, genel ve kapsayıcı bir yargı bildirir.',
        '▸ 2. Gelişme Bölümü: Giriş cümlesinde ortaya atılan konunun açıklandığı, örneklendirildiği, kanıtlandığı bölümdür.\n• Düşünceyi geliştirme yolları (örnekleme, tanık gösterme, karşılaştırma, sayısal veriler) ağırlıklı olarak bu bölümde yer alır.\n• Cümleler birbirine dil ve düşünce bağlaçlarıyla sımsıkı bağlanmıştır.',
        '▸ 3. Sonuç Bölümü: Paragrafta anlatılanların bir sonuca bağlandığı, ana fikrin en açık şekilde vurgulandığı bölümdür.\n• Çoğunlukla özetleyici ve toparlayıcı bağlaçlarla başlar: "kısacası, özetle, sonuç olarak, demek ki, bundan ötürü, görülüyor ki, öyleyse".\n• Yazarın vermek istediği asıl mesaj (ana düşünce) sıklıkla bu cümlede kristalleşir.'
      ],
      goldenRule: 'Giriş cümlesi "bağlantı ögesi" barındıramaz! Bir paragrafı ikiye bölerken veya ilk cümleyi ararken "çünkü, bu yüzden, oysa, halbuki, bu sebeple" içeren seçenekleri doğrudan eleyiniz.',
      osymTrap: 'Gelişme cümleleri zincirleme mantıkla birbirine ulanır; önceki cümlenin son kavramı, sonraki cümlenin başında tekrarlanarak veya göndermelerle ("bu durum", "söz konusu eser") devam ettirilir.'
    ),
    LectureSection(
      title: 'Paragraf Yapı Soru Tipleri ve Çözüm Taktikleri',
      type: LectureSectionType.ruleList,
      leadText: 'ÖSYM\'nin sınavlarında paragraf yapısına dair sorduğu vazgeçilmez soru kalıpları ve formülleri:',
      bulletPoints: [
        '▸ 1. Paragrafı İkiye Bölme:\n• Bir paragrafta iki farklı konudan veya aynı konunun farklı bir yönünden (boyutundan) bahsediliyorsa paragraf bölünmelidir.\n• Taktik: Cümleleri okurken yazarın konuyu değiştirdiği ya da konuya yeni bir açıdan yaklaşmaya başladığı ilk cümleyi bulunuz. İkinci paragrafın ilk cümlesi mutlaka bağımsız bir "giriş cümlesi" niteliğinde olmalı, kendinden önceye gönderme yapmamalıdır.',
        '▸ 2. Düşüncenin Akışını Bozan Cümle:\n• Paragrafın genel konusu ve ana fikri dışına çıkan, konunun farklı bir ayrıntısına kayan veya mantıksal zinciri kıran cümledir.\n• Taktik: Her cümlenin anahtar kelimelerini belirleyin. Örneğin paragraf yazarın "üslubunu" anlatırken araya giren tek bir cümle "yazarın çocukluk anılarını" anlatıyorsa o cümle akışı bozar. Şüpheli cümleyi metinden çıkardığınızda önceki cümle ile sonraki cümle pürüzsüzce birbirine bağlanmalıdır.',
        '▸ 3. Cümlelerin Yerini Değiştirme (Anlamlı Bütün Oluşturma):\n• Numaralandırılmış iki cümlenin yeri değiştirilerek metin mantık sırasına kavuşturulur.\n• Taktik: Zamir ve gönderme ifadelerine dikkat edin. Eğer III. cümlede "Bu keşif sayesinde..." deniyorsa ama keşfin ne olduğu IV. cümlede açıklanıyorsa, III ile IV yer değiştirmelidir.',
        '▸ 4. Paragrafa Cümle Yerleştirme (Araya / Başa / Sona):\n• Soru kökündeki cümleyi metne dahil ederken cümlenin başındaki bağlaçlara ("ancak, çünkü, bu sebeple") ve cümlenin içindeki anahtar sözcüklere bakılır; öncesindeki cümlenin sonucuna veya sonrasındaki cümlenin gerekçesine tam oturmalıdır.'
      ],
      goldenRule: 'Akışı bozan cümleyi bulduğunuzda o cümleyi parmağınızla kapatıp metni bir önceki cümleden bir sonraki cümleye atlayarak okuyun. Eğer geçiş akıcı ve mantıklıysa doğru cümleyi buldunuz demektir.',
      osymTrap: 'Akışı bozan cümle çoğu zaman paragrafın genel konusuyla tamamen alakasız değildir; konunun çok ince ve gereksiz bir ayrıntısına kaymıştır. "Konu aynı ama yönü farklı" tuzağına düşmeyiniz.'
    ),
    LectureSection(
      title: 'Dört Temel Anlatım Biçimi (Tekniği)',
      type: LectureSectionType.comparison,
      leadText: 'Yazarın metni oluştururken amacına uygun olarak seçtiği 4 temel anlatım biçimi (turkce1.pdf Sayfa 67-68):',
      bulletPoints: [
        '▸ 1. Açıklayıcı Anlatım (Açıklama):\n• Amaç: Okuyucuya bilgi vermek, bir konuyu öğretmek veya aydınlatmaktır.\n• Özellikleri: Sade, anlaşılır, nesnel bir dil kullanılır. Yazar kişisel duygularını katmaz. Ansiklopedik, bilimsel ve ders kitaplarındaki metinler açıklayıcı anlatımdır.\n• *Örnek:* "Burdur Gölü, pek çok su kuşuna ev sahipliği yapmaktadır. Dikkuyruk, kaşıkgaga ve yeşilbaş bu türlerden bazılarıdır."',
        '▸ 2. Tartışmacı Anlatım (Tartışma):\n• Amaç: Yazarın kendi doğrularına okuyucuyu inandırmak, yerleşik veya yanlış bulduğu bir düşünceyi çürütmektir.\n• Özellikleri: Yazar karşısında birisi varmış gibi soru-cevaplı, sohbet havasında konuşur. "Bence, bana göre, oysa, hiç de öyle değil, yanılıyorlar" gibi ifadelere sıkça yer verir. Kendi tezini savunup antitezi çürütür.\n• *Örnek:* "Kimi eleştirmenler romanın bittiğini söylüyor. Onlara asla katılmıyorum! Roman insan ruhunu yansıttığı sürece bitmeyecektir."',
        '▸ 3. Öyküleyici Anlatım (Öyküleme - Hikâye Etme):\n• Amaç: Olayları okuyucunun gözünde bir film şeridi gibi canlandırmak ve yaşatmaktır.\n• Özellikleri: 4 temel ögesi vardır: Olay, Kişi, Zaman, Mekân. Mutlaka bir "hareket / devinim" söz konusudur. Fiiller art arda sıralanır.\n• *Örnek:* "Kapıyı hızla açtı, içeri girdi. Masadaki mektubu aceleyle çantasına koyup arkasına bakmadan koşarak uzaklaştı."',
        '▸ 4. Betimleyici Anlatım (Betimleme - Tasvir Etme):\n• Amaç: Varlıkları, nesneleri, kişileri veya mekânları okuyucunun zihninde "resim çizer gibi" canlandırmaktır.\n• Özellikleri: Niteleme sıfatları yoğun kullanılır. Durgunluk hâkimdir (zaman durmuş gibidir). Görme, işitme, koklama gibi duyulardan yararlanılır.\n• *Örnek:* "Ufukta kızıla çalan mor bulutlar yükseliyordu. Eski konağın paslı demir kapısı, sarmaşıklarla kaplı taş duvarlara yaslanmıştı."'
      ],
      goldenRule: 'Öykülemede "video kamera" gibi hareket ve olay akışı vardır; betimlemede ise "fotoğraf karesi" gibi durağanlık ve detay tasviri vardır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Öyküleme: Olay, kişi, zaman, mekân vardır. Eylemler kronolojik hareket halindedir ("geldi, oturdu, baktı").',
          wrong: 'Betimleme: Hareket yoktur. Niteleme sıfatlarıyla fiziksel ve ruhsal özellikler resmedilir.',
          note: 'Film şeridi (Öyküleme) vs Fotoğraf karesi (Betimleme)'
        ),
        ComparisonRow(
          correct: 'Açıklama: Bilgi vermek, öğretmek esastır; nesnel, tarafsız ve yalın bir üslup kullanılır.',
          wrong: 'Tartışma: Bir fikri çürütüp kendi fikrini kabul ettirmek esastır; öznel, eleştirel ve diyalogvari dil kullanılır.',
          note: 'Bilgi verme (Açıklama) vs Fikir çatışması (Tartışma)'
        )
      ]
    ),
    LectureSection(
      title: 'Düşünceyi Geliştirme Yolları',
      type: LectureSectionType.formula,
      leadText: 'Yazarın savunduğu düşünceyi somutlaştırmak, inandırıcı kılmak ve zenginleştirmek için başvurduğu 6 temel yöntem (turkce1.pdf Sayfa 69-70):',
      bulletPoints: [
        '▸ 1. Tanımlama:\n• Bir kavramın ya da varlığın ne olduğunu eksiksiz açıklamaktır.\n• "Bu nedir?" veya "Bu kimdir?" sorusuna cevap verir. Genellikle "...-dır / ...-dir" veya "... denir" şeklinde biter.\n• *Örnek:* "Deneme, yazarın herhangi bir konudaki kişisel görüşlerini kesin kurallara bağlamadan anlattığı yazı türüdür."',
        '▸ 2. Örnekleme:\n• Soyut bir düşünceyi anlaşılır ve somut kılmak için konuyla ilgili bilinen kişi, eser, olay veya varlıkların metinde sıralanmasıdır.\n• *Örnek:* "Milli Edebiyat Dönemi\'nde sade dille muazzam eserler verilmiştir. Ömer Seyfettin\'in hikâyeleri, Yakup Kadri\'nin romanları buna en güzel örnektir."',
        '▸ 3. Tanık Gösterme (Alıntı Yapma):\n• Yazarın, düşüncesini inandırıcı kılmak amacıyla o alanda otorite/uzman kabul edilen tanınmış bir kişinin SÖZÜNÜ tırnak içinde ya da dolaylı aktarımla metne almasıdır.\n• *DİKKAT:* Yalnızca kişinin adını vermek "Örnekleme"dir; o kişinin konuyla ilgili sözünü aktarmak ise "Tanık Gösterme"dir!\n• *Örnek:* "Sanatçı toplumun vicdanıdır. Nitekim Yaşar Kemal de: \'İnsanoğlu umutsuzluktan umut yaratandır; sanatçı da bunun bayraktarıdır.\' der."',
        '▸ 4. Karşılaştırma:\n• En az iki varlık, kavram veya durum arasındaki benzerlik ya da farklılıkların ortaya konulmasıdır.\n• Sıklıkla "daha, en, göre, kadar, ise, oysa, buna karşılık" sözcükleriyle kurulur.\n• *Örnek:* "Şiir duyguya dayanır, oysa roman olay ve gözlem zemininde yükselir."',
        '▸ 5. Sayısal Verilerden Yararlanma:\n• Düşünceyi kanıtlamak için anket, istatistik, yüzdelik oranlar veya araştırma sonuçları gibi rakamsal verilerden yararlanmaktır.\n• *Örnek:* "Dünyada her yıl 200 milyar ton plastik üretilmekte ve bunun %10\'u okyanuslara karışarak çöp adaları oluşturmaktadır."',
        '▸ 6. Benzetme:\n• Aralarında ilgi bulunan iki şeyden zayıf olanın güçlü olana benzetilerek anlatılmasıdır.\n• *Örnek:* "Gençlik, uçsuz bucaksız bir deniz gibidir; nasıl yüzeceğini bilmeyen dalgalarla boğuşur."'
      ],
      goldenRule: 'Tanık Gösterme ile Örnekleme Arasındaki Kritik Ayrım: Sadece kişinin adını anmak (Atatürk, Yunus Emre, Tolstoy) ÖRNEKLEME\'dir; o kişinin doğrudan FİKRİNİ / SÖZÜNÜ aktarmak TANIK GÖSTERME\'dir.',
      osymTrap: 'Metinde rakamların bulunması her zaman sayısal verilerden yararlanma değildir! Tarih bildiren sayılar ("1923 yılında", "15. yüzyılda") genellikle zaman belirtir; sayısal veri olması için araştırma, istatistik veya ölçüm sonucu olması gerekir.'
    ),
    LectureSection(
      title: 'Anlatıcı Türleri ve Bakış Açıları',
      type: LectureSectionType.ruleList,
      leadText: 'Metinlerde olayları anlatan anlatıcının konumu ve olaylara vakıf olma derecesi (turkce1.pdf Sayfa 71):',
      bulletPoints: [
        '▸ 1. Birinci Kişi Ağzıyla Anlatım (Ben / Biz):\n• Yazar olayın bizzat içindedir, olayları yaşayan ya da şahit olan kişidir.\n• Yüklemler 1. tekil (-m, -dim) veya 1. çoğul (-k, -dik) şahıs ekleriyle çekimlenir.\n• *Örnek:* "Sabah erkenden kalktım, bavulumu toplayıp gardan ilk trene bindim."',
        '▸ 2. Üçüncü Kişi Ağzıyla Anlatım (O / Onlar):\n• Yazar olayların dışındadır; bir gözlemci veya dış tanık olarak gördüklerini ya da duyduklarını anlatır.\n• Yüklemler 3. tekil (-di, -miş, -r) veya 3. çoğul (-ler) şahıs ekleriyle çekimlenir.\n• *Örnek:* "Pencereden dışarı baktı, yağmurun dinmesini bekleyerek kahvesini yudumladı."',
        '▸ 3. Anlatıcının Bakış Açıları:\n• A. Hâkim (İlahi / Tanrısal) Bakış Açısı: Anlatıcı her şeyi bilir, görür ve duyar. Kahramanların iç dünyalarını, akıllarından geçen gizli düşünceleri, geçmişlerini ve geleceklerini eksiksiz bilir.\n• B. Kahraman Bakış Açısı: Anlatıcı eserin kahramanlarından biridir. Olayları ancak kendi gördüğü, duyduğu ve yaşadığı kadarıyla aktarabilir. 1. kişi anlatım kullanılır.\n• C. Gözlemci (Kamera) Bakış Açısı: Anlatıcı olayları tarafsız bir tanık gibi dışarıdan izler ve tıpkı bir kamera gibi sadece görüneni aktarır; kahramanların iç dünyalarını veya gizli niyetlerini bilemez.'
      ],
      goldenRule: 'Eğer anlatıcı karakterin "aklından geçenleri", "gizli duygularını" ya da "rüyasını" anlatıyorsa bu kesinlikle İLAHİ (HÂKİM) bakış açısıdır. Sadece dışarıdan görünen davranışları aktarıyorsa GÖZLEMCİ bakış açısıdır.'
    ),
    LectureSection(
      title: 'Anlatımın Nitelikleri (İlkeleri)',
      type: LectureSectionType.ruleList,
      leadText: 'Başarılı bir edebî metnin taşıması gereken ve sorularda sıkça yoklanan nitelikler (turkce1.pdf Sayfa 75-77):',
      bulletPoints: [
        '▸ 1. Özgünlük: Anlatımda başkasına benzememek, taklitçilikten uzak durmak, kendine has (orijinal) bir üslup yakalamaktır.',
        '▸ 2. Özlülük (Yoğunluk): Az sözle çok ve derin anlam ifade etmektir. Atasözleri, özdeyişler ve vecizeler özlü anlatımın zirvesidir ("Adalet evrenin ruhudur.").',
        '▸ 3. Duruluk: Cümlede gereksiz hiçbir sözcüğün bulunmamasıdır. Anlamca birbirini karşılayan veya aynı anlama gelen sözcüklerin birlikte kullanılması duruluğu bozar.',
        '▸ 4. Açıklık: Cümlenin tek ve net bir anlam taşıması, yoruma göre değişmemesi, kapalılık ve belirsizlik barındırmamasıdır. Noktalama eksikliği veya zamir belirsizliği açıklığı zedeler.',
        '▸ 5. Akıcılık: Metnin hiçbir engele takılmadan, kolayca ve pürüzsüzce okunabilmesidir. Söylenmesi zor, pürüzlü sesler ve telaffuzu güç yabancı kelimeler bulunmaz.',
        '▸ 6. Sürükleyicilik: Okuyucunun ilgisini ve merak duygusunu sürekli canlı tutarak eserin elden bırakılamamasını sağlamaktır.',
        '▸ 7. Doğallık (İçtenlik / Samimiyet): Anlatımın yapmacıklıktan, süsten ve zorlamadan uzak; içten, samimi ve candan olmasıdır.',
        '▸ 8. İnandırıcılık: İleri sürülen düşüncelerin mantık ve gerçeklik zeminine oturması, okuyucuda güven uyandırmasıdır.',
        '▸ 9. Tutarlılık: Metin boyunca savunulan düşüncelerin birbiriyle çelişmemesi, tezat teşkil etmemesidir.',
        '▸ 10. Ulusallık ve Evrensellik: Ulusallık (yerlilik) ait olduğu milletin kültürünü yansıtmasıdır; evrensellik ise tüm insanlığı ilgilendiren ortak insani değerleri kucaklamasıdır.'
      ],
      goldenRule: 'Özlülük (az sözle çok şey anlatmak) ile Duruluk (cümleden gereksiz kelimeleri atmak) karıştırılmamalıdır. Duruluk bir dil bilgisi kuralıdır; Özlülük ise derin felsefi/anlamsal yoğunluktur.'
    ),
    LectureSection(
      title: 'Paragrafta Yapı ve Anlatım Çözümlü Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM ve EKPSS formatındaki çıkmış nitelikli paragraf yapı soruları ve adım adım çözümleri (turkce1.pdf Sayfa 73-80):',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '(I) Burdur Gölü, pek çok su kuşuna ev sahipliği yapıyor. (II) Dikkuyruk, kaşıkgaga, yeşilbaş, saka bu kuş türlerinden bazıları. (III) Dünyadaki dikkuyruk nüfusunun yaklaşık yüzde yetmişi kış aylarını bu gölde geçiriyor. (IV) Göldeki su seviyesinin son otuz beş yılda hızla azalması ekosistemi tehdit ediyor. (V) Ancak göl çevresinde yapılan sanayi yatırımları ve tarımsal sulama gölü besleyen kaynakları tüketmiş durumda. Bu parçada numaralanmış cümlelerin hangisinden itibaren düşüncenin akışı değişmiştir?',
          options: [
            'A) II',
            'B) III',
            'C) IV',
            'D) V',
            'E) I'
          ],
          correctIndex: 2,
          explanation: 'I, II ve III. cümlelerde Burdur Gölü\'nde yaşayan kuş türleri ve dikkuyruk popülasyonu anlatılırken, IV. cümleden itibaren göldeki su seviyesinin azalması ve kuruma tehlikesi konusuna geçilmiştir. Bu nedenle düşüncenin akışı IV. cümlede değişmiştir.',
          ruleTag: 'Düşüncenin Akışı ve Bölme'
        ),
        LectureInteractiveQuiz(
          prompt: 'Yazarın savunduğu düşünceyi inandırıcı kılmak için alanında uzman kabul edilen bir kişinin doğrudan sözlerine yer vermesi aşağıdaki düşünceyi geliştirme yollarından hangisidir?',
          options: [
            'A) Örnekleme',
            'B) Tanık Gösterme',
            'C) Karşılaştırma',
            'D) Benzetme',
            'E) Tanımlama'
          ],
          correctIndex: 1,
          explanation: 'Bir otoritenin ya da uzmanın konu hakkındaki sözünün doğrudan veya dolaylı aktarılmasına "Tanık Gösterme" denir. Sadece adı anılsaydı örnekleme olurdu.',
          ruleTag: 'Tanık Gösterme'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu4 = konu4ParagraftaYapi;
