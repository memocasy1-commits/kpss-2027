import 'package:flutter/material.dart';
import 'math_lab_models.dart';

/// Konu 3: Rasyonel Sayılar ve Ondalık Açılımlar İnteraktif Veri Kümesi
class Konu3RasyonelSayilarData {
  static const MathLabTopic topic = MathLabTopic(
    topicNumber: 3,
    title: 'Rasyonel Sayılar ve Ondalık Açılımlar',
    subtitle: 'Kesir Çeşitleri, Merdivenli Kesirler, Virgül Kaydırma, Devirli Sayılar ve Sıralama Kuralları',
    icon: Icons.pie_chart_outline_rounded,
    themeColor: Color(0xFF10B981), // Emerald / Green Math
    osymWeight: '2 - 3 Soru (Sınavın 8. - 10. Soruları)',
    keyOutcomes: [
      'Basit kesir tanımında negatif aralığı (-Payda < Pay < Payda) unutmadan sınırları belirlemek',
      'Merdivenli kesirlerde ana kesir çizgisini tespit edip en içteki basamaktan dışarı doğru adım adım çözmek',
      'Ondalık bölmelerde basamakları sıfırla eşitleyip virgülleri tek hamlede kaldırmak',
      'Devirli sayıları (Tüm Sayı - Devretmeyen) / (9...0...) formülüyle hatasız rasyonelleştirmek',
      'Pay-payda farkı eşit kesirlerde basit kesirde büyük olanın, bileşik kesirde küçük olanın büyük olduğunu refleks yapmak',
    ],
    socraticProblems: [
      // PROBLEM 1: Basit Kesir ve Mutlak Değer Aralığı
      SocraticProblem(
        id: 'socratic_k3_p1',
        title: 'Basit Kesir Şartı ve Negatif Sınır Tuzağı',
        examYear: 'KPSS Lisans / Ön Lisans Soru Tipi',
        rawQuestion: '(2x - 5) / 7 ifadesi bir BASİT KESİR olduğuna göre, x tam sayısının alabileceği KAÇ FARKLI DEĞER vardır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Basit Kesir Eşitsizliğini Kurma',
            prompt: 'a/b kesrinin basit kesir olması için pay ve payda arasında mutlak değerce nasıl bir ilişki olmalıdır?',
            mathematicalHint: 'Basit kesirde payın mutlak değeri paydanın mutlak değerinden küçüktür: |Pay| < |Payda|.',
            options: [
              '2x - 5 < 7',
              '-7 < 2x - 5 < 7 (Yani |2x - 5| < 7)',
              '2x - 5 > 7',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! Basit kesirler -1 ile +1 arasındadır. Dolayısıyla -Payda < Pay < Payda yani -7 < 2x - 5 < 7 olmalıdır. Negatif tarafı unutmamak şarttır!',
            goldenTactic: '🎯 TUZAK: Sadece 2x - 5 < 7 derseniz negatif basit kesirleri (-1/7, -2/7 vb.) kaçırırsınız.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Eşitsizliği Çözme',
            prompt: '-7 < 2x - 5 < 7 eşitsizliğinde her tarafa 5 ekleyip 2\'ye bölersek x hangi aralıkta kalır?',
            mathematicalHint: '-7 + 5 < 2x < 7 + 5 ⇒ -2 < 2x < 12 ⇒ -1 < x < 6.',
            options: [
              '0 < x < 5',
              '-1 < x < 6',
              '-2 < x < 12',
            ],
            correctOptionIndex: 1,
            explanation: 'Mükemmel! Her tarafa 5 ekledik: -2 < 2x < 12. 2\'ye böldük: -1 < x < 6 aralığı bulundu.',
            goldenTactic: '🎯 Eşitsizlik çözümünde her tarafa aynı işlemi sırayla uygulayın.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Tam Sayı Değerlerini Sayma',
            prompt: '-1 < x < 6 açık aralığındaki tam sayılar hangileridir ve toplam kaç tanedir?',
            mathematicalHint: '-1 ve 6 dahil değildir. 0\'dan 5\'e kadar olan tam sayıları sayın.',
            options: [
              '{1, 2, 3, 4, 5} → 5 tane',
              '{0, 1, 2, 3, 4, 5} → 6 tane',
              '{-1, 0, 1, 2, 3, 4, 5, 6} → 8 tane',
            ],
            correctOptionIndex: 1,
            explanation: 'Tebrikler! x tam sayıları: 0, 1, 2, 3, 4, 5 olmak üzere tam 6 tanedir. 0 tam sayısını unutmadınız (x=0 için kesir -5/7 basit kesirdir).',
            goldenTactic: '🎯 0 tam sayıdır ve yerine koyduğunda -5/7 basit kesir verir; 0\'ı mutlaka sayın!',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 6 tane. x ∈ {0, 1, 2, 3, 4, 5}.',
      ),

      // PROBLEM 2: Değeri Verilen Kesir Problemi (k Metodu)
      SocraticProblem(
        id: 'socratic_k3_p2',
        title: 'Kesir Problemi: Orantı Sabiti (k) Yöntemi',
        examYear: 'KPSS Genel Yetenek / Lisans',
        rawQuestion: 'Değeri 3/5 olan bir kesrin payına 4 eklenip paydasından 2 çıkarıldığında kesrin değeri 2/3 olmaktadır.\nBuna göre, İLK KESRİN pay ve paydasının TOPLAMI kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Kesri Bilinmeyenle İfade Etme',
            prompt: 'Değeri 3/5 olan bir kesri cebirsel olarak nasıl temsil etmeliyiz?',
            mathematicalHint: 'Kesrin sadeleşmiş hali 3/5 olduğuna göre gerçek sayılar 3k ve 5k olmalıdır.',
            options: [
              'Doğrudan 3/5 olarak almalıyız.',
              'Payına 3k, paydasına 5k demeliyiz: (3k / 5k).',
              'x / y demeliyiz.',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! Kesrin orijinal değerini bilmediğimiz için payına 3k, paydasına 5k demeliyiz.',
            goldenTactic: '🎯 Değeri verilen kesirlerde daima ak / bk kurgusu yapılır.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Denklemi Kurma ve İçler-Dışlar',
            prompt: 'Payına 4 ekleyip (3k + 4), paydasından 2 çıkardık (5k - 2) ve 2/3\'e eşitledik: (3k + 4) / (5k - 2) = 2/3. Buradan k kaçtır?',
            mathematicalHint: '3 · (3k + 4) = 2 · (5k - 2) ⇒ 9k + 12 = 10k - 4.',
            options: [
              'k = 8',
              'k = 16',
              'k = 24',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika işlem! 3(3k + 4) = 2(5k - 2) ⇒ 9k + 12 = 10k - 4 ⇒ 10k - 9k = 12 + 4 ⇒ k = 16 bulunur.',
            goldenTactic: '🎯 İçler-dışlar çarpımında parantez dağıtmayı unutmayın.',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: İlk Kesrin Pay ve Payda Toplamı',
            prompt: 'k = 16 olduğuna göre ilk kesir 3k/5k idi. Pay ve payda toplamı (3k + 5k = 8k) kaçtır?',
            mathematicalHint: '8 · 16 işlemini yapın.',
            options: [
              '8 · 16 = 128',
              '48 + 80 = 120',
              '8 · 16 = 112',
            ],
            correctOptionIndex: 0,
            explanation: 'Bravo! Pay = 3·16 = 48, Payda = 5·16 = 80. Toplam = 48 + 80 = 128 bulunur.',
            goldenTactic: '🎯 3k + 5k = 8k olduğundan doğrudan 8 · 16 = 128 şeklinde tek adımda bulunabilir.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 128. İlk kesir 48/80 idi.',
      ),

      // PROBLEM 3: Merdivenli Kesir Tırmanıcısı
      SocraticProblem(
        id: 'socratic_k3_p3',
        title: 'Merdivenli Kesir: İçten Dışa Çözüm Basamakları',
        examYear: 'KPSS Lisans / ÖABT / EKPSS Standardı',
        rawQuestion: '1 + [ 1 / (1 - 1/3) ]\nişleminin sonucu kaçtır?',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: En Alttaki Çıkarmayı Çözme',
            prompt: 'Merdivenli kesirde nereden başlanmalıdır ve en alttaki (1 - 1/3) işleminin sonucu nedir?',
            mathematicalHint: '1 - 1/3 = (3 - 1) / 3.',
            options: [
              'En baştaki 1 ile toplamadan başlanır.',
              'En içteki/alttaki işlemden başlanır: 1 - 1/3 = 2/3.',
              '1 - 1/3 = 1/3.',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru! Merdivenli kesirlerde en alt basamak kutu içine alınır: 1 - 1/3 = 2/3.',
            goldenTactic: '🎯 ALTIN KURAL: Merdivenli kesirlerde en dipten başlanır!',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Ters Çevirip Çarpma Kuralı',
            prompt: '1 / (2/3) kesirli bölme işleminin sonucu nedir?',
            mathematicalHint: '1 bölü bir kesir, o kesrin tersine eşittir: 1 / (a/b) = b/a.',
            options: [
              '2/3',
              '3/2',
              '1/2',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! 1 / (2/3) = 1 · (3/2) = 3/2.',
            goldenTactic: '🎯 1 / (a/b) = b/a (Payda takla atar!).',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Dıştaki 1 ile Toplama',
            prompt: '1 + 3/2 işleminin sonucu kaçtır?',
            mathematicalHint: '(2 · 1 + 3) / 2.',
            options: [
              '4/2 = 2',
              '5/2',
              '3/2',
            ],
            correctOptionIndex: 1,
            explanation: 'Tebrikler! 1 + 3/2 = 5/2 bulunur.',
            goldenTactic: '🎯 Pratik tam sayılı toplama: Tam kısım ile paydayı çarp, paya ekle: 1 + 3/2 = 5/2.',
          ),
        ],
        finalAnswerSummary: 'Doğru Cevap: 5/2 (veya 2,5).',
      ),

      // PROBLEM 4: Farkı Eşit Basit Kesir Sıralaması
      SocraticProblem(
        id: 'socratic_k3_p4',
        title: 'Farkı Eşit Kesirlerde Hızlı Sıralama Taktiği',
        examYear: 'KPSS Genel Yetenek Klasik Soru',
        rawQuestion: 'a = 21/23\nb = 41/43\nc = 81/83\nkesirlerini KÜÇÜKTEN BÜYÜĞE doğru sıralayınız.',
        steps: [
          SocraticStep(
            stepNumber: 1,
            title: '1. Adım: Pay ve Payda Farklarını İnceleme',
            prompt: 'Bu üç kesrin pay ve paydaları arasındaki farklar nedir?',
            mathematicalHint: '23 - 21, 43 - 41, 83 - 81 farklarını hesaplayın.',
            options: [
              'Farklar sırasıyla 2, 4, 8\'dir.',
              'Tüm kesirlerde pay ile payda arasındaki fark 2\'dir ve EŞİTTİR.',
              'Farklar 1\'dir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Doğru tespit! 23-21=2, 43-41=2, 83-81=2. Tüm kesirlerde fark eşittir.',
            goldenTactic: '🎯 Payda eşitlemek devasa sayılar getirecekse ilk bakılacak şey FARKTIR.',
          ),
          SocraticStep(
            stepNumber: 2,
            title: '2. Adım: Kesir Tipini Belirleme',
            prompt: 'Bu kesirler basit kesir midir yoksa bileşik kesir midir?',
            mathematicalHint: 'Payı paydasından küçük olan kesirler basit kesirdir (21 < 23).',
            options: [
              'Bileşik kesirdir.',
              'Pozitif BASİT KESİRDİR (|pay| < |payda|).',
              'Tam sayılı kesirdir.',
            ],
            correctOptionIndex: 1,
            explanation: 'Harika! Kesirlerin tamamı pozitif basit kesirdir.',
            goldenTactic: '🎯 Basit kesir mi bileşik kesir mi olduğu kuralın yönünü belirler!',
          ),
          SocraticStep(
            stepNumber: 3,
            title: '3. Adım: Altın Sıralama Kuralını Uygulama',
            prompt: 'Farkları eşit pozitif BASİT kesirlerde sayılar büyüdükçe kesir 1 bütüne daha çok yaklaşır. Buna göre sıralama nedir?',
            mathematicalHint: 'Sayılar büyüdükçe kesir BÜYÜR: 21/23 < 41/43 < 81/83.',
            options: [
              'c < b < a',
              'a < b < c (Yani 21/23 < 41/43 < 81/83)',
              'b < a < c',
            ],
            correctOptionIndex: 1,
            explanation: 'Tebrikler! Basit kesirlerde terimler büyüdükçe 1 bütüne yaklaşır, yani kesir BÜYÜR! 21/23 < 41/43 < 81/83 ⇒ a < b < c!',
            goldenTactic: '🎯 BASİT KESİRDE: Büyük sayılı olan DAHA BÜYÜKTÜR (a < b < c).',
          ),
        ],
        finalAnswerSummary: 'Doğru Sıralama: a < b < c (21/23 < 41/43 < 81/83).',
      ),
    ],
    trapScenarios: [
      TrapScenario(
        id: 'trap_k3_1',
        questionText: '-2 tam 1/3 kesrinin bileşik kesir karşılığı kaçtır?',
        studentSteps: [
          '1. Adım: -2 tam 1/3 kesri tam sayılı kesirdir.',
          '2. Adım: Tam sayılı kesir açılır: -2 + 1/3.',
          '3. Adım: Paydalar eşitlenir: (-6 + 1) / 3 = -5/3 bulunur.',
        ],
        wrongStepIndex: 1, // 2. Adımda hata (-2 + 1/3 değil -(2 + 1/3) olmalı)
        mistakeExplanation: 'Öğrenci 2. adımda eksi işaretini sadece 2\'ye verdi! Oysa -2 tam 1/3 kesrindeki eksi işareti kesrin TAMAMINA aittir: -(2 + 1/3) = -(7/3) = -7/3 olmalıdır!',
        correctSolution: '-(2 + 1/3) = -(6/3 + 1/3) = -7/3.',
        trapRule: 'Negatif tam sayılı kesirlerde eksi işareti parantez dışındadır: -A b/c = -(A + b/c)!',
      ),
      TrapScenario(
        id: 'trap_k3_2',
        questionText: 'a = 100/99 ve b = 3/2 kesirlerini karşılaştırınız.',
        studentSteps: [
          '1. Adım: Her iki kesirde de pay ile payda arasındaki fark 1\'dir (100 - 99 = 1 ve 3 - 2 = 1).',
          '2. Adım: Farklar eşit olduğundan sayıları büyük olan kesir daha büyüktür: 100/99 > 3/2.',
        ],
        wrongStepIndex: 1, // 2. Adım hatalı (Bileşik kesirde tersi geçerli!)
        mistakeExplanation: '2. Adımda büyük bir yanılgı var! Bu kesirler BASİT DEĞİL, BİLEŞİK KESİRDİR (|pay| > |payda|). Bileşik kesirlerde sayılar büyüdükçe 1 bütüne yaklaşarak KÜÇÜLÜR: 3/2 = 1,5 iken 100/99 = 1,01\'dir! Dolayısıyla 3/2 > 100/99 olmalıdır!',
        correctSolution: 'Bileşik kesirlerde fark eşitken sayıları KÜÇÜK olan daha büyüktür: 3/2 (1,5) > 100/99 (1,01).',
        trapRule: 'Farkı eşit BİLEŞİK kesirlerde sayılar büyüdükçe kesir KÜÇÜLÜR (Basit kesrin tam tersi!).',
      ),
      TrapScenario(
        id: 'trap_k3_3',
        questionText: '1,23̅ (yalnızca 3 devirli) sayısını rasyonel kesre çeviriniz.',
        studentSteps: [
          '1. Adım: Formül: (Tüm Sayı - Devretmeyen) / Payda.',
          '2. Adım: Pay = 123 - 12 = 111.',
          '3. Adım: Virgülden önce 1 basamak, sonra 2 basamak var; 1 devreden, 2 devretmeyen var diyerek paydaya 900 yazılır: 111/900.',
        ],
        wrongStepIndex: 2, // 3. Adım hatalı (Paydaya sadece virgülden sonrası yazılır!)
        mistakeExplanation: '3. Adımda payda yanlış yazıldı! Formüldeki 9 ve 0 sayıları YALNIZCA VİRGÜLDEN SONRAKİ basamaklara bakılarak yazılır! Virgülden sonra 1 devreden (3) için bir tane 9, 1 devretmeyen (2) için bir tane 0 konur: Payda 90 olmalıdır. Kesir = 111/90\'dır!',
        correctSolution: 'Payda sadece virgülden sonrasına bakar: 1 devreden için 9, 1 devretmeyen için 0 ⇒ Payda = 90. Sonuç: 111/90 = 37/30.',
        trapRule: 'Devirli kesir formülünde paydaya yazılan 9 ve 0\'lar SADECE virgülden sonraki basamak sayısıyla belirlenir!',
      ),
    ],
  );
}
