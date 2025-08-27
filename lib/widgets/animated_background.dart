import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class AnimatedBackground extends StatelessWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularParticle(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          awayRadius: 80,
          numberOfParticles: 50,
          speedOfParticles: 1.5,
          maxParticleSize: 7,
          particleColor: Colors.blue.withOpacity(0.1),
          awayAnimationDuration: const Duration(milliseconds: 600),
          awayAnimationCurve: Curves.easeInOutBack,
          onTapAnimation: true,
          isRandSize: true,
          isRandomColor: false,
          connectDots: true,
          enableHover: true,
          hoverColor: Colors.blue.withOpacity(0.5),
          hoverRadius: 90,
        ),
        child,
      ],
    );
  }
}
