import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/bomb_game_model.dart';

class BombGameData {
  static List<BombQuestion> _loadedQuestions = [];
  static bool _isLoaded = false;

  static Future<void> loadQuestions() async {
    if (_isLoaded && _loadedQuestions.isNotEmpty) return;
    try {
      String? jsonStr;
      try {
        jsonStr = await rootBundle.loadString('assets/data/bomb_questions.json');
      } catch (_) {
        try {
          jsonStr = await rootBundle.loadString('assets/assets/data/bomb_questions.json');
        } catch (_) {}
      }
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final List<dynamic> list = json.decode(jsonStr);
        _loadedQuestions = list.map((item) => BombQuestion.fromJson(item)).toList();
        _isLoaded = true;
      }
    } catch (_) {}
  }

  static List<BombQuestion> get allQuestions =>
      _loadedQuestions.isNotEmpty ? _loadedQuestions : _fallbackQuestions;

  static const List<BombQuestion> _fallbackQuestions = [
    // ==========================================
    // TARİH SORULARI
    // ==========================================
    BombQuestion(
      id: 't_01',
      statement: 'Sivas Kongresi\'nde tüm milli cemiyetler "Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti" adı altında birleştirilmiştir.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. Sivas Kongresi her yönüyle ulusal bir kongredir ve milli birlik için tüm cemiyetler tek çatı altında toplanmıştır.',
    ),
    BombQuestion(
      id: 't_02',
      statement: 'Mustafa Kemal Paşa, Erzurum Kongresi\'ne resmi Osmanlı askeri üniformasıyla katılmıştır.',
      isTrue: false,
      category: 'tarih',
      explanation: 'YANLIŞ. Mustafa Kemal, Amasya Genelgesi\'nden hemen sonra (7/8 Temmuz 1919) askerlik mesleğinden istifa etmiş ve Erzurum Kongresi\'ne sivil olarak katılmıştır.',
    ),
    BombQuestion(
      id: 't_03',
      statement: 'Lozan Barış Antlaşması ile Boğazlar Komisyonu tamamen lağvedilmiş ve egemenlik Türkiye\'ye geçmiştir.',
      isTrue: false,
      category: 'tarih',
      explanation: 'YANLIŞ. Lozan\'da başkanı Türk olan uluslararası bir Boğazlar Komisyonu kurulmuştur. Komisyonun kaldırılıp tam egemenliğin sağlanması 1936 Montrö Boğazlar Sözleşmesi ile olmuştur.',
    ),
    BombQuestion(
      id: 't_04',
      statement: 'İlk Türk denizcisi olarak kabul edilen kişi Çaka Bey\'dir.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. 1081 yılında İzmir\'de kurduğu beylik ve ilk Türk donanması ile Türk Deniz Kuvvetleri\'nin de kuruluş yılı kabul edilir.',
    ),
    BombQuestion(
      id: 't_05',
      statement: 'Osmanlı Devleti\'nde denk bütçe hazırlayan ilk devlet adamı Tarhuncu Ahmet Paşa\'dır.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. XVII. yüzyılda IV. Mehmet döneminde gelir-gider dengesini sağlamak amacıyla ilk modern bütçeyi hazırlamıştır.',
    ),
    BombQuestion(
      id: 't_06',
      statement: 'Kutadgu Bilig, Kaşgarlı Mahmut tarafından kaleme alınmış ilk Türkçe sözlüktür.',
      isTrue: false,
      category: 'tarih',
      explanation: 'YANLIŞ. Kutadgu Bilig Yusuf Has Hacip\'in eseridir (siyasetname). Kaşgarlı Mahmut\'un eseri ise Dîvânu Lugâti\'t-Türk\'tür.',
    ),
    BombQuestion(
      id: 't_07',
      statement: 'Kurtuluş Savaşı\'nda Doğu Cephesi, Gümrü Antlaşması ile kapanmıştır.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. 3 Aralık 1920\'de Ermenistan ile imzalanan Gümrü Antlaşması, TBMM\'nin uluslararası alandaki ilk askeri ve siyasi başarısıdır.',
    ),
    BombQuestion(
      id: 't_08',
      statement: 'Misakımilli\'den verilen ilk taviz Kars Antlaşması ile Batum\'un Gürcistan\'a bırakılmasıdır.',
      isTrue: false,
      category: 'tarih',
      explanation: 'YANLIŞ. Misakımilli\'den verilen ilk taviz, 16 Mart 1921 tarihli Moskova Antlaşması ile Batum\'un Gürcistan\'a bırakılmasıdır.',
    ),
    BombQuestion(
      id: 't_09',
      statement: 'Malazgirt Savaşı sonucunda Anadolu\'da I. Dönem Türk Beylikleri kurulmaya başlamıştır.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. 1071 Malazgirt zaferinden sonra Sultan Alparslan\'ın fethettiği yerin kılıç hakkı olarak komutanlara verilmesiyle Danişmentliler, Saltuklular, Mengücekliler, Artuklular kurulmuştur.',
    ),
    BombQuestion(
      id: 't_10',
      statement: 'Tanzimat Fermanı, Padişah II. Mahmut döneminde Gülhane Parkı\'nda ilan edilmiştir.',
      isTrue: false,
      category: 'tarih',
      explanation: 'YANLIŞ. Tanzimat Fermanı 1839 yılında Sultan Abdülmecid döneminde Mustafa Reşit Paşa tarafından okunmuştur.',
    ),
    BombQuestion(
      id: 't_11',
      statement: 'Mudanya Ateşkes Antlaşması\'nda TBMM\'yi İsmet İnönü temsil etmiştir.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. Batı Cephesi Komutanı İsmet Paşa bu müzakerelerdeki başarısı sebebiyle Lozan heyet başkanlığına atanmıştır.',
    ),
    BombQuestion(
      id: 't_12',
      statement: 'Büyük Taarruz öncesinde ordunun ihtiyaçlarını karşılamak için Tekalif-i Milliye Emirleri yayımlanmıştır.',
      isTrue: false,
      category: 'tarih',
      explanation: 'YANLIŞ. Tekalif-i Milliye Emirleri Kütahya-Eskişehir muharebeleri sonrasında Sakarya Meydan Muharebesi öncesinde yayımlanmıştır.',
    ),
    BombQuestion(
      id: 't_13',
      statement: 'Osmanlı\'da ilk altın para Fatih Sultan Mehmet döneminde basılmıştır.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. İlk bakır para Osman Bey, ilk gümüş para Orhan Bey, ilk altın para (Sultani) Fatih Sultan Mehmet döneminde basılmıştır.',
    ),
    BombQuestion(
      id: 't_14',
      statement: 'Amasya Genelgesi milli mücadelenin amacı, gerekçesi ve yöntemini ilk kez belirtmiştir.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. "Milletin bağımsızlığını yine milletin azim ve kararı kurtaracaktır" maddesiyle ihtilal beyannamesi özelliği taşır.',
    ),
    BombQuestion(
      id: 't_15',
      statement: 'Osmanlı Devleti Trablusgarp Savaşı\'nı Uşi Antlaşması ile sonlandırmıştır.',
      isTrue: true,
      category: 'tarih',
      explanation: 'DOĞRU. 1912 Uşi Antlaşması ile Kuzey Afrika\'daki son Osmanlı toprağı İtalya\'ya bırakılmıştır.',
    ),

    // ==========================================
    // COĞRAFYA SORULARI
    // ==========================================
    BombQuestion(
      id: 'c_01',
      statement: 'Çukurova, Seyhan ve Ceyhan nehirlerinin taşıdığı alüvyonlarla oluşmuş Türkiye\'nin en büyük delta ovasıdır.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Çukurova, Seyhan ve Ceyhan nehirlerinin Akdeniz kıyısında oluşturduğu Türkiye\'nin en geniş delta alanıdır.',
    ),
    BombQuestion(
      id: 'c_02',
      statement: 'Türkiye\'de batıdan doğuya doğru gidildikçe sıcaklık ortalamaları yükselti nedeniyle genellikle azalır.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Ortalama yükseltinin batıdan doğuya artması nedeniyle doğuya gidildikçe sıcaklık düşer, kar örtüsünün kalma süresi uzar.',
    ),
    BombQuestion(
      id: 'c_03',
      statement: 'Türkiye\'de taşkömürü yatakları III. Jeolojik Zaman\'da (Tersiyer) oluşmuştur.',
      isTrue: false,
      category: 'cografya',
      explanation: 'YANLIŞ. Taşkömürü I. Jeolojik Zaman\'da (Paleozoik) oluşmuştur. III. Jeolojik Zaman\'da ise linyit, petrol, bor ve tuz yatakları oluşmuştur.',
    ),
    BombQuestion(
      id: 'c_04',
      statement: 'Türkiye\'de rüzgar erozyonunun en etkili olduğu bölgeler İç Anadolu ve Güneydoğu Anadolu\'dur.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Bitki örtüsünün cılız olması, düz araziler ve kurak/yarı kurak iklim rüzgar erozyonunu bu bölgelerde şiddetlendirir.',
    ),
    BombQuestion(
      id: 'c_05',
      statement: 'Karadeniz Bölgesi\'nde dağlar kıyıya dik uzandığı için deniz etkisi iç kesimlere kadar kolayca sokulabilir.',
      isTrue: false,
      category: 'cografya',
      explanation: 'YANLIŞ. Karadeniz\'de dağlar kıyıya paralel uzanır; bu yüzden deniz etkisi içeri giremez ve boyuna kıyı tipi görülür (Ege\'de dik uzanır).',
    ),
    BombQuestion(
      id: 'c_06',
      statement: 'Türkiye\'de güneyden esen Lodos ve Kıble rüzgarları sıcaklığı artırırken, kuzeyden esen Poyraz ve Karayel sıcaklığı düşürür.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Türkiye Kuzey Yarımküre\'de yer aldığından matematik konumu gereği güneyden gelen hava kütleleri sıcaklığı artırır.',
    ),
    BombQuestion(
      id: 'c_07',
      statement: 'Van Gölü, volkanik set gölü özelliği taşır ve Türkiye\'nin en büyük gölüdür.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Nemrut Dağı\'ndan çıkan lavların vadi önünü kapatmasıyla oluşan volkanik set gölüdür; suları sodalıdır.',
    ),
    BombQuestion(
      id: 'c_08',
      statement: 'Türkiye\'de buzul göllerine ve güncel buzullara en fazla Ege Bölgesi\'nde rastlanır.',
      isTrue: false,
      category: 'cografya',
      explanation: 'YANLIŞ. Güncel buzullar ve buzul gölleri en fazla yüksek dağların bulunduğu Doğu Anadolu (Cilo, Ağrı, Kaçkarlar) dağlarında yer alır.',
    ),
    BombQuestion(
      id: 'c_09',
      statement: 'Batman, Türkiye\'de ham petrolün çıkarıldığı ve ilk petrol rafinerisinin kurulduğu ildir.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. 1940\'ta Raman Dağı\'nda petrol bulunmuş ve ilk rafineri Batman\'da kurulmuştur.',
    ),
    BombQuestion(
      id: 'c_10',
      statement: 'Türkiye nüfusunun cinsiyet yapısında kadın nüfus oranı erkek nüfus oranından belirgin şekilde çok daha fazladır.',
      isTrue: false,
      category: 'cografya',
      explanation: 'YANLIŞ. TÜİK verilerine göre Türkiye nüfusunun yaklaşık %50.1\'i erkek, %49.9\'u kadındır (birbirine çok yakın olup erkek nüfusu çok hafif öndedir).',
    ),
    BombQuestion(
      id: 'c_11',
      statement: 'Divriği (Sivas) ve Hekimhan-Hasançelebi (Malatya), Türkiye\'nin en önemli demir madeni yataklarıdır.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Bu sahalar Karabük, Ereğli ve İskenderun demir-çelik fabrikalarının hammadde ihtiyacını karşılar.',
    ),
    BombQuestion(
      id: 'c_12',
      statement: 'GAP Projesi kapsamında Atatürk Barajı Fırat Nehri üzerinde kurulmuştur.',
      isTrue: true,
      category: 'cografya',
      explanation: 'DOĞRU. Atatürk Barajı Fırat Nehri üzerindedir ve hidroelektrik enerji ile tarımsal sulamada kritik role sahiptir.',
    ),

    // ==========================================
    // VATANDAŞLIK SORULARI
    // ==========================================
    BombQuestion(
      id: 'v_01',
      statement: '1982 Anayasası\'na göre TBMM üye tamsayısı 600 milletvekilidir.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. 2017 Anayasa değişikliği ile milletvekili sayısı 550\'den 600\'e çıkarılmıştır.',
    ),
    BombQuestion(
      id: 'v_02',
      statement: 'Milletvekili seçilme yaşı Türkiye\'de halen 25 olarak uygulanmaktadır.',
      isTrue: false,
      category: 'vatandaslik',
      explanation: 'YANLIŞ. 2017 Anayasa değişikliği ile milletvekili seçilme yaşı 25\'ten 18\'e indirilmiştir.',
    ),
    BombQuestion(
      id: 'v_03',
      statement: 'Cumhurbaşkanlığı Kararnameleri ile Anayasa\'da yer alan kişi hak ve ödevleri (çekirdek haklar) düzenlenebilir.',
      isTrue: false,
      category: 'vatandaslik',
      explanation: 'YANLIŞ. Temel haklar, kişi hak ve ödevleri ile siyasi haklar CB kararnamesiyle DÜZENLENEMEZ. Sadece sosyal ve ekonomik haklar düzenlenebilir.',
    ),
    BombQuestion(
      id: 'v_04',
      statement: 'Anayasa Mahkemesi 15 üyeden oluşur ve üyelerin görev süresi 12 yıldır.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. AYM üyeleri 12 yıl için seçilir ve bir kimse iki defa Anayasa Mahkemesi üyesi seçilemez.',
    ),
    BombQuestion(
      id: 'v_05',
      statement: 'Yüksek Seçim Kurulu (YSK) kararlarına karşı Anayasa Mahkemesi\'ne bireysel başvuru yapılabilir.',
      isTrue: false,
      category: 'vatandaslik',
      explanation: 'YANLIŞ. YSK kararları kesindir; YSK kararlarına karşı AYM veya Danıştay dahil başka hiçbir yargı mercie başvurulamaz.',
    ),
    BombQuestion(
      id: 'v_06',
      statement: '1982 Anayasası\'na göre kanun teklif etmeye yalnızca milletvekilleri yetkilidir.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. Bakanlar Kurulu kalktığı için artık kanun tasarısı yoktur. Yalnızca milletvekilleri kanun teklif edebilir (Bütçe Kanunu hariç; onu CB sunar).',
    ),
    BombQuestion(
      id: 'v_07',
      statement: 'Türkiye Cumhuriyeti\'nde olağanüstü hal (OHAL) ilan etme yetkisi Cumhurbaşkanı\'na aittir.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. Cumhurbaşkanı en fazla 6 ayı geçmemek üzere OHAL ilan edebilir ve aynı gün TBMM onayına sunulur.',
    ),
    BombQuestion(
      id: 'v_08',
      statement: 'Siyasi partilerin kapatılması davalarına Danıştay bakar ve kapatma kararını Danıştay verir.',
      isTrue: false,
      category: 'vatandaslik',
      explanation: 'YANLIŞ. Siyasi partilerin kapatılması davaları Yargıtay Cumhuriyet Başsavcısı\'nın açacağı dava üzerine Anayasa Mahkemesi tarafından karara bağlanır.',
    ),
    BombQuestion(
      id: 'v_09',
      statement: 'Hakimler ve Savcılar Kurulu\'nun (HSK) başkanı Adalet Bakanı\'dır.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. 13 üyeden oluşan HSK\'nın başkanı tabii üye olan Adalet Bakanı\'dır; Adalet Bakanlığı Müsteşarı (Bakan Yardımcısı) da tabii üyedir.',
    ),
    BombQuestion(
      id: 'v_10',
      statement: 'Türk vatandaşlığından çıkarma ile ilgili kararlara karşı yargı yolu tamamen kapalıdır.',
      isTrue: false,
      category: 'vatandaslik',
      explanation: 'YANLIŞ. Anayasa md. 66: "Vatandaşlıktan çıkarma ile ilgili karar ve işlemlere karşı yargı yolu kapatılamaz."',
    ),
    BombQuestion(
      id: 'v_11',
      statement: 'Bakanlıkların kurulması, kaldırılması ve teşkilat yapısı Cumhurbaşkanlığı Kararnamesi ile düzenlenir.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. 2017 değişikliğiyle bakanlıkların ihdası ve iptali kanunla değil, Cumhurbaşkanlığı Teşkilat Kararnamesi ile yapılır.',
    ),
    BombQuestion(
      id: 'v_12',
      statement: 'Kamu Denetçiliği Kurumu (Ombudsmanlık), doğrudan TBMM Başkanlığı\'na bağlı olarak çalışır.',
      isTrue: true,
      category: 'vatandaslik',
      explanation: 'DOĞRU. 2010 Anayasa değişikliği ile kurulmuştur ve Başdenetçi TBMM tarafından gizli oyla seçilir.',
    ),
  ];

  static List<BombQuestion> getQuestions({String category = 'all'}) {
    List<BombQuestion> list;
    if (category == 'all') {
      list = List.from(allQuestions);
    } else {
      list = allQuestions.where((q) => q.category.toLowerCase() == category.toLowerCase()).toList();
    }
    list.shuffle();
    return list;
  }
}
