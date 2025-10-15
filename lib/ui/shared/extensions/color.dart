import 'dart:math';

import 'package:flutter/material.dart';

/// Extension methods for the Color class.
extension ColorExtension on Color {
  /// The random number generator.
  static final Random random = Random();

  /// Checks if the color is dark.
  bool get isDarkColor => computeLuminance() < 0.5;

  /// Converts the color to a random color.
  Color toRandomColor() {
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }

  /// Converts the color to a hex string.
  String toHexString() {
    return '#${toARGB32().toRadixString(16).substring(2)}'.toUpperCase();
  }
}
