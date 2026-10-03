import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu6YurutmeCumhurbaskanligi = LectureTopic(
  id: 'vat_konu6',
  courseId: 'vatandaslik',
  order: 6,
  title: 'Yürütme Organı: Cumhurbaşkanlığı',
  subtitle: 'Cumhurbaşkanlığı Sistemi, Kararnameler, Bakanlar, MGK ve OHAL Rejimi',
  icon: Icons.account_balance_outlined,
  color: Color(0xFF3730A3),
  testRange: 'Test 35 - 42',
  startTestNum: 35,
  endTestNum: 42,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: 'Cumhurbaşkanlığı Hükümet Sistemi ve Cumhurbaşkanı Seçimi',
      type: LectureSectionType.overview,
      leadText: '2017 anayasa değişikliği ile yürütme yetkisi ve görevi münhasıran CUMHURBAŞKANI\'NA verilmiştir. Başbakanlık ve Bakanlar Kurulu kaldırılmış; yürütme tek başlı (monist) hale gelmiştir.',
      bulletPoints: [
        'SEÇİLME ŞARTLARI (Madde 101):',
        '  - 40 yaşını doldurmuş olmak,',
        '  - Yükseköğrenim (Üniversite) mezunu olmak,',
        '  - Milletvekili seçilme yeterliliğine sahip olmak,',
        '  - Türk vatandaşı olmak.',
        'KİMLER ADAY GÖSTEREBİLİR? (3 Yol Vardır - ÖSYM Soru Kalıbı!):',
        '  1. Siyasi parti grupları (TBMM\'de en az 20 milletvekili olan partiler),',
        '  2. En son yapılan genel seçimlerde toplam geçerli oyların tek başına veya birlikte EN AZ %5\'İNİ almış olan siyasi partiler,',
        '  3. EN AZ 100.000 SEÇMEN (İmza toplayarak doğrudan halk aday gösterebilir).',
        'GÖREV SÜRESİ VE DÖNEM SINIRI:',
        '  - Görev süresi 5 YILDIR. Bir kimse en fazla İKİ DEFA Cumhurbaşkanı seçilebilir.',
        '  - İSTİSNA: Cumhurbaşkanının ikinci döneminde Meclis tarafından (3/5 çoğunlukla - 360 vekille) seçimlerin yenilenmesine karar verilirse, Cumhurbaşkanı BİR DEFA DAHA aday olabilir.',
        'İKİ TURLU SEÇİM SİSTEMİ:',
        '  - 1. Tur: Genel oyla yapılacak seçimde, geçerli oyların SALT ÇOĞUNLUĞUNU (yüzde 50 + 1 oy) alan aday Cumhurbaşkanı seçilir.',
        '  - 2. Tur: İlk turda salt çoğunluk sağlanamazsa, bu oylamayı takip eden İKİNCİ PAZAR günü ikinci oylama yapılır. Bu tura ilk oylamada en çok oy alan İKİ ADAY katılır ve geçerli oyların çoğunluğunu alan aday seçilir.',
        '  - Tek Aday Kalması: İkinci tura katılmaya hak kazanan adaylardan biri ölür veya çekilirse, oylama REFERANDUM (Oylama) şeklinde yapılır. Aday geçerli oyların salt çoğunluğunu alırsa seçilir.'
      ],
      goldenRule: 'CUMHURBAŞKANI ŞARTLARI: 40 Yaş + Üniversite Mezunu. Aday gösterme: Parti Grupları (%5 alanlar) veya 100 BİN SEÇMEN. Süre: 5 Yıl (En fazla 2 dönem).',
      osymTrap: 'ÖSYM Çeldiricisi: \'Cumhurbaşkanı seçilen kişinin partisiyle ilişiği kesilir\' der. YANLIŞ! 2017 değişikliğiyle bu kural kaldırılmıştır; Cumhurbaşkanı partisinin üyesi ve hatta genel başkanı olabilir.'
    ),
    LectureSection(
      title: 'Cumhurbaşkanının Görev ve Yetkileri',
      type: LectureSectionType.ruleList,
      leadText: 'Cumhurbaşkanı Devletin başıdır. Yürütme yetkisini Anayasa ve kanunlara uygun olarak kullanır.',
      bulletPoints: [
        'YASAMAYA İLİŞKİN YETKİLERİ:',
        '  - Gerekli gördüğünde yasama yılının ilk günü TBMM\'de açılış konuşması yapmak,',
        '  - Kanunları yayımlamak veya tekrar görüşülmek üzere TBMM\'ye geri göndermek (Veto etmek),',
        '  - Anayasa değişikliklerine ilişkin kanunları gerekli gördüğünde halkoyuna (Referanduma) sunmak,',
        '  - Kanunların veya TBMM İçtüzüğünün iptali için Anayasa Mahkemesi\'nde İPTAL DAVASI açmak,',
        '  - TBMM seçimlerinin yenilenmesine (Erken seçim) karar vermek.',
        'YÜRÜTMEYE İLİŞKİN YETKİLERİ:',
        '  - Cumhurbaşkanı Yardımcıları ile Bakanları atamak ve görevlerine son vermek,',
        '  - Üst kademe kamu yöneticilerini (Vali, Rektör, Büyükelçi, MİT Başkanı, Genelkurmay Başkanı vb.) atamak ve görevlerine son vermek,',
        '  - Yabancı devletlere temsilci göndermek ve yabancı temsilcileri kabul etmek,',
        '  - Milletlerarası antlaşmaları ONAYLAMAK ve YAYIMLAMAK (TBMM kanunla uygun bulur, CB onaylar),',
        '  - Milli Güvenlik Kurulu\'na başkanlık etmek ve TSK\'nın kullanılmasına karar vermek,',
        '  - Sürekli hastalık, sakatlık ve kocama sebebiyle kişilerin CEZALARINI HAFİFLETMEK VEYA KALDIRMAK (Özel af niteliği taşır),',
        '  - Cumhurbaşkanlığı Kararnamesi ve Yönetmelik çıkarmak,',
        '  - OLAĞANÜSTÜ HAL (OHAL) ilan etmek (En fazla 6 ay süreyle).',
        'YARGIYA İLİŞKİN YETKİLERİ (ÖSYM çok sorar!):',
        '  - Anayasa Mahkemesi\'nin 12 üyesini seçmek (3\'ünü TBMM seçer),',
        '  - Danıştay üyelerinin 1/4\'ünü seçmek (3/4\'ünü HSK seçer),',
        '  - Yargıtay Cumhuriyet Başsavcısı ve Vekilini seçmek (Yargıtay Genel Kurulu aday gösterir, CB seçer),',
        '  - Hakimler ve Savcılar Kurulu\'nun (HSK) 4 üyesini seçmek (7\'sini TBMM seçer).'
      ],
      goldenRule: 'Yargıtay üyelerini HSK seçer; YARGITAY CUMHURİYET BAŞSAVCISINI ise CUMHURBAŞKANI seçer! Danıştay üyelerinin 1/4\'ünü CB, 3/4\'ünü HSK seçer. AYM\'nin 12 üyesini CB, 3 üyesini TBMM seçer.',
      osymTrap: 'ÖSYM Tuzağı: Cumhurbaşkanı Yargıtay\'a üye seçebilir mi? KESİNLİKLE HAYIR! Yargıtay\'ın hiçbir normal üyesini Cumhurbaşkanı seçmez; tüm Yargıtay üyelerini HSK seçer. CB sadece Başsavcı ve Başsavcıvekilini seçer.'
    ),
    LectureSection(
      title: 'Cumhurbaşkanlığı Kararnameleri (Olağan CBK vs OHAL CBK)',
      type: LectureSectionType.comparison,
      leadText: 'Cumhurbaşkanı, yürütme yetkisine ilişkin konularda Cumhurbaşkanlığı Kararnamesi çıkarabilir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Olağan CBK Sınırları: Yalnızca yürütme yetkisine ilişkin konularda çıkarılır. KİŞİ HAKLARI VE SİYASİ HAKLAR DÜZENLENEMEZ. Sadece SOSYAL VE EKONOMİK HAKLAR düzenlenebilir. Anayasada münhasıran kanunla düzenlenmesi öngörülen konularda çıkarılamaz. Kanunda açıkça düzenlenen konularda CBK çıkarılamaz.',
          wrong: 'Kanundan üstün sanılması: Kanun ile CBK aynı konuda farklı hüküm içerirse KANUN HÜKÜMLERİ UYGULANIR. TBMM\'nin aynı konuda kanun çıkarması durumunda CBK KENDİLİĞİNDEN HÜKÜMSÜZ HALE GELİR.',
          note: 'Yargısal denetimini ANAYASA MAHKEMESİ yapar.'
        ),
        ComparisonRow(
          correct: 'OHAL CBK Sınırları: Olağanüstü hal süresince, OHAL\'in gerekli kıldığı konularda çıkarılır. Temel hak ve hürriyetlerin TAMAMI (Çekirdek haklar hariç) düzenlenebilir ve sınırlandırılabilir. Kanun hükmündedir.',
          wrong: 'Yargı denetimi sanılması: 1982 Anayasası Madde 148 uyarınca; OHAL CBK\'larının şekil ve esas bakımından anayasaya aykırılığı iddiasıyla ANAYASA MAHKEMESİ\'NDE DAVA AÇILAMAZ (Yargı yolu kapalıdır!).',
          note: 'OHAL CBK\'ları çıkarıldığı gün TBMM onayına sunulur. TBMM 3 ay içinde görüşüp karara bağlamazsa kendiliğinden yürürlükten kalkar.'
        )
      ],
      goldenRule: 'OLAĞAN CBK: Sadece Sosyal Haklar düzenlenebilir, Kanuna aykırı olamaz, AYM denetler. OHAL CBK: Çekirdek haklar hariç her şey düzenlenebilir, Kanun gücündedir, AYM\'YE DAVA AÇILAMAZ.',
      osymTrap: 'ÖSYM\'nin en popüler sorusu: Olağan dönemde Cumhurbaşkanlığı Kararnamesi ile vergi konulabilir mi? HAYIR! Çünkü vergi Anayasa Madde 73 uyarınca münhasıran KANUNLA konulur; CBK ile vergi konulamaz veya kaldırılamaz!'
    ),
    LectureSection(
      title: 'Cumhurbaşkanı Yardımcıları, Bakanlar ve Göreve Vekalet',
      type: LectureSectionType.ruleList,
      leadText: 'Cumhurbaşkanı, seçildikten sonra bir veya daha fazla Cumhurbaşkanı Yardımcısı atayabilir.',
      bulletPoints: [
        'CUMHURBAŞKANINA VEKALET ETME KURALI (Madde 106 - ÖSYM\'nin garanti sorusu!):',
        '  - Cumhurbaşkanının hastalık, yurt dışına çıkma gibi GEÇİCİ OLARAK görevinden ayrılması hallerinde: CUMHURBAŞKANI YARDIMCISI vekalet eder ve CB yetkilerini kullanır.',
        '  - Cumhurbaşkanlığı makamının ölüm, çekilme veya başka bir nedenle BOŞALMASI halinde: Yenisi seçilene kadar EN YAŞLI CUMHURBAŞKANI YARDIMCISI vekalet eder.',
        '  (DİKKAT: 2017 öncesinde vekalet TBMM Başkanı\'ndaydı; ARTIK TBMM BAŞKANI ASLA VEKALET ETMEZ! Yalnızca Cumhurbaşkanı Yardımcısı vekalet eder).',
        'BAKANLARIN STATÜSÜ VE SORUMLULUĞU:',
        '  - Bakanları Cumhurbaşkanı atar ve görevden alır. Bakanlar Cumhurbaşkanına karşı sorumludur (TBMM\'ye karşı siyasi sorumlulukları yoktur).',
        '  - Milletvekili olan bir kimse Bakan veya CB Yardımcısı atanırsa, MİLLETVEKİLLİĞİ ANINDA SONA ERER!',
        '  - Bakan olmak için milletvekili seçilme yeterliliğine sahip olmak şarttır (18 yaş, en az ilkokul mezuniyeti vb.).',
        'MİLLİ GÜVENLİK KURULU (MGK):',
        '  - Başkanı: CUMHURBAŞKANI (Katılamazsa CB Yardımcısı başkanlık eder).',
        '  - Sivil Üyeler: CB Yardımcıları, Adalet Bakanı, İçişleri Bakanı, Dışişleri Bakanı, Milli Savunma Bakanı.',
        '  - Askeri Üyeler: Genelkurmay Başkanı, Kara Kuvvetleri Komutanı, Deniz Kuvvetleri Komutanı, Hava Kuvvetleri Komutanı.',
        '  (DİKKAT: Jandarma Genel Komutanı 2016\'da MGK\'dan ÇIKARILMIŞTIR! Başbakanlık kalkmıştır! MGK Genel Sekreteri üye DEĞİLDİR, sadece raportördür!).',
        'OLAĞANÜSTÜ HAL (OHAL) REJİMİ:',
        '  - İlan Yetkilisi: CUMHURBAŞKANI ilan eder. Süresi EN FAZLA 6 AYDIR.',
        '  - İlan kararı verildiği gün Resmi Gazete\'de yayımlanır ve aynı gün TBMM\'nin ONAYINA sunulur.',
        '  - TBMM OHAL süresini değiştirebilir, kaldırabilir veya Cumhurbaşkanının talebiyle her defasında 4 AYI GEÇMEMEK ÜZERE uzatabilir (Savaş halinde 4 aylık sınır aranmaz).'
      ],
      goldenRule: 'VEKALET = Sadece Cumhurbaşkanı Yardımcısı. MGK\'da Jandarma Komutanı YOKTUR. OHAL İLAN SÜRESİ = En fazla 6 Ay (Cumhurbaşkanı); UZATMA SÜRESİ = Her defasında en fazla 4 Ay (TBMM).',
      osymTrap: 'ÖSYM Tuzağı: Sıkıyönetim rejimi 2017 anayasa değişikliği ile anayasadan TAMAMEN KALDIRILMIŞTIR! Artık tek bir olağanüstü yönetim usulü vardır, o da Olağanüstü Hal (OHAL) rejimidir.'
    ),
    LectureSection(
      title: 'Yürütme Organı - ÖSYM Çıkmış ve Özgün Test',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre Cumhurbaşkanlığı makamının herhangi bir nedenle boşalması halinde, yenisi seçilinceye kadar Cumhurbaşkanlığına aşağıdakilerden hangisi vekalet eder ve Cumhurbaşkanına ait yetkileri kullanır?',
          options: [
            'A) Türkiye Büyük Millet Meclisi Başkanı',
            'B) En yaşlı Cumhurbaşkanı Yardımcısı',
            'C) Anayasa Mahkemesi Başkanı',
            'D) Adalet Bakanı',
            'E) Genelkurmay Başkanı'
          ],
          correctIndex: 1,
          explanation: '2017 Anayasa değişikliği ile TBMM Başkanının vekalet yetkisi kaldırılmıştır. Anayasa Madde 106 uyarınca Cumhurbaşkanlığı makamının boşalması halinde yenisi seçilene kadar Cumhurbaşkanı Yardımcısı (birden fazla ise en yaşlı olanı) vekalet eder.',
          ruleTag: 'Cumhurbaşkanına Vekalet'
        ),
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi Milli Güvenlik Kurulu\'nun (MGK) tabii üyeleri arasında YER ALMAZ?',
          options: [
            'A) Adalet Bakanı',
            'B) İçişleri Bakanı',
            'C) Jandarma Genel Komutanı',
            'D) Hava Kuvvetleri Komutanı',
            'E) Dışişleri Bakanı'
          ],
          correctIndex: 2,
          explanation: '2016 yılında yapılan anayasa değişikliği ile Jandarma Genel Komutanlığı\'nın iç güvenlik teşkilatı olarak İçişleri Bakanlığı\'na bağlanması üzerine Jandarma Genel Komutanı MGK üyeliğinden tamamen çıkarılmıştır.',
          ruleTag: 'MGK Üyeleri'
        )
      ]
    )
  ],
);
