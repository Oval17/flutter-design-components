// Reel 03 · Neumorphic Button
// Two opposite BoxShadows = soft-UI. Flip them on press for the "pressed" feel.

import 'package:flutter/material.dart';

class NeumorphicButton extends StatefulWidget {
  const NeumorphicButton({
    super.key,
    required this.child,
    this.onPressed,
    this.size = 80,
    this.base = const Color(0xFFE8E8EC),
  });

  final Widget child;
  final VoidCallback? onPressed;
  final double size;
  final Color base;

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _pressed = false;

  static const _curve = Curves.easeOut;

  @override
  Widget build(BuildContext context) {
    final dark = Color.lerp(widget.base, Colors.black, 0.18)!;
    final light = Color.lerp(widget.base, Colors.white, 0.45)!;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: _curve,
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.base,
          shape: BoxShape.circle,
          boxShadow: _pressed
              ? [
                  BoxShadow(color: dark, blurRadius: 8, offset: const Offset(2, 2), spreadRadius: -2),
                  BoxShadow(color: light, blurRadius: 8, offset: const Offset(-2, -2), spreadRadius: -2),
                ]
              : [
                  BoxShadow(color: dark, blurRadius: 14, offset: const Offset(6, 6)),
                  BoxShadow(color: light, blurRadius: 14, offset: const Offset(-6, -6)),
                ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
