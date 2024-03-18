import 'dart:ui';

import 'package:flutter/material.dart' as md;
import 'package:influxui/influxui.dart';

final darkThemeData = md.ThemeData.dark().copyWith(
  scaffoldBackgroundColor: md.Colors.black,
  extensions: [
    const ExtendedThemeData(
      brightness: Brightness.light,
    ),
  ],
);
