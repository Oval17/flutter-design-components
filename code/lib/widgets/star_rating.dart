// Reel 44 · Star Rating — tap to set, with pop animation on the active stars.

import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  const StarRating({
    super.key,
    this.max = 5,
    this.initial = 0,
    this.onChanged,
    this.size = 48,
    this.color = const Color(0xFFFDE047),
    this.empty = const Color(0xFFCBD5E1),
  });

  final int max;
  final int initial;
  final ValueChanged<int>? onChanged;
  final double size;
  final Color color;
  final Color empty;

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _value = widget.initial;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.max, (i) {
        final filled = i < _value;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              setState(() => _value = i + 1);
              widget.onChanged?.call(_value);
            },
            child: AnimatedScale(
              scale: filled ? 1.0 : 0.85,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: filled ? 1 : 0),
                duration: const Duration(milliseconds: 250),
                builder: (_, t, __) {
                  return Icon(
                    Icons.star_rounded,
                    size: widget.size,
                    color: Color.lerp(widget.empty, widget.color, t),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
