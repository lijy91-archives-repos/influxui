import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/divider/divider_style.dart';
import 'package:rise_ui/src/widgets/divider/divider_theme.dart';
import 'package:rise_ui/src/widgets/theme/extended_colors.dart';

const _defaults = DividerThemeData(
  color: ExtendedColors.gray,
  tinyStyle: DividerStyle(
    padding: EdgeInsets.symmetric(horizontal: 6),
    minimumSize: Size.square(18),
    iconSize: 12,
    labelStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ),
  smallStyle: DividerStyle(
    padding: EdgeInsets.symmetric(horizontal: 8),
    minimumSize: Size.square(22),
    iconSize: 16,
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  ),
  mediumStyle: DividerStyle(
    padding: EdgeInsets.symmetric(horizontal: 10),
    minimumSize: Size.square(28),
    iconSize: 20,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
  largeStyle: DividerStyle(
    padding: EdgeInsets.symmetric(horizontal: 12),
    minimumSize: Size.square(34),
    iconSize: 24,
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  bigStyle: DividerStyle(
    padding: EdgeInsets.symmetric(horizontal: 14),
    minimumSize: Size.square(44),
    iconSize: 32,
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);

const kDarkDividerThemeDefaults = _defaults;

const kLightDividerThemeDefaults = _defaults;
