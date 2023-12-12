import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:rise_ui_demos/src/demos/badge/badge_with_color_demo.dart';
import 'package:rise_ui_demos/src/demos/badge/badge_with_variant_demo.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'badge_demo',
      (_) => BadgeDemo(),
      size: Size(100, 60),
    );
    testGolden(
      'badge_with_color_demo',
      (_) => BadgeWithColorDemo(),
      size: Size(800, 200),
    );
    testGolden(
      'badge_with_variant_demo',
      (_) => BadgeWithVariantDemo(),
      size: Size(800, 200),
    );
  });
}
