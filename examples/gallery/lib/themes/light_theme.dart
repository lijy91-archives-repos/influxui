import 'dart:ui';

import 'package:flutter/material.dart' as md;
import 'package:influxui/influxui.dart';

final lightThemeData = md.ThemeData(
  colorScheme: md.ColorScheme.light(
    primary: ExtendedColors.indigo,
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
