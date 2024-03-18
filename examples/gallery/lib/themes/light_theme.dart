import 'dart:ui';

import 'package:flutter/material.dart' as md;
import 'package:influxui/influxui.dart';

final lightThemeData = md.ThemeData.light().copyWith(
  extensions: [
    const ExtendedThemeData(
      brightness: Brightness.light,
    ),
  ],
);
