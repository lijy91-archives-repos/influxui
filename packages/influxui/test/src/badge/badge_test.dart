import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'badge-colors',
      (_) => const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Badge(label: 'Badge', color: ExtendedColors.gray),
          Badge(label: 'Badge', color: ExtendedColors.red),
          Badge(label: 'Badge', color: ExtendedColors.pink),
          Badge(label: 'Badge', color: ExtendedColors.violet),
          Badge(label: 'Badge', color: ExtendedColors.indigo),
          Badge(label: 'Badge', color: ExtendedColors.blue),
          Badge(label: 'Badge', color: ExtendedColors.cyan),
          Badge(label: 'Badge', color: ExtendedColors.teal),
          Badge(label: 'Badge', color: ExtendedColors.green),
          Badge(label: 'Badge', color: ExtendedColors.lime),
          Badge(label: 'Badge', color: ExtendedColors.yellow),
          Badge(label: 'Badge', color: ExtendedColors.orange),
        ],
      ),
      size: const Size(1200, 60),
    );

    testGolden(
      'badge-shapes',
      (_) => const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Badge(label: 'Badge'),
          Badge(label: 'Badge'),
          Badge(label: 'Badge'),
          Badge(label: 'Badge'),
          Badge(label: 'Badge'),
        ],
      ),
      size: const Size(400, 60),
    );
    testGolden(
      'badge-sizes',
      (_) => const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Badge(label: 'Badge', size: BadgeSize.small),
          Badge(label: 'Badge', size: BadgeSize.medium),
          Badge(label: 'Badge', size: BadgeSize.large),
        ],
      ),
      size: const Size(400, 60),
    );
    // Variants
    testGolden(
      'badge-variant-light',
      (_) => const Badge(
        variant: BadgeVariant.light,
        color: ExtendedColors.blue,
        label: 'Badge',
      ),
    );
    testGolden(
      'badge-variant-filled',
      (_) => const Badge(
        variant: BadgeVariant.filled,
        color: ExtendedColors.blue,
        label: 'Badge',
      ),
    );
    testGolden(
      'badge-variant-outline',
      (_) => const Badge(
        variant: BadgeVariant.outline,
        color: ExtendedColors.blue,
        label: 'Badge',
      ),
    );
  });
}
