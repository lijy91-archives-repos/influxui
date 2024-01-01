// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'badge_theme.tailor.dart';

@TailorMixin()
class BadgeThemeData extends ThemeExtension<BadgeThemeData>
    with DiagnosticableTreeMixin, _$BadgeThemeDataTailorMixin {
  const BadgeThemeData({
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

  final ActionIconStyle tinyStyle;
  final ActionIconStyle smallStyle;
  final ActionIconStyle mediumStyle;
  final ActionIconStyle largeStyle;
  final ActionIconStyle bigStyle;
}

class BadgeTheme extends InheritedTheme {
  const BadgeTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final BadgeThemeData data;

  static BadgeThemeData of(BuildContext context) {
    return context.badgeThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) => data != oldWidget.data;
}
