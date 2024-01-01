import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide Notification;
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'notification-light',
      (_) => Column(
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
      backgroundColor: Color(0xfff8f9fa),
      size: Size(620, 480),
    );
    testGolden(
      'notification-dark',
      (_) => ExtendedTheme(
        data: ExtendedThemeData(
          brightness: Brightness.dark,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Notification(
              color: Colors.blue,
              title: 'Default notification',
              body: 'This is default notification with title and body',
            ),
            SizedBox(height: 10),
            Notification(
              color: Colors.teal,
              title: 'Teal notification',
              body: 'This is teal notification with icon',
            ),
            SizedBox(height: 10),
            Notification(
              color: Colors.red,
              title: 'Bummer! Notification without title',
            ),
          ],
        ),
      ),
      size: Size(620, 480),
    );
  });
}
