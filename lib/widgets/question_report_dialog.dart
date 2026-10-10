import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/haptic_service.dart';
import '../services/question_report_service.dart';
import '../theme/app_theme.dart';

class QuestionReportDialog extends StatefulWidget {
  final Question question;

  const QuestionReportDialog({
    super.key,
    required this.question,
  });

  static Future<void> show(BuildContext context, {required Question question}) {
    return showDialog<void>(
      context: context,
      builder: (ctx) => QuestionReportDialog(question: question),
    );
  }

  @override
  State<QuestionReportDialog> createState() => _QuestionReportDialogState();
}

class _QuestionReportDialogState extends State<QuestionReportDialog> {
  static const List<String> _reportReasons = [
    'Doğru cevap anahtarı veya şıklar hatalı',
    'Soru kökünde veya metninde bilgi yanlışı var',
    'Yazım, imla veya harf hatası mevcut',
    'Çözüm ve açıklama yetersiz / hatalı',
    'Diğer / Belirtmek istediğim bir husus var',
  ];

  String _selectedReason = _reportReasons[0];
  final TextEditingController _noteController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    setState(() => _isSubmitting = true);
    HapticService.instance.selection();

    await QuestionReportService.instance.submitReport(
      questionId: widget.question.id,
      courseId: widget.question.courseId,
      questionText: widget.question.question,
      correctAnswer: widget.question.correctAnswer,
      options: widget.question.options,
      reason: _selectedReason,
      userNote: _noteController.text,
    );

    if (!mounted) return;
    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Soru inceleme bildirimi kaydedildi. Katkınız için teşekkürler!',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardBg = AppColors.surface;
    final textPrimary = AppColors.textPrimary;
    final textSecondary = AppColors.textSecondary;
    final cardBorder = AppColors.cardBorder;

    return AlertDialog(
      backgroundColor: cardBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actionsPadding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEF4444).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.flag_rounded, color: Color(0xFFEF4444), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Soru Hata Bildirimi',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w800,
                    color: textPrimary,
                  ),
                ),
                Text(
                  '${widget.question.courseId.toUpperCase()} • Test ${widget.question.testNum} • Soru ${widget.question.qNum}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Karşılaştığınız sorunu veya hata türünü seçiniz:',
              style: TextStyle(fontSize: 12.5, color: textSecondary, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            ..._reportReasons.map((reason) {
              final isSelected = reason == _selectedReason;
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    HapticService.instance.selection();
                    setState(() => _selectedReason = reason);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : cardBorder,
                        width: isSelected ? 1.4 : 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                          size: 18,
                          color: isSelected ? AppColors.primary : textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            reason,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              color: isSelected ? textPrimary : textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
            TextField(
              controller: _noteController,
              maxLines: 3,
              style: TextStyle(fontSize: 13, color: textPrimary),
              decoration: InputDecoration(
                hintText: 'Açıklamanız veya öneriniz (İsteğe bağlı)...',
                hintStyle: TextStyle(fontSize: 12, color: textSecondary.withValues(alpha: 0.7)),
                filled: true,
                fillColor: AppColors.surfaceLight,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: cardBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: cardBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.pop(context),
          child: Text('İptal', style: TextStyle(color: textSecondary)),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _handleSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEF4444),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          child: _isSubmitting
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text('Bildir', style: TextStyle(fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
