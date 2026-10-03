import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu4TemelHaklar = LectureTopic(
  id: 'vat_konu4',
  courseId: 'vatandaslik',
  order: 4,
  title: 'Temel Hak ve Hürriyetler',
  subtitle: 'Jellinek Hak Tasnifi, Sınırlama, Durdurma İlkeleri ve Çekirdek Haklar',
  icon: Icons.shield_outlined,
  color: Color(0xFF4C1D95),
  testRange: 'Test 21 - 26',
  startTestNum: 21,
  endTestNum: 26,
  estimatedMinutes: 55,
  sections: [
    LectureSection(
      title: 'Hakların Sınıflandırılması (Georg Jellinek Tipolojisi)',
      type: LectureSectionType.overview,
      leadText: 'Anayasamızda temel hak ve hürriyetler, ünlü kamu hukukçusu Georg Jellinek\'in üçlü ayrımına göre düzenlenmiştir.',
      bulletPoints: [
        '1. KİŞİSEL HAKLAR (Koruyucu / Negatif Statü Hakları): Kişinin devlet tarafından dokunulamayacak özel alanını koruyan haklardır (Devlet \'Gölge etme başka ihsan istemem\' der).',
        '   - Yaşama hakkı, Maddi-manevi varlığı koruma, Kişi hürriyeti ve güvenliği, Özel hayatın gizliliği, Konut dokunulmazlığı, Haberleşme hürriyeti, Yerleşme ve seyahat hürriyeti, Din ve vicdan hürriyeti, Düşünce ve kanaat hürriyeti, İspat hakkı, Hak arama hürriyeti.',
        '2. SOSYAL VE EKONOMİK HAKLAR (İsteme / Pozitif Statü Hakları): Bireyin toplum içinde gelişmesi için devletten talep ettiği, devletin olumlu edimini gerektiren haklardır (Devlet \'Destek ol, hizmet ver\' der).',
        '   - Ailenin korunması ve çocuk hakları, Eğitim ve öğretim hakkı, Çalışma ve sözleşme hürriyeti, Sendika kurma hakkı, Toplu iş sözleşmesi ve grev hakkı, Dinlenme ve tatil hakkı, Ücrette adalet sağlanması, Sağlık hizmetleri ve çevrenin korunması, Konut hakkı, Sosyal güvenlik hakkı.',
        '3. SİYASİ HAKLAR (Katılma / Aktif Statü Hakları): Bireyin devlet yönetimine, siyasi mekanizmaya ve karar alma süreçlerine katılmasını sağlayan haklardır (Devlet \'Söz hakkı ver\' der).',
        '   - Türk vatandaşlığı, Seçme, seçilme ve siyasi faaliyette bulunma hakkı, Siyasi parti kurma ve partilere girme hakkı, Kamu hizmetlerine girme (Memuriyet) hakkı, Vatan hizmeti (Askerlik), Vergi ödevi, Dilekçe, bilgi edinme ve kamu denetçisine başvurma hakkı.'
      ],
      goldenRule: 'KODLAMA TEKNİĞİ: Devlet karışmasın (Kişisel/Koruyucu); Devlet hizmet versin (Sosyal/İsteme); Devlet yönetimine soksun (Siyasi/Katılma).',
      osymTrap: 'ÖSYM ÇOK SEVER: \'Mülkiyet Hakkı\' koruyucu (kişisel) bir haktır; sosyal hak DEĞİLDİR! \'Çalışma ve sözleşme hürriyeti\' sosyal bir haktır. \'Dilekçe hakkı\' ve \'Vergi ödevi\' siyasi bir haktır.'
    ),
    LectureSection(
      title: 'Temel Hak ve Hürriyetlerin Sınırlanması İlkeleri (Madde 13)',
      type: LectureSectionType.ruleList,
      leadText: 'Temel hak ve hürriyetler sınırsız değildir ancak devlet bu hakları canının istediği gibi sınırlayamaz. 2001 Anayasa değişikliği ile getirilen şartlar şunlardır:',
      bulletPoints: [
        '1. KANUNLA SINIRLAMA: Temel hak ve hürriyetler ancak ve ancak KANUN ile sınırlanabilir. Cumhurbaşkanlığı Kararnamesi, yönetmelik veya genelge ile kişi ve siyasi haklar ASLA sınırlanamaz!',
        '2. ANAYASANIN İLGİLİ MADDESİNDEKİ ÖZEL SEBEP: Sınırlama ancak anayasanın ilgili maddesinde açıkça belirtilen özel sebeplere dayanılarak yapılabilir (2001 değişikliğiyle \'Genel sınırlama sebepleri\' anayasadan tamamen kaldırılmıştır).',
        '3. HAKKIN ÖZÜNE DOKUNMAMA: Yapılan sınırlama hakkı kullanılamaz hale getirecek, anlamsız kılacak derecede ağır olamaz.',
        '4. ANAYASANIN SÖZÜNE VE RUHUNA UYGUNLUK: Anayasa metnine ve mantığına aykırı olamaz.',
        '5. DEMOKRATİK TOPLUM DÜZENİNİN GEREKLERİNE UYGUNLUK: Çoğulcu demokrasinin temel unsurlarını zedeleyemez.',
        '6. LAİK CUMHURİYETİN GEREKLERİNE UYGUNLUK: Laiklik ilkesine zarar veremez.',
        '7. ÖLÇÜLÜLÜK İLKESİ: Ulaşılmak istenen amaç ile başvurulan sınırlama aracı arasında makul bir denge (orantı) bulunmalıdır (Elverişlilik, Gereklilik ve Orantılılık).'
      ],
      goldenRule: 'FORMÜL: KANUN + ÖZEL SEBEP + ÖZÜNE DOKUNMAMA + ÖLÇÜLÜLÜK + DEMOKRATİK DÜZEN. Bu 5 zincir olmadan hak sınırlanamaz!',
      osymTrap: 'ÖSYM Tuzağı: \'Temel hak ve hürriyetler Cumhurbaşkanlığı Kararnamesi ile sınırlanabilir\' der. YANLIŞ! Olağan dönemde kişi hakları ve siyasi haklar CBK ile sınırlanamaz ve düzenlenemez; sadece KANUNLA sınırlanabilir.'
    ),
    LectureSection(
      title: 'Hakların Durdurulması ve Dokunulamaz ÇEKİRDEK HAKLAR (Madde 15)',
      type: LectureSectionType.comparison,
      leadText: 'Savaş, seferberlik veya olağanüstü hallerde milletlerarası hukuktan doğan yükümlülükler ihlal edilmemek kaydıyla haklar kısmen veya tamamen durdurulabilir. Ancak ÇEKİRDEK HAKLARA hiçbir koşulda DOKUNULAMAZ!',
      comparisonRows: [
        ComparisonRow(
          correct: 'Çekirdek Hak 1: Savaş hukukuna uygun fiiller sonucu meydana gelen ölümler dışında, KİŞİNİN YAŞAMA HAKKINA, maddi ve manevi varlığının bütünlüğüne dokunulamaz (İşkence ve eziyet yasağı mutlaktır).',
          wrong: 'Savaşta yaşama hakkının tamamen askıya alınabileceği sanılması yanlıştır; meşru savaş fiilleri hariç öldürmek ve işkence her koşulda yasaktır.',
          note: 'Madde 15/2 en katı anayasal koruma kalkanıdır.'
        ),
        ComparisonRow(
          correct: 'Çekirdek Hak 2: Kimse DİN, VİCDAN, DÜŞÜNCE VE KANAATLERİNİ AÇIKLAMAYA ZORLANAMAZ ve bunlardan dolayı suçlanamaz (İç aleme müdahale yasağı mutlaktır).',
          wrong: 'Düşünceyi yayma hürriyeti ile karıştırılması: Düşünceyi yayma olağanüstü halde durdurulabilir ama kişinin inancını açıklamaya zorlanması ASLA yapılamaz.',
          note: 'Kişinin beynine ve vicdanına savaşta dahi girilemez.'
        ),
        ComparisonRow(
          correct: 'Çekirdek Hak 3: SUÇ VE CEZALAR GEÇMİŞE YÜRÜTÜLEMEZ. Kimse kanunun suç saymadığı bir fiilden dolayı sonradan cezalandırılamaz.',
          wrong: 'OHAL döneminde geçmişe yürüyen ceza verilebileceği sanılması: Kanunilik ilkesi ve geriye yürümeme yasağı çekirdek haktır.',
          note: 'Ceza hukukunun temel evrensel güvencesidir.'
        ),
        ComparisonRow(
          correct: 'Çekirdek Hak 4: MASUMİYET KARİNESİ: Suçluluğu mahkeme kararı ile kesinleşinceye kadar kimse suçlu sayılamaz.',
          wrong: 'Gözaltındaki veya tutuklu kimsenin suçlu ilan edilmesi anayasaya aykırıdır.',
          note: 'Kesinleşmiş mahkumiyet hükmü olmadan suçlu ilan edilemez.'
        )
      ],
      goldenRule: '4 ÇEKİRDEK HAK: 1. Yaşama hakkı & İşkence yasağı, 2. Din ve vicdanını açıklamaya zorlanamama, 3. Suç ve cezanın geçmişe yürümemesi, 4. Masumiyet karinesi.',
      osymTrap: 'ÖSYM Çeldiricisi: \'Mülkiyet hakkı, haberleşme hürriyeti veya seyahat hürriyeti çekirdek haktır\' der. HAYIR! Bu haklar savaş ve OHAL\'de durdurulabilir; çekirdek hak DEĞİLLERDİR!'
    ),
    LectureSection(
      title: 'Siyasi Haklar: Vatandaşlık, Partiler ve Başvuru Hakları',
      type: LectureSectionType.ruleList,
      leadText: 'Demokratik sistemde yurttaşların siyasal hayata doğrudan katılımını sağlayan mekanizmalardır.',
      bulletPoints: [
        'TÜRK VATANDAŞLIĞI (Madde 66): Türk babanın veya Türk ananın çocuğu Türk\'tür. Vatandaşlık, kanunun gösterdiği şartlarla kazanılır ve ancak kanunda belirtilen hallerde kaybedilir. Vatana bağlılıkla bağdaşmayan bir eylemde bulunmadıkça hiçbir Türk vatandaşlıktan ÇIKARILAMAZ. Vatandaşlıktan çıkarma kararlarına karşı YARGI YOLU KAPATILAMAZ (Danıştay bakar).',
        'SİYASİ PARTİLERİN KURULMASI: Önceden İZİN ALMADAN kurulurlar. En az 30 Türk vatandaşı ile kurulur. TBMM\'de grup kurmak için EN AZ 20 MİLLETVEKİLİ gerekir.',
        'SİYASİ PARTİLERE KİMLER ÜYE OLAMAZ? (ÖSYM\'nin en garanti sorusu!):',
        '  - Hakimler ve savcılar,',
        '  - Sayıştay dahil yüksek yargı mensupları,',
        '  - Kamu kurum ve kuruluşlarının memur statüsündeki görevlileri,',
        '  - Silahlı Kuvvetler mensupları (Askerler),',
        '  - Yükseköğretim öncesi öğrencileri (Lise öğrencileri).',
        '  (DİKKAT: Yükseköğretim elemanları / akademisyenler ve üniversite öğrencileri partilere ÜYE OLABİLİRLER!).',
        'SİYASİ PARTİLERİN KAPATILMASI: Kapatma davasını YARGITAY CUMHURİYET BAŞSAVCISI açar. Davaya ANAYASA MAHKEMESİ bakar. Kapatma kararı için toplantıya katılan üyelerin 2/3 OY ÇOKLUĞU aranır.',
        'KAMU DENETÇİLİĞİ (OMBUDSMANLIK): TBMM Başkanlığı\'na bağlı olarak kurulmuştur. İdarenin işleyişiyle ilgili şikayetleri inceler. Başdenetçiyi TBMM 4 turlu gizli oyla 4 yıl için seçer.'
      ],
      goldenRule: 'MEMUR, ASKER, HAKİM, SAVCI, LİSE ÖĞRENCİSİ partiye üye OLAMAZ. Ama ÜNİVERSİTE HOCASI ve ÜNİVERSİTE ÖĞRENCİSİ partiye üye OLABİLİR.',
      osymTrap: 'ÖSYM Tuzakları: Siyasi partilerin mali denetimini kim yapar? DİKKAT: Anayasa Mahkemesi yapar! Sayıştay\'dan sadece teknik yardım alır; denetim yetkisi münhasıran AYM\'ye aittir!'
    ),
    LectureSection(
      title: 'Temel Hak ve Hürriyetler - ÖSYM Çıkmış ve Özgün Test',
      type: LectureSectionType.interactiveQuiz,
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre aşağıdakilerden hangisi savaş, seferberlik veya olağanüstü hallerde dahi hiçbir surette dokunulamayacak \'çekirdek haklar\' arasında yer almaz?',
          options: [
            'A) Kişinin yaşama hakkı ve vücut bütünlüğü',
            'B) Suç ve cezaların geçmişe yürütülememesi ilkesi',
            'C) Masumiyet karinesi',
            'D) Mülkiyet hakkı ve miras hürriyeti',
            'E) Kimsenin din, vicdan ve düşüncelerini açıklamaya zorlanamaması'
          ],
          correctIndex: 3,
          explanation: '1982 Anayasası\'nın 15. maddesinde sayılan çekirdek haklar: Yaşama hakkı/işkence yasağı, din-vicdan ve kanaatlerini açıklamaya zorlanamama, geriye yürümezlik ilkesi ve masumiyet karinesidir. Mülkiyet hakkı bir çekirdek hak değildir; olağanüstü durumlarda sınırlandırılabilir veya durdurulabilir.',
          ruleTag: 'Madde 15 Çekirdek Haklar'
        ),
        LectureInteractiveQuiz(
          prompt: '1982 Anayasası\'na göre siyasi partilerin temelli kapatılmasına ilişkin davaları açma yetkisi ile bu davaları karara bağlama yetkisi sırasıyla hangi mercilere aittir?',
          options: [
            'A) Adalet Bakanı - Danıştay',
            'B) Yargıtay Birinci Başkanı - Yargıtay Ceza Genel Kurulu',
            'C) Yargıtay Cumhuriyet Başsavcısı - Anayasa Mahkemesi',
            'D) TBMM Başkanı - Uyuşmazlık Mahkemesi',
            'E) Cumhurbaşkanı - Anayasa Mahkemesi'
          ],
          correctIndex: 2,
          explanation: 'Siyasi partilerin kapatılması davasını açma yetkisi münhasıran Yargıtay Cumhuriyet Başsavcısı\'na aittir. Davayı inceleyip kapatmaya veya devlet yardımından yoksun bırakmaya karar veren merci ise Anayasa Mahkemesi\'dir.',
          ruleTag: 'Siyasi Partilerin Kapatılması'
        )
      ]
    )
  ],
);
