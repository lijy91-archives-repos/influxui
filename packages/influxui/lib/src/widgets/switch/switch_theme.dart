// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'switch_theme.tailor.dart';

@TailorMixin()
class SwitchThemeData extends ThemeExtension<SwitchThemeData>
    with DiagnosticableTreeMixin, _$SwitchThemeDataTailorMixin {
  const SwitchThemeData({
    this.color,
  });

  final Color? color;
}

class SwitchTheme extends InheritedTheme {
  const SwitchTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final SwitchThemeData data;

  static SwitchThemeData of(BuildContext context) {
    return context.switchThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SwitchTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SwitchTheme oldWidget) => data != oldWidget.data;
}
