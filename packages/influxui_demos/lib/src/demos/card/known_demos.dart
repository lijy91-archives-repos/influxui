import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/card/card_demo.dart';

Map<String, WidgetBuilder> knownCardDemos = {
  'card': (_) => const CardDemo(),
};
