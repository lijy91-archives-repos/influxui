// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/badge/badge_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'badge_theme.tailor.dart';

@TailorMixin()
class BadgeThemeData extends ThemeExtension<BadgeThemeData>
    with DiagnosticableTreeMixin, _$BadgeThemeDataTailorMixin {
  const BadgeThemeData({
    this.padding,
    this.borderRadius,
    this.tinyStyle,
    this.smallStyle,
    this.mediumStyle,
    this.largeStyle,
    this.bigStyle,
  });

  final EdgeInsetsGeometry? padding;

  final BorderRadius? borderRadius;

  final BadgeStyle? tinyStyle;
  final BadgeStyle? smallStyle;
  final BadgeStyle? mediumStyle;
  final BadgeStyle? largeStyle;
  final BadgeStyle? bigStyle;
}

class BadgeTheme extends InheritedTheme {
  const BadgeTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final BadgeThemeData data;

  static BadgeThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<BadgeTheme>();
    return theme?.data ?? Theme.of(context).extension<BadgeThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) => data != oldWidget.data;
}
