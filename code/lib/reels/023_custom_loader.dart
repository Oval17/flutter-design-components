// Reel 23 · Custom Loader
// Category: ANIM
//
// Part of flutter-reels — 100 Flutter UI patterns with video reels.
// MIT.

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});
  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }
  @override
  void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E14),
      body: Center(
        child: AnimatedBuilder(
          animation: _c,
          builder: (_, __) {
            final t = _c.value;
            return Transform.rotate(
              angle: t * 6.28,
              child: Transform.scale(
                scale: 1 + math.sin(t * 6.28) * 0.15,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF97316), Color(0xFFEC4899)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFEC4899).withOpacity(0.5),
                        blurRadius: 40, offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('Custom Loader',
                      style: TextStyle(color: Colors.white,
                        fontSize: 24, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
