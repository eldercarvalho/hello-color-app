import 'dart:math';

import 'package:flutter/material.dart';

/// Extension methods for the Color class.
extension ColorExtension on Color {
  /// The random number generator.
  static final Random random = Random();

  /// The threshold for dark color.
  static const double darkColorThreshold = 0.5;

  /// Checks if the color is dark.
  bool get isDarkColor => computeLuminance() < darkColorThreshold;

  /// Converts the color to a random color.
  Color toRandomColor() {
    const maxValue = 256;
    final red = random.nextInt(maxValue);
    final green = random.nextInt(maxValue);
    final blue = random.nextInt(maxValue);

    return Color.fromARGB(maxValue, red, green, blue);
  }

  /// Converts the color to a hex string.
  String toHexString() {
    const radix = 16;
    const substring = 2;

    return '#${toARGB32().toRadixString(radix).substring(substring)}'
        .toUpperCase();
  }
}
