import 'package:flutter/widgets.dart' hide Notification;
import 'package:rise_ui/rise_ui.dart';

class NotificationDemo extends StatelessWidget {
  const NotificationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Notification(
      title: 'Notification Demo',
    );
  }
}
