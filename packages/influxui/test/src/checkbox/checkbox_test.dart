import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('checkbox-goldens', () {
    testGolden(
      'checkbox',
      (_) => const Checkbox(
        value: true,
        label: 'Checkbox',
      ),
    );
    testGolden(
      'checkbox-value-true',
      (_) => const Checkbox(
        value: false,
        label: 'Checkbox',
      ),
    );
    testGolden(
      'checkbox-value-false',
      (_) => const Checkbox(
        value: false,
        label: 'Checkbox',
      ),
    );
    testGolden(
      'checkbox-value-null',
      (_) => const Checkbox(
        value: null,
        tristate: true,
        label: 'Checkbox',
      ),
    );
  });
}
