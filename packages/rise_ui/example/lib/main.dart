import 'package:rise_ui/rise_ui.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart' hide Notification;

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
    return md.MaterialApp(
      home: Theme(
        data: ThemeData(),
        child: md.Scaffold(
          body: Center(
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
                  children: [
                    Button(
                      variant: ButtonVariant.subtle,
                      label: 'Subtle variant',
                      onPressed: () {},
                    ),
                    Button(
                      variant: ButtonVariant.light,
                      label: 'Light variant',
                      onPressed: () {},
                    ),
                    Button(
                      variant: ButtonVariant.filled,
                      label: 'Filled variant',
                      onPressed: () {},
                    ),
                    Button(
                      variant: ButtonVariant.outline,
                      label: 'Outline variant',
                      onPressed: () {},
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Badge(label: 'Badge', size: BadgeSize.tiny),
                    Badge(label: 'Badge', size: BadgeSize.small),
                    Badge(label: 'Badge', size: BadgeSize.medium),
                    Badge(label: 'Badge', size: BadgeSize.large),
                    Badge(label: 'Badge', size: BadgeSize.big),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Kbd('shift', size: NamedSize.tiny),
                    Kbd('shift', size: NamedSize.small),
                    Kbd('shift', size: NamedSize.medium),
                    Kbd('shift', size: NamedSize.large),
                    Kbd('shift', size: NamedSize.big),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Loader(size: NamedSize.tiny),
                    Loader(size: NamedSize.small),
                    Loader(size: NamedSize.medium),
                    Loader(size: NamedSize.large),
                    Loader(size: NamedSize.big),
                  ],
                ),
                // const SizedBox(
                //   width: 500,
                //   height: 20,
                //   child: Center(
                //     child: Divider(
                //       variant: DividerVariant.solid,
                //       color: Colors.blue,
                //       label: 'Label',
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 500,
                //   height: 20,
                //   child: Center(
                //     child: Divider(
                //       variant: DividerVariant.dashed,
                //       color: Colors.blue,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 500,
                //   height: 20,
                //   child: Center(
                //     child: Divider(
                //       variant: DividerVariant.dotted,
                //       color: Colors.blue,
                //     ),
                //   ),
                // ),
                // Row(
                //   children: const [
                //     SizedBox(
                //       width: 50,
                //       height: 200,
                //       child: Center(
                //         child: Divider(
                //           direction: Axis.vertical,
                //           variant: DividerVariant.solid,
                //           color: Colors.blue,
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 50,
                //       height: 200,
                //       child: Center(
                //         child: Divider(
                //           direction: Axis.vertical,
                //           variant: DividerVariant.dashed,
                //           color: Colors.blue,
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 50,
                //       height: 200,
                //       child: Center(
                //         child: Divider(
                //           direction: Axis.vertical,
                //           variant: DividerVariant.dotted,
                //           color: Colors.blue,
                //           label: 'Label',
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Notification(
                      color: Colors.blue,
                      title: 'Default notification',
                      body: 'This is default notification with title and body',
                    ),
                    SizedBox(height: 50),
                    Notification(
                      color: Colors.teal,
                      title: 'Teal notification',
                      body: 'This is teal notification with icon',
                    ),
                    SizedBox(height: 50),
                    Notification(
                      color: Colors.red,
                      title: 'Bummer! Notification without title',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
