// Reel 01 · Animated FAB
// A FAB that pulses gently with a ScaleTransition + Tween.

import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({super.key, this.onPressed, this.icon = Icons.add});

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF22D3EE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7C3AED).withOpacity(0.5),
              blurRadius: 30,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(widget.icon, size: 28, color: Colors.white),
        ),
      ),
    );
  }
}
