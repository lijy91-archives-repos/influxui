import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/button/button_style.dart';
import 'package:rise_ui/src/widgets/button/button_theme.dart';

const _defaults = ButtonThemeData(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  pressedOpacity: 0.8,
  tinyStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 6),
    minimumSize: Size.square(18),
    iconSize: 12,
    labelStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ),
  smallStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 8),
    minimumSize: Size.square(22),
    iconSize: 16,
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  ),
  mediumStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 10),
    minimumSize: Size.square(28),
    iconSize: 20,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
  largeStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 12),
    minimumSize: Size.square(34),
    iconSize: 24,
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  bigStyle: ButtonStyle(
    padding: EdgeInsets.symmetric(horizontal: 14),
    minimumSize: Size.square(44),
    iconSize: 32,
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);

const kDarkButtonThemeDefaults = _defaults;

const kLightButtonThemeDefaults = _defaults;
