import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  static final Random random = Random();

  bool get isDarkColor => computeLuminance() < 0.5;

  Color toRandomColor() {
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }

  String toHexString() {
    return '#${toARGB32().toRadixString(16).substring(2)}'.toUpperCase();
  }
}
