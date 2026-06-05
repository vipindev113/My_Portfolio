import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/animated_fade_slide.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 120,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(label: '02. Skills', title: 'Technical Skills'),
          _SkillsGrid(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  final bool isMobile;
  const _SkillsGrid({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Each card is half the available width on desktop, full width on mobile.
        final cardWidth = isMobile
            ? constraints.maxWidth
            : (constraints.maxWidth - 20) / 2;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(PortfolioData.skillCategories.length, (i) {
            final cat = PortfolioData.skillCategories[i];
            return AnimatedFadeSlide(
              key: Key('skill-$i'),
              delay: Duration(milliseconds: 100 * i),
              child: SizedBox(
                width: cardWidth,
                height: 260,
                child: _SkillCard(category: cat),
              ),
            );
          }),
        );
      },
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Map<String, dynamic> category;
  const _SkillCard({required this.category});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  IconData _iconFor(String key) {
    switch (key) {
      case 'mobile':
        return FontAwesomeIcons.mobileScreenButton;
      case 'server':
        return FontAwesomeIcons.server;
      case 'database':
        return FontAwesomeIcons.database;
      case 'plug':
        return FontAwesomeIcons.plug;
      case 'tools':
        return FontAwesomeIcons.screwdriverWrench;
      case 'ai':
        return FontAwesomeIcons.robot;
      case 'person':
        return FontAwesomeIcons.userGear;
      default:
        return FontAwesomeIcons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    final skills = widget.category['skills'] as List;
    final iconKey = widget.category['icon'] as String;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(24),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surfaceAlt : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(
                  _iconFor(iconKey),
                  size: 18,
                  color: AppColors.accent,
                ),
                const SizedBox(width: 12),
                Text(
                  widget.category['category'] as String,
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map((s) => _SkillChip(label: s as String))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accent.withValues(alpha: 0.18)
              : AppColors.accent.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _hovered
                ? AppColors.accent
                : AppColors.accent.withValues(alpha: 0.25),
          ),
        ),
        child: Text(
          widget.label,
          style: AppTextStyles.bodySmall.copyWith(
            color: _hovered ? AppColors.accent : AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
