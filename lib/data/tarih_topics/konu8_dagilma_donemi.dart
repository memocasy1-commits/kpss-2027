import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu8DagilmaDonemi = LectureTopic(
  id: 'tarih_dagilma_donemi',
  courseId: 'tarih',
  order: 8,
  title: 'Osmanlı Devleti Dağılma Dönemi (XIX. Yüzyıl)',
  subtitle: 'Denge Politikası, Boğazlar, Kırım Savaşı, 93 Harbi, Tanzimat, Islahat & Meşrutiyet',
  icon: Icons.broken_image_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 71 - 80',
  startTestNum: 71,
  endTestNum: 80,
  estimatedMinutes: 80,
  sections: [
    // BÖLÜM 1: DENGE POLİTİKASI VE MİLLİYETÇİLİK İSYANLARI
    LectureSection(
      title: '1. XIX. Yüzyıl Denge Politikası & Sırp ve Yunan İsyanları',
      type: LectureSectionType.overview,
      leadText: 'Osmanlı Devleti XIX. yüzyılda kendi gücüyle varlığını koruyamaz hale gelmiş; Avrupalı büyük devletler arasındaki çıkar çatışmalarından faydalanarak "DENGE POLİTİKASI" izlemiştir.',
      bulletPoints: [
        'Denge Politikasının İlk Kez Uygulanması:\n'
            '  • 1798 yılında Napolyon\'un Mısır\'ı işgali karşısında Osmanlı Devleti İNGİLTERE ve RUSYA\'nın desteğini alarak Fransa\'yı çıkarmış ve denge siyasetini ilk kez uygulamıştır.',
        '1. Sırp İsyanı (1804) ve Bağımsızlık Süreci:\n'
            '  • Milliyetçilik akımıyla Osmanlı\'ya İLK İSYAN EDEN azınlık Sırplardır (Kara Yorgi önderliğinde).\n'
            '  • 1812 Bükreş Antlaşması: Sırplara İLK AYRICALIK (imtiyaz) verildi.\n'
            '  • 1829 Edirne Antlaşması: Sırplara ÖZERKLİK verildi.\n'
            '  • 1878 Berlin Antlaşması: Sırbistan TAM BAĞIMSIZ oldu.',
        '2. Rum (Yunan) İsyanı (1821) ve Yunanistan\'ın Bağımsızlığı:\n'
            '  • Etnik-i Eterya ve Filiki Eterya cemiyetleri ile Rusya ve Avrupalı aydınların (Lord Byron) kışkırtmasıyla Mora\'da büyük bir Türk katliamıyla başladı.\n'
            '  • II. Mahmud Mısır Valisi Mehmed Ali Paşa\'dan yardım istedi; vali isyanı bastırdı.\n'
            '  • 1827 NAVARİN OLAYI: İngiltere, Fransa ve Rusya Osmanlı-Mısır donanmasını Navarin Limanı\'nda ansızın yaktı!\n'
            '  • 1829 EDİRNE ANTLAŞMASI: Osmanlı Rusya\'ya mağlup oldu. YUNANİSTAN BAĞIMSIZ OLDU. OSMANLI DEVLETİ\'NDEN AYRILARAK BAĞIMSIZLIK KAZANAN İLK AZINLIK RUMLARDIR.',
      ],
      goldenRule: '💡 SIRP VS RUM FARKI:\n'
          '• Osmanlı\'da İLK İSYAN EDEN azınlık = SIRPLAR\n'
          '• Osmanlı\'dan İLK BAĞIMSIZLIK KAZANAN azınlık = RUMLAR (YUNANİSTAN - 1829 Edirne).',
      imageAssetPath: 'assets/images/tarih/tarih_dagilma_donemi_infografik.png',
      imageCaption: 'Osmanlı Dağılma Dönemi Kronolojisi, SAKAR Şifresi ve Balkan Bağımsızlık Süreci İnfografiği',
    ),

    // BÖLÜM 2: MISIR MESELESİ VE BOĞAZLAR SORUNU
    LectureSection(
      title: '2. Mısır Meselesi (Mehmed Ali Paşa) & Boğazlar Sorunu',
      type: LectureSectionType.ruleList,
      leadText: 'Bir iç mesele iken uluslararası büyük bir krize dönüşen Mısır sorunu, Osmanlı\'yı Boğazlar ve ekonomi tavizleri vermeye zorlamıştır.',
      bulletPoints: [
        'Mısır İsyanı ve Gelişimi:\n'
            '  • Mısır Valisi Mehmed Ali Paşa Mora ve Girit valiliklerinin verilmemesi üzerine oğlu İbrahim Paşa komutasındaki orduyla Kütahya\'ya kadar ilerledi.\n'
            '  • II. Mahmud "Denize düşen yılana sarılır" diyerek ezeli düşman Rusya\'dan yardım istedi; Rus donanması İstanbul Boğazı\'na demirledi.\n'
            '  • 1833 KÜTAHYA ANTLAŞMASI ile Mehmed Ali Paşa\'ya Şam ve Girit, oğlu İbrahim Paşa\'ya Cidde ve Adana valilikleri verildi.',
        'Boğazlar Sorununun Başlaması: 1833 HÜNKÂR İSKELESİ ANTLAŞMASI:\n'
            '  • Osmanlı ile Rusya arasında imzalandı. Osmanlı\'ya saldırı olursa Rusya yardım edecek; Rusya\'ya saldırı olursa Osmanlı Boğazları Batılı devletlere kapatacaktı (8 yıl geçerli).\n'
            '  • ÖNEMİ: OSMANLI DEVLETİ BOĞAZLAR ÜZERİNDEKİ MUTLAK EGEMENLİK HAKKINI TEK BAŞINA SON KEZ KULLANMIŞTIR. Boğazlar uluslararası bir sorun haline gelmiştir.',
        '1838 BALTA LİMANI TİCARET SÖZLEŞMESİ (İngiltere ile):\n'
            '  • Mısır sorununda İngiltere\'nin desteğini almak için imzalandı. İç ve dış gümrük vergileri düşürüldü; tekel sistemi (Yed-i Vâhid) kaldırıldı. İngiliz tüccarlar yerli tüccarlardan daha az vergi öder hale geldi.\n'
            '  • ÖNEMİ: Osmanlı ekonomisi ve yerli sanayisi çökmüş; ülke İngiltere\'nin AÇIK PAZARI VE YARI SÖMÜRGESİ haline gelmiştir.',
        'Sorunun Çözümü:\n'
            '  • 1840 Londra Antlaşması ile Mısır iç işlerinde serbest valilik oldu.\n'
            '  • 1841 LONDRA BOĞAZLAR SÖZLEŞMESİ: Boğazlar barış zamanında tüm devletlerin savaş gemilerine kapatıldı. Boğazlar ilk kez ULUSLARARASI BİR STATÜ kazandı.',
      ],
    ),

    // BÖLÜM 3: KIRIM SAVAŞI (1853 - 1856) VE PARİS ANTLAŞMASI
    LectureSection(
      title: '3. Kırım Savaşı (1853 - 1856) & 1856 Paris Antlaşması',
      type: LectureSectionType.formula,
      leadText: 'Rusya\'nın "Hasta Adam" dediği Osmanlı\'yı paylaşmak istemesi ve Kutsal Yerler meselesi yüzünden çıkan dünya çapında bir savaştır.',
      bulletPoints: [
        'Savaşın Seyri ve Önemli İlkler:\n'
            '  • 1853 SİNOP BASKINI: Rus donanması Sinop Limanı\'ndaki Osmanlı donanmasını yaktı (Osmanlı donanmasının tarihteki son yakılışıdır).\n'
            '  • İttifak: İngiltere, Fransa ve Piyemonte (İtalya) Osmanlı Devleti\'nin yanında savaşa girdi; Rusya Sivastopol\'da hezimete uğradı.\n'
            '  • İLK DIŞ BORÇ: Savaş masraflarını karşılamak için 1854 yılında İngiltere\'den İLK DIŞ BORÇ alındı (Sultan Abdülmecid dönemi).\n'
            '  • İLK TELGRAF HATTI: Kırım-Varna-Edirne-İstanbul hattı döşendi.\n'
            '  • MODERN HEMŞİRELİK: Florence Nightingale ("Lambalı Kadın") Selimiye Kışlası\'nda yaralı askerleri tedavi ederek modern hemşireliği kurdu.',
        '1856 PARİS ANTLAŞMASI ve Tarihi Sonuçları:\n'
            '  • 1. OSMANLI DEVLETİ BİR AVRUPA DEVLETİ SAYILDI; Avrupa devletler hukukundan yararlanma ve toprak bütünlüğü Avrupalı büyük devletlerin garantisi altına alındı.\n'
            '  • 2. Karadeniz tarafsız hale getirildi; Osmanlı ve Rusya\'nın donanma ve tersane bulundurması yasaklandı (Osmanlı galip geldiği halde yenik devlet muamelesi gördü).\n'
            '  • 3. Avrupalıların iç işlerimize karışmasını önlemek için ISLAHAT FERMANI ilan edilerek antlaşma metnine eklendi.',
      ],
    ),

    // BÖLÜM 4: 93 HARBİ (1877 - 1878) VE 1878 BERLİN ANTLAŞMASI
    LectureSection(
      title: '4. 93 Harbi (1877 - 1878 Osmanlı-Rus Savaşı) & Berlin Antlaşması',
      type: LectureSectionType.overview,
      leadText: 'Balkan bunalımı ve Tersane (İstanbul) Konferansı kararlarını Osmanlı\'nın reddetmesi üzerine Rusya iki koldan saldırıya geçti.',
      bulletPoints: [
        'Destansı Savunmalar:\n'
            '  • Balkan Cephesinde: GAZİ OSMAN PAŞA Plevne\'de 5 ay boyunca Rus ordularını durdurarak destan yazdı ("Plevne Kahramanı").\n'
            '  • Kafkas Cephesinde: GAZİ AHMET MUHTAR PAŞA ve Erzurum\'da Aziziye Tabyası\'nı savunan NENE HATUN tarihe geçti.\n'
            '  • Ruslar Yeşilköy\'e (Ayastefanos) kadar ilerledi; II. Abdülhamit meclisi tatil etti.',
        '1878 AYASTEFANOS (Yeşilköy) Antlaşması:\n'
            '  • Rusya\'nın tek başına hazırladığı bu antlaşma ile Büyük Bulgaristan Krallığı kuruluyordu. İngiltere ve Avusturya çıkarlarına aykırı bularak antlaşmayı iptal ettirdi (Tarihteki İLK ÖLÜ DOĞAN antlaşmadır - İkincisi Sevr\'dir).\n'
            '  • Osmanlı İngiltere\'nin desteğini almak için KIBRIS\'IN İDARESİNİ GEÇİCİ OLARAK İNGİLTERE\'YE DEVRETTİ.',
        '1878 BERLİN ANTLAŞMASI ve Sonuçları:\n'
            '  • 1. SIRBİSTAN, KARADAĞ VE ROMANYA TAM BAĞIMSIZ OLDU.\n'
            '  • 2. KARS, ARDAHAN VE BATUM (Elviye-i Selâse) Rusya\'ya bırakıldı; Doğubeyazıt Osmanlı\'da kaldı.\n'
            '  • 3. Bulgaristan üçe bölündü (Asıl Bulgaristan Osmanlı\'ya vergi veren prenslik oldu).\n'
            '  • 4. Bosna-Hersek\'in idaresi geçici olarak Avusturya\'ya bırakıldı.\n'
            '  • 5. ERMENİ MESELESİ İLK KEZ ULUSLARARASI BİR ANTLAŞMAYA GİRDİ (Doğu Anadolu\'da Ermenilerin yaşadığı yerlerde ıslahat yapılması maddesi).',
      ],
      goldenRule: '💡 BERLİN ANTLAŞMASI İLE BAĞIMSIZ OLANLAR (S-A-K-A-R):\n'
          'Sırbistan, Karadağ, Romanya 1878 Berlin Antlaşması ile bağımsız olmuştur.',
    ),

    // BÖLÜM 5: II. MAHMUD ISLAHATLARI VE MODERNLEŞME
    LectureSection(
      title: '5. II. Mahmud Islahatları: Devletin Yeniden Yapılanması',
      type: LectureSectionType.ruleList,
      leadText: 'Osmanlı\'nın "Büyük Reformcusu" kabul edilen II. Mahmud, devletin her kademesini baştan aşağı modernize etmiştir.',
      bulletPoints: [
        '1808 Sened-i İttifak:\n'
            '  • Sadrazam Alemdar Mustafa Paşa aracılığıyla Padişah ile Taşra Âyanları arasında imzalanmıştır.\n'
            '  • ÖNEMİ: TÜRK TARİHİNDE PADİŞAHIN YETKİLERİNİ İLK KEZ KISITLAYAN BELGEDİR. İlk anayasal adım ve Magna Carta benzeri kabul edilir.',
        '1826 VAK\'A-İ HAYRİYYE (Hayırlı Olay):\n'
            '  • Devlete ve ıslahatlara sürekli engel olan YENİÇERİ OCAĞI KALDIRILMIŞTIR.\n'
            '  • Yerine ASÂKİR-İ MANSÛRE-İ MUHAMMEDİYYE ordusu kurulmuştur. Padişahın otoritesi yeniden tesis edilmiştir.',
        'Yönetim ve Bürokrasi Islahatları:\n'
            '  • Divan-ı Hümayun kaldırılarak yerine BÂB-I ÂLİ NEZARETLERİ (Bakanlıklar) kuruldu.\n'
            '  • Sadrazamlık "Başvekâlet" oldu.\n'
            '  • Tımar sistemi tamamen kaldırıldı; memurlara maaş bağlandı.\n'
            '  • İlk nüfus sayımı (askeri ve vergi amaçlı sadece erkekler sayıldı) ve ilk mülk yazımı yapıldı.\n'
            '  • Muhtarlıklar kuruldu; İstanbul\'a giriş için "Mürûr Tezkeresi" (iç pasaport) uygulaması getirildi.\n'
            '  • İLK RESMİ GAZETE olan TAKVİM-İ VEKAYİ (1831) çıkarıldı.\n'
            '  • Memurlara fes, ceket ve pantolon giyme zorunluluğu getirildi; devlet dairelerine padişahın resminin asılması uygulaması başlatıldı.',
        'Eğitim ve Sağlık Islahatları:\n'
            '  • İstanbul\'da ilköğretim zorunlu hale getirildi.\n'
            '  • Enderun yerine Mekteb-i Maarif-i Adliye kuruldu; Tıbbiye ve Harbiye mektepleri açıldı; Avrupa\'ya İLK KEZ ÖĞRENCİ gönderildi.',
      ],
    ),

    // BÖLÜM 6: TANZİMAT, ISLAHAT VE MEŞRUTİYET DÖNEMLERİ
    LectureSection(
      title: '6. Tanzimat (1839), Islahat (1856) & Meşrutiyet Dönemleri',
      type: LectureSectionType.comparison,
      leadText: 'Kanun üstünlüğünün kabul edildiği, parlamenter sisteme geçildiği ve anayasal düzene ulaşılan büyük demokratikleşme süreçleri:',
      bulletPoints: [
        '1. 1839 TANZİMAT FERMANI (Gülhane Hatt-ı Hümayunu):\n'
            '  • Padişah Sultan Abdülmecid, hazırlayan Hariciye Nazırı MUSTAFA REŞİT PAŞA\'dır.\n'
            '  • Amacı: Fransız İhtilali\'nin milliyetçilik etkisini kırmak, Avrupalıların iç işlerimize karışmasını önlemek ve Mısır meselesinde destek almak.\n'
            '  • Maddeleri: Herkesin can, mal, namus güvenliği devlet garantisinde olacaktır; vergiler herkesin gelirine göre alınacaktır; hiç kimse yargılanmadan cezalandırılmayacaktır; rüşvet ve iltimas önlenecektir; müsadere usulü tamamen kaldırılacaktır.\n'
            '  • ÖNEMİ: KANUN ÜSTÜNLÜĞÜ (Hukukun Üstünlüğü) İLK KEZ KABUL EDİLMİŞTİR. Padişah kendi gücünün üstünde kanun gücünün olduğunu ilan etmiştir. Anayasacılığa geçişin ilk büyük adımıdır.',
        '2. 1856 ISLAHAT FERMANI:\n'
            '  • Paris Barış Konferansı sürerken Avrupalıların baskısıyla ilan edilmiştir.\n'
            '  • Temel Hedef: GAYRİMÜSLİMLERE TAM EŞİTLİK sağlamaktır.\n'
            '  • Maddeleri: Gayrimüslimlere "gâvur" denmesi yasaklandı; devlet memuru ve asker olabilme hakkı verildi; Cizye vergisi kaldırıldı; gayrimüslimler için "Bedel-i Askerî" usulü getirildi; il meclislerine üye olma ve yabancılara mülk edinme hakkı tanındı.',
        '3. I. Meşrutiyet ve 1876 KANUN-İ ESASİ:\n'
            '  • Genç Osmanlılar (Jön Türkler: Namık Kemal, Ziya Paşa, Mithat Paşa) baskısıyla II. Abdülhamit tarafından ilan edilmiştir.\n'
            '  • 1876 Kanun-i Esasi: TÜRK TARİHİNİN İLK YAZILI ANAYASASIDIR.\n'
            '  • Rejim: Mutlakiyetten MEŞRUTİ MONARŞİ\'ye geçilmiştir. Halk ilk kez padişahın yanında yönetime katılmıştır.\n'
            '  • Meclis İkiye Ayrıldı:\n'
            '    - Meclis-i Âyân: Üyelerini padişah seçer, ömür boyu görevde kalırlardı.\n'
            '    - Meclis-i Mebûsan: Üyelerini 4 yılda bir halk seçerdi.\n'
            '  • 1877-1878 Osmanlı-Rus Savaşı bahane edilerek II. Abdülhamit meclisi kapatmış ve 30 yıllık İstibdat Dönemi başlamıştır.',
        '4. 1908 II. Meşrutiyet ve 31 Mart Vakası (1909):\n'
            '  • İttihat ve Terakki Cemiyeti\'nin baskısıyla (Resneli Niyazi, Enver Bey) II. Meşrutiyet ilan edilmiştir.\n'
            '  • 31 Mart Vakası (13 Nisan 1909): Meşrutiyet rejimine karşı çıkan TÜRK TARİHİNDEKİ REJİME YÖNELİK İLK İSYANDIR. Selanik\'ten gelen HAREKET ORDUSU (Komutan Mahmut Şevket Paşa, Kurmay Başkanı MUSTAFA KEMAL) isyanı bastırmıştır.\n'
            '  • Sonuç: II. Abdülhamit tahttan indirilmiş; yerine V. Mehmed Reşad tahta çıkarılmıştır.',
      ],
      goldenRule: '💡 OSMANLI DEMOKRATİKLEŞME KRONOLOJİSİ:\n'
          '1. Sened-i İttifak (1808) ➜ Yetkiler ilk kez kısıtlandı.\n'
          '2. Tanzimat Fermanı (1839) ➜ Kanun üstünlüğü ilk kez kabul edildi.\n'
          '3. Islahat Fermanı (1856) ➜ Gayrimüslimlere tam eşitlik verildi.\n'
          '4. I. Meşrutiyet (1876) ➜ İlk anayasa (Kanun-i Esasi) ve parlamenter rejim.',
    ),
  ],
);
