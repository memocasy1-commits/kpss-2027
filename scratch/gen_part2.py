# -*- coding: utf-8 -*-
import os

OUT_DIR = "lib/data/tarih_topics"
os.makedirs(OUT_DIR, exist_ok=True)

# -------------------------------------------------------------
# KONU 8: XIX. YÜZYIL OSMANLI DEVLETİ (DAĞILMA & ISLAHATLAR)
# -------------------------------------------------------------
konu8_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu8DagilmaDonemi = LectureTopic(
  id: 'tarih_dagilma_donemi',
  courseId: 'tarih',
  order: 8,
  title: 'XIX. Yüzyıl Osmanlı Devleti (Dağılma & Islahatlar)',
  subtitle: 'Milliyetçilik İsyanları, Mısır Sorunu, Kırım Savaşı, 93 Harbi, Tanzimat, Islahat & Meşrutiyet',
  icon: Icons.gavel_rounded,
  color: Color(0xFF9333EA),
  testRange: 'Test 71 - 80',
  startTestNum: 71,
  endTestNum: 80,
  estimatedMinutes: 48,
  sections: [
    LectureSection(
      title: '1. Dağılma Dönemi Siyasi Olayları ve İsyanlar',
      type: LectureSectionType.overview,
      leadText: 'Fransız İhtilali\\'nin milliyetçilik akımı ve sömürgeci devletlerin "Şark Meselesi" politikaları Osmanlı\\'yı parçalanmaya itti.',
      bulletPoints: [
        'Sırp İsyanı (1804): İlk isyan eden azınlıktır (Kara Yorgi). 1812 Bükreş ile ilk imtiyazı, 1829 Edirne ile özerkliği, 1878 Berlin ile bağımsızlığı aldılar.',
        'Yunan İsyanı (1821): Navarin Baskını (1827) ile Osmanlı-Mısır donanması yakıldı. 1829 Edirne Antlaşması ile bağımsız olan İLK AZINLIK oldu!',
        'Mısır Sorunu & Kavalalı: Kütahya Antlaşması imzalandı. 1833 Hünkar İskelesi Antlaşması (Rusya ile) boğazlar üzerinde tek başımıza karar verdiğimiz SON antlaşmadır.',
        'Balta Limanı Ticaret Sözleşmesi (1838 - İngiltere): İç ve dış gümrükler düşürüldü, tekel (Yed-i Vahid) kalktı. Osmanlı ekonomisi Avrupa\\'nın açık pazarı oldu.',
        '1841 Londra Boğazlar Sözleşmesi: Boğazlar uluslararası statü kazandı; barışta savaş gemilerine kapatıldı.',
      ],
      goldenRule: '💡 İLK İSYAN EDEN VE İLK BAĞIMSIZ OLAN AZINLIK:\\nİlk isyan eden: Sırplar (1804); İlk bağımsız olan: Yunanlılar (1829 Edirne Antlaşması).',
    ),
    LectureSection(
      title: '2. Kırım Savaşı ve 93 Harbi (Berlin Antlaşması)',
      type: LectureSectionType.comparison,
      leadText: 'XIX. yüzyılda Rusya ile yapılan iki dev savaş imparatorluğun kaderini çizdi:',
      leftHeader: 'Kırım Savaşı (1853 - 1856)',
      rightHeader: '93 Harbi (1877 - 1878)',
      comparisonRows: [
        ComparisonRow(
          correct: '1853 Sinop Baskını / Florence Nightingale (Selimiye Kışlası)',
          wrong: 'Gazi Osman Paşa (Plevne) ve Nene Hatun (Aziziye Tabyası)',
          note: 'Donanma & Kahramanlar',
        ),
        ComparisonRow(
          correct: 'İngiltere\\'den İLK DIŞ BORÇ alındı (1854 - Abdülmecit)',
          wrong: 'Ağır savaş tazminatı karşılığı Kars-Ardahan-Batum verildi',
          note: 'Mali Neticeler',
        ),
        ComparisonRow(
          correct: '1856 Paris Antlaşması (Osmanlı Avrupa devleti sayıldı, toprakları garanti edildi)',
          wrong: '1878 Berlin Antlaşması (Ayastefanos yerine imzalandı)',
          note: 'Barış Antlaşması',
        ),
        ComparisonRow(
          correct: 'Karadeniz tarafsızlaştırıldı (Tersane ve donanma yasağı)',
          wrong: 'Sırbistan, Karadağ, Romanya (SAKAR) bağımsız oldu; Kıbrıs üs verildi',
          note: 'Toprak ve Statü',
        ),
      ],
      osymTrap: '⚠️ ERMENİ MESELESİ VE BERLİN ANTLAŞMASI:\\nErmeni meselesi uluslararası bir antlaşmada İLK KEZ 1878 Berlin Antlaşması\\'nın 61. maddesinde yer almıştır.',
    ),
    LectureSection(
      title: '3. II. Mahmut Islahatları: İmparatorluğun Modernleşmesi',
      type: LectureSectionType.ruleList,
      leadText: 'Devleti yeniden yapılandıran ve köklü reformlar getiren II. Mahmut dönemi:',
      bulletPoints: [
        'Sened-i İttifak (1808): Ayanlarla imzalandı. Padişahın yetkileri tarihte İLK KEZ sınırlandırıldı (Magna Carta benzeri).',
        'Vaka-i Hayriye (1826): Yeniçeri Ocağı kaldırıldı; yerine Asakir-i Mansure-i Muhammediye kuruldu.',
        'Yönetim: Divan kaldırıldı, Heyet-i Vükela (Bakanlar Kurulu/Nezaretler) kuruldu. Tımar ve Müsadere (özel mülkiyet güvencesi) kaldırıldı. Muhtarlıklar açıldı.',
        'Eğitim & Sosyal: İlk nüfus sayımı (1831), Takvim-i Vekayi (ilk resmi gazete), Mürur tezkeresi (iç pasaport), memurlara fes ve ceket zorunluluğu.',
      ],
      goldenRule: '💡 PADİŞAH YETKİSİNİ İLK KISITLAYAN BELGE: SENED-İ İTTİFAK (1808):\\nOsmanlı tarihinde padişahın mutlak otoritesini ilk kez sınırlandıran anayasal nitelikli ilk belge Sened-i İttifak\\'tır.',
    ),
    LectureSection(
      title: '4. Tanzimat, Islahat, Meşrutiyet ve Kanun-i Esasi',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Anayasalcılık, parlamento ve hukuk devleti adımları:',
      bulletPoints: [
        'Tanzimat Fermanı (1839 - Abdülmecit / Mustafa Reşit Paşa): Hukukun üstünlüğü ilkesi kabul edildi; can, mal, namus güvencesi; askerlik vatan görevi oldu.',
        'Islahat Fermanı (1856): Yalnızca Gayrimüslimlere ayrıcalıklar tanındı; Cizye kalktı, il meclislerine üyelik verildi.',
        'I. Meşrutiyet & Kanun-i Esasi (1876 - II. Abdülhamit / Genç Osmanlılar): İlk Türk Anayasası ilan edildi. Çift meclisli sistem kuruldu (Mebusan ve Ayan Meclisi).',
        'Duyun-ı Umumiye (1881): Muharrem Kararnamesi ile iflas ilan edildi; dış alacaklılar Osmanlı gelirlerine el koydu.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1878 Berlin Antlaşması ile Osmanlı Devleti\\'nden ayrılarak bağımsızlığını kazanan devletler hangileridir?',
          options: ['Yunanistan, Bulgaristan, Sırbistan', 'Sırbistan, Karadağ, Romanya', 'Bulgaristan, Arnavutluk, Bosna', 'Karadağ, Romanya, Yunanistan', 'Eflak, Boğdan, Sırbistan'],
          correctIndex: 1,
          explanation: '1878 Berlin Antlaşması ile Sırbistan, Karadağ ve Romanya (SAKAR şifresi) tam bağımsız olmuştur.',
          ruleTag: 'Berlin Antlaşması (SAKAR)',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu8_dagilma_donemi.dart", "w", encoding="utf-8") as f:
    f.write(konu8_code)

# -------------------------------------------------------------
# KONU 9: XX. YÜZYIL BAŞLARINDA OSMANLI DEVLETİ
# -------------------------------------------------------------
konu9_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu9XxYyBaslariOsmanli = LectureTopic(
  id: 'tarih_xx_yy_baslari_osmanli',
  courseId: 'tarih',
  order: 9,
  title: 'XX. Yüzyıl Başlarında Osmanlı Devleti',
  subtitle: 'II. Meşrutiyet, 31 Mart Vakası, Trablusgarp Savaşı (Uşi), I. ve II. Balkan Savaşları & Bab-ı Ali',
  icon: Icons.history_edu_rounded,
  color: Color(0xFF0284C7),
  testRange: 'Test 81 - 90',
  startTestNum: 81,
  endTestNum: 90,
  estimatedMinutes: 44,
  sections: [
    LectureSection(
      title: '1. II. Meşrutiyet (1908) ve 31 Mart Vakası (1909)',
      type: LectureSectionType.overview,
      leadText: 'Reval görüşmeleri sonrası İttihatçıların baskısıyla II. Meşrutiyet ilan edildi.',
      bulletPoints: [
        'Meşrutiyet İlanı Sırasındaki 3 Kayıp (BBG): Bulgaristan bağımsız oldu, Avusturya Bosna-Hersek\\'i ilhak etti, Girit Yunanistan\\'a bağlandı.',
        '31 Mart Vakası (13 Nisan 1909):\\n  • Meşrutiyet rejimine ve anayasaya karşı gericilerin çıkardığı İLK İRTİCAİ İSYANDIR.\\n  • Mahmut Şevket Paşa ve Mustafa Kemal (Kurmay Başkanı) komutasındaki "Hareket Ordusu" Selanik\\'ten gelerek isyanı bastırdı.\\n  • Mustafa Kemal\\'in tarih sahnesine çıktığı İLK olaydır!\\n  • II. Abdülhamit tahttan indirildi; V. Mehmet Reşat getirildi.',
      ],
      goldenRule: '💡 TARİHTE REJİME KARŞI ÇIKAN İLK İSYAN: 31 MART VAKASI (1909):\\nOsmanlı tarihinde padişah veya kişilere değil, anayasal meşrutiyet rejimine karşı çıkan ilk isyandır.',
    ),
    LectureSection(
      title: '2. Trablusgarp Savaşı (1911 - 1912) & Uşi Antlaşması',
      type: LectureSectionType.ruleList,
      leadText: 'İtalya sömürge amacıyla saldırdı; Osmanlı donanmasız ve karadan yardımsız kaldı.',
      bulletPoints: [
        'Gönüllü Subaylar: Mustafa Kemal (Gazeteci Şerif takma adıyla Derne ve Tobruk\\'ta zaferler kazandı - İlk askeri başarısı); Enver Paşa (Kuyumcu Hamdi adıyla Bingazi\\'de savaştı).',
        'Dünya tarihinde İLK SAVAŞ UÇAĞI İtalya tarafından Trablusgarp\\'ta kullanıldı.',
        'Uşi Antlaşması (1912): Trablusgarp ve Bingazi İtalya\\'ya bırakıldı (Kuzey Afrika\\'daki SON toprak kaybedildi!). On İki Ada geçici olarak İtalya\\'ya bırakıldı.',
      ],
      osymTrap: '⚠️ MUSTAFA KEMAL\\'İN İLK SAVAŞI: TRABLUSGARP:\\nMustafa Kemal Paşa\\'nın sömürgeciliğe karşı verdiği ilk savaş Trablusgarp Savaşı\\'dır.',
    ),
    LectureSection(
      title: '3. I. ve II. Balkan Savaşları (1912 - 1913) & Bab-ı Ali Baskını',
      type: LectureSectionType.comparison,
      leadText: 'Balkan devletleri Osmanlı\\'yı Balkanlar\\'dan tamamen atmak için saldırdı:',
      leftHeader: 'I. Balkan Savaşı (1912 - 1913)',
      rightHeader: 'II. Balkan Savaşı (1913)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Osmanlı vs Bulgaristan, Yunanistan, Sırbistan, Karadağ',
          wrong: 'Bulgaristan vs Yunanistan, Sırbistan, Karadağ + ROMANYA + Osmanlı',
          note: 'Savaşan Bloklar',
        ),
        ComparisonRow(
          correct: 'Orduda particilik ve terhisler yüzünden ağır hezimet; Midye-Enez hattına çekilme',
          wrong: 'Osmanlı Midye-Enez\\'i aşarak Edirne ve Kırklareli\\'yi geri aldı (Enver Paşa Edirne Fatihi)',
          note: 'Askeri Gelişme',
        ),
        ComparisonRow(
          correct: 'Bab-ı Ali Baskını (İlk hükümet darbesi); Arnavutluk bağımsız oldu (Ayrılan son Balkan devleti)',
          wrong: 'Meriç Nehri Türkiye-Bulgaristan sınırı oldu (İstanbul & Atina Antlaşmaları)',
          note: 'Siyasi Netice',
        ),
      ],
      goldenRule: '💡 ROMANYA FAKTÖRÜ:\\nRomanya I. Balkan Savaşı\\'nda yer almamış; Bulgaristan\\'ın fazla pay alması üzerine II. Balkan Savaşı\\'na katılmıştır.',
    ),
    LectureSection(
      title: '4. XX. Yüzyıl Başları Soru Çözümleri',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Balkan savaşları ve Trablusgarp test soruları:',
      bulletPoints: [
        'Arnavutluk Osmanlı\\'dan ayrılan son Balkan devletidir; İslamcılık akımı çökmüştür.',
        'Bab-ı Ali Baskını Türk tarihindeki ilk hükümet darbesidir (Kamil Paşa yerine Mahmut Şevket Paşa).',
        'Uşi Antlaşması ile Kuzey Afrika\\'daki Türk varlığı tamamen sona ermiştir.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'I. Balkan Savaşı\\'nda yer almadığı halde, II. Balkan Savaşı\\'na katılan devlet hangisidir?',
          options: ['Karadağ', 'Sırbistan', 'Romanya', 'Yunanistan', 'Bulgaristan'],
          correctIndex: 2,
          explanation: 'Romanya I. Balkan Savaşı\\'nda yoktur; Bulgaristan\\'a karşı II. Balkan Savaşı\\'na girmiştir.',
          ruleTag: 'Romanya Faktörü',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu9_xx_yy_baslari_osmanli.dart", "w", encoding="utf-8") as f:
    f.write(konu9_code)

# -------------------------------------------------------------
# KONU 10: I. DÜNYA SAVAŞI & MONDROS (SİYAH-BEYAZ HARİTALI)
# -------------------------------------------------------------
konu10_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu10BirinciDunyaSavasi = LectureTopic(
  id: 'tarih_birinci_dunya_savasi',
  courseId: 'tarih',
  order: 10,
  title: 'I. Dünya Savaşı ve Mondros Ateşkesi',
  subtitle: 'Savaşın Sebepleri, Cepheler, Siyah-Beyaz Askeri Harekât Haritası, Gizli Antlaşmalar & Mondros',
  icon: Icons.shield_rounded,
  color: Color(0xFF1E293B),
  testRange: 'Test 91 - 100',
  startTestNum: 91,
  endTestNum: 100,
  estimatedMinutes: 52,
  sections: [
    LectureSection(
      title: '1. Savaşın Nedenleri ve Osmanlı Devleti\\'nin Savaşa Girişi',
      type: LectureSectionType.overview,
      leadText: 'Sömürgecilik yarışı, bloklaşma ve Franz Ferdinand\\'ın öldürülmesi savaşı başlattı.',
      bulletPoints: [
        'Goben ve Breslau (Yavuz ve Midilli): İngilizlerden kaçıp Osmanlı\\'ya sığınan Alman gemileri Sivastopol ve Odessa Rus limanlarını bombalayarak Osmanlı\\'yı fiilen savaşa soktu.',
        'Kapitülasyonlar tek taraflı kaldırıldı; en çok tepkiyi müttefikimiz Almanya gösterdi.',
        'Savaştan ilk çekilen İtilaf devleti Rusya (Brest-Litowsk), en son katılan Yunanistan oldu.',
      ],
      goldenRule: '💡 İTTİFAK VE İTİLAF BLOKLARI:\\nİttifak: Almanya, Avusturya-Macaristan, Osmanlı, Bulgaristan.\\nİtilaf: İngiltere, Fransa, Rusya, İtalya, ABD, Yunanistan, Sırbistan.',
    ),
    LectureSection(
      title: '2. I. Dünya Savaşı Osmanlı Cepheleri & Askeri Harekât Haritası',
      type: LectureSectionType.formula,
      leadText: 'Osmanlı Devleti 3 kategoride toplam 9 cephede savaşmıştır (Taarruz: Kafkas-Kanal; Savunma: Çanakkale-Irak-Suriye-Hicaz; Yardım: Galiçya-Romanya-Makedonya).',
      mapData: LectureMapData(
        title: 'I. DÜNYA SAVAŞI OSMANLI CEPHELERİ ASKERİ HAREKÂT ŞEMASI',
        subtitle: '1914 - 1918 Stratejik Siyah-Beyaz Muharebe ve Cephe Haritası',
        mapId: 'dunya_savasi_cepheler_haritasi',
        historicalNote: 'Osmanlı ordusu Kafkas, Kanal, Çanakkale, Irak, Hicaz-Yemen ve Suriye cephelerinde 4 yıl boyunca 7 düvele karşı direnmiştir.',
        legends: [
          MapLegendItem(
            label: 'Taarruz Cepheleri',
            symbol: '[T>>] Siyah Ok',
            description: 'Kafkas ve Kanal cepheleri (Toprak kazanma ve Süveyş\\'i kesme hedefli).',
          ),
          MapLegendItem(
            label: 'Savunma Cepheleri',
            symbol: '[<=S] Çift Kalkan',
            description: 'Çanakkale, Irak, Hicaz-Yemen ve Suriye-Filistin cepheleri.',
          ),
          MapLegendItem(
            label: 'Sınır Dışı Yardım',
            symbol: '[...Y] Destek Hattı',
            description: 'Galiçya, Romanya ve Makedonya cepheleri (Müttefiklere yardım).',
          ),
          MapLegendItem(
            label: 'Mustafa Kemal Cepheleri',
            symbol: '[*M.K*] Yıldız',
            description: 'Çanakkale, Kafkas ve Suriye-Filistin cepheleri (Ç-A-K-S).',
          ),
        ],
        points: [
          MapFrontItem(
            name: 'KAFKAS CEPHESİ',
            category: 'Taarruz Cephesi',
            commander: 'Enver Paşa, Mustafa Kemal Paşa (16. Kolordu), Kazım Karabekir',
            keyEvent: 'Sarıkamış Harekâtı, Tehcir Kanunu (1915), Muş ve Bitlis\\'in M. Kemal tarafından kurtarılması.',
            outcome: '1918 Brest-Litowsk ile Kars, Ardahan, Batum geri alındı. Yenilgiyle başlayıp toprak kazanılan TEK cephedir.',
          ),
          MapFrontItem(
            name: 'KANAL CEPHESİ (SÜVEYŞ)',
            category: 'Taarruz Cephesi',
            commander: 'Bahriye Nazırı Cemal Paşa, Kress von Kressenstein',
            keyEvent: 'İngiltere\\'nin Hindistan sömürge yolunu kesmek için iki kez Süveyş Kanalı\\'na taarruz yapıldı.',
            outcome: 'Çöl şartları ve susuzluk yüzünden başarısız oldu; İngilizler Sina ve Filistin\\'e ilerledi.',
          ),
          MapFrontItem(
            name: 'ÇANAKKALE CEPHESİ',
            category: 'Savunma Cephesi',
            commander: 'Cevat Çobanlı (18 Mart Kahramanı), Mustafa Kemal (Anafartalar Komutanı)',
            keyEvent: '18 Mart Deniz Zaferi, Nusret Mayın Gemisi, Conkbayırı, Anafartalar, Arıburnu direnişi.',
            outcome: 'Savaş 2 yıl uzadı; Çarlık Rusyası çöktü; Bulgaristan İttifak safına geçti; KAZANILAN TEK CEPHEDİR.',
          ),
          MapFrontItem(
            name: 'IRAK CEPHESİ & KUT\\'ÜL AMARE',
            category: 'Savunma Cephesi',
            commander: 'Halil Kut Paşa, Nurettin Paşa',
            keyEvent: '29 Nisan 1916 Kut\\'ül Amare Zaferi\\'nde General Townshend ve 13.300 İngiliz askeri esir alındı.',
            outcome: 'Büyük askeri zafer kazanıldı ancak takviye alan İngilizler daha sonra Bağdat ve Kerkük\\'ü işgal etti.',
          ),
          MapFrontItem(
            name: 'HİCAZ - YEMEN CEPHESİ',
            category: 'Savunma Cephesi',
            commander: 'Fahrettin Paşa ("Medine Müdafii", "Çöl Kaplanı")',
            keyEvent: 'Şerif Hüseyin ve İngiliz casusu Lawrence\\'a karşı 2 yıl 7 ay çekirge yiyerek Medine savunuldu.',
            outcome: 'Kutsal emanetler İstanbul\\'a kaçırıldı; Mondros sonrası teslim olundu.',
          ),
          MapFrontItem(
            name: 'SURİYE - FİLİSTİN CEPHESİ',
            category: 'Savunma Cephesi',
            commander: 'Cemal Paşa, Mustafa Kemal Paşa (Yıldırım Orduları Grup Komutanı)',
            keyEvent: 'Mustafa Kemal Halep\\'in kuzeyinde (Katma) güçlü bir savunma hattı kurarak düşmanı durdurdu.',
            outcome: 'Bu hat bugünkü Misak-ı Milli sınırımızın güney hattını belirledi. M. Kemal\\'in savaştığı SON cephedir.',
          ),
        ],
      ),
      bulletPoints: [
        'Mustafa Kemal\\'in Savaştığı Cepheler Sırasıyla: Ç-A-K-S (Çanakkale -> Kafkas -> Suriye).',
        'Toprak kazanılan tek cephe: Kafkas Cephesi (Brest-Litowsk ile Kars, Ardahan, Batum).',
        'Kut\\'ül Amare Kahramanı: Halil Kut Paşa; Medine Müdafii: Fahrettin Paşa.',
      ],
      goldenRule: '💡 MUSTAFA KEMAL\\'İN CEPHE KRONOLOJİSİ: Ç-K-S\\n1915 Çanakkale (Anafartalar) -> 1916 Kafkas (Muş ve Bitlis) -> 1918 Suriye (Katma Savunma Hattı).',
    ),
    LectureSection(
      title: '3. Gizli Antlaşmalar, Wilson İlkeleri & Mondros (30 Ekim 1918)',
      type: LectureSectionType.ruleList,
      leadText: 'İtilaf devletleri gizli antlaşmalarla Osmanlı\\'yı paylaştı; Sovyet Rusya bu antlaşmaları Sarı Kitap ile dünyaya duyurdu.',
      bulletPoints: [
        'Gizli Antlaşmalar: Sykes-Picot (Ortadoğu paylaşıldı), MacMahon (Araplara krallık vaadi), Saint-Jean de Maurienne (İzmir İtalya\\'ya verildi - Paris\\'te Yunan\\'a çevrilecek).',
        'Wilson İlkeleri: "Yenenler yenilenlerden toprak ve tazminat almayacak" maddesini aşmak için "Manda ve Himaye" kavramı uyduruldu. Self-determinasyon ilkesi getirildi.',
        'Mondros Mütarekesi (30 Ekim 1918 - Rauf Orbay & Calthorpe):\\n  • 7. Madde: "İtilaf güvenlik tehdidinde istediği stratejik yeri işgal edebilir." (İşgallerin yasal kılıfı!).\\n  • 24. Madde: "Vilâyât-ı Sitte\\'de (Bitlis, Erzurum, Sivas, Elazığ, Van, Diyarbakır - BESEV-D) karışıklık çıkarsa işgal edilebilir." (Ermeni devleti planı!).\\n  • İlk işgal edilen Osmanlı toprağı Musul; Anadolu toprağı Hatay Dörtyol oldu.\\n  • 13 Kasım 1918\\'de İstanbul işgal edilince Atatürk: "Geldikleri gibi giderler!" dedi.',
      ],
      osymTrap: '⚠️ VİLÂYÂT-I SİTTE İLLERİ (24. MADDE):\\nBitlis, Erzurum, Sivas, Elazığ, Van, Diyarbakır (BESEV-D). Trabzon bu listede KESİNLİKLE YOKTUR!',
    ),
    LectureSection(
      title: '4. I. Dünya Savaşı ve Mondros Test Soruları',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'KPSS\\'nin en çok sorduğu I. Dünya Savaşı ve Mondros soruları:',
      bulletPoints: [
        'Çanakkale Zaferi savaşın süresini en az 2 yıl uzatmış ve Çarlık Rusya\\'nın çökmesine yol açmıştır.',
        'Mondros\\'un 7. maddesi tüm Anadolu\\'yu işgale açık hale getirmiştir.',
        'İlk işgal edilen yer Musul\\'dur (3 Kasım 1918 - İngiltere).',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'I. Dünya Savaşı\\'nda Osmanlı ordusunun General Townshend dahil 13.000\\'den fazla İngiliz askerini esir aldığı tarihi zafer hangisidir?',
          options: ['Çanakkale Zaferi', 'Kut\\'ül Amare Zaferi', 'Sarıkamış Zaferi', 'Muş Zaferi', 'Gazze Zaferi'],
          correctIndex: 1,
          explanation: '29 Nisan 1916\\'da Halil Kut Paşa komutasındaki Osmanlı ordusu Irak Cephesi\\'nde Kut\\'ül Amare Zaferi\\'ni kazanarak 13.300 İngiliz askerini esir almıştır.',
          ruleTag: 'Kut\\'ül Amare Zaferi',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu10_birinci_dunya_savasi.dart", "w", encoding="utf-8") as f:
    f.write(konu10_code)

# -------------------------------------------------------------
# KONU 11: KURTULUŞ SAVAŞI HAZIRLIK DÖNEMİ
# -------------------------------------------------------------
konu11_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu11KurtulusSavasiHazirlik = LectureTopic(
  id: 'tarih_kurtulus_savasi_hazirlik',
  courseId: 'tarih',
  order: 11,
  title: 'Kurtuluş Savaşı Hazırlık Dönemi',
  subtitle: 'Genelgeler, Erzurum & Sivas Kongreleri, Amasya Görüşmeleri, Misak-ı Milli & I. TBMM',
  icon: Icons.flag_rounded,
  color: Color(0xFFDC2626),
  testRange: 'Test 101 - 110',
  startTestNum: 101,
  endTestNum: 110,
  estimatedMinutes: 48,
  sections: [
    LectureSection(
      title: '1. Samsun\\'a Çıkış, Havza ve Amasya Genelgeleri',
      type: LectureSectionType.overview,
      leadText: '19 Mayıs 1919\\'da Mustafa Kemal Paşa\\'nın 9. Ordu Müfettişi olarak Samsun\\'a ayak basmasıyla Milli Mücadele başladı.',
      bulletPoints: [
        'Havza Genelgesi (28 Mayıs 1919): İşgalleri protesto eden mitingler yapılması istendi (Milli bilinç uyandı).',
        'Amasya Genelgesi (22 Haziran 1919 - İhtilal Beyannamesi):\\n  • Gerekçe: Vatanın bütünlüğü, milletin bağımsızlığı tehlikededir.\\n  • Amaç ve Yöntem: "Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır." (İlk kez millet egemenliği ve rejim değişikliği ima edildi).\\n  • Mustafa Kemal Erzurum\\'da askerlikten istifa ederek "Sine-i Millete" döndü.',
      ],
      goldenRule: '💡 AMASYA GENELGESİ:\\nMilli Mücadele\\'nin gerekçesi, amacı ve yöntemi İLK KEZ Amasya Genelgesi\\'nde belirtilmiştir. M. Kemal askerlikten Erzurum\\'da istifa etmiştir.',
    ),
    LectureSection(
      title: '2. Erzurum ve Sivas Kongreleri',
      type: LectureSectionType.comparison,
      leadText: 'Bölgesel direnişten topyekün ulusal teşkilatlanmaya geçiş:',
      leftHeader: 'Erzurum Kongresi (1919)',
      rightHeader: 'Sivas Kongresi (1919)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Toplanış BÖLGESEL, kararlar MİLLİ',
          wrong: 'Hem toplanış hem kararlar TAMAMEN MİLLİ (Ulusal)',
          note: 'Toplanış & Karar',
        ),
        ComparisonRow(
          correct: 'İLK KEZ reddedildi',
          wrong: 'KESİN ve SON KEZ reddedildi',
          note: 'Manda ve Himaye',
        ),
        ComparisonRow(
          correct: 'Doğu cemiyetleri birleştirildi',
          wrong: 'Bütün cemiyetler Anadolu ve Rumeli Müdafaa-i Hukuk (ARMHC) çatısında birleşti',
          note: 'Cemiyetler',
        ),
        ComparisonRow(
          correct: 'Temsil Heyeti doğu için kuruldu',
          wrong: 'Ali Fuat Paşa Batı Cephesi\\'ne atandı (Hükümet gibi yürütme); Damat Ferit istifa ettirildi (İlk zafer)',
          note: 'Yürütme & Siyasi Başarı',
        ),
      ],
      osymTrap: '⚠️ TEMSİL HEYETİ\\'NİN İLK SİYASİ ZAFERİ:\\nSivas Kongresi sonrasında İstanbul Hükümeti Damat Ferit Paşa\\'nın istifa etmesi Temsil Heyeti\\'nin ilk siyasi zaferidir.',
    ),
    LectureSection(
      title: '3. Amasya Görüşmeleri, Misak-ı Milli & İstanbul\\'un İşgali',
      type: LectureSectionType.ruleList,
      leadText: 'Amasya Görüşmeleri ile İstanbul Hükümeti Temsil Heyeti\\'ni İLK KEZ HUKUKEN TANIMIŞTIR.',
      bulletPoints: [
        'Misak-ı Milli (28 Ocak 1920 - KAPAROS Şifresi):\\n  • K - Kapitülasyonlar (Asla kabul edilemez)\\n  • A - Azınlıklar (Komşu ülkelerdeki Müslümanlar kadar hak)\\n  • P - Parçalanamaz sınırlar (Mondros anında işgal edilmemiş topraklar)\\n  • A - Araplar (Geleceğini halk oylaması belirler)\\n  • R - Referandum (Batı Trakya, Kars-Ardahan-Batum, Arap illeri)\\n  • O - Boğazlar (Güvenlik sağlanırsa ticarete açık)\\n  • S - Borçlar (Taksim edilerek ödenmeli).',
        '16 Mart 1920: İtilaf devletleri İstanbul\\'u resmen işgal etti, Meclis-i Mebusan\\'ı bastı. Bu durum TBMM\\'nin açılmasına doğrudan zemin hazırladı.',
      ],
      goldenRule: '💡 REFERANDUM İSTENEN 3 BÖLGE:\\nMisak-ı Milli\\'de halk oylaması istenen yerler: Batı Trakya, Kars-Ardahan-Batum (Elviye-i Selase) ve Arap topraklarıdır.',
    ),
    LectureSection(
      title: '4. I. TBMM Dönemi (1920 - 1923)',
      type: LectureSectionType.interactiveQuiz,
      leadText: '23 Nisan 1920\\'de açılan ilk meclisin özellikleri ve Sevr Antlaşması:',
      bulletPoints: [
        'I. TBMM Özellikleri: Kurucudur (1921 Anayasası), ihtilalcidir, savaş meclisidir, güçler birliği ilkesi geçerlidir, meclis hükümeti sistemi uygulanır, siyasi parti yoktur.',
        'I. TBMM\\'nin TEK inkılabı: 1 Kasım 1922\\'de Saltanatın kaldırılmasıdır.',
        'Sevr Antlaşması (10 Ağustos 1920): Saltanat Şûrası imzalamış, Mebusan Meclisi onaylamadığı için hukuken geçersiz / ölü doğmuş antlaşmadır.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi I. TBMM\\'nin yaptığı İLK ve TEK inkılaptır?',
          options: ['Cumhuriyetin İlanı', 'Halifeliğin Kaldırılması', 'Saltanatın Kaldırılması', 'Tevhid-i Tedrisat Kanunu', 'Şapka Kanunu'],
          correctIndex: 2,
          explanation: 'I. TBMM\\'nin gerçekleştirdiği ilk ve tek inkılap 1 Kasım 1922\\'de Saltanatın kaldırılmasıdır. Diğer bütün inkılaplar II. TBMM tarafından yapılmıştır.',
          ruleTag: 'I. TBMM İnkılabı',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu11_kurtulus_savasi_hazirlik.dart", "w", encoding="utf-8") as f:
    f.write(konu11_code)

# -------------------------------------------------------------
# KONU 12: KURTULUŞ SAVAŞI MUHAREBELER & LOZAN (SİYAH-BEYAZ HARİTALI)
# -------------------------------------------------------------
konu12_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu12KurtulusSavasiMuharebeler = LectureTopic(
  id: 'tarih_kurtulus_savasi_muharebeler',
  courseId: 'tarih',
  order: 12,
  title: 'Kurtuluş Savaşı Muharebeler ve Antlaşmalar',
  subtitle: 'Doğu, Güney, Batı Cepheleri, Siyah-Beyaz Kurtuluş Savaşı Muharebeler Haritası, Sakarya, Büyük Taarruz & Lozan',
  icon: Icons.sports_score_rounded,
  color: Color(0xFF059669),
  testRange: 'Test 111 - 120',
  startTestNum: 111,
  endTestNum: 120,
  estimatedMinutes: 52,
  sections: [
    LectureSection(
      title: '1. Doğu ve Güney Cepheleri',
      type: LectureSectionType.overview,
      leadText: 'Doğu\\'da Kazım Karabekir komutasında düzenli ordu; Güney\\'de ise tamamen Kuvayımilliye destan yazmıştır.',
      bulletPoints: [
        'Doğu Cephesi & Gümrü Antlaşması (3 Aralık 1920): Kazım Karabekir (15. Kolordu) Ermenileri yendi. TBMM\\'nin İLK askeri ve siyasi zaferidir. Misak-ı Milli\\'yi tanıyan ve Sevr\\'i reddeden İLK devlet Ermenistan oldu.',
        'Güney Cephesi: Düzenli ordu yoktur; halk direnişi vardır. Maraş (Sütçü İmam), Antep (Şahin Bey - ilk unvan alan şehir 1921), Urfa (Ali Saip Bey). 1921 Ankara Antlaşması ile Fransa çekilerek TBMM\\'yi tanıyan İLK İTİLAF DEVLETİ oldu.',
      ],
      goldenRule: '💡 TBMM\\'Yİ TANIYAN İLKLER:\\n• İlk devlet: Ermenistan (Gümrü)\\n• İlk Müslüman devlet: Afganistan\\n• İlk büyük Avrupa devleti: Sovyet Rusya (Moskova)\\n• İlk İtilaf devleti: Fransa (1921 Ankara).',
    ),
    LectureSection(
      title: '2. Batı Cephesi Muharebeleri & Askeri Harekât Haritası',
      type: LectureSectionType.formula,
      leadText: 'Yunan ordusuna ve emperyalizme karşı kazanılan tarihi meydan muharebeleri askeri planı:',
      mapData: LectureMapData(
        title: 'KURTULUŞ SAVAŞI BATI CEPHESİ STRATEJİK HAREKÂT PLANI',
        subtitle: '1921 - 1922 Siyah-Beyaz Taktik Muharebeler ve Karşı Taarruz Şeması',
        mapId: 'kurtulus_savasi_muharebeler_haritasi',
        historicalNote: 'Garp Cephesi orduları İnönü, Sakarya ve Büyük Taarruz muharebeleriyle işgalci güçleri vatan topraklarından tamamen atmıştır.',
        legends: [
          MapLegendItem(
            label: 'İnönü Savunma Hatları',
            symbol: '[===] Çift Çizgi',
            description: 'I. ve II. İnönü savunma mevzileri (Eskişehir ve Metristepe).',
          ),
          MapLegendItem(
            label: 'Sakarya Meydan Satıh Hattı',
            symbol: '[###] Topyekün Satıh',
            description: '100 km uzunluğundaki vatan sathı savunma hattı.',
          ),
          MapLegendItem(
            label: 'Büyük Taarruz Kuşatması',
            symbol: '[==>>] Hilal Kuşatma',
            description: 'Dumlupınar ve Kocatepe\\'den Akdeniz\\'e imha taarruzu.',
          ),
          MapLegendItem(
            label: 'Komuta Karargâhları',
            symbol: '[HQ] Karargâh',
            description: 'Gazi Mustafa Kemal Paşa ve İsmet Paşa taktik tepeleri.',
          ),
        ],
        points: [
          MapFrontItem(
            name: 'I. İNÖNÜ MUHAREBESİ (OCAK 1921)',
            category: 'Savunma Zaferi',
            commander: 'Albay İsmet İnönü (Batı Cephesi Komutanı)',
            keyEvent: 'Düzenli ordunun kazandığı İLK ZAFERDİR! Yunan ordusu Metristepe\\'de durduruldu.',
            outcome: 'M-İ-L-A-T sonuçları: Moskova, İstiklal Marşı, Londra Konferansı, Afgan Dostluk, Teşkilat-ı Esasiye.',
          ),
          MapFrontItem(
            name: 'II. İNÖNÜ MUHAREBESİ (MART 1921)',
            category: 'Savunma Zaferi',
            commander: 'Tümgeneral İsmet Paşa',
            keyEvent: 'Yunanlılar tekrar püskürtüldü. M. Kemal telgrafı: "Milletin makûs talihini de yendiniz."',
            outcome: 'İtalya Anadolu\\'dan çekilmeye başladı; Fransa barış zemini aradı.',
          ),
          MapFrontItem(
            name: 'KÜTAHYA - ESKİŞEHİR MUHAREBELERİ',
            category: 'Taktik Geri Çekilme',
            commander: 'İsmet Paşa, Mustafa Kemal Paşa',
            keyEvent: 'Düzenli ordunun TEK YENİLGİSİDİR! Ordu Sakarya\\'nın doğusuna çekildi.',
            outcome: 'Mustafa Kemal\\'e BAŞKOMUTANLIK yetkisi verildi; Tekâlif-i Milliye Emirleri yayımlandı; Maarif Kongresi toplandı.',
          ),
          MapFrontItem(
            name: 'SAKARYA MEYDAN MUHAREBESİ (1921)',
            category: 'Meydan Muharebesi',
            commander: 'Gazi Mustafa Kemal Paşa, Fevzi Çakmak, İsmet Paşa',
            keyEvent: '22 gün 22 gece sürdü. "Hattı müdafaa yoktur, sathı müdafaa vardır. O satıh bütün vatandır!"',
            outcome: '238 yıllık Türk geri çekilişi bitti; taarruz sırası bize geçti. Kars ve 1921 Ankara Antlaşmaları imzalandı.',
          ),
          MapFrontItem(
            name: 'BÜYÜK TAARRUZ & BAŞKOMUTANLIK (1922)',
            category: 'İmha Harekâtı & Nihai Zafer',
            commander: 'Başkomutan Gazi Mustafa Kemal, Mareşal Fevzi Çakmak',
            keyEvent: '26 Ağustos Kocatepe topçu ateşi; 30 Ağustos Dumlupınar\\'da Yunan ordusu imha edildi.',
            outcome: '"Ordular! İlk hedefiniz Akdeniz\\'dir, ileri!" emriyle 9 Eylül\\'de İzmir kurtarıldı; askeri safha zaferle bitti.',
          ),
        ],
      ),
      bulletPoints: [
        'Mudanya Mütarekesi (11 Ekim 1922 - İsmet İnönü): Doğu Trakya, İstanbul ve Boğazlar SAVAŞ YAPILMADAN kurtarıldı. Osmanlı Devleti HUKUKEN SONA ERDİ.',
      ],
      goldenRule: '💡 SAVAŞSIZ KURTARILAN BÖLGELER:\\nDoğu Trakya, İstanbul ve Boğazlar Mudanya Mütarekesi ile tek kurşun atılmadan diplomatik zaferle kurtarılmıştır.',
    ),
    LectureSection(
      title: '3. Lozan Barış Antlaşması (24 Temmuz 1923) - Türkiye\\'nin Tapusu',
      type: LectureSectionType.ruleList,
      leadText: 'İsmet İnönü başkanlığındaki heyet tarafından imzalandı. Asla taviz verilmeyen iki konu Kapitülasyonlar ve Ermeni Yurdudur.',
      bulletPoints: [
        'Kapitülasyonlar TAMAMEN kaldırıldı (En büyük zafer).',
        'Azınlıkların tümü Türk vatandaşı sayıldı (İç işlerimize müdahale önlendi).',
        'Karaağaç savaş tazminatı olarak Yunanistan\\'dan alındı.',
        'Boğazlar başkanı Türk olan uluslararası komisyona bırakıldı (1936 Montrö ile lehimize çözülecek).',
        'Çözülemeyen TEK konu Musul Meselesi (Irak sınırı) oldu.',
      ],
      osymTrap: '⚠️ LOZAN\\'DA ÇÖZÜLEMEYEN TEK MESELE:\\nLozan\\'da çözüme kavuşturulamayıp sonraya bırakılan tek konu Musul (Irak Sınırı) meselesidir.',
    ),
    LectureSection(
      title: '4. Kurtuluş Savaşı Muharebeler Test Soruları',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Batı Cephesi ve Lozan sınav soruları:',
      bulletPoints: [
        'Sakarya Zaferi sonrası Mustafa Kemal\\'e Mareşallik ve Gazilik unvanı verilmiştir.',
        'Mudanya Mütarekesi ile Osmanlı Devleti hukuken sona ermiştir.',
        'Doğu sınırımızın kesinleştiği antlaşma Kars Antlaşması\\'dır.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Lozan Barış Konferansı\\'nda çözülemeyip Türkiye ile İngiltere arasındaki ikili görüşmelere bırakılan konu hangisidir?',
          options: ['Boğazlar Meselesi', 'Irak Sınırı (Musul)', 'Kapitülasyonlar', 'Patrikhane', 'Dış Borçlar'],
          correctIndex: 1,
          explanation: 'Lozan Barış Konferansı\\'nda çözülemeyen tek mesele Musul Meselesi (Irak Sınırı) olmuş ve İngiltere ile sonradan ikili görüşmelere bırakılmıştır.',
          ruleTag: 'Lozan ve Musul Meselesi',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu12_kurtulus_savasi_muharebeler.dart", "w", encoding="utf-8") as f:
    f.write(konu12_code)

# -------------------------------------------------------------
# KONU 13: ATATÜRKÇÜLÜK VE TÜRK İNKILÂBI
# -------------------------------------------------------------
konu13_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu13AtaturkculukInkilaplar = LectureTopic(
  id: 'tarih_ataturkculuk_inkilaplar',
  courseId: 'tarih',
  order: 13,
  title: 'Atatürkçülük ve Türk İnkılâbı',
  subtitle: 'İlkeler, Siyasi, Hukuk, Eğitim, Toplum & Ekonomi İnkılapları, Çok Partili Hayat Denemeleri',
  icon: Icons.psychology_rounded,
  color: Color(0xFFB91C1C),
  testRange: 'Test 121 - 130',
  startTestNum: 121,
  endTestNum: 130,
  estimatedMinutes: 50,
  sections: [
    LectureSection(
      title: '1. Atatürk İlkeleri ve Anahtar Kavramlar',
      type: LectureSectionType.comparison,
      leadText: 'Atatürk İlkeleri Türk milletini çağdaş medeniyetler seviyesinin üstüne çıkarmayı hedefler:',
      leftHeader: 'İlke Adı & Kodları',
      rightHeader: 'Doğrudan İlgili Temel İnkılaplar',
      comparisonRows: [
        ComparisonRow(
          correct: 'Milli egemenlik, ulusal irade, seçim, meclis, demokrasi',
          wrong: 'TBMM açılışı, Saltanatın kalkması, Cumhuriyetin ilanı',
          note: 'Cumhuriyetçilik',
        ),
        ComparisonRow(
          correct: 'Milli benlik, Türk dili/tarihi, bağımsızlık, Kabotaj',
          wrong: 'Türk Tarih Kurumu, Türk Dil Kurumu, Kabotaj Kanunu',
          note: 'Milliyetçilik',
        ),
        ComparisonRow(
          correct: 'Eşitlik, adalet, ayrıcalıkların reddi, sosyal dayanışma',
          wrong: 'Aşar vergisinin kalkması, Medeni Kanun, Soyadı Kanunu',
          note: 'Halkçılık',
        ),
        ComparisonRow(
          correct: 'Karma ekonomi, kamulaştırma, sanayi planları, KİT\\'ler',
          wrong: 'I. Beş Yıllık Sanayi Planı, Sümerbank, Etibank, Demiryolları',
          note: 'Devletçilik',
        ),
        ComparisonRow(
          correct: 'Akılcılık, bilimsellik, din ve devlet işlerinin ayrılması',
          wrong: 'Halifeliğin kalkması, Şer\\'iye ve Evkaf, Tekke-zaviyeler',
          note: 'Laiklik',
        ),
        ComparisonRow(
          correct: 'Dinamizm, çağdaşlaşma, modernleşme, köklü değişim',
          wrong: 'Takvim, saat, rakam, ölçü değişiklikleri, Şapka inkılabı',
          note: 'İnkılapçılık',
        ),
      ],
      goldenRule: '💡 KABOTAJ KANUNU = MİLLİYETÇİLİK:\\n1 Temmuz 1926 Kabotaj Kanunu Türk karasularında deniz taşımacılığını millileştirdiği için doğrudan Milliyetçilik ilkesine girer.',
    ),
    LectureSection(
      title: '2. Siyasal ve Hukuk Alanında İnkılaplar',
      type: LectureSectionType.ruleList,
      leadText: '3 Mart 1924 kanunları ve Türk Medeni Kanunu ile laik hukuk düzeni kuruldu.',
      bulletPoints: [
        'Cumhuriyetin İlanı (29 Ekim 1923): Meclis hükümeti sisteminden KABİNE SİSTEMİNE geçildi. İlk Cumhurbaşkanı M. Kemal, ilk Başbakan İsmet İnönü, ilk Meclis Başkanı Ali Fethi Okyar oldu.',
        '3 Mart 1924 Kanunları: Halifelik kaldırıldı, Şer\\'iye ve Evkaf Vekâleti kaldırıldı (Diyanet kuruldu), Erkân-ı Harbiye kaldırıldı (Ordu siyasetten ayrıldı), Tevhid-i Tedrisat kabul edildi.',
        'Türk Medeni Kanunu (1926 - İsviçre\\'den): Resmi nikah, tek eşlilik, mirasta ve mahkemede eşitlik, istediği mesleğe girme hakkı tanındı. DİKKAT: KESİNLİKLE SİYASİ HAK VERİLMEDİ!',
        'Kadınlara Siyasi Haklar (0-3-4 B-M-V): 1930 Belediye, 1933 Muhtarlık, 1934 Vekillik (Milletvekili).',
      ],
      osymTrap: '⚠️ MEDENİ KANUN VE SİYASİ HAK TUZAĞI:\\nTürk Medeni Kanunu kadınlara siyasi hak (seçme-seçilme) VERMEMİŞTİR! Siyasi haklar 1930, 1933 ve 1934 yıllarında anayasa değişiklikleriyle verilmiştir (034 BMV).',
    ),
    LectureSection(
      title: '3. Eğitim, Kültür ve Çok Partili Hayat Denemeleri',
      type: LectureSectionType.overview,
      leadText: 'Harf İnkılabı, Millet Mektepleri ve demokrasiye geçiş denemeleri:',
      bulletPoints: [
        'Harf İnkılabı (1 Kasım 1928) ve Millet Mektepleri (24 Kasım Atatürk Başöğretmen oldu).',
        'Üniversite Reformu (1933): Albert Malche raporuyla Darülfünun kapatılıp modern İstanbul Üniversitesi açıldı.',
        'Terakkiperver Cumhuriyet Fırkası (TCF - 1924): İlk muhalefet partisidir (Kazım Karabekir - Şifre: KARAR). Şeyh Sait İsyanı (1925) sonrası Takrir-i Sükûn Kanunu ile kapatıldı.',
        'Serbest Cumhuriyet Fırkası (SCF - 1930): Fethi Okyar kurdu, kendi kendini feshetti. Ardından Menemen Olayı (Asteğmen Kubilay şehit edildi - Divan-ı Harp\\'te yargılandılar) yaşandı.',
      ],
      goldenRule: '💡 MENEMEN OLAYI VE DİVAN-I HARP:\\nMenemen Olayı sanıkları İstiklal Mahkemeleri\\'nde değil, sıkıyönetim askeri mahkemesi olan DİVAN-I HARP\\'te yargılanmıştır.',
    ),
    LectureSection(
      title: '4. İnkılaplar ve İlkeler Test Soruları',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'KPSS İnkılap Tarihi soru çözümleri:',
      bulletPoints: [
        'Aşar vergisinin kaldırılması doğrudan Halkçılık ilkesidir.',
        'Kadınlara milletvekili seçme ve seçilme hakkı 1934\\'te tanınmıştır.',
        'Albert Malche İstanbul Üniversitesi\\'nin kurulmasını sağlayan İsviçreli uzmandır.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Aşağıdakilerden hangisi 1926 yılında kabul edilen Türk Medeni Kanunu ile kadınlara tanınan haklardan biri DEĞİLDİR?',
          options: ['Resmi nikah zorunluluğu', 'Mirasta kadın-erkek eşitliği', 'İstediği mesleğe girebilme hakkı', 'Belediye seçimlerine katılma hakkı', 'Boşanma ve velayette eşitlik hakkı'],
          correctIndex: 3,
          explanation: 'Belediye seçimlerine katılma hakkı Medeni Kanun ile değil, 1930 yılında çıkarılan Belediye Kanunu ile tanınmış bir siyasi haktır.',
          ruleTag: 'Medeni Kanun Sınırları',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu13_ataturkculuk_inkilaplar.dart", "w", encoding="utf-8") as f:
    f.write(konu13_code)

# -------------------------------------------------------------
# KONU 14: ATATÜRK DÖNEMİ DIŞ POLİTİKA & ÇAĞDAŞ TÜRK-DÜNYA
# -------------------------------------------------------------
konu14_code = '''import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

const LectureTopic konu14CagdasTurkDunya = LectureTopic(
  id: 'tarih_cagdas_turk_dunya',
  courseId: 'tarih',
  order: 14,
  title: 'Atatürk Dönemi Dış Politika ve Çağdaş Türk-Dünya Tarihi',
  subtitle: 'Montrö, Balkan Antantı, Sadabat Paktı, Hatay, II. Dünya Savaşı, Soğuk Savaş, Kore, NATO & Kıbrıs',
  icon: Icons.public_rounded,
  color: Color(0xFF0891B2),
  testRange: 'Test 131 - 140',
  startTestNum: 131,
  endTestNum: 140,
  estimatedMinutes: 52,
  sections: [
    LectureSection(
      title: '1. Atatürk Dönemi Türk Dış Politikası (1923 - 1938)',
      type: LectureSectionType.overview,
      leadText: '"Yurtta sulh, cihanda sulh" ilkesiyle yürütülen gerçekçi ve barışçıl diplomasi:',
      bulletPoints: [
        'Musul Meselesi (1926 Ankara Antlaşması): Şeyh Sait İsyanı yüzünden askeri harekat yapılamadı; Musul İngiliz mandasındaki Irak\\'a bırakıldı; petrol gelirlerinden 25 yıl %10 pay alındı.',
        'Milletler Cemiyeti\\'ne Giriş (1932): İspanya\\'nın teklifi, Yunanistan\\'ın desteğiyle DAVETLE katılan İLK ve TEK devlet olduk.',
        'Balkan Antantı (1934 - TAYYAR): Türkiye, Yunanistan, Yugoslavya, Romanya (Bulgaristan yayılmacı olduğu için katılmadı).',
        'Montrö Boğazlar Sözleşmesi (20 Temmuz 1936): Uluslararası Boğazlar Komisyonu KALDIRILDI! Boğazlar tamamen Türk askerine ve egemenliğine geçti.',
        'Sadabat Paktı (1937): İtalya tehdidine karşı Türkiye, İran, Irak, Afganistan arasında Tahran\\'da imzalandı (Suriye Hatay sorunu yüzünden girmedi).',
        'Hatay\\'ın Anavatana Katılması: Sandler Raporu hazırlandı; 1938 Bağımsız Hatay Devleti kuruldu (Cumhurbaşkanı Tayfur Sökmen, Başbakan Abdurrahman Melek). 1939\\'da anavatana katıldı.',
      ],
      goldenRule: '💡 MONTRÖ İLE TAM EGEMENLİK:\\nMontrö Boğazlar Sözleşmesi (1936) ile Boğazlar Komisyonu feshedilmiş ve Boğazların kontrolü kayıtsız şartsız Türkiye Cumhuriyeti\\'ne geçmiştir.',
    ),
    LectureSection(
      title: '2. II. Dünya Savaşı (1939 - 1945) ve Türkiye',
      type: LectureSectionType.ruleList,
      leadText: 'İsmet İnönü döneminde uygulanan "Aktif Tarafsızlık" politikası:',
      bulletPoints: [
        'Adana ve Kahire Görüşmeleri (1943): Churchill ve Roosevelt ile görüşüldü; prensipte savaşa onay verildi ancak ordu hazır olmadığı için savaşa fiilen girilmedi.',
        'Yalta Konferansı kararı gereği BM\\'nin kurucu üyesi olabilmek için 23 Şubat 1945\\'te Almanya ve Japonya\\'ya SEMBOLİK OLARAK savaş ilan edildi.',
        'İç Politika & Ekonomi: Ekmek karnesi, Varlık Vergisi (1942), Köy Enstitüleri (1940 - Hasan Âli Yücel & İsmail Hakkı Tonguç), Milli Korunma Kanunu.',
      ],
      osymTrap: '⚠️ SEMBOLİK SAVAŞ İLANI NEDENİ:\\nTürkiye\\'nin Almanya ve Japonya\\'ya savaş ilan etmesinin tek amacı: Birleşmiş Milletler Cemiyeti\\'ne kurucu üye olabilmektir.',
    ),
    LectureSection(
      title: '3. Soğuk Savaş, Kore Savaşı, NATO & Kıbrıs Harekâtı',
      type: LectureSectionType.comparison,
      leadText: 'İki kutuplu dünyada Türkiye\\'nin yeri ve milli meselelerimiz:',
      leftHeader: 'Kore Savaşı & NATO (1952)',
      rightHeader: 'Kıbrıs Barış Harekâtı (1974)',
      comparisonRows: [
        ComparisonRow(
          correct: 'Tuğgeneral Tahsin Yazıcı (Kunuri Zaferi) / Adnan Menderes & Celal Bayar',
          wrong: 'Bülent Ecevit & Necmettin Erbakan / Rauf Denktaş & Dr. Fazıl Küçük',
          note: 'Komutan & Liderler',
        ),
        ComparisonRow(
          correct: 'Şimal Yıldızı Tugayı Kunuri\\'de ABD 8. Ordusunu kurtardı',
          wrong: '"AYŞE TATİLE ÇIKSIN" (Dışişleri Bakanı Turan Güneş\\'in kızı)',
          note: 'Tarihi Parola & Harekât',
        ),
        ComparisonRow(
          correct: 'Türkiye ve Yunanistan 1952\\'de NATO\\'ya resmen kabul edildi',
          wrong: 'Kıbrıs Türkleri soykırımdan kurtarıldı; 1983\\'te KKTC kuruldu; ASELSAN kuruldu',
          note: 'Stratejik Netice',
        ),
      ],
      goldenRule: '💡 TÜRKİYE\\'NİN NATO\\'YA GİRİŞİ (1952):\\nTürkiye Kore Savaşı\\'na asker göndererek kazandığı Kunuri Zaferi sayesinde 1952 yılında NATO\\'ya tam üye olmuştur.',
    ),
    LectureSection(
      title: '4. SSCB\\'nin Dağılması ve Bağımsız Türk Cumhuriyetleri',
      type: LectureSectionType.interactiveQuiz,
      leadText: '1991 sonrası kurulan bağımsız Türk devletleri ve kurumlar:',
      bulletPoints: [
        'Azerbaycan (Ebülfez Elçibey), Kazakistan (Nursultan Nazarbayev - nükleer cephaneliğinden vazgeçen ilk lider), Özbekistan (İslam Kerimov), Kırgızistan (Askar Akayev), Türkmenistan (Saparmurat Niyazov).',
        'Türkiye bu cumhuriyetlerin bağımsızlığını dünyada tanıyan İLK DEVLET olmuştur.',
        'İşbirliği Kuruluşları: TİKA (1992), TÜRKSOY (1993), Türk Devletleri Teşkilatı.',
      ],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: '1974 Kıbrıs Barış Harekâtı\\'nı başlatan tarihi şifreli parola aşağıdakilerden hangisidir?',
          options: ['Ordular İlk Hedefiniz Akdeniz\\'dir', 'Ayşe Tatile Çıksın', 'Geldikleri Gibi Giderler', 'Ya İstiklal Ya Ölüm', 'Ne Mutlu Türküm Diyene'],
          correctIndex: 1,
          explanation: 'Dışişleri Bakanı Turan Güneş\\'in Cenevre görüşmelerinin sonuçsuz kalması üzerine Ankara\\'ya ilettiği "Ayşe Tatile Çıksın" parolasıyla harekâtın ikinci etabı başlatılmıştır.',
          ruleTag: 'Kıbrıs Barış Harekâtı',
        ),
      ],
    ),
  ],
);
'''

with open(f"{OUT_DIR}/konu14_cagdas_turk_dunya.dart", "w", encoding="utf-8") as f:
    f.write(konu14_code)

print("Part 2 updated with exact model fields.")
