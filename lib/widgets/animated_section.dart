import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final String id;

  const AnimatedSection({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: _isVisible ? 1.0 : 0.0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 800),
          offset: _isVisible ? Offset.zero : const Offset(0, 0.2),
          child: widget.child
              .animate(target: _isVisible ? 1 : 0)
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.2, end: 0)
              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
        ),
      ),
    );
  }
}
