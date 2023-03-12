import 'package:base_ui_core/base_ui_core.dart';
import 'package:flutter/material.dart' hide Checkbox;

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
    return BaseApp(
      home: Center(
        child: Column(
          children: [
            Blockquote(
              cite: 'test-cite',
              citeBuilder: (context) {
                return const Text('HHHH');
              },
              child: const Text('test-quote'),
            ),
            Alert(
              title: 'Hello',
              titleBuilder: (context) {
                return const Text('AAA');
              },
              message: 'Hxxxx',
              messageBuilder: (context) {
                return const Text('');
              },
            ),
            Button(
              label: 'Button',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
