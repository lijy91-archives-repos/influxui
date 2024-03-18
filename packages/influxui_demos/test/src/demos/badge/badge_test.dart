import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui_demos/influxui_demos.dart';
import 'package:influxui_demos/src/demos/badge/badge_with_color_demo.dart';
import 'package:influxui_demos/src/demos/badge/badge_with_variant_demo.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'badge_demo',
      (_) => const BadgeDemo(),
      size: const Size(100, 60),
    );
    testGolden(
      'badge_with_color_demo',
      (_) => const BadgeWithColorDemo(),
      size: const Size(800, 200),
    );
    testGolden(
      'badge_with_variant_demo',
      (_) => const BadgeWithVariantDemo(),
      size: const Size(800, 200),
    );
  });
}
