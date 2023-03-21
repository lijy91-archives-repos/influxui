import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'badge-pill',
      (_) => Badge.pill(
        label: 'Badge',
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
  });
}
