import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_color_app/ui/features/home/widgets/color_panel.dart';
import 'package:hello_color_app/ui/shared/extensions/color_extension.dart';
import 'package:hello_color_app/ui/shared/resources/fonts.dart';

/// The home page for the Hello Color application.
class HomePage extends StatefulWidget {
  /// The constructor for the HomePage widget.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _random = Random();
  final _tapsToShowResetButton = 3;
  Color _color = Colors.white;
  int _tapCount = 0;
  int _fontIndex = 0;

  void _changeColor() {
    setState(() {
      _color = _color.toRandomColor();
      _tapCount++;
      _fontIndex = _random.nextInt(fonts.length - 1);
    });
  }

  void _reset() {
    setState(() {
      _tapCount = 0;
      _fontIndex = 0;
      _color = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorPanel(
        color: _color,
        text: 'Hello there',
        textStyle: fonts[_fontIndex],
        count: _tapCount,
        onTap: _changeColor,
      ),
      floatingActionButton: Visibility(
        visible: _tapCount > _tapsToShowResetButton,
        child: FloatingActionButton(
          onPressed: _reset,
          child: Icon(Icons.refresh, size: 30, color: _color),
        ),
      ),
    );
  }
}
