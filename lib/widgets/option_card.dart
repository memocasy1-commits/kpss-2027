import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'math_rich_text.dart';

enum OptionState { defaultState, correct, wrong, revealedCorrect }

class OptionCard extends StatelessWidget {
  final String label; // A, B, C, D, E
  final String text;
  final OptionState state;
  final VoidCallback? onTap;

  const OptionCard({
    super.key,
    required this.label,
    required this.text,
    required this.state,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDarkMode;
    Color borderColor = AppColors.cardBorder;
    Color bgColor = AppColors.card;
    Color labelBg = AppColors.surfaceLight;
    Color labelTextColor = AppColors.textPrimary;
    Color optionTextColor = AppColors.textPrimary;
    Widget? trailingIcon;

    switch (state) {
      case OptionState.correct:
        borderColor = AppColors.success;
        bgColor = isDark ? AppColors.successBg : const Color(0xFFECFDF5);
        labelBg = AppColors.success;
        labelTextColor = Colors.white;
        optionTextColor = isDark ? const Color(0xFF6EE7B7) : const Color(0xFF065F46);
        trailingIcon = const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 22);
        break;
      case OptionState.wrong:
        borderColor = AppColors.error;
        bgColor = isDark ? AppColors.errorBg : const Color(0xFFFEF2F2);
        labelBg = AppColors.error;
        labelTextColor = Colors.white;
        optionTextColor = isDark ? const Color(0xFFFCA5A5) : const Color(0xFF991B1B);
        trailingIcon = const Icon(Icons.cancel_rounded, color: AppColors.error, size: 22);
        break;
      case OptionState.revealedCorrect:
        borderColor = AppColors.success.withValues(alpha: 0.6);
        bgColor = isDark ? AppColors.successBg.withValues(alpha: 0.5) : const Color(0xFFF0FDF4);
        labelBg = AppColors.success.withValues(alpha: 0.8);
        labelTextColor = Colors.white;
        optionTextColor = isDark ? const Color(0xFF6EE7B7) : const Color(0xFF065F46);
        trailingIcon = const Icon(Icons.check_circle_outline_rounded, color: AppColors.success, size: 22);
        break;
      case OptionState.defaultState:
        optionTextColor = AppColors.textPrimary;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: state == OptionState.defaultState ? 1.0 : 1.8),
              boxShadow: state == OptionState.correct
                  ? [BoxShadow(color: AppColors.success.withValues(alpha: 0.2), blurRadius: 10, spreadRadius: 1)]
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Option letter badge (A, B, C, D, E)
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: labelBg,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: labelTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Option text with mathematical fraction support
                Expanded(
                  child: MathRichText(
                    text: text.replaceFirst(RegExp(r'^\s*\(?[A-Ea-e][\)\.\-\:]\s*'), ''),
                    style: TextStyle(
                      color: optionTextColor,
                      fontSize: 15.5,
                      height: 1.35,
                      fontWeight: state != OptionState.defaultState ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 8),
                  trailingIcon,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
