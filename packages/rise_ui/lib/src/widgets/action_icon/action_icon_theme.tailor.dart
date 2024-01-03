// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'action_icon_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ActionIconThemeDataTailorMixin
    on ThemeExtension<ActionIconThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;
  double get pressedOpacity;
  ActionIconStyle? get tinyStyle;
  ActionIconStyle? get smallStyle;
  ActionIconStyle? get mediumStyle;
  ActionIconStyle? get largeStyle;
  ActionIconStyle? get bigStyle;

  @override
  ActionIconThemeData copyWith({
    BorderRadius? borderRadius,
    double? pressedOpacity,
    ActionIconStyle? tinyStyle,
    ActionIconStyle? smallStyle,
    ActionIconStyle? mediumStyle,
    ActionIconStyle? largeStyle,
    ActionIconStyle? bigStyle,
  }) {
    return ActionIconThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      tinyStyle: tinyStyle ?? this.tinyStyle,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
      bigStyle: bigStyle ?? this.bigStyle,
    );
  }

  @override
  ActionIconThemeData lerp(
      covariant ThemeExtension<ActionIconThemeData>? other, double t) {
    if (other is! ActionIconThemeData) return this as ActionIconThemeData;
    return ActionIconThemeData(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      pressedOpacity: t < 0.5 ? pressedOpacity : other.pressedOpacity,
      tinyStyle: t < 0.5 ? tinyStyle : other.tinyStyle,
      smallStyle: t < 0.5 ? smallStyle : other.smallStyle,
      mediumStyle: t < 0.5 ? mediumStyle : other.mediumStyle,
      largeStyle: t < 0.5 ? largeStyle : other.largeStyle,
      bigStyle: t < 0.5 ? bigStyle : other.bigStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionIconThemeData &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(pressedOpacity, other.pressedOpacity) &&
            const DeepCollectionEquality().equals(tinyStyle, other.tinyStyle) &&
            const DeepCollectionEquality()
                .equals(smallStyle, other.smallStyle) &&
            const DeepCollectionEquality()
                .equals(mediumStyle, other.mediumStyle) &&
            const DeepCollectionEquality()
                .equals(largeStyle, other.largeStyle) &&
            const DeepCollectionEquality().equals(bigStyle, other.bigStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(pressedOpacity),
      const DeepCollectionEquality().hash(tinyStyle),
      const DeepCollectionEquality().hash(smallStyle),
      const DeepCollectionEquality().hash(mediumStyle),
      const DeepCollectionEquality().hash(largeStyle),
      const DeepCollectionEquality().hash(bigStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ActionIconThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('pressedOpacity', pressedOpacity))
      ..add(DiagnosticsProperty('tinyStyle', tinyStyle))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle))
      ..add(DiagnosticsProperty('bigStyle', bigStyle));
  }
}

extension ActionIconThemeDataBuildContextProps on BuildContext {
  ActionIconThemeData get actionIconThemeData =>
      Theme.of(this).extension<ActionIconThemeData>()!;
  BorderRadius? get borderRadius => actionIconThemeData.borderRadius;
  double get pressedOpacity => actionIconThemeData.pressedOpacity;
  ActionIconStyle? get tinyStyle => actionIconThemeData.tinyStyle;
  ActionIconStyle? get smallStyle => actionIconThemeData.smallStyle;
  ActionIconStyle? get mediumStyle => actionIconThemeData.mediumStyle;
  ActionIconStyle? get largeStyle => actionIconThemeData.largeStyle;
  ActionIconStyle? get bigStyle => actionIconThemeData.bigStyle;
}
