import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/extended_theme/extended_theme.dart';

final influxDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ExtendedColors.blue,
  primaryColorDark: ExtendedColors.blue,
  colorScheme: const ColorScheme.dark(
    primary: ExtendedColors.blue,
    background: ExtendedColors.black,
    surface: ExtendedColors.black,
    outline: ExtendedColors.black,
  ),
  extensions: const [
    ExtendedThemeData(
      brightness: Brightness.dark,
    ),
  ],
);
