import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu9XxYyBaslariOsmanli = LectureTopic(
  id: 'tarih_xx_yy_baslari_osmanli',
  courseId: 'tarih',
  order: 9,
  title: 'XX. Yüzyıl Başlarında Osmanlı Devleti',
  subtitle: 'Fikir Akımları, Trablusgarp Savaşı, Uşi, I. ve II. Balkan Savaşları & Babıali Baskını',
  icon: Icons.history_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 81 - 90',
  startTestNum: 81,
  endTestNum: 90,
  estimatedMinutes: 65,
  sections: [
    // BÖLÜM 1: XX. YÜZYIL BAŞLARINDA OSMANLI VE FİKİR AKIMLARI
    LectureSection(
      title: '1. XX. Yüzyıl Başlarında Genel Durum & Fikir Akımları',
      type: LectureSectionType.overview,
      leadText: 'Dağılmayı önlemek amacıyla Osmanlı aydınları ve devlet adamları tarafından çeşitli fikir akımları (kurtuluş reçeteleri) savunulmuştur.',
      bulletPoints: [
        '1. Osmanlıcılık (İttihad-ı Anasır):\n'
            '  • Din, dil, ırk ve mezhep farkı gözetmeksizin sınır içindeki herkesi "Osmanlı vatandaşı" sayarak eşit haklar verme düşüncesidir.\n'
            '  • Temsilcileri: Namık Kemal, Ziya Paşa, Şinasi, Mithat Paşa.\n'
            '  • Uygulamalar: Tanzimat Fermanı, Islahat Fermanı, I. Meşrutiyet.\n'
            '  • İflası: Balkan Savaşları\'nda Hristiyan tebaanın Osmanlı\'ya isyan edip bağımsız olmasıyla çökmüştür.',
        '2. İslamcılık (Ümmetçilik / Panislamizm):\n'
            '  • Dünya Müslümanlarını Osmanlı Halifesi\'nin etrafında toplamayı hedefleyen akımdır.\n'
            '  • Temsilcileri: II. Abdülhamit (devlet politikası yapmıştır), Mehmed Âkif Ersoy, Said Halim Paşa, Cevdet Paşa.\n'
            '  • Uygulamalar: Hicaz Demiryolu, Darülaceze, Hamidiye Alayları.\n'
            '  • İflası: I. Dünya Savaşı\'nda Hicaz Emiri Şerif Hüseyin\'in İngilizlerle işbirliği yaparak Osmanlı\'ya karşı isyan etmesiyle çökmüştür.',
        '3. Türkçülük (Pantürkizm / Turancılık):\n'
            '  • Dili, dini, soyu bir olan tüm Türkleri bir bayrak altında toplamayı veya Türk milli kültürünü yüceltmeyi hedefleyen akımdır.\n'
            '  • Temsilcileri: Ziya Gökalp, Yusuf Akçura (Üç Tarz-ı Siyaset), Gaspıralı İsmail, Mehmet Emin Yurdakul.\n'
            '  • Uygulamalar: II. Meşrutiyet devrinde İttihat ve Terakki\'nin temel ideolojisi olmuş; KURTULUŞ SAVAŞI\'NIN KAZANILMASINDA VE TÜRKİYE CUMHURİYETİ\'NİN KURULUŞUNDA BAŞARILI OLAN TEK FİKİR AKIMIDIR.',
        '4. Batıcılık (Garpçılık):\n'
            '  • Kurtuluşun ancak Batı\'nın bilim, teknik, yönetim ve yaşam tarzını eksiksiz benimsemekle mümkün olduğunu savunur.\n'
            '  • Temsilcileri: Tevfik Fikret, Celal Nuri, Abdullah Cevdet. Cumhuriyet inkılaplarının esin kaynağı olmuştur.',
        '5. Âdem-i Merkeziyetçilik:\n'
            '  • Yerinden yönetim, eyalet sistemi ve özel teşebbüsü savunmuştur. Temsilcisi: Prens Sabahattin.',
      ],
      goldenRule: '💡 FİKİR AKIMLARININ SONUCU:\n'
          'Osmanlıcılık Balkan Savaşlarıyla, İslamcılık I. Dünya Savaşı Hicaz Cephesiyle çökmüş; TÜRKÇÜLÜK ise Kurtuluş Savaşı\'nı zafere ulaştırmıştır.',
    ),

    // BÖLÜM 2: TRABLUSGARP SAVAŞI (1911 - 1912)
    LectureSection(
      title: '2. Trablusgarp Savaşı (1911 - 1912) & Uşi Antlaşması',
      type: LectureSectionType.ruleList,
      leadText: 'Mustafa Kemal\'in sömürgeciliğe karşı ilk askeri zaferlerini kazandığı ve Osmanlı\'nın Kuzey Afrika\'daki son toprağını kaybettiği savaştır.',
      bulletPoints: [
        'Savaşın Nedenleri:\n'
            '  • Siyasi birliğini geç tamamlayan İtalya\'nın sanayisi için sömürge ve hammadde arayışına girmesi.\n'
            '  • Trablusgarp\'ın (Libya) İtalya\'ya coğrafi yakınlığı; Osmanlı Devleti\'nin burayı koruyacak askeri ve donanma gücünün olmaması; Avrupalı devletlerin İtalya\'yı serbest bırakması (Racconigi Anlaşması).',
        'Savaşın Gelişimi ve Gönüllü Subaylar:\n'
            '  • Donanması Haliç\'te çürütülmüş, Mısır da İngiliz işgalinde olduğu için Osmanlı karadan ve denizden asker gönderememiştir.\n'
            '  • Genç ve vatanperver subaylar gizlice Trablusgarp\'a gitmiş ve yerli Bedevi halkı İtalyanlara karşı teşkilatlandırmıştır:\n'
            '    - MUSTAFA KEMAL: "Gazeteci Şerif Bey" takma adıyla gitmiş; DERNE VE TOBRUK\'ta İtalyan ordusunu bozguna uğratmıştır (MUSTAFA KEMAL\'İN TARİHTEKİ İLK ASKERİ BAŞARISI!).\n'
            '    - ENVER BEY: "Kuyumcu Hamdi" takma adıyla Bingazi\'de başarılı direniş göstermiştir.',
        'Savaşın Sonu: 1912 UŞİ (Ouchy) ANTLAŞMASI:\n'
            '  • İtalyanlar Çanakkale Boğazı\'nı ablukaya alıp On İki Ada\'yı işgal etmiş; aynı anda Balkan Savaşı patlak verince Osmanlı barış istemek zorunda kalmıştır.\n'
            '  • Maddeleri:\n'
            '    - 1. Trablusgarp ve Bingazi İtalya\'ya bırakıldı. OSMANLI DEVLETİ KUZEY AFRİKA\'DAKİ SON TOPRAK PARÇASINI DA KAYBETTİ.\n'
            '    - 2. Trablusgarp halkı dini yönden Osmanlı Halifesine bağlı kalacaktı.\n'
            '    - 3. On İki Ada, Balkan Savaşı bitene kadar GEÇİCİ OLARAK İtalya\'nın korumasına bırakıldı (İtalya bir daha bu adaları geri vermemiştir).\n'
            '  • Not: Savaş sırasında tarihte İLK KEZ SAVAŞ UÇAĞI İtalyanlar tarafından Trablusgarp\'ta kullanılmıştır.',
      ],
      goldenRule: '💡 MUSTAFA KEMAL\'İN İLK ASKERİ BAŞARISI = DERNE VE TOBRUK:\n'
          'Mustafa Kemal Paşa\'nın sömürgeciliğe karşı kazandığı ilk zafer Trablusgarp Derne-Tobruk muharebeleridir.',
      imageAssetPath: 'assets/images/tarih/tarih_trablusgarp_ve_balkan_infografik.png',
      imageCaption: 'Trablusgarp Savaşı ve Balkan Savaşları Karşılaştırmalı İnfografiği (Uşi, Midye-Enez & Bâb-ı Âli)',
    ),

    // BÖLÜM 3: I. BALKAN SAVAŞI (1912 - 1913) VE BABIALİ BASKINI
    LectureSection(
      title: '3. I. Balkan Savaşı (1912 - 1913) & Bâb-ı Âli Baskını',
      type: LectureSectionType.overview,
      leadText: 'Milliyetçilik akımı ve Rusya\'nın kışkırtmasıyla 4 Balkan devletinin birleşerek Osmanlı\'ya karşı açtığı yıkıcı savaştır.',
      bulletPoints: [
        'Savaşan Devletler ve Nedenleri:\n'
            '  • Savaşanlar: BULGARİSTAN, YUNANİSTAN, SIRBİSTAN ve KARADAĞ vs. OSMANLI DEVLETİ.\n'
            '  • Savaşı başlatan ilk devlet: KARADAĞ.\n'
            '  • Nedenler: Fransız İhtilali milliyetçilik etkisi; Rusya\'nın Panslavizm politikası; Türkleri Balkanlardan tamamen atma arzusu.',
        'Osmanlı\'nın Ağır Hezimetinin Nedenleri:\n'
            '  • 1. Savaştan hemen önce ordu gençleştirme bahanesiyle 65.000 tecrübeli askerin terhis edilmiş olması.\n'
            '  • 2. Ordunun içine PARTİZANLIK VE SİYASETİN girmesi (İttihatçı ve İtilafçı subayların birbiriyle çekişmesi).\n'
            '  • 3. Dört ayrı cephede birden savaşılması; haberleşme ve lojistik iflası.',
        'Savaşın Seyri ve Felaket Sonuçları:\n'
            '  • Bulgarlar Çatalca\'ya kadar ilerledi; Selanik tek kurşun atılmadan Yunanlılara teslim edildi; Edirne (Şükrü Paşa) kahramanca direndikten sonra düştü.\n'
            '  • ARNAVUTLUK BAĞIMSIZLIĞINI İLAN ETTİ: Osmanlı\'dan ayrılan EN SON BALKAN DEVLETİ Arnavutluk\'tur.\n'
            '  • 1913 LONDRA ANTLAŞMASI imzalandı. Osmanlı Devleti MİDYE-ENEZ HATTI\'NIN batısındaki tüm Rumeli topraklarını (Edirne ve Kırklareli dahil) kaybetti.',
        'BÂB-I ÂLİ BASKINI (23 Ocak 1913):\n'
            '  • I. Balkan Savaşı\'ndaki hezimeti ve Edirne\'nin elden çıkmasını bahane eden Enver Bey ve İttihatçılar hükümet binasını (Bâb-ı Âli) silahla bastı.\n'
            '  • Sadrazam Kâmil Paşa silah zoruyla istifa ettirildi; yerine Mahmut Şevket Paşa getirildi.\n'
            '  • ÖNEMİ: TÜRK TARİHİNDEKİ İLK HÜKÜMET DARBESİDİR. İttihat ve Terakki iktidarı tamamen ele geçirmiştir.',
      ],
    ),

    // BÖLÜM 4: II. BALKAN SAVAŞI (1913) VE BARIŞ ANTLAŞMALARI
    LectureSection(
      title: '4. II. Balkan Savaşı (1913) & Paylaşım Antlaşmaları',
      type: LectureSectionType.formula,
      leadText: 'Balkan devletlerinin I. Balkan Savaşı\'nda en büyük payı alan Bulgaristan\'a saldırmasıyla patlak veren iç savaştır.',
      bulletPoints: [
        'Savaşın Nedeni ve Gelişimi:\n'
            '  • I. Balkan Savaşı\'nda Bulgaristan\'ın Ege Denizi\'ne kadar inip en büyük payı alması diğerlerini kıskandırdı.\n'
            '  • YUNANİSTAN, SIRBİSTAN, KARADAĞ ve I. SAVAŞTA OLMAYAN ROMANYA birleşerek Bulgaristan\'a saldırdı.\n'
            '  • UYARI: ROMANYA I. Balkan Savaşı\'nda yoktur; II. Balkan Savaşı\'na katılmıştır!',
        'Osmanlı\'nın Fırsatı Değerlendirmesi:\n'
            '  • Bulgar ordularının diğer devletlerle savaşmasını fırsat bilen Osmanlı ordusu (Enver Paşa) taarruza geçti.\n'
            '  • EDİRNE VE KIRKLARELİ (Doğu Trakya) savaşsız geri alındı. Enver Paşa "EDİRNE FATİHİ" unvanını kazandı.\n'
            '  • Mustafa Kemal bu savaşta Bolayır Kolordusu Kurmay Başkanı olarak görev yapmıştır (Bu sayede Gelibolu yarımadasını karış karış tanımış, Çanakkale Savaşları\'nda büyük avantaj sağlamıştır).',
        'İmzalanan Antlaşmalar:\n'
            '  • 1. Bükreş Antlaşması (1913): Balkan devletleri kendi arasında imzaladı; Bulgaristan toprak kaybetti.\n'
            '  • 2. 1913 İSTANBUL ANTLAŞMASI (Osmanlı - Bulgaristan): Edirne, Kırklareli ve Dimetoka Osmanlı\'da kaldı; Dedeağaç Bulgaristan\'a bırakıldı. MERİÇ NEHRİ iki devlet arasında sınır oldu. Bulgaristan\'daki Türklere azınlık hakları tanındı.\n'
            '  • 3. 1913 ATİNA ANTLAŞMASI (Osmanlı - Yunanistan): Girit, Yanya ve Selanik Yunanistan\'a bırakıldı; Meriç nehri sınır oldu. Yunanistan\'daki Türklerin hakları güvenceye alındı.\n'
            '  • 4. 1914 İstanbul Antlaşması (Osmanlı - Sırbistan): Sırbistan\'da kalan Türklerin mülkiyet ve ibadet hakları korundu.',
        'Balkan Savaşlarının Genel Sonuçları:\n'
            '  • Balkanlardaki 600 yıllık Türk hâkimiyeti sona erdi.\n'
            '  • Balkan Türkleri azınlık durumuna düştü; yüz binlerce Türk Anadolu\'ya göç etmek zorunda kaldı (BALKAN GÖÇMENLERİ SORUNU).\n'
            '  • Osmanlıcılık akımı tamamen çöktü; TÜRKÇÜLÜK akımı en güçlü fikir haline geldi.',
      ],
      goldenRule: '💡 II. BALKAN SAVAŞI\'NA KATILAN FARKLI DEVLET = ROMANYA:\n'
          'I. Balkan Savaşı\'nda yer almayıp II. Balkan Savaşı\'na katılan tek devlet ROMANYA\'dır.',
    ),
  ],
);
