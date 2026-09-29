class PortfolioData {
  // ── Personal ──────────────────────────────────────────────────────────────
  static const String name = 'Vipindev P';
  static const String title = 'Software Developer';
  static const String tagline =
      'Flutter · Node.js · Python · AI-Driven Development';
  static const String email = 'vipindev113@gmail.com';
  static const String location = 'Karunagappally, Kollam, Kerala, India';
  static const String linkedIn =
      'https://www.linkedin.com/in/vipindev-p-aa990a195';
  static const String github = 'https://github.com/vipindev331';

  // ── Summary ───────────────────────────────────────────────────────────────
  static const String summary =
      'Results-driven Software Developer with 4 years of software development '
      'experience, including 2+ years specializing in Flutter and Dart, building '
      'cross-platform mobile, web, and desktop applications with backends. '
      'Experienced in integrating AI services (Gemini AI, Sarvam AI) into '
      'production applications, and adept at using AI-assisted development tools '
      'such as Claude Code and Cursor to accelerate architecture planning, '
      'implementation, and debugging while delivering maintainable, '
      'production-quality software. A quick learner who adapts rapidly to new '
      'technologies and collaborates effectively in Agile teams.';

  // Short intro used on the hero section.
  static const String heroIntro =
      'Software Developer with 4 years of experience, including 2+ years '
      'specializing in Flutter. I build cross-platform mobile, web, and desktop '
      'applications, integrate AI services like Gemini and Sarvam AI, and use '
      'AI-assisted tools such as Claude Code to deliver clean, production-quality '
      'software — from concept to deployment.';

  // Roles cycled through the animated hero tagline.
  static const List<String> heroRoles = [
    'Software Developer',
    'Flutter Developer',
    'Full-Stack Engineer',
    'AI-Driven Developer',
  ];

  // ── Stats ─────────────────────────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'value': '4+', 'label': 'Experience'},
    {'value': '7+', 'label': 'Projects'},
    {'value': '4', 'label': 'Platforms'},
    {'value': '20+', 'label': 'Technologies'},
  ];

  // ── Experience ────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> experience = [
    {
      'role': 'Project Assistant',
      'company': 'Amrita Center for Wireless Networks and Applications',
      'location': 'Kollam',
      'period': 'May 2024 – Present',
      'current': true,
      'responsibilities': [
        'Developed and maintained cross-platform applications for 3 platforms (Android, iOS, and Web) from a single Flutter codebase, implementing efficient state management and responsive user interfaces.',
        'Published and released the application across all three platforms: Android, iOS, and Web.',
        'Engineered AI-powered voice features by integrating Sarvam AI and Gemini AI, delivering multilingual speech recognition, AI-driven translation, and intelligent form auto-filling for hands-free, voice-operated workflows.',
        'Built backend services and REST APIs, and integrated 6 third-party services: Google Sign-In, OTP authentication, Google Maps, marker clustering, Firebase, and AWS S3.',
        'Optimized application performance using asynchronous programming (async/await), Dart isolates for heavy background processing, and efficient state management.',
        'Designed intuitive, high-performance interfaces following Material Design principles, using Claude Design and Google Stitch for rapid UI prototyping.',
        'Collaborated with cross-functional team members in an Agile workflow, applying Git branching strategies and participating in code reviews.',
        'Leveraged AI-assisted development tools (Claude Code, Cursor AI, Gemini, Google Stitch, Claude Design) to accelerate software architecture, implementation, debugging, refactoring, and technical documentation.',
      ],
    },
    {
      'role': 'Junior Programmer',
      'company': 'Kannur University',
      'location': 'Kannur',
      'period': 'July 2023 – April 2024',
      'current': false,
      'responsibilities': [
        'Designed and developed web applications using core PHP and MySQL for university operations.',
        'Managed backend services and database administration, ensuring data integrity and system availability.',
        'Conducted testing and debugging to improve application functionality, stability, and reliability.',
      ],
    },
    {
      'role': 'Jr. Software Engineer',
      'company': 'Socius Innovative Global Brains',
      'location': 'Trivandrum',
      'period': 'November 2019 – November 2020',
      'current': false,
      'responsibilities': [
        'Designed and developed cross-platform mobile applications for Android and iOS using the Ionic framework.',
        'Managed backend services and REST API integrations.',
        'Conducted testing and debugging to enhance application functionality and stability.',
      ],
    },
  ];

  // ── Skills ────────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> skillCategories = [
    {
      'category': 'Languages',
      'icon': 'code',
      'skills': ['Dart', 'JavaScript', 'Python', 'SQL'],
    },
    {
      'category': 'Mobile & Frontend',
      'icon': 'mobile',
      'skills': [
        'Flutter',
        'Flutter Web',
        'Ionic',
        'Material Design',
        'Responsive UI',
        'HTML & CSS',
      ],
    },
    {
      'category': 'Backend',
      'icon': 'server',
      'skills': [
        'Node.js',
        'Express.js',
        'REST APIs',
        'Django REST Framework',
        'Django Channels',
      ],
    },
    {
      'category': 'Databases & Storage',
      'icon': 'database',
      'skills': [
        'PostgreSQL',
        'MySQL',
        'SQLite',
        'Firebase Firestore',
        'Hive',
        'AWS S3',
      ],
    },
    {
      'category': 'Cloud & API Integration',
      'icon': 'plug',
      'skills': [
        'Firebase',
        'FCM',
        'Google Maps Platform',
        'Marker Clustering',
        'GPS Tracking',
        'AWS S3',
        'Anthropic API',
        'Gemini AI',
        'Sarvam AI',
      ],
    },
    {
      'category': 'AI & Voice',
      'icon': 'voice',
      'skills': [
        'Speech Recognition',
        'Multilingual Translation',
        'Generative AI Integration',
        'Prompt Engineering',
      ],
    },
    {
      'category': 'Security & Authentication',
      'icon': 'lock',
      'skills': [
        'JWT Authentication',
        'RBAC',
        'OAuth (Google Sign-In)',
        'OTP Authentication',
        'Token-Based Auth',
        'Audit Logging',
        'Encryption',
      ],
    },
    {
      'category': 'Hardware Integration',
      'icon': 'barcode',
      'skills': ['Barcode Scanning (Camera & Hardware)', 'ESC/POS Thermal Printing'],
    },
    {
      'category': 'AI-Assisted Development',
      'icon': 'ai',
      'skills': [
        'Claude Code (CLI)',
        'Cursor AI',
        'Gemini AI',
        'Google Stitch',
        'Claude Design',
      ],
    },
    {
      'category': 'Version Control & CI/CD',
      'icon': 'branch',
      'skills': ['Git', 'GitHub Desktop', 'CI/CD'],
    },
    {
      'category': 'Testing & Dev Tools',
      'icon': 'tools',
      'skills': ['Postman', 'VS Code', 'Android Studio', 'Xcode', 'Figma'],
    },
    {
      'category': 'Professional Skills',
      'icon': 'person',
      'skills': [
        'Problem-Solving',
        'Analytical Thinking',
        'Adaptability',
        'Team Collaboration',
        'Communication',
        'Time Management',
        'Attention to Detail',
        'Creativity',
      ],
    },
  ];

  // ── Projects ──────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'Cross-Platform Research App',
      'description':
          'A full-featured Flutter application deployed on Android, iOS, Web, and Desktop for Amrita University\'s research center. Features real-time data, Google Maps integration with marker clustering, and a Firebase + AWS S3 backend.',
      'tech': ['Flutter', 'Firebase', 'Google Maps', 'Dart', 'AWS S3', 'NodeJS'],
      'type': 'Mobile & Web',
      'github': '',
      'demo': '',
    },
    {
      'title': 'AI Voice-Operated Workflows',
      'description':
          'Voice-based feature set powered by Sarvam AI and Gemini AI, delivering multilingual speech recognition, AI-driven translation, and intelligent form auto-filling so users can complete entire workflows hands-free.',
      'tech': ['Flutter', 'Sarvam AI', 'Gemini AI', 'Speech-to-Text'],
      'type': 'AI Integration',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Location Tracking & Navigation',
      'description':
          'Advanced map-based application with Flutter Map, marker clustering, map directions, and vector search capabilities. Built for high-performance geospatial data visualization.',
      'tech': ['Flutter', 'Flutter Map', 'Google Maps Platform', 'REST API'],
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
      'tech': [
        'Flutter Web',
        'Charts',
        'Firebase',
        'FlutterMap',
        'Marker Clustering'
      ],
      'type': 'Web',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Ionic Cross-Platform App',
      'description':
          'Mobile application developed with the Ionic framework with integrated backend API management, cross-platform support for Android and iOS, and thorough testing coverage.',
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
      'github': 'https://github.com/vipindev331/acadplex',
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
      'github': 'https://github.com/vipindev331/nxtcust-pos',
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
      'year': '2020 – 2022',
      'score': '68%',
    },
    {
      'degree': 'Bachelor of Computer Applications (BCA)',
      'institution': 'University of Kerala',
      'year': '2016 – 2019',
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
