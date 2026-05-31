// Reel 41 · Sliding Tabs — animated indicator slides smoothly between tabs.

import 'package:flutter/material.dart';

class SlidingTabs extends StatefulWidget {
  const SlidingTabs({super.key, required this.labels, this.onChanged});
  final List<String> labels;
  final ValueChanged<int>? onChanged;

  @override
  State<SlidingTabs> createState() => _SlidingTabsState();
}

class _SlidingTabsState extends State<SlidingTabs> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, c) {
      final n = widget.labels.length;
      final tabW = (c.maxWidth - 12) / n;
      return Container(
        height: 64,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutBack,
              left: _index * tabW,
              top: 0,
              bottom: 0,
              width: tabW,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF7C3AED)]),
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
            Row(
              children: List.generate(n, (i) {
                final active = i == _index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _index = i);
                      widget.onChanged?.call(i);
                    },
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 250),
                        style: TextStyle(
                          color: active ? Colors.white : const Color(0xFF64748B),
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                        child: Text(widget.labels[i]),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
