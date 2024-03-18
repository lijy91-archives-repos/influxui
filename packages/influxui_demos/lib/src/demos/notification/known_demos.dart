import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/notification/notification_demo.dart';

Map<String, WidgetBuilder> knownNotificationDemos = {
  'notification': (_) => const NotificationDemo(),
};
