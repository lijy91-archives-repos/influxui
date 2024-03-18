import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/divider/divider_demo.dart';
import 'package:influxui_demos/src/demos/divider/divider_with_label_demo.dart';

Map<String, WidgetBuilder> knownDividerDemos = {
  'divider': (_) => const DividerDemo(),
  'divider_with_label': (_) => const DividerWithLabelDemo(),
};
