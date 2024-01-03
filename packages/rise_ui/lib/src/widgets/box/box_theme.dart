// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rise_ui/src/widgets/box/box_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'box_theme.tailor.dart';

@TailorMixin()
class BoxThemeData extends ThemeExtension<BoxThemeData>
    with DiagnosticableTreeMixin, _$BoxThemeDataTailorMixin {
  const BoxThemeData({
    this.filledStyle,
    this.lightStyle,
    this.outlineStyle,
    this.subtleStyle,
    this.transparentStyle,
    this.whiteStyle,
  });

  final BoxStyle? filledStyle;
  final BoxStyle? lightStyle;
  final BoxStyle? outlineStyle;
  final BoxStyle? subtleStyle;
  final BoxStyle? transparentStyle;
  final BoxStyle? whiteStyle;
}

class BoxTheme extends InheritedTheme {
  const BoxTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final BoxThemeData data;

  static BoxThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<BoxTheme>();
    return theme?.data ?? Theme.of(context).extension<BoxThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BoxTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BoxTheme oldWidget) => data != oldWidget.data;
}
