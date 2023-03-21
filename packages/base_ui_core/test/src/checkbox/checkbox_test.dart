import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('checkbox-goldens', () {
    testGolden(
      'checkbox',
      (_) => Checkbox(
        value: true,
        label: 'Checkbox',
      ),
    );
    testGolden(
      'checkbox-value-true',
      (_) => Checkbox(
        value: false,
        label: 'Checkbox',
      ),
    );
    testGolden(
      'checkbox-value-false',
      (_) => Checkbox(
        value: false,
        label: 'Checkbox',
      ),
    );
    testGolden(
      'checkbox-value-null',
      (_) => Checkbox(
        value: null,
        tristate: true,
        label: 'Checkbox',
      ),
    );
  });
}
