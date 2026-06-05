import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/animated_fade_slide.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_title.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

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
            label: '05. Achievements',
            title: 'Certifications & Milestones',
          ),
          _EducationRow(isMobile: isMobile),
          const SizedBox(height: 48),
          const SectionTitle(label: '', title: 'Awards & Recognition'),
          _AchievementsRow(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _EducationRow extends StatelessWidget {
  final bool isMobile;
  const _EducationRow({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(PortfolioData.education.length, (i) {
        return AnimatedFadeSlide(
          key: Key('edu-$i'),
          delay: Duration(milliseconds: 100 * i),
          child: SizedBox(
            width: isMobile ? double.infinity : 380,
            height: 180,
            child: _EducationCard(data: PortfolioData.education[i]),
          ),
        );
      }),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final Map<String, String> data;
  const _EducationCard({required this.data});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(24),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surfaceAlt : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.cardBorder,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const FaIcon(
                FontAwesomeIcons.graduationCap,
                color: AppColors.accent,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data['degree']!,
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.data['institution']!,
                    style: AppTextStyles.cardSubtitle.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        widget.data['year']!,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.data['score']!,
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.success,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementsRow extends StatelessWidget {
  final bool isMobile;
  const _AchievementsRow({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(PortfolioData.achievements.length, (i) {
        return AnimatedFadeSlide(
          key: Key('ach-$i'),
          delay: Duration(milliseconds: 150 * i),
          child: SizedBox(
            width: isMobile ? double.infinity : 380,
            height: 180,
            child: _AchievementCard(data: PortfolioData.achievements[i]),
          ),
        );
      }),
    );
  }
}

class _AchievementCard extends StatefulWidget {
  final Map<String, String> data;
  const _AchievementCard({required this.data});

  @override
  State<_AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<_AchievementCard> {
  bool _hovered = false;

  IconData _iconFor(String key) {
    switch (key) {
      case 'certificate':
        return FontAwesomeIcons.certificate;
      case 'award':
        return FontAwesomeIcons.trophy;
      default:
        return FontAwesomeIcons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(24),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surfaceAlt : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accentSecondary : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentSecondary.withValues(alpha: 0.12),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accentSecondary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FaIcon(
                _iconFor(widget.data['icon']!),
                color: AppColors.accentSecondary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data['title']!,
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.data['org']!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.data['year']!,
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.accentSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
