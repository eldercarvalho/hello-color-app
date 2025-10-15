import 'package:flutter/material.dart';
import 'package:hello_color_app/ui/features/home/home_page.dart';

/// The main app widget for the Hello Color application.
class HelloColorApp extends StatelessWidget {
  /// The constructor for the HelloColorApp widget.
  const HelloColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
