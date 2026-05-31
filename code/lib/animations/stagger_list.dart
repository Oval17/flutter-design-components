// Reel 22 · Stagger Animation — items slide in 50ms apart.

import 'package:flutter/material.dart';

class StaggerList extends StatefulWidget {
  const StaggerList({super.key, required this.items});
  final List<String> items;

  @override
  State<StaggerList> createState() => _StaggerListState();
}

class _StaggerListState extends State<StaggerList>
    with TickerProviderStateMixin {
  late final AnimationController _master;

  @override
  void initState() {
    super.initState();
    _master = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300 + widget.items.length * 80),
    )..forward();
  }

  @override
  void dispose() { _master.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.items.length,
      itemBuilder: (_, i) {
        final start = (i * 0.08).clamp(0.0, 0.9);
        final end = (start + 0.4).clamp(0.0, 1.0);
        final anim = CurvedAnimation(
          parent: _master,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        );
        return AnimatedBuilder(
          animation: anim,
          builder: (_, child) => Opacity(
            opacity: anim.value,
            child: Transform.translate(
              offset: Offset(0, 30 * (1 - anim.value)),
              child: child,
            ),
          ),
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text(widget.items[i],
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        );
      },
    );
  }
}
