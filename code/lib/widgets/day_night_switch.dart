// Reel 39 · Day/Night toggle — morphs sun ↔ moon with a sliding sky and twinkling stars.

import 'package:flutter/material.dart';

class DayNightSwitch extends StatefulWidget {
  const DayNightSwitch({super.key, required this.isDark, required this.onChanged});
  final bool isDark;
  final ValueChanged<bool> onChanged;

  @override
  State<DayNightSwitch> createState() => _DayNightSwitchState();
}

class _DayNightSwitchState extends State<DayNightSwitch> {
  static const _w = 180.0;
  static const _h = 80.0;
  static const _pad = 6.0;
  static const _orb = _h - _pad * 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.isDark),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        width: _w,
        height: _h,
        padding: const EdgeInsets.all(_pad),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_h),
          gradient: LinearGradient(
            colors: widget.isDark
                ? const [Color(0xFF0C1A3A), Color(0xFF1E293B)]
                : const [Color(0xFFFCD34D), Color(0xFFFB923C)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // stars (only visible when dark)
            if (widget.isDark)
              ...List.generate(6, (i) {
                final left = 12 + i * 22.0;
                final top = 8 + (i.isEven ? 0 : 18.0);
                return Positioned(
                  left: left, top: top,
                  child: const Icon(Icons.star,
                      color: Colors.white, size: 8),
                );
              }),
            // orb (sun or moon)
            AnimatedAlign(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutBack,
              alignment: widget.isDark
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: _orb,
                height: _orb,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: widget.isDark
                        ? const [Color(0xFFE0E7FF), Color(0xFF94A3B8)]
                        : const [Color(0xFFFEF3C7), Color(0xFFFBBF24)],
                    center: const Alignment(-0.4, -0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (widget.isDark
                              ? Colors.white
                              : const Color(0xFFFBBF24))
                          .withOpacity(0.5),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
