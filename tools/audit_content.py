"""Reproducible content checks; does not invent or silently remove questions."""
import collections
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / 'reports/content-repair'
OUT.mkdir(parents=True, exist_ok=True)
issues = []
seen = set()
totals = {}
source_files = set()
for course in ['tarih', 'turkce']:
    questions = json.loads((ROOT / f'assets/data/{course}_questions.json').read_text(encoding='utf8'))
    totals[course] = {'questions': len(questions), 'tests': len({q['testNum'] for q in questions})}
    for q in questions:
        kinds = []
        if q['id'] in seen:
            kinds.append('duplicate_id')
        seen.add(q['id'])
        if not q['question'].strip():
            kinds.append('empty_question')
        if len(q['options']) != 5 or not 0 <= q['correctIndex'] < len(q['options']):
            kinds.append('invalid_options_or_answer_index')
        if q['correctAnswer'] != 'ABCDE'[q['correctIndex']]:
            kinds.append('answer_fields_disagree')
        if any(not o.strip() for o in q['options']):
            kinds.append('empty_option')
        # Crops contain the real choices; their imperfect OCR text is not shown as choices.
        if not q.get('sourceQuestionImages'):
            if any(re.fullmatch(r'[A-E] seçeneği', o) for o in q['options']):
                kinds.append('visible_placeholder_option')
            if len(set(q['options'])) < 5:
                kinds.append('visible_duplicate_options')
        letters = re.findall(r'CEVAP\s*[:;]?\s*([A-E])\b', q['solution'], re.I)
        if letters and letters[-1].upper() != q['correctAnswer']:
            kinds.append('solution_answer_requires_review')
        for image in q.get('sourceQuestionImages', []) + q.get('sourceSolutionImages', []):
            source_files.add(image)
            if not (ROOT / image).is_file():
                kinds.append('missing_source_image')
        if kinds:
            issues.append({'course': course, 'id': q['id'], 'issues': kinds})

counts = dict(collections.Counter(k for issue in issues for k in issue['issues']))
data = {'totals': totals, 'issueCounts': counts, 'issues': issues}
(OUT / 'final_audit.json').write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf8')
summary = json.loads((OUT / 'summary.json').read_text(encoding='utf8')) if (OUT / 'summary.json').exists() else {}
source_mb = sum((ROOT / p).stat().st_size for p in source_files if (ROOT / p).is_file()) / 1_000_000
report = f'''# Soru ve çözüm düzeltme raporu

Tarih: 8 Eylül 2026. İncelenen veri: {sum(v['questions'] for v in totals.values()):,} soru.

## Uygulanan değişiklikler

- {summary.get('source_questions', 0):,} sorunun özgün soru ve seçenek düzeni kaynak görüntüsüyle geri getirildi. Alt çizgiler, numaralanmış sözcükler ve tablolar korunur; görüntü dokunularak büyütülebilir.
- {summary.get('source_solutions', 0):,} çözümün özgün görüntüsü bağlandı.
- {summary.get('option_sets_restored', 0):,} soru için beş seçenek metni kaynaktan yeniden ayrıştırıldı. Görüntü kullanılan sorularda asıl referans basılı seçeneklerdir; OCR metinlerinin tümü elle kontrol edilmiş değildir.
- {summary.get('answer_keys_corrected', 0):,} cevap indeksi kaynak eşleştirmesi ve görsel kontroller kapsamında değiştirildi.
- {summary.get('question_texts_cleaned', 0):,} soru metni ve {summary.get('solution_texts_cleaned', 0):,} çözüm metni güncellendi. Bu sayılar boşluk/Unicode temizliği, kaynak çözüm aktarımı ve tekil metin düzeltmelerini birlikte içerir.
- Tekrarlanan iki soru kimliği ayrıştırıldı; kaynakta Test 62’ye ait iki kayıt ilgili teste taşındı.
- Çözüm başlığında dar ekran taşması ve soru kökündeki alt çizgi etiketlerinin düz metin görünmesi düzeltildi. Tekrar çözmede elle açılmış çözümler sıfırlanır.

## Örnek doğrulanmış düzeltmeler

- `qb_tr_t29_q6`: Boş E seçeneği ve yanlış ayrışmış diğer seçenekler özgün Kavuklu/Pişekâr sorusundan geri getirildi.
- `qb_tr_t1_q3`: Eksilen VI numaralı sözcük, II–VI seçenek ilişkisi ve isimden fiil yapım eki açıklaması düzeltildi.
- `qb_tr_t15_q10`: Tasviri fiil sorusunun bozuk seçenekleri ve açıklaması yeniden yazıldı.
- `qb_tr_t39_q10`: Sonraki sorudan karışan seçenek/çözüm satırları çıkarıldı; şiir dize düzeni geri getirildi.

## Kalan doğrulama ihtiyacı

Bu çalışma bütün soruların dilbilgisel veya pedagojik açıdan tek tek onaylandığı anlamına gelmez. Kaynak kitaplar taranmış görüntülerdir; belirsiz eşleşmeler ve ortak paragraf gerektiren bazı sorular otomatik olarak tamamlanmadı. Yazım yanlışı buldurmayı amaçlayan sorulardaki kasıtlı yanlışlar topluca düzeltilmedi.

- Metin görünümünde yer tutucu seçenek bulunan soru: **{counts.get('visible_placeholder_option', 0)}**.
- Çözümdeki açık cevap harfi ile kayıtlı cevap arasında hâlâ inceleme gereken soru: **{counts.get('solution_answer_requires_review', 0)}**.
- Boş seçenek: **{counts.get('empty_option', 0)}**; tekrarlanan kimlik: **{counts.get('duplicate_id', 0)}**; görünür tekrarlanan seçenek: **{counts.get('visible_duplicate_options', 0)}**.

Bu kalan kayıtların yanıtları tahmin edilerek değiştirilmedi. `final_audit.json` somut yapısal sorunları; `review_required.json` daha geniş kaynak kontrol listesini içerir. İkinci listedeki her kayıt kesin hata demek değildir.

## İzlenebilirlik

Önceki veri dosyaları `*.before.json`, alan bazında önce/sonra değişiklikleri `changes.json` içinde korunur. Kaynak kitap/sayfa bilgisi onarılan kayıtların `sourceReference` alanındadır. Denetim `python tools/audit_content.py` ile tekrar çalıştırılabilir.

Kaynaklar: TÜRKÇE SORU BANKASI.pdf, TÜKÇE SORU2.pdf, SORU BANKASI TARİH.pdf ve TARİH SORU BANKASI 2.pdf dosyalarının yerel kopyaları. Uygulamada gösterilen kaynak görüntüleri yerel varlıklardır; harici bağlantı gerekmez.

Paket boyutu etkisi: Kullanılan kaynak görüntüleri yaklaşık **{source_mb:.1f} MB** tutar. Bu yaklaşım kaybolan basılı düzeni korur, ancak uygulama paketini büyütür; tam metin dönüşümü tamamlanırsa görüntü ihtiyacı azaltılabilir.
'''
(OUT / 'REPORT.md').write_text(report, encoding='utf8')
print(json.dumps({'totals': totals, 'issueCounts': counts}, ensure_ascii=False))
