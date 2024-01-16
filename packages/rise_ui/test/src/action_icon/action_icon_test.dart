// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

final _colors = [
  ExtendedColors.gray,
  ExtendedColors.red,
  ExtendedColors.pink,
  ExtendedColors.grape,
  ExtendedColors.violet,
  ExtendedColors.indigo,
  ExtendedColors.blue,
  ExtendedColors.cyan,
  ExtendedColors.teal,
  ExtendedColors.green,
  ExtendedColors.lime,
  ExtendedColors.yellow,
];

final _sizes = [
  ActionIconSize.tiny,
  ActionIconSize.small,
  ActionIconSize.medium,
  ActionIconSize.large,
  ActionIconSize.big,
];

class _MaterialIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => md.Icons.chevron_left;

  @override
  IconData get chevron_right => md.Icons.chevron_right;

  @override
  IconData get square => md.Icons.square;

  @override
  IconData get light_mode => throw UnimplementedError();

  @override
  IconData get dark_mode => throw UnimplementedError();
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({this.variant});

  final ActionIconVariant? variant;

  @override
  Widget build(md.BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionIcon(
              md.Icons.wb_sunny_outlined,
              variant: variant,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final size in _sizes)
                  ActionIcon(
                    md.Icons.wb_sunny_outlined,
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
                    ActionIcon(
                      md.Icons.wb_sunny_outlined,
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
  group('action-icon-goldens', () {
    // Variants
    testGolden(
      'action-icon-variant-transparent',
      (_) => const _TestWidget(
        variant: ActionIconVariant.transparent,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'action-icon-variant-subtle',
      (_) => const _TestWidget(
        variant: ActionIconVariant.subtle,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'action-icon-variant-light',
      (_) => const _TestWidget(
        variant: ActionIconVariant.light,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'action-icon-variant-filled',
      (_) => const _TestWidget(
        variant: ActionIconVariant.filled,
      ),
      size: const Size(300, 200),
    );
    testGolden(
      'action-icon-variant-outline',
      (_) => const _TestWidget(
        variant: ActionIconVariant.outline,
      ),
      size: const Size(300, 200),
    );
  });
}
