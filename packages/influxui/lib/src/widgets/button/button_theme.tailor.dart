// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ButtonThemeDataTailorMixin
    on ThemeExtension<ButtonThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;
  double get pressedOpacity;
  ButtonStyle? get smallStyle;
  ButtonStyle? get mediumStyle;
  ButtonStyle? get largeStyle;

  @override
  ButtonThemeData copyWith({
    BorderRadius? borderRadius,
    double? pressedOpacity,
    ButtonStyle? smallStyle,
    ButtonStyle? mediumStyle,
    ButtonStyle? largeStyle,
  }) {
    return ButtonThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
    );
  }

  @override
  ButtonThemeData lerp(
      covariant ThemeExtension<ButtonThemeData>? other, double t) {
    if (other is! ButtonThemeData) return this as ButtonThemeData;
    return ButtonThemeData(
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
            other is ButtonThemeData &&
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
      ..add(DiagnosticsProperty('type', 'ButtonThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('pressedOpacity', pressedOpacity))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle));
  }
}

extension ButtonThemeDataBuildContextProps on BuildContext {
  ButtonThemeData get buttonThemeData =>
      Theme.of(this).extension<ButtonThemeData>()!;
  BorderRadius? get borderRadius => buttonThemeData.borderRadius;
  double get pressedOpacity => buttonThemeData.pressedOpacity;
  ButtonStyle? get smallStyle => buttonThemeData.smallStyle;
  ButtonStyle? get mediumStyle => buttonThemeData.mediumStyle;
  ButtonStyle? get largeStyle => buttonThemeData.largeStyle;
}
