import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('alert-demos', () {
    testGolden(
      'alert_demo',
      (_) => const AlertDemo(),
    );
  });
}
