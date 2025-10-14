import 'package:flutter/material.dart';

import 'ui/features/home/home_page.dart';

class HelloColorApp extends StatelessWidget {
  const HelloColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
