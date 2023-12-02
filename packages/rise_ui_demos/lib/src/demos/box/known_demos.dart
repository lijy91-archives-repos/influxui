import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/box/box_demo.dart';
import 'package:rise_ui_demos/src/demos/box/box_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/box/box_with_variant_demo.dart';

Map<String, WidgetBuilder> knownBoxDemos = {
  'box': (_) => BoxDemo(),
  'box_with_color': (_) => BoxWithColorDemo(),
  'box_with_variant': (_) => BoxWithVariantDemo(),
};
