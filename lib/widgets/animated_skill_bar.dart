import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedSkillBar extends StatelessWidget {
  final String skillName;
  final double progress;
  final Color color;

  const AnimatedSkillBar({
    super.key,
    required this.skillName,
    required this.progress,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => MovieTween()
        ..scene(
          duration: const Duration(milliseconds: 300),
        ).tween('scale', Tween<double>(begin: 1.0, end: 1.05)),
      onExit: (_) => MovieTween()
        ..scene(
          duration: const Duration(milliseconds: 300),
        ).tween('scale', Tween<double>(begin: 1.05, end: 1.0)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              skillName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0, end: progress),
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Container(
                      height: 12,
                      width: MediaQuery.of(context).size.width * value,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withOpacity(0.7),
                            color,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
