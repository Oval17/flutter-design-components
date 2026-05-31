// Reel 07 · Shimmer Loading
// DIY shimmer skeleton — no package required.

import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.base = const Color(0xFFE5E7EB),
    this.highlight = const Color(0xFFF9FAFB),
  });

  final Widget child;
  final Duration duration;
  final Color base;
  final Color highlight;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration)..repeat();
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (_, child) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [widget.base, widget.highlight, widget.base],
          stops: const [0.1, 0.5, 0.9],
          transform: _SlideTransform(_c.value),
        ).createShader(rect),
        child: child,
      ),
      child: widget.child,
    );
  }
}

class _SlideTransform extends GradientTransform {
  const _SlideTransform(this.t);
  final double t;
  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * (t * 2 - 1), 0, 0);
  }
}

// Example skeleton
class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});
  @override
  Widget build(BuildContext context) {
    Widget box({double w = double.infinity, double h = 16, double r = 8}) =>
        Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(r),
          ),
        );
    return Shimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          box(h: 180, r: 24),
          const SizedBox(height: 14),
          box(h: 22),
          const SizedBox(height: 10),
          box(h: 18, w: 220),
        ],
      ),
    );
  }
}
