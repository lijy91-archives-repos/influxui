import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('badge-goldens', () {
    testGolden(
      'badge-colors',
      (_) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Badge(label: 'Badge', color: ExtendedColors.gray),
          Badge(label: 'Badge', color: ExtendedColors.red),
          Badge(label: 'Badge', color: ExtendedColors.pink),
          Badge(label: 'Badge', color: ExtendedColors.grape),
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
      size: Size(1200, 60),
    );

    testGolden(
      'badge-shapes',
      (_) => Row(
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
      size: Size(400, 60),
    );
    testGolden(
      'badge-sizes',
      (_) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Badge(label: 'Badge', size: BadgeSize.tiny),
          Badge(label: 'Badge', size: BadgeSize.small),
          Badge(label: 'Badge', size: BadgeSize.medium),
          Badge(label: 'Badge', size: BadgeSize.large),
          Badge(label: 'Badge', size: BadgeSize.big),
        ],
      ),
      size: Size(400, 60),
    );
    // Variants
    testGolden(
      'badge-variant-light',
      (_) => Badge(
        variant: BadgeVariant.light,
        color: ExtendedColors.blue,
        label: 'Badge',
      ),
    );
    testGolden(
      'badge-variant-filled',
      (_) => Badge(
        variant: BadgeVariant.filled,
        color: ExtendedColors.blue,
        label: 'Badge',
      ),
    );
    testGolden(
      'badge-variant-outline',
      (_) => Badge(
        variant: BadgeVariant.outline,
        color: ExtendedColors.blue,
        label: 'Badge',
      ),
    );
  });
}
