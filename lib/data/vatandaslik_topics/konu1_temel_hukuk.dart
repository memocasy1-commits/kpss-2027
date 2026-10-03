import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu1TemelHukuk = LectureTopic(
  id: 'vat_konu1',
  courseId: 'vatandaslik',
  order: 1,
  title: 'Temel Hukuk Bilgisi',
  subtitle: 'Toplumsal Düzen, Yaptırım Türleri, Hukukun Kaynakları ve Hak Kavramı',
  icon: Icons.gavel_rounded,
  color: Color(0xFF7C3AED),
  testRange: 'Test 1 - 8',
  startTestNum: 1,
  endTestNum: 8,
  estimatedMinutes: 65,
  sections: [
    LectureSection(
      title: 'Toplumsal Düzen Kuralları ve Hukukun Ayırt Edici Özellikleri',
      type: LectureSectionType.overview,
      leadText: 'İnsanların bir arada barış, adalet ve güvenlik içinde yaşayabilmesi için toplum hayatını düzenleyen çeşitli kurallar bütünü geliştirilmiştir.',
      bulletPoints: [
        'Din Kuralları: İlahi iradeye dayanan, emir ve yasaklardan oluşan kurallardır. Yaptırımı MANEVİDİR (günahkâr sayılma, cehennem azabı vb.).',
        'Ahlak Kuralları: Toplumda iyilik-kötülük ve erdem ölçütlerine göre şekillenen kurallardır. Öznel (bireyin kendi vicdanına karşı sorumluluğu) ve Nesnel (bireyin başkalarına karşı ödevleri) olmak üzere ikiye ayrılır. Yaptırımı MANEVİDİR (ayıplanma, kınanma, dışlanma).',
        'Görgü (Adab-ı Muaşeret) Kuralları: Belli olaylarda, törenlerde, selamlaşma ve yeme-içmede uyulması beklenen davranış kalıplarıdır. Yaptırımı MANEVİDİR (görgüsüz sayılma, alay edilme).',
        'Örf ve Âdet Kuralları: Toplumda çok uzun zamandan beri uygulanan (maddi unsur) ve uyulmasının zorunlu olduğuna genel bir inanç bulunan (manevi unsur) kurallardır. Yaptırımı ilke olarak MANEVİDİR.',
        'Hukuk Kuralları: Devlet gücüyle (kamusal kudret) desteklenen, toplum barışını ve adaletini sağlayan, uyulması zorunlu kurallardır. Yaptırımı MADDİDİR (devlet zorlaması - cebir içerir).'
      ],
      goldenRule: 'Tüm sosyal düzen kuralları toplumu düzenlemeyi amaçlar ancak HUKUK KURALINI diğerlerinden ayıran yegâne temel fark; arkasında DEVLET GÜCÜ (maddi yaptırım) bulunmasıdır.',
      osymTrap: 'ÖSYM sıklıkla \'Hukuk kurallarının tek amacı toplumda eşitliği sağlamaktır\' çeldiricisini kullanır. Hukukun temel amaçları adalet, barış, güvenlik ve toplumsal gereksinimleri karşılamaktır; salt mutlak eşitlik sağlamak hukukun tek veya birincil amacı değildir.'
    ),
    LectureSection(
      title: 'Hukuk Kurallarının Nitelikleri ve Yaptırım (Müeyyide) Türleri',
      type: LectureSectionType.ruleList,
      leadText: 'Hukuk kurallarına aykırı davranıldığında devlet gücüyle karşılaşılacak hukuki tepkilere yaptırım (müeyyide) denir. KPSS\'de her yıl kesinlikle bir yaptırım sorusu gelmektedir.',
      bulletPoints: [
        '1. CEZA: Ceza hukuku kurallarını ihlal eden kişilere (suç işleyenlere) uygulanan şahsi hürriyeti bağlayıcı yaptırımdır. Hapis cezaları (ağırlaştırılmış müebbet, müebbet, süreli hapis) ve Adli Para Cezası olmak üzere iki temel türü vardır. Disiplin cezaları (uyarma, kınama, aylıktan kesme vb.) da idari nitelikli cezalardır.',
        '2. CEBRİ İCRA: Borcunu veya hukuki yükümlülüğünü rızasıyla yerine getirmeyen kimseye karşı devlet gücü (icra dairesi, polis, haciz) kullanılarak yükümlülüğün ZORLA yerine getirilmesidir (örneğin borçlunun taşınmazının satılarak alacaklıya ödenmesi).',
        '3. TAZMİNAT: Hukuka aykırı bir eylemle (haksız fiil) veya sözleşmeye aykırılıkla başkasına verilen zararın para ile giderilmesidir. Maddi Tazminat (malvarlığı zararları) ve Manevi Tazminat (kişilik haklarına, şeref ve haysiyete yönelik elem ve ıstırap) olarak ikiye ayrılır.',
        '4. ESKİ HALE GETİRME (REMEDY): İhlal edilen hukuki durumun ihlalden önceki durumuna geri döndürülmesidir (örneğin haksız yere işgal edilen arazinin boşaltılması, sınır tecavüzünün yıktırılması).',
        '5. İPTAL: İdarenin hukuka aykırı olarak tesis ettiği idari işlemlerin (örneğin haksız memuriyetten çıkarma, hukuka aykırı yıkım kararı), idari yargı organları (İdare Mahkemesi, Danıştay) tarafından geçmişe etkili olarak ortadan kaldırılmasıdır.',
        '6. HÜKÜMSÜZLÜK (GEÇERSİZLİK): Hukuki işlemlerin kanunun aradığı kurucu veya geçerlilik şartlarına uymaması nedeniyle hukuken sonuç doğurmamasıdır.'
      ],
      goldenRule: 'Yaptırım türlerini asla karıştırma: Birey bireye zarar verirse TAZMİNAT; birey borcunu ödemezse devlet zoruyla CEBRİ İCRA; idare hukuka aykırı işlem yaparsa idari yargıda İPTAL davası açılır.',
      osymTrap: 'ÖSYM Tuzakları: İPTAL yaptırımı yalnızca İDARİ İŞLEMLER için geçerlidir! Bireyler arasındaki sözleşmeler iptal edilmez; sözleşmeler feshedilir, butlanla sakatlanır veya dönülür.'
    ),
    LectureSection(
      title: 'Hükümsüzlük (Geçersizlik) Türleri ve İncelikleri',
      type: LectureSectionType.comparison,
      leadText: 'Özel hukukta yapılan işlemlerin geçersizlik dereceleri kurucu unsurlara ve geçerlilik şartlarına göre kademelendirilir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Yokluk: Hukuki işlemin kurucu unsurlarından birinin tamamen eksik olmasıdır. İşlem hukuken hiç doğmamıştır (Örn: Resmi evlendirme memuru olmadan imam nikahı ile evlenme, tarafların irade beyanının hiç bulunmaması).',
          wrong: 'Butlan sanılması: Yoklukta işlem doğmamıştır; butlanda ise doğmuş fakat sakattır.',
          note: 'Hakim re\'sen (kendiliğinden) dikkate alır, zamanaşımına uğramaz.'
        ),
        ComparisonRow(
          correct: 'Mutlak Butlan: Kurucu unsurlar tamdır ancak işlem kamu düzenine, ahlaka, kişilik haklarına veya emredici hukuk kurallarına açıkça aykırıdır ya da fiil ehliyeti tamamen yoktur (Örn: Ayırt etme gücü olmayan birinin evlenmesi, akıl hastasının ev satması, amca ile yeğenin evlenmesi).',
          wrong: 'Nisbi Butlan sanılması: Mutlak butlanda kamu menfaati ihlal edilmiştir; sonradan düzeltilemez ve onaylanamaz.',
          note: 'Kamu düzenini ilgilendirdiği için herkes ileri sürebilir, hakim re\'sen gözetir.'
        ),
        ComparisonRow(
          correct: 'Nisbi Butlan (İptal Edilebilirlik): İşlem geçerli olarak kurulmuştur ancak irade fesada uğramıştır (Hata, Hile, Tehdit/Korkutma) veya aşırı yararlanma (Gabin) vardır.',
          wrong: 'Kendiliğinden geçersiz sanılması: İradesi sakatlanan taraf 1 yıllık hak düşürücü süre içinde iptal hakkını kullanmazsa işlem tamamen geçerli hale gelir.',
          note: 'Hakim kendiliğinden gözetemez; yalnızca mağdur taraf ileri sürebilir.'
        ),
        ComparisonRow(
          correct: 'Askıda Hükümsüzlük (Tek Taraflı Bağlamazlık): Sınırlı ehliyetsizlerin (ayırt etme gücüne sahip küçükler ve kısıtlılar), yasal temsilcilerinin (veli/vasi) izni olmadan yaptıkları işlemlerdir.',
          wrong: 'Kesin hükümsüz sanılması: Veli veya vasi sonradan icazet (onay) verirse işlem baştan itibaren geçerli hale gelir; onay vermezse hükümsüz kalır.',
          note: 'İşlem karşı tarafı bağlar ancak ehliyetsizi veli onayı gelene kadar bağlamaz.'
        )
      ],
      goldenRule: 'FORMÜL: Kurucu unsur yoksa = YOKLUK; Emredici kurala/ahlaka/ehliyetsizliğe aykırılık varsa = MUTLAK BUTLAN; Hile/Korkutma/Hata varsa = NİSBİ BUTLAN; Yetkisiz temsil/Velisiz işlem varsa = ASKIDA HÜKÜMSÜZLÜK.',
      osymTrap: 'ÖSYM Soru Tuzağı: İrade sakatlığı (hata, hile, korkutma) işlemi MUTLAK BUTLAN yapmaz! İşlem geçerlidir, askıda değildir; sadece NİSBİ BUTLAN (iptal edilebilirlik) oluşturur ve 1 yıl içinde iptal davası açılmalıdır.'
    ),
    LectureSection(
      title: 'Hukukun Kaynakları ve Normlar Hiyerarşisi',
      type: LectureSectionType.ruleList,
      leadText: 'Hukukun kaynakları Yazılı Kaynaklar (Asli), Yazısız Kaynaklar (Asli) ve Yardımcı Kaynaklar olmak üzere üçe ayrılır. Hans Kelsen\'in geliştirdiği Normlar Hiyerarşisi ilkesine göre alttaki norm üstteki norma asla aykırı olamaz.',
      bulletPoints: [
        '1. ANAYASA: Normlar hiyerarşisinin en tepesindedir. Hiçbir kanun, kararname veya kural Anayasa\'ya aykırı olamaz (Madde 11 - Anayasa\'nın Bağlayıcılığı ve Üstünlüğü).',
        '2. KANUN ve MİLLETLERARASI ANTLAŞMALAR: TBMM tarafından kabul edilir. Usulüne göre yürürlüğe konulmuş temel hak ve özgürlüklere ilişkin milletlerarası antlaşmalar ile kanunların aynı konuda farklı hükümler içermesi durumunda MİLLETLERARASI ANTLAŞMA hükümleri esas alınır (Madde 90).',
        '3. CUMHURBAŞKANLIĞI KARARNAMESİ (CBK): Yürütme yetkisine ilişkin konularda çıkarılır. Kanunun açıkça düzenlediği konularda CBK çıkarılamaz; kanun ile CBK çatışırsa KANUN hükümleri uygulanır.',
        '4. YÖNETMELİK: Cumhurbaşkanı, bakanlıklar ve kamu tüzel kişileri tarafından, kendi görev alanlarını ilgilendiren kanun ve CBK\'lerin uygulanmasını sağlamak üzere çıkarılır.',
        '5. GENELGE, YÖNERGE, TEBLİĞ: İdarenin iç işleyişini ve ast personele emirleri düzenleyen adsız düzenleyici işlemlerdir.',
        'YAZISIZ KAYNAKLAR (Örf ve Âdet Hukuku): Maddi unsur (eskilik/süreklilik), manevi unsur (genel inanç) ve hukuki unsur (devlet yaptırımı ile desteklenme) bir arada bulunmalıdır. Ceza hukukunda örf ve adete dayanılarak suç ve ceza ihdas EDİLEMEZ (Kanunilik ilkesi).',
        'YARDIMCI KAYNAKLAR: Yargısal Kararlar (İçtihatlar) ve Bilimsel Görüşler (Doktrin/Öğreti). Hakim bunlara uymak zorunda DEĞİLDİR; bağlayıcı değildir.',
        'İÇTİHADI BİRLEŞTİRME KARARLARI (İBK): Yargıtay ve Danıştay Genel Kurullarınca benzer konularda verilen çelişkili kararları yeknesaklaştırmak için alınır. DİKKAT: İBK\'lar yardımcı kaynak değil, KANUN GİBİ BAĞLAYICI ASLİ KAYNAKTIR!'
      ],
      goldenRule: 'NORMLAR PİRAMİDİ SIRASI: Anayasa > Kanun = Milletlerarası Antlaşma = İBK > CBK > Yönetmelik > Genelge/Yönerge. Üstteki kural her zaman alttakini ilga eder (geçersiz kılar).',
      osymTrap: 'ÖSYM Çeldiricisi: \'İçtihadı Birleştirme Kararları yardımcı kaynaktır\' ifadesi KESİNLİKLE YANLIŞTIR. Mahkeme içtihatları yardımcı kaynaktır ANCAK İçtihadı Birleştirme Kararları tüm mahkemeleri ve hakimleri bağlayan YAZILI ASLİ KAYNAKTIR!',
      imageAssetPath: 'assets/images/vatandaslik/vatandaslik_normlar_hiyerarsisi.png',
      imageCaption: 'Normlar Hiyerarşisi (Hans Kelsen Piramidi ve Norm Üstünlüğü Sıralaması)',
    ),
    LectureSection(
      title: 'Boşluk Türleri ve Hakimin Hukuk Yaratması',
      type: LectureSectionType.overview,
      leadText: 'Hakim önüne gelen uyuşmazlıkta somut olaya uygulanacak kural bulunup bulunmadığına göre hareket eder.',
      bulletPoints: [
        'Kural İçi Boşluk: Kanun koyucunun bilerek, isteyerek ve kasten bıraktığı boşluktur. Amacı hakimin somut olayın özelliklerine göre takdir yetkisini kullanmasıdır (Örn: TMK Madde 4 - Hakim takdir yetkisini hakkaniyete göre kullanır; nafakaya hükmederken eşlerin durumunu gözetir).',
        'Kural Dışı Boşluk (Kanun Boşluğu): Kanunda uygulanabilir yazılı hiçbir hükmün bulunmaması durumudur. İki alt türe ayrılır:',
        '  a) Açık Boşluk (Gerçek Kanun Boşluğu): Somut olaya uygulanabilecek ne genel ne de özel hiçbir yazılı kuralın bulunmamasıdır.',
        '  b) Örtülü Boşluk (Gerçek Olmayan Kanun Boşluğu): Kanunda bir hüküm vardır ancak bu hüküm lafzıyla olaya uygulandığında adaletsiz veya mantıksız sonuç doğurmaktadır; kanunun amacına uygun bir istisna hükmü eksiktir (Gaye kuralına göre daraltıcı yorum yapılır).',
        'Hukuk Boşluğu: Somut olaya uygulanacak YAZILI VE YAZISIZ (örf-adet) hiçbir kaynağın bulunmaması durumudur.',
        'HAKİMİN HUKUK YARATMASI: Hukuk boşluğu durumunda hakim, \'Kendisi kanun koyucu olsaydı nasıl bir kural koyacak idiyse\' ona göre kural koyarak uyuşmazlığı çözer (TMK Madde 1). Hakimin yarattığı hukuk diğer hakimleri BAĞLAMAZ; bir içtihada dönüşür.'
      ],
      goldenRule: 'KODLAMA SIRASI: 1. Yazılı kural var mı? (Varsa uygula). 2. Yoksa Kanun Boşluğu -> Örf ve Adete bak. 3. Örf ve adette de yoksa Hukuk Boşluğu -> Hakim Hukuk Yaratır (Kanun koyucu gibi davranır). Kural içi boşlukta ise hakimin hukuk yaratması değil, TAKDİR YETKİSİ söz konusudur.',
      osymTrap: 'ÖSYM\'nin en sevdiği tuzak: \'Hakim kural içi boşlukta hukuk yaratır\' der. YANLIŞTIR! Hakim kural içi boşlukta TAKDİR YETKİSİNİ kullanır; sadece ve sadece HUKUK BOŞLUĞUNDA (yazılı ve yazısız kural yokken) HUKUK YARATIR!'
    ),
    LectureSection(
      title: 'Hak Kavramı, Kazanılması, Kaybedilmesi ve Korunması',
      type: LectureSectionType.ruleList,
      leadText: 'Hukuk düzeni tarafından korunan ve kişilere tanınan menfaatlere hak denir.',
      bulletPoints: [
        'Hakkın Kazanılmasında Geçerli İlke: İYİNİYET (Subjektif İyiniyet - TMK Madde 3). Bir hakkın kazanılmasına engel olan hukuki eksikliği bilmeme ve gerekli özen gösterilse dahi bilebilecek durumda olmamadır.',
        'Hakkın Kullanılmasında ve Borçların İfasında Geçerli İlke: DÜRÜSTLÜK KURALI (Objektif İyiniyet - TMK Madde 2). Herkes haklarını kullanırken ve borçlarını yerine getirirken dürüst bir kimsenin davranması gerektiği gibi davranmak zorundadır. Hakkın açıkça kötüye kullanılmasını hukuk düzeni korumaz.',
        'Hakların Korunması Yolları: Kural olarak haklar DEVLET ELİYLE (Dava ve İcra yoluyla) korunur. Kişinin kendi hakkını bizzat kuvvet kullanarak koruması (İhkak-ı Hak) yasaktır.',
        'Kişinin Kendi Hakkını Korumasının İstisnaları (Meşru Kuvvet Kullanımı):',
        '  a) Meşru Müdafaa (Haklı Savunma): Kendisine veya başkasına yönelik gerçekleşen ya da gerçekleşmesi muhakkak olan haksız bir saldırıyı o anda orantılı kuvvetle defetmektir. Hukuka uygundur; ne tazminat ne de ceza sorumluluğu doğar.',
        '  b) Zaruret (Iztırar / Zorda Kalma) Hali: Kendisinin veya başkasının hayatını veya malını derhal meydana gelecek bir tehlikeden korumak için, olayla hiç ilgisi olmayan masum bir üçüncü kişinin malına zarar vermesidir. Ceza verilmez ancak HAKKANİYET TAZMİNATI ödenir (Meşru müdafaadan temel farkı budur!).',
        '  c) Kuvvet Kullanma (Kendi Hakkını Bizzat Koruma): Devlet organlarının müdahalesinin zamanında sağlanamayacağı ve hakkın kaybolma tehlikesi altında bulunduğu acil hallerde orantılı güçle durumun muhafaza edilmesidir (Örn: Otel müşterisinin hesabı ödemeden kaçarken valizine el konulması).'
      ],
      goldenRule: 'KAZANILIRKEN = İYİNİYET (Subjektif); KULLANILIRKEN ve BORÇ ÖDENİRKEN = DÜRÜSTLÜK (Objektif). Saldırana zarar verirsen MEŞRU MÜDAFAA (Tazminat yok); Masuma zarar verirsen ZARURET HALİ (Tazminat var).',
      osymTrap: 'ÖSYM Tuzak Sorusu: Zaruret halinde (ıztırar) kusursuz üçüncü şahsa verilen zarar için tazminat ödenir mi? EVET! Hakim hakkaniyet gereği zarar gören masum şahsa uygun bir tazminat takdir eder.'
    ),
    LectureSection(
      title: 'Kişilik Hakları ve Ehliyet Türleri (Hak ve Fiil Ehliyeti)',
      type: LectureSectionType.comparison,
      leadText: 'Hukukta kişi, hak ve borçlara sahip olabilen varlıklardır. Gerçek Kişiler ve Tüzel Kişiler olmak üzere ikiye ayrılır.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Hak Ehliyeti: Haklara ve borçlara sahip olabilme yeteneğidir. PASİFTİR. Sağ ve tam doğum şartıyla ANA RAHMİNE DÜŞÜLDÜĞÜ (cenin) andan itibaren başlar. Genellik ve eşitlik ilkeleri geçerlidir; tüm insanlar doğuştan eşittir.',
          wrong: 'Fiil ehliyeti sanılması: Yeni doğan bir bebeğin hak ehliyeti vardır ancak fiil ehliyeti yoktur.',
          note: 'Sağ ve tam doğmak kaydıyla geriye etkili olarak cenin iken başlar.'
        ),
        ComparisonRow(
          correct: 'Fiil Ehliyeti: Kendi işlem ve eylemleriyle hak kazanabilme ve borç altına girebilme yeteneğidir. AKTİFTİR. Şartları: 1. Ayırt etme gücüne sahip olmak (Mümeyyizlik - En temel şart), 2. Ergin (Reşit) olmak (18 yaşını doldurmak), 3. Kısıtlı (Mahcur) olmamak.',
          wrong: 'Erginliğin tek yolunun 18 yaş sanılması: Evlenme ergin kılar (olağan 17, olağanüstü mahkeme kararıyla 16). Ayrıca 15 yaşını dolduran küçüğün kendi isteği, veli rızası ve mahkeme kararıyla ergin kılınması (Kazai Rüşt) mümkündür.',
          note: 'Kazai rüşt ile ergin kılınan kişi evlenemez ve oy kullanamaz; sadece medeni haklarını kullanabilir.'
        )
      ],
      goldenRule: 'FİİL EHLİYETİ DERECELERİ: 1. Tam Ehliyetliler (Mümeyyiz + Reşit + Kısıtlı Değil). 2. Sınırlı Ehliyetliler (Kendisine yasal danışman atananlar veya evliler). 3. Sınırlı Ehliyetsizler (Ayırt etme gücü var ama reşit değil veya kısıtlı). 4. Tam Ehliyetsizler (Ayırt etme gücü HİÇ YOKTUR; yaptıkları işlemler mutlak butlanla geçersizdir!).',
      osymTrap: 'ÖSYM Soru Kalıbı: Sınırlı ehliyetsizler (ayırt etme gücü olan çocuk veya vasi altındaki kısıtlı) veli izni olsa dahi şu üç işlemi KESİNLİKLE YAPAMAZLAR: 1. Kefil olamazlar, 2. Vakıf kuramazlar, 3. Önemli bağışta bulunamazlar! Veli onay verse bile bu işlemler geçersizdir.'
    ),
    LectureSection(
      title: 'Hısımlık (Akrabalık) ve Derece Hesaplama Kuralları',
      type: LectureSectionType.ruleList,
      leadText: 'Hısımlık; Kan Hısımlığı (Soybağı), Kayın Hısımlığı (Evlenme ile eşin akrabalarıyla kurulan bağ) ve Evlat Edinme Hısımlığı olmak üzere üçe ayrılır.',
      bulletPoints: [
        'Üstsoy - Altsoy Hısımlığı (Düzçizgi): Birbirinden üreyen kişiler arasındaki bağdır. Babanız, anneniz, dedeniz üstsoydur; çocuklarınız, torunlarınız altsoydur.',
        'Civar (Yansoy) Hısımlığı: Birbirinden üremeyip ortak bir kökten gelen kişilerdir. Kardeşler, amca, dayı, hala, teyze ve kuzenler yansoy hısımdır.',
        'DERECE HESAPLAMA ALTIN KURALI: İki kişi arasındaki doğum sayısı toplanır! Her bir doğum bir derece demektir.',
        '  - Anne / Baba ile Çocuk: 1. Derece Düzçizgi (Üstsoy/Altsoy).',
        '  - Dede / Nine ile Torun: 2. Derece Düzçizgi.',
        '  - Kardeşler: 2. Derece Yansoy (Kendinden anne-babaya 1 doğum, oradan kardeşe 1 doğum = Toplam 2 doğum).',
        '  - Yeğen ile Amca / Dayı / Hala / Teyze: 3. Derece Yansoy (Yeğen -> Baba -> Dede -> Amca = 3 doğum).',
        '  - Kuzenler (Amca çocukları): 4. Derece Yansoy (Kuzen A -> Baba -> Dede -> Amca -> Kuzen B = 4 doğum).',
        'KAYIN HISIMLIĞI KURALI: Eşler arasında hısımlık YOKTUR (Evlilik bağı vardır). Bir eşin kan hısımları, diğer eşin aynı dereceden kayın hısımı olur (Örn: Eşinizin kardeşi/kayınbiraderiniz sizin 2. derece yansoy kayın hısımınızdır). Evlilik sona erse dahi kayın hısımlığı ASLA SONA ERMEZ!'
      ],
      goldenRule: 'ÖSYM DERECE FORMÜLÜ: Kardeş = 2; Amca/Dayı/Hala/Teyze/Yeğen = 3; Kuzen = 4; Dede/Torun = 2. Evlilik bitse bile eşin ailesiyle olan kayın hısımlığı ölünceye kadar hukuken devam eder (Evlenme yasakları kalkmaz).',
      osymTrap: 'ÖSYM Tuzağı: \'Karı-koca 1. derece hısımdır\' şıkkı KESİNLİKLE YANLIŞTIR! Eşler arasında kan hısımlığı veya kayın hısımlığı yoktur; eşler yalnızca evlilik sözleşmesiyle bağlıdır.'
    ),
    LectureSection(
      title: 'Temel Hukuk Bilgisi - ÖSYM Çıkmış ve Özgün Pekiştirme Testi',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Ayırt etme gücüne sahip 17 yaşındaki lise öğrencisi (A), yasal temsilcisi olan babasının iznini almadan bir dizüstü bilgisayar satın almıştır. Yapılan bu sözleşmenin hukuki niteliği aşağıdakilerden hangisidir?',
          options: [
            'A) İşlem mutlak butlan ile kesin hükümsüzdür.',
            'B) İşlem baştan itibaren tamamen geçerlidir.',
            'C) İşlem askıda hükümsüzdür; babası onay verirse geçerli hale gelir.',
            'D) İşlem nisbi butlanla sakattır, 1 yıl sonra kendiliğinden düşer.',
            'E) Hukuki işlem yokluk ile maluldür.'
          ],
          correctIndex: 2,
          explanation: 'Ayırt etme gücü olan küçükler sınırlı ehliyetlidir. Yasal temsilcinin izni olmadan yaptıkları borçlandırıcı işlemler ASKIDA HÜKÜMSÜZDÜR (tek taraflı bağlamazlık). Veli sonradan onay (icazet) verirse baştan itibaren geçerli olur; onay vermezse hükümsüz kalır.',
          ruleTag: 'Ehliyet ve Hükümsüzlük'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi bir kanunda somut olaya uygulanacak kural içi boşluğun bulunması durumunda hakimin başvurması gereken yoldur?',
          options: [
            'A) Kanun koyucu gibi davranarak hukuk yaratmak',
            'B) Takdir yetkisini hakkaniyete uygun olarak kullanmak',
            'C) Örf ve âdet hukukuna başvurmak',
            'D) Doktrindeki bilimsel görüşleri zorunlu olarak uygulamak',
            'E) Uyuşmazlığı çözmekten imtina ederek davayı reddetmek'
          ],
          correctIndex: 1,
          explanation: 'Kural içi boşluk kanun koyucunun bilerek ve isteyerek bıraktığı boşluktur. Bu durumda hakim hukuk yaratmaz; Türk Medeni Kanunu Madde 4 gereğince takdir yetkisini hakkaniyete göre kullanır. Hukuk yaratma sadece hiçbir yazılı ve yazısız kuralın olmadığı HUKUK BOŞLUĞUNDA devreye girer.',
          ruleTag: 'Boşluk Türleri'
        ),
        LectureInteractiveQuiz(
          prompt: 'Bir kimsenin kendi teyzesinin kızı (kuzeni) ile arasındaki hısımlığın türü ve derecesi aşağıdakilerden hangisinde doğru olarak verilmiştir?',
          options: [
            'A) 3. derece civar (yansoy) kan hısımlığı',
            'B) 4. derece civar (yansoy) kan hısımlığı',
            'C) 4. derece düzçizgi (üstsoy) kan hısımlığı',
            'D) 2. derece yansoy kayın hısımlığı',
            'E) 3. derece üstsoy kayın hısımlığı'
          ],
          correctIndex: 1,
          explanation: 'Kuzenler birbirinden üremeyip ortak dede/nineden geldikleri için civar (yansoy) hısımdır. Doğum sayısı hesabı: Kişi (1) -> Anne (2) -> Anneanne (3) -> Teyze (4) -> Teyze Kızı = Toplam 4 doğum. Dolayısıyla 4. derece yansoy kan hısımlığıdır.',
          ruleTag: 'Hısımlık Dereceleri'
        )
      ]
    )
  ],
);
