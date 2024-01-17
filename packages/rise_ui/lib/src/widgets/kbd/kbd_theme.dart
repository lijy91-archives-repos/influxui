// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'kbd_theme.tailor.dart';

@TailorMixin()
class KbdThemeData extends ThemeExtension<KbdThemeData>
    with DiagnosticableTreeMixin, _$KbdThemeDataTailorMixin {
  const KbdThemeData({
    this.color,
    this.borderColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.labelColor,
    this.smallStyle,
    this.mediumStyle,
    this.largeStyle,
  });

  final Color? color;

  final Color? labelColor;

  final Color? borderColor;

  final BorderRadius? borderRadius;

  final KbdStyle? smallStyle;
  final KbdStyle? mediumStyle;
  final KbdStyle? largeStyle;
}

class KbdTheme extends InheritedTheme {
  const KbdTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final KbdThemeData data;

  static KbdThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<KbdTheme>();
    return theme?.data ?? Theme.of(context).extension<KbdThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return KbdTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(KbdTheme oldWidget) => data != oldWidget.data;
}
