import 'package:flutter/material.dart' as md;
import 'package:rise_ui/rise_ui.dart';

const _kPrimaryColor = Colors.indigo;
const _kSecondaryColor = Colors.teal;

final lightThemeData = md.ThemeData(
  colorScheme: md.ColorScheme.fromSeed(
    seedColor: _kPrimaryColor,
    brightness: Brightness.light,
    primary: _kPrimaryColor,
    secondary: _kSecondaryColor,
  ),
  primaryColor: _kPrimaryColor,
);
