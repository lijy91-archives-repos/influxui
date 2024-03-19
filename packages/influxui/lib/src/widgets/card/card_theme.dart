// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'card_theme.tailor.dart';

@TailorMixin()
class InfluxCardThemeData extends ThemeExtension<InfluxCardThemeData>
    with DiagnosticableTreeMixin, _$InfluxCardThemeDataTailorMixin {
  const InfluxCardThemeData({
    this.borderRadius,
  });

  final BorderRadius? borderRadius;
}

class InfluxCardTheme extends InheritedTheme {
  const InfluxCardTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final InfluxCardThemeData data;

  static InfluxCardThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<InfluxCardTheme>();
    return theme?.data ?? Theme.of(context).extension<InfluxCardThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return InfluxCardTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(InfluxCardTheme oldWidget) => data != oldWidget.data;
}
