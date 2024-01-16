// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:rise_ui_demos/src/demos/action_icon/action_icon_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/action_icon/action_icon_with_variant_demo.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

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
  group('action-icon-demos', () {
    testGolden(
      'action_icon_demo',
      (_) => const ActionIconDemo(),
      size: const Size(60, 60),
    );
    testGolden(
      'action_icon_with_color_demo',
      (_) => const ActionIconWithColorDemo(),
      size: const Size(520, 200),
    );
    testGolden(
      'action_icon_with_variant_demo',
      (_) => const ActionIconWithVariantDemo(),
      size: const Size(200, 60),
    );
  });
}
