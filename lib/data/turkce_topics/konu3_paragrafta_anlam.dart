// coverage:ignore-file
import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';

final LectureTopic konu3ParagraftaAnlam = LectureTopic(
  id: 'turkce_paragrafta_anlam',
  courseId: 'turkce',
  order: 3,
  title: 'Paragrafta Anlam, Ana Düşünce ve Konu',
  subtitle: 'Konu, Başlık, Ana Düşünce, Yardımcı Düşünceler, Olumsuz Soru Kökleri, Yazarın Tutumu & Şiirde Tema',
  icon: Icons.chrome_reader_mode_rounded,
  color: const Color(0xFF0284C7),
  testRange: 'Test 21 - 30',
  startTestNum: 21,
  endTestNum: 30,
  estimatedMinutes: 60,
  sections: [
    LectureSection(
      title: '1. Paragrafın Anlam Haritası: Konu, Başlık ve Ana Düşünce',
      type: LectureSectionType.overview,
      leadText: 'Herhangi bir yazıda ele alınan düşünceyle ilgili bir araya gelmiş cümleler topluluğuna paragraf denir. Başka bir deyişle bir duygu, düşünce ya da olayın bir yönünü ele alarak anlatan yazılardır. Paragraflar herhangi bir yazının küçük ölçekli bir örneği şeklinde olurlar.',
      bulletPoints: [
        '1. Paragrafın Konusu: Yazarın paragrafta üzerinde durduğu olay, durum, kavram ya da problemdir. "Yazar bu parçada neden söz ediyor, neyi anlatıyor?" sorusunun karşılığıdır. Paragrafın tamamını kapsar; ne çok dar ne de çok geniş olmalıdır. Genellikle ilk iki cümlede ipucu verilir.',
        '2. Paragrafın Başlığı: Konuyu en özlü ve çarpıcı biçimde özetleyen bir veya birkaç sözcükten oluşan söz öbeğidir. Hem konuyu hem de ana düşünceyi yansıtmalı, metnin bütünüyle uyumlu olmalıdır.',
        '3. Paragrafın Ana Düşüncesi (Ana Fikir): Yazarın bu metni kaleme alışındaki asıl amaçtır. Okuyucuya aktarılmak istenen temel ileti, verilmek istenen hayat dersidir. "Yazar bu parçayı hangi amaçla yazdı, okuyucuya neyi benimsetmek istiyor?" sorusuna tam bir cümleyle verilen yanıttır.',
        'Ana Düşüncenin Paragraftaki Konumu:\n  • Sonuç Cümlesinde (Tümevarım Yöntemi): Yazar önce örnekler ve açıklamalar verir, son cümlede "kısacası, özetle, bundan dolayı, demek ki, o halde, asıl mesele" diyerek ana fikri özetler.\n  • Giriş Cümlesinde (Tümdengelim Yöntemi): Yazar önce ana fikri söyler, sonraki cümlelerde bunu kanıtlar ve açar.\n  • Paragrafın Tamamına Sindirilmiş: Olay yazılarında ve betimlemelerde ana fikir tek bir cümlede değil, metnin ana dokusuna yayılmış haldedir.'
      ],
      goldenRule: 'ANA FİKİR TESTİ: Ana düşünce bir cümle (yargı) bildirir; konu ise sadece bir kavram ya da söz öbeğidir. "Sanatın önemi" konudur; "Sanat, insan ruhunu arındırarak toplumsal duyarlılığı artıran en güçlü vasıtadır." ana düşüncedir.',
      osymTrap: 'ÖSYM TUZAĞI: Çeldirici seçeneklerde paragrafta geçen yan bir örnek ya da doğru bir detay ana fikir gibi sunulur. Bir cümlenin ana fikir olabilmesi için paragraftaki diğer TÜM cümlelerin o düşünceyi desteklemek için yazılmış olması şarttır.'
    ),
    LectureSection(
      title: '2. Yardımcı Düşünceler ve Olumsuz Soru Kökleri Taktikleri',
      type: LectureSectionType.ruleList,
      leadText: 'KPSS\'de en çok zaman kaybettiren olumsuz köklü ("değinilmemiştir", "çıkarılamaz", "ulaşılamaz", "söylenemez") paragraf sorularını 40 saniyede çözme tekniği:',
      bulletPoints: [
        '1. Adım (Önce Soru Kökü ve Seçenekler): Olumsuz soru kökünde ("değinilmemiştir, çıkarılamaz") önce metin DEĞİL, seçenekler taranır! Seçeneklerdeki anahtar kelimelerin (özellikle isimlerin ve kavramların) altı çizilir.',
        '2. Adım (Metni Seçenek Avcısı Olarak Okuma): Seçenekleri zihninizde tutarak metni okuyun. Metinde bir seçenekteki yargıyı gördüğünüz an o şıkkı eleyin.',
        '3. Adım (Bire Bir Sözcük Eşitliği Aramayın): ÖSYM doğrudan aynı sözcükleri kullanmaz; eş anlamlılarını veya sözcüğün anlam içeriğini kullanır: "Ekonomik sıkıntılar" yerine "maddi dar boğaz"; "tarihi yapılar" yerine "geçmişin mimari mirası" der.',
        '4. Adım (Aşırı Genelleme Yapan Şıklara Dikkat): Seçeneklerde geçen "her zaman, daima, sadece, hiçbir zaman, tek şartı, tümüyle" gibi aşırı sınırlayıcı sözcükler genellikle yanlış olan (yani aradığımız) seçenektir.'
      ],
      goldenRule: 'ŞIKLARI EŞLEŞTİRME YÖNTEMİ: Olumsuz köklü sorularda 4 doğru şıkkın karşılığı metnin satır aralarında bire bir bulunur. Her şıkkın geçtiği cümlenin yanına (A), (B), (C), (D) notunu düşerek metinle şıkkı eşleştirin; eşleşmeyen tek seçenek doğru cevaptır.',
      osymTrap: 'ÖSYM TUZAĞI: Metinde anlatılan bir yargının zıttı ya da metinde bahsedilmeyen "doğru bir genel kültür bilgisi" seçeneğe konur. Unutmayın: Bilgi doğru olsa bile metinde yer almıyorsa "ulaşılamaz" kabul edilir!'
    ),
    LectureSection(
      title: '3. Yazarın Tutumu, Bakış Açısı ve Şiirde Tema',
      type: LectureSectionType.comparison,
      leadText: 'Metnin arkasındaki yazar tavrı ve edebî duyarlılık unsurları:',
      bulletPoints: const [],
      goldenRule: 'ŞİİRDE ANA DUYGU: Şiir sorularında dizelerdeki tekil kelimelere değil, son dizede düğümlenen genel duygu durumuna (hasret, yalnızlık, isyan, hüzün, umut) odaklanın.',
      osymTrap: 'ÖSYM TUZAĞI: "Bu şiirin teması nedir?" sorusunda seçeneklerde hem "ayrılık" hem de "ayrılık acısı" varsa, şiirde duygu yoğunluğu bulunduğu için "ayrılık acısı" işaretlenmelidir.',
      comparisonRows: [
        ComparisonRow(
          correct: 'Yazarın Metindeki Tutumu',
          wrong: '• Eleştirel Tutum: Konunun veya kişinin eksik, hatalı ve aksayan yönlerini ortaya koyan yaklaşım.\\n• İronik (İğneleyici) Tutum: Alaycı, üstü kapalı ve tersini ima eden ifadelerle durumu yerme.\\n• Nesnel (Mesafeli) Tutum: Duygularını katmadan, sadece gerçekleri ve verileri aktaran bilimsel yaklaşım.\\n• Öğretici (Didaktik) Tutum: Okuyucuya bilgi verme, yol gösterme ve bilinçlendirme amacı güden yaklaşım.\\n• Samimi (İçten) Tutum: Okuyucuyla sohbet ediyormuş gibi sıcak ve yalın dil kullanımı.',
          note: 'Yazarın tutumu, kullanılan sıfatlardan ve cümle türlerinden kolayca deşifre edilir.'
        ),
        ComparisonRow(
          correct: 'Şiirde Tema ve Ana Duygu',
          wrong: '• Şiirde işlenen temel duygu, coşku ve psikolojik duruma "TEMA" ya da "ANA DUYGU" denir.\\n• Şiirde konu genellikle somut olaylar iken; tema daima soyuttur (yalnızlık, ölüm korkusu, yaşama sevinci, vatan sevgisi, ayrılık acısı, hasret, tabiat hayranlığı).\\n• Şiirin bütününe hakim olan hüzün, sevinç, özlem gibi duygular ana duyguyu belirler.',
          note: 'Düz yazıda "ana fikir", şiirde ise "ana duygu / tema" aranır.'
        )
      ]
    ),
    LectureSection(
      title: 'İnteraktif Sınav Simülasyonu: Paragrafta Ana Düşünce',
      type: LectureSectionType.interactiveQuiz,
      leadText: 'Ünite değerlendirme testlerinden çözümlü pekiştirme sorusu:',
      bulletPoints: const [],
      quizzes: [
        LectureInteractiveQuiz(
          prompt: 'Sanatçı, çağına tanıklık eden bir ayna değildir sadece; o aynayı geleceğe tutan, toplumun göremediği kırılma noktalarını aydınlatan bir deniz feneridir. Günübirlik modaların peşine takılanlar yarınlara kalamaz. Kalıcı olmak, insanın evrensel acılarını ve sevinçlerini kendi çağının diliyle ama zamansız bir derinlikle işleyebilmekten geçer.\\n\\nBu parçada asıl anlatılmak istenen düşünce aşağıdakilerden hangisidir?',
          options: [
            'A) Sanatçıların eserlerinde toplumun sorunlarına yer vermesi gerektiği',
            'B) Gerçek sanatçının sadece yaşadığı dönemi değil, geleceği de aydınlatan ve evrensel temaları işleyerek kalıcılığı yakalayan kişi olduğu',
            'C) Popüler kültürün etkisinde kalan sanat eserlerinin daha çok okunduğu',
            'D) Sanatın temel amacının bireysel duyguları estetik biçimde yansıtmak olduğu',
            'E) Edebi yapıtlarda kullanılan dilin sadeliğinin başarıyı belirlediği'
          ],
          correctIndex: 1,
          explanation: 'Parçanın bütününde yazar sanatçıyı "aynayı geleceğe tutan deniz feneri" olarak tanımlamış ve son cümlede kalıcılığın "evrensel acıları ve sevinçleri zamansız bir derinlikle işlemekten geçtiğini" vurgulamıştır. Dolayısıyla asıl anlatılmak istenen (ana düşünce) B seçeneğidir.',
          ruleTag: 'Ana Fikir Sentezi'
        )
      ]
    )
  ],
);

final LectureTopic turkceKonu3 = konu3ParagraftaAnlam;
