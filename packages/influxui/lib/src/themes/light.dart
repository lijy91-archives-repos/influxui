import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/extended_theme/extended_theme.dart';

final influxLight = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: ExtendedColors.blue,
    surface: ExtendedColors.gray.shade100,
    outline: ExtendedColors.gray.shade200,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ExtendedColors.gray.shade950,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ExtendedColors.gray.shade950,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ExtendedColors.gray.shade950,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: ExtendedColors.gray.shade950,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: ExtendedColors.gray.shade950,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: ExtendedColors.gray.shade950,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      color: ExtendedColors.gray.shade950,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      color: ExtendedColors.gray.shade950,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: ExtendedColors.gray.shade950,
    ),
  ),
  extensions: const [
    ExtendedThemeData(
      brightness: Brightness.light,
    ),
  ],
);
