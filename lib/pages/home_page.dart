import 'package:flutter/material.dart';
import '../sections/about_section.dart';
import '../sections/achievements_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  // One GlobalKey per nav-linked section: About, Skills, Experience, Projects, Contact
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sticky nav bar at top
          NavBar(
            scrollController: _scrollController,
            sectionKeys: _sectionKeys,
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onViewWork: () => _scrollToSection(2), // Projects
                    onContact: () => _scrollToSection(4),  // Contact
                  ),
                  KeyedSubtree(
                    key: _sectionKeys[0],
                    child: const AboutSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys[1],
                    child: const SkillsSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys[2],
                    child: const ExperienceSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys[3],
                    child: const ProjectsSection(),
                  ),
                  const AchievementsSection(),
                  KeyedSubtree(
                    key: _sectionKeys[4],
                    child: const ContactSection(),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
