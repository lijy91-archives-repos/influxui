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
  ActionIconStyle? get smallStyle;
  ActionIconStyle? get mediumStyle;
  ActionIconStyle? get largeStyle;

  @override
  ActionIconThemeData copyWith({
    BorderRadius? borderRadius,
    double? pressedOpacity,
    ActionIconStyle? smallStyle,
    ActionIconStyle? mediumStyle,
    ActionIconStyle? largeStyle,
  }) {
    return ActionIconThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
    );
  }

  @override
  ActionIconThemeData lerp(
      covariant ThemeExtension<ActionIconThemeData>? other, double t) {
    if (other is! ActionIconThemeData) return this as ActionIconThemeData;
    return ActionIconThemeData(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      pressedOpacity: t < 0.5 ? pressedOpacity : other.pressedOpacity,
      smallStyle: t < 0.5 ? smallStyle : other.smallStyle,
      mediumStyle: t < 0.5 ? mediumStyle : other.mediumStyle,
      largeStyle: t < 0.5 ? largeStyle : other.largeStyle,
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
            const DeepCollectionEquality()
                .equals(smallStyle, other.smallStyle) &&
            const DeepCollectionEquality()
                .equals(mediumStyle, other.mediumStyle) &&
            const DeepCollectionEquality()
                .equals(largeStyle, other.largeStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(pressedOpacity),
      const DeepCollectionEquality().hash(smallStyle),
      const DeepCollectionEquality().hash(mediumStyle),
      const DeepCollectionEquality().hash(largeStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ActionIconThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('pressedOpacity', pressedOpacity))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle));
  }
}

extension ActionIconThemeDataBuildContextProps on BuildContext {
  ActionIconThemeData get actionIconThemeData =>
      Theme.of(this).extension<ActionIconThemeData>()!;
  BorderRadius? get borderRadius => actionIconThemeData.borderRadius;
  double get pressedOpacity => actionIconThemeData.pressedOpacity;
  ActionIconStyle? get smallStyle => actionIconThemeData.smallStyle;
  ActionIconStyle? get mediumStyle => actionIconThemeData.mediumStyle;
  ActionIconStyle? get largeStyle => actionIconThemeData.largeStyle;
}
