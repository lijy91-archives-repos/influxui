import 'package:flutter_test/flutter_test.dart';
import 'package:influxui_demos/influxui_demos.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('alert-demos', () {
    testGolden(
      'alert_demo',
      (_) => const AlertDemo(),
    );
  });
}
