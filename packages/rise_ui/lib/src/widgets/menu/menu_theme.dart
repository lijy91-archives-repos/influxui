// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'menu_theme.tailor.dart';

@TailorMixin()
class MenuThemeData extends ThemeExtension<MenuThemeData>
    with DiagnosticableTreeMixin, _$MenuThemeDataTailorMixin {
  const MenuThemeData({
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

class MenuTheme extends InheritedTheme {
  const MenuTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MenuThemeData data;

  static MenuThemeData of(BuildContext context) {
    return context.menuThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MenuTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MenuTheme oldWidget) =>
      data != oldWidget.data;
}
