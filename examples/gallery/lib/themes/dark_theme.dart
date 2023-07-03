import 'package:flutter/material.dart' as md;
import 'package:rise_ui/rise_ui.dart';

const _kPrimaryColor = Colors.indigo;
const _kSecondaryColor = Colors.teal;

final darkThemeData = md.ThemeData(
  useMaterial3: true,
  colorScheme: md.ColorScheme.fromSeed(
    seedColor: _kPrimaryColor,
    brightness: Brightness.dark,
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
    background: Colors.darkGray.shade700,
  ),
  primaryColor: _kPrimaryColor,
);
