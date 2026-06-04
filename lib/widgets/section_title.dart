import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import 'responsive_layout.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  final String title;

  const SectionTitle({super.key, required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.label)
            .animate()
            .fadeIn(duration: 500.ms),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 4,
              height: isMobile ? 32 : 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.accent, AppColors.accentSecondary],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                title,
                style: isMobile
                    ? AppTextStyles.sectionTitleMobile
                    : AppTextStyles.sectionTitle,
              ),
            ),
          ],
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 48),
      ],
    );
  }
}
