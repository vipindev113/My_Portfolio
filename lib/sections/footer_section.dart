import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [
          const Divider(color: AppColors.divider),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FooterIcon(
                icon: FontAwesomeIcons.linkedin,
                tooltip: 'LinkedIn',
                onTap: () => _launch(PortfolioData.linkedIn),
              ),
              const SizedBox(width: 20),
              _FooterIcon(
                icon: FontAwesomeIcons.github,
                tooltip: 'GitHub',
                onTap: () => _launch(PortfolioData.github),
              ),
              const SizedBox(width: 20),
              _FooterIcon(
                icon: FontAwesomeIcons.envelope,
                tooltip: 'Email',
                onTap: () => _launch('mailto:${PortfolioData.email}'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Designed & Built by ${PortfolioData.name}',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '© ${DateTime.now().year} · Built with Flutter Web',
            style: AppTextStyles.label.copyWith(color: AppColors.textMuted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FooterIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _FooterIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_FooterIcon> createState() => _FooterIconState();
}

class _FooterIconState extends State<_FooterIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: FaIcon(
              widget.icon,
              size: 18,
              color: _hovered ? AppColors.accent : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
