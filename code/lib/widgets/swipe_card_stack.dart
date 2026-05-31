// Reel 38 · Tinder-style swipe card stack — pan to swipe, peek into the next card.

import 'package:flutter/material.dart';

class SwipeCard {
  const SwipeCard({required this.title, required this.subtitle, required this.gradient, required this.emoji});
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final String emoji;
}

class SwipeCardStack extends StatefulWidget {
  const SwipeCardStack({super.key, required this.cards});
  final List<SwipeCard> cards;

  @override
  State<SwipeCardStack> createState() => _SwipeCardStackState();
}

class _SwipeCardStackState extends State<SwipeCardStack> {
  int _top = 0;
  Offset _drag = Offset.zero;

  void _swipeOff(bool liked) {
    setState(() {
      _top = (_top + 1) % widget.cards.length;
      _drag = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, c) {
      final w = c.maxWidth, h = c.maxHeight;
      return Stack(
        alignment: Alignment.center,
        children: [
          for (int k = 2; k >= 0; k--) _build(k, w, h),
        ],
      );
    });
  }

  Widget _build(int k, double w, double h) {
    final idx = (_top + k) % widget.cards.length;
    final card = widget.cards[idx];
    final isTop = k == 0;
    final dragAngle = _drag.dx / w * 0.4;

    return Positioned.fill(
      child: Transform.translate(
        offset: isTop ? _drag : Offset(0, k * 18.0),
        child: Transform.rotate(
          angle: isTop ? dragAngle : 0,
          child: Transform.scale(
            scale: isTop ? 1.0 : 1.0 - k * 0.05,
            child: GestureDetector(
              onPanUpdate: isTop
                  ? (d) => setState(() => _drag += d.delta)
                  : null,
              onPanEnd: isTop
                  ? (d) {
                      if (_drag.dx.abs() > w * 0.25) {
                        _swipeOff(_drag.dx > 0);
                      } else {
                        setState(() => _drag = Offset.zero);
                      }
                    }
                  : null,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20 + k * 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(colors: card.gradient),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 30,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text(card.emoji, style: const TextStyle(fontSize: 150))),
                    const Spacer(),
                    Text(card.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text(card.subtitle,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9), fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
