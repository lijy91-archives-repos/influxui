// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/icon_button/icon_button_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'icon_button_theme.tailor.dart';

@TailorMixin()
class IconButtonThemeData extends ThemeExtension<IconButtonThemeData>
    with DiagnosticableTreeMixin, _$IconButtonThemeDataTailorMixin {
  const IconButtonThemeData({
    this.pressedOpacity = 0.8,
    this.tinyStyle,
    this.smallStyle,
    this.mediumStyle,
    this.largeStyle,
    this.bigStyle,
  });

  final double pressedOpacity;

  final IconButtonStyle? tinyStyle;
  final IconButtonStyle? smallStyle;
  final IconButtonStyle? mediumStyle;
  final IconButtonStyle? largeStyle;
  final IconButtonStyle? bigStyle;
}

class IconButtonTheme extends InheritedTheme {
  const IconButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final IconButtonThemeData data;

  static IconButtonThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<IconButtonTheme>();
    return theme?.data ?? Theme.of(context).extension<IconButtonThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return IconButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(IconButtonTheme oldWidget) => data != oldWidget.data;
}
