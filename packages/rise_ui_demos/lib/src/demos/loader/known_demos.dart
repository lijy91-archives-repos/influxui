import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/src/demos/loader/loader_demo.dart';
import 'package:rise_ui_demos/src/demos/loader/loader_with_size_demo.dart';

Map<String, WidgetBuilder> knownLoaderDemos = {
  'loader': (_) => const LoaderDemo(),
  'loader_with_size': (_) => const LoaderWithSizeDemo(),
};
