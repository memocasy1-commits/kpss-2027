import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu6DuraklamaDonemi = LectureTopic(
  id: 'tarih_duraklama_donemi',
  courseId: 'tarih',
  order: 6,
  title: 'Osmanlı Devleti Duraklama Dönemi (XVII. Yüzyıl)',
  subtitle: 'Arayış Yılları, İç ve Dış Nedenler, XVII. Yüzyıl Savaşları, İsyanlar & Islahatlar',
  icon: Icons.hourglass_bottom_rounded,
  color: Color(0xFFD97706),
  testRange: 'Test 51 - 60',
  startTestNum: 51,
  endTestNum: 60,
  estimatedMinutes: 65,
  sections: [
    // BÖLÜM 1: DURAKLAMANIN GENEL NEDENLERİ
    LectureSection(
      title: '1. Duraklama Döneminin Başlangıcı & Genel Nedenleri',
      type: LectureSectionType.overview,
      imageAssetPath: 'assets/images/tarih/tarih_dorduncu_murad_duraklama.png',
      imageCaption: 'Görsel 6.1: IV. Murad Dönemi ve XVII. Yüzyıl Osmanlı Devleti Portresi',
      leadText: '1579 Sokullu Mehmed Paşa\'nın vefatıyla başlayan ve 1699 Karlofça Antlaşması\'na kadar devam eden bu evreye "Arayış Yılları" veya "Duraklama Dönemi" denir.',
      bulletPoints: [
        'Dönemin Karakteristiği:\n'
            '  • Devlet hala dünyanın en süper gücü konumundadır ve üç kıtada en geniş sınırlarına bu yüzyılda ulaşacaktır.\n'
            '  • Ancak devlet mekanizmasında, maliyede, orduda ve eğitimde içten içe derin bozulmalar baş göstermiştir.',
      ],
    ),

    // BÖLÜM 2: DURAKLAMANIN İÇ VE DIŞ NEDENLERİ
    LectureSection(
      title: '2. Duraklamanın İç ve Dış Nedenleri Şematik Analizi',
      type: LectureSectionType.comparison,
      imageAssetPath: 'assets/images/tarih/tarih_duraklama_nedenleri_infografik.png',
      imageCaption: 'Şema 6.2: 17. Yüzyıl Duraklama Döneminin İç ve Dış Nedenleri İnfografiği',
      leadText: 'Osmanlı Devleti\'nin 17. yüzyılda duraklama ve arayış dönemine girmesinde etkili olan iç ve dış dinamikler:',
      bulletPoints: [
        'İÇ NEDENLER:\n'
            '  • 1. Merkezi Yönetimin Bozulması: Yeteneksiz, çocuk yaşta padişahların tahta çıkması; saray kadınlarının (Kösem Sultan, Turhan Sultan) ve ocak ağalarının devlet işlerine karışması; Ekber-Erşed ve Kafes usulüyle şehzadelerin yönetim tecrübesinden yoksun yetişmesi; rüşvet ve iltimasın (torpil) artması.\n'
            '  • 2. Ordunun ve Donanmanın Bozulması: III. Murad devrinde Yeniçeri Ocağı\'na kanunsuz asker kaydedilmesi ("Ocak devlet içindir" anlayışının yerini "Devlet ocak içindir" anlayışının alması); Tımar sisteminin çökmesiyle Tımarlı Sipahi sayısının azalması ve disiplinsiz tüfekli sekban/saruca birliklerinin kurulması; donanmaya gereken önemin verilmemesi.\n'
            '  • 3. Maliyenin (Ekonominin) Bozulması: Uzun süren ve yenilgiyle biten savaşların hazineyi tüketmesi; sık taht değişimleri yüzünden cülus bahşişi ve ulufe yükünün artması; paranın değerinin düşürülmesi (akçenin tağşiş edilmesi / kırpılması); saray masraflarının aşırı artması; gümrük gelirlerinin azalması.\n'
            '  • 4. Eğitimin ve İlmiyenin Bozulması: Medreselerde pozitif bilimlerin (matematik, felsefe, coğrafya) terk edilmesi; BEŞİK ULEmALIĞI sisteminin çıkması ("Âlimin oğlu âlimdir" denilerek henüz kundaktaki çocuklara müderrislik unvanı verilmesi).',
        'DIŞ NEDENLER:\n'
            '  • 1. Doğal Sınırlara Ulaşılması: Devletin sınırlarının çöllere, okyanuslara ve aşılmaz dağlara dayanması.\n'
            '  • 2. Güçlü Devletlerle Komşu Olunması: Doğuda güçlü Safevi (İran) Devleti; batıda güçlü Avusturya ve Kutsal Roma İmparatorluğu ile Rusya ile komşu olunması.\n'
            '  • 3. Coğrafi Keşiflerin Etkisi: İpek ve Baharat yollarının Akdeniz\'den Atlas Okyanusu\'na kayması; Osmanlı gümrük gelirlerinin çökmesi; Avrupa\'dan bol miktarda gümüş ve altının Osmanlı piyasasına girerek enflasyona yol açması.\n'
            '  • 4. Avrupa\'da Rönesans ve Reform: Avrupa\'nın bilimde, teknolojide, askeri taktikte ve ateşli silahlarda hızla ilerlemesi; Osmanlı\'nın bu gelişmeleri takip edememesi.',
      ],
      goldenRule: '💡 BEŞİK ULEMALIK SİSTEMİ:\n'
          '"Âlimin oğlu âlimdir" kuralıyla rüşvetsiz ve liyakatsiz unvan dağıtılması, Osmanlı ilmiye ve eğitim sistemini felç eden en büyük iç bozulmadır.',
    ),

    // BÖLÜM 3: XVII. YÜZYIL SİYASİ OLAYLARI VE ANTLAŞMALAR
    LectureSection(
      title: '3. XVII. Yüzyıl Siyasi Olayları ve Savaşları',
      type: LectureSectionType.formula,
      leadText: 'Osmanlı Devleti XVII. yüzyılda "VARİL" şifresiyle kodlanan devletlerle (Venedik, Avusturya, Rusya, İran, Lehistan) savaşmıştır.',
      bulletPoints: [
        '1. Osmanlı - İran (Safevi) Savaşları ve Antlaşmaları:\n'
            '  • 1590 FERHAT PAŞA ANTLAŞMASI: Osmanlı Devleti DOĞUDA EN GENİŞ SINIRLARINA ULAŞMIŞTIR (Tebriz, Karabağ, Dağıstan alındı).\n'
            '  • 1612 Nasuh Paşa Antlaşması: Ferhat Paşa ile alınan yerler geri verildi; İran yılda 200 deve yükü ipek vermeyi kabul etti.\n'
            '  • 1618 Serav Antlaşması: İpek vergisi 100 deve yüküne indirildi.\n'
            '  • 1639 KASR-I ŞİRİN ANTLAŞMASI: IV. Murad\'ın Revan ve Bağdat Seferleri ("Bağdat Fatihi") sonucunda imzalanmıştır. Zağros Dağları sınır kabul edilmiş; GÜNÜMÜZ TÜRKİYE - İRAN SINIRININ TEMELİ ÇİZİLMİŞTİR.',
        '2. Osmanlı - Lehistan Savaşları:\n'
            '  • 1621 Hotin Seferi: Genç Osman (II. Osman) ordunun başında sefere çıkmış; yeniçerilerin isteksizliğini görünce YENİÇERİ OCAĞINI KALDIRMAYA KARAR VEREN İLK PADİŞAH olmuştur.\n'
            '  • 1672 BUCAŞ ANTLAŞMASI: Podolya ve Ukrayna Osmanlı\'ya katılmıştır. OSMANLI DEVLETİ BATIDA EN GENİŞ SINIRLARINA ULAŞMIŞTIR.',
        '3. Osmanlı - Venedik İlişkileri:\n'
            '  • Girit Adası Kuşatması: 1645\'te başlayan kuşatma tam 24 YIL sürmüş; 1669 yılında Köprülü Fazıl Ahmed Paşa tarafından fethedilmiştir. Bu durum Osmanlı donanmasının ne derece yıprandığını kanıtlamıştır.',
        '4. Osmanlı - Avusturya Savaşları:\n'
            '  • 1596 Haçova Meydan Muharebesi (III. Mehmed "Eğri Fatihi"). Kanuni\'den sonra ordunun başında sefere çıkan ilk padişahtır.\n'
            '  • 1606 ZİTVATOROK ANTLAŞMASI: Avusturya arşidükü protokolde Osmanlı padişahına eşit sayılmıştır. Osmanlı\'nın 1533 İstanbul Antlaşması ile kazandığı DİPLOMATİK ÜSTÜNLÜK SONA ERMİŞTİR (Mütekabiliyet ilkesi).\n'
            '  • 1664 Vasvar Antlaşması: Uyvar Kalesi fethedilmiştir ("Uyvar önünde bir Türk gibi kuvvetli" sözü doğmuştur).',
        '5. II. Viyana Kuşatması (1683) ve Kutsal İttifak Savaşları:\n'
            '  • Sadrazam Merzifonlu Kara Mustafa Paşa Viyana\'yı kuşatmış; Lehistan ordusunun yardıma gelmesiyle ordu iki ateş arasında kalarak büyük hezimete uğramıştır.\n'
            '  • Papa\'nın çağrısıyla Avusturya, Rusya, Lehistan, Venedik ve Malta\'dan oluşan KUTSAL İTTİFAK kurulmuş; 16 yıl süren savaşlarda Osmanlı ağır yenilgiler almıştır.\n'
            '  • 1699 KARLOFÇA ANTLAŞMASI: Osmanlı Devleti batıda İLK KEZ BÜYÜK ÇAPTA TOPRAK KAYBETMİŞTİR (Macaristan, Erdel Avusturya\'ya; Mora ve Dalmaçya Venedik\'e; Podolya Lehistan\'a verildi).\n'
            '  • 1700 İstanbul Antlaşması: Rusya ile yapıldı; Azak Kalesi Rusya\'ya verildi ve Ruslar İstanbul\'da ilk kez daimi elçi bulundurma hakkı kazandı.',
      ],
      goldenRule: '💡 SINIRLARIN ZİRVESİ:\n'
          '• Doğuda en geniş sınırlar = 1590 FERHAT PAŞA ANTLAŞMASI\n'
          '• Batıda en geniş sınırlar = 1672 BUCAŞ ANTLAŞMASI\n'
          '• Batıda ilk büyük toprak kaybı ve Gerilemenin başlangıcı = 1699 KARLOFÇA ANTLAŞMASI.',
    ),

    // BÖLÜM 4: XVII. YÜZYIL İSYANLARI
    LectureSection(
      title: '4. XVII. Yüzyıl İç İsyanları: İstanbul, Celali & Eyalet',
      type: LectureSectionType.ruleList,
      leadText: 'Merkezi otoritenin bozulmasıyla imparatorluğun her köşesinde devleti sarsan büyük halk ve asker isyanları patlak vermiştir.',
      bulletPoints: [
        '1. İstanbul (Yeniçeri / Merkez) İsyanları:\n'
            '  • Nedenleri: Kapıkulu askerlerine ayarı düşük akçe (kırpık para) verilmesi; cülus bahşişlerinin ödenmemesi veya gecikmesi; "Devlet ocak içindir" zihniyeti.\n'
            '  • Sonuçları: Padişah ve sadrazamlar görevden alınmış veya katledilmiştir.\n'
            '  • GENÇ OSMAN\'IN ŞEHİT EDİLMESİ (1622): Yeniçeri ocağını kaldırmak isteyen II. Osman Yedikule Zindanları\'nda yeniçerilerce boğularak öldürülmüştür.\n'
            '  • Çınar Vakası (Vaka-i Vakvakiye - 1656): IV. Mehmed döneminde yeniçerilerin talebiyle 30 kadar devlet adamı Sultanahmet Meydanı\'ndaki çınar ağacına asılmıştır.',
        '2. Celali (Anadolu) İsyanları:\n'
            '  • Yavuz devrindeki Bozoklu Celal isyanından adını alır. Nedenleri: Tımar sisteminin bozulması, vergilerin keyfi artırılması, köylünün toprağını terk etmesi (Çiftbozan), yerel yöneticilerin zulmü.\n'
            '  • Önemli İsyancılar: Karayazıcı, Deli Hasan, Canbolatoğlu, Kalenderoğlu, Kör Mahmut.\n'
            '  • Sonuçları: Anadolu\'da can ve mal güvenliği kalmamış; köylüler şehirlere kaçmış (Büyük Kaçgun); tarımsal üretim çökmüş; vergiler toplanamamıştır. İsyancılar Kuyucu Murat Paşa tarafından şiddetle bastırılmıştır.',
        '3. Eyalet İsyanları:\n'
            '  • Eflak, Boğdan, Erdel ve Yemen gibi uzak eyaletlerde yöneticilerin bağımsızlık arayışıyla çıkardıkları isyanlardır. UYARI: Bu isyanlarda KESİNLİKLE MİLLİYETÇİLİK AKIMI YOKTUR! (Fransız İhtilali henüz olmamıştır).',
      ],
    ),

    // BÖLÜM 5: XVII. YÜZYIL ISLAHATLARI VE ISLAHATÇILARI
    LectureSection(
      title: '5. XVII. Yüzyıl Islahatçıları (Şifre: TOKMAK)',
      type: LectureSectionType.comparison,
      leadText: 'Duraklamayı durdurmak için yapılan XVII. yüzyıl ıslahatlarının şifresi "TOKMAK"tır (Tarhuncu, Osman, Kuyucu, Murad, Ahmet, Köprülüler).',
      bulletPoints: [
        'XVII. Yüzyıl Islahatlarının Genel Özellikleri:\n'
            '  • 1. Kişilere bağlı kalmıştır; devlet politikası haline gelememiştir (Islahatçı ölünce ıslahat bitmiştir).\n'
            '  • 2. Sorunların köküne inilememiş, yüzeysel kalınmıştır; baskı ve şiddet yoluyla asayiş sağlanmaya çalışılmıştır.\n'
            '  • 3. Yükselme dönemi (Kanuni devri) örnek alınmıştır.\n'
            '  • 4. KESİNLİKLE BATI (AVRUPA) ÖRNEK ALINMAMIŞTIR! (Avrupa\'nın üstünlüğü henüz kabul edilmemiştir).\n'
            '  • 5. En çok yeniçeriler ve ulema sınıfı ıslahatlara karşı çıkmıştır.',
        'Önemli Islahatçılar:\n'
            '  • T - Tarhuncu Ahmed Paşa: Osmanlı tarihinde İLK KEZ DENK BÜTÇE hazırlayan sadrazamdır. Saray masraflarını kıstığı için çıkar çevrelerince iftirayla idam ettirilmiştir.\n'
            '  • O - Genç Osman (II. Osman): İlk radikal ıslahatçıdır. Saray dışından evlenerek (Şeyhülislamın kızıyla) saray kadınlarının etkisini kırmaya çalışmıştır. Başkenti Anadolu\'ya taşımayı ve Yeniçeri Ocağını kaldırmayı düşündüğü için şehit edilmiştir.\n'
            '  • K - Kuyucu Murad Paşa: I. Ahmed devrinde Celali isyanlarını kılıç ve kuyu yöntemleriyle çok sert şekilde bastırmıştır.\n'
            '  • M - IV. Murad: Saray kadınlarının saltanatına son verip otoriteyi sağlamıştır. İçki, tütün ve gece sokağa çıkma yasağı koymuştur. KOÇİ BEY VE KÂTİP ÇELEBİ\'ye devletin bozulma nedenlerini içeren RİSALELER (Raporlar) hazırlatmıştır.\n'
            '  • A - I. Ahmed: Verasette "Ekber ve Erşed" sistemini getirerek taht kavgalarını bitirmiştir.\n'
            '  • K - Köprülüler Dönemi (Köprülü Mehmed Paşa): Tahta şartlar ileri sürerek sadrazam olan İLK devlet adamıdır (Can ve mal güvenliği, sarayın işine karışmaması şartı). Maliyeyi ve orduyu düzeltmiş; devlete Duraklama içinde bir Yükselme dönemi yaşatmışlardır (Köprülü Fazıl Ahmed Paşa, Girit\'i fethetmiştir).',
      ],
      goldenRule: '💡 XVII. YÜZYIL ISLAHATLARINDA BATI ETKİSİ YOKTUR:\n'
          'ÖSYM sorularında sıkça tuzak kurulur: XVII. yüzyıl (1600\'ler) ıslahatlarında Avrupa/Batı etkisi KESİNLİKLE YOKTUR! Batı tarzı ıslahatlar XVIII. yüzyılda Lale Devri ile başlayacaktır.',
    ),
  ],
);
