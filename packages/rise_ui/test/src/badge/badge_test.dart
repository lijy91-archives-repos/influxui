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
          Badge(label: 'Badge', color: Colors.darkGray),
          Badge(label: 'Badge', color: Colors.gray),
          Badge(label: 'Badge', color: Colors.red),
          Badge(label: 'Badge', color: Colors.pink),
          Badge(label: 'Badge', color: Colors.grape),
          Badge(label: 'Badge', color: Colors.violet),
          Badge(label: 'Badge', color: Colors.indigo),
          Badge(label: 'Badge', color: Colors.blue),
          Badge(label: 'Badge', color: Colors.cyan),
          Badge(label: 'Badge', color: Colors.teal),
          Badge(label: 'Badge', color: Colors.green),
          Badge(label: 'Badge', color: Colors.lime),
          Badge(label: 'Badge', color: Colors.yellow),
          Badge(label: 'Badge', color: Colors.orange),
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
        color: Colors.blue,
        label: 'Badge',
      ),
    );
    testGolden(
      'badge-variant-filled',
      (_) => Badge(
        variant: BadgeVariant.filled,
        color: Colors.blue,
        label: 'Badge',
      ),
    );
    testGolden(
      'badge-variant-outline',
      (_) => Badge(
        variant: BadgeVariant.outline,
        color: Colors.blue,
        label: 'Badge',
      ),
    );
  });
}
