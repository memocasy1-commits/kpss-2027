import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu1_temel_kavramlar_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu2_bolme_ebob_ekok_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu3_rasyonel_sayilar_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu4_esitsizlik_mutlak_deger_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu5_uslu_koklu_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu6_carpanlara_ayirma_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu7_oran_oranti_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu8_denklem_cozme_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu9_sayi_kesir_yas_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu10_yuzde_kar_karisim_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu11_hiz_isci_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu12_kumeler_fonksiyonlar_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu13_olasilik_permutasyon_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/konu14_sayisal_mantik_grafik_data.dart';
import 'package:kpss_soru_bankasi/data/math_lab/math_lab_models.dart';

void main() {
  void verifyTopic(MathLabTopic topic, int expectedNum) {
    expect(topic.topicNumber, equals(expectedNum));
    expect(topic.title, isNotEmpty);
    expect(topic.keyOutcomes.length, greaterThanOrEqualTo(4));
    expect(topic.socraticProblems.length, greaterThanOrEqualTo(4));

    for (final problem in topic.socraticProblems) {
      expect(problem.id, isNotEmpty);
      expect(problem.rawQuestion, isNotEmpty);
      expect(problem.steps, isNotEmpty);

      for (final step in problem.steps) {
        expect(step.stepNumber, greaterThan(0));
        expect(step.title, isNotEmpty);
        expect(step.prompt, isNotEmpty);
        expect(step.options, isNotEmpty);
        expect(step.correctOptionIndex, inInclusiveRange(0, step.options.length - 1));
        expect(step.explanation, isNotEmpty);
        expect(step.goldenTactic, isNotEmpty);
      }
    }

    expect(topic.trapScenarios.length, greaterThanOrEqualTo(3));
    for (final trap in topic.trapScenarios) {
      expect(trap.id, isNotEmpty);
      expect(trap.questionText, isNotEmpty);
      expect(trap.studentSteps, isNotEmpty);
      expect(trap.wrongStepIndex, inInclusiveRange(0, trap.studentSteps.length - 1));
      expect(trap.mistakeExplanation, isNotEmpty);
      expect(trap.correctSolution, isNotEmpty);
      expect(trap.trapRule, isNotEmpty);
    }
  }

  group('Math Lab Topic 1 Tests (Temel Kavramlar)', () {
    test('Topic 1 validation', () => verifyTopic(Konu1TemelKavramlarData.topic, 1));
  });

  group('Math Lab Topic 2 Tests (Bölme & EBOB-EKOK)', () {
    test('Topic 2 validation', () => verifyTopic(Konu2BolmeEbobEkokData.topic, 2));
  });

  group('Math Lab Topic 3 Tests (Rasyonel Sayılar)', () {
    test('Topic 3 validation', () => verifyTopic(Konu3RasyonelSayilarData.topic, 3));
  });

  group('Math Lab Topic 4 Tests (Eşitsizlik & Mutlak Değer)', () {
    test('Topic 4 validation', () => verifyTopic(Konu4EsitsizlikMutlakDegerData.topic, 4));
  });

  group('Math Lab Topic 5 Tests (Üslü & Köklü Sayılar)', () {
    test('Topic 5 validation', () => verifyTopic(Konu5UsluKokluData.topic, 5));
  });

  group('Math Lab Topic 6 Tests (Çarpanlara Ayırma)', () {
    test('Topic 6 validation', () => verifyTopic(Konu6CarpanlaraAyirmaData.topic, 6));
  });

  group('Math Lab Topic 7 Tests (Oran - Orantı)', () {
    test('Topic 7 validation', () => verifyTopic(Konu7OranOrantiData.topic, 7));
  });

  group('Math Lab Topic 8 Tests (Denklem Çözme)', () {
    test('Topic 8 validation', () => verifyTopic(Konu8DenklemCozmeData.topic, 8));
  });

  group('Math Lab Topic 9 Tests (Sayı, Kesir & Yaş Problemleri)', () {
    test('Topic 9 validation', () => verifyTopic(Konu9SayiKesirYasData.topic, 9));
  });

  group('Math Lab Topic 10 Tests (Yüzde, Kâr-Zarar & Karışım)', () {
    test('Topic 10 validation', () => verifyTopic(Konu10YuzdeKarKarisimData.topic, 10));
  });

  group('Math Lab Topic 11 Tests (Hız & İşçi Problemleri)', () {
    test('Topic 11 validation', () => verifyTopic(Konu11HizIsciData.topic, 11));
  });

  group('Math Lab Topic 12 Tests (Kümeler & Fonksiyonlar)', () {
    test('Topic 12 validation', () => verifyTopic(Konu12KumelerFonksiyonlarData.topic, 12));
  });

  group('Math Lab Topic 13 Tests (Permütasyon, Kombinasyon & Olasılık)', () {
    test('Topic 13 validation', () => verifyTopic(Konu13OlasilikPermutasyonData.topic, 13));
  });

  group('Math Lab Topic 14 Tests (Sayısal Mantık & Grafik Yorumlama)', () {
    test('Topic 14 validation', () => verifyTopic(Konu14SayisalMantikGrafikData.topic, 14));
  });
}
