import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/button/button_style.dart';
import 'package:rise_ui/src/widgets/button/button_theme.dart';

const _defaults = ButtonThemeData(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  pressedOpacity: 0.8,
  tinyStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 14),
    minimumSize: Size.square(30),
    iconSize: 12,
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  ),
  smallStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 18),
    minimumSize: Size.square(36),
    iconSize: 16,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
  mediumStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 22),
    minimumSize: Size.square(42),
    iconSize: 20,
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  largeStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 26),
    minimumSize: Size.square(50),
    iconSize: 24,
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  bigStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 32),
    minimumSize: Size.square(60),
    iconSize: 32,
    labelStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
);

const kDarkButtonThemeDefaults = _defaults;

const kLightButtonThemeDefaults = _defaults;
