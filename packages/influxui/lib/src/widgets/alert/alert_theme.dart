// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/alert/alert_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'alert_theme.tailor.dart';

@TailorMixin()
class AlertThemeData extends ThemeExtension<AlertThemeData>
    with DiagnosticableTreeMixin, _$AlertThemeDataTailorMixin {
  const AlertThemeData({
    this.successStyle,
    this.infoStyle,
    this.warningStyle,
    this.dangerStyle,
  });

  final AlertStyle? successStyle;
  final AlertStyle? infoStyle;
  final AlertStyle? warningStyle;
  final AlertStyle? dangerStyle;
}

class AlertTheme extends InheritedTheme {
  const AlertTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final AlertThemeData data;

  static AlertThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AlertTheme>();
    return theme?.data ?? Theme.of(context).extension<AlertThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AlertTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AlertTheme oldWidget) => data != oldWidget.data;
}
