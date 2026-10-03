// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu2YersekilleriJeoloji = LectureTopic(
  id: 'cografya_yersekilleri_jeoloji',
  courseId: 'cografya',
  order: 2,
  title: 'Türkiye\'nin Yerşekilleri ve Jeolojik Yapısı',
  subtitle: 'Jeolojik Zamanlar, Orojenez, Horst-Graben Sistemleri, Volkanizma, Platolar ve Ovalar',
  icon: Icons.terrain_rounded,
  color: const Color(0xFF0D9488),
  testRange: 'Test 11 - 20',
  startTestNum: 11,
  endTestNum: 20,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: 'Türkiye\'nin Yer Şekillerinin Genel Özellikleri ve Jeolojik Gelişimi',
      imageAssetPath: 'assets/images/cografya/cografya_levha_hareketleri.png',
      imageCaption: 'Şekil 2.1: Türkiye\'yi Sıkıştıran Avrasya, Afrika ve Arap Levhaları Hareket Yönleri',
      type: LectureSectionType.overview,
      leadText: 'Türkiye, ortalama yükseltisi fazla (1132 metre), yer şekilleri oldukça engebeli ve çeşitlilik gösteren genç oluşumlu bir ülkedir. Ülkemizde dağlar genellikle doğu-batı doğrultusunda uzanır. Batıdan doğuya gidildikçe ortalama yükselti belirgin biçimde artar.',
      bulletPoints: [
        'Batıdan Doğuya Yükselti Artışının Sonuçları: Sıcaklıklar ortalama olarak azalır. Karın yerde kalma süresi ve don olayları artar. Tarım ürünlerinin olgunlaşma süresi uzar. Akarsuların akış hızları, aşındırma güçleri ve hidroelektrik enerji potansiyelleri artar.',
        'Dağların Doğu-Batı Uzanışının Sonuçları: Karadeniz ve Akdeniz\'de dağlar kıyıya paralel uzandığı için denizel etki iç kesimlere sokulamaz, kıyı ile iç kesim arasında ulaşım geçitlerle sağlanır. Ege\'de ise dağlar kıyıya dik uzandığı için denizel etki graben ovaları boyunca yaklaşık 150-200 km iç kısımlara kadar yayılabilir.',
        '1. Jeolojik Zaman (Paleozoik): Eski kıta çekirdekleri olan sert ve masif araziler oluşmuştur (Yıldız Dağları, Zonguldak, Menteşe, Saruhan, Kırşehir, Bitlis, Mardin Masifleri). Zonguldak\'ta taş kömürü yatakları bu dönemde meydana gelmiştir. Masif alanlarda deprem riski düşüktür.',
        '2. Jeolojik Zaman (Mezozoik): Durgunluk dönemidir. Tetis Denizi tabanında kalın tortul tabakalar birikmiş ve yer kabuğu aşınarak peneplenleşmiştir.',
        '3. Jeolojik Zaman (Tersiyer - Neojen): Türkiye arazisinin büyük bölümü şekillenmiştir. Alp-Himalaya kıvrım kuşağına bağlı olarak Kuzey Anadolu Dağları ve Toroslar yükselmiştir. Linyit, petrol, bor ve tuz yatakları bu dönemde oluşmuştur. Şiddetli volkanizma faaliyetleri başlamıştır.',
        '4. Jeolojik Zaman (Kuaterner): Egeid karası çökmüş ve Ege Denizi oluşmuştur. Çanakkale ve İstanbul boğazları oluşarak Karadeniz açık deniz haline gelmiştir. Epirojenez ile Anadolu toptan yükselmiş ve günümüz plato görünümünü kazanmıştır.'
      ],
      goldenRule: 'GENÇ OLUŞUMLU ÜLKE ÖZELLİKLERİ: Türkiye\'nin arazisinin büyük kısmı 3. ve 4. jeolojik zamanda oluştuğu için ortalama yükseltisi fazladır, engebelidir, akarsu aşındırma gücü yüksektir, linyit yatakları yaygındır ve tektonik deprem riski çok yüksektir.',
      osymTrap: 'ÖSYM TUZAĞI: Taş kömürü 1. Jeolojik Zaman\'da (Paleozoik); linyit, bor, petrol ve tuz ise 3. Jeolojik Zaman\'da (Tersiyer) oluşmuştur. Taş kömürü ile linyiti birbirine karıştırmamak en kritik sınav kuralıdır!'
    ),
    LectureSection(
      title: 'Jeolojik Zamanlar ve Türkiye Jeolojik Evrimi Şeması',
      imageAssetPath: 'assets/images/cografya/cografya_jeolojik_zamanlar.png',
      imageCaption: 'Şekil 2.2: Jeolojik Zaman Tablosu ve Anadolu\'nun Evrim Basamakları',
      type: LectureSectionType.ruleList,
      leadText: 'Dünya ve Anadolu arazisinin milyonlarca yıllık jeolojik gelişim dönemleri:',
      bulletPoints: [
        'Prekambriyen (İlkel Zaman): İlk canlılar ve en eski yerkabuğu parçalarının oluşumu.',
        'Paleozoik (1. Zaman): Kaledoniyen ve Hersiniyen kıvrımları, masif kütleler ve Zonguldak Taş Kömürü.',
        'Mezozoik (2. Zaman): Alp orojenezine hazırlık dönemi ve tortullaşma.',
        'Senozoik - Tersiyer (3. Zaman): Toroslar ve Kuzey Anadolu Dağları kıvrımları, linyit, bor, petrol yatakları, şiddetli volkanizma.',
        'Senozoik - Kuaterner (4. Zaman): Epirojenez (toptan yükselme), Boğazların oluşumu, Ege Denizi\'nin çökmesi ve buzul çağları.'
      ],
      goldenRule: 'TÜRKİYE BİR EPİROJENEZ VE KUATERNER ÜLKESİDİR: Anadolu arazisi 3. Zaman sonunda peneplenleşmiş (aşınıp düzleşmiş), 4. Zaman başında toptan yükselerek (epirojenez) günümüzdeki yüksek plato ve dağlık görünümünü almıştır.',
      osymTrap: 'ÖSYM TUZAĞI: Masif araziler 1. Zamandan kaldığı için oturmuş sert bloklardır; buralarda fay hatları geçmediği sürece tektonik deprem riski azdır.'
    ),
    LectureSection(
      title: 'İç Kuvvetler: Orojenez (Kıvrım ve Kırık Dağları)',
      type: LectureSectionType.comparison,
      imageAssetPath: 'assets/images/cografya/cografya_horst_graben_kirik.png',
      imageCaption: 'Şekil 2.3: Batı Anadolu Kırık Dağları: Horst ve Graben Sistemi Kesiti',
      leadText: 'Yan basınçlara uğrayan tortul tabakalar esnek yapıda ise KIVRILARAK, sert yapıda ise KIRILARAK dağ sıralarını oluşturur.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Kıvrım Dağları (Antiklinal - Senklinal)',
          wrong: 'Kuzey Anadolu Dağları: Kaçkar, Rize, Giresun, Canik, Küre, Ilgaz, Köroğlu, Bolu, Yıldız dağları.\nToros Dağları: Bey, Geyik, Bolkar, Aladağlar, Tahtalı, Binboğa, Güneydoğu Toroslar (Cilo/Reşko).',
          note: 'Esnek tortul tabakaların yükselen kubbe kısmına antiklinal, çukur kısmına senklinal denir.'
        ),
        ComparisonRow(
          correct: 'Kırık Dağları (Horst - Graben Sistemi)',
          wrong: 'Ege Bölgesi Horstları: Kaz Dağı, Madra Dağı, Yunt Dağı, Bozdağlar, Aydın Dağları, Menteşe Dağları.\nAkdeniz\'deki İstisna Horst: Nur (Amanos) Dağları.\nGraben Çöküntüleri: Bakırçay, Gediz, Küçük Menderes, Büyük Menderes, Amik Ovası.',
          note: 'Sert arazilerin kırılmasıyla yüksekte kalan bloklara horst, çöken çukurluklara graben denir.'
        ),
      ],
      goldenRule: 'EGE HORST-GRABEN KURALI: Kuzeyden güneye Ege horstları: Kaz, Madra, Yunt, Boz, Aydın, Menteşe Dağları\'dır. Aralarındaki grabenler ise sırasıyla Bakırçay, Gediz, Küçük Menderes ve Büyük Menderes oluklarıdır.',
      osymTrap: 'ÖSYM TUZAĞI: Akdeniz Bölgesi\'ndeki Nur (Amanos) Dağları KIVRIM DEĞİL, KIRIK (horst) dağıdır! Önündeki Amik Ovası ise bir grabendir.'
    ),
    LectureSection(
      title: 'Volkanizma ve Türkiye\'nin Volkanik Dağları',
      imageAssetPath: 'assets/images/cografya/cografya_volkan_konisi.png',
      imageCaption: 'Şekil 2.4: Volkan Konisi, Krater, Volkan Bacası ve Magma Odası Kesiti',
      type: LectureSectionType.ruleList,
      leadText: 'Yer kabuğunun kırık (fay) hatları boyunca magmanın yeryüzüne çıkması veya derinlerde katılaşmasıyla volkanik şekiller oluşur:',
      bulletPoints: [
        'Doğu Anadolu Volkan Kuşağı: Kuzeydoğu-güneybatı doğrultusunda bir fay hattı üzerinde sıralanmışlardır: Büyük Ağrı (5137 m ile Türkiye\'nin en yüksek zirvesi), Küçük Ağrı, Tendürek (kraterinde sıcak gazlar çıkar), Süphan ve Nemrut Dağı (tepesinde dünyanın 2. büyük krater gölü bulunur).',
        'İç Anadolu Volkan Kuşağı: Tuz Gölü\'nün güneydoğusunda fay boyunca uzanırlar: Erciyes (3917 m, tüfleri Kapadokya\'yı oluşturmuştur), Hasan Dağı, Melendiz Dağı, Karacadağ ve Karadağ.',
        'Güneydoğu Anadolu Karacadağ\'ı: Bazaltik lavların çok akıcı olması nedeniyle çevreye yayılarak geniş bir kalkan volkan (tabak volkan) şeklini almıştır. Türkiye\'nin en tipik kalkan volkanıdır.',
        'Manisa Kula Volkanları (Yanık Ülke): Türkiye\'nin en genç volkanik arazisidir. 4. Zaman\'da (Kuaterner) oluşmuştur. Çok sayıda cüruf konisi, lav akıntısı ve volkanik küller yer alır. Türkiye\'nin ilk UNESCO Tescilli Jeopark alanıdır.'
      ],
      goldenRule: 'VOLKANİK TOPRAKLAR ÇOK VERİMLİDİR: Volkanik araziler mineral yönünden zengin oldukları için tarımsal verimleri çok yüksektir (Bağcılık, patates vb.). Bu nedenle tehlikeli olmasına rağmen tarih boyunca sık nüfuslanmışlardır.',
      osymTrap: 'ÖSYM TUZAĞI: Türkiye\'de iki tane Karacadağ vardır: Biri İç Anadolu\'da (Konya), diğeri Güneydoğu Anadolu\'da (Diyarbakır-Şanlıurfa arası kalkan volkan) yer alır. İkisi de volkaniktir!'
    ),
    LectureSection(
      title: 'Türkiye Platoları Dağılış Haritası ve Ekonomik Faaliyetler',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_platolar_haritasi.png',
      imageCaption: 'Şekil 2.5: Türkiye\'nin Başlıca Platoları Haritası (Aşınım, Lav, Karstik ve Tabaka Düzlüğü Platoları)',
      type: LectureSectionType.overview,
      leadText: 'Akarsular tarafından derin vadilerle yarılmış, çevresine göre yüksekte kalan geniş düzlüklere plato denir:',
      bulletPoints: [
        'Aşınım Platoları: Çatalca - Kocaeli Platosu. Yükseltisi en az (ortalama 150-200 m), sanayi ve nüfusu en yoğun olan platodur.',
        'Lav (Volkanik) Platoları: Erzurum - Kars - Ardahan Platoları. Yükseltisi 2000 m\'nin üzerindedir. Yaz yağışları, çernezyom toprak ve gür alpin çayırları nedeniyle büyükbaş mera hayvancılığı yapılır.',
        'Karstik Platolar: Teke ve Taşeli Platoları (Akdeniz). Kireçtaşı çözünmesi sonucu tarım kısıtlıdır, nüfus seyrektir; kıl keçisi yetiştiriciliği öne çıkar.',
        'Yatay Duruşlu (Tabaka Düzlüğü) Platolar: İç Anadolu\'da Haymana (tiftik keçisi), Cihanbeyli (tahıl ambarı), Obruk, Bozok, Uzunyayla; Güneydoğu\'da Antep ve Urfa platoları; Ege\'de Yazılıkaya platosu.'
      ],
      goldenRule: 'PLATOLARIN EKONOMİK DAĞILIMI: Erzurum-Kars -> Büyükbaş mera hayvancılığı; İç Anadolu platoları -> Küçükbaş (koyun) ve buğday tarımı; Teke-Taşeli -> Kıl keçisi; Çatalca-Kocaeli -> Sanayi, ticaret ve finans.',
      osymTrap: 'ÖSYM TUZAĞI: Çatalca-Kocaeli platosunda tarım ve hayvancılık değil, yoğun sanayi ve kentleşme egemendir.'
    ),
    LectureSection(
      title: 'Türkiye\'nin Delta ve Tabanlı Ovaları Haritası',
      imageAssetPath: 'assets/images/cografya/cografya_turkiye_delta_ve_taban_ovalari_haritasi.png',
      imageCaption: 'Şekil 2.6: Türkiye\'nin Kıyı Delta Ovaları ve İç Bölge Tektonik/Tabanlı Ovaları Haritası',
      type: LectureSectionType.overview,
      leadText: 'Akarsuların taşıdığı verimli alüvyonları denize döküldükleri kıyılarda biriktirmesiyle delta ovaları, iç kesimlerde fay hatları boyunca biriktirmesiyle tabanlı ovalar oluşur:',
      bulletPoints: [
        'Karadeniz Deltaları: Çarşamba (Yeşilırmak) ve Bafra (Kızılırmak). Orta Karadeniz\'de dağlar geride olduğu için delta oluşumu kolaylaşmıştır.',
        'Ege Deltaları: Dikili (Bakırçay), Menemen (Gediz), Selçuk (Küçük Menderes), Balat (Büyük Menderes).',
        'Akdeniz Deltaları: Çukurova (Seyhan ve Ceyhan - Türkiye\'nin en büyük deltası) ve Silifke (Göksu).',
        'Karstik Ovalar (Polye): Tefenni, Acıpayam, Korkuteli, Kestel, Elmalı (TAKKE).',
        'Tektonik Ovalar: Fay hatları boyunca uzanan çöküntü ovalarıdır (Düzce, Bolu, Tokat Erbaa/Niksar, Amasya, Malatya, Elazığ, Amik vb.).'
      ],
      goldenRule: 'DELTA OLUŞUM ŞARTLARI: Kıyıda güçlü akıntı ve gelgit olmamalı, kıta sahanlığı geniş (deniz sığ) olmalı, akarsu bol alüvyon taşımalıdır.',
      osymTrap: 'ÖSYM TUZAĞI: Antalya çevresinde dağlar kıyıdan aniden yükseldiği ve falezler kıyıyı derinleştirdiği için delta ovası YOKTUR!'
    ),
    LectureSection(
      title: 'Akarsu Aşındırma Şekilleri: Vadiler (Çentik, Boğaz, Kanyon, Tabanlı)',
      imageAssetPath: 'assets/images/cografya/vadi_tipleri_semasi.png',
      imageCaption: 'Şekil 2.7: Türkiye\'de Akarsu Vadi Tipleri ve Enine Kesit Karşılaştırması',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'de yer şekillerini şekillendirmede 1 numaralı dış kuvvet akarsulardır:',
      bulletPoints: [
        'Çentik (V Şekilli / Kertik) Vadi: Yatak eğiminin ve akış hızının fazla olduğu kaynak kısımlarında akarsuyun derine doğru aşındırmasıyla oluşur. Doğu Anadolu ve Doğu Karadeniz\'de yaygındır.',
        'Boğaz (Yarma) Vadi: Dağ sıralarını enine yarıp geçen derin, dik yamaçlı vadilerdir. Doğal geçit görevi görür (Gülek Boğazı, Geyve Boğazı).',
        'Kanyon Vadi: Karstik arazilerde farklı dirençteki tabakaların aşınmasıyla oluşan basamaklı dik vadilerdir (Köprülü Kanyon, Saklıkent, Göksu, Ihlara).',
        'Geniş Tabanlı (Alüvyal Tabanlı) Vadi: Eğim ve akış hızının azaldığı yerlerde menderesler çizerek yanal aşındırma ile oluşan vadi tipidir (Ege Bölgesi).'
      ],
      goldenRule: 'VADİ TİPİ ENGEBE GÖSTERGESİDİR: Çentik ve boğaz vadiler hidroelektrik enerji potansiyelinin yüksek olduğunu; tabanlı vadiler ise akış hızının azaldığını ve tarım alanlarının genişlediğini gösterir.',
      osymTrap: 'ÖSYM TUZAĞI: Çentik vadide hidroelektrik potansiyel en yüksek iken, geniş tabanlı vadide menderesler nedeniyle hidroelektrik potansiyel çok düşüktür.'
    ),
    LectureSection(
      title: 'Akarsu Aşındırma Şekilleri: Boğaz (Yarma) Vadi ve Doğal Geçitler',
      imageAssetPath: 'assets/images/cografya/cografya_bogaz_vadi.png',
      imageCaption: 'Şekil 2.8: Boğaz (Yarma) Vadi Kesiti (Sıradağları Aşan Dik ve Derin Akarsu Yarıntısı)',
      type: LectureSectionType.ruleList,
      leadText: 'Sıradağları enine yarıp geçen derin vadiler Türkiye\'de kıyı ile iç kesimler arasında ulaşımı kolaylaştıran doğal geçitlerdir:',
      bulletPoints: [
        'Kuzey Anadolu Boğaz Vadileri: Kızılırmak, Yeşilırmak ve Sakarya nehirlerinin Karadeniz dağlarını yararak denize ulaştığı vadilerdir.',
        'Akdeniz Boğaz Vadileri: Göksu ve Seyhan nehirlerinin Torosları yardığı geçit oluklarıdır.',
        'Ulaşım ve Geçit Fonksiyonu: Karayolları ve demiryolları bu boğaz vadileri takip ederek dağlık arazileri kolaylıkla aşar.'
      ],
      goldenRule: 'BOĞAZ VADİ = DOĞAL ULAŞIM KORİDORU: Dağların kıyıya paralel uzandığı bölgelerde iç kesimlere demiryolu ve karayolu bağlantısı bu boğazlar sayesinde kurulur.',
      osymTrap: 'ÖSYM TUZAĞI: Boğaz vadiler akarsu tarafından açılmıştır; tektonik çöküntü (graben) ile karıştırılmamalıdır.'
    ),
    LectureSection(
      title: 'Akarsu Eğimi Azaldığında: Menderes ve Biriktirme Dinamiği',
      imageAssetPath: 'assets/images/cografya/cografya_menderes.png',
      imageCaption: 'Şekil 2.9: Menderes (Büklüm) Çizen Akarsu: Çarpak ve Yığınak Dinamiği, Tabanlı Ovalar',
      type: LectureSectionType.overview,
      leadText: 'Yatak eğiminin azaldığı tabanlı düzlüklerde akarsuyun büklümler çizerek akmasıdır:',
      bulletPoints: [
        'Menderes Çizen Akarsuyun Özellikleri: Yatak eğimi ve akış hızı azalır. Taşıma ve derine aşındırma gücü düşer. Akarsuyun boyu uzar. Yatak sürekli yer değiştirir.',
        'Aşınım ve Birikim Birlikte Görülür: Dış bükey kısımda (çarpak) aşındırma, iç bükey kısımda (yığınak) ise biriktirme gerçekleşir.',
        'En Yaygın Bölge: Ege Bölgesi (Büyük ve Küçük Menderes, Gediz, Bakırçay).'
      ],
      goldenRule: 'MENDERES HEM AŞINIM HEM BİRİKİM ŞEKLİDİR: Akarsuyun çarptığı taraf aşınırken, ters tarafında kum ve çakıl birikir.',
      osymTrap: 'ÖSYM TUZAĞI: Menderes çizen bir akarsuyun hidroelektrik enerji potansiyeli çok düşüktür; üzerinde rafting ve kano gibi akarsu sporları yapılamaz.'
    ),
    LectureSection(
      title: 'Akarsu Biriktirme Şekilleri: Birikinti Konisi ve Yelpazesi',
      imageAssetPath: 'assets/images/cografya/cografya_birikinti_konisi.png',
      imageCaption: 'Şekil 2.10: Birikinti Konisi ve Yelpazesi (Dağ Eteğinde Eğimin Azalmasıyla Alüvyon Yığılması)',
      type: LectureSectionType.ruleList,
      leadText: 'Dağ yamaçlarından hızla inen akarsu veya sel sularının, dağ eteğinde eğimin aniden azaldığı yerde taşıdığı malzemeleri yığmasıyla oluşur:',
      bulletPoints: [
        'Birikinti Konisi: Taş, kum ve çakılların yarım koni şeklinde birikmesidir.',
        'Birikinti Yelpazesi: Konilerin genişleyerek yelpaze şeklinde yayılmasıdır.',
        'Dağ Eteği Ovası: Yan yana birikinti yelpazelerinin birleşmesiyle dağ eteği boyunca uzanan ovalardır (Bursa Ovası en tipik örneğidir).'
      ],
      goldenRule: 'BİRİKTİRME İÇİN EĞİMİN AZALMASI ŞARTTIR: Akarsu ancak eğimi ve hızı azaldığı zaman taşıdığı yükü taşıyamaz hale gelir ve biriktirmeye başlar.',
      osymTrap: 'ÖSYM TUZAĞI: Birikinti konisi dağ eteğinde oluşur; denize dökülen yerde oluşan şekil ise deltadır.'
    ),
    LectureSection(
      title: 'Peribacaları ve Kapadokya Jeomorfolojisi',
      imageAssetPath: 'assets/images/cografya/cografya_peribacasi.png',
      imageCaption: 'Şekil 2.11: Peribacası (Volkanik Tüf Üzerinde Sert Bazalt Şapka - Nevşehir Kapadokya)',
      type: LectureSectionType.ruleList,
      leadText: 'Volkanik tüflerle kaplı arazide sel suları ve akarsuların aşındırmasıyla meydana gelen eşsiz yeryüzü şekilleridir:',
      bulletPoints: [
        'Oluşum Mekanizması: Erciyes ve Hasan Dağı\'ndan çıkan volkanik tüf tabakalarının üzerine sert bazalt lavları gelmiştir. Yağmur ve sel suları gevşek tüfleri aşındırırken, üstteki sert bazalt şapka altındaki tüfü korumuştur.',
        'Etkili Kuvvetler: İç kuvvet olarak VOLKANİZMA, dış kuvvet olarak AKARSU VE SEL SULARI birincil etkilidir. Rüzgar ise sadece dolaylı olarak havalandırdığı kum taneleriyle tüfleri aşındırmıştır.',
        'Görüldüğü Yerler: Nevşehir, Ürgüp, Göreme, Uçhisar (Kapadokya), ayrıca Manisa Kula ve Erzurum Narman (kırmızı peribacaları).'
      ],
      goldenRule: 'PERİBACASINDA BİRİNCİL GÜÇ AKARSUDUR: Peribacasını rüzgar değil; sel suları ve akarsular oluşturur!',
      osymTrap: 'ÖSYM TUZAĞI: Sınavda peribacası sorulduğunda rüzgarı birincil etken olarak işaretlemek en yaygın tuzaktır!'
    ),
    LectureSection(
      title: 'Peribacası Oluşum Evreleri ve Tabaka Kesiti Şeması',
      imageAssetPath: 'assets/images/cografya/peribacasi_olusum_semasi.png',
      imageCaption: 'Şekil 2.12: Peribacası Oluşum Şeması (Volkanik Tüf, Sert Bazalt Şapka ve Sel Oyulması Kesiti)',
      type: LectureSectionType.overview,
      leadText: 'Peribacalarının yatay tabaka kesiti ve aşınım aşamaları şemada detaylandırılmıştır:',
      bulletPoints: [
        'Aşama 1: Volkanik patlama ile tüf ve bazalt tabakalarının üst üste birikmesi.',
        'Aşama 2: Yüzeysel sel sularının çatlakları derinleştirerek dik yarıklar açması.',
        'Aşama 3: Kolay aşınan tüflerin süpürülmesi ve şapkalı peribacası sütunlarının belirmesi.',
        'Aşama 4: Şapkanın düşmesiyle sütunun hızla aşınıp yok olması.'
      ],
      goldenRule: 'ŞAPKA = SERT KAYAÇ: Şapkanın varlığı bazalt veya ignimbrit gibi sert volkanik kayalardan kaynaklanır.',
      osymTrap: 'ÖSYM TUZAĞI: Erzurum Narman\'daki peribacaları volkanik değil, tortul (sedimanter) arazide sel aşındırmasıyla oluşmuştur.'
    ),
    LectureSection(
      title: 'Kurak Bölge Şekilleri: Kırgıbayır (Badlands)',
      imageAssetPath: 'assets/images/cografya/cografya_kirgibayir_badlands.png',
      imageCaption: 'Şekil 2.13: Kırgıbayır / Badlands (Bitki Örtüsünden Yoksun Eğimli Arazide Sel Yarıkları)',
      type: LectureSectionType.ruleList,
      leadText: 'Bitki örtüsünün bulunmadığı, killi ve gevşek yapılı eğimli yamaçların yağmur ve sel suları tarafından yarılmasıyla oluşan engebeli çorak arazilerdir:',
      bulletPoints: [
        'Oluşum Ortamı: Kurak ve yarı kurak iklim, sağanak yağışlar ve bitki örtüsünün tahrip edildiği sahalar.',
        'Türkiye\'deki Örnekleri: İç Anadolu (Nevşehir, Aksaray, Çankırı, Ankara Nallıhan) ve Güneydoğu Anadolu.',
        'Ulaşım ve Tarım: Üzerinde tarım yapılamaz, yürümek ve ulaşım sağlamak son derece güçtür.'
      ],
      goldenRule: 'KIRGIBAYIR BİTKİ YOKSUNLUĞU GÖSTERGESİDİR: Bitki örtüsü tahrip edilen yerlerde yüzeysel akış toprağı dilim dilim yararak kırgıbayıra dönüştürür.',
      osymTrap: 'ÖSYM TUZAĞI: Kırgıbayır rüzgar aşınım şekli DEĞİLDİR; sağanak sel sularının aşındırma şeklidir.'
    ),
    LectureSection(
      title: 'Dalga Aşındırma Şekilleri: Falez (Yalıyar)',
      imageAssetPath: 'assets/images/cografya/cografya_falez_yaliyar.png',
      imageCaption: 'Şekil 2.14: Falez / Yalıyar (Dik Kıyılarda Dalga Oyulması ile Oluşan Uçurum Kesiti)',
      type: LectureSectionType.overview,
      leadText: 'Dağların denize paralel ve çok yakın uzandığı kıyılarda, dalgaların kıyı tabanını oyması ve üstteki kütlenin çökmesiyle oluşan dik kıyı uçurumlarıdır:',
      bulletPoints: [
        'Oluşum Şartları: Kıyı derin olmalı, kıta sahanlığı dar olmalı, dağlar kıyıdan itibaren hemen dik yükselmelidir.',
        'Türkiye\'de En Çok Görüldüğü Yerler: Doğu ve Batı Karadeniz kıyıları ile Akdeniz\'de Teke ve Taşeli (Antalya falezleri) kıyıları.',
        'Görülmediği Kıyılar: Kıta sahanlığı geniş olan Ege kıyılarında ve delta ovalarının bulunduğu Samsun ile Adana kıyılarında falez görülmez.'
      ],
      goldenRule: 'FALEZ DERİN KIYIDA OLUR: Dağlar kıyıya dik uzanıyorsa (Ege) veya delta varsa (Çukurova, Bafra) falez oluşamaz!',
      osymTrap: 'ÖSYM TUZAĞI: Karadeniz\'in her yerinde falez yoktur; Orta Karadeniz\'de (Samsun Çarşamba ve Bafra deltalarında) kıyı sığ olduğu için falez bulunmaz.'
    ),
    LectureSection(
      title: 'Dalga Biriktirme Şekilleri: Kıyı Kordonu ve Lagün (Deniz Kulağı)',
      imageAssetPath: 'assets/images/cografya/cografya_kiyi_kordonu_lagun.png',
      imageCaption: 'Şekil 2.15: Kıyı Kordonu, Lagün (Kıyı Set Gölü) ve Kıyı Oku Oluşumu',
      type: LectureSectionType.ruleList,
      leadText: 'Dalga ve akıntıların sığ kıyılarda taşıdığı kum ve çakılları biriktirmesiyle oluşan birikim şekilleri:',
      bulletPoints: [
        'Kıyı Oku ve Kordonu: Bir ucu karaya bağlı diğer ucu denize doğru uzanan kum şeritleridir.',
        'Lagün (Kıyı Set Gölü): Kıyı kordonunun bir koy veya körfezin önünü tamamen kapatmasıyla denizden ayrılan göllerdir.',
        'Marmara Lagünleri: Büyükçekmece, Küçükçekmece ve Terkos (Durusu) gölleri.',
        'Çukurova Lagünleri: Akyayan ve Ağyatan lagün gölleri.'
      ],
      goldenRule: 'LAGÜN SIĞ KIYIDA OLUŞUR: Dalgaların biriktirme yapabilmesi için denizin sığ ve dalga enerjisinin yatışmış olması gerekir.',
      osymTrap: 'ÖSYM TUZAĞI: Büyükçekmece ve Küçükçekmece tektonik göl değil; kıyı set (lagün) gölüdür.'
    ),
    LectureSection(
      title: 'Türkiye\'den Tipik Lagün Örneği: Fethiye Ölüdeniz',
      imageAssetPath: 'assets/images/cografya/cografya_lagun_oludeniz.png',
      imageCaption: 'Şekil 2.16: Muğla Fethiye Ölüdeniz - Türkiye\'nin En Ünlü Doğal Lagün (Kıyı Set) Havzası',
      type: LectureSectionType.overview,
      leadText: 'Muğla\'nın Fethiye ilçesinde yer alan Ölüdeniz, dalgaların getirdiği kıyı kordonunun koy ağzını kapatmasıyla oluşmuş dünyanın en berrak lagünlerinden biridir:',
      bulletPoints: [
        'Durgun Su Yapısı: Dış denizdeki dalgalardan kıyı kordonu sayesinde tamamen korunur; en fırtınalı günlerde bile havuz gibi dingindir.',
        'Dip Kaynakları: Deniz altından çıkan soğuk tatlı su kaynakları ve gelgit akıntılarıyla suyu sürekli temiz kalır.',
        'Turizm Değeri: Türkiye\'nin sembolik doğa turizmi ve yamaç paraşütü merkezidir.'
      ],
      goldenRule: 'ÖLÜDENİZ BİR LAGÜNDÜR: ÖSYM sınavlarında kıyı set göllerine en seçkin görsel ve coğrafi örnek Fethiye Ölüdeniz\'dir.',
      osymTrap: 'ÖSYM TUZAĞI: Ölüdeniz bir krater gölü değil, dalga biriktirmesi sonucu oluşan bir kıyı set (lagün) gölüdür.'
    ),
    LectureSection(
      title: 'Türkiye Kıyı Tipleri: Enine Kıyı Tipi (Ege Kıyıları)',
      imageAssetPath: 'assets/images/cografya/kiyi_tipleri_semasi.png',
      imageCaption: 'Şekil 2.17: Türkiye\'de Görülen Başlıca Kıyı Tipleri ve Genel Özellikleri Atlası',
      type: LectureSectionType.ruleList,
      leadText: 'Dağların kıyı çizgisine dik olarak uzandığı yerlerde görülen kıyı tipidir:',
      bulletPoints: [
        'Görüldüğü Bölge: Ege Bölgesi (Edremit ile Kuşadası arası kıyılar).',
        'Kıyı Özellikleri: Kıyı oldukça girintili-çıkıntılıdır. Doğal liman, koy, körfez ve ada sayısı çok fazladır.',
        'Kıta Sahanlığı (Şelf Alanı): Çok geniştir; deniz aniden derinleşmez.',
        'Hinterlant (Art Bölge): Limanların iç kesimlerle ulaşım ağı geniştir, graben ovaları boyunca demiryolu ve karayolu kolaylıkla iç kısımlara uzanır.',
        'Denizel Etki: Denizel nemli hava graben olukları boyunca 150-200 km içeriye kadar sokulabilir.'
      ],
      goldenRule: 'ENİNE KIYIDA ULAŞIM KOLAYDIR: Dağlar kıyıya dik olduğu için kıyı ile iç kesim arasında geçitlere ihtiyaç duyulmaz.',
      osymTrap: 'ÖSYM TUZAĞI: Ege\'de Menteşe Yöresi (Muğla) enine kıyı DEĞİLDİR; dağlar kıyıya paralel uzandığı için ria ve boyuna karakter taşır.'
    ),
    LectureSection(
      title: 'Türkiye Kıyı Tipleri: Boyuna Kıyı Tipi (Karadeniz ve Akdeniz)',
      imageAssetPath: 'assets/images/cografya/cografya_boyuna_kiyi_tipi.png',
      imageCaption: 'Şekil 2.18: Boyuna Kıyı Tipi (Dağların Kıyı Çizgisine Paralel Uzanışı, Falezler ve Dar Şelf)',
      type: LectureSectionType.overview,
      leadText: 'Dağ sıralarının kıyı çizgisine paralel uzandığı kıyılarda görülen kıyı tipidir:',
      bulletPoints: [
        'Görüldüğü Kıyılar: Karadeniz ve Akdeniz kıyıları.',
        'Kıyı Çizgisi: Düz ve sadedir; koy, körfez, doğal liman ve ada sayısı çok azdır.',
        'Falezler: Dağlar kıyıdan yükseldiği için falez (yalıyar) oluşumu yaygındır.',
        'Kıta Sahanlığı: Dardır; kıyıdan birkaç adım sonra deniz aniden derinleşir.',
        'Hinterlant ve Geçitler: Limanların art bölgesi dardır; iç kesimlerle ulaşım zor ve maliyetlidir, sadece Zigana, Kop, Gülek, Belen gibi geçitlerle sağlanır.',
        'İklim Bariyeri: Nemli denizel etki iç kesimlere giremez, dağ yamaçlarında orografik (yamaç) yağışlar oluşur.'
      ],
      goldenRule: 'BOYUNA KIYIDA HİNTERLANT DARDIR: Trabzon Limanı Zigana-Kop geçitleri olmasa iç kesime bağlanamazdı; Sinop ise doğal liman olmasına rağmen arkasındaki Küre Dağları yüzünden gelişememiştir.',
      osymTrap: 'ÖSYM TUZAĞI: Sinop doğal bir limandır ancak boyuna kıyı özelliği ve dağların aşılmazlığı (dar hinterlant) nedeniyle işlek bir ticaret limanı olamamıştır.'
    ),
    LectureSection(
      title: 'Türkiye Kıyı Tipleri: Ria Tipi Kıyılar (Boğazlar ve Haliç)',
      imageAssetPath: 'assets/images/cografya/cografya_ria_kiyi_tipi.png',
      imageCaption: 'Şekil 2.19: Ria Tipi Kıyı (Eski Akarsu Vadilerinin Deniz Suları Altında Boğulması Şeması)',
      type: LectureSectionType.ruleList,
      leadText: '4. Jeolojik Zaman\'da deniz seviyesinin yükselmesiyle eski akarsu vadilerinin sular altında kalarak boğulması sonucu oluşan kıyı tipidir:',
      bulletPoints: [
        'Türkiye\'deki Başlıca Örnekleri: İstanbul Boğazı, Çanakkale Boğazı ve Haliç (Altın Boynuz). Ayrıca Muğla Menteşe/Gökova kıyıları.',
        'Oluşum Kökeni: Kuaterner\'deki epirojenik çökmeler ve buzulların erimesiyle yükselen deniz sularının eski vadi tabanlarını basmasıdır.'
      ],
      goldenRule: 'BOĞAZLAR BİRER RİA KIYIDIR: İstanbul ve Çanakkale boğazları eskiden birer akarsu vadisiydi; Egeid karası çöküp deniz suları basınca boğularak Ria tipi kıyıya dönüşmüştür.',
      osymTrap: 'ÖSYM TUZAĞI: İstanbul\'daki Haliç okyanustaki gelgit haliçi DEĞİLDİR; Ria tipi kıyıdır.'
    ),
    LectureSection(
      title: 'Türkiye Fiziki Yer Şekilleri, Dağlar ve Jeomorfoloji Atlası',
      type: LectureSectionType.overview,
      leadText: 'Türkiye\'nin fiziki dağ sıraları, orojenik kıvrımlar, volkanik zirveler ve çöküntü havzaları harita üzerinde detaylandırılmıştır.',
      mapData: LectureMapData(
        title: 'TÜRKİYE DAĞLAR, YER ŞEKİLLERİ VE JEOMORFOLOJİ ATLASI',
        subtitle: 'Kıvrım Kuşakları, Horst-Graben Sistemleri, Volkanik Zirveler ve Jeomorfoloji',
        mapId: 'cografya_daglar_map',
        imageAssetPath: 'assets/images/cografyaharita/cografyaharita_daglar.jpg',
        mapSource: 'cografyaharita.com - Türkiye Dağlar ve Jeomorfoloji Haritası (Master HD)',
        legends: [
          MapLegendItem(symbol: '▲', label: 'Kıvrım Dağları (Antiklinal / Senklinal)', description: 'Kuzey Anadolu Dağları (Kaçkar, Canik, Küre, Ilgaz, Köroğlu) ve Toros Kuşağı (Bey, Bolkar, Aladağlar, Cilo).'),
          MapLegendItem(symbol: '■', label: 'Kırık Dağları (Horst - Graben)', description: 'Ege kıyılarında Kaz, Madra, Yunt, Bozdağlar, Aydın, Menteşe Dağları ile Akdeniz\'de Nur (Amanos) Dağları.'),
          MapLegendItem(symbol: '🌋', label: 'Volkanik Dağlar & Zirveler', description: 'Doğu Anadolu (Ağrı, Süphan, Tendürek, Nemrut), İç Anadolu (Erciyes, Hasan, Melendiz, Karadağ, Karacadağ) ve Güneydoğu (Karacadağ kalkan volkanı).'),
          MapLegendItem(symbol: '🏞️', label: 'Karstik Aşınım ve Aşınım Şekilleri', description: 'Toroslar kuşağı (Teke ve Taşeli platoları, polyeler, uvalalar, dolinler, obruklar ve mağaralar).'),
          MapLegendItem(symbol: '🌾', label: 'Delta ve Kıyı Ovaları', description: 'Çukurova (Seyhan-Ceyhan), Bafra (Kızılırmak), Çarşamba (Yeşilırmak), Silifke (Göksu), Balat (B. Menderes), Menemen (Gediz).')
        ],
        points: [
          MapFrontItem(
            name: 'Büyük Ağrı Dağı (5.137 m)',
            category: 'Türkiye\'nin En Yüksek Zirvesi',
            commander: 'Doğu Anadolu / Ağrı - Iğdır',
            keyEvent: 'Türkiye\'nin ve Avrupa\'nin en yüksek doruğudur. Sönmüş stratovolkan tipindedir. Zirvesinde 4.000 metrenin üzerinde Türkiye\'nin en geniş takke buzulu yer alır.',
            outcome: 'ÖSYM Çıkmış Soru: Türkiye\'nin en yüksek doruğu olup üzerinde güncel takke buzulu barındırır.'
          ),
          MapFrontItem(
            name: 'Cilo (Reşko / Uludoruk) Dağı (4.135 m)',
            category: 'En Yüksek Kıvrım Zirvesi',
            commander: 'Güneydoğu Toroslar / Hakkari',
            keyEvent: 'Alp-Himalaya orojeneziyle yükselmiş Türkiye\'nin 2. en yüksek zirvesidir. Üzerinde Türkiye\'nin en büyük vadi buzulunu (İsbir Buzulu) barındırır.',
            outcome: 'ÖSYM Püf Noktası: Volkanik DEĞİL, kıvrım (orojenik) kökenli en yüksek zirvemiz Cilo\'dur.'
          ),
          MapFrontItem(
            name: 'Kula Tepeleri (Yanık Ülke - Katakekaumene)',
            category: 'En Genç Volkanizma & Jeopark',
            commander: 'Ege / Manisa (Kula)',
            keyEvent: '4. Jeolojik Zaman\'da (Kuvaterner) oluşmuş Türkiye\'nin en genç volkanik konileridir (cüruf konileri). UNESCO tescilli Türkiye\'nin ilk küresel jeoparkıdır.',
            outcome: 'ÖSYM Çıkmış Soru: Türkiye\'nin en genç volkan sahası ve UNESCO tescilli jeoparkı Kula\'dır.'
          ),
          MapFrontItem(
            name: 'Erciyes Dağı (3.917 m) & Hasan Dağı',
            category: 'İç Anadolu Volkan Kuşağı',
            commander: 'İç Anadolu / Kayseri - Aksaray',
            keyEvent: '3. Zaman\'da patlayan volkanik tüf ve bazalt örtüleri, rüzgar ve akarsu aşındırmasıyla Kapadokya peri bacalarının ana hammaddesini meydana getirmiştir.',
            outcome: 'ÖSYM Sorusu: Peri bacaları oluşumunda iç kuvvet (volkanizma) ile dış kuvvet (akarsu/sel suları) birlikte etkilidir.'
          ),
          MapFrontItem(
            name: 'Nur (Amanos) Dağları & Amik Ovası',
            category: 'Ege Dışındaki Horst-Graben',
            commander: 'Akdeniz / Hatay',
            keyEvent: 'Ege Bölgesi dışındaki tek kırık dağıdır (Horst). Nur Dağları horst, hemen altındaki Amik Ovası ise graben (çöküntü çukurluğu) alanıdır.',
            outcome: 'ÖSYM Soru Tuzağı: Ege dışında horst-graben yapısına sahip tek dağ sistemi Nur (Amanos) Dağları\'dır.'
          ),
          MapFrontItem(
            name: 'Çukurova & Bafra-Çarşamba Deltaları',
            category: 'Kıyı ve Delta Ovaları',
            commander: 'Akdeniz (Adana) & Karadeniz (Samsun)',
            keyEvent: 'Kıta sahanlığının geniş olduğu, gelgit genliğinin az olduğu ve akarsuların bol alüvyon taşıdığı sığ kıyılarda meydana gelmiş en verimli tarım havzalarımızdır.',
            outcome: 'ÖSYM Sorusu: Çukurova Türkiye\'nin en büyük kıyı delta ovasıdır (Seyhan ve Ceyhan nehirleri oluşturmuştur).'
          )
        ],
        historicalNote: '📌 ÖSYM YERŞEKİLLERİ & DAĞLAR KRİTİK SINAV NOTLARI:\n'
            '1. Dağların Kıyıya Uzanış Yönü: Karadeniz ve Akdeniz\'de dağlar kıyıya PARALEL uzanır (boyuna kıyı, falez çok, kıta sahanlığı dar, iç kesimlerle ulaşım geçitlerle sağlanır). Ege\'de dağlar kıyıya DİK uzanır (enine kıyı, koy-körfez ve doğal liman çok, kıta sahanlığı geniştir).\n'
            '2. Kıvrım Dağları: Kaçkar, Küre, Ilgaz, Bolkar, Aladağlar, Cilo.\n'
            '3. Kırık Dağları (Horstlar): Kaz, Madra, Yunt, Boz, Aydın, Menteşe, Nur Dağları.\n'
            '4. Volkanik Dağlar: Ağrı, Süphan, Tendürek, Nemrut (Doğu Anadolu); Erciyes, Melendiz, Hasan, Karadağ, Karacadağ (İç Anadolu); Karacadağ (Güneydoğu); Kula (Ege).'
      )
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Yerşekilleri ve Dağlar',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'ÖSYM formatında hazırlanmış çözümlü deneme sorusu ile konuyu pekiştirin:',
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıda verilen dağlardan hangisinin oluşum kökeni diğerlerinden FARKIDIR?',
          options: [
            'A) Kaçkar Dağları',
            'B) Bolkar Dağları',
            'C) Madra Dağı',
            'D) Aladağlar',
            'E) Giresun Dağları'
          ],
          correctIndex: 2,
          explanation: 'Kaçkar, Bolkar, Aladağlar ve Giresun dağları esnek tortul tabakaların yan basınçlarla kıvrılması sonucu oluşan KIVRIM dağlarıdır. Madra Dağı ise Ege Bölgesi\'nde sert kütlelerin kırılmasıyla oluşan bir KIRIK (Horst) dağıdır.',
          ruleTag: 'Kıvrım vs Kırık Dağları'
        )
      ]
    ),
  ]
);

final LectureTopic cografyaKonu2 = konu2YersekilleriJeoloji;
