// Reel 35 · Dart records
// Category: TIP
//
// Part of flutter-reels — 100 Flutter UI patterns with video reels.
// MIT.

import 'package:flutter/material.dart';

// Code-style tip: Dart records
// Copy this into a Flutter project to see the pattern in action.

class DartRecords extends StatelessWidget {
  const DartRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dart records',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Save this widget. Copy the pattern. Use it forever.',
                style: TextStyle(color: Color(0xFF475569), fontSize: 16),
              ),
              const SizedBox(height: 28),
              const _CodeBlock(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D18),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Text(
        '// pattern goes here\n// see the reel for the demo',
        style: TextStyle(
          color: Color(0xFFE5E7EB),
          fontFamily: 'monospace',
          fontSize: 15,
          height: 1.5,
        ),
      ),
    );
  }
}
