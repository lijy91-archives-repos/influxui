// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/button/button_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'button_theme.tailor.dart';

@TailorMixin()
class ButtonThemeData extends ThemeExtension<ButtonThemeData>
    with DiagnosticableTreeMixin, _$ButtonThemeDataTailorMixin {
  const ButtonThemeData({
    this.borderRadius,
    this.pressedOpacity = 0.8,
    required this.tinyStyle,
    required this.smallStyle,
    required this.mediumStyle,
    required this.largeStyle,
    required this.bigStyle,
  });

  final BorderRadius? borderRadius;

  final double pressedOpacity;

  final ButtonStyle tinyStyle;
  final ButtonStyle smallStyle;
  final ButtonStyle mediumStyle;
  final ButtonStyle largeStyle;
  final ButtonStyle bigStyle;
}

class ButtonTheme extends InheritedTheme {
  const ButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ButtonThemeData data;

  static ButtonThemeData of(BuildContext context) {
    return context.buttonThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) => data != oldWidget.data;
}
