import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon_style.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon_theme.dart';

const _defaults = ActionIconThemeData(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  pressedOpacity: 0.8,
  tinyStyle: ActionIconStyle(
    size: Size(18, 18),
    iconSize: 12,
  ),
  smallStyle: ActionIconStyle(
    size: Size(22, 22),
    iconSize: 16,
  ),
  mediumStyle: ActionIconStyle(
    size: Size(28, 28),
    iconSize: 20,
  ),
  largeStyle: ActionIconStyle(
    size: Size(34, 34),
    iconSize: 24,
  ),
  bigStyle: ActionIconStyle(
    size: Size(44, 44),
    iconSize: 32,
  ),
);

const kDarkActionIconThemeDefaults = _defaults;

const kLightActionIconThemeDefaults = _defaults;
