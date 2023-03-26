import 'package:base_ui_core/base_ui_core.dart';
import 'package:flutter/widgets.dart';

final _kLightTheme = ThemeData(
  kbdTheme: KbdThemeData(
    brightnessedCustomizer: Customizer<Brightness, KbdThemeData>({
      Brightness.light: KbdThemeData(
        color: Colors.gray.shade50,
        borderColor: Colors.gray.shade300,
        labelColor: Colors.gray.shade700,
      ),
      Brightness.dark: const KbdThemeData(
        color: Colors.black54,
        borderColor: Colors.black45,
        labelColor: Colors.black45,
      ),
    }),
    sizedCustomizer: Customizer<NamedSize, KbdThemeData>(
      {
        NamedSize.tiny: const KbdThemeData(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          labelFontSize: 10,
        ),
        NamedSize.small: const KbdThemeData(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
          labelFontSize: 12,
        ),
        NamedSize.medium: const KbdThemeData(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
          labelFontSize: 14,
        ),
        NamedSize.large: const KbdThemeData(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
          labelFontSize: 16,
        ),
        NamedSize.big: const KbdThemeData(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          labelFontSize: 20,
        ),
      },
    ),
  ),
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Badge(label: 'Badge', size: BadgeSize.tiny),
                Badge(label: 'Badge', size: BadgeSize.small),
                Badge(label: 'Badge', size: BadgeSize.medium),
                Badge(label: 'Badge', size: BadgeSize.large),
                Badge(label: 'Badge', size: BadgeSize.big),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Kbd('shift', size: NamedSize.tiny),
                Kbd('shift', size: NamedSize.small),
                Kbd('shift', size: NamedSize.medium),
                Kbd('shift', size: NamedSize.large),
                Kbd('shift', size: NamedSize.big),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
