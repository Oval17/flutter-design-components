// Reel 20 · Hero animation — shared-element transition between two screens.

import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const _DetailPage()),
          ),
          child: Hero(
            tag: 'card-hero',
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF97316), Color(0xFFEC4899)],
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFEC4899).withOpacity(0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: const Icon(Icons.color_lens, color: Colors.white, size: 80),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: 'card-hero',
            child: Container(
              width: double.infinity,
              height: 400,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF97316), Color(0xFFEC4899)],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Center(
                child: Icon(Icons.color_lens, color: Colors.white, size: 180),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
