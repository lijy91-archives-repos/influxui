// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

export './extended_colors.dart';
export './extended_icons.dart';
export './extended_shapes.dart';
export './extended_sizes.dart';
export './extended_theme_builder.dart';

part 'extended_theme.tailor.dart';

@TailorMixin()
class ExtendedThemeData extends ThemeExtension<ExtendedThemeData>
    with DiagnosticableTreeMixin, _$ExtendedThemeDataTailorMixin {
  const ExtendedThemeData({
    this.brightness,
  });

  final Brightness? brightness;
}

class ExtendedTheme extends InheritedTheme {
  const ExtendedTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ExtendedThemeData data;

  static ExtendedThemeData of(BuildContext context) {
    return context.extendedThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ExtendedTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ExtendedTheme oldWidget) => data != oldWidget.data;
}
