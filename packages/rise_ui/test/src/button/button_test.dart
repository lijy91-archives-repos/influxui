import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('button-goldens', () {
    testGolden(
      'button',
      (_) => const Button(label: 'Button'),
    );

    // Shapes
    testGolden(
      'button-shape-rectangle',
      (_) => const Button(
        // shape: Shape.rectangle,
        label: 'Round shape',
      ),
    );
    testGolden(
      'button-shape-square',
      (_) => const Button(
        // shape: Shape.square,
        label: 'Circle square',
      ),
    );
    testGolden(
      'button-shape-circle',
      (_) => const Button(
        // shape: Shape.circle,
        label: 'Circle shape',
      ),
    );
    testGolden(
      'button-shape-round',
      (_) => const Button(
        // shape: Shape.round,
        label: 'Circle round',
      ),
    );
    testGolden(
      'button-shape-pill',
      (_) => const Button(
        // shape: Shape.pill,
        label: 'Circle round',
      ),
    );

    // Variants
    testGolden(
      'button-variant-subtle',
      (_) => const Button(
        variant: ButtonVariant.subtle,
        label: 'Subtle variant',
      ),
    );
    testGolden(
      'button-variant-light',
      (_) => const Button(
        variant: ButtonVariant.light,
        label: 'Light variant',
      ),
    );
    testGolden(
      'button-variant-filled',
      (_) => const Button(
        variant: ButtonVariant.filled,
        label: 'Filled variant',
      ),
    );
    testGolden(
      'button-variant-outline',
      (_) => const Button(
        variant: ButtonVariant.outline,
        label: 'Outline variant',
      ),
    );
  });
}
