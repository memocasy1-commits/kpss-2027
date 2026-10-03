import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu13AtaturkculukInkilaplar = LectureTopic(
  id: 'tarih_ataturkculuk_inkilaplar',
  courseId: 'tarih',
  order: 13,
  title: 'Atatürkçülük ve Türk İnkılabı',
  subtitle: '6 Temel İlke, Siyasal, Hukuk, Eğitim, Toplumsal, Ekonomi İnkılapları & Partiler',
  icon: Icons.auto_awesome_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 121 - 130',
  startTestNum: 121,
  endTestNum: 130,
  estimatedMinutes: 80,
  sections: [
    // BÖLÜM 1: 6 TEMEL İLKE VE BÜTÜNLEYİCİ İLKELER
    LectureSection(
      title: '1. Atatürk İlkeleri (6 Temel İlke) & Bütünleyici İlkeler',
      type: LectureSectionType.overview,
      leadText: 'Türk milletini çağdaş uygarlık düzeyinin üzerine çıkarmayı hedefleyen akılcı ve gerçekçi temel prensipler:',
      bulletPoints: [
        '1. CUMHURİYETÇİLİK:\n'
            '  • Temel kavramlar: Milli egemenlik, milli irade, seçim, oy, meclis, çok partili rejim, demokrasi.\n'
            '  • İlgili İnkılaplar: TBMM\'nin açılması, Saltanatın kaldırılması, Cumhuriyetin ilanı, Halifeliğin kaldırılması, Kadınlara siyasi hakların verilmesi, çok partili hayata geçiş denemeleri.',
        '2. MİLLİYETÇİLİK:\n'
            '  • Temel kavramlar: Milli bilinç, milli bağımsızlık, Türk dili ve tarihi, vatan sevgisi, birlik ve beraberlik (Irkçılığı ve ümmetçiliği kesinlikle reddeder).\n'
            '  • İlgili İnkılaplar: Kurtuluş Savaşı, TTK ve TDK\'nin kurulması, Kabotaj Kanunu (denizlerin millileştirilmesi), Kapitülasyonların kaldırılması, Türk parasını koruma kanunu, yabancı şirketlerin millileştirilmesi.',
        '3. HALKÇILIK:\n'
            '  • Temel kavramlar: Eşitlik, adalet, sınıfsız ve kaynaşmış toplum, sosyal adalet, imtiyazsızlık (Ağa, paşa, bey unvanlarının reddi).\n'
            '  • İlgili İnkılaplar: AŞAR VERGİSİNİN KALDIRILMASI (köylü rahatlatıldı), Medeni Kanun (kadın-erkek eşitliği), Tevhid-i Tedrisat (eğitimde fırsat eşitliği), Soyadı Kanunu (ayrıcalık belirten lakapların yasaklanması), Kadınlara seçme-seçilme hakkı.',
        '4. DEVLETÇİLİK:\n'
            '  • Temel kavramlar: Ekonomik kalkınma, kamu yatırımları, karma ekonomi, fabrikalar, bankalar, planlı kalkınma (Halkın elinde sermaye olmadığı için sanayi yatırımlarını devletin üstlenmesi).\n'
            '  • İlgili İnkılaplar: I. Beş Yıllık Sanayi Planı, Sümerbank, Etibank, Merkez Bankası, Karabük Demir-Çelik, şeker fabrikaları, demiryolları inşası.',
        '5. LAİKLİK:\n'
            '  • Temel kavramlar: Din ve devlet işlerinin ayrılması, din ve vicdan hürriyeti, akılcılık ve bilimsellik, dogmaların reddi.\n'
            '  • İlgili İnkılaplar: Saltanat ve Halifeliğin kaldırılması, Şer\'iye ve Evkaf Vekâletinin kaldırılması, Tevhid-i Tedrisat ve medreselerin kapatılması, Tekke-zaviye ve türbelerin kapatılması, Medeni Kanun, 1928\'de "Devletin dini İslam\'dır" maddesinin anayasadan çıkarılması, 1937\'de 6 ilkenin anayasaya girmesi.',
        '6. İNKILAPÇILIK:\n'
            '  • Temel kavramlar: Dinamizm, sürekli yenilenme, çağdaşlaşma, Batılılaşma, köhneleşmiş kurumları yıkıp yerine modernlerini kurma.\n'
            '  • İlgili İnkılaplar: Harf İnkılabı, Şapka ve kılık kıyafet, takvim, saat ve ölçülerde değişiklik, hafta tatilinin pazara alınması.',
        'Bütünleyici İlkeler:\n'
            '  • Milli Egemenlik (Cumhuriyetçilik),\n'
            '  • Milli Bağımsızlık ve Milli Birlik (Milliyetçilik),\n'
            '  • Akılcılık ve Bilimsellik (Laiklik),\n'
            '  • Yurtta Barış Dünyada Barış (Milliyetçilik/Halkçılık),\n'
            '  • İnsan ve İnsanlık Sevgisi (Halkçılık).',
      ],
      goldenRule: '💡 AŞAR VERGİSİ HANGİ İLKEDİR?\n'
          'Aşar vergisinin kaldırılması doğrudan KÖYLÜYE EŞİTLİK VE KOLAYLIK sağladığı için HALKÇILIK ilkesidir (ÖSYM\'nin en sevdiği sorudur!).',
      imageAssetPath: 'assets/images/tarih/tarih_ataturk_ilkeleri_zihin_haritasi.png',
      imageCaption: 'Atatürk İlkeleri (6 Temel İlke) ve Anahtar Kavramlar Zihin Haritası İnfografiği',
    ),

    // BÖLÜM 2: SİYASAL ALANDA YAPILAN İNKILAPLAR
    LectureSection(
      title: '2. Siyasal Alanda İnkılaplar & 3 Mart 1924 Kanunları',
      type: LectureSectionType.ruleList,
      leadText: 'Milli iradeyi egemen kılmak ve modern Türk Devleti\'nin temellerini atmak için yapılan devrimler:',
      bulletPoints: [
        '1. Saltanatın Kaldırılması (1 Kasım 1922):\n'
            '  • Lozan\'da ikilik çıkmasını önlemek için kaldırıldı. Laikliğin İLK BÜYÜK ADIMIDIR. Osmanlı Devleti RESMEN sona erdi.',
        '2. Ankara\'nın Başkent İlan Edilmesi (13 Ekim 1923):\n'
            '  • İsmet İnönü\'nün kanun teklifiyle Ankara yeni Türkiye\'nin başkenti oldu.',
        '3. CUMHURİYETİN İLANI (29 Ekim 1923):\n'
            '  • Nedenleri: Rejimin adının konulması gereği; Meclis Hükümeti Sistemi\'ndeki Hükümet Bunalımı (Ali Fethi Okyar istifası); devlet başkanlığı sorununun çözülmesi.\n'
            '  • Sonuçları: Rejimin adı CUMHURİYET oldu; KABİNE SİSTEMİNE geçildi; İLK CUMHURBAŞKANI MUSTAFA KEMAL ATATÜRK, İLK BAŞBAKAN İSMET İNÖNÜ, İLK TBMM BAŞKANI ALİ FETHİ OKYAR seçildi.',
        '4. 3 MART 1924 TARİHLİ DEVRİM KANUNLARI (Tarihin En Yoğun İnkılap Günü):\n'
            '  • HALİFELİK KALDIRILDI: Laikliğin en büyük adımı atıldı; ümmet toplumundan ulus topluma geçildi.\n'
            '  • Tevhid-i Tedrisat Kanunu çıkarıldı (Eğitim-öğretim birleştirildi, medreseler kapatıldı).\n'
            '  • Şer\'iye ve Evkaf Vekâleti kaldırıldı (Yerine DİYANET İŞLERİ BAŞKANLIĞI ve Vakıflar Genel Müdürlüğü kuruldu; ilk Diyanet İşleri Başkanı Rıfat Börekçi).\n'
            '  • Erkân-ı Harbiye Vekâleti kaldırıldı (Ordu siyasetten tamamen ayrıldı; Genelkurmay Başkanlığı kuruldu).\n'
            '  • Osmanlı Hanedanı üyeleri yurt dışına çıkarıldı.',
      ],
    ),

    // BÖLÜM 3: ÇOK PARTİLİ HAYATA GEÇİŞ DENEMELERİ VE TEPKİLER
    LectureSection(
      title: '3. Çok Partili Hayata Geçiş Denemeleri & Rejim İsyanları',
      type: LectureSectionType.overview,
      leadText: 'Demokrasinin ve milli iradenin tam tecellisi için partileşme çabaları ve rejime karşı çıkan gerici hareketler:',
      bulletPoints: [
        '1. Cumhuriyet Halk Fırkası (9 Eylül 1923):\n'
            '  • Mustafa Kemal tarafından kurulan TÜRKİYE\'NİN İLK SİYASİ PARTİSİDİR (Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti\'nin devamıdır).\n'
            '  • İlk genel başkanı Mustafa Kemal\'dir. Ekonomide Devletçilik ilkesini benimsemiştir.',
        '2. Terakkiperver Cumhuriyet Fırkası (1924 - İlk Muhalefet Partisi):\n'
            '  • Kurucuları (Şifre: K - A - R - A - R): Kâzım Karabekir (Başkan), Adnan Adıvar, Rauf Orbay, Ali Fuat Cebesoy, Refet Bele.\n'
            '  • Programı: Liberal ekonomi, yerinden yönetim ve "Fırka dini inanç ve fikirlere saygılıdır" maddesi.\n'
            '  • Kapanışı: ŞEYH SAİT İSYANI (1925) ile irtibatı görülerek Takrir-i Sükûn Kanunu kapsamında kapatıldı.',
        '3. Şeyh Sait İsyanı (13 Şubat 1925):\n'
            '  • CUMHURİYET REJİMİNE KARŞI ÇIKAN İLK İSYANDIR. İngiltere\'nin Musul meselesi için kışkırttığı dini görünümlü isyandır.\n'
            '  • Hükümet istifa etti; İsmet İnönü Hükümeti TAKRİR-İ SÜKÛN KANUNU\'NU (1925-1929) çıkardı ve İstiklal Mahkemeleri isyanı bastırdı.\n'
            '  • Dış Etkisi: TÜRKİYE ŞEYH SAİT İSYANI YÜZÜNDEN MUSUL\'U KAYBETMEK ZORUNDA KALMIŞTIR (1926 Ankara Antlaşması).',
        '4. İzmir Suikastı Girişimi (1926):\n'
            '  • Eski İttihatçıların Mustafa Kemal\'e düzenlemek istediği suikast motorcu Şevki\'nin ihbarıyla engellendi. Mustafa Kemal\'in sözü: "BENİM NAÇİZ VÜCUDUM ELBET BİR GÜN TOPRAK OLACAKTIR FAKAT TÜRKİYE CUMHURİYETİ İLELEBET PAYİDAR KALACAKTIR."\n'
            '  • UYARI: İstiklal Mahkemeleri\'nin görev yaptığı EN SON OLAY İZMİR SUİKASTI DAVASIDIR!',
        '5. Serbest Cumhuriyet Fırkası (1930):\n'
            '  • 1929 Dünya Ekonomik Buhranı sonrası Mustafa Kemal\'in ricasıyla ALİ FETHİ OKYAR tarafından kurulan ikinci muhalefet partisidir (Liberal ekonomiyi savunmuştur).\n'
            '  • Rejim karşıtlarının partiye doluşması üzerine Fethi Bey partiyi kendisi feshetmiştir.\n'
            '  • Menemen (Kubilay) Olayı (23 Aralık 1930): Derviş Mehmet\'in Asteğmen Öğretmen Kubilay\'ı şehit ettiği irtica olayıdır (Divan-ı Harp\'te yargılandılar).\n'
            '  • Sonuç: Çok partili hayata geçiş denemelerine 1946 yılına kadar ARA VERİLMİŞTİR.',
      ],
      goldenRule: '💡 İSTİKLAL MAHKEMELERİ EN SON NEREDE KULLANILDI?\n'
          'İstiklal Mahkemeleri Menemen Olayı\'nda YOKTUR (Menemen\'de askeri mahkeme Divan-ı Harp kuruldu!). İstiklal Mahkemeleri en son 1926 İZMİR SUİKASTI\'nda görev yapmıştır.',
    ),

    // BÖLÜM 4: HUKUK ALANINDA İNKILAPLAR VE MEDENİ KANUN
    LectureSection(
      title: '4. Hukuk Alanında İnkılaplar: Türk Medeni Kanunu (1926)',
      type: LectureSectionType.formula,
      leadText: 'Şer\'i ve örfi hukuk karmaşasına son veren, laik ve modern hukuk sistemine geçiş:',
      bulletPoints: [
        'Anayasalar:\n'
            '  • 1921 Anayasası (Teşkilat-ı Esasiye): İlk ve tek yumuşak/çerçeve anayasa.\n'
            '  • 1924 Anayasası: En uzun süre yürürlükte kalan anayasadır (1928\'de "Devletin dini İslam\'dır" çıkarıldı; 1934\'te kadınlara seçme-seçilme hakkı girdi; 1937\'de 6 Atatürk ilkesi girdi).',
        '17 Şubat 1926 TÜRK MEDENİ KANUNU (İsviçre\'den Alındı):\n'
            '  • Osmanlı\'nın Mecelle kanunu kaldırıldı. İsviçre\'den alınma nedenleri: Pratik, akılcı, demokratik ve kadın-erkek eşitliğine en uygun modern kanun olması.\n'
            '  • Getirdiği Yenilikler:\n'
            '    - Tek eşlilik (monogami) ve RESMİ NİKÂH zorunluluğu getirildi.\n'
            '    - Kadınlara boşanma hakkı, mirasta erkekle EŞİT pay alma hakkı tanındı.\n'
            '    - Mahkemelerde kadınların şahitliği erkekle eşitlendi.\n'
            '    - Kadınlara istediği mesleğe girme ve çalışma hakkı tanındı.\n'
            '    - Patrikhanenin din dışındaki hukuki ve mahkeme yetkileri elinden alındı.\n'
            '  • ÇOK ÖNEMLİ ÖSYM TUZAĞI: TÜRK MEDENİ KANUNU\'NDA KADINLARA SİYASİ HAK (Seçme ve Seçilme Hakkı) KESİNLİKLE YOKTUR!',
        'Türk Kadınına Siyasi Hakların Verilmesi (Şifre: 034 B - M - W):\n'
            '  • 1930 ➜ B: BELEDİYE seçimlerine katılma hakkı\n'
            '  • 1933 ➜ M: MUHTARLIK seçimlerine katılma hakkı (İlk kadın muhtar: Gül Esin)\n'
            '  • 1934 ➜ W (V): VEKİL (Milletvekili) seçme ve seçilme hakkı (1935 seçimlerinde 18 kadın milletvekili meclise girdi; ilk kadın muhtar Gül Esin, ilk kadın hekim Safiye Ali, ilk kadın avukat Beyhan Hanım, ilk kadın pilot Sabiha Gökçen).',
      ],
      goldenRule: '💡 MEDENİ KANUNDA SİYASİ HAK YOKTUR:\n'
          'Medeni Kanun sadece SOSYAL, HUKUKİ ve EKONOMİK haklar getirmiştir. Kadınlar siyasi haklarını 1930, 1933 ve 1934\'te anayasa değişiklikleriyle kazanmıştır (034 BMW).',
    ),

    // BÖLÜM 5: EĞİTİM, KÜLTÜR VE TOPLUMSAL İNKILAPLAR
    LectureSection(
      title: '5. Eğitim, Kültür, Harf İnkılabı & Toplumsal Devrimler',
      type: LectureSectionType.comparison,
      leadText: 'Milli, laik ve çağdaş bir toplum yapısı inşa etmek için atılan dev adımlar:',
      bulletPoints: [
        'Eğitim ve Kültür İnkılapları:\n'
            '  • 3 Mart 1924 Tevhid-i Tedrisat Kanunu: Tüm okullar MEB\'e bağlandı; medreseler kapatıldı; eğitim milli ve laik hale getirildi.\n'
            '  • 1 KASIM 1928 HARF İNKILABI: Yeni Türk Harfleri (Latin esaslı Türk Alfabesi) kabul edildi. Okuma-yazma seferberliği başlatıldı.\n'
            '  • 24 Kasım 1928 MİLLET MEKTEPLERİ: Yeni harfleri yetişkin halka öğretmek için açıldı. Mustafa Kemal\'e "BAŞÖĞRETMEN" unvanı verildi (24 Kasım Öğretmenler Günü).\n'
            '  • 1931 TÜRK TARİH KURUMU (TTK): Türk tarih tezini araştırmak, Türklerin sarı ırktan olmadığını ve dünya medeniyetine katkılarını kanıtlamak için kuruldu (Süreli yayını: Belleten).\n'
            '  • 1932 TÜRK DİL KURUMU (TDK): Türkçeyi yabancı dillerin boyunduruğundan kurtarmak ve zenginleştirmek için kuruldu.\n'
            '  • 1933 ÜNİVERSİTE REFORMU: İsviçreli Profesör Albert Malche\'nin raporu doğrultusunda Darülfünun kapatılarak modern İSTANBUL ÜNİVERSİTESİ kuruldu. Ankara Hukuk ve Dil-Tarih Coğrafya Fakültesi açıldı.',
        'Toplumsal Alanda İnkılaplar:\n'
            '  • 1925 Şapka Kanunu (Mustafa Kemal Kastamonu\'da tanıttı).\n'
            '  • 1925 Tekke, Zaviye ve Türbelerin Kapatılması (Şeyhlik, dervişlik, müritlik unvanları yasaklandı).\n'
            '  • 1934 SOYADI KANUNU: Her ailenin Türkçe bir soyadı alması zorunlu kılındı. Ağa, hacı, hafız, paşa gibi lakaplar yasaklandı (Eşitlik - Halkçılık). TBMM Mustafa Kemal Paşa\'ya "ATATÜRK" soyadını verdi.\n'
            '  • Takvim, Saat ve Ölçülerde Değişiklik: Hicri/Rumi takvim yerine Miladi Takvim (1926); Alaturka saat yerine Uluslararası Saat; Arşın ve endaze yerine Metre/Kilo; Hafta tatili cumadan PAZARA alındı (1935). AMAÇ: Batı ile ticari ve ekonomik uyum sağlamak.',
      ],
    ),

    // BÖLÜM 6: EKONOMİK ALANDA YAPILAN İNKILAPLAR
    LectureSection(
      title: '6. Ekonomi İnkılapları: İzmir İktisat Kongresi & Sanayi Hamlesi',
      type: LectureSectionType.ruleList,
      leadText: '"Siyasi ve askeri zaferler ne kadar büyük olursa olsun, ekonomik zaferlerle taçlandırılmazsa kalıcı olamaz."',
      bulletPoints: [
        '1. 1923 İZMİR İKTİSAT KONGRESİ (Misak-ı İktisadî):\n'
            '  • Başkanlığını Kâzım Karabekir yapmıştır. Çiftçi, tüccar, sanayici ve işçi temsilcileri katılmıştır.\n'
            '  • Alınan Kararlar: Yerli malı kullanımı teşvik edilecek; tekelcilik önlenecek; demiryolu yapımına ağırlık verilecek; milli bankalar kurulacak; hammaddeyi yurt içinden temin eden sanayiye öncelik verilecek.',
        '2. Tarım ve Denizcilik Alanındaki Gelişmeler:\n'
            '  • 1925 AŞAR VERGİSİNİN KALDIRILMASI: Köylünün sırtındaki ağır vergi kaldırılarak tarımsal üretim teşvik edildi (Halkçılık).\n'
            '  • Atatürk Orman Çiftliği kuruldu; Ziraat Bankası\'nın çiftçiye verdiği krediler artırıldı; Yüksek Ziraat Enstitüsü açıldı.\n'
            '  • 1 TEMMUZ 1926 KABOTAJ KANUNU: Türk karasularında yük ve yolcu taşıma hakkı yalnızca Türk gemilerine verildi. DENİZLERİMİZ MİLLİLEŞTİRİLDİ (Milliyetçilik - Denizcilik ve Kabotaj Bayramı).',
        '3. Ticaret ve Sanayi Hamleleri:\n'
            '  • 1924 TÜRKİYE İŞ BANKASI: İlk özel milli bankadır (İlk Genel Müdürü Celal Bayar).\n'
            '  • 1927 Teşvik-i Sanayi Kanunu çıkarıldı, ancak halkın elinde sermaye ve bilgi birikimi olmadığı için özel sektör istenen atılımı yapamadı.\n'
            '  • 1929 DÜNYA EKONOMİK BUHRANI (Kara Perşembe) ve DEVLETÇİLİK MODELİNE GEÇİŞ: Türkiye planlı ekonomiye geçti.\n'
            '  • I. Beş Yıllık Sanayi Planı (1933-1934): Sovyet uzmanların desteğiyle hazırlandı ve başarıyla uygulandı. Şeker fabrikaları, pamuklu dokuma tesisleri, cam ve çimento fabrikaları açıldı.\n'
            '  • 1930 Türkiye Cumhuriyet Merkez Bankası (TCMB) kuruldu.\n'
            '  • 1933 SÜMERBANK (tekstil ve sanayi) ve 1935 ETİBANK (madencilik) kuruldu.\n'
            '  • 1935 Maden Tetkik Arama Enstitüsü (MTA) kuruldu.\n'
            '  • 1939 KARABÜK DEMİR-ÇELİK FABRİKASI: Türkiye\'nin ilk ağır sanayi fabrikasıdır.',
      ],
      goldenRule: '💡 İLK ÖZEL BANKA = İŞ BANKASI (1924):\n'
          'Cumhuriyet döneminin ilk özel milli bankası İŞ BANKASI (Celal Bayar); madenciliği finanse eden banka ETİBANK; sanayiyi finanse eden banka SÜMERBANK\'tır.',
    ),
  ],
);
