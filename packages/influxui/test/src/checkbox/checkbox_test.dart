import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('checkbox-goldens', () {
    testGolden(
      'checkbox',
      (_) => const Checkbox(
        value: true,
      ),
    );
    testGolden(
      'checkbox-value-true',
      (_) => const Checkbox(
        value: false,
      ),
    );
    testGolden(
      'checkbox-value-false',
      (_) => const Checkbox(
        value: false,
      ),
    );
  });
}
