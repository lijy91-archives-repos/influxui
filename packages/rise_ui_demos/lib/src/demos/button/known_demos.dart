import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/button/button_demo.dart';
import 'package:rise_ui_demos/src/demos/button/button_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/button/button_with_variant_demo.dart';

Map<String, WidgetBuilder> knownButtonDemos = {
  'button': (_) => ButtonDemo(),
  'button_with_color': (_) => ButtonWithColorDemo(),
  'button_with_variant': (_) => ButtonWithVariantDemo(),
};
