import 'package:flutter/material.dart';
import 'package:hello_color_app/ui/features/home/widgets/color_hex_badge.dart';
import 'package:hello_color_app/ui/shared/extensions/color.dart';

/// The color panel for the Hello Color application.
class ColorPanel extends StatelessWidget {
  /// The constructor for the ColorPanel widget.
  const ColorPanel({
    required this.color,
    required this.onTap,
    required this.text,
    required this.textStyle,
    required this.count,
    super.key,
  });

  /// The color.
  final Color color;

  /// The on tap callback.
  final VoidCallback onTap;

  /// The text.
  final String text;

  /// The count.
  final int count;

  /// The text style.
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final textColor = color.isDarkColor ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: color,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FittedBox(
                  child: Text(
                    text,
                    style: textStyle.copyWith(fontSize: 48, color: textColor),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Center(
                child: Text(
                  'Tap count: $count',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: textColor),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: SafeArea(
              top: false,
              child: Center(
                child: ColorHexBadge(hexColor: color.toHexString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
