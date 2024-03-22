// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'card_theme.tailor.dart';

@TailorMixin()
class CardThemeData extends ThemeExtension<CardThemeData>
    with DiagnosticableTreeMixin, _$CardThemeDataTailorMixin {
  const CardThemeData({
    this.borderRadius,
  });

  final BorderRadius? borderRadius;
}

class CardTheme extends InheritedTheme {
  const CardTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final CardThemeData data;

  static CardThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<CardTheme>();
    return theme?.data ?? Theme.of(context).extension<CardThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CardTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(CardTheme oldWidget) => data != oldWidget.data;
}
