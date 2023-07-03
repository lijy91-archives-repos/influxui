import 'package:flutter/widgets.dart' hide Notification;
import 'package:rise_ui/rise_ui.dart';

class NotificationDemo extends StatelessWidget {
  const NotificationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Notification(
      title: 'Notification Demo',
    );
  }
}
