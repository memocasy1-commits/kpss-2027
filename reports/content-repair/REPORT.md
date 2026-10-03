# Soru ve çözüm düzeltme raporu

Tarih: 8 Eylül 2026. İncelenen veri: 5,363 soru.

## Uygulanan değişiklikler

- 3,150 sorunun özgün soru ve seçenek düzeni kaynak görüntüsüyle geri getirildi. Alt çizgiler, numaralanmış sözcükler ve tablolar korunur; görüntü dokunularak büyütülebilir.
- 1,431 çözümün özgün görüntüsü bağlandı.
- 2,557 soru için beş seçenek metni kaynaktan yeniden ayrıştırıldı. Görüntü kullanılan sorularda asıl referans basılı seçeneklerdir; OCR metinlerinin tümü elle kontrol edilmiş değildir.
- 474 cevap indeksi kaynak eşleştirmesi ve görsel kontroller kapsamında değiştirildi.
- 95 soru metni ve 1,459 çözüm metni güncellendi. Bu sayılar boşluk/Unicode temizliği, kaynak çözüm aktarımı ve tekil metin düzeltmelerini birlikte içerir.
- Tekrarlanan iki soru kimliği ayrıştırıldı; kaynakta Test 62’ye ait iki kayıt ilgili teste taşındı.
- Çözüm başlığında dar ekran taşması ve soru kökündeki alt çizgi etiketlerinin düz metin görünmesi düzeltildi. Tekrar çözmede elle açılmış çözümler sıfırlanır.

## Örnek doğrulanmış düzeltmeler

- `qb_tr_t29_q6`: Boş E seçeneği ve yanlış ayrışmış diğer seçenekler özgün Kavuklu/Pişekâr sorusundan geri getirildi.
- `qb_tr_t1_q3`: Eksilen VI numaralı sözcük, II–VI seçenek ilişkisi ve isimden fiil yapım eki açıklaması düzeltildi.
- `qb_tr_t15_q10`: Tasviri fiil sorusunun bozuk seçenekleri ve açıklaması yeniden yazıldı.
- `qb_tr_t39_q10`: Sonraki sorudan karışan seçenek/çözüm satırları çıkarıldı; şiir dize düzeni geri getirildi.

## Kalan doğrulama ihtiyacı

Bu çalışma bütün soruların dilbilgisel veya pedagojik açıdan tek tek onaylandığı anlamına gelmez. Kaynak kitaplar taranmış görüntülerdir; belirsiz eşleşmeler ve ortak paragraf gerektiren bazı sorular otomatik olarak tamamlanmadı. Yazım yanlışı buldurmayı amaçlayan sorulardaki kasıtlı yanlışlar topluca düzeltilmedi.

- Metin görünümünde yer tutucu seçenek bulunan soru: **254**.
- Çözümdeki açık cevap harfi ile kayıtlı cevap arasında hâlâ inceleme gereken soru: **27**.
- Boş seçenek: **0**; tekrarlanan kimlik: **0**; görünür tekrarlanan seçenek: **0**.

Bu kalan kayıtların yanıtları tahmin edilerek değiştirilmedi. `final_audit.json` somut yapısal sorunları; `review_required.json` daha geniş kaynak kontrol listesini içerir. İkinci listedeki her kayıt kesin hata demek değildir.

## İzlenebilirlik

Önceki veri dosyaları `*.before.json`, alan bazında önce/sonra değişiklikleri `changes.json` içinde korunur. Kaynak kitap/sayfa bilgisi onarılan kayıtların `sourceReference` alanındadır. Denetim `python tools/audit_content.py` ile tekrar çalıştırılabilir.

Kaynaklar: TÜRKÇE SORU BANKASI.pdf, TÜKÇE SORU2.pdf, SORU BANKASI TARİH.pdf ve TARİH SORU BANKASI 2.pdf dosyalarının yerel kopyaları. Uygulamada gösterilen kaynak görüntüleri yerel varlıklardır; harici bağlantı gerekmez.

Paket boyutu etkisi: Kullanılan kaynak görüntüleri yaklaşık **179.8 MB** tutar. Bu yaklaşım kaybolan basılı düzeni korur, ancak uygulama paketini büyütür; tam metin dönüşümü tamamlanırsa görüntü ihtiyacı azaltılabilir.
