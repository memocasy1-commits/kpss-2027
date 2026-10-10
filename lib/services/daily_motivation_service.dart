import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class MotivationalQuote {
  final int id;
  final String quote;
  final String author;
  final String authorTitle;
  final String category;
  final String actionTip;

  const MotivationalQuote({
    required this.id,
    required this.quote,
    required this.author,
    required this.authorTitle,
    required this.category,
    required this.actionTip,
  });
}

class DailyMotivationService {
  DailyMotivationService._();
  static final DailyMotivationService instance = DailyMotivationService._();

  static const String _lastDateKey = 'last_motivation_quote_date';
  static const String _enabledKey = 'show_daily_motivation_enabled';

  final List<MotivationalQuote> _quotes = const [
    MotivationalQuote(
      id: 1,
      quote: "Zafer, 'zafer benimdir' diyebilenindir. Başarı ise, 'başaracağım' diye başlayarak sonunda 'başardım' diyebilenindir.",
      author: "Mustafa Kemal Atatürk",
      authorTitle: "Türkiye Cumhuriyeti'nin Kurucusu",
      category: "Zafer & İrade",
      actionTip: "Güne 'Bugün programımı eksiksiz tamamlayacağım' inancıyla başla ve ilk testini hemen çöz.",
    ),
    MotivationalQuote(
      id: 2,
      quote: "Çoğu insan zekaya inanır, ben inanmam. Bizi birbirimizden ayıran emektir, ben çalışmaya inanırım.",
      author: "Prof. Dr. Aziz Sancar",
      authorTitle: "Nobel Kimya Ödüllü Türk Bilim İnsanı",
      category: "Emek & Çalışma",
      actionTip: "KPSS bir zeka sınavı değil; düzenli, disiplinli ve sabırlı bir emek maratonudur.",
    ),
    MotivationalQuote(
      id: 3,
      quote: "Çalışmak için müsait gün ve saat arama. Bil ki her gün ve her saat çalışmanın en müsait vaktidir.",
      author: "Ord. Prof. Dr. Ali Fuat Başgil",
      authorTitle: "Hukukçu & 'Gençlerle Başbaşa' Yazarı",
      category: "Zaman & Disiplin",
      actionTip: "Erteleme bahanelerini bir kenara bırak. Şu an elindeki 15 dakika bile 10 soru çözmek için yeterlidir.",
    ),
    MotivationalQuote(
      id: 4,
      quote: "Dünle beraber gitti cancağzım, ne kadar söz varsa düne ait. Şimdi yeni şeyler söylemek lazım.",
      author: "Mevlana Celaleddin-i Rumi",
      authorTitle: "Düşünür & Mutasavvıf",
      category: "Yenilenme & Umut",
      actionTip: "Dün çözemediğin soruları geride bırak. Bugün temiz bir sayfa aç ve hedefine odaklan.",
    ),
    MotivationalQuote(
      id: 5,
      quote: "Dinlenmemek üzere yürümeye karar verenler, asla ve asla yorulmazlar.",
      author: "Mustafa Kemal Atatürk",
      authorTitle: "Ebedi Başkomutan",
      category: "Kararlılık & Azim",
      actionTip: "Yorulduğunda pes etme; dinlenmek için durakla ama hedefe giden yolu asla terk etme.",
    ),
    MotivationalQuote(
      id: 6,
      quote: "Matematik de resim ve müzik gibi bir sanattır. Anlamak için sabır, sevmek için emek gerekir.",
      author: "Ord. Prof. Dr. Cahit Arf",
      authorTitle: "Dünyaca Ünlü Matematik Dehası",
      category: "Analitik Düşünce & Sabır",
      actionTip: "Zorlandığın derslerin üstüne cesaretle git; çözdüğün her problem zihnini keskinleştirir.",
    ),
    MotivationalQuote(
      id: 7,
      quote: "Gelecek; güçsüzler için 'imkânsız', korkaklar için 'bilinmez', cesurlar için ise 'fırsat' demektir.",
      author: "Victor Hugo",
      authorTitle: "Dünya Edebiyatının Zirve Kalemi",
      category: "Cesaret & Fırsat",
      actionTip: "Sınav gününe odaklanıp kaygılanmak yerine, bugünün sana sunduğu öğrenme fırsatını değerlendir.",
    ),
    MotivationalQuote(
      id: 8,
      quote: "Sabah uyandığında nefes almanın, düşünmenin, keyif almanın ve çabalamanın ne büyük bir ayrıcalık olduğunu hatırla.",
      author: "Marcus Aurelius",
      authorTitle: "Filozof İmparator & 'Kendime Düşünceler'",
      category: "Farkındalık & Güç",
      actionTip: "Günün ilk dakikalarında kendine teşekkür et ve bugünü hayallerin için en verimli güne dönüştür.",
    ),
    MotivationalQuote(
      id: 9,
      quote: "İnsanın en büyük başarısı, kendine verdiği sözü tutabilmesidir. Geleceğin, bugünkü emeğinin eseridir.",
      author: "Doğan Cüceloğlu",
      authorTitle: "Psikolog & Yazar",
      category: "Kendine Söz Vermek",
      actionTip: "Bugün kendine bir hedef koy: 'En az 50 soru çözeceğim.' Gün bittiğinde bu sözü tutmuş ol.",
    ),
    MotivationalQuote(
      id: 10,
      quote: "Zor olduğu için cesaret edemiyor değiliz; cesaret edemediğimiz için zordur.",
      author: "Seneca",
      authorTitle: "Roma Filozofu & Devlet Adamı",
      category: "Cesaret & Eylem",
      actionTip: "Gözünde büyüttüğün en zor konuyu belirle ve ilk 5 dakikayı sadece ona başlamaya ayır.",
    ),
    MotivationalQuote(
      id: 11,
      quote: "Hiç durmadığınız sürece ne kadar yavaş gittiğinizin hiçbir önemi yoktur.",
      author: "Konfüçyüs",
      authorTitle: "Doğu Felsefesinin Öncüsü",
      category: "Süreklilik & İstikrar",
      actionTip: "Hızlı koşan değil, her gün adım atmaya devam eden kazanır. İstikrar zincirini sakın kırma.",
    ),
    MotivationalQuote(
      id: 12,
      quote: "Zamanınızı iyi kullanın. Okumak, öğrenmek ve kendine değer katmak bir tercih değil, kendine borcundur.",
      author: "Prof. Dr. İlber Ortaylı",
      authorTitle: "Tarihçi & Akademisyen",
      category: "Zamanın Kıymeti",
      actionTip: "Gereksiz sosyal medya turlarını kısıtla; kazandığın yarım saati Tarih özetlerine ayır.",
    ),
    MotivationalQuote(
      id: 13,
      quote: "İlim ilim bilmektir, ilim kendin bilmektir. Sen kendini bilmezsin, ya nice okumaktır.",
      author: "Yunus Emre",
      authorTitle: "Büyük Halk Şairi & Düşünür",
      category: "Öz-Disiplin & Bilgelik",
      actionTip: "Eksiklerini dürüstçe kabul et ve yanlış yaptığın soruların çözümünü mutlaka incele.",
    ),
    MotivationalQuote(
      id: 14,
      quote: "Biz tekrar tekrar ne yapıyorsak oyuz. Dolayısıyla mükemmellik bir eylem değil, bir alışkanlıktır.",
      author: "Aristoteles",
      authorTitle: "Antik Çağ Felsefecisi",
      category: "Alışkanlık & Disiplin",
      actionTip: "Her gün belirli bir saatte soru çözmeyi alışkanlık haline getir; başarı kendiliğinden gelir.",
    ),
    MotivationalQuote(
      id: 15,
      quote: "Tembellik insanı paslandırır, çalışmak ise çelikleştirir. İradeni zayıflatan bahanelere boyun eğme.",
      author: "Ord. Prof. Dr. Ali Fuat Başgil",
      authorTitle: "Hukukçu & Düşünür",
      category: "İrade Eğitimi",
      actionTip: "Canın ders çalışmak istemediğinde bile sadece masaya otur ve tek bir test aç; gerisi gelecektir.",
    ),
    MotivationalQuote(
      id: 16,
      quote: "Yapılana kadar her şey imkânsız görünür.",
      author: "Nelson Mandela",
      authorTitle: "Barış & Direniş Lideri",
      category: "İnanç & Başarı",
      actionTip: "Yüksek puanlar sana uzak görünebilir. Her doğru cevap bu mesafeyi adım adım kısaltır.",
    ),
    MotivationalQuote(
      id: 17,
      quote: "Küçük hedefler peşinde koşanlar, büyük zaferlerin gururunu asla yaşayamazlar.",
      author: "Mustafa Kemal Atatürk",
      authorTitle: "Büyük Önder",
      category: "Yüksek Hedefler",
      actionTip: "Hedefini yüksek tut. Barajı geçmeyi değil, branşında ilk sıralara yerleşmeyi amaçla.",
    ),
    MotivationalQuote(
      id: 18,
      quote: "Memleketi sevmek lafla olmaz. Memleketi sevmek işini en iyi şekilde yapmakla, çok çalışmakla olur.",
      author: "Prof. Dr. Aziz Sancar",
      authorTitle: "Bilim İnsanı",
      category: "Vatan Sevgisi & Görev",
      actionTip: "Atandığın gün bu ülkeye en iyi hizmeti verecek memur olmak için bugünden donanımını artır.",
    ),
    MotivationalQuote(
      id: 19,
      quote: "İnanırsan yolun yarısını çoktan geçmişsindir.",
      author: "Theodore Roosevelt",
      authorTitle: "Devlet Adamı & Yazar",
      category: "Özgüven",
      actionTip: "Kendine olan inancını yüksek tut. Başaranların tek sırrı, inanmayı hiç bırakmamış olmalarıdır.",
    ),
    MotivationalQuote(
      id: 20,
      quote: "Bilgiye yapılan yatırım her zaman en yüksek kârı getirir.",
      author: "Benjamin Franklin",
      authorTitle: "Bilim İnsanı & Yazar",
      category: "Öğrenmenin Değeri",
      actionTip: "Bugün çözdüğün her yeni soru tipi, geleceğinin en sağlam teminatıdır.",
    ),
    MotivationalQuote(
      id: 21,
      quote: "Arkanızda bıraktıklarınız ve önünüzde duranlar, içinizde olanların yanında küçücük kalır.",
      author: "Ralph Waldo Emerson",
      authorTitle: "Düşünür & Şair",
      category: "İçsel Güç",
      actionTip: "Geçmiş denemelerin sonuçları seni yanıltmasın; içinde ortaya çıkmayı bekleyen muazzam bir güç var.",
    ),
    MotivationalQuote(
      id: 22,
      quote: "Kafanızı sorularla doldurmaktan ve onların peşine düşmekten asla vazgeçmeyin.",
      author: "Cahit Arf",
      authorTitle: "Matematikçi",
      category: "Merak & Öğrenme",
      actionTip: "Yanlış yaptığın her soruyu bir hediye olarak gör; çünkü sana bilmediğin bir noktayı öğretti.",
    ),
    MotivationalQuote(
      id: 23,
      quote: "Başarı son değildir, başarısızlık da ölümcül değildir: Önemli olan devam etme cesaretidir.",
      author: "Winston Churchill",
      authorTitle: "Devlet Adamı",
      category: "Dayanıklılık",
      actionTip: "Deneme netlerin dalgalanabilir. Moralini bozma, analizini yap ve aynı kararlılıkla devam et.",
    ),
    MotivationalQuote(
      id: 24,
      quote: "Kendi potansiyelini keşfetmek isteyen insan, zorluklarla karşılaştığında geri adım atmaz; ders çıkarır.",
      author: "Doğan Cüceloğlu",
      authorTitle: "Yazar & Psikolog",
      category: "Kişisel Gelişim",
      actionTip: "Bugün zorlandığın branştan en az 2 test çözerek sınırlarını bir kademe daha genişlet.",
    ),
    MotivationalQuote(
      id: 25,
      quote: "Muhtaç olduğun kudret, damarlarındaki asil kanda mevcuttur!",
      author: "Mustafa Kemal Atatürk",
      authorTitle: "Gençliğe Hitabe",
      category: "İnanç & Kudret",
      actionTip: "Yorulduğunda kim olduğunu ve arkandaki büyük mirası hatırla; başını dik tut ve çalış.",
    ),
    MotivationalQuote(
      id: 26,
      quote: "Bir mum diğer mumu tutuşturmakla ışığından bir şey kaybetmez.",
      author: "Mevlana Celaleddin-i Rumi",
      authorTitle: "Gönül Mimarı",
      category: "Cömertlik & Paylaşım",
      actionTip: "Öğrendiğin bilgileri arkadaşlarınla paylaş; anlattıkça kendi bilgin de pekişecektir.",
    ),
    MotivationalQuote(
      id: 27,
      quote: "Yelkenini hangi limana çevireceğini bilmeyen gemiye hiçbir rüzgâr yardım edemez.",
      author: "Seneca",
      authorTitle: "Filozof",
      category: "Net Hedefler",
      actionTip: "KPSS hedef puanını ve gitmek istediğin kurumu netleştir; rüzgârını arkana al.",
    ),
    MotivationalQuote(
      id: 28,
      quote: "Geçmişler geleceğe, suyun suya benzemesinden daha çok benzer. Sabırla inşa edilen her emek meyvesini verir.",
      author: "İbn-i Haldun",
      authorTitle: "Mukaddime Müellifi & Sosyolog",
      category: "Tarihsel Bilgelik & Sabır",
      actionTip: "Tarih sorularında olayların sebep-sonuç bağını kur; ezberlemek yerine mantığını kavra.",
    ),
    MotivationalQuote(
      id: 29,
      quote: "İlk önce kendine ne olmak istediğini söyle, sonra ne yapman gerekiyorsa onu yap.",
      author: "Epiktetos",
      authorTitle: "Stoacı Filozof",
      category: "Eyleme Geçiş",
      actionTip: "Kendini memuriyet makamında hayal et ve o koltuğu hak etmek için bugünkü görevini tamamla.",
    ),
    MotivationalQuote(
      id: 30,
      quote: "Büyük başarıların sahipleri, küçük işleri titizlikle yapan insanlardır.",
      author: "Ord. Prof. Dr. Ali Fuat Başgil",
      authorTitle: "Eğitimci",
      category: "Detayların Gücü",
      actionTip: "Küçük ayrıntıları atlama. Her soru kökündeki 'değildir/ulaşılamaz' ifadelerini dikkatle oku.",
    ),
    MotivationalQuote(
      id: 31,
      quote: "Taşı delen suyun gücü değil, damlaların sürekliliğidir.",
      author: "Latin Özdeyişi",
      authorTitle: "Kadim Bilgelik",
      category: "Süreklilik",
      actionTip: "Günde 500 soru çözüp 3 gün yatmaktansa, her gün düzenli 100 soru çözmek seni hedefine ulaştırır.",
    ),
    MotivationalQuote(
      id: 32,
      quote: "Hayatta en hakiki mürşit ilimdir, fendir.",
      author: "Mustafa Kemal Atatürk",
      authorTitle: "Büyük Önder",
      category: "İlim & Akıl",
      actionTip: "Çalışmalarını bilimsel tekniklerle sürdür; Pomodoro ve aralıklı tekrar sistemlerini uygula.",
    ),
  ];

  List<MotivationalQuote> get allQuotes => _quotes;

  /// Returns today's deterministic quote based on day of year.
  MotivationalQuote getTodayQuote({DateTime? date}) {
    final now = date ?? DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    final index = dayOfYear % _quotes.length;
    return _quotes[index];
  }

  /// Returns a random quote for refresh/browsing.
  MotivationalQuote getRandomQuote() {
    final rnd = Random();
    return _quotes[rnd.nextInt(_quotes.length)];
  }

  /// Checks if the daily quote should be presented (first launch of the day).
  Future<bool> shouldShowDailyQuote() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isEnabled = prefs.getBool(_enabledKey) ?? true;
    if (!isEnabled) return false;

    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final lastShown = prefs.getString(_lastDateKey);

    return lastShown != todayStr;
  }

  /// Records that the user has seen today's quote so it doesn't pop up again today.
  Future<void> markQuoteAsShownToday() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    await prefs.setString(_lastDateKey, todayStr);
  }

  /// Toggle whether daily motivation dialog shows on startup.
  Future<void> setDailyMotivationEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, enabled);
  }

  Future<bool> isDailyMotivationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_enabledKey) ?? true;
  }
}
