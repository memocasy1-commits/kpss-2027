import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu11KurtulusSavasiHazirlik = LectureTopic(
  id: 'tarih_kurtulus_savasi_hazirlik',
  courseId: 'tarih',
  order: 11,
  title: 'Kurtuluş Savaşı Hazırlık Dönemi',
  subtitle: 'Mondros, Cemiyetler, Genelgeler, Kongreler, Misak-ı Milli & I. TBMM',
  icon: Icons.flag_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 101 - 110',
  startTestNum: 101,
  endTestNum: 110,
  estimatedMinutes: 80,
  sections: [
    // BÖLÜM 1: MONDROS VE CEMİYETLER
    LectureSection(
      title: '1. Mondros Ateşkesi (30 Ekim 1918) & Cemiyetler',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_mondros_sonrasi_isgaller.png',
      imageCaption: 'Harita 11.1: 30 Ekim 1918 Mondros Ateşkesi Sonrası İtilaf İşgalleri Haritası',
      leadText: 'Liman von Sanders\'ten Yıldırım Orduları komutanlığını devralan Mustafa Kemal Paşa ateşkes şartlarına tepki göstermiş; Rauf Orbay Agamemnon zırhlısında antlaşmayı imzalamıştır.',
      bulletPoints: [
        'Mondros\'un Zehirli Maddeleri:\n'
            '  • 7. Madde: İtilaf Devletleri güvenliklerini tehdit eden herhangi bir stratejik noktayı işgal edebilecektir (TÜM ANADOLU\'YU İŞGALE AÇIK HALE GETİREN MADDEDİR!).\n'
            '  • 24. Madde: Vilâyât-ı Sitte\'de (Altı Doğu İli: Bitlis, Erzurum, Sivas, Van, Elazığ, Diyarbakır - Şifre: BESVED) kargaşa çıkarsa işgal edilecektir (AMAÇ BÜYÜK ERMENİSTAN DEVLETİ KURMAKTIR).\n'
            '  • Ordu terhis edilecek, silah ve cephane teslim edilecek, haberleşme ve demiryolları İtilaf denetimine geçecektir.',
        'İlk İşgaller:\n'
            '  • İlk işgal edilen Osmanlı toprağı = MUSUL (İngiltere).\n'
            '  • Anadolu\'da ilk işgal edilen yer = HATAY DÖRTYOL (Fransa - İlk kurşun Kara Mehmet Çavuş tarafından atıldı).\n'
            '  • 13 Kasım 1918: İtilaf donanması İstanbul\'a demirlediğinde Mustafa Kemal\'in tarihi sözü: "GELDİKLERİ GİBİ GİDERLER!"',
        'Zararlı ve Yararlı Cemiyetler:\n'
            '  • Zararlı Azınlık Cemiyetleri: Mavri Mira, Etnik-i Eterya, Pontus Rum, Hınçak ve Taşnak.\n'
            '  • Zararlı Milli Varlığa Düşman Cemiyetler: Sulh ve Selâmet-i Osmaniye, Teâli-i İslam, Kürt Teâli, İngiliz Muhipleri, Wilson Prensipleri.\n'
            '  • Yararlı (Milli) Cemiyetler: Trakya-Paşaeli, İzmir Müdafaa-i Hukuk, Redd-i İlhak, Trabzon Muhafaza-i Hukuk, Şark Vilayetleri (Doğu Anadolu Müdafaa-i Hukuk), Kilikyalılar (Çukurova), MİLLİ KONGRE (Dr. Esat Işık - "Kuva-yı Milliye" tabirini ilk kez kullanan cemiyettir), Anadolu Kadınları Müdafaa-i Vatan.',
      ],
      goldenRule: '💡 MONDROS\'UN 7 VE 24. MADDESİ:\n'
          '7. Madde = Tüm vatanı işgale açık hale getiren genel kılıftır.\n'
          '24. Madde = Doğu\'da Ermeni devleti kurma projesidir (Vilâyât-ı Sitte).',
    ),

    // BÖLÜM 2: SAMSUN, HAVZA VE AMASYA GENELGESİ
    LectureSection(
      title: '2. Samsun\'a Çıkış, Havza & Amasya Genelgesi (1919)',
      type: LectureSectionType.ruleList,
      leadText: 'Milli Mücadele\'nin fiilen başladığı, amaç, gerekçe ve yönteminin ilk kez Türk milletine ilan edildiği şanlı süreç.',
      bulletPoints: [
        '19 Mayıs 1919: Samsun\'a Çıkış:\n'
            '  • Mustafa Kemal Paşa 9. Ordu Müfettişi olarak Bandırma Vapuru ile Samsun\'a ayak basmıştır (Görevi: Bölgedeki Türk direnişini bastırmak ve silahları toplamaktı, ancak o milleti teşkilatlandırmayı seçti).',
        '28 Mayıs 1919: Havza Genelgesi (İlk Milli Uyanış):\n'
            '  • İşgallerin mitingler ve telgraflarla protesto edilmesi istendi; Hristiyan azınlığa taşkınlık yapılmaması tembihlendi (Mondros\'un 7. maddesi işletilmesin diye). MİLLİ BİLİNÇ İLK KEZ UYANDIRILDI.',
        '22 Haziran 1919: AMASYA GENELGESİ (İhtilal Beyannamesi):\n'
            '  • Mustafa Kemal, Rauf Orbay, Refet Bele, Ali Fuat Cebesoy imzalamış; Kazım Karabekir ve Cemal Paşa telgrafla onaylamıştır (Milli Mücadele\'yi kişisellikten çıkarıp milletin malı yapmak için).\n'
            '  • Tarihi Maddeleri:\n'
            '    - 1. "Vatanın bütünlüğü, milletin bağımsızlığı tehlikededir." (Kurtuluş Savaşı\'nın GEREKÇESİ).\n'
            '    - 2. "İstanbul Hükümeti üzerine aldığı sorumluluğu yerine getirememektedir." (İkinci GEREKÇE).\n'
            '    - 3. "Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır." (Kurtuluş Savaşı\'nın AMACI VE YÖNTEMİ! İlk kez üstü kapalı MİLLİ EGEMENLİK ve İHTİLAL vurgulanmıştır).\n'
            '    - 4. "Her türlü etki ve denetimden uzak milli bir heyetin varlığı şarttır." (TEMSİL HEYETİ fikri ilk kez doğdu).\n'
            '    - 5. Sivas\'ta milli bir kongre toplanacaktır.',
        'Mustafa Kemal\'in Askerlikten İstifası (7-8 Temmuz 1919):\n'
            '  • İstanbul Hükümeti geri çağırdığında Erzurum\'da askerlik görevinden istifa etmiş; "Sine-i Millete" dönmüştür. Kazım Karabekir "Ben ve kolordum emrinizdeyiz paşam!" diyerek tarihi desteğini vermiştir.',
      ],
      goldenRule: '💡 AMASYA GENELGESİ = KURTULUŞ SAVAŞI\'NIN AMACI, GEREKÇESİ, YÖNTEMİ:\n'
          '"Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır" cümlesi Kurtuluş Savaşı\'nın parolası ve yöntemidir.',
    ),

    // BÖLÜM 3: ERZURUM VE SİVAS KONGRELERİ
    LectureSection(
      title: '3. Erzurum & Sivas Kongreleri: Milli Teşkilatlanma',
      type: LectureSectionType.comparison,
      leadText: 'Bölgesel direnişten tek bir milli iradeye geçişi sağlayan iki büyük kongre.',
      bulletPoints: [
        'Erzurum Kongresi (23 Temmuz - 7 Ağustos 1919):\n'
            '  • Toplanış bakımından BÖLGESEL, aldığı kararlar bakımından TAMAMEN MİLLÎDİR.\n'
            '  • Kararları:\n'
            '    - "Milli sınırlar içinde vatan bir bütündür, parçalanamaz." (İlk kez milli sınırlardan bahsedildi).\n'
            '    - "Manda ve himaye kabul edilemez." (İlk kez manda reddedildi).\n'
            '    - "Kuva-yı Milliyeyi etkin, milli iradeyi hâkim kılmak esastır."\n'
            '    - 9 kişilik TEMSİL HEYETİ kuruldu ve başkanlığına Mustafa Kemal seçildi (Yetkisi bölgeseldi).',
        'Sivas Kongresi (4 - 11 Eylül 1919):\n'
            '  • Hem toplanış hem kararları bakımından HER YÖNÜYLE MİLLÎ BİR KONGREDİR.\n'
            '  • Ali Galip olayı engellendi; Manda ve himaye KESİN OLARAK REDDEDİLDİ.\n'
            '  • TÜM YARARLI CEMİYETLER "ANADOLU VE RUMELİ MÜDAFAA-İ HUKUK CEMİYETİ" ADIYLA TEK ÇATI ALTINDA BİRLEŞTİRİLDİ.\n'
            '  • Temsil Heyeti tüm yurdu temsil eder hale getirildi.\n'
            '  • Ali Fuat Paşa Batı Cephesi Komutanlığı\'na atandı (Temsil Heyeti ilk kez YÜRÜTME yetkisini kullandı - Hükümet gibi hareket etti).\n'
            '  • İRÂDE-İ MİLLİYE adıyla gazete çıkarıldı.\n'
            '  • SİYASİ ZAFER: Damat Ferit Hükümeti istifa etmek zorunda kaldı; yerine Ali Rıza Paşa Hükümeti kuruldu (Temsil Heyeti\'nin ilk siyasi zaferidir).',
      ],
    ),

    // BÖLÜM 4: AMASYA PROTOKOLÜ, MİSAK-I MİLLİ VE İSTANBUL'UN İŞGALİ
    LectureSection(
      title: '4. Amasya Görüşmeleri, Misak-ı Millî & İstanbul\'un İşgali',
      type: LectureSectionType.formula,
      leadText: 'İstanbul Hükümeti\'nin Milli Mücadele\'yi resmen tanıdığı, Misak-ı Millî\'nin ilan edildiği ve Meclis\'in basıldığı kritik evre.',
      bulletPoints: [
        'Amasya Görüşmeleri (20 - 22 Ekim 1919):\n'
            '  • Temsil Heyeti adına Mustafa Kemal ile İstanbul Hükümeti adına Salih Paşa arasında yapıldı.\n'
            '  • ÖNEMİ: İSTANBUL HÜKÜMETİ TEMSİL HEYETİ\'Nİ VE ANADOLU İRADESİNİ İLK KEZ HUKUKEN VE RESMEN TANIMIŞTIR.\n'
            '  • Karar: Mebusan Meclisi derhal toplanmalıdır (Mustafa Kemal güvenli olmadığı için Anadolu\'da toplanmasını istedi, ancak İstanbul\'da toplandı).',
        'Temsil Heyeti\'nin Ankara\'ya Gelişi (27 Aralık 1919):\n'
            '  • Ankara\'nın merkez seçilme nedenleri: Güvenli olması, demiryolu ve telgraf ağının bulunması, Batı Cephesi\'ne yakınlığı.',
        'MİSAK-I MİLLÎ\'NİN KABULÜ (28 Ocak 1920):\n'
            '  • Son Osmanlı Mebusan Meclisi\'nde Felâh-ı Vatan Grubu\'nun desteğiyle gizli oturumda kabul edilmiştir (Şifre: B-O-R-S-A):\n'
            '    - B: Boğazlar dünya ticaretine açılacak, ancak güvenliği sağlanmalıdır.\n'
            '    - O: Osmanlı Borçları hakkaniyetle paylaştırılmalıdır.\n'
            '    - R: Referandum (Halkoylaması) Kars-Ardahan-Batum, Batı Trakya ve Arap topraklarında yapılmalıdır.\n'
            '    - S: SINIRLAR (Mondros imzalandığı gün işgal edilmemiş Türk toprakları bir bütündür, parçalanamaz!).\n'
            '    - A: Azınlıklara komşu ülkelerdeki Müslümanlara verilen haklar kadar hak verilebilir.\n'
            '    - K: KAPİTÜLASYONLAR (Milli ve iktisadi gelişmemizi engelleyen her türlü adli, mali ve siyasi ayrıcalık KESİNLİKLE KALDIRILMALIDIR).',
        'İstanbul\'un Resmen İşgali (16 Mart 1920):\n'
            '  • Misak-ı Millî\'nin kabul edilmesine öfkelenen İtilaf Devletleri İstanbul\'u resmen işgal etti; Mebusan Meclisi\'ni basıp milletvekillerini Malta\'ya sürgüne gönderdi.\n'
            '  • Manastırlı Hamdi Bey bu işgali telgrafla Mustafa Kemal\'e bildirdi.\n'
            '  • Sonuç: Osmanlı Meclisi kapandı ve ANKARA\'DA TBMM\'NİN AÇILMASI İÇİN YOL AÇILMIŞ OLDU.',
      ],
    ),

    // BÖLÜM 5: I. TBMM'NİN AÇILMASI VE SEVR ANTLAŞMASI
    LectureSection(
      title: '5. I. TBMM\'nin Açılması (23 Nisan 1920) & Sevr Antlaşması',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_sevr_antlasmasi_paylasim.png',
      imageCaption: 'Harita 11.2: 10 Ağustos 1920 Sevr (Sèvres) Antlaşması ile Anadolu\'yu Parçalama Planı',
      leadText: 'Milli egemenliğe dayalı tam bağımsız yeni Türk Devleti Ankara\'da açılan Büyük Millet Meclisi ile doğmuştur.',
      bulletPoints: [
        'I. TBMM\'nin Nitelikleri (23 Nisan 1920):\n'
            '  • Kurucu Meclistir (Yeni devlet kurmuş, 1921 Anayasası\'nı yapmıştır).\n'
            '  • İhtilalci Meclistir (Mevcut saltanat düzenini tanımamış, milli iradeyi üstün tutmuştur).\n'
            '  • Savaşçı Meclistir (Tüm enerjisini Kurtuluş Savaşı\'nı kazanmaya vermiştir).\n'
            '  • Güçler Birliği İlkesi: Yasama, yürütme ve yargı yetkileri meclistedir (Hızlı karar almak için).\n'
            '  • Meclis Hükümeti Sistemi: Meclis başkanı aynı zamanda hükümetin de başkanıdır (Mustafa Kemal).\n'
            '  • Siyasi partiler yoktur; gruplar vardır (Müdafaa-i Hukuk, Tesanüt, İstiklal, Islahat, Halk Zümresi).\n'
            '  • İlk çıkardığı kanun: AĞNAM VERGİSİ KANUNU (küçükbaş hayvan vergisi 4 katına çıkarıldı).\n'
            '  • İsyanlara karşı Hıyanet-i Vataniye Kanunu, Firariler Kanunu çıkarılmış ve İSTİKLAL MAHKEMELERİ kurulmuştur.',
        'TBMM\'ye Karşı Çıkan İsyanlar:\n'
            '  • İstanbul Hükümeti\'nin Çıkardığı İsyanlar: Anzavur İsyanı, Kuva-yı İnzibatiye (Halifelik Ordusu).\n'
            '  • İstanbul ve İtilafçıların Kışkırttığı İsyanlar: Bolu-Düzce-Hendek-Adapazarı, Yozgat (Çapanoğlu), Afyon (Çopur Musa), Konya (Delibaş Mehmed), Milli Aşireti.\n'
            '  • Azınlık İsyanları: Rum ve Ermeni İsyanları.\n'
            '  • Eski Kuva-yı Milliyecilerin İsyanları: Düzenli orduya girmek istemeyen ÇERKEZ ETHEM ve DEMİRCİ MEHMET EFE isyanları.',
        '10 Ağustos 1920 SEVR BARIŞ ANTLAŞMASI:\n'
            '  • İtilaf Devletleri\'nin San Remo Konferansı\'nda hazırladığı, vatanı parçalayan ölüm fermanıdır.\n'
            '  • HUKUKEN GEÇERSİZDİR (ÖLÜ DOĞMUŞTUR): Çünkü Mebusan Meclisi kapalı olduğu için meclis onayından geçmemiştir (Saltanat Şurası onaylamıştır).\n'
            '  • TBMM Sevr\'i imzalayanları "Vatan Haini" ilan etmiştir. Sevr Türk milletinin bağımsızlık azmini kamçılamış ve Kurtuluş Savaşı\'nı hızlandırmıştır.',
      ],
      goldenRule: '💡 SEVR HUKUKEN NEDEN GEÇERSİZDİR?\n'
          'Kanun-i Esasi\'ye göre barış antlaşmalarının Mebusan Meclisi tarafından onaylanması şarttı; meclis kapalı olduğundan Sevr hukuken yok hükmündedir.',
    ),
  ],
);
