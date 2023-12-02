// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'checkbox_theme.tailor.dart';

@TailorMixin()
class CheckboxThemeData extends ThemeExtension<CheckboxThemeData>
    with DiagnosticableTreeMixin, _$CheckboxThemeDataTailorMixin {
  const CheckboxThemeData({
    this.color,
  });

  final Color? color;
}

class CheckboxTheme extends InheritedTheme {
  const CheckboxTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final CheckboxThemeData data;

  static CheckboxThemeData of(BuildContext context) {
    return context.checkboxThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CheckboxTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(CheckboxTheme oldWidget) => data != oldWidget.data;
}
