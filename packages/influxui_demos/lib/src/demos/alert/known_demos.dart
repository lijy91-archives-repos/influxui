import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/alert/alert_demo.dart';

Map<String, WidgetBuilder> knownAlertDemos = {
  'alert': (_) => const AlertDemo(),
};
