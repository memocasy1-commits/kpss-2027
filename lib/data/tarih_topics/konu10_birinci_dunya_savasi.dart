import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu10BirinciDunyaSavasi = LectureTopic(
  id: 'tarih_birinci_dunya_savasi',
  courseId: 'tarih',
  order: 10,
  title: 'I. Dünya Savaşı ve Sonuçları (1914 - 1918)',
  subtitle: 'Bloklaşmalar, Cepheler, Çanakkale Zaferi, Gizli Antlaşmalar & Mondros\'a Giden Yol',
  icon: Icons.military_tech_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 91 - 100',
  startTestNum: 91,
  endTestNum: 100,
  estimatedMinutes: 75,
  sections: [
    // BÖLÜM 1: SAVAŞIN NEDENLERİ VE BLOKLAŞMALAR
    LectureSection(
      title: '1. I. Dünya Savaşı\'nın Nedenleri & Bloklaşmalar',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_birinci_dunya_savasi_bloklar.png',
      imageCaption: 'Harita 10.1: I. Dünya Savaşı Öncesi Avrupa\'da İttifak ve İtilaf Blokları',
      leadText: 'Sanayi İnkılabı ile başlayan sömürgecilik yarışı ve Fransız İhtilali\'nin milliyetçilik kıvılcımı dünyayı topyekûn bir savaşa sürüklemiştir.',
      bulletPoints: [
        'Savaşın Genel Nedenleri:\n'
            '  • Sanayi İnkılabı sonucu hammadde ve pazar arayışı; emperyalist devletler arası sömürgecilik yarışı.\n'
            '  • Devletler arası silahlanma ve bloklaşma yarışı.\n'
            '  • Fransız İhtilali\'nin yaydığı aşırı milliyetçilik duyguları.',
        'Savaşın Özel Nedenleri:\n'
            '  • Almanya ile İngiltere arasındaki küresel ekonomik ve sömürge rekabeti.\n'
            '  • Fransa\'nın 1871 Sedan Savaşı\'nda Almanya\'ya kaptırdığı zengin kömür havzası ALSAS-LOREN\'i geri alma arzusu.\n'
            '  • Çarlık Rusyası\'nın Panslavizm politikasıyla Balkanlara ve Boğazlar üzerinden sıcak denizlere inme isteği.\n'
            '  • Avusturya-Macaristan ile Rusya\'nın Balkanlar üzerinde çatışan emelleri.\n'
            '  • İtalya\'nın Akdeniz havzasında yayılma isteği.',
        'Kıvılcım ve Savaşın Başlaması:\n'
            '  • 28 Haziran 1914: Avusturya-Macaristan Veliahdı Franz Ferdinand ve eşinin Saraybosna\'da Sırp milliyetçisi Gavrilo Princip tarafından öldürülmesi üzerine Avusturya Sırbistan\'a savaş ilan etti ve zincirleme reaksiyonla dünya savaşı başladı.',
        'Savaşan Bloklar:\n'
            '  • İTTİFAK DEVLETLERİ (Bağlaşma): Almanya, Avusturya-Macaristan, İtalya (1915 Londra Gizli Antlaşması ile İtilaf safına geçti). Sonradan katılanlar: OSMANLI DEVLETİ (1914), BULGARİSTAN (1915 Çanakkale Zaferi sonrası).\n'
            '  • İTİLAF DEVLETLERİ (Anlaşma): İngiltere, Fransa, Çarlık Rusyası. Sonradan katılanlar: İtalya, ABD (1917 savaşı bitiren güç), YUNANİSTAN (Savaşa EN SON katılan devlettir), Romanya, Japonya, Sırbistan.',
      ],
      goldenRule: '💡 İLK AYRILAN VE EN SON KATILAN:\n'
          '• Savaştan çekilen ilk İtilaf devleti = ÇARLIK RUSYASI (1917 Bolşevik İhtilali).\n'
          '• Savaşa katılan en son devlet = YUNANİSTAN (1917).\n'
          '• İttifak bloğundan ilk çekilen = BULGARİSTAN (Selanik Ateşkesi).',
    ),

    // BÖLÜM 2: OSMANLI\'NIN SAVAŞA GİRİŞİ VE ASKERİ HAREKÂT CEPHELERİ
    LectureSection(
      title: '2. Osmanlı\'nın Savaşa Girişi, Cepheler & Askeri Harita',
      type: LectureSectionType.formula,
      imageAssetPath: 'assets/images/tarih/tarih_birinci_dunya_savasi_cepheler.png',
      imageCaption: 'Harita 10.2: I. Dünya Savaşı\'nda Osmanlı Ordularının Savaştığı 9 Cephe',
      leadText: 'Akdeniz\'de İngilizlerden kaçan Goben ve Breslau zırhlılarının Osmanlı\'ya sığınması (Yavuz ve Midilli) ve Rus limanlarını bombalamasıyla Osmanlı resmen savaşa girdi.',
      bulletPoints: [
        'A) TAARRUZ CEPHELERİ (Şifre: K - K ➜ Kafkas ve Kanal):\n'
            '  1. KAFKAS CEPHESİ (İlk Açılan Cephe):\n'
            '     - Amaç: 1878\'de kaybedilen Kars, Ardahan, Batum\'u (Elviye-i Selâse) geri almak; Bakü petrollerine ulaşmak; Orta Asya Türkleriyle birleşerek TURAN\'ı kurmak.\n'
            '     - 1914 Sarıkamış Harekâtı: Dondurucu kış şartları, tifüs ve lojistik yetersizlik yüzünden on binlerce şehit verildi.\n'
            '     - 1915 TEHCİR KANUNU (Sevk ve İskân): Ruslarla işbirliği yapan Ermeniler Suriye ve Lübnan\'a göç ettirildi.\n'
            '     - MUSTAFA KEMAL FAKTÖRÜ: 16. Kolordu Komutanı olarak 1916\'da MUŞ VE BİTLİS\'İ Rus işgalinden kurtardı (Altın Kılıç madalyası ve generallik aldı).\n'
            '     - 3 Mart 1918 BREST-LİTOWSK ANTLAŞMASI: Rusya\'da Bolşevik İhtilali çıkınca savaştan çekildi; Kars, Ardahan ve Batum\'u Osmanlı\'ya geri verdi! (YENİLGİYLE BAŞLAYIP TOPRAK KAZANILAN TEK CEPHEDİR!).\n'
            '  2. KANAL CEPHESİ (Süveyş):\n'
            '     - Amaç: Süveyş Kanalı\'nı ele geçirip İngiltere\'nin Hindistan sömürge yolunu kesmek ve Mısır\'ı geri almak (Cemal Paşa).\n'
            '     - Çöl şartları ve lojistik yetersizlik yüzünden başarısız oldu; İngilizler Sina ve Filistin\'e ilerledi.',
        'B) SAVUNMA CEPHELERİ (Topraklarımızı Koruduğumuz Cepheler):\n'
            '  1. ÇANAKKALE CEPHESİ (1915 - Centilmenler Savaşı / Dardanelles):\n'
            '     - İtilaf\'ın Amacı: Boğazları geçip İstanbul\'u işgal etmek, Osmanlı\'yı saf dışı bırakmak ve Rusya\'ya yardım ulaştırmak.\n'
            '     - 18 MART 1915 DENİZ ZAFERİ: Nusret Mayın Gemisi ve Cevat Paşa ("18 Mart Kahramanı") önderliğinde İtilaf donanması hezimete uğratıldı.\n'
            '     - Kara Muharebeleri: Seddülbahir, Arıburnu, Conkbayırı ve Anafartalar\'da Mustafa Kemal Paşa "Ben size taarruzu emretmiyorum, ölmeyi emrediyorum!" diyerek dünya tarihine geçti ("Anafartalar Kahramanı").\n'
            '     - Sonuçları: Çarlık Rusyası çöktü (Bolşevik İhtilali oldu); Savaş en az 2 yıl uzadı; Bulgaristan İttifak safında savaşa girdi; Mustafa Kemal Milli Mücadele\'nin lideri haline geldi.\n'
            '  2. IRAK CEPHESİ: 1916 KUT\'ÜL-AMÂRE ZAFERİ ile Halil Kut Paşa General Townshend dahil 13.000 İngiliz askerini esir aldı.\n'
            '  3. HİCAZ - YEMEN CEPHESİ: Fahreddin Paşa ("Çöl Kaplanı", "Medine Müdafii") Medine\'yi aylarca açlık ve çekirge yiyerek savundu.\n'
            '  4. SURİYE - FİLİSTİN CEPHESİ: Mustafa Kemal Yıldırım Orduları Komutanı olarak düşmanı Halep\'in kuzeyinde durdurdu.',
        'C) YARDIM CEPHELERİ (Sınırlarımız Dışındaki Cepheler - Sonu "YA" ile bitenler):\n'
            '  • Galiçya, Romanya ve Makedonya Cepheleri.',
      ],
      mapData: LectureMapData(
        title: 'I. DÜNYA SAVAŞI KAFKAS CEPHESİ VE DOĞU HAREKÂTI ASKERÎ HARİTASI',
        subtitle: '1914 - 1916 Sarıkamış, Kars, Erzurum, Trabzon, Muş ve Bitlis Harekât Hatları',
        mapId: 'kafkas_cephesi_harekat_haritasi',
        imageAssetPath: 'assets/images/maps/tarih_kafkas_cephesi_haritasi.png',
        mapSource: 'Tarih Atlası: I. Dünya Savaşı Kafkas Cephesi ve Rus İşgal Sınırları Haritası (Eylül 1917)',
        historicalNote: 'Kafkas Cephesi\'nde 1877-78 Berlin Antlaşması\'yla kaybedilen Kars, Ardahan ve Batum (Elviye-i Selase) geri alınmak istenmiştir. Sarıkamış faciası sonrası Ruslar Trabzon, Erzincan, Erzurum, Muş ve Bitlis\'e kadar ilerlemiş; 1916\'da 16. Kolordu Komutanı Mustafa Kemal Paşa Muş ve Bitlis\'i Ruslardan geri almıştır.',
        legends: [
          MapLegendItem(
            label: '1914 Öncesi Kaybedilenler (Yeşil)',
            symbol: '[Yeşil Alan]',
            description: '1878 Berlin Antlaşması ile Çarlık Rusyası\'na bırakılan Kars, Ardahan, Artvin ve Iğdır vilayetleri.',
          ),
          MapLegendItem(
            label: 'Rus İşgal Bölgesi (Turuncu)',
            symbol: '[Turuncu Alan]',
            description: '1914-1916 harekâtlarıyla Rusların işgal ettiği Erzincan, Erzurum, Ağrı, Muş, Bitlis ve Van vilayetleri.',
          ),
          MapLegendItem(
            label: 'Rus Askeri Valilikleri (Sarı)',
            symbol: '[Sarı Alan]',
            description: 'Rusların Doğu Karadeniz ve iç kesimlerde kurduğu askeri idareler (Bayburt, Kelkit, Pontus).',
          ),
          MapLegendItem(
            label: 'M. Kemal\'in Kurtardığı İller',
            symbol: '[Muş & Bitlis]',
            description: 'Mustafa Kemal Paşa 1916 yılında Muş ve Bitlis\'i Rus işgalinden kurtararak Altın Kılıç madalyası almıştır.',
          ),
        ],
        points: [
          MapFrontItem(
            name: 'KAFKAS CEPHESİ',
            category: 'Taarruz Cephesi',
            commander: 'Enver Paşa, Mustafa Kemal Paşa (16. Kolordu), Kazım Karabekir',
            keyEvent: 'Sarıkamış Harekâtı, Tehcir Kanunu (1915), Muş ve Bitlis\'in M. Kemal tarafından kurtarılması.',
            outcome: '1918 Brest-Litowsk ile Kars, Ardahan, Batum geri alındı. Yenilgiyle başlayıp toprak kazanılan TEK cephedir.',
          ),
          MapFrontItem(
            name: 'KANAL CEPHESİ (SÜVEYŞ)',
            category: 'Taarruz Cephesi',
            commander: 'Bahriye Nazırı Cemal Paşa, Kress von Kressenstein',
            keyEvent: 'İngiltere\'nin Hindistan sömürge yolunu kesmek için iki kez Süveyş Kanalı\'na taarruz yapıldı.',
            outcome: 'Çöl şartları ve susuzluk yüzünden başarısız oldu; İngilizler Sina ve Filistin\'e ilerledi.',
          ),
          MapFrontItem(
            name: 'ÇANAKKALE CEPHESİ',
            category: 'Savunma Cephesi',
            commander: 'Cevat Paşa (18 Mart), Mustafa Kemal Paşa (Anafartalar), Liman von Sanders',
            keyEvent: '18 Mart Deniz Zaferi, Seddülbahir, Conkbayırı, Anafartalar muharebeleri.',
            outcome: 'İtilaf filosu geçemedi, savaş 2 yıl uzadı, Rusya çöktü, M. Kemal milli lider oldu.',
          ),
          MapFrontItem(
            name: 'IRAK CEPHESİ (KUT\'ÜL-AMARE)',
            category: 'Savunma Cephesi',
            commander: 'Halil Kut Paşa, Nurettin Paşa',
            keyEvent: 'Kut\'ül-Amare Kuşatması ile General Townshend ve 13.000 İngiliz askeri esir alındı.',
            outcome: 'İngilizler sonradan toparlanıp Bağdat ve Kerkük\'ü işgal etti.',
          ),
          MapFrontItem(
            name: 'HİCAZ - YEMEN CEPHESİ',
            category: 'Savunma Cephesi',
            commander: 'Fahreddin Paşa ("Çöl Kaplanı", "Medine Müdafii")',
            keyEvent: 'Şerif Hüseyin ve İngiliz casus Lawrence\'a karşı Medine Müdafaası (Çekirge genelgesi).',
            outcome: 'Kutsal topraklar kaybedildi, İslamcılık akımı çöktü.',
          ),
          MapFrontItem(
            name: 'SURİYE - FİLİSTİN CEPHESİ',
            category: 'Savunma Cephesi',
            commander: 'Mustafa Kemal Paşa (Yıldırım Orduları Grup Komutanı)',
            keyEvent: 'Kudüs ve Şam\'ın kaybı sonrası Halep\'in kuzeyinde savunma hattı kuruldu.',
            outcome: 'İngilizler durduruldu, bugünkü Misak-ı Milli sınırımız çizildi.',
          ),
        ],
      ),
    ),

    // BÖLÜM 3: GİZLİ ANTLAŞMALAR VE WİLSON İLKELERİ
    LectureSection(
      title: '3. Gizli Antlaşmalar & Wilson Prensipleri (1918)',
      type: LectureSectionType.ruleList,
      leadText: 'İtilaf devletleri savaş devam ederken Osmanlı topraklarını aralarında gizli antlaşmalarla paylaştılar.',
      bulletPoints: [
        'Gizli Antlaşmalar (1915 - 1917):\n'
            '  • 1. Boğazlar (İstanbul) Antlaşması: Boğazlar ve İstanbul Çarlık Rusyası\'na verildi.\n'
            '  • 2. Londra Antlaşması (1915): İtalya\'ya On İki Ada ve Antalya çevresi vaat edilerek İtilaf safına çekildi.\n'
            '  • 3. Sykes-Picot Antlaşması (1916): İngiltere ve Fransa Ortadoğu\'yu paylaştı (Irak İngiltere\'ye, Suriye-Lübnan Fransa\'ya).\n'
            '  • 4. Saint-Jean de Maurienne Antlaşması (1917): İtalya\'ya İzmir ve çevresi verildi.\n'
            '  • UYARI: Bu gizli antlaşmaları dünyaya duyuran devlet ÇARLIK YIKILDIKTAN SONRA SOVYET RUSYA (Sarı Kitap) olmuştur!',
        'Wilson İlkeleri (8 Ocak 1918):\n'
            '  • ABD Başkanı Woodrow Wilson tarafından yayımlanan 14 ilkedir:\n'
            '    - Yenen devletler yenilenlerden TOPRAK VE TAZMİNAT ALMAYACAKTIR.\n'
            '    - Gizli diploması yapılmayacak, barış antlaşmaları açık olacaktır.\n'
            '    - Her millet kendi kaderini tayin edecektir (Self-determinasyon).\n'
            '    - Barışı korumak için uluslararası bir teşkilat kurulacaktır (Milletler Cemiyeti).\n'
            '    - 12. Madde (Osmanlı ile ilgili): Türklerin çoğunlukta olduğu bölgelerde kesin egemenlik hakkı tanınacaktır (Milli Mücadele\'nin haklı dayanağı olmuştur).',
      ],
    ),
  ],
);
