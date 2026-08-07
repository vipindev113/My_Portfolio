import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/animated_fade_slide.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_title.dart';

class PersonalProjectsSection extends StatelessWidget {
  const PersonalProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final projects = PortfolioData.personalProjects;

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
            label: '05. Personal Projects',
            title: 'Things I\'ve Built',
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < projects.length; i++) ...[
                  AnimatedFadeSlide(
                    key: Key('personal-proj-$i'),
                    delay: Duration(milliseconds: 150 * i),
                    child: _PersonalProjectCard(
                      data: projects[i],
                      isMobile: isMobile,
                    ),
                  ),
                  if (i < projects.length - 1) const SizedBox(height: 32),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalProjectCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isMobile;
  const _PersonalProjectCard({required this.data, required this.isMobile});

  @override
  State<_PersonalProjectCard> createState() => _PersonalProjectCardState();
}

class _PersonalProjectCardState extends State<_PersonalProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final tech = widget.data['tech'] as List;
    final points = widget.data['points'] as List;
    final screenshots = widget.data['screenshots'] as String;
    final screenshotLabel = widget.data['screenshotLabel'] as String;
    final github = widget.data['github'] as String? ?? '';

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(widget.isMobile ? 22 : 32),
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
            // Header: icon + name + subtitle
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.folderOpen,
                    color: AppColors.accent,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data['name'] as String,
                        style: AppTextStyles.cardTitle.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.data['subtitle'] as String,
                        style: AppTextStyles.cardSubtitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tech stack chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tech
                  .map(
                    (t) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: AppColors.accent.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        t as String,
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.accent,
                          fontSize: 11,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),

            // Intro description
            Text(
              widget.data['description'] as String,
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 18),

            // Highlight bullets
            ...points.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(p as String, style: AppTextStyles.bodySmall),
                    ),
                  ],
                ),
              ),
            ),

            // Repository link
            if (github.isNotEmpty) ...[
              const SizedBox(height: 8),
              _CardLink(
                icon: FontAwesomeIcons.github,
                label: github.replaceFirst('https://', ''),
                onTap: () => _launch(github),
              ),
            ],

            // Screenshots link
            if (screenshotLabel.isNotEmpty) ...[
              const SizedBox(height: 10),
              _CardLink(
                icon: FontAwesomeIcons.images,
                label: 'Screenshots: $screenshotLabel',
                onTap: screenshots.isEmpty ? null : () => _launch(screenshots),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CardLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _CardLink({required this.icon, required this.label, this.onTap});

  @override
  State<_CardLink> createState() => _CardLinkState();
}

class _CardLinkState extends State<_CardLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    final color = enabled
        ? (_hovered ? AppColors.accent : AppColors.accentSecondary)
        : AppColors.textMuted;

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(widget.icon, size: 14, color: color),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.label,
                style: AppTextStyles.bodySmall.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
