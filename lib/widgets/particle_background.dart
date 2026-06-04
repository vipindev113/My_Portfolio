import 'dart:math';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Animated floating particles on the hero background.
class ParticleBackground extends StatefulWidget {
  final Widget child;
  const ParticleBackground({super.key, required this.child});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;
  final Random _rng = Random();

  @override
  void initState() {
    super.initState();
    _particles = List.generate(55, (_) => _Particle(_rng));
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
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
      builder: (context2, child2) {
        for (final p in _particles) {
          p.update();
        }
        return CustomPaint(
          painter: _ParticlePainter(_particles),
          child: widget.child,
        );
      },
    );
  }
}

class _Particle {
  late double x, y, vx, vy, radius, opacity;
  final Random _rng;

  _Particle(this._rng) {
    _reset();
  }

  void _reset() {
    x = _rng.nextDouble();
    y = _rng.nextDouble();
    vx = (_rng.nextDouble() - 0.5) * 0.0003;
    vy = (_rng.nextDouble() - 0.5) * 0.0003;
    radius = _rng.nextDouble() * 2 + 0.5;
    opacity = _rng.nextDouble() * 0.4 + 0.1;
  }

  void update() {
    x += vx;
    y += vy;
    if (x < 0 || x > 1) vx = -vx;
    if (y < 0 || y > 1) vy = -vy;
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final p in particles) {
      paint.color = AppColors.accent.withValues(alpha: p.opacity);
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.radius,
        paint,
      );
    }
    // Draw connecting lines between nearby particles
    final linePaint = Paint()
      ..color = AppColors.accent.withValues(alpha: 0.05)
      ..strokeWidth = 0.5;
    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final dx = (particles[i].x - particles[j].x) * size.width;
        final dy = (particles[i].y - particles[j].y) * size.height;
        final dist = sqrt(dx * dx + dy * dy);
        if (dist < 120) {
          linePaint.color = AppColors.accent.withValues(
            alpha: 0.08 * (1 - dist / 120),
          );
          canvas.drawLine(
            Offset(particles[i].x * size.width, particles[i].y * size.height),
            Offset(particles[j].x * size.width, particles[j].y * size.height),
            linePaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter old) => true;
}
