import 'package:flutter/material.dart' as md;
import 'package:rise_ui/rise_ui.dart';

final darkThemeData = md.ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  extensions: [
    kDarkActionIconThemeDefaults,
    kDarkBoxThemeDefaults,
    kDarkButtonThemeDefaults,
    kDarkDividerThemeDefaults,
    kDarkKbdThemeDefaults,
    kDarkLoaderThemeDefaults,
    kDarkNavigationRailThemeDefaults,
    kDarkNotificationThemeDefaults,
  ],
);
