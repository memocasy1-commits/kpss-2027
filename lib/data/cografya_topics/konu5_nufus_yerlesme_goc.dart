// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu5NufusYerlesmeGoc = LectureTopic(
  id: 'cografya_nufus_yerlesme_goc',
  courseId: 'cografya',
  order: 5,
  title: 'Türkiye\'de Nüfus, Yerleşme ve Göç Dinamikleri',
  subtitle: 'Nüfusun Dağılışı, Sık ve Seyrek Nüfuslu Yöreler, Yaş Piramitleri, Kır-Kent Yerleşmeleri ve Göçler',
  icon: Icons.people_alt_rounded,
  color: const Color(0xFF6366F1),
  testRange: 'Test 41 - 50',
  startTestNum: 41,
  endTestNum: 50,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'de Nüfusun Gelişimi, Sayımlar ve Nüfus Artış Hızı',
      type: LectureSectionType.overview,
      leadText: 'Cumhuriyet döneminde ilk resmi nüfus sayımı 1927 yılında yapılmış ve nüfus 13,6 milyon olarak belirlenmiştir. 2007 yılından itibaren Adrese Dayalı Nüfus Kayıt Sistemi (ADNKS) ile nüfus her yıl düzenli olarak açıklanmaktadır.',
      bulletPoints: [
        'Nüfus Artış Hızının Dönemleri:',
        '• 1927 - 1945 Dönemi: I. Dünya Savaşı ve Kurtuluş Savaşı kayıpları ve II. Dünya Savaşı sırasında erkeklerin silah altına alınması nedeniyle nüfus artış hızı tarihin en düşük seviyelerine gerilemiştir (Binde 10,5).',
        '• 1945 - 1960 Dönemi: Savaştan sonra sağlık koşullarının iyileşmesi, bebek ölümlerinin azalması ve devletin doğum yanlısı politikalarıyla nüfus artış hızı tarihin en yüksek seviyesine ulaşmıştır (1960 sayımında binde 28,5).',
        '• 1960 - 1985 Dönemi: Avrupa\'ya (özellikle Almanya) işçi göçlerinin başlaması, aile planlaması kanunlarının çıkması ve kentleşmeyle birlikte nüfus artış hızı düşüş eğilimine girmiştir.',
        '• 1985\'ten Günümüze: Sanayileşme, kadınların iş hayatına katılımı, eğitim seviyesinin yükselmesi ve evlilik yaşının gecikmesiyle nüfus artış hızı sürekli azalmaktadır. Günümüzde nüfus artış hızı binde 1-2 seviyelerine inmiştir.',
        'Önemli Kural: Türkiye\'nin nüfus artış hızı yıllara göre artıp azalsa da; Türkiye\'nin TOPLAM NÜFUSU hiçbir sayım döneminde azalmamış, SÜREKLİ ARTMIŞTIR.'
      ],
      goldenRule: 'NÜFUS ARTIŞ HIZI DÜŞSE BİLE TOPLAM NÜFUS ARTAR: Bir ülkenin nüfus artış hızının pozitif olması (sıfırın üzerinde olması), o ülkenin nüfusunun artmaya devam ettiği anlamına gelir. Nüfus artış hızının düşmesi nüfusun azaldığı anlamına KESİNLİKLE GELMEZ!',
      osymTrap: 'ÖSYM TUZAĞI: 1940-1945 arası nüfus artış hızının düşmesinin sebebi Türkiye\'nin II. Dünya Savaşı\'na fiilen girmesi DEĞİL; savaşa girme tehlikesine karşı erkek nüfusun seferberlik gereği silah altına alınmasıdır!'
    ),
    LectureSection(
      title: 'Türkiye\'de Nüfusun Alansal Dağılışı: Sık ve Seyrek Nüfuslu Yöreler',
      type: LectureSectionType.comparison,
      leadText: 'Türkiye\'de nüfus dağılışında iklim, yer şekilleri, su kaynakları, sanayi, tarım, ulaşım ve ticaret belirleyicidir:',
      comparisonRows: [
        ComparisonRow(
          correct: 'Sık Nüfuslu Yöreler ve Nedenleri',
          wrong: '• Çatalca-Kocaeli: Sanayi, ticaret, ulaşım ve finans merkezi.\n• Kıyı Ege (İzmir, Manisa, Aydın): Verimli ovalar, sanayi, turizm.\n• Çukurova (Adana, Mersin): Çok verimli tarım toprakları ve sanayi.\n• Orta ve Doğu Karadeniz Kıyı Şeridi: Ilıman iklim, dar kıyıda toplanma.\n• Gaziantep-Diyarbakır: GAP\'la gelişen tarım, ticaret ve sanayi.\n• Ankara, Bursa, Kayseri, Konya: İdari, ticari ve sanayi merkezleri.',
          note: 'Tarımsal, sanayi ve ulaşım çekim merkezleridir.'
        ),
        ComparisonRow(
          correct: 'Seyrek Nüfuslu Yöreler ve Nedenleri',
          wrong: '• Teke ve Taşeli Platoları: Karstik arazi, engebe ve su tutmayan kireçli topraklar.\n• Yıldız Dağları Yöresi: Engebe ve ana ulaşım yollarından sapa kalması.\n• Hakkari Bölümü: Aşırı engebe, yüksek rakım ve sert kış koşulları.\n• Tuz Gölü Çevresi: Aşırı kuraklık, yetersiz yağış ve toprak tuzluluğu.\n• Biga ve Gelibolu Yarımadaları: Engebe, sit alanı ve ana yollara sapa konum.',
          note: 'İklim, engebe ve karstik yapı nüfusu sınırlandırır.'
        ),
      ],
      goldenRule: 'TEKE VE TAŞELİ\'NİN SEYREK OLMA SEBEBİ KARSTİK YAPIDIR: Teke ve Taşeli kıyıda olmasına ve Akdeniz ikliminde bulunmasına rağmen nüfusu çok seyrektir. Sebebi iklim değil; kireçtaşının (kalkerin) suyu alta geçirmesi ve aşırı engebeli karstik yapıdır.',
      osymTrap: 'ÖSYM TUZAĞI: Doğu Karadeniz\'in tamamı sık nüfuslu DEĞİLDİR! Yalnızca KIYI KUŞAĞI sık nüfusludur; iç kesimler ve yüksek dağlık alanlar oldukça seyrektir.'
    ),
    LectureSection(
      title: 'Nüfusun Yapısal Özellikleri, Yaş Piramitleri ve Göçler',
      type: LectureSectionType.ruleList,
      leadText: 'Türkiye\'nin demografik yapısı gelişmiş ülke özelliklerine doğru dönüşmektedir:',
      bulletPoints: [
        'Yaş Gruplarına Göre Dağılım: Genç nüfus (0-14 yaş) oranı azalmakta, çalışma çağındaki nüfus (15-64 yaş) en büyük paya sahip olmakta (%68 civarı), yaşlı nüfus (65+ yaş) oranı ise hızla artmaktadır (%10\'u aşmıştır). Bu durum Türkiye\'nin nüfusunun yaşlanma sürecine girdiğini gösterir.',
        'Kır ve Kent Nüfus Oranları: 1927\'de nüfusun %75\'i kırsalda yaşarken; günümüzde nüfusun %93\'ten fazlası il ve ilçe merkezlerinde (kentlerde) yaşamaktadır.',
        'Çalışan Nüfusun Sektörel Dağılımı: En yüksek pay Hizmet sektöründedir (%55+), ardından Sanayi (%27+) ve Tarım (%15 civarı) gelir. Gelişmişliğin en büyük göstergesi hizmet ve sanayinin payının artmasıdır.',
        'İç Göçler ve Yönü: Genel olarak doğudan batıya, iç kesimlerden kıyılara, kırsaldan kentlere doğrudur. Göç veren yerlerde kadın nüfus oranı, göç alan yerlerde erkek nüfus oranı daha fazladır.',
        'Mevsimlik (Geçici) Göçler: Tarım işçiliği (Çukurova pamuk, Ordu-Giresun fındık, Rize çay, Ege üzüm/tütün), turizm sezonu (Antalya, Muğla) ve yaylacılık faaliyetleri amacıyla yapılan yer değiştirmelerdir.'
      ],
      goldenRule: 'GÖÇÜN SONUÇLARI: Göç alan kentlerde plansız kentleşme, gecekondu, altyapı yetersizliği ve çevre kirliliği oluşur. Göç veren kırsalda ise tarım arazilerinin boş kalması ve yatırımların atıl kalması sorunu yaşanır.',
      osymTrap: 'ÖSYM TUZAĞI: Göç alan şehirlerde erkek nüfus fazladır (iş bulma amacıyla ilk gidenler genellikle erkektir); göç veren kırsal yörelerde ise geride kalan kadın ve yaşlı nüfus oranı daha yüksektir!'
    ),
    LectureSection(
      title: 'Türkiye\'de Yerleşme Coğrafyası ve Mesken Tipleri',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'de yerleşmeler kır ve kent yerleşmeleri olarak sınıflandırılır. Kırsal yerleşmeler köy ve köy altı yerleşmelerini kapsar:',
      bulletPoints: [
        'Sürekli Köy Altı Yerleşmeleri: Tarımsal faaliyetlerin kesintisiz sürdüğü yerleşmelerdir: Mahalle, Mezra (Doğu ve Güneydoğu), Divan (Batı Karadeniz - Bolu, Kastamonu, Sinop), Çiftlik (Geniş tarım arazileri, Marmara, Ege, İç Anadolu).',
        'Geçici Köy Altı Yerleşmeleri: Hayvancılık faaliyetine bağlı olarak mevsimlik kullanılan yerleşmelerdir: Yayla (En yaygın köy altı yerleşmesidir; Karadeniz, Akdeniz, Doğu Anadolu), Kom (Doğu Anadolu büyükbaş hayvancılık), Ağıl (Küçükbaş hayvancılık, İç Anadolu), Oba (Çadır yerleşmesi, Akdeniz Yörükleri), Dam (Ege), Dalyan (Balık üretimi, kıyılar).',
        'Doğal Çevreye Göre Mesken Tipleri:',
        '• Ahşap Meskenler: Karadeniz Bölgesi\'nde orman varlığının ve nemin bolluğu nedeniyle yaygındır.\n• Toprak / Kerpiç Meskenler: İç Anadolu ve Güneydoğu\'da yağış azlığı ve ağaç yokluğu nedeniyle balçık-saman karışımı kerpiçten yapılır.\n• Taş Meskenler: Akdeniz (kalker taşları), Doğu Anadolu ve İç Anadolu volkanik arazilerinde (tüf/bazalt taşları - Kapadokya, Mardin, Nevşehir, Muğla) yaygındır.'
      ],
      goldenRule: 'DİVAN BATI KARADENİZ\'E ÖZGÜDÜR: Birbirine uzak birkaç mahallenin birleşmesiyle oluşan "Divan" yerleşmeleri sadece Batı Karadeniz\'e (Bolu, Sakarya, Kastamonu, Sinop) özgüdür.',
      osymTrap: 'ÖSYM TUZAĞI: Yaylalar geçmişte sadece hayvancılık amacıyla kullanılırken; günümüzde Karadeniz ve Akdeniz\'de turizm, dinlenme ve festival amacıyla da yoğun biçimde kullanılmaktadır.'
    ),
    LectureSection(
      title: 'Türkiye Nüfus Yoğunluğu ve Dağılış Atlası',
      type: LectureSectionType.overview,
      leadText: 'TÜİK verilerine göre Türkiye\'de nüfusun mekânsal yoğunlaşma alanları ve seyrek yerleşim odakları haritada gösterilmiştir.',
            mapData: LectureMapData(
        title: 'TÜRKİYE NÜFUS YOĞUNLUĞU, DAĞILIŞI VE YERLEŞME ATLASI',
        subtitle: 'TÜİK Verileriyle Yoğun ve Seyrek Nüfuslu Yöreler, Göç Dinamikleri ve Yerleşme Tipleri',
        mapId: 'cografya_nufus_yogunlugu_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_nufus_yogunlugu.jpg',
        mapSource: 'cografyaharita.com - Türkiye Nüfus Yoğunluğu Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '🔴', label: 'Aşırı Yoğun Nüfuslu Sanayi Kuşağı', description: 'Çatalca-Kocaeli (İstanbul-İzmit-Adapazarı), İzmir Körfezi, Bursa-Balıkesir havzası, Ankara metropolü, Adana-Mersin-İskenderun sanayi şeridi.'),
          MapLegendItem(symbol: '🏔️', label: 'Engebe ve Yükselti Nedeniyle Seyrek Nüfuslu', description: 'Hakkari Yöresi, Menteşe Yöresi (Muğla), Doğu Karadeniz\'in iç dağlık kesimleri, Sivas-Erzincan yöresi.'),
          MapLegendItem(symbol: '🌵', label: 'Kuraklık ve Yağış Azlığı Nedeniyle Seyrek Nüfuslu', description: 'Tuz Gölü çevresi (Konya kuzeyi, Karapınar), Güneydoğu\'nun Suriye sınır hattı.'),
          MapLegendItem(symbol: '🪨', label: 'Karstik Arazi Nedeniyle Seyrek Nüfuslu', description: 'Teke Yarımadası (Antalya batısı) ve Taşeli Platosu (Mersin-Karaman arası). Kireçtaşının suyu sızdırması ve toprak azlığı nedeniyle tarım ve yerleşme kısıtlıdır.'),
          MapLegendItem(symbol: '🌲', label: 'Ulaşım Yollarından Sapa Kaldığı İçin Seyrek Nüfuslu', description: 'Yıldız Dağları (Kırklareli), Sinop ve Çanakkale-Biga yarımadası (Gelibolu).')
        ],
        points: [
          MapFrontItem(
            name: 'Çatalca - Kocaeli Bölümü',
            category: 'Nüfusun ve Ekonominin Kalbi',
            commander: 'Marmara / İstanbul - Kocaeli',
            keyEvent: 'Türkiye nüfusunun yaklaşık %25\'inin toplandığı, kilometrekareye 3.000\'den fazla insanın düştüğü en yoğun sanayi, ticaret ve finans merkezidir. Net göç hızı en yüksektir.',
            outcome: 'ÖSYM Çıkmış Soru: Aritmetik nüfus yoğunluğu Türkiye ortalamasının katbekat üstünde olan bölüm Çatalca-Kocaeli\'dir.'
          ),
          MapFrontItem(
            name: 'Menteşe Yöresi (Muğla)',
            category: 'Kıyıda Olmasına Rağmen Seyrek',
            commander: 'Ege / Muğla',
            keyEvent: 'Kıyıda yer almasına ve bol yağış almasına rağmen dağlık ve engebeli arazi yapısı nedeniyle ana ulaşım akslarına bağlanamamış ve seyrek nüfuslu kalmıştır.',
            outcome: 'ÖSYM Soru Tuzağı: Ege\'de kıyıda yer alıp sanayi ve tarım yetersizliği nedeniyle seyrek nüfuslu kalan tek yer Menteşe Yöresi\'dir.'
          ),
          MapFrontItem(
            name: 'Teke ve Taşeli Platoları',
            category: 'Karstik ve Seyrek Nüfus',
            commander: 'Akdeniz / Antalya - Mersin',
            keyEvent: 'Akdeniz iklimi görülmesine rağmen kalkerli (kireçtaşı) karstik kayaçlar yağmur suyunu yer altına sızdırır. Toprak tabakası çok incedir; kıl keçisi yetiştiriciliği dışında ekonomik faaliyet dardır.',
            outcome: 'ÖSYM Sorusu: Teke ve Taşeli platolarında nüfusun seyrek olmasının temel nedeni karstik arazi yapısı ve engebedir.'
          ),
          MapFrontItem(
            name: 'Yıldız Dağları (Istranca)',
            category: 'Ulaşım Dışı Seyrek Alan',
            commander: 'Marmara / Kırklareli',
            keyEvent: 'Marmara Bölgesi genel olarak yoğun nüfuslu olmasına rağmen Yıldız Dağları ana transit ticaret ve sanayi hatlarından sapa kaldığı ve engebeli olduğu için tenhadır.',
            outcome: 'ÖSYM Püf Noktası: Marmara Bölgesi\'nde sanayileşmemiş ve seyrek nüfuslu kalan yöre Yıldız Dağları\'dır.'
          ),
          MapFrontItem(
            name: 'Hakkari Yöresi',
            category: 'Aşırı Engebeli & Sert İklim',
            commander: 'Doğu Anadolu / Hakkari',
            keyEvent: 'Türkiye\'nin aritmetik nüfus yoğunluğu en düşük yörelerindendir. Yükselti (2000m+), dik yamaçlar, kış mevsiminin sertliği ve ulaşım güçlüğü yerleşmeyi engellemiştir.',
            outcome: 'ÖSYM Sorusu: Doğu Anadolu\'da yer şekilleri ve sert kış şartları nedeniyle nüfusu en seyrek olan merkez Hakkari\'dir.'
          )
        ],
        historicalNote: '📌 ÖSYM NÜFUS VE YERLEŞME SINAV TUZAKLARI:\n'
            '1. Kıyıda Olmasına Rağmen SEYREK Nüfuslu 4 Alan:\n'
            '   - Menteşe Yöresi (Muğla - engebe)\n'
            '   - Teke ve Taşeli Platoları (karstik arazi ve engebe)\n'
            '   - Çanakkale - Biga & Gelibolu (ulaşım dışı, sit alanı)\n'
            '   - Sinop (küre dağları arkasında iç kesimlerle bağlantısı kopuk).\n'
            '2. İç Kesimde Olmasına Rağmen YOĞUN Nüfuslu Alanlar:\n'
            '   - Ankara (idari fonksiyon), Gaziantep (sanayi/ticaret), Kayseri, Konya, Eskişehir (ulaşım kavşağı).\n'
            '3. Nüfus Yoğunluğu En Fazla Olan İl: İstanbul; En Az Olan İl: Tunceli / Bayburt / Ardahan.'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Nüfus ve Yerleşme',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Akdeniz kıyı kuşağında yer almasına ve ılıman iklim şartlarına sahip olmasına rağmen Teke ve Taşeli platolarında nüfusun çok seyrek olmasının temel nedeni nedir?',
          options: [
            'A) Şiddetli kış donları ve çığ tehlikesi',
            'B) Sanayi yatırımlarının yasaklanmış olması',
            'C) Kalkerli (karstik) arazinin suyu derine geçirmesi ve aşırı engebeli arazi yapısı',
            'D) Bataklık alanların sıtma hastalığı yayması',
            'E) Orman yangını riskinin çok yüksek olması'
          ],
          correctIndex: 2,
          explanation: 'Teke ve Taşeli platoları karstik (kireçtaşı) yapıdadır; yağmur suları yüzeyde durmayıp yeraltına sızar, toprak tabakası çok incedir ve arazi aşırı engebelidir. Bu nedenle nüfusu çok seyrektir.',
          ruleTag: 'Karstik Yörelerde Seyrek Nüfus'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu5 = konu5NufusYerlesmeGoc;
