import 'package:flutter/material.dart';

class TestWidgetApp extends StatelessWidget {
  final Widget child;

  const TestWidgetApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
