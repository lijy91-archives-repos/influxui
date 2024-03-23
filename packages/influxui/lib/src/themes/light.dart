import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/extended_theme/extended_theme.dart';

final influxLight = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: ExtendedColors.blue,
    background: ExtendedColors.gray.shade100,
    surface: ExtendedColors.white,
    outline: ExtendedColors.gray.shade200,
  ),
  extensions: const [
    ExtendedThemeData(
      brightness: Brightness.light,
    ),
  ],
);
