import 'package:flutter/material.dart';
import 'package:rise_ui/src/foundation/customizable_property.dart';

enum BoxState {
  normal,
  hovered,
  pressed,
  disabled,
}

class BoxStateColor extends CustomizableProperty<Color, Set<BoxState>> {
  const BoxStateColor({
    this.color,
    this.colorShade,
    this.colorOpacity,
    this.hoveredColor,
    this.hoveredColorShade,
    this.hoveredColorOpacity,
    this.pressedColor,
    this.pressedColorShade,
    this.pressedColorOpacity,
    this.disabledColor,
    this.disabledColorShade,
    this.disabledColorOpacity,
  });

  final Color? color;
  final int? colorShade;
  final double? colorOpacity;

  final Color? hoveredColor;
  final int? hoveredColorShade;
  final double? hoveredColorOpacity;

  final Color? pressedColor;
  final int? pressedColorShade;
  final double? pressedColorOpacity;

  final Color? disabledColor;
  final int? disabledColorShade;
  final double? disabledColorOpacity;

  @override
  Color resolve(Set<BoxState> states) {
    Color? seedColor;
    int? seedColorShade;
    double? seedColorOpacity;
    if (states.contains(BoxState.disabled)) {
      seedColor = disabledColor ?? color;
      seedColorShade = disabledColorShade;
      seedColorOpacity = disabledColorOpacity;
    } else if (states.contains(BoxState.pressed)) {
      seedColor = pressedColor ?? color;
      seedColorShade = pressedColorShade;
      seedColorOpacity = pressedColorOpacity;
    } else if (states.contains(BoxState.hovered)) {
      seedColor = hoveredColor ?? color;
      seedColorShade = hoveredColorShade;
      seedColorOpacity = hoveredColorOpacity;
    } else {
      seedColor = color;
      seedColorShade = colorShade;
      seedColorOpacity = colorOpacity;
    }
    Color resolvedColor = seedColor ?? Colors.black;
    if (seedColor is MaterialColor && seedColorShade != null) {
      if (seedColorShade != -1) {
        resolvedColor = seedColor[seedColorShade]!;
      } else {
        resolvedColor = Colors.transparent;
      }
    }
    if (seedColorOpacity != null) {
      resolvedColor = resolvedColor.withOpacity(seedColorOpacity);
    }
    return resolvedColor;
  }

  BoxStateColor copyWith({
    Color? color,
    int? colorShade,
    double? colorOpacity,
    Color? hoveredColor,
    int? hoveredColorShade,
    double? hoveredColorOpacity,
    Color? pressedColor,
    int? pressedColorShade,
    double? pressedColorOpacity,
    Color? disabledColor,
    int? disabledColorShade,
    double? disabledColorOpacity,
  }) {
    return BoxStateColor(
      color: color ?? this.color,
      colorShade: colorShade ?? this.colorShade,
      colorOpacity: colorOpacity ?? this.colorOpacity,
      hoveredColor: hoveredColor ?? this.hoveredColor,
      hoveredColorShade: hoveredColorShade ?? this.hoveredColorShade,
      hoveredColorOpacity: hoveredColorOpacity ?? this.hoveredColorOpacity,
      pressedColor: pressedColor ?? this.pressedColor,
      pressedColorShade: pressedColorShade ?? this.pressedColorShade,
      pressedColorOpacity: pressedColorOpacity ?? this.pressedColorOpacity,
      disabledColor: disabledColor ?? this.disabledColor,
      disabledColorShade: disabledColorShade ?? this.disabledColorShade,
      disabledColorOpacity: disabledColorOpacity ?? this.disabledColorOpacity,
    );
  }
}
