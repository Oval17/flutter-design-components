// Reel 43 · Radial FAB Menu
// Category: WIDGET
//
// Part of flutter-reels — 100 Flutter UI patterns with video reels.
// MIT.

import 'package:flutter/material.dart';

class RadialFabMenu extends StatefulWidget {
  const RadialFabMenu({super.key});
  @override
  State<RadialFabMenu> createState() => _RadialFabMenuState();
}

class _RadialFabMenuState extends State<RadialFabMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }
  @override
  void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E14),
      body: Center(
        child: ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.1).animate(
            CurvedAnimation(parent: _c, curve: Curves.easeInOut),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF22D3EE)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7C3AED).withOpacity(0.45),
                  blurRadius: 30, offset: const Offset(0, 14),
                ),
              ],
            ),
            child: const Text(
              'Radial FAB Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
