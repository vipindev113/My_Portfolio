import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/portfolio_data.dart';
import 'responsive_layout.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static const double _nameThreshold = 250;
  bool _showName = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final show = widget.scrollController.offset > _nameThreshold;
    if (show != _showName) setState(() => _showName = show);
  }

  final List<String> _navItems = [
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Personal',
    'Contact',
  ];

  void _scrollToSection(int index) {
    final key = widget.sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
    Navigator.of(context).maybePop(); // close drawer if open
  }

  Future<void> _openLinkedIn() async {
    final uri = Uri.parse(PortfolioData.linkedIn);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  void _downloadResume() {
    (web.document.createElement('a') as web.HTMLAnchorElement)
      ..href = 'Vipindev_P_Resume.pdf'
      ..download = 'Vipindev_P_Resume.pdf'
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MobileNav(
        navItems: _navItems,
        onTap: _scrollToSection,
        onLinkedIn: _openLinkedIn,
        onResume: _downloadResume,
        showName: _showName,
      ),
      desktop: _DesktopNav(
        navItems: _navItems,
        onTap: _scrollToSection,
        onLinkedIn: _openLinkedIn,
        onResume: _downloadResume,
        showName: _showName,
      ),
    );
  }
}

// ── Desktop nav ──────────────────────────────────────────────────────────────

class _DesktopNav extends StatelessWidget {
  final List<String> navItems;
  final void Function(int) onTap;
  final VoidCallback onLinkedIn;
  final VoidCallback onResume;
  final bool showName;

  const _DesktopNav({
    required this.navItems,
    required this.onTap,
    required this.onLinkedIn,
    required this.onResume,
    required this.showName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        color: AppColors.navBackground,
        border: Border(
          bottom: BorderSide(color: AppColors.cardBorder, width: 1),
        ),
      ),
      child: Row(
        children: [
          _NameLabel(visible: showName),
          const Spacer(),
          // Nav links
          ...List.generate(navItems.length, (i) {
            return _NavLink(label: navItems[i], onTap: () => onTap(i));
          }),
          const SizedBox(width: 24),
          // LinkedIn icon button
          _IconBtn(
            icon: FontAwesomeIcons.linkedin,
            onTap: onLinkedIn,
            tooltip: 'LinkedIn',
          ),
          const SizedBox(width: 16),
          _ResumeButton(onTap: onResume),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.navItem.copyWith(
                  color: _hovered
                      ? AppColors.accent
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 3),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _hovered ? 24 : 0,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconBtn extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;
  const _IconBtn({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  @override
  State<_IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<_IconBtn> {
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
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: FaIcon(
              widget.icon,
              size: 18,
              color: _hovered ? AppColors.accent : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Mobile nav ───────────────────────────────────────────────────────────────

class _MobileNav extends StatelessWidget {
  final List<String> navItems;
  final void Function(int) onTap;
  final VoidCallback onLinkedIn;
  final VoidCallback onResume;
  final bool showName;

  const _MobileNav({
    required this.navItems,
    required this.onTap,
    required this.onLinkedIn,
    required this.onResume,
    required this.showName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.navBackground,
        border: Border(
          bottom: BorderSide(color: AppColors.cardBorder, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: _NameLabel(visible: showName, fontSize: 18)),
          _ResumeButton(onTap: onResume, compact: true),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
            onPressed: () => _showDrawer(context),
          ),
        ],
      ),
    );
  }

  void _showDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _DrawerContent(
        navItems: navItems,
        onTap: (i) {
          Navigator.pop(context);
          onTap(i);
        },
        onLinkedIn: onLinkedIn,
        onResume: onResume,
      ),
    );
  }
}

class _DrawerContent extends StatelessWidget {
  final List<String> navItems;
  final void Function(int) onTap;
  final VoidCallback onLinkedIn;
  final VoidCallback onResume;

  const _DrawerContent({
    required this.navItems,
    required this.onTap,
    required this.onLinkedIn,
    required this.onResume,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          ...List.generate(
            navItems.length,
            (i) => ListTile(
              onTap: () => onTap(i),
              title: Text(
                navItems[i],
                style: AppTextStyles.cardTitle.copyWith(fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.textMuted,
              ),
            ),
          ),
          const Divider(color: AppColors.divider),
          ListTile(
            onTap: onLinkedIn,
            leading: const FaIcon(
              FontAwesomeIcons.linkedin,
              color: AppColors.accent,
            ),
            title: Text('LinkedIn', style: AppTextStyles.body),
          ),
          ListTile(
            onTap: onResume,
            leading: const Icon(
              Icons.download_rounded,
              color: AppColors.accent,
            ),
            title: Text('Download Resume', style: AppTextStyles.body),
          ),
        ],
      ),
    );
  }
}

class _ResumeButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool compact;
  const _ResumeButton({required this.onTap, this.compact = false});

  @override
  State<_ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<_ResumeButton> {
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
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 12 : 18,
            vertical: widget.compact ? 8 : 10,
          ),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.accent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download_rounded,
                size: 16,
                color: _hovered ? Colors.white : AppColors.accent,
              ),
              const SizedBox(width: 6),
              Text(
                'Resume',
                style: AppTextStyles.navItem.copyWith(
                  color: _hovered ? Colors.white : AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameLabel extends StatelessWidget {
  final bool visible;
  final double fontSize;
  const _NameLabel({required this.visible, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, 0.4),
        duration: const Duration(milliseconds: 300),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/code.png',
              width: fontSize * 1.8,
              height: fontSize * 1.8,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  colors: [AppColors.textPrimary, AppColors.accent],
                ).createShader(rect),
                child: Text(
                  PortfolioData.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
