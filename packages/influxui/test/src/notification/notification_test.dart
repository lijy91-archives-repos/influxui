import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide Notification;
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'notification-light',
      (_) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Notification(
            color: ExtendedColors.blue,
            title: 'Default notification',
            body: 'This is default notification with title and body',
          ),
          SizedBox(height: 50),
          Notification(
            color: ExtendedColors.teal,
            title: 'Teal notification',
            body: 'This is teal notification with icon',
          ),
          SizedBox(height: 50),
          Notification(
            color: ExtendedColors.red,
            title: 'Bummer! Notification without title',
          ),
        ],
      ),
      backgroundColor: const Color(0xfff8f9fa),
      size: const Size(620, 480),
    );
    testGolden(
      'notification-dark',
      (_) => const ExtendedTheme(
        data: ExtendedThemeData(
          brightness: Brightness.dark,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Notification(
              color: ExtendedColors.blue,
              title: 'Default notification',
              body: 'This is default notification with title and body',
            ),
            SizedBox(height: 10),
            Notification(
              color: ExtendedColors.teal,
              title: 'Teal notification',
              body: 'This is teal notification with icon',
            ),
            SizedBox(height: 10),
            Notification(
              color: ExtendedColors.red,
              title: 'Bummer! Notification without title',
            ),
          ],
        ),
      ),
      size: const Size(620, 480),
    );
  });
}
