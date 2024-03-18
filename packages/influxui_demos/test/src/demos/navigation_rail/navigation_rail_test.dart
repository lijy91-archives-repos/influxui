import 'package:flutter_test/flutter_test.dart';
import 'package:influxui_demos/src/demos/navigation_rail/navigation_rail_demo.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('navigation_rail-goldens', () {
    testGolden(
      'navigation_rail_demo',
      (_) => const NavigationRailDemo(),
    );
  });
}
