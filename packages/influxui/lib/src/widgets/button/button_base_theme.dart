// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/button/button_base_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'button_base_theme.tailor.dart';

@TailorMixin()
class ButtonBaseThemeData extends ThemeExtension<ButtonBaseThemeData>
    with DiagnosticableTreeMixin, _$ButtonBaseThemeDataTailorMixin {
  const ButtonBaseThemeData({
    this.filledStyle,
    this.lightStyle,
    this.outlineStyle,
    this.subtleStyle,
    this.transparentStyle,
    this.whiteStyle,
  });

  final ButtonBaseStyle? filledStyle;
  final ButtonBaseStyle? lightStyle;
  final ButtonBaseStyle? outlineStyle;
  final ButtonBaseStyle? subtleStyle;
  final ButtonBaseStyle? transparentStyle;
  final ButtonBaseStyle? whiteStyle;
}

class ButtonBaseTheme extends InheritedTheme {
  const ButtonBaseTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ButtonBaseThemeData data;

  static ButtonBaseThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ButtonBaseTheme>();
    return theme?.data ?? Theme.of(context).extension<ButtonBaseThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonBaseTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ButtonBaseTheme oldWidget) => data != oldWidget.data;
}
