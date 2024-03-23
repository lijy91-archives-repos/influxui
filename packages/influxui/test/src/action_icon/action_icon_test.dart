// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' hide IconButton;
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

final _colors = [
  ExtendedColors.black,
  ExtendedColors.white,
  ExtendedColors.slate,
  ExtendedColors.gray,
  ExtendedColors.zinc,
  ExtendedColors.neutral,
  ExtendedColors.stone,
  ExtendedColors.red,
  ExtendedColors.orange,
  ExtendedColors.amber,
  ExtendedColors.yellow,
  ExtendedColors.lime,
  ExtendedColors.green,
  ExtendedColors.emerald,
  ExtendedColors.teal,
  ExtendedColors.cyan,
  ExtendedColors.sky,
  ExtendedColors.blue,
  ExtendedColors.indigo,
  ExtendedColors.violet,
  ExtendedColors.purple,
  ExtendedColors.fuchsia,
  ExtendedColors.pink,
  ExtendedColors.rose,
];

final _sizes = [
  IconButtonSize.small,
  IconButtonSize.medium,
  IconButtonSize.large,
];

class _MaterialIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => Icons.chevron_left;

  @override
  IconData get chevron_right => Icons.chevron_right;

  @override
  IconData get square => Icons.square;

  @override
  IconData get light_mode => throw UnimplementedError();

  @override
  IconData get dark_mode => throw UnimplementedError();
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({this.variant});

  final IconButtonVariant? variant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              Icons.wb_sunny_outlined,
              variant: variant,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final size in _sizes)
                  IconButton(
                    Icons.wb_sunny_outlined,
                    variant: variant,
                    size: size,
                    onPressed: () {},
                  ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 240,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final color in _colors)
                    IconButton(
                      Icons.wb_sunny_outlined,
                      variant: variant,
                      color: color,
                      onPressed: () {},
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  ExtendedIcons.iconLibrary = _MaterialIconLibrary();
  group('icon-button-goldens', () {
    // Variants
    testGolden(
      'icon-button-variant-transparent',
      (_) => const _TestWidget(
        variant: IconButtonVariant.transparent,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'icon-button-variant-subtle',
      (_) => const _TestWidget(
        variant: IconButtonVariant.subtle,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'icon-button-variant-light',
      (_) => const _TestWidget(
        variant: IconButtonVariant.light,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'icon-button-variant-filled',
      (_) => const _TestWidget(
        variant: IconButtonVariant.filled,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'icon-button-variant-outlined',
      (_) => const _TestWidget(
        variant: IconButtonVariant.outlined,
      ),
      size: const Size(300, 200),
    );
  });
}
