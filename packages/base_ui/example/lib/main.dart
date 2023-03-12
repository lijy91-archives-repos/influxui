import 'package:flutter/material.dart' show MaterialApp, Scaffold, AppBar;
import 'package:base_ui/base_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('base_ui example'),
        ),
        body: const Center(
          child: Button(label: 'Hi'),
        ),
      ),
    );
  }
}
