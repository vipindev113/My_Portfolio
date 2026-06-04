import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/animated_fade_slide.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 120,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: '03. Experience',
            title: 'Work History',
          ),
          _Timeline(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  final bool isMobile;
  const _Timeline({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final items = PortfolioData.experience;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            AnimatedFadeSlide(
              key: Key('exp-$i'),
              delay: Duration(milliseconds: 150 * i),
              child: _TimelineItem(
                data: items[i],
                isMobile: isMobile,
              ),
            ),
            // Connecting line stub drawn between items, not inside IntrinsicHeight.
            if (i < items.length - 1)
              SizedBox(
                width: 20,
                child: Center(
                  child: Container(
                    width: 2,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.accent, AppColors.divider],
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isMobile;

  const _TimelineItem({
    required this.data,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final isCurrent = data['current'] as bool;

    // No IntrinsicHeight — the Row is unconstrained vertically.
    // Expanded is used only for horizontal fill; the Row height is set by
    // the card's natural intrinsic height without any vertical pressure.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot only — connecting line between items lives in _Timeline.
        SizedBox(
          width: 20,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCurrent ? AppColors.accent : AppColors.surface,
                  border: Border.all(
                    color: isCurrent ? AppColors.accent : AppColors.textMuted,
                    width: 2,
                  ),
                  boxShadow: isCurrent
                      ? [
                          BoxShadow(
                            color: AppColors.accent.withValues(alpha: 0.4),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),

        // Card — Expanded fills remaining row width; no vertical constraint.
        Expanded(
          child: _ExperienceCard(data: data, isCurrent: isCurrent),
        ),
      ],
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isCurrent;
  const _ExperienceCard({required this.data, required this.isCurrent});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final responsibilities = widget.data['responsibilities'] as List<String>;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surfaceAlt : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.5)
                : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.08),
                    blurRadius: 24,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  widget.data['role'] as String,
                  style: AppTextStyles.cardTitle,
                ),
                if (widget.isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Text(
                      'Current',
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.success,
                        fontSize: 10,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '${widget.data['company']} · ${widget.data['location']}',
              style: AppTextStyles.cardSubtitle,
            ),
            const SizedBox(height: 4),
            Text(
              widget.data['period'] as String,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 20),
            // Responsibilities
            ...responsibilities.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(r, style: AppTextStyles.bodySmall)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
