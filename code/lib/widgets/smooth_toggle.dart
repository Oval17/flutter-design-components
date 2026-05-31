// Reel 08 · Smooth Toggle
// AnimatedAlign + Curves.easeOutBack = a toggle knob that overshoots and settles.

import 'package:flutter/material.dart';

class SmoothToggle extends StatefulWidget {
  const SmoothToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = const Color(0xFF7C3AED),
    this.inactiveColor = const Color(0xFF374151),
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  State<SmoothToggle> createState() => _SmoothToggleState();
}

class _SmoothToggleState extends State<SmoothToggle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        width: 78,
        height: 42,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: widget.value ? widget.activeColor : widget.inactiveColor,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: (widget.value ? widget.activeColor : Colors.black)
                  .withOpacity(0.3),
              blurRadius: widget.value ? 14 : 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
