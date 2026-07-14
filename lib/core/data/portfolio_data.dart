class PortfolioData {
  // ── Personal ──────────────────────────────────────────────────────────────
  static const String name = 'Vipindev P';
  static const String title = 'Software Engineer';
  static const String tagline = 'Flutter Developer & Full-Stack Engineer';
  static const String email = 'vipindev113@gmail.com';
  static const String location = 'Karunagappally, Kollam, Kerala, India';
  static const String linkedIn =
      'https://www.linkedin.com/in/vipindev-p-aa990a195';
  static const String github = 'https://github.com/vipindev331?tab=repositories';

  // ── Summary ───────────────────────────────────────────────────────────────
  static const String summary =
      'Passionate and results-driven Full-Stack Software Developer with 2.4+ years of '
      'experience in cross-platform mobile application development using Flutter, NodeJS, '
      'and Python. Expert in building seamless, responsive, and user-centric applications '
      'across both frontend and backend environments. Adept at leveraging AI-assisted '
      'development tools for rapid software deployment and accelerated delivery. '
      'Experienced in API integration, backend workflow handling, server-side management, '
      'and scalable application architecture.';

  // ── Stats ─────────────────────────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'value': '2.4+', 'label': 'Experience'},
    {'value': '4+', 'label': 'Projects'},
    {'value': '4', 'label': 'Platforms'},
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
        'Integrated Google Sign-In, charts, OTP verification, Google Maps, Flutter Map, marker clustering, Firebase, AWS S3, Vector Search, map directions, etc.',
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
        'FlutterMap',
        'Google Sign-In',
        'OTP Auth',
        'Dio/HTTP',
        'Vector Search',
        'Charts',
        'Google Cloud Console'
      ],
    },
    {
      'category': 'Tools & Platforms',
      'icon': 'tools',
      'skills': ['VS Code', 'Android Studio','Xcode' 'Figma', 'Postman', 'Git', 'GitHub Desktop'],
    },
    {
      'category': 'AI Tools',
      'icon': 'ai',
      'skills': ['Claude AI', 'Google Gemini', 'Google Stitch', 'Claude Design'],
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
      'tech': ['Flutter', 'Firebase', 'Google Maps', 'Dart','AWS S3', 'NodeJS'],
      'type': 'Mobile & Web',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Location Tracking & Navigation',
      'description':
          'Advanced map-based application with Flutter Map, marker clustering, map directions, and vector search capabilities. Built for high-performance geospatial data visualization.',
      'tech': ['Flutter', 'Flutter Map', 'REST API'],
      'type': 'Mobile',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Auth & OTP Verification System',
      'description':
          'Secure authentication module with Google Sign-In, OTP verification, and Firebase Auth. Implements isolates for background token refresh without blocking the UI thread.',
      'tech': ['Flutter', 'OTP Auth', 'Google Sign-In', 'Dart'],
      'type': 'Mobile',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Analytics Dashboard',
      'description':
          'Interactive data dashboard with charts, real-time updates, and responsive layouts. Built with Flutter Web for desktop and mobile browsers with adaptive UI.',
      'tech': ['Flutter Web', 'Charts', 'Firebase', 'FlutterMap', 'Marker Clustering'],
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

  // ── Personal Projects ─────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> personalProjects = [
    {
      'name': 'AcadPlex',
      'subtitle': 'Multi-Tenant Academic Management Platform',
      'tech': [
        'Flutter',
        'Dart',
        'Django REST Framework',
        'Django Channels (WebSockets)',
        'PostgreSQL',
        'Firebase',
      ],
      'description':
          'Developed a multi-tenant SaaS academic management platform that helps students build a stronger academic journey and improve career opportunities through centralized management of academics, communication, attendance, examinations, fees, and performance tracking.',
      'points': [
        'Designed a multi-tenant system that identifies the user\'s institution at login and restricts access to that institution\'s data only.',
        'Built 12+ integrated modules, including student enrollment, bulk academic promotion, attendance management, exam scheduling, result publishing, offline fee management, announcements, and reporting dashboards.',
        'Engineered real-time synchronization using Django Channels (WebSockets), implemented role-based access control (RBAC) for five roles (Super Admin, Director, Staff, Parent, Student), and secured APIs with institution-scoped token authentication.',
        'Integrated Firebase Cloud Messaging (FCM) for push notifications, Google Sign-In, and live GPS tracking to enhance communication, onboarding, and location-aware features.',
        'Strengthened platform security with audit logging, reversible credential encryption, and institute lifecycle management, delivering a cross-platform Flutter application for Android, iOS, and Web.',
        'Leveraged AI-assisted development tools to accelerate system architecture planning, UI/UX design, and fast code development, improving development efficiency while maintaining production-quality code.',
      ],
      'screenshotLabel': 'AcadPlex App Screenshots',
      'screenshots':
          'https://drive.google.com/drive/folders/1WOI-KJLqXfkoz-bwW9dlY37OLQPIsZA_?usp=sharing',
    },
    {
      'name': 'NxtCust POS',
      'subtitle': 'Offline-First Retail Billing & POS System',
      'tech': ['Flutter', 'Dart', 'Node.js', 'Express.js', 'SQLite'],
      'description':
          'Built an offline-first, cross-platform Retail Billing & POS system using a single Flutter codebase for Android, iOS, Web, and Desktop, backed by a Node.js + Express.js + SQLite server.',
      'points': [
        'Designed an offline-first data architecture where sales and inventory transactions are saved locally first and automatically synchronized with the server when connectivity is restored, ensuring uninterrupted billing and data consistency.',
        'Designed a reliable sync engine that automatically uploads locally stored data when the device reconnects to the internet.',
        'Developed JWT-based authentication, role-based access control (SuperAdmin, Manager & Staff), barcode scanning (camera and hardware scanners), ESC/POS thermal receipt printing, and audit logging.',
        'Leveraged AI-assisted development tools to accelerate system architecture planning, UI/UX design, and fast code development, improving development efficiency while maintaining production-quality code.',
      ],
      'screenshotLabel': 'NxtCust POS App Screenshots',
      'screenshots':
          'https://drive.google.com/drive/folders/1uwYml_XZuYlr7_QxvyneNe6h-wkElznp?usp=sharing',
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
