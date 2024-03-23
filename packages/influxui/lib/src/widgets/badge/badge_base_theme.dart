// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/badge/badge_base_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'badge_base_theme.tailor.dart';

@TailorMixin()
class BadgeBaseThemeData extends ThemeExtension<BadgeBaseThemeData>
    with DiagnosticableTreeMixin, _$BadgeBaseThemeDataTailorMixin {
  const BadgeBaseThemeData({
    this.filledStyle,
    this.lightStyle,
    this.outlinedStyle,
    this.subtleStyle,
    this.transparentStyle,
  });

  final BadgeBaseStyle? filledStyle;
  final BadgeBaseStyle? outlinedStyle;
  final BadgeBaseStyle? lightStyle;
  final BadgeBaseStyle? subtleStyle;
  final BadgeBaseStyle? transparentStyle;
}

class BadgeBaseTheme extends InheritedTheme {
  const BadgeBaseTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final BadgeBaseThemeData data;

  static BadgeBaseThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<BadgeBaseTheme>();
    return theme?.data ?? Theme.of(context).extension<BadgeBaseThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeBaseTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BadgeBaseTheme oldWidget) => data != oldWidget.data;
}
