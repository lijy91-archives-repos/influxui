import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/box/box_demo.dart';
import 'package:influxui_demos/src/demos/box/box_with_color_demo.dart';
import 'package:influxui_demos/src/demos/box/box_with_variant_demo.dart';

Map<String, WidgetBuilder> knownBoxDemos = {
  'box': (_) => const BoxDemo(),
  'box_with_color': (_) => const BoxWithColorDemo(),
  'box_with_variant': (_) => const BoxWithVariantDemo(),
};
