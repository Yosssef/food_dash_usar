import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/auth/presentation/views/login_view.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_cubit.dart';
import 'package:shopix_user/main.dart';

/// ============================================================
/// SPLASH VIEW
/// ------------------------------------------------------------
/// Layers, back to front:
///  1. _BlobBackgroundPainter   – slow ambient moving color blobs
///  2. _ParticleFieldPainter    – floating food icons drifting up
///  3. _PlateRingPainter        – a ring that draws itself in (sweep)
///  4. logo badge               – elastic entrance + idle "breathing"
///  5. _StaggeredWordmark       – "Shopix" revealed letter by letter
///  6. tagline                  – simple fade
///  7. _OrbitLoaderPainter      – a dot orbiting with a comet tail
///
/// On exit, a real circular-reveal transition (_CircleRevealRoute)
/// expands outward from the logo's actual on-screen position, measured
/// through a GlobalKey + RenderBox — not a guessed coordinate.
/// ============================================================
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  // Continuous ambient motion (blobs + particles) — runs the whole time.
  late final AnimationController _ambient = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat(reverse: true);

  // One-shot entrance timeline: plate ring → logo → wordmark → tagline.
  late final AnimationController _intro = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3000),
  );

  // Idle "breathing" loop for the logo, started once intro finishes.
  late final AnimationController _breathe = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  // The orbiting loader dot, also started once intro finishes.
  late final AnimationController _orbit = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );
  late final AnimationController _floatingicons = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 15000),
  )..repeat(reverse: true);

  final GlobalKey _logoKey = GlobalKey();
  late final List<_Particle> _particles;

  // ---- derived intervals of `_intro` ----
  late final Animation<double> _ringT = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.0, 0.42, curve: Curves.easeOut),
  );
  late final Animation<double> _logoScale = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.22, 0.42, curve: Curves.easeInBack),
  );
  late final Animation<double> _logoFade = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.22, 0.4, curve: Curves.easeOut),
  );
  late final Animation<double> _wordmarkT = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.5, 0.85, curve: Curves.linear),
  );
  late final Animation<double> _taglineFade = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
  );
  late final Animation<double> _loaderFade = CurvedAnimation(
    parent: _intro,
    curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
  );

  @override
  void initState() {
    super.initState();
    _particles = _generateParticles(30);

    _intro.forward();
    _intro.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathe.repeat(reverse: true);
        _orbit.repeat();
      }
    });
    final settings = SettingsCubit().loadSettings();
    _scheduleExit(!settings.hasCompletedOnboarding);
  }

  List<_Particle> _generateParticles(int count) {
    final rnd = math.Random(42);
    const icons = [
      Icons.lunch_dining_rounded,
      Icons.local_pizza_rounded,
      Icons.icecream_rounded,
      Icons.local_cafe_rounded,
      Icons.cake_rounded,
      Icons.ramen_dining_rounded,
    ];
    return List.generate(count, (i) {
      return _Particle(
        seedX: rnd.nextDouble(),
        speed: 0.55 + rnd.nextDouble() * 0.9,
        phase: rnd.nextDouble() * math.pi * 2,
        size: 14.0 + rnd.nextDouble() * 14,
        opacity: 0.05 + rnd.nextDouble() * 0.10,
        icon: icons[i % icons.length],
      );
    });
  }

  Future<void> _scheduleExit(bool fristtime) async {
    await Future.delayed(const Duration(milliseconds: 7000));
    if (!mounted) return;

    final box = _logoKey.currentContext?.findRenderObject() as RenderBox?;
    final center = box == null
        ? MediaQuery.of(context).size.center(Offset.zero)
        : box.localToGlobal(box.size.center(Offset.zero));

    Navigator.pushReplacement(
      context,
      _CircleRevealRoute(
        page: fristtime ? LoginView() : const MyHomePage(),
        center: center,
      ),
    );
  }

  @override
  void dispose() {
    _ambient.dispose();
    _intro.dispose();
    _breathe.dispose();
    _orbit.dispose();
    _floatingicons.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final lang = context.watch<SettingsCubit>().state.locale.languageCode;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              child: ClipPath(
                clipper: CircleRevealClipper(
                  fraction: 1.0,
                  center: const Offset(100, 100),
                ),
                child: const MyHomePage(),
              ),
            ),
          ),
          // Layer 1 — ambient moving blobs
          AnimatedBuilder(
            animation: _ambient,
            builder: (context, _) => CustomPaint(
              painter: _BlobBackgroundPainter(
                t: _ambient.value,
                color: scheme.secondary,
              ),
            ),
          ),

          // Layer 2 — floating food-icon particles
          AnimatedBuilder(
            animation: _floatingicons,
            builder: (context, _) => CustomPaint(
              painter: _ParticleFieldPainter(
                t: _floatingicons.value,
                particles: _particles,
                color: scheme.onSurface,
              ),
            ),
          ),

          // Layers 3–7 — the actual intro content, centered.
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 132.r,
                  height: 132.r,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _ringT,
                        builder: (context, _) => CustomPaint(
                          size: Size(132.r, 132.r),
                          painter: _PlateRingPainter(
                            t: _ringT.value,
                            color: scheme.primary,
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _logoFade,
                        child: AnimatedBuilder(
                          animation: Listenable.merge([_logoScale, _breathe]),
                          builder: (context, child) {
                            final breathe =
                                1.0 +
                                (math.sin(_breathe.value * math.pi) * 0.035);
                            return Transform.scale(
                              scale: _logoScale.value * breathe,
                              child: child,
                            );
                          },
                          child: Container(
                            key: _logoKey,
                            width: 84.r,
                            height: 84.r,
                            decoration: BoxDecoration(
                              color: scheme.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: scheme.primary.withValues(alpha: 0.35),
                                  blurRadius: 24,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.shopping_bag_rounded,
                              color: scheme.onPrimary,
                              size: 38.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22.h),

                // Letter-by-letter wordmark reveal.
                AnimatedBuilder(
                  animation: _wordmarkT,
                  builder: (context, _) => _StaggeredWordmark(
                    text: "FoodDash",
                    progress: _wordmarkT.value,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w900,
                      color: scheme.secondary,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),

                FadeTransition(
                  opacity: _taglineFade,
                  child: Text(
                    AppStrings.t('splash.slogn', lang),
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                SizedBox(height: 44.h),

                FadeTransition(
                  opacity: _loaderFade,
                  child: AnimatedBuilder(
                    animation: _orbit,
                    builder: (context, _) => CustomPaint(
                      size: Size(40.r, 40.r),
                      painter: _OrbitLoaderPainter(
                        t: _orbit.value,
                        color: scheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Particle {
  final double seedX; // 0..1 horizontal anchor
  final double speed; // vertical drift multiplier
  final double phase; // offsets the sway/cycle so particles desync
  final double size;
  final double opacity;
  final IconData icon;

  const _Particle({
    required this.seedX,
    required this.speed,
    required this.phase,
    required this.size,
    required this.opacity,
    required this.icon,
  });
}

class _ParticleFieldPainter extends CustomPainter {
  final double t;
  final List<_Particle> particles;
  final Color color;

  _ParticleFieldPainter({
    required this.t,
    required this.particles,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final localT = (t * p.speed + p.phase / (math.pi * 2)) % 1.0;
      final y = size.height * (1.15 - localT * 1.3);
      final sway = math.sin((localT * math.pi * 2 * 2) + p.phase) * 14.r;
      final x = size.width * p.seedX + sway;

      final fadeIn = (localT * 6).clamp(0.0, 1.0);
      final fadeOut = ((1 - localT) * 6).clamp(0.0, 1.0);
      final alpha = p.opacity * math.min(fadeIn, fadeOut);
      if (alpha <= 0.002) continue;

      _paintIcon(
        canvas,
        icon: p.icon,
        position: Offset(x, y),
        size: p.size,
        color: color.withValues(alpha: alpha),
      );
    }
  }

  void _paintIcon(
    Canvas canvas, {
    required IconData icon,
    required Offset position,
    required double size,
    required Color color,
  }) {
    final builder =
        ParagraphBuilder(ParagraphStyle(textAlign: TextAlign.center))
          ..pushStyle(
            TextStyle(
              fontSize: size,
              fontFamily: icon.fontFamily,
              package: icon.fontPackage,
              color: color,
            ).getTextStyle(),
          )
          ..addText(String.fromCharCode(icon.codePoint));
    final paragraph = builder.build()
      ..layout(ParagraphConstraints(width: size * 1.4));
    canvas.drawParagraph(
      paragraph,
      Offset(position.dx - size / 2, position.dy - size / 2),
    );
  }

  @override
  bool shouldRepaint(covariant _ParticleFieldPainter oldDelegate) =>
      oldDelegate.t != t;
}

class _BlobBackgroundPainter extends CustomPainter {
  final double t;
  final Color color;

  _BlobBackgroundPainter({required this.t, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final blobs = [
      (dx: 0.25, dy: 0.22, r: 0.34, speed: 1.0, phase: 0.0),
      (dx: 0.78, dy: 0.30, r: 0.28, speed: 1.4, phase: 2.1),
      (dx: 0.5, dy: 0.82, r: 0.30, speed: 0.8, phase: 4.2),
    ];

    for (final b in blobs) {
      final angle = (t * math.pi * 2 * b.speed) + b.phase;
      final cx = size.width * b.dx + math.cos(angle) * size.width * 0.06;
      final cy = size.height * b.dy + math.sin(angle) * size.height * 0.05;
      final radius = size.shortestSide * b.r;

      final paint = Paint()
        ..color = color.withValues(alpha: 0.2)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 40);
      canvas.drawCircle(Offset(cx, cy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BlobBackgroundPainter oldDelegate) =>
      oldDelegate.t != t;
}

class _PlateRingPainter extends CustomPainter {
  final double t;
  final Color color;

  _PlateRingPainter({required this.t, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - 4;
    if (radius <= 0) return;
    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = color.withValues(alpha: 0.08);
    canvas.drawCircle(center, radius, track);

    final sweepAngle = (math.pi * 2 * t).clamp(0.0, math.pi * 2);

    if (sweepAngle > 0.001) {
      final rect = Rect.fromCircle(center: center, radius: radius);

      final sweep = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          startAngle: -math.pi / 2,
          endAngle: -math.pi / 2 + sweepAngle,
          colors: [color, color],
        ).createShader(rect);

      canvas.drawArc(rect, -math.pi / 2, sweepAngle, false, sweep);
    }

    if (t > 0.7) {
      final dashAlpha = (((t - 0.7) / 0.3).clamp(0.0, 1.0) * 0.15).clamp(
        0.0,
        1.0,
      );
      final dashRadius = radius - 12;
      _drawDashedCircle(
        canvas,
        center: center,
        radius: dashRadius,
        color: color.withValues(alpha: dashAlpha),
      );
    }
  }

  void _drawDashedCircle(
    Canvas canvas, {
    required Offset center,
    required double radius,
    required Color color,
  }) {
    const dashCount = 28;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    for (int i = 0; i < dashCount; i++) {
      final a0 = (i / dashCount) * math.pi * 2;
      final a1 = a0 + (math.pi * 2 / dashCount) * 0.5;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        a0,
        a1 - a0,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PlateRingPainter oldDelegate) =>
      oldDelegate.t != t;
}

class _StaggeredWordmark extends StatelessWidget {
  final String text;
  final double progress;
  final TextStyle style;

  const _StaggeredWordmark({
    required this.text,
    required this.progress,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final letters = text.split('');
    final step = 1.0 / letters.length;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(letters.length, (i) {
          final start = i * step * 0.7; // windows overlap a bit
          final end = (start + step * 1.6).clamp(0.0, 1.0);
          final localT = ((progress - start) / (end - start)).clamp(0.0, 1.0);
          final eased = Curves.easeOutCubic.transform(localT);

          return Transform.translate(
            offset: Offset(0, (1 - eased) * 16),
            child: Transform.rotate(
              angle: (1 - eased) * -0.05,
              child: Opacity(
                opacity: localT.clamp(0.0, 1.0),
                child: Text(letters[i], style: style),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _OrbitLoaderPainter extends CustomPainter {
  final double t;
  final Color color;

  _OrbitLoaderPainter({required this.t, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - 4;
    const trailCount = 6;

    for (int i = 0; i < trailCount; i++) {
      final trailT = t - (i * 0.09);
      final angle = trailT * math.pi * 2 - math.pi / 2;
      final position =
          center + Offset(math.cos(angle), math.sin(angle)) * radius;
      final alpha = (1 - i / trailCount).clamp(0.0, 1.0);
      final dotRadius = 3.5 * (1 - i / trailCount * 0.6);

      canvas.drawCircle(
        position,
        dotRadius,
        Paint()..color = color.withValues(alpha: alpha),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitLoaderPainter oldDelegate) =>
      oldDelegate.t != t;
}

class _CircleRevealRoute extends PageRouteBuilder {
  final Widget page;
  final Offset center;

  _CircleRevealRoute({required this.page, required this.center})
    : super(
        transitionDuration: const Duration(milliseconds: 1000),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return ClipPath(
                clipper: CircleRevealClipper(
                  fraction: animation.value,
                  center: center,
                ),
                child: child,
              );
            },
            child: child,
          );
        },
      );
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset center;

  CircleRevealClipper({required this.fraction, required this.center});

  @override
  Path getClip(Size size) {
    if (fraction <= 0) return Path();
    if (fraction >= 1.0) {
      return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    }

    final dx1 = center.dx;
    final dx2 = size.width - center.dx;
    final dy1 = center.dy;
    final dy2 = size.height - center.dy;

    final maxDx = math.max(dx1, dx2);
    final maxDy = math.max(dy1, dy2);

    final maxRadius = math.sqrt(maxDx * maxDx + maxDy * maxDy);

    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: maxRadius * fraction));
  }

  @override
  bool shouldReclip(covariant CircleRevealClipper oldClipper) =>
      oldClipper.fraction != fraction || oldClipper.center != center;
}
