import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/kbd/kbd_demo.dart';
import 'package:rise_ui_demos/src/demos/kbd/kbd_with_size_demo.dart';

Map<String, WidgetBuilder> knownKbdDemos = {
  'kbd': (_) => KbdDemo(),
  'kbd_with_size': (_) => KbdWithSizeDemo(),
};
