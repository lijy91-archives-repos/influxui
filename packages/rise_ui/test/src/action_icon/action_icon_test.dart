// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

class MaterialIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => md.Icons.chevron_left;

  @override
  IconData get chevron_right => md.Icons.chevron_right;

  @override
  IconData get square => md.Icons.square;
}

void main() {
  Icons.iconLibrary = MaterialIconLibrary();
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
