import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/badge/badge_demo.dart';
import 'package:rise_ui_demos/src/demos/badge/badge_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/badge/badge_with_variant_demo.dart';

Map<String, WidgetBuilder> knownBadgeDemos = {
  'badge': (_) => BadgeDemo(),
  'badge_with_color': (_) => BadgeWithColorDemo(),
  'badge_with_variant': (_) => BadgeWithVariantDemo(),
};
