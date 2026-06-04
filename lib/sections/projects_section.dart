import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/animated_fade_slide.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          const SectionTitle(label: '04. Projects', title: 'Featured Work'),
          _ProjectsGrid(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  final bool isMobile;
  const _ProjectsGrid({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveLayout.isTablet(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = isMobile ? 1 : (isTablet ? 2 : 3);
        final cardWidth =
            (constraints.maxWidth - (20 * (columns - 1))) / columns;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(PortfolioData.projects.length, (i) {
            return AnimatedFadeSlide(
              key: Key('proj-$i'),
              delay: Duration(milliseconds: 100 * i),
              child: SizedBox(
                width: cardWidth,
                child: _ProjectCard(project: PortfolioData.projects[i]),
              ),
            );
          }),
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final tech = widget.project['tech'] as List;
    final github = widget.project['github'] as String;
    final demo = widget.project['demo'] as String;
    final type = widget.project['type'] as String;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surfaceAlt : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.12),
                    blurRadius: 30,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: folder icon + links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Row(
                  children: [
                    if (github.isNotEmpty)
                      _LinkIcon(
                        icon: FontAwesomeIcons.github,
                        onTap: () => _launch(github),
                      ),
                    if (demo.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      _LinkIcon(
                        icon: FontAwesomeIcons.arrowUpRightFromSquare,
                        onTap: () => _launch(demo),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Type badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.accentSecondary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                type,
                style: AppTextStyles.label.copyWith(
                  color: AppColors.accentSecondary,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Title
            Text(
              widget.project['title'] as String,
              style: AppTextStyles.cardTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              widget.project['description'] as String,
              style: AppTextStyles.bodySmall,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),

            // Tech stack chips
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: tech
                  .map(
                    (t) => Text(
                      t as String,
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.accent,
                        fontSize: 11,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _LinkIcon({required this.icon, required this.onTap});

  @override
  State<_LinkIcon> createState() => _LinkIconState();
}

class _LinkIconState extends State<_LinkIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: FaIcon(
          widget.icon,
          size: 16,
          color: _hovered ? AppColors.accent : AppColors.textMuted,
        ),
      ),
    );
  }
}
