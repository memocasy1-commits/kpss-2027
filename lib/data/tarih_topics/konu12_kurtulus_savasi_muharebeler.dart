import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu12KurtulusSavasiMuharebeler = LectureTopic(
  id: 'tarih_kurtulus_savasi_muharebeler',
  courseId: 'tarih',
  order: 12,
  title: 'Kurtuluş Savaşı Muharebeler Dönemi',
  subtitle: 'Doğu, Güney, Batı Cepheleri, İnönü, Sakarya, Büyük Taarruz, Mudanya & Lozan',
  icon: Icons.shield_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 111 - 120',
  startTestNum: 111,
  endTestNum: 120,
  estimatedMinutes: 80,
  sections: [
    // BÖLÜM 1: DOĞU CEPHESİ VE GÜMRÜ ANTLAŞMASI
    LectureSection(
      title: '1. Doğu Cephesi (Kâzım Karabekir) & Gümrü Antlaşması',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_kurtulus_savasi_cepheler.png',
      imageCaption: 'Harita 12.1: Kurtuluş Savaşı Muharebeler Dönemi Cepheler ve Harekât Haritası',
      leadText: 'Milli Mücadele\'de düzenli orduyla ilk zaferin kazanıldığı ve ilk diplomatik zaferin elde edildiği cephedir.',
      bulletPoints: [
        'Doğu Cephesi ve Gelişimi:\n'
            '  • Komutan: KÂZIM KARABEKİR PAŞA (15. Kolordu - Osmanlı\'dan kalan terhis edilmemiş tek düzenli ordudur).\n'
            '  • Düşman: Taşnak Ermeni ordusu.\n'
            '  • Harekât: Kâzım Karabekir Paşa taarruza geçerek Sarıkamış, Kars ve Gümrü\'yü Ermeni işgalinden kurtardı.',
        '3 Aralık 1920 GÜMRÜ BARIŞ ANTLAŞMASI ve Tarihi Önemi:\n'
            '  • 1. TBMM Hükümeti\'nin uluslararası alandaki İLK ASKERİ VE SİYASİ ZAFERİDİR.\n'
            '  • 2. SEVR ANTLAŞMASI\'NIN GEÇERSİZLİĞİNİ KABUL EDEN İLK DEVLET ERMENİSTAN OLMUŞTUR (Ermeniler Doğu Anadolu toprak taleplerinden vazgeçti).\n'
            '  • 3. Antlaşma metninde ilk kez "TÜRKİYE" ve "TBMM DEVLETİ" ifadesi yer almıştır.\n'
            '  • 4. Doğu Cephesi büyük ölçüde kapanmış; buradaki birlik ve cephaneler Batı Cephesi\'ne kaydırılmıştır.\n'
            '  • 1921 Batum Antlaşması: Gürcistan ile yapıldı; Batum, Artvin ve Ardahan geri alındı.',
      ],
      mapData: LectureMapData(
        title: 'MİLLÎ MÜCADELE CEPHELERİ GENEL ASKERÎ HARİTASI',
        subtitle: 'Doğu, Güney ve Batı Cepheleri Dağılımı ve Harekât Bölgeleri',
        mapId: 'milli_mucadele_cepheler_haritasi',
        imageAssetPath: 'assets/images/maps/tarih_kurtulus_savasi_cepheler.jpg',
        mapSource: 'Genelkurmay Askerî Tarih ve Stratejik Etüt (ATASE) Başkanlığı Arşivi',
        historicalNote: 'Doğu Cephesi\'nde Kazım Karabekir 15. Kolordu ile, Güney Cephesi\'nde Kuvayımilliye müfrezeleriyle, Batı Cephesi\'nde ise düzenli ordu birlikleriyle bağımsızlık mücadelesi verilmiştir.',
        legends: [
          MapLegendItem(
            label: 'Doğu Cephesi',
            symbol: '[D]',
            description: '15. Kolordu (Kazım Karabekir) - Ermeni işgaline karşı Gümrü Zaferi.',
          ),
          MapLegendItem(
            label: 'Güney Cephesi',
            symbol: '[G]',
            description: 'Kuvayımilliye Halk Direnişi (Maraş, Antep, Urfa, Adana) - Fransız ve Ermeni lejyonlarına karşı.',
          ),
          MapLegendItem(
            label: 'Batı Cephesi',
            symbol: '[B]',
            description: 'Garp Cephesi Düzenli Ordusu - Yunan işgaline karşı 5 büyük meydan savaşı.',
          ),
        ],
        points: [
          MapFrontItem(
            name: 'DOĞU CEPHESİ',
            category: 'Kazanılan Zafer',
            commander: 'Kâzım Karabekir Paşa',
            keyEvent: 'Ermenistan\'a karşı Kars, Sarıkamış ve Gümrü harekâtları.',
            outcome: 'Gümrü Antlaşması ile Misak-ı Millî\'yi tanıyan ilk devlet Ermenistan oldu.',
          ),
          MapFrontItem(
            name: 'GÜNEY CEPHESİ',
            category: 'Halk Direnişi',
            commander: 'Ali Saip Bey, Şahin Bey, Sütçü İmam',
            keyEvent: 'Maraş, Antep ve Urfa halkının destansı Kuvayımilliye direnişi.',
            outcome: '1921 Ankara Antlaşması ile Fransa işgal ettiği topraklardan çekildi.',
          ),
        ],
      ),
    ),

    // BÖLÜM 2: GÜNEY CEPHESİ VE KUVA-YI MİLLİYE DİRENİŞİ
    LectureSection(
      title: '2. Güney Cephesi: Kuva-yı Milliye ve Şehir Destanları',
      type: LectureSectionType.ruleList,
      leadText: 'Düzenli ordunun bulunmadığı, tamamen yerli halkın ve Kuva-yı Milliyecilerin kahramanca Fransız ve Ermenilere karşı savaştığı cephedir.',
      bulletPoints: [
        'Şehir Destanları ve Kahramanlar:\n'
            '  • 1. MARAŞ (Sütçü İmam & Rıdvan Hoca): Fransız askerlerinin Türk kadınlarına saldırması üzerine Sütçü İmam ilk kurşunu attı; halk şehri Fransızlardan temizledi (1973 yılında "KAHRAMAN" unvanı verildi).\n'
            '  • 2. ANTEP (Şahin Bey & Şehit Kâmil & Karayılan): Şahin Bey "Düşman cesedimi çiğnemeden Antep\'e giremez!" diyerek şehit düştü; şehir aylarca açlığa rağmen direndi (1921 yılında TBMM tarafından "GAZİ" unvanı ve İstiklal Madalyası verildi).\n'
            '  • 3. URFA (Ali Saip Ursavaş): "Namus borcumu ödemeye geldim" diyerek aşiretleri örgütledi ve Fransızları şehirden çıkardı (1984 yılında "ŞANLI" unvanı verildi).\n'
            '  • 4. Adana ve Pozantı Kongresi: Mustafa Kemal\'in katıldığı Pozantı Kongresi ile Çukurova direnişi koordine edildi.',
        'Cephenin Kapanması:\n'
            '  • Sakarya Zaferi sonrasında Fransa ile imzalanan 20 EKİM 1921 ANKARA ANTLAŞMASI ile Güney Cephesi resmen kapandı; Fransızlar işgal ettiği topraklardan çekildi.',
      ],
      goldenRule: '💡 DÜZENLİ ORDU OLMAYAN TEK CEPHE = GÜNEY CEPHESİ:\n'
          'Güney Cephesi\'nde düzenli ordu savaşmamıştır; mücadeleyi bütünüyle Kuva-yı Milliye yürütmüştür.',
    ),

    // BÖLÜM 3: BATI CEPHESİ: I. İNÖNÜ VE II. İNÖNÜ ZAFERLERİ
    LectureSection(
      title: '3. Batı Cephesi: Düzenli Ordu, I. ve II. İnönü Zaferleri',
      type: LectureSectionType.formula,
      leadText: 'Kurtuluş Savaşı\'nın kaderini belirleyen, Yunan ordusuna ve arkasındaki İngiltere\'ye karşı verilen en kanlı muharebeler sahnesidir.',
      bulletPoints: [
        'Düzenli Ordunun Kurulması (Kasım 1920):\n'
            '  • Gediz Taarruzu\'nda Kuva-yı Milliye\'nin (Ali Fuat Paşa ve Çerkez Ethem) başarısız olması üzerine düzenli orduya geçildi. Batı Cephesi Komutanlığı Albay İsmet Bey\'e (İnönü), Güney kısmı Albay Refet Bey\'e verildi.',
        'I. İnönü Muharebesi (6 - 10 Ocak 1921):\n'
            '  • Amaç: Yunanlıların Ankara\'ya ulaşıp Meclis\'i dağıtmak ve Sevr\'i zorla kabul ettirmek istemesi.\n'
            '  • Düzenli ordunun kazandığı İLK ASKERİ ZAFERDİR (İsmet Paşa generalliğe yükseltildi).\n'
            '  • Sonuçları Şifresi (M - İ - L - A - T):\n'
            '    - M: MOSKOVA ANTLAŞMASI (16 Mart 1921): Sovyet Rusya ile imzalandı. Sovyetler Sevr\'i reddetti, Misak-ı Millî\'yi tanıdı. İLK KEZ BİR BÜYÜK AVRUPA DEVLETİ TBMM\'Yİ TANIDI. (İlk taviz: Batum Gürcistan\'a bırakıldı).\n'
            '    - İ: İSTİKLAL MARŞI\'NIN KABULÜ (12 Mart 1921): Mehmed Âkif Ersoy\'un yazdığı şiir Meclis\'te alkışlarla milli marş seçildi.\n'
            '    - L: LONDRA KONFERANSI (23 Şubat - 12 Mart 1921): İtilaf Devletleri TBMM\'yi ve Bekir Sami Bey\'i davet etti. İTİLAF DEVLETLERİ TBMM\'Yİ İLK KEZ RESMEN VE HUKUKEN TANIDI.\n'
            '    - A: AFGANİSTAN DOSTLUK ANTLAŞMASI (1 Mart 1921): TBMM\'yi tanıyan İLK MÜSLÜMAN DEVLET Afganistan oldu.\n'
            '    - T: TEŞKİLAT-I ESASİYE KANUNU (1921 Anayasası): Yeni Türk Devleti\'nin ilk anayasası kabul edildi.',
        'II. İnönü Muharebesi (23 Mart - 1 Nisan 1921):\n'
            '  • Londra Konferansı\'nda Sevr\'i kabul ettiremeyen Yunanlılar yeniden saldırdı; İsmet Paşa komutasındaki Türk ordusu ikinci kez zafer kazandı.\n'
            '  • Mustafa Kemal Paşa\'nın tarihi telgrafı: "Siz orada yalnız düşmanı değil, milletin makûs talihini de yendiniz!"\n'
            '  • Sonuçları: İtalya Anadolu\'dan askerlerini çekmeye başladı; Fransa barış için Ankara\'ya temsilci (Franklin Bouillon) gönderdi.',
      ],
    ),

    // BÖLÜM 4: ESKİŞEHİR-KÜTAHYA YENİLGİSİ VE BAŞKOMUTANLIK
    LectureSection(
      title: '4. Eskişehir - Kütahya Yenilgisi, Başkomutanlık & Tekâlif-i Milliye',
      type: LectureSectionType.ruleList,
      leadText: 'Kurtuluş Savaşı\'ndaki tek yenilgimiz ve meclisin tüm yetkilerini Mustafa Kemal Paşa\'ya devrettiği ölüm-kalım anı.',
      bulletPoints: [
        'Eskişehir - Kütahya Muharebeleri (10 - 24 Temmuz 1921):\n'
            '  • Yunan ordusunun İngiliz desteğiyle geniş çaplı taarruzu karşısında Türk ordusu yenildi; Afyon, Kütahya, Eskişehir kaybedildi.\n'
            '  • Mustafa Kemal Paşa ordunun tamamen imha olmasını önlemek için orduyu SAKARYA NEHRİ\'NİN DOĞUSUNA çekti.\n'
            '  • MAARİF KONGRESİ: Savaşın en bunalımlı anında Mustafa Kemal Ankara\'da I. Maarif (Eğitim) Kongresi\'ni toplayarak eğitime verdiği hayati önemi göstermiştir.',
        'BAŞKOMUTANLIK KANUNU (5 Ağustos 1921):\n'
            '  • Meclis içindeki tartışmalar sonucunda Mustafa Kemal Paşa\'ya 3 ay süreyle meclisin tüm yetkilerini (yasama, yürütme, yargı) kullanma yetkisi verildi.\n'
            '  • Mustafa Kemal yeniden askerlik mesleğine ve ordu komutanlığına döndü.',
        'TEKÂLİF-İ MİLLİYE EMİRLERİ (7 - 8 Ağustos 1921):\n'
            '  • Başkomutan Mustafa Kemal\'in orduyu donatmak için yayımladığı 10 maddelik "Milli Yükümlülük" emirleridir:\n'
            '    - Her aile birer kat çamaşır, çorap ve çarık verecektir.\n'
            '    - Halkın elindeki giyecek, yiyecek maddelerinin ve taşıtların yüzde 40\'ına bedeli sonradan ödenmek üzere el konulacaktır.\n'
            '    - Silah ve cephaneler 3 gün içinde teslim edilecektir.\n'
            '    - Demirciler, marangozlar ve dökümcüler ordunun emrine girecektir.\n'
            '  • Bu emirleri uygulamak için İstiklal Mahkemeleri görevlendirilmiştir. TOPYEKÛN SEFERBERLİK VE HALK-ORDU DAYANIŞMASININ ŞAHESERİDİR.',
      ],
    ),

    // BÖLÜM 5: SAKARYA MEYDAN MUHAREBESİ (1921)
    LectureSection(
      title: '5. Sakarya Meydan Muharebesi (23 Ağustos - 13 Eylül 1921)',
      type: LectureSectionType.formula,
      leadText: 'Dünya savaş tarihinin en uzun meydan muharebelerinden biri olan 22 gün 22 gece süren "Subaylar Savaşı" ve son savunma zaferi.',
      bulletPoints: [
        'Savaşın Seyri ve Tarihi Emir:\n'
            '  • Başkomutan Mustafa Kemal Paşa dünya askerlik literatürüne geçen stratejisini ilan etti:\n'
            '    "HATT-I MÜDAFAA YOKTUR, SATH-I MÜDAFAA VARDIR. O SATIH BÜTÜN VATANDIR. VATANIN HER KARIŞ TOPRAĞI VATANDAŞIN KANIYLA ISLANMADIKÇA TERK OLUNAMAZ!"\n'
            '  • Türk ordusu Yunan ordusunu Sakarya Nehri\'nin batısına püskürterek muazzam bir zafer kazandı.',
        'Sakarya Zaferi\'nin Tarihi Sonuçları:\n'
            '  • 1. 1683 II. Viyana Kuşatması\'ndan beri devam eden 238 YILLIK TÜRK GERİ ÇEKİLİŞİ SONA ERDİ. Türk ordusu taarruz gücüne ulaştı.\n'
            '  • 2. TBMM tarafından Mustafa Kemal Paşa\'ya MAREŞALLİK rütbesi ve GAZİLİK unvanı verildi.\n'
            '  • 3. 13 Ekim 1921 KARS ANTLAŞMASI: Kafkas Cumhuriyetleri (Azerbaycan, Ermenistan, Gürcistan) ile imzalandı. TÜRKİYE\'NİN DOĞU SINIRI KESİNLEŞTİ.\n'
            '  • 4. 20 Ekim 1921 ANKARA ANTLAŞMASI: Fransa ile imzalandı. Fransa TBMM\'yi tanıyan İLK İTİLAF DEVLETİ oldu. Güney Cephesi kapandı; Hatay (İskenderun Sancağı) hariç bugünkü Suriye sınırımız çizildi.\n'
            '  • 5. 1922 Ukrayna Dostluk Antlaşması ve İtilaf Devletleri ile esir değişimi yapıldı.',
      ],
      goldenRule: '💡 DOĞU SINIRIMIZIN AŞAMALARI (G-M-K):\n'
          '1. Gümrü Antlaşması ➜ İlk çizildi.\n'
          '2. Moskova Antlaşması ➜ Büyük ölçüde belirlendi.\n'
          '3. KARS ANTLAŞMASI ➜ DOĞU SINIRI KESİNLEŞTİ.',
    ),

    // BÖLÜM 6: BÜYÜK TAARRUZ VE BAŞKOMUTANLIK MEYDAN MUHAREBESİ
    LectureSection(
      title: '6. Büyük Taarruz (26 Ağustos - 9 Eylül 1922) & Kurtuluş',
      type: LectureSectionType.overview,
      leadText: 'Yaklaşık 1 yıl süren gizli ve titiz hazırlıkların ardından düşmanı yurttan tamamen atan kutsal hücum.',
      bulletPoints: [
        'Taarruz Hazırlıkları:\n'
            '  • Doğu ve Güney cephelerindeki tüm silahlar Batı\'ya taşındı; İtalya ve Fransa\'dan satın alınan uçak ve toplar monte edildi; orduya gizlice taarruz eğitimi verildi; Akşehir\'de futbol turnuvası bahanesiyle komutanlar toplandı.',
        'Muharebenin Seyri:\n'
            '  • 26 Ağustos 1922 sabahı Kocatepe\'den topçu ateşiyle taarruz başladı.\n'
            '  • 30 Ağustos 1922: DUMLUPINAR\'da bizzat Mustafa Kemal Paşa\'nın yönettiği BAŞKOMUTANLIK MEYDAN MUHAREBESİ ile Yunan ordusunun ana gövdesi imha edildi; Yunan Başkomutanı General Trikopis esir alındı.\n'
            '  • Tarihi Emir: "ORDULAR! İLK HEDEFİNİZ AKDENİZ\'DİR, İLERİ!"\n'
            '  • 9 Eylül 1922: Türk süvarileri İzmir\'e girdi; Yunan bayrağı indirilip Türk bayrağı çekildi.\n'
            '  • 18 Eylül 1922\'ye kadar tüm Batı Anadolu düşmandan tamamen temizlendi.',
        '11 Ekim 1922 MUDANYA ATEŞKES ANTLAŞMASI:\n'
            '  • TBMM\'yi Batı Cephesi Komutanı İSMET İNÖNÜ temsil etti.\n'
            '  • Maddeleri: Türk ve Yunan kuvvetleri arasındaki çatışmalar durdurulacak; Doğu Trakya (Edirne, Kırklareli, Tekirdağ) 15 gün içinde boşaltılıp Türk idaresine (Refet Bele) devredilecek; İstanbul ve Boğazlar TBMM yönetimine bırakılacak.\n'
            '  • ÖNEMİ: DOĞU TRAKYA, İSTANBUL VE BOĞAZLAR TEK KURŞUN ATILMADAN SAVAŞSIZ KURTARILMIŞTIR! İstanbul\'un TBMM\'ye bırakılmasıyla OSMANLI DEVLETİ HUKUKEN SONA ERMİŞTİR.',
      ],
    ),

    // BÖLÜM 7: LOZAN BARIŞ ANTLAŞMASI (24 TEMMUZ 1923)
    LectureSection(
      title: '7. Lozan Barış Antlaşması (24 Temmuz 1923) - Türkiye\'nin Tapusu',
      type: LectureSectionType.formula,
      leadText: 'Sevr Antlaşması\'nı yırtıp atan, Türkiye Cumhuriyeti Devleti\'nin bağımsızlığını tüm dünyaya tescil ettiren diplomatik zafer.',
      bulletPoints: [
        'Konferans Öncesi Gelişme: SALTANATIN KALDIRILMASI (1 Kasım 1922):\n'
            '  • İtilaf Devletleri Lozan Konferansı\'na hem TBMM\'yi hem İstanbul Hükümeti\'ni davet ederek ikilik çıkarmak istedi.\n'
            '  • TBMM 1 Kasım 1922\'de SALTANATI KALDIRARAK bu oyunu bozdu ve konferansa sadece TBMM heyeti gitti. Osmanlı resmen sona erdi.',
        'Heyet Başkanı: İSMET İNÖNÜ (Hasan Saka ve Rıza Nur ile birlikte):\n'
            '  • Mustafa Kemal\'in heyetten KESİNLİKLE TAVİZ VERİLMEMESİNİ istediği 2 konu: 1) ERMENİ YURDU, 2) KAPİTÜLASYONLAR.',
        'Lozan\'da Alınan Tarihi Kararlar:\n'
            '  • 1. Sınırlar: Suriye Sınırı (1921 Ankara Antlaşması esas alındı, Hatay hariç); Irak Sınırı (MUSUL MESELESİ ÇÖZÜLEMEDİ, İngiltere ile ikili görüşmelere bırakıldı - LOZAN\'DA ÇÖZÜLEMEYEN TEK MESELEDİR); Batı Sınırı (Meriç nehri sınır kabul edildi, Karaağaç savaş tazminatı olarak Türkiye\'ye verildi); Ege Adaları (Gökçeada, Bozcaada, Tavşan Adaları Türkiye\'ye; On İki Ada İtalya\'ya; diğer adalar silahsızlandırılmak şartıyla Yunanistan\'a bırakıldı).\n'
            '  • 2. KAPİTÜLASYONLAR: Bütün adli, mali ve ticari kapitülasyonlar TAMAMEN VE KESİN OLARAK KALDIRILDI (Ekonomik bağımsızlık).\n'
            '  • 3. Azınlıklar: TÜM AZINLIKLAR TÜRK VATANDAŞI KABUL EDİLDİ; Avrupalıların iç işlerimize karışma bahanesi tamamen ortadan kalktı.\n'
            '  • 4. Nüfus Mübadelesi: Batı Trakya Türkleri ile İstanbul Rumları hariç (Etabli / Yerleşik), Anadolu\'daki Rumlar ile Yunanistan\'daki Türklerin zorunlu mübadelesi kararlaştırıldı.\n'
            '  • 5. Savaş Tazminatı: Yunanistan savaş tazminatı olarak Karaağaç ve Bosnaköy\'ü verdi.\n'
            '  • 6. Dış Borçlar: Osmanlı borçları Osmanlı\'dan ayrılan devletler arasında paylaştırıldı; Türkiye kendi payına düşeni Türk lirası ve Fransız frangı olarak taksitle ödemeyi kabul etti (Düyun-ı Umumiye kaldırıldı).\n'
            '  • 7. Boğazlar: Başkanı Türk olan uluslararası bir Boğazlar Komisyonu tarafından yönetilecek, her iki yakası silahsızlandırılacaktı (Misak-ı Millî\'ye aykırı tek karardır; 1936 Montrö ile tam egemenlik sağlanacaktır).\n'
            '  • 8. Patrikane: Siyasi yetkileri elinden alınarak sadece dini bir kurum olarak İstanbul\'da kalması kabul edildi; Yabancı okullar Türk kanunlarına bağlandı.',
      ],
      goldenRule: '💡 LOZAN\'DA ÇÖZÜLEMEYEN TEK KONU = MUSUL:\n'
          'Lozan Barış Konferansı\'nda sonuca bağlanamayıp sonraya bırakılan tek konu TÜRKİYE-IRAK SINIRI (MUSUL MESELESİ)\'dir.',
    ),
  ],
);
