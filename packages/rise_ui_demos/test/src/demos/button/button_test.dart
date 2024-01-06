import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:rise_ui_demos/src/demos/button/button_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/button/button_with_variant_demo.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('button-demos', () {
    testGolden(
      'button_demo',
      (_) => const ButtonDemo(),
    );
    testGolden(
      'button_with_color_demo',
      (_) => const ButtonWithColorDemo(),
      size: const Size(800, 400),
    );
    testGolden(
      'button_with_variant_demo',
      (_) => const ButtonWithVariantDemo(),
      size: const Size(800, 400),
    );
  });
}
