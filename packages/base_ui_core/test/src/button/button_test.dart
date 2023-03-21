import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('button-goldens', () {
    testGolden(
      'button',
      (_) => Button(label: 'Button'),
    );

    // Shapes
    testGolden(
      'button-shape-rectangle',
      (_) => Button(
        shape: BoxShape.rectangle,
        label: 'Round shape',
      ),
    );
    testGolden(
      'button-shape-circle',
      (_) => Button(
        shape: BoxShape.circle,
        label: 'Circle shape',
      ),
    );

    // Variants
    testGolden(
      'button-variant-subtle',
      (_) => Button(
        variant: ButtonVariant.subtle,
        label: 'Subtle variant',
      ),
    );
    testGolden(
      'button-variant-light',
      (_) => Button(
        variant: ButtonVariant.light,
        label: 'Light variant',
      ),
    );
    testGolden(
      'button-variant-filled',
      (_) => Button(
        variant: ButtonVariant.filled,
        label: 'Filled variant',
      ),
    );
    testGolden(
      'button-variant-outline',
      (_) => Button(
        variant: ButtonVariant.outline,
        label: 'Outline variant',
      ),
    );
  });
}
