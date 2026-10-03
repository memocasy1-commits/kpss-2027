"""Assemble the independently authored questions; never synthesizes question text."""
import json
import random
import runpy
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TITLES = [
    'İslamiyet Öncesi Türk Tarihi', 'Türk-İslam Devletleri ve Türkiye Selçukluları',
    'Osmanlı Kuruluş ve Klasik Dönem', 'Osmanlı Devlet ve Toplum Düzeni',
    'Osmanlı’da Değişim ve Demokratikleşme', 'Osmanlı’nın Son Dönemi ve Dünya Savaşı',
    'Millî Mücadele’nin Hazırlık Dönemi', 'TBMM ve Millî Mücadele Cepheleri',
    'Millî Mücadele Diplomasisi ve Lozan', 'Cumhuriyet Dönemi İnkılapları',
    'Atatürk İlkeleri ve Dış Politika', 'Çağdaş Türk ve Dünya Tarihi',
]
questions = []
rng = random.Random(20260908)
# Balanced keys, with no repeated A-B-C-D-E answer cycle.
keys = list(range(5)) * 24
rng.shuffle(keys)

def q(test, stem, choices, reason, note, hard=False, skill='Bilgi ve yorum'):
    assert len(choices) == 5 and all(len(c) == 2 for c in choices)
    number = sum(x['testNum'] == test for x in questions) + 1
    answer = keys[len(questions)]
    correct, *distractors = choices
    rng.shuffle(distractors)
    ordered = distractors[:answer] + [correct] + distractors[answer:]
    explanations = {chr(65+i): c[1] for i, c in enumerate(ordered)}
    solution = f'Doğru cevap: {chr(65+answer)}\n\nÇözüm:\n{reason}\n\nSeçeneklerin değerlendirilmesi:\n'
    solution += '\n\n'.join(f'{letter}) {text}' for letter, text in explanations.items())
    solution += f'\n\nÖğrenme notu:\n{note}'
    questions.append(dict(id=f'hist_2026_v2_{test:02}_{number:02}', courseId='tarih',
        testNum=test, qNum=number, chapterId=f'history_{test:02}',
        subtopicId=f'history_{test:02}', subtopicTitle=TITLES[test-1],
        question=stem, options=[c[0] for c in ordered], correctIndex=answer,
        correctAnswer=chr(65+answer), solution=solution,
        difficulty='Zor' if hard else 'Orta-zor', skill=skill,
        explanation=reason, optionExplanations=explanations, learningNote=note,
        contentVersion='history-original-2026-09', provenance='Özgün çalışma sorusu'))

for path in sorted(Path(__file__).parent.glob('part_*.py')):
    runpy.run_path(str(path), init_globals={'q': q})

assert len(questions) == 120, len(questions)
assert Counter(x['testNum'] for x in questions) == {i: 10 for i in range(1,13)}
assert len({x['question'] for x in questions}) == 120
for item in questions:
    assert len(set(item['options'])) == 5, item['id']
    assert len(item['solution'].split()) >= 90, (item['id'], len(item['solution'].split()))
    assert not any(x in item['question'] for x in ['<img', '�'])

if __name__ == '__main__':
    (ROOT/'assets/data/tarih_questions.json').write_text(json.dumps(questions, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    (ROOT/'assets/data/turkce_questions.json').write_text('[]\n', encoding='utf-8')
    print(json.dumps({'questions': len(questions), 'tests': 12,
        'difficulty': dict(Counter(x['difficulty'] for x in questions)),
        'answers': dict(Counter(x['correctAnswer'] for x in questions)),
        'min_solution_words': min(len(x['solution'].split()) for x in questions)}, ensure_ascii=False))
