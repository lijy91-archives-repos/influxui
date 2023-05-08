import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('action-icon-goldens', () {
    // Variants
    testGolden(
      'action-icon-variant-transparent',
      (_) => ActionIcon(
        Icons.square,
        variant: ActionIconVariant.transparent,
      ),
    );
    testGolden(
      'action-icon-variant-subtle',
      (_) => ActionIcon(
        Icons.square,
        variant: ActionIconVariant.subtle,
      ),
    );
    testGolden(
      'action-icon-variant-light',
      (_) => ActionIcon(
        Icons.square,
        variant: ActionIconVariant.light,
      ),
    );
    testGolden(
      'action-icon-variant-filled',
      (_) => ActionIcon(
        Icons.square,
        variant: ActionIconVariant.filled,
      ),
    );
    testGolden(
      'action-icon-variant-outline',
      (_) => ActionIcon(
        Icons.square,
        variant: ActionIconVariant.outline,
      ),
    );
  });
}
