// Tip 31 · ListView.builder
//
// ListView() builds ALL children up front.
// ListView.builder() builds only what's visible.
// Use the second one for any list of > 10 items.

import 'package:flutter/material.dart';

class FastList extends StatelessWidget {
  const FastList({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    // ✅ Lazy — Flutter only builds the rows currently on screen.
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) => ListTile(
        leading: const Icon(Icons.flutter_dash),
        title: Text(items[i]),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// ❌ DON'T DO THIS for large lists — every item is built up front:
//   ListView(children: items.map((s) => ListTile(title: Text(s))).toList())
//
// ListView.builder() also has `.separated` for separators between items,
// and ListView.custom() for full control.
//
// One more level up: use Slivers (CustomScrollView + SliverList) when you
// need different layouts mixed in the same scroll view (sticky headers,
// grid + list, collapsing app bar).
