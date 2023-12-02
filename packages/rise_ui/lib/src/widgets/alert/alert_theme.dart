// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'alert_theme.tailor.dart';

@TailorMixin()
class AlertTheme extends ThemeExtension<AlertTheme>
    with DiagnosticableTreeMixin, _$AlertThemeTailorMixin {
  const AlertTheme({
    required this.titleStyle,
    required this.messageStyle,
    required this.iconColor,
    required this.iconSize,
  });

  final TextStyle titleStyle;

  final TextStyle messageStyle;

  final Color iconColor;

  final double iconSize;
}
