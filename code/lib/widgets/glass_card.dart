// Reel 02 · Glassmorphism Card
// Frosted glass with BackdropFilter — no package needed.

import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 28,
    this.blur = 24,
    this.opacity = 0.18,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

// Example usage:
// Stack(
//   children: [
//     // Some colorful background here
//     Container(decoration: BoxDecoration(gradient: ...)),
//     Center(
//       child: GlassCard(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const [
//             Text('Premium plan', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
//             SizedBox(height: 8),
//             Text('Unlock everything', style: TextStyle(color: Colors.white70)),
//           ],
//         ),
//       ),
//     ),
//   ],
// )
