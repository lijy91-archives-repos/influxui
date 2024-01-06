import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/action_icon/action_icon_demo.dart';
import 'package:rise_ui_demos/src/demos/action_icon/action_icon_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/action_icon/action_icon_with_size_demo.dart';
import 'package:rise_ui_demos/src/demos/action_icon/action_icon_with_variant_demo.dart';

Map<String, WidgetBuilder> knownActionIconDemos = {
  'action_icon': (_) => const ActionIconDemo(),
  'action_icon_with_color': (_) => const ActionIconWithColorDemo(),
  'action_icon_with_size': (_) => const ActionIconWithSizeDemo(),
  'action_icon_with_variant': (_) => const ActionIconWithVariantDemo(),
};
