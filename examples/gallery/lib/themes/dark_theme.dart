import 'dart:ui';

import 'package:flutter/material.dart' as md;
import 'package:rise_ui/rise_ui.dart';

final darkThemeData = md.ThemeData.dark().copyWith(
  scaffoldBackgroundColor: md.Colors.black,
  extensions: [
    ExtendedThemeData(
      brightness: Brightness.light,
      primaryColor: ExtendedColors.blue,
    ),
    kDarkButtonThemeDefaults,
    kDarkDividerThemeDefaults,
    kDarkKbdThemeDefaults,
    kDarkLoaderThemeDefaults,
    kDarkNavigationRailThemeDefaults,
    kDarkNotificationThemeDefaults,
  ],
);
