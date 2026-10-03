import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu5OsmanliKulturMedeniyet = LectureTopic(
  id: 'tarih_osmanli_kultur_medeniyet',
  courseId: 'tarih',
  order: 5,
  title: 'Osmanlı Devleti Kültür ve Medeniyeti',
  subtitle: 'Devlet Yönetimi, Divan-ı Hümayun, Ordu, Toprak Sistemi, Hukuk & Toplum',
  icon: Icons.account_balance_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 41 - 50',
  startTestNum: 41,
  endTestNum: 50,
  estimatedMinutes: 80,
  sections: [
    // BÖLÜM 1: DEVLET YÖNETİMİ, PADİŞAH VE VERASET SİSTEMİ
    LectureSection(
      title: '1. Devlet Anlayışı, Padişahın Hakları & Veraset Sistemi',
      type: LectureSectionType.overview,
      leadText: 'Osmanlı Devleti, Türk töresi, İslam hukuku (şeriat) ve fethedilen yerlerin geleneklerini harmanlayan mutlakiyetçi ve merkeziyetçi bir teokratik imparatorluktur.',
      bulletPoints: [
        'Devletin Temel Unsurları ve Hâkimiyet Anlayışı:\n'
            '  • Devletin başı "Âl-i Osman" yani Osmanlı Hanedanı\'dır.\n'
            '  • Padişah unvanları: Bey, Gazi, Hüdavendigar, Sultan, Han, Padişah, Hakan, Halife.\n'
            '  • Hükümdarlık Alametleri: Sikke bastırmak, hutbe okutmak, tuğra, sancak, davul (tabl), otağ, kılıç alayı (Eyüp Sultan\'da kılıç kuşanma), hilat giymek, cülus bahşişi dağıtmak.',
        'Padişahın Yasama, Yürütme ve Yargı Yetkileri:\n'
            '  • Yasama: Ferman (padişah emri), Berat (göreve atama belgesi), Hatt-ı Hümayun (padişahın el yazısıyla çıkan emir), Kanunname (kanunlar bütünü), Adaletname (halkı yöneticilerin zulmünden koruyan beyanname).\n'
            '  • Yargı: Müsadere (haksız kazanç sağlayan veya vefat eden devlet adamının malına devletçe el konulması; özel mülkiyeti sınırlandırmıştır), Kulluk Hakkı (devşirme kökenli devlet adamlarını idam edebilme yetkisi).',
        'Veraset Sistemindeki Tarihsel Değişimler:\n'
            '  • 1. Osman ve Orhan Bey Dönemi: "Ülke hanedanın ortak malıdır" (Geleneksel Türk töresi; taht kavgaları çok fazla).\n'
            '  • 2. I. Murad Dönemi: "Ülke padişah ve oğullarınındır" anlayışı getirildi (Merkezi otorite ilk kez güçlendirildi).\n'
            '  • 3. Fatih Sultan Mehmed Dönemi (Kanunname-i Âl-i Osman): "Devletin bekası ve nizam-ı âlem için kardeş katli caizdir" hükmü yasallaştı.\n'
            '  • 4. I. Ahmed Dönemi: "EKBER VE ERŞED SİSTEMİ" getirildi (Hanedanın en yaşlı ve en akıllı üyesi tahta çıkar). Bu sayede taht kavgaları sona ermiş; ancak şehzadelerin sancağa çıkma usulü kaldırılarak KAFES USULÜ (Şimşirlik) getirilmiş; sarayda tecrübesiz padişahlar yetişmesine yol açmıştır.',
      ],
      goldenRule: '💡 VERASETİN EN SON ŞEKLİ = EKBER VE ERŞED:\n'
          'Osmanlı\'da belirsiz olan veraset kuralını kesin ve net kurala bağlayan padişah I. AHMED\'dir (Ekber ve Erşed = En yaşlı ve aklı başında olan).',
    ),

    // BÖLÜM 2: SARAY TEŞKİLATI VE DİVAN-I HÜMAYUN
    LectureSection(
      title: '2. Saray Teşkilatı (Topkapı) & Divan-ı Hümayun',
      type: LectureSectionType.ruleList,
      leadText: 'Fatih\'ten XIX. yüzyıla kadar devletin yönetim merkezi olan Topkapı Sarayı üç ana bölümden oluşurdu.',
      bulletPoints: [
        'Topkapı Sarayı\'nın Bölümleri:\n'
            '  • 1. Bîrûn (Dış Saray): Devlet işlerinin fiilen yürütüldüğü bölümdür. Kubbealtı vezirleri, yeniçeri ağası, çavuşbaşı burada bulunurdu. Babü\'s-Selam kapısıyla girilirdi.\n'
            '  • 2. Enderûn (İç Saray / Saray Okulu): II. Murad zamanında Edirne\'de temeli atılan, Fatih devrinde Topkapı\'da teşkilatlanan devşirme okuludur. Sadrazam, vezir, komutan, hattat ve bürokratlar burada eğitilirdi. Has Oda, Hazine Odası, Kiler Odası gibi koğuşlardan oluşurdu.\n'
            '  • 3. Harem: Padişahın ve ailesinin özel hayatını sürdürdüğü bölümdür. Başında "Valide Sultan" ve "Harem Ağası" bulunurdu. Cariyelerin ahlak, müzik, el işi ve edebiyat eğitimi aldığı bir mekteptir.',
        'Divan-ı Hümayun ve Üç Yönetici Sınıf (Seyfiye, İlmiye, Kalemiye):\n'
            '  • SEYFİYE (Kılıç Ehli / Askeri ve İdari Yönetim):\n'
            '    - Sadrazam (Vezir-i Âzam): Padişahın mutlak vekili ve sağ koludur. Padişahın mührünü (Mühr-i Hümayun) taşır. Ordu komutanı olarak sefere çıktığında "Serdar-ı Ekrem" unvanını alır.\n'
            '    - Kubbealtı Vezirleri: Bakanlar kurulu üyeleridir.\n'
            '    - Kaptan-ı Derya: Donanma komutanıdır (Vezir rütbesindeyse divana katılır).\n'
            '    - Yeniçeri Ağası: Başkentin güvenliğinden sorumludur (Vezir rütbesindeyse katılır).\n'
            '  • İLMİYE (Din, Hukuk ve Eğitim / Yargı):\n'
            '    - Şeyhülislam (Müftü): Divan kararlarının ve padişah fermanlarının İslam dinine uygun olup olmadığına dair "FETVA" verir. Kanuni devrinde protokolde sadrazama eşit sayılmıştır (Doğrudan devşirme OLAMAZ, Türk-Müslüman kökenli olmalıdır!).\n'
            '    - Kazasker (Kadıasker): Adalet bakanı ve milli eğitim bakanıdır. Kadıların ve müderrislerin atama ve tayinlerini yapar. Divandaki şer\'i davalara bakar (Anadolu ve Rumeli Kazaskeri).\n'
            '  • KALEMİYE (Bürokrasi, Yazışma ve Maliye):\n'
            '    - Defterdar: Maliye bakanıdır. Bütçeyi hazırlar, hazineden sorumludur (Rumeli ve Anadolu Defterdarı).\n'
            '    - Nişancı: Kanunları çok iyi bilir. Padişahın ferman ve beratlarına "TUĞRA" çeker. Fethedilen toprakları "Tahrir Defterleri"ne kaydeder ve dirlikleri dağıtır.\n'
            '    - Reisülküttap: Önceleri Nişancıya bağlıyken XVII. yüzyıldan itibaren dış işlerinden sorumlu Hariciye Nazırı (Dışişleri Bakanı) haline gelmiştir.',
      ],
      goldenRule: '💡 KAZASKER VS ŞEYHÜLİSLAM DİVAN FARKI:\n'
          'Kadı ve müderris atamasını KAZASKER yapar; kanunların dine uygunluğu hakkında fetvayı ŞEYHÜLİSLAM verir. Kazasker divanın asil üyesidir; Şeyhülislam ise gerektiğinde görüşü alınan danışmandır.',
    ),

    // BÖLÜM 3: ÜLKE YÖNETİMİ VE TAŞRA TEŞKİLATI
    LectureSection(
      title: '3. Ülke Yönetimi, Taşra Teşkilatı & Eyalet Türleri',
      type: LectureSectionType.comparison,
      leadText: 'Osmanlı taşra teşkilatı, merkezin emirlerini en ücra köye kadar ulaştıran mükemmel bir hiyerarşiye sahipti.',
      bulletPoints: [
        'Taşra İdari Birimleri ve Yöneticileri:\n'
            '  • Eyalet ➜ Yöneticisi: Beylerbeyi | Güvenlik: Subaşı | Adalet: Kadı\n'
            '  • Sancak ➜ Yöneticisi: Sancakbeyi | Güvenlik: Subaşı | Adalet: Kadı\n'
            '  • Kaza ➜ Yöneticisi ve Yargıcı: KADI | Güvenlik: Subaşı\n'
            '  • Köy ➜ Yöneticisi: Kethüda (Köy İmamı / Yiğitbaşı) | Güvenlik: Tımarlı Sipahi | Adalet: Kadı Naibi.',
        'Eyalet Türleri (Salyaneli, Salyanesiz ve İmtiyazlı):\n'
            '  • 1. Salyanesiz (Yıllıksız) Eyaletler: Tımar sisteminin uygulandığı merkeze yakın eyaletlerdir (Rumeli, Anadolu, Şam, Sivas, Karaman). Memurlara maaş verilmez, dirlik toprağı tahsis edilir.\n'
            '  • 2. Salyaneli (Yıllıklı) Eyaletler: Merkeze uzak olan ve Tımar uygulanmayan eyaletlerdir (Mısır, Trablusgarp, Tunus, Cezayir, Yemen, Habeş). Vergiler İLTİZAM SİSTEMİ ile toplanır; vergi ihalesini kazanan kişiye "MÜLTEZİM" denir. Vergiler doğrudan hazineye yıllık (salyane) olarak aktarılır.\n'
            '  • 3. İmtiyazlı (Özel Statülü) Eyaletler: İç işlerinde serbest, dış işlerinde Osmanlı\'ya bağlı eyaletlerdir:\n'
            '    - Kırım Hanlığı: Asker gönderir, vergi vermezdi.\n'
            '    - Hicaz Emirliği: Kutsal topraklar olduğu için NE ASKER NE DE VERGİ verirdi; üstelik her yıl İstanbul\'dan hediye (Surre Alayı) gönderilirdi.\n'
            '    - Eflak, Boğdan ve Erdel Beylikleri: Hem vergi verir hem asker gönderirdi.',
      ],
    ),

    // BÖLÜM 4: OSMANLI ORDU TEŞKİLATI
    LectureSection(
      title: '4. Osmanlı Ordu Teşkilatı: Kara Ordusu & Donanma',
      type: LectureSectionType.ruleList,
      leadText: 'Osmanlı ordusu dünyanın ilk düzenli ve profesyonel daimi ordularındandır; Kara Ordusu ve Donanma olarak ikiye ayrılırdı.',
      bulletPoints: [
        'KARA ORDUSU 1: Kapıkulu Askerleri (Merkez / Maaşlı Ordu):\n'
            '  • Padişaha doğrudan bağlı, üç ayda bir "ULUFE" maaşı ve taht değişiminde "CÜLUS BAHŞİŞİ" alan askerlerdir. Devşirme kökenlidirler.\n'
            '  • Kapıkulu Piyadeleri:\n'
            '    - Acemi Ocağı: Devşirmelerin ilk eğitildiği ocaktır.\n'
            '    - Yeniçeri Ocağı: Ordunun bel kemiğidir. I. Murad kurmuştur.\n'
            '    - Cebeci Ocağı: Silahların yapımı, bakımı ve onarımından sorumludur.\n'
            '    - Topçu Ocağı: Top döken ve savaşta top kullanan ocaktır.\n'
            '    - Top Arabacıları Ocağı: Topları savaş alanına taşıyan ocaktır.\n'
            '    - Humbaracı Ocağı: El bombası ve havan topu yapan ocaktır.\n'
            '    - Lağımcı Ocağı: Kale kuşatmalarında yer altından tünel kazıp surları patlatan ocaktır.\n'
            '  • Kapıkulu Süvarileri (Altı Bölük Halkı - Atlı Birlikler):\n'
            '    - Sipahi ve Silahtar: Savaşta padişahın çadırını (otağ) korurlar.\n'
            '    - Sağ ve Sol Ulufeciler: Savaşta saltanat sancaklarını korurlar.\n'
            '    - Sağ ve Sol Garipler: Savaşta devlet hazinesini ve ağırlıkları korurlar.',
        'KARA ORDUSU 2: Eyalet Askerleri (Taşra Ordusu):\n'
            '  • Tımarlı Sipahiler: Ordunun en kalabalık atlı kuvvetidir. Maaş almazlar, tımar gelirleriyle geçinirler ve "Cebelü" adı verilen atlı zırhlı asker yetiştirirler. Tamamı Türk ve Müslümandır.\n'
            '  • Yardımcı Kuvvetler: Akıncılar (keşif ve yıpratma birlikleri), Azaplar (bekar Türk gençleri, ordunun en önünde yer alırlar), Deliler (korkusuz sınır süvarileri), Yörükler, Beşliler, Sakalar (orduya su taşıyanlar).',
        'DENİZ ORDUSU (Donanma):\n'
            '  • Başkomutanına "KAPTAN-I DERYA", deniz askerlerine "LEVENT" denirdi.\n'
            '  • Başlıca tersaneler: Gelibolu, Tersane-i Âmire (Haliç), Sinop, İzmit, Süveyş.\n'
            '  • Önemli Türk denizcileri: Karamürsel Alp, Çalı Bey, Barbaros Hayreddin Paşa, Turgut Reis, Piri Reis (Kitab-ı Bahriye ve ilk dünya haritası), Seydi Ali Reis (Mir\'âtü\'l-Memâlik), Kılıç Ali Paşa.',
      ],
    ),

    // BÖLÜM 5: TOPRAK YÖNETİMİ VE TIMAR SİSTEMİ
    LectureSection(
      title: '5. Toprak Yönetimi (Mîrî, Mülk, Vakıf) & Tımar Sistemi',
      type: LectureSectionType.formula,
      leadText: 'Osmanlı ekonomisinin ve toplumsal düzeninin omurgası topraktır; toprakların mülkiyeti ezici oranda devlete aittir.',
      bulletPoints: [
        'Toprak Türleri:\n'
            '  • 1. MÎRÎ ARAZİ (Devlete Ait Topraklar):\n'
            '    - Dirlik (Has, Zeamet, Tımar): Geliri devlet memurlarına ve askerlere maaş karşılığı tahsis edilen arazidir.\n'
            '      * Has: Geliri 100.000 akçeden fazla olan arazilerdir. Padişah, hanedan üyeleri ve vezirlere verilir.\n'
            '      * Zeamet: Geliri 20.000 ile 100.000 akçe arası olan arazilerdir. Subaşı, kadı, sancakbeyi gibi orta düzey yöneticilere verilir.\n'
            '      * Tımar: Geliri 3.000 ile 20.000 akçe arası olan arazilerdir. Savaşta yararlılık gösteren sipahilere verilir.\n'
            '    - Paşmaklık: Geliri padişahın annesi, eşleri ve kızlarına ayrılan topraklar.\n'
            '    - Ocaklık: Geliri kale muhafızlarına ve tersane giderlerine ayrılan topraklar.\n'
            '    - Yurtluk: Geliri sınır boylarını koruyanlara ayrılan topraklar.\n'
            '    - Mukataa: Geliri doğrudan devlet hazinesine (Hazine-i Âmire) aktarılan iltizam arazileri.\n'
            '    - Malikâne: Üstün hizmet gösterenlere ömür boyu tahsis edilen topraklar.\n'
            '  • 2. MÜLK ARAZİ (Kişilere Ait Özel Mülkler):\n'
            '    - Öşrî Topraklar: Müslümanlara ait arazilerdir (1/10 Öşür vergisi öderler).\n'
            '    - Harâcî Topraklar: Gayrimüslimlere ait arazilerdir (Haraç ve Cizye vergisi öderler).\n'
            '  • 3. VAKIF ARAZİLER: Geliri cami, medrese, darüşşifa, kütüphane, imarethane, köprü gibi kamu ve hayır kurumlarına tahsis edilen arazilerdir. Satılamaz, devredilemez ve vergiye tabi değildir.',
        'Tımar Sisteminin Faydaları:\n'
            '  • 1. Üretimde Süreklilik: Toprağını mazeretsiz 3 yıl üst üste ekmeyen köylüden "ÇİFTBOZAN VERGİSİ" alınır veya toprak başkasına verilirdi.\n'
            '  • 2. Hazineye Yük Olmayan Ordu: Devlet kasasından tek kuruş çıkmadan yüz binlerce kişilik Tımarlı Sipahi ordusu hazır tutuldu.\n'
            '  • 3. Taşra Güvenliği: Askerler barış zamanında bölgenin asayişini sağladı.\n'
            '  • 4. Vergi Tahsilatı: Vergiler yerinde ve masrafsız toplandı.',
      ],
    ),

    // BÖLÜM 6: HUKUK, SOSYAL HAYAT, LONCA VE KÜLTÜR ÖĞELERİ
    LectureSection(
      title: '6. Hukuk, Sosyal Hayat, Lonca Teşkilatı & Kültür Öğeleri',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_osmanli_kultur_ogeleri.png',
      imageCaption: 'Görsel 5.1: Osmanlı Kültür, Sanat, Mimari ve Sosyal Teşkilat Öğeleri',
      leadText: 'Osmanlı toplumunda ırk ve soy ayrımı yoktur; toplum dini inanç esasına göre yönetilen "Millet Sistemi"ne göre teşkilatlanmıştır.',
      bulletPoints: [
        'Hukuk Sistemi:\n'
            '  • Şer\'î Hukuk: İslam dininin kurallarına dayanır. Aile, miras, ceza işlerine bakar; başında Kazasker ve Kadılar bulunur.\n'
            '  • Örfî Hukuk: Türk töresi ve padişah fermanlarına dayanır; şeriat kurallarına aykırı olamaz; başında Nişancı bulunur.\n'
            '  • Kadı: Mahkemelerde davalara bakar, vakıfları denetler, nikah kıyar, çarşı-pazar fiyatlarını kontrol ederdi.',
        'Millet Sistemi ve Toplumsal Sınıflar:\n'
            '  • Yönetenler (Askerî / Berâya): Seyfiye, İlmiye ve Kalemiye sınıflarıdır. Vergi ödemezlerdi.\n'
            '  • Yönetilenler (Reâya / Tebaa): Köylüler, tüccarlar ve esnaftır. Din ve mezheplerine göre "Millet" olarak teşkilatlanmışlardır (Müslümanlar, Rumlar, Ermeniler, Museviler).',
        'Lonca Teşkilatı ve Esnaf Düzeni:\n'
            '  • Ahiliğin devamı olan meslek örgütüdür. Farkı: Ahilikte sadece Müslümanlar varken, LONCALARDA GAYRİMÜSLİMLER DE YER ALMIŞTIR.\n'
            '  • Gedik: Dükkân açma ruhsatı ve imtiyazıdır.\n'
            '  • Narh Sistemi: Malların tavan ve taban fiyatlarının devlet-lonca işbirliğiyle belirlenmesidir (Fahiş fiyat ve karaborsa önlenmiştir).\n'
            '  • Yiğitbaşı ve Kethüda esnafın intizamını sağlardı.',
        'Sosyal Yardım ve Sağlık Kurumları:\n'
            '  • Dârüşşifâ / Bîmarhane: Hastane.\n'
            '  • İmarethane: Yoksullara ve öğrencilere ücretsiz sıcak yemek dağıtılan aşevi.\n'
            '  • Tabhâne: Dinlenme evi / misafirhane.\n'
            '  • Külliye: Cami merkezli medrese, imaret, hamam, kütüphane ve hastaneden oluşan yapılar topluluğu.',
      ],
    ),

    // BÖLÜM 7: PDF ÜNİTE 5 PEKİŞTİRME VE DEĞERLENDİRME TESTİ
    LectureSection(
      title: '7. Ünite 5 MEB Pekiştirme & Konu Değerlendirme Testi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'MEB Ders Kitabı Ünite 5 resmi değerlendirme soruları ile bilginizi test edin.',
      bulletPoints: [
        'MEB Soru 1: Osmanlı Devleti\'nde veraset sisteminde "Ekber ve Erşed" kuralını getiren padişah kimdir?\n'
            '  ➜ Doğru Cevap: I. Ahmed.',
        'MEB Soru 2: Topkapı Sarayı\'nda bürokrat, vezir ve devlet adamlarının yetiştirildiği saray mektebi hangisidir?\n'
            '  ➜ Doğru Cevap: Enderûn Mektebi.',
        'MEB Soru 3: Divan-ı Hümayun\'da kadı ve müderris atamalarını yapan İlmiye sınıfı üyesi kimdir?\n'
            '  ➜ Doğru Cevap: Kazasker.',
        'MEB Soru 4: Padişahın fermanlarına tuğra çeken ve fethedilen toprakları tahrir defterine kaydeden görevli kimdir?\n'
            '  ➜ Doğru Cevap: Nişancı.',
        'MEB Soru 5: Tımar uygulanmayan, vergilerin iltizam yoluyla mültezimler aracılığıyla toplandığı eyaletler hangileridir?\n'
            '  ➜ Doğru Cevap: Salyaneli (Yıllıklı) Eyaletler (Mısır, Trablusgarp, Cezayir vb.).',
        'MEB Soru 6: Osmanlı\'da haksız kazanç sağlayan devlet adamlarının malına devletçe el konulması usulüne ne ad verilir?\n'
            '  ➜ Doğru Cevap: Müsadere Usulü.',
      ],
    ),
  ],
);
