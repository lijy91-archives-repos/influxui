import 'package:base_ui_core/base_ui_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

enum Shape {
  pill,
  round,
  circle,
  square,
}

final _kLightTheme = ThemeData(
  buttonTheme: const ButtonThemeData(),
);

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
      theme: _kLightTheme,
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
              size: ButtonSize.medium,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
