import 'dart:ui';

import 'package:flutter/material.dart' as md;
import 'package:rise_ui/rise_ui.dart';

final lightThemeData = md.ThemeData.light().copyWith(
  extensions: [
    ExtendedThemeData(
      brightness: Brightness.light,
      primaryColor: ExtendedColors.blue,
    ),
    kLightButtonThemeDefaults,
    kLightDividerThemeDefaults,
    kLightKbdThemeDefaults,
    kLightLoaderThemeDefaults,
    kLightNavigationRailThemeDefaults,
    kLightNotificationThemeDefaults,
  ],
);
