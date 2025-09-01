import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectShowcase extends StatefulWidget {
  const ProjectShowcase({super.key});

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Smart Gas Weight Measurement System',
      'description':
          'IoT-based system for monitoring and measuring the weight of gas cylinders in real-time. Provides alerts and analytics for efficient usage and timely refills. Firmware code was corrected at the end, and a bug in the embedded device was found and fixed within 4 days during delivery time.',
      'technologies': ['Flutter', 'C++', 'IoT', 'Bluetooth'],
      'features': [
        'Automatic Bluetooth device detection and data reading',
        'Real-time gas weight monitoring and alerts',
        'Usage analytics and refill notifications',
        'Multi-platform support (Android, Windows)',
      ],
      'link': null,
    },
    {
      'title': 'KeyLogging System for Hotel Reception',
      'description':
          'A cross-platform keylogging system tailored for hotel reception desks. Automatically logs key-in and key-out events from devices, creating entry logs for check-in/check-out, guest tracking, and staff attendance. Enhances security and streamlines access management for hospitality environments.',
      'technologies': ['Flutter', 'C++', 'IoT', 'Bluetooth'],
      'features': [
        'Automatic Bluetooth device detection and data reading',
        'Real-time keystroke and device access monitoring',
        'Automatic entry log creation for key-in/key-out events',
        'Supports check-in/check-out, guest tracking',
        'Usage analytics and activity notifications',
        'Multi-platform support (Android, Windows)',
      ],
      'link': null,
    },
    {
      'title': 'Spike Recorder Software',
      'description':
          'Software for visual representation of spike records in graph form. Supports real-time data visualization across multiple platforms.',
      'technologies': ['Flutter', 'C++', 'JavaScript', 'Wasm'],
      'features': [
        'Automatic USB device detection and data reading',
        'Real-time audio data visualization',
        'Responsive graph sampling',
      ],
      'platforms': ['Windows', 'Android', 'Web', 'Mac', 'iOS'],
    },
    {
      'title': 'PCB Testing Software',
      'description':
          'A comprehensive PCB testing solution that communicates with devices to identify and trace errors in PCB boards.',
      'technologies': ['Flutter', 'Python'],
      'features': [
        'Local storage for tested boards',
        'Error tracking using board identifiers',
        'Interactive point selection',
      ],
      'link':
          'https://drive.google.com/file/d/1jUnPBY6Jyh9DpJPnrBQyi0y7TM2ikIRK/view?usp=sharing',
    },
    {
      'title': 'Home Automation App',
      'description':
          'User interface design for a home automation system with intuitive controls.',
      'technologies': ['Flutter'],
      'features': ['Custom UI/UX design', 'Intuitive control interface'],
      'link':
          'https://drive.google.com/drive/folders/1BVanbADl662hCz2LUqv24uYiyt1EVNiK?usp=drive_link',
    },
    {
      'title': 'Grain Moisture Log App',
      'description':
          'Weight measurement and logging application for vehicles with cross-platform support.',
      'technologies': ['Flutter', 'Firebase', 'Firedart'],
      'features': [
        'PDF bill generation and sharing',
        'Date-based filtering',
        'Custom key-value pair entries',
        'Windows OS compatibility',
      ],
      'link':
          'https://drive.google.com/drive/folders/18BLtKCcj6ubkWCJG49VZX4HxiTnlN1Hd?usp=sharing',
    },
    {
      'title': 'Smart Composter App',
      'description':
          'IoT application for monitoring composter conditions with comprehensive analytics.',
      'technologies': ['Flutter', 'ThingSpeak'],
      'features': [
        'Real-time condition monitoring',
        'Environmental metrics tracking',
        'Graphical data visualization',
        'Customizable notification system',
      ],
      'link':
          'https://drive.google.com/drive/folders/1Hc5JHMjTn0Zchbb79r0zkas_m-6aBDme?usp=sharing',
    },
    {
      'title': 'Arctano Solution Website',
      'description':
          'Responsive company portfolio website with interactive animations.',
      'technologies': ['Flutter', 'Firebase'],
      'features': [
        'Responsive design for all devices',
        'Creative UI with animations',
        'Customer query system',
      ],
      'link': 'https://arctano.com/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Increased height to show more content
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(
            project: _projects[index],
            index: index,
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    Future.delayed(
      Duration(milliseconds: 200 * widget.index),
      () => _controller.forward(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              width: 350, // Increased width to show more content
              margin: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.project['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.project['description'],
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: (widget.project['technologies']
                                      as List<String>)
                                  .map((tech) => Chip(
                                        label: Text(tech),
                                        backgroundColor: Colors.blue.shade100,
                                      ))
                                  .toList(),
                            ),
                            if (widget.project['features'] != null) ...[
                              const SizedBox(height: 16),
                              const Text(
                                'Key Features:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...((widget.project['features'] as List<String>)
                                  .map(
                                (feature) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.check_circle,
                                          color: Colors.green, size: 20),
                                      const SizedBox(width: 8),
                                      Expanded(child: Text(feature)),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                            if (widget.project['platforms'] != null) ...[
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: (widget.project['platforms']
                                        as List<String>)
                                    .map((platform) => Chip(
                                          label: Text(platform),
                                          backgroundColor:
                                              Colors.purple.shade100,
                                        ))
                                    .toList(),
                              ),
                            ],
                            if (widget.project['link'] != null) ...[
                              const SizedBox(height: 16),
                              TextButton.icon(
                                onPressed: () async {
                                  final url = widget.project['link'];
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  }
                                },
                                icon: const Icon(Icons.link),
                                label: const Text('View Project'),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
