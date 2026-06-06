import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import '../widgets/particle_background.dart';
import '../widgets/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return ParticleBackground(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.6, -0.4),
            radius: 1.2,
            colors: [Color(0xFF0D1F3C), AppColors.background],
          ),
        ),
        child: isMobile
            ? _MobileHero(onViewWork: onViewWork, onContact: onContact)
            : _DesktopHero(onViewWork: onViewWork, onContact: onContact),
      ),
    );
  }
}

// ── Desktop layout ────────────────────────────────────────────────────────────

class _DesktopHero extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  const _DesktopHero({required this.onViewWork, required this.onContact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 120),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HeroContent(onViewWork: onViewWork, onContact: onContact),
              ],
            ),
          ),
          const SizedBox(width: 80),
          const _AvatarCard(),
        ],
      ),
    );
  }
}

// ── Mobile layout ─────────────────────────────────────────────────────────────

class _MobileHero extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  const _MobileHero({required this.onViewWork, required this.onContact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _AvatarCard(),
          const SizedBox(height: 40),
          _HeroContent(
            onViewWork: onViewWork,
            onContact: onContact,
            centered: true,
          ),
        ],
      ),
    );
  }
}

// ── Shared content ────────────────────────────────────────────────────────────

class _HeroContent extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  final bool centered;

  const _HeroContent({
    required this.onViewWork,
    required this.onContact,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final align = centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.left;

    return Column(
      crossAxisAlignment: align,
      children: [
        // Name
        Text(
          PortfolioData.name,
          textAlign: textAlign,
          style: isMobile
              ? AppTextStyles.heroNameMobile
              : AppTextStyles.heroName,
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 700.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 12),

        // Animated typewriter tagline
        SizedBox(
          height: 36,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: isMobile
                    ? AppTextStyles.heroTaglineMobile
                    : AppTextStyles.heroTagline,
                speed: const Duration(milliseconds: 80),
              ),
              TypewriterAnimatedText(
                'Full-Stack Engineer',
                textStyle: isMobile
                    ? AppTextStyles.heroTaglineMobile
                    : AppTextStyles.heroTagline,
                speed: const Duration(milliseconds: 80),
              ),
              TypewriterAnimatedText(
                'Mobile Application Engineer',
                textStyle: isMobile
                    ? AppTextStyles.heroTaglineMobile
                    : AppTextStyles.heroTagline,
                speed: const Duration(milliseconds: 80),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
        const SizedBox(height: 24),

        // Summary snippet
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
           'Full-Stack Developer specializing in Flutter, scalable backends, and AI-assisted development workflows. ' 
           'I turn complex problems into clean code and exceptional user experiences, delivering end-to-end solutions from concept to deployment.',
            textAlign: textAlign,
            style: AppTextStyles.body,
          ),
        ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
        const SizedBox(height: 40),

        // CTA buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _CTAButton(
              label: 'View My Work',
              filled: true,
              onTap: onViewWork,
            ),
            _CTAButton(
              label: 'Contact Me',
              filled: false,
              onTap: onContact,
            ),
          ],
        ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),
        const SizedBox(height: 48),

        // Social links
        Row(
          mainAxisAlignment:
              centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _SocialIcon(
              icon: FontAwesomeIcons.linkedin,
              url: PortfolioData.linkedIn,
            ),
            const SizedBox(width: 16),
            _SocialIcon(
              icon: FontAwesomeIcons.github,
              url: PortfolioData.github,
            ),
            const SizedBox(width: 16),
            _SocialIcon(
              icon: FontAwesomeIcons.envelope,
              url: 'mailto:${PortfolioData.email}',
            ),
          ],
        ).animate().fadeIn(delay: 1100.ms, duration: 600.ms),
      ],
    );
  }
}

class _CTAButton extends StatefulWidget {
  final String label;
  final bool filled;
  final VoidCallback onTap;
  const _CTAButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: widget.filled
                ? (_hovered
                      ? AppColors.accent.withValues(alpha: 0.85)
                      : AppColors.accent)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.accent,
              width: 1.5,
            ),
            boxShadow: widget.filled && _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.buttonText.copyWith(
              color: widget.filled
                  ? AppColors.background
                  : AppColors.accent,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launch,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.15)
                : AppColors.cardBorder.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? AppColors.accent : AppColors.cardBorder,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: 18,
            color: _hovered ? AppColors.accent : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ── Avatar card ───────────────────────────────────────────────────────────────

class _AvatarCard extends StatelessWidget {
  const _AvatarCard();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final size = isMobile ? 160.0 : 300.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.accentSecondary, AppColors.accent],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.25),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/avatar.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 500.ms, duration: 800.ms)
        .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
  }
}
