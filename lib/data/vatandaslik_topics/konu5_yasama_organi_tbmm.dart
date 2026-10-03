import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu5YasamaTbmm = LectureTopic(
  id: 'vat_konu5',
  courseId: 'vatandaslik',
  order: 5,
  title: 'Yasama Organı: TBMM',
  subtitle: 'Milletvekili Seçimi, Dokunulmazlık, TBMM Görevleri ve Denetim Yolları',
  icon: Icons.account_balance_rounded,
  color: Color(0xFF4338CA),
  testRange: 'Test 27 - 34',
  startTestNum: 27,
  endTestNum: 34,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'TBMM\'nin Yapısı ve Milletvekili Seçilme Yeterliliği',
      type: LectureSectionType.overview,
      leadText: 'Yasama yetkisi Türk Milleti adına Türkiye Büyük Millet Meclisi\'nindir. Bu yetki devredilemez (Yasamanın Devredilmezliği), geneldir (Yasamanın Genelliği) ve ilk elden kullanılır (Yasamanın Asliliği/İlkelliği).',
      bulletPoints: [
        'MİLLETVEKİLİ SAYISI: 2017 değişikliğiyle 550\'den 600 MİLLETVEKİLİNE çıkarılmıştır.',
        'SEÇİM DÖNEMİ: TBMM ve Cumhurbaşkanlığı seçimleri 5 YILDA BİR aynı gün yapılır.',
        'MİLLETVEKİLİ SEÇİLME ŞARTLARI (2017 Güncel):',
        '  - 18 yaşını doldurmuş olmak (2017 öncesi 25 yaştı),',
        '  - Türk vatandaşı olmak,',
        '  - En az ilkokul mezunu olmak,',
        '  - Kısıtlı olmamak,',
        '  - Askerlikle İLİŞİĞİ OLMAMAK (2017 öncesi \'askerliğini yapmış olmak\' idi; artık askerlik çağında olmayan, tecilli veya muaf olanlar seçilebilir),',
        '  - Kamu hizmetlerinden yasaklı olmamak,',
        '  - Taksirli suçlar hariç, toplam 1 yıl veya daha fazla hapis cezası almamış olmak,',
        '  - Yüz kızartıcı suçlardan (zimmet, irtikap, rüşvet, hırsızlık, dolandırıcılık, sahtecilik vb.) hüküm giymemiş olmak (Affa uğramış olsalar bile vekil olamazlar!).',
        'ADAY OLMAK İÇİN GÖREVİNDEN ÇEKİLMESİ GEREKENLER (İstifa Şartı):',
        '  - Hakimler ve savcılar,',
        '  - Yüksek yargı organı mensupları,',
        '  - Yükseköğretim kurumlarındaki öğretim elemanları (Akademisyenler),',
        '  - YÖK üyeleri,',
        '  - Memurlar ve kamu görevlileri,',
        '  - Silahlı Kuvvetler mensupları (Subay, astsubay).',
        '  (DİKKAT: Hakimler, savcılar ve askerler seçimi kaybederlerse MESLEKLERİNE GERİ DÖNEMEZLER! Memurlar ve hocalar geri dönebilir).'
      ],
      goldenRule: '18 YAŞ + İLKOKUL MEZUNU + ASKERLİKLE İLİŞİĞİ OLMAMAK. Seçilemeyen hakim, savcı ve asker mesleğine geri DÖNEMEZ; memur ve profesör DÖNEBİLİR.',
      osymTrap: 'ÖSYM Çeldiricisi: \'Milletvekili olmak için üniversite mezunu olmak şarttır\' der. YANLIŞ! Cumhurbaşkanı için yükseköğrenim şarttır; milletvekili için EN AZ İLKOKUL MEZUNU olmak yeterlidir!'
    ),
    LectureSection(
      title: 'Seçimlerin Ertelenmesi ve Ara Seçim Kuralları',
      type: LectureSectionType.ruleList,
      leadText: 'Seçimler kural olarak 5 yılda bir yapılır ancak anayasa erteleme ve ara seçim için çok katı kurallar koymuştur.',
      bulletPoints: [
        'SEÇİMLERİN GERİYE BIRAKILMASI (ERTELEME):',
        '  - Yalnızca ve sadece SAVAŞ SEBEBİYLE ertelenebilir (Deprem, salgın hastalık, ekonomik kriz ile seçim ertelenemez!).',
        '  - Erteleme kararını sadece TBMM alabilir (Cumhurbaşkanı erteleyemez!).',
        '  - Seçimler TBMM tarafından 1 YIL süreyle geriye bırakılabilir. Savaş devam ederse aynı usulle erteleme tekrarlanabilir.',
        'ARA SEÇİM (TBMM üyeliklerinde boşalma olması halinde yapılan seçim):',
        '  - Bir yasama döneminde (5 yılda) ilke olarak YALNIZCA 1 DEFA ara seçim yapılabilir.',
        '  - Genel seçimden 30 AY GEÇMEDİKÇE ara seçime gidilemez.',
        '  - Genel seçime 1 YIL KALA ara seçim yapılamaz.',
        '  - İSTİSNA 1: Meclis üye tamsayısının %5\'i (30 milletvekili) boşalırsa; 3 ay içinde ara seçim yapılmasına MECLİSÇE KARAR VERİLİR (Son 1 yıl kala yine yapılamaz).',
        '  - İSTİSNA 2: Bir ilin veya seçim çevresinin TBMM\'de HİÇ MİLLETVEKİLİ KALMAZSA; boşalmayı takip eden 90 GÜN SONRAKİ İLK PAZAR GÜNÜ ara seçim yapılması ZORUNLUDUR (Burada 30 ay ve son 1 yıl yasağı uygulanmaz!).'
      ],
      goldenRule: 'ERTELEME = Sadece SAVAŞ + Sadece TBMM + 1 YIL. ARA SEÇİM = 30 ay geçmeden ve son 1 yıl kala yapılamaz. Ancak bir ilin vekili kalmazsa 90 gün sonra zorunlu yapılır!',
      osymTrap: 'ÖSYM Soru Tuzağı: \'Doğal afet sebebiyle Cumhurbaşkanı seçimleri 6 ay erteleyebilir\' ifadesi KÜLLİYEN YANLIŞTIR. Ertelemenin tek sebebi SAVAŞ, tek yetkilisi TBMM, süresi ise 1 YILDIR!'
    ),
    LectureSection(
      title: 'Milletvekilliği Sıfatının Kazanılması ve Yasama Bağışıklıkları',
      type: LectureSectionType.comparison,
      leadText: 'Milletvekili seçilen kişi il seçim kurulundan MAZBATASINI aldığı an milletvekili sıfatını kazanır; TBMM kürsüsünde ant içerek göreve başlar.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Yasama Sorumsuzluğu (Kürsü Dokunulmazlığı): Milletvekillerinin meclis çalışmalarındaki oy, söz ve düşüncelerinden dolayı ömür boyu sorumlu tutulamamasıdır. MUTLAKTIR (Kaldırılamaz, feragat edilemez, vekillik bitse dahi ceza davası açılamaz). Hukuk davalarını değil sadece CEZA davalarını kapsar.',
          wrong: 'Dokunulmazlık ile karıştırılması: Yasama sorumsuzluğu kaldırılamaz ve milletvekilini ömür boyu meclis konuşmalarından ötürü korur.',
          note: 'Meclis çalışmalarında ileri sürülen görüşleri kapsar.'
        ),
        ComparisonRow(
          correct: 'Yasama Dokunulmazlığı (Nisbi Dokunulmazlık): Milletvekilinin meclis kararı olmadıkça tutulamaması, sorguya çekilememesi, tutuklanamaması ve yargılanamamasıdır. NİSBİDİR (TBMM Genel Kurulu kararıyla kaldırılabilir). Milletvekilliği süresince geçerlidir, vekillik bitince yargılama devam eder. Zamanaşımı işlemez.',
          wrong: 'Dokunulmazlığın İstisnaları (Doğrudan Yargılanabilen Haller): 1. Ağır cezayı gerektiren suçüstü hali, 2. Seçimden önce soruşturmasına başlanmış olmak kaydıyla Anayasanın 14. maddesindeki devlete karşı suçlar.',
          note: 'Dokunulmazlığı kaldırılan vekil 7 gün içinde AYM\'ye iptal başvurusu yapabilir; AYM 15 gün içinde kesin karar verir.'
        )
      ],
      goldenRule: 'SORUMSUZLUK = Söz ve oy hürriyetidir, mutlaktır, kaldırılamaz. DOKUNULMAZLIK = Suç işleyen vekili meclis izni olmadan tutuklamama zırhıdır, nisbidir, meclis kaldırabilir.',
      osymTrap: 'ÖSYM Soru Kalıbı: Dokunulmazlığı kaldırılan veya milletvekilliği düşürülen milletvekili kaç gün içinde nereye başvurabilir? 7 GÜN içinde ANAYASA MAHKEMESİ\'NE başvurur. AYM kararını 15 GÜN içinde verir.'
    ),
    LectureSection(
      title: 'Milletvekilliğinin Sona Erme Halleri',
      type: LectureSectionType.ruleList,
      leadText: 'Milletvekilliği kendiliğinden, Meclis kararıyla veya mahkeme kararıyla sona erebilir.',
      bulletPoints: [
        '1. KENDİLİĞİNDEN DÜŞEN HALLER (Meclis oylaması gerekmez):',
        '   - Ölüm veya gaiplik hali,',
        '   - Cumhurbaşkanı seçilme (Cumhurbaşkanı seçilenin vekilliği anında biter),',
        '   - Cumhurbaşkanı Yardımcısı veya Bakan olarak atanma (Bakan olanın vekilliği anında biter),',
        '   - Türk vatandaşlığını kaybetme.',
        '2. TBMM KARARIYLA DÜŞEN HALLER (Genel Kurulda oylama yapılır):',
        '   - İSTİFA: İstifa eden vekilin vekilliğinin düşmesine TBMM Genel Kurulu BASİT ÇOĞUNLUKLA karar verir.',
        '   - DEVAMSIZLIK: Meclis çalışmalarına özürsüz veya izinsiz olarak 1 ay içinde toplam 5 BİRLEŞİM GÜNÜ katılmayan vekilin milletvekilliği, üye tamsayısının SALT ÇOĞUNLUĞUYLA (en az 301 oy) düşürülebilir.',
        '   - VEKİLLİKLE BAĞDAŞMAYAN BİR GÖREVDE ISRAR ETME: Basit çoğunlukla düşürülür.',
        '3. MAHKEME KARARININ BİLDİRİLMESİYLE DÜŞEN HALLER (Oylama yapılmaz, bildirimle biter):',
        '   - Kesin hüküm giyme (Ağır hapis cezası vb.) veya kısıtlanma kararının TBMM Genel Kurulu\'na BİLDİRİLMESİYLE milletvekilliği kendiliğinden düşer.',
        'DİKKAT: Partisinden istifa eden milletvekilinin milletvekilliği DÜŞMEZ! Başka partiye geçebilir veya bağımsız kalabilir.'
      ],
      goldenRule: 'Bakan ya da CB Yardımcısı olanın vekilliği DERHAL BİTER. İstifa edenin vekilliğini MECLİS DÜŞÜRÜR. Devamsızlıkta en az 301 OY gerekir. Partisinden istifa edenin vekilliği DÜŞMEZ.',
      osymTrap: 'ÖSYM Çeldiricisi: \'Partisi kapatılan milletvekilinin milletvekilliği düşer\' der. YANLIŞ! 2010 anayasa değişikliği ile partinin kapatılmasına beyan ve eylemleriyle sebep olan vekillerin dahi milletvekilliği DÜŞMEZ; bağımsız vekil olarak kalırlar.'
    ),
    LectureSection(
      title: 'TBMM\'nin Görev ve Yetkileri ile Kanun Yapım Süreci',
      type: LectureSectionType.ruleList,
      leadText: 'Anayasa Madde 87\'de Türkiye Büyük Millet Meclisi\'nin asli görev ve yetkileri düzenlenmiştir.',
      bulletPoints: [
        'TEMEL GÖREVLERİ:',
        '  - Kanun koymak, değiştirmek ve kaldırmak,',
        '  - Bütçe ve kesinhesap kanun tekliflerini görüşmek ve kabul etmek (Bütçe teklifini Cumhurbaşkanı sunar),',
        '  - Para basılmasına (emisyon) karar vermek,',
        '  - Savaş ilanına ve TSK\'nın yurt dışına gönderilmesine / yabancı silahlı kuvvetlerin Türkiye\'de bulunmasına izin vermek,',
        '  - Genel ve özel af ilanına karar vermek (Üye tamsayısının 3/5 çoğunluğu - 360 OY gerekir; Orman suçları affedilemez!),',
        '  - Milletlerarası antlaşmaların onaylanmasını bir KANUNLA UYGUN BULMAK (Onaylayan Cumhurbaşkanıdır),',
        '  - Anayasa Mahkemesi\'ne 3 üye, HSK\'ya 7 üye, Sayıştay\'ın başkan ve üyelerini, Kamu Başdenetçisini ve RTÜK üyelerini seçmek,',
        '  - Erken seçim (Seçimlerin yenilenmesi) kararı almak (3/5 çoğunluk - 360 OY).',
        'KANUN YAPIM SÜRECİ:',
        '  - Kanun teklif etmeye sadece MİLLETVEKİLLERİ yetkilidir (En az 1 milletvekili teklif verebilir. Hükümetin/Bakanlar Kurulunun kanun tasarısı yetkisi 2017\'de KALDIRILMIŞTIR! Tek istisna: Bütçe kanun teklifini Cumhurbaşkanı sunar).',
        '  - TBMM Genel Kurulu kanunları basit çoğunlukla kabul eder (Toplantıya katılanların salt çoğunluğu; ancak bu sayı hiçbir şekilde 151\'den az olamaz).',
        '  - Kabul edilen kanun CUMHURBAŞKANI\'NA gönderilir. Cumhurbaşkanı 15 GÜN İÇİNDE kanunu ya Resmi Gazete\'de yayımlar ya da veto ederek meclise geri gönderir (Bütçe kanunu veto EDİLEMEZ).',
        '  - TBMM veto edilen kanunu aynen kabul etmek isterse ÜYE TAMSAYISININ SALT ÇOĞUNLUĞUYLA (en az 301 OY) kabul etmek zorundadır. Meclis 301 ile aynen kabul ederse Cumhurbaşkanı artık Resmi Gazete\'de YAYIMLAMAK ZORUNDADIR (İptal davası açabilir).'
      ],
      goldenRule: 'TOPLANTI YETER SAYISI = 200 (1/3); KARAR YETER SAYISI = Toplantıya katılanların salt çoğunluğu, ANCAK EN AZ 151! Kanun veto edilirse Meclis en az 301 oyla iadeyi aşar. Af için en az 360 oy gerekir.',
      osymTrap: 'ÖSYM Soru Tuzağı: Bütçe Kanununu Cumhurbaşkanı meclise geri gönderebilir (veto edebilir) mi? KESİNLİKLE HAYIR! Cumhurbaşkanının veto edemeyeceği tek kanun BÜTÇE KANUNU\'DUR!'
    ),
    LectureSection(
      title: 'TBMM\'nin Bilgi Edinme ve Denetim Yolları (2017 Güncel)',
      type: LectureSectionType.overview,
      leadText: '2017 anayasa değişikliği ile meclis hükümeti denetleme mekanizmaları baştan aşağı yenilenmiştir.',
      bulletPoints: [
        '1. YAZILI SORU: Milletvekillerinin, Cumhurbaşkanı Yardımcıları ve Bakanlara yazılı olarak cevaplandırılmak üzere soru sormasıdır. Muhataplar en geç 15 GÜN İÇİNDE yazılı olarak cevap vermek zorundadır. (DİKKAT: Cumhurbaşkanına soru sorulamaz!).',
        '2. MECLİS ARAŞTIRMASI: Belli bir konuda bilgi edinilmek için meclis bünyesinde özel bir komisyon kurularak yapılan incelemedir.',
        '3. GENEL GÖRÜŞME: Toplumu ve devlet faaliyetlerini ilgilendiren önemli bir konunun TBMM Genel Kurulu\'nda işaretle oylanarak görüşülmesidir.',
        '4. MECLİS SORUŞTURMASI (Cezai Sorumluluk): Cumhurbaşkanı, CB Yardımcıları ve Bakanların GÖREVLERİYLE İLGİLİ İŞLEDİKLERİ İDDİA EDİLEN SUÇLAR sebebiyle Yüce Divan\'a sevk edilmelerini sağlayan cezai denetim yoludur:',
        '   - Teklif için: Üye tamsayısının SALT ÇOĞUNLUĞU (301 OY),',
        '   - Soruşturma açılmasına karar verilmesi için: Üye tamsayısının 3/5\'i (360 OY),',
        '   - Yüce Divan\'a sevk kararı için: Üye tamsayısının 2/3\'ü (400 OY) gerekir.',
        '2017 İLE KALDIRILAN DENETİM YOLLARI: GENSORU tamamen kaldırılmıştır! (Çünkü artık hükümet meclisten güvenoyu almamaktadır). SÖZLÜ SORU kaldırılmıştır (Sadece yazılı soru vardır). GÜVENOYU kaldırılmıştır.'
      ],
      goldenRule: 'VAR OLANLAR: Yazılı Soru, Meclis Araştırması, Genel Görüşme, Meclis Soruşturması. KALDIRILANLAR: Gensoru, Sözlü Soru, Güvenoyu.',
      osymTrap: 'ÖSYM Çeldiricisi: \'TBMM hükümeti gensoru ile düşürür\' der. GENSORU DİYE BİR ŞEY ARTIK ANAYASADA YOKTUR! Cumhurbaşkanına yazılı soru da SORULAMAZ!'
    ),
    LectureSection(
      title: 'Yasama Organı (TBMM) - ÖSYM Çıkmış ve Özgün Test',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre bir milletvekilinin meclis çalışmalarına özürsüz veya izinsiz olarak 1 ay içinde toplam 5 birleşim günü katılmaması halinde milletvekilliğinin düşmesine karar verebilecek yetkili organ ve aranan karar yeter sayısı aşağıdakilerden hangisidir?',
          options: [
            'A) Anayasa Mahkemesi - Üye tamsayısının salt çoğunluğu',
            'B) TBMM Genel Kurulu - Toplantıya katılanların salt çoğunluğu',
            'C) TBMM Genel Kurulu - Üye tamsayısının salt çoğunluğu (en az 301 oy)',
            'D) TBMM Başkanlık Divanı - Basit çoğunluk',
            'E) Cumhurbaşkanı - Resen onay'
          ],
          correctIndex: 2,
          explanation: 'Devamsızlık sebebiyle (1 ay içinde 5 birleşim günü) milletvekilliğinin düşürülmesi TBMM Genel Kurulu tarafından ve üye tamsayısının salt çoğunluğu (en az 301 oy) ile karara bağlanır. Düşürülen vekil 7 gün içinde AYM\'ye itiraz edebilir.',
          ruleTag: 'Vekilliğin Düşürülmesi'
        ),
        LectureInteractiveQuiz(
          prompt: '2017 Anayasa değişiklikleri sonrasında TBMM\'nin bilgi edinme ve denetim yolları arasından tamamen çıkarılan mekanizma aşağıdakilerden hangisidir?',
          options: [
            'A) Meclis araştırması',
            'B) Genel görüşme',
            'C) Yazılı soru',
            'D) Gensoru',
            'E) Meclis soruşturması'
          ],
          correctIndex: 3,
          explanation: 'Cumhurbaşkanlığı Hükümet Sistemine geçişle birlikte Bakanlar Kurulu\'nun meclise karşı siyasi sorumluluğu ve meclisten güvenoyu alma zorunluluğu kalktığı için GENSORU ve SÖZLÜ SORU mekanizmaları anayasadan tamamen çıkarılmıştır.',
          ruleTag: 'TBMM Denetim Yolları'
        )
      ]
    )
  ],
);
