// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' as md;
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/influxui_demos.dart';
import 'package:influxui_demos/src/demos/icon_button/icon_button_with_color_demo.dart';
import 'package:influxui_demos/src/demos/icon_button/icon_button_with_variant_demo.dart';
import 'package:influxui_test/influxui_test.dart';

class _MaterialIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => md.Icons.chevron_left;

  @override
  IconData get chevron_right => md.Icons.chevron_right;

  @override
  IconData get square => md.Icons.square;

  @override
  IconData get light_mode => md.Icons.light_mode_outlined;

  @override
  IconData get dark_mode => md.Icons.dark_mode_outlined;
}

void main() {
  ExtendedIcons.iconLibrary = _MaterialIconLibrary();
  group('icon-button-demos', () {
    testGolden(
      'icon_button_demo',
      (_) => const IconButtonDemo(),
      size: const Size(60, 60),
    );
    testGolden(
      'icon_button_with_color_demo',
      (_) => const IconButtonWithColorDemo(),
      size: const Size(520, 200),
    );
    testGolden(
      'icon_button_with_variant_demo',
      (_) => const IconButtonWithVariantDemo(),
      size: const Size(200, 60),
    );
  });
}
