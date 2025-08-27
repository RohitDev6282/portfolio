import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widgets/animated_skill_card.dart';
import '../widgets/project_showcase.dart';
import '../widgets/contact_form.dart';
import '../widgets/glassmorphic_profile_image.dart';
import '../widgets/animated_background.dart';
import '../widgets/animated_section.dart';
import '../widgets/animated_skill_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Header Section with Animated Text
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade500,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Flutter Developer',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'IoT Specialist',
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            'Embedded Systems Expert',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                        pause: const Duration(milliseconds: 1000),
                      ),
                    ),
                  ),
                ),
              ),

              // About Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedSection(
                  id: 'about',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: GlassmorphicProfileImage(),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Rohit Singh\nNew Delhi, India',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Passionate Software Developer with 5 years of experience specializing in Flutter, IoT, and embedded systems development. '
                        'Currently working at Arctano Solutions Private Limited, bringing expertise in multiple programming languages including JavaScript, Dart, C, C++, and Python. '
                        'Seeking opportunities to work in an environment that challenges me while contributing to organizational growth and success.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      SelectableText(
                        'Email: rohitdev6282@gmail.com\nPhone: +91 99991 81009\nLinkedIn: linkedin.com/in/rohit-singh-311272187',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),

              // Skills Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedSection(
                  id: 'skills',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Skills & Expertise',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const AnimatedSkillBar(
                        skillName: 'Flutter & Dart',
                        progress: 0.9,
                        color: Colors.blue,
                      ),
                      const AnimatedSkillBar(
                        skillName: 'IoT Development',
                        progress: 0.85,
                        color: Colors.green,
                      ),
                      const AnimatedSkillBar(
                        skillName: 'Embedded C/C++',
                        progress: 0.8,
                        color: Colors.orange,
                      ),
                      const AnimatedSkillBar(
                        skillName: 'Firebase & Isar',
                        progress: 0.85,
                        color: Colors.purple,
                      ),
                      const AnimatedSkillBar(
                        skillName: 'UI/UX Design',
                        progress: 0.75,
                        color: Colors.pink,
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          AnimatedSkillCard(
                            title: 'Flutter',
                            description: '4 years experience in cross-platform development',
                            icon: Icons.mobile_friendly,
                            progress: 0.9,
                          ),
                          AnimatedSkillCard(
                            title: 'IoT',
                            description: '3 years experience in IoT development',
                            icon: Icons.devices,
                            progress: 0.85,
                          ),
                          AnimatedSkillCard(
                            title: 'C/C++',
                            description: '1 year experience in embedded systems',
                            icon: Icons.memory,
                            progress: 0.8,
                          ),
                          AnimatedSkillCard(
                            title: 'Firebase & Isar',
                            description: '3 years in backend and local storage',
                            icon: Icons.storage,
                            progress: 0.85,
                          ),
                          AnimatedSkillCard(
                            title: 'Dart',
                            description: 'Advanced Flutter app development',
                            icon: Icons.code,
                            progress: 0.9,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Projects Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedSection(
                  id: 'projects',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Featured Projects',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ProjectShowcase(),
                    ],
                  ),
                ),
              ),

              // Contact Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedSection(
                  id: 'contact',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Get in Touch',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ContactForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
