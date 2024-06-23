import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/extended_theme/extended_theme.dart';

final influxDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ExtendedColors.blue,
  primaryColorDark: ExtendedColors.blue,
  scaffoldBackgroundColor: ExtendedColors.neutral.shade900,
  colorScheme: ColorScheme.dark(
    primary: ExtendedColors.blue,
    surface: ExtendedColors.neutral.shade900,
    surfaceContainerLow: ExtendedColors.neutral.shade800,
    outline: ExtendedColors.neutral.shade700.withOpacity(0.6),
  ),
  extensions: const [
    ExtendedThemeData(
      brightness: Brightness.dark,
    ),
  ],
);
