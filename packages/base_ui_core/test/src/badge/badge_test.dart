import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'badge',
      (_) => Badge(
        label: 'ladge',
      ),
    );
  });

  // Shapes
  testGolden(
    'badge-shape-pill',
    (_) => Badge(
      shape: Shape.pill,
      label: 'Pill shape',
    ),
  );
  testGolden(
    'badge-shape-round',
    (_) => Badge(
      shape: Shape.round,
      label: 'Round shape',
    ),
  );
  testGolden(
    'badge-shape-circle',
    (_) => Badge(
      shape: Shape.circle,
      label: 'Circle shape',
    ),
  );
  testGolden(
    'badge-shape-square',
    (_) => Badge(
      shape: Shape.square,
      label: 'Square shape',
    ),
  );

  // Variants
  testGolden(
    'badge-variant-light',
    (_) => Badge(
      variant: BadgeVariant.light,
      label: 'Badge',
    ),
  );
  testGolden(
    'badge-variant-filled',
    (_) => Badge(
      variant: BadgeVariant.filled,
      label: 'Badge',
    ),
  );
  testGolden(
    'badge-variant-outline',
    (_) => Badge(
      variant: BadgeVariant.outline,
      label: 'Badge',
    ),
  );
  testGolden(
    'badge-variant-subtle',
    (_) => Badge(
      variant: BadgeVariant.dot,
      label: 'Badge',
    ),
  );
}
