// Tip 36 · ThemeExtension — type-safe custom theme tokens.
//
// Stop sprinkling `if (isDark) … else …` everywhere.
// Define brand colors once. Access them type-safe from any widget.

import 'package:flutter/material.dart';

/// Brand-specific colors that aren't in the default ColorScheme.
class BrandColors extends ThemeExtension<BrandColors> {
  const BrandColors({required this.success, required this.warning, required this.info});

  final Color success;
  final Color warning;
  final Color info;

  @override
  BrandColors copyWith({Color? success, Color? warning, Color? info}) =>
      BrandColors(
        success: success ?? this.success,
        warning: warning ?? this.warning,
        info: info ?? this.info,
      );

  @override
  BrandColors lerp(BrandColors? other, double t) {
    if (other is! BrandColors) return this;
    return BrandColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}

// Wire it up in your ThemeData
final lightTheme = ThemeData.light().copyWith(
  extensions: const [
    BrandColors(
      success: Color(0xFF10B981),
      warning: Color(0xFFF59E0B),
      info: Color(0xFF3B82F6),
    ),
  ],
);

final darkTheme = ThemeData.dark().copyWith(
  extensions: const [
    BrandColors(
      success: Color(0xFF34D399),
      warning: Color(0xFFFBBF24),
      info: Color(0xFF60A5FA),
    ),
  ],
);

// Use it anywhere
class SuccessBanner extends StatelessWidget {
  const SuccessBanner({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final brand = Theme.of(context).extension<BrandColors>()!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: brand.success.withOpacity(0.15),
        border: Border.all(color: brand.success),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Icon(Icons.check_circle, color: brand.success),
        const SizedBox(width: 12),
        Expanded(child: Text(message, style: TextStyle(color: brand.success))),
      ]),
    );
  }
}
