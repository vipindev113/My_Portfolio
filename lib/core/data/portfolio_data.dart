class PortfolioData {
  // ── Personal ──────────────────────────────────────────────────────────────
  static const String name = 'Vipindev P';
  static const String title = 'Software Engineer';
  static const String tagline = 'Flutter Developer & Full-Stack Engineer';
  static const String email = 'vipindev113@gmail.com';
  static const String location = 'Karunagappally, Kollam, Kerala';
  static const String linkedIn =
      'https://www.linkedin.com/in/vipindev-p-aa990a195';
  static const String github = 'https://github.com/vipindev';

  // ── Summary ───────────────────────────────────────────────────────────────
  static const String summary =
      'Passionate and results-driven Full-Stack Software Developer with 1.9+ years of '
      'experience in cross-platform mobile application development using Flutter, NodeJS, '
      'and Python. Expert in building seamless, responsive, and user-centric applications '
      'across both frontend and backend environments. Adept at leveraging AI-assisted '
      'development tools for rapid software deployment and accelerated delivery. '
      'Experienced in API integration, backend workflow handling, server-side management, '
      'and scalable application architecture.';

  // ── Stats ─────────────────────────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'value': '1.9+', 'label': 'Years Experience'},
    {'value': '4+', 'label': 'Projects'},
    {'value': '3', 'label': 'Platforms'},
    {'value': '12+', 'label': 'Technologies'},
  ];

  // ── Experience ────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> experience = [
    {
      'role': 'Project Assistant I',
      'company': 'Amrita Center for Wireless Networks and Applications',
      'location': 'Kollam',
      'period': 'May 2024 – Present',
      'current': true,
      'responsibilities': [
        'Developing cross-platform applications using Flutter for Android, iOS, and Web.',
        'Crafting visually appealing, high-performance apps to enhance user experiences.',
        'Designing intuitive UI/UX workflows using Figma.',
        'Managing backend services, REST APIs, and third-party library integrations.',
        'Used async/await and isolates to handle background tasks without blocking UI.',
        'Integrated Google Sign-In, charts, OTP verification, Google Maps, Flutter Map, marker clustering, Firebase, AWS S3, Vector Search, and map directions.',
        'Conducting thorough testing to optimize performance and ensure application reliability.',
        'Using Git for source code management, branching strategies, code reviews, and team collaboration.',
      ],
    },
    {
      'role': 'Jr. Software Engineer',
      'company': 'Socius Innovative Global Brains',
      'location': 'Trivandrum',
      'period': 'November 2019 – November 2020',
      'current': false,
      'responsibilities': [
        'Designed and developed mobile applications using the Ionic framework.',
        'Managed backend services and API integrations.',
        'Built and maintained cross-platform applications for Android, iOS, and Web.',
        'Conducted testing and debugging to enhance application functionality.',
      ],
    },
  ];

  // ── Skills ────────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> skillCategories = [
    {
      'category': 'Mobile & Web',
      'icon': 'mobile',
      'skills': ['Flutter', 'Dart', 'Ionic', 'Flutter Web', 'Html & CSS'],
    },
    {
      'category': 'Backend',
      'icon': 'server',
      'skills': ['NodeJS', 'REST APIs', 'MySQL', 'Firebase', 'Python'],
    },
    {
      'category': 'State & Storage',
      'icon': 'database',
      'skills': ['Hive', 'Shared Preferences', 'Firebase Firestore', 'AWS S3'],
    },
    {
      'category': 'Integrations',
      'icon': 'plug',
      'skills': [
        'Google Maps',
        'Google Sign-In',
        'OTP Auth',
        'Dio/HTTP',
        'Vector Search',
      ],
    },
    {
      'category': 'Tools & Platforms',
      'icon': 'tools',
      'skills': ['VS Code', 'Android Studio', 'Figma', 'Postman', 'Git'],
    },
    {
      'category': 'AI Tools',
      'icon': 'ai',
      'skills': ['Claude AI', 'Cursor AI', 'Vibe Coding'],
    },
    {
      'category': 'Soft Skills',
      'icon': 'person',
      'skills': [
        'Problem-Solving',
        'Quick Learner',
        'Team Collaboration',
        'Workflow Planning',
      ],
    },
  ];

  // ── Projects ──────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'Cross-Platform Research App',
      'description':
          'A full-featured Flutter application deployed on Android, iOS, and Web for Amrita University\'s research center. Features real-time data, Google Maps integration with marker clustering, and Firebase backend.',
      'tech': ['Flutter', 'Firebase', 'Google Maps', 'Dart'],
      'type': 'Mobile & Web',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Location Tracking & Navigation',
      'description':
          'Advanced map-based application with Flutter Map, marker clustering, map directions, and vector search capabilities. Built for high-performance geospatial data visualization.',
      'tech': ['Flutter', 'Flutter Map', 'AWS S3', 'REST API'],
      'type': 'Mobile',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Auth & OTP Verification System',
      'description':
          'Secure authentication module with Google Sign-In, OTP verification, and Firebase Auth. Implements isolates for background token refresh without blocking the UI thread.',
      'tech': ['Flutter', 'Firebase Auth', 'Google Sign-In', 'Dart'],
      'type': 'Mobile',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Analytics Dashboard',
      'description':
          'Interactive data dashboard with charts, real-time updates, and responsive layouts. Built with Flutter Web for desktop and mobile browsers with adaptive UI.',
      'tech': ['Flutter Web', 'Charts', 'Firebase'],
      'type': 'Web',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Ionic Cross-Platform App',
      'description':
          'Mobile application developed with Ionic framework with integrated backend API management, cross-platform support for Android and iOS, and thorough testing coverage.',
      'tech': ['Ionic', 'REST API', 'TypeScript', 'MySQL'],
      'type': 'Mobile',
      'github': '',
      'demo': '',
    },
  ];

  // ── Education ─────────────────────────────────────────────────────────────
  static const List<Map<String, String>> education = [
    {
      'degree': 'Master of Science in Computer Science',
      'institution': 'University of Kerala',
      'year': '2022',
      'score': '68%',
    },
    {
      'degree': 'Bachelor of Computer Applications (BCA)',
      'institution': 'University of Kerala',
      'year': '2019',
      'score': '66%',
    },
  ];

  // ── Certifications & Achievements ─────────────────────────────────────────
  static const List<Map<String, String>> achievements = [
    {
      'title': 'Junior Software Developer Certification',
      'org': 'Skill India: DDU-GKY',
      'icon': 'certificate',
      'year': '2020',
    },
    {
      'title': 'Treasurer & Executive Member, COSSA',
      'org': 'Dept. of Computer Science, University of Kerala',
      'icon': 'award',
      'year': '2020–2021',
    },
  ];
}
