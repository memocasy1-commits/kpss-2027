import 'package:flutter/material.dart';

/// Matematik Atölyesi Modül Tipi
enum MathLabSectionType {
  conceptDiscovery, // Kavram & Zihinsel Model Keşfi (Slider, butonlar, canlı hesap)
  parityMachine,    // Teklik - Çiftlik / Parite Çarkı
  signEliminator,   // Pozitif - Negatiflik / Çift Kuvvet İşaret Eleme
  baseAnalysis,     // Basamak Çözümleme Sihirbazı
  medianSequence,   // Ardışık Sayılar & Ortanca Terim Simülatörü
  trapHunter,       // Hata Avcısı / ÖSYM Çeldiricisi
  socraticChallenge,// Sokratik Adım Adım Soru Çözümü
}

/// İnteraktif Sokratik Soru Adımı
class SocraticStep {
  final int stepNumber;
  final String title;
  final String prompt;
  final String mathematicalHint;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final String goldenTactic;

  const SocraticStep({
    required this.stepNumber,
    required this.title,
    required this.prompt,
    required this.mathematicalHint,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
    required this.goldenTactic,
  });
}

/// Sokratik Problem Modeli
class SocraticProblem {
  final String id;
  final String title;
  final String examYear; // örn: "ÖSYM KPSS Çıkmış Benzeri"
  final String rawQuestion;
  final List<SocraticStep> steps;
  final String finalAnswerSummary;

  const SocraticProblem({
    required this.id,
    required this.title,
    required this.examYear,
    required this.rawQuestion,
    required this.steps,
    required this.finalAnswerSummary,
  });
}

/// Hata Avcısı Senaryosu
class TrapScenario {
  final String id;
  final String questionText;
  final List<String> studentSteps;
  final int wrongStepIndex; // 0-indexed hangi adım hatalı
  final String mistakeExplanation;
  final String correctSolution;
  final String trapRule;

  const TrapScenario({
    required this.id,
    required this.questionText,
    required this.studentSteps,
    required this.wrongStepIndex,
    required this.mistakeExplanation,
    required this.correctSolution,
    required this.trapRule,
  });
}

/// Matematik Atölyesi Konu Modeli
class MathLabTopic {
  final int topicNumber;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color themeColor;
  final String osymWeight; // örn: "3 - 4 Soru (Sınavın İlk Kısmı)"
  final List<String> keyOutcomes;
  final List<SocraticProblem> socraticProblems;
  final List<TrapScenario> trapScenarios;

  const MathLabTopic({
    required this.topicNumber,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.themeColor,
    required this.osymWeight,
    required this.keyOutcomes,
    required this.socraticProblems,
    required this.trapScenarios,
  });
}
