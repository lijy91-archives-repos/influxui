import 'package:rise_ui/src/widgets/box/box_state.dart';
import 'package:rise_ui/src/widgets/box/box_style.dart';
import 'package:rise_ui/src/widgets/box/box_theme.dart';
import 'package:rise_ui/src/widgets/theme/colors.dart';

const kDarkBoxThemeDefaults = BoxThemeData(
  filledStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: 600,
      hoveredColorShade: 700,
      pressedColorShade: 700,
    ),
    foregroundColor: BoxStateColor(
      color: Colors.white,
    ),
  ),
  lightStyle: BoxStyle(
    color: BoxStateColor(
      colorOpacity: 0.15,
      hoveredColorOpacity: 0.2,
      pressedColorOpacity: 0.2,
    ),
    foregroundColor: BoxStateColor(),
  ),
  outlineStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: -1,
      hoveredColorOpacity: 0.2,
      pressedColorOpacity: 0.2,
    ),
    foregroundColor: BoxStateColor(),
    borderColor: BoxStateColor(
      colorShade: 600,
    ),
  ),
  subtleStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: -1,
      hoveredColorOpacity: 0.2,
      pressedColorOpacity: 0.2,
    ),
    foregroundColor: BoxStateColor(),
  ),
  transparentStyle: BoxStyle(
    color: BoxStateColor(
      color: Colors.transparent,
    ),
    foregroundColor: BoxStateColor(),
  ),
  whiteStyle: BoxStyle(
    color: BoxStateColor(
      color: Colors.white,
      hoveredColorShade: 100,
    ),
    foregroundColor: BoxStateColor(),
  ),
);

const kLightBoxThemeDefaults = BoxThemeData(
  filledStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: 600,
      hoveredColorShade: 700,
      pressedColorShade: 700,
    ),
    foregroundColor: BoxStateColor(
      color: Colors.white,
    ),
  ),
  lightStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: 50,
      hoveredColorShade: 100,
      pressedColorShade: 100,
    ),
    foregroundColor: BoxStateColor(),
  ),
  outlineStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: -1,
      hoveredColorShade: 50,
      pressedColorShade: 50,
    ),
    foregroundColor: BoxStateColor(),
    borderColor: BoxStateColor(
      colorShade: 600,
    ),
  ),
  subtleStyle: BoxStyle(
    color: BoxStateColor(
      colorShade: -1,
      hoveredColorShade: 50,
      pressedColorShade: 50,
    ),
    foregroundColor: BoxStateColor(),
  ),
  transparentStyle: BoxStyle(
    color: BoxStateColor(
      color: Colors.transparent,
    ),
    foregroundColor: BoxStateColor(),
  ),
  whiteStyle: BoxStyle(
    color: BoxStateColor(
      color: Colors.white,
      hoveredColorShade: 100,
    ),
    foregroundColor: BoxStateColor(),
  ),
);
