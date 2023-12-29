// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'navigation_rail_theme.tailor.dart';

@TailorMixin()
class NavigationRailThemeData extends ThemeExtension<NavigationRailThemeData>
    with DiagnosticableTreeMixin, _$NavigationRailThemeDataTailorMixin {
  const NavigationRailThemeData({
    this.unselectedIconTheme,
    this.unselectedLabelStyle,
    this.selectedIconTheme,
    this.selectedLabelStyle,
    this.indicatorColor,
    this.indicatorShape,
  });

  final IconThemeData? unselectedIconTheme;

  final TextStyle? unselectedLabelStyle;

  final IconThemeData? selectedIconTheme;

  final TextStyle? selectedLabelStyle;

  final Color? indicatorColor;

  final ShapeBorder? indicatorShape;
}

class NavigationRailTheme extends InheritedTheme {
  const NavigationRailTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final NavigationRailThemeData data;

  static NavigationRailThemeData of(BuildContext context) {
    return context.navigationRailThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return NavigationRailTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(NavigationRailTheme oldWidget) =>
      data != oldWidget.data;
}
