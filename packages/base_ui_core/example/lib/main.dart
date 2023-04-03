import 'package:base_ui_core/base_ui_core.dart';
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
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
            Column(
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
    );
  }
}
