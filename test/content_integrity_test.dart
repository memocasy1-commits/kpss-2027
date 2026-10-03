import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kpss_soru_bankasi/models/question_model.dart';
import 'package:kpss_soru_bankasi/widgets/solution_card.dart';
import 'package:kpss_soru_bankasi/widgets/formatted_question_view.dart';

List<Map<String, dynamic>> loadQuestions(String course) {
  final file = File('assets/data/${course}_questions.json');
  if (!file.existsSync()) return [];
  return (jsonDecode(file.readAsStringSync()) as List).cast<Map<String, dynamic>>();
}

void main() {
  test('Question IDs remain unique across courses and every answer is in range', () {
    final ids = <String>{};
    for (final course in ['tarih', 'turkce', 'cografya', 'vatandaslik']) {
      for (final raw in loadQuestions(course)) {
        final q = Question.fromJson(raw, defaultCourseId: course);
        expect(ids.add(q.id), isTrue, reason: 'Duplicate ID: ${q.id}');
        expect(q.options.length, 5, reason: q.id);
        expect(q.correctIndex, inInclusiveRange(0, 4), reason: q.id);
        expect(q.correctAnswer, 'ABCDE'[q.correctIndex], reason: q.id);
        for (final path in [...q.sourceQuestionImages, ...q.sourceSolutionImages]) {
          expect(File(path).existsSync(), isTrue, reason: '${q.id}: $path');
        }
      }
    }
  });

  testWidgets('Long topic titles do not overflow the solution on small screens', (tester) async {
    tester.view.physicalSize = const Size(320, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(
      child: SolutionCard(correctAnswer: 'E',
        subtopicTitle: 'Osmanlı Kültür ve Medeniyeti, Divan-ı Hümayun ve Teşkilat Yapısı',
        solutionText: 'Bu açıklama, doğru cevabın gerekçesini içerir.'),
    ))));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Underlined words are formatted even inside a question prompt', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body:
      FormattedQuestionView(question: 'Aşağıdaki <u>bilgilerden</u> hangisi doğrudur?'))));
    final texts = tester.widgetList<Text>(find.byType(Text));
    expect(texts.any((t) => (t.data ?? t.textSpan?.toPlainText() ?? '').contains('<u>')), isFalse);
    expect(texts.any((t) => (t.data ?? t.textSpan?.toPlainText() ?? '').contains('bilgilerden')), isTrue);
    expect(tester.takeException(), isNull);
  });
}
