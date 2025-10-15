import 'package:flutter/material.dart';

/// The color hex badge for the Hello Color application.
class ColorHexBadge extends StatelessWidget {
  /// The constructor for the ColorHexBadge widget.
  const ColorHexBadge({required this.hexColor, super.key});

  /// The hex color.
  final String hexColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        hexColor,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: Colors.white),
      ),
    );
  }
}
