import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
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
        shape: Shape.rectangle,
        label: 'Round shape',
      ),
    );
    testGolden(
      'button-shape-square',
      (_) => Button(
        shape: Shape.square,
        label: 'Circle square',
      ),
    );
    testGolden(
      'button-shape-circle',
      (_) => Button(
        shape: Shape.circle,
        label: 'Circle shape',
      ),
    );
    testGolden(
      'button-shape-round',
      (_) => Button(
        shape: Shape.round,
        label: 'Circle round',
      ),
    );
    testGolden(
      'button-shape-pill',
      (_) => Button(
        shape: Shape.pill,
        label: 'Circle round',
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
