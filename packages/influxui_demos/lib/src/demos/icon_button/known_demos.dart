import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/icon_button/icon_button_demo.dart';
import 'package:influxui_demos/src/demos/icon_button/icon_button_with_color_demo.dart';
import 'package:influxui_demos/src/demos/icon_button/icon_button_with_size_demo.dart';
import 'package:influxui_demos/src/demos/icon_button/icon_button_with_variant_demo.dart';

Map<String, WidgetBuilder> knownIconButtonDemos = {
  'icon_button': (_) => const IconButtonDemo(),
  'icon_button_with_color': (_) => const IconButtonWithColorDemo(),
  'icon_button_with_size': (_) => const IconButtonWithSizeDemo(),
  'icon_button_with_variant': (_) => const IconButtonWithVariantDemo(),
};
