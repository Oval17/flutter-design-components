// Reel 98 · Progress Dots
// Category: SCREEN
//
// Part of flutter-reels — 100 Flutter UI patterns with video reels.
// MIT.

import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  const ProgressDots({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F4),
      appBar: AppBar(
        title: const Text('Progress Dots'),
        elevation: 0,
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF22D3EE)],
                begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: Text('Progress Dots',
                style: TextStyle(color: Colors.white,
                  fontSize: 28, fontWeight: FontWeight.w900)),
            ),
          ),
          const SizedBox(height: 20),
          for (final item in ['First', 'Second', 'Third'])
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: ListTile(
                leading: const Icon(Icons.bolt, color: Color(0xFFEC4899)),
                title: Text(item),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
        ],
      ),
    );
  }
}
