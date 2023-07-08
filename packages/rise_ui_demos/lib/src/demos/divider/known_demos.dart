import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/divider/divider_demo.dart';
import 'package:rise_ui_demos/src/demos/divider/divider_with_label_demo.dart';

Map<String, WidgetBuilder> knownDividerDemos = {
  'divider': (_) => DividerDemo(),
  'divider_with_label': (_) => DividerWithLabelDemo(),
};
