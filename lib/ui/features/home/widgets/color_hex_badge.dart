import 'package:flutter/material.dart';

class ColorHexBadge extends StatelessWidget {
  const ColorHexBadge({super.key, required this.hexColor});

  final String hexColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(16)),
      child: Text(hexColor, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
    );
  }
}
