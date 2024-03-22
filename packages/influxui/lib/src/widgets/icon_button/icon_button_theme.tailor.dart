// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$IconButtonThemeDataTailorMixin
    on ThemeExtension<IconButtonThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;
  double get pressedOpacity;
  IconButtonStyle? get smallStyle;
  IconButtonStyle? get mediumStyle;
  IconButtonStyle? get largeStyle;

  @override
  IconButtonThemeData copyWith({
    BorderRadius? borderRadius,
    double? pressedOpacity,
    IconButtonStyle? smallStyle,
    IconButtonStyle? mediumStyle,
    IconButtonStyle? largeStyle,
  }) {
    return IconButtonThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
    );
  }

  @override
  IconButtonThemeData lerp(
      covariant ThemeExtension<IconButtonThemeData>? other, double t) {
    if (other is! IconButtonThemeData) return this as IconButtonThemeData;
    return IconButtonThemeData(
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
            other is IconButtonThemeData &&
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
      ..add(DiagnosticsProperty('type', 'IconButtonThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('pressedOpacity', pressedOpacity))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle));
  }
}

extension IconButtonThemeDataBuildContextProps on BuildContext {
  IconButtonThemeData get actionIconThemeData =>
      Theme.of(this).extension<IconButtonThemeData>()!;
  BorderRadius? get borderRadius => actionIconThemeData.borderRadius;
  double get pressedOpacity => actionIconThemeData.pressedOpacity;
  IconButtonStyle? get smallStyle => actionIconThemeData.smallStyle;
  IconButtonStyle? get mediumStyle => actionIconThemeData.mediumStyle;
  IconButtonStyle? get largeStyle => actionIconThemeData.largeStyle;
}
