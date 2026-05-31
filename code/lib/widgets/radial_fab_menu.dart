// Reel 43 · Radial FAB Menu — expands outward to N petal buttons.

import 'dart:math' as math;
import 'package:flutter/material.dart';

class RadialFabMenu extends StatefulWidget {
  const RadialFabMenu({
    super.key,
    required this.items,
    this.radius = 110,
    this.spread = math.pi,         // half circle by default
    this.startAngle = -math.pi / 2 - math.pi / 2,
  });

  final List<RadialFabItem> items;
  final double radius;
  final double spread;
  final double startAngle;

  @override
  State<RadialFabMenu> createState() => _RadialFabMenuState();
}

class RadialFabItem {
  const RadialFabItem({required this.icon, required this.onTap, this.color});
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
}

class _RadialFabMenuState extends State<RadialFabMenu>
    with SingleTickerProviderStateMixin {
  bool _open = false;
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 360));
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  void _toggle() {
    setState(() => _open = !_open);
    _open ? _c.forward() : _c.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.items.length;
    return SizedBox(
      width: widget.radius * 2 + 80,
      height: widget.radius * 2 + 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(n, (i) {
            final t = (i / (n - 1)).clamp(0.0, 1.0);
            final angle = widget.startAngle + widget.spread * t;
            return AnimatedBuilder(
              animation: _c,
              builder: (_, child) {
                final v = Curves.easeOutBack.transform(_c.value);
                final dx = math.cos(angle) * widget.radius * v;
                final dy = math.sin(angle) * widget.radius * v;
                return Transform.translate(
                  offset: Offset(dx, dy),
                  child: Opacity(opacity: _c.value, child: child),
                );
              },
              child: _Petal(item: widget.items[i]),
            );
          }),
          GestureDetector(
            onTap: _toggle,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 300),
              turns: _open ? 0.125 : 0,
              child: Container(
                width: 70, height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: [Color(0xFFF97316), Color(0xFFEC4899)]),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEC4899).withOpacity(0.5),
                      blurRadius: 20, offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Petal extends StatelessWidget {
  const _Petal({required this.item});
  final RadialFabItem item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: 56, height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: item.color ?? Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 6)),
          ],
        ),
        child: Icon(item.icon, color: const Color(0xFF1F2937)),
      ),
    );
  }
}
