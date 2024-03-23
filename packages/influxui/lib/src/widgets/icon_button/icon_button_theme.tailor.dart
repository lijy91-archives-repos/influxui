// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$IconButtonThemeDataTailorMixin
    on ThemeExtension<IconButtonThemeData>, DiagnosticableTreeMixin {
  double get pressedOpacity;
  IconButtonStyle? get tinyStyle;
  IconButtonStyle? get smallStyle;
  IconButtonStyle? get mediumStyle;
  IconButtonStyle? get largeStyle;
  IconButtonStyle? get bigStyle;

  @override
  IconButtonThemeData copyWith({
    double? pressedOpacity,
    IconButtonStyle? tinyStyle,
    IconButtonStyle? smallStyle,
    IconButtonStyle? mediumStyle,
    IconButtonStyle? largeStyle,
    IconButtonStyle? bigStyle,
  }) {
    return IconButtonThemeData(
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      tinyStyle: tinyStyle ?? this.tinyStyle,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
      bigStyle: bigStyle ?? this.bigStyle,
    );
  }

  @override
  IconButtonThemeData lerp(
      covariant ThemeExtension<IconButtonThemeData>? other, double t) {
    if (other is! IconButtonThemeData) return this as IconButtonThemeData;
    return IconButtonThemeData(
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
            other is IconButtonThemeData &&
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
      ..add(DiagnosticsProperty('type', 'IconButtonThemeData'))
      ..add(DiagnosticsProperty('pressedOpacity', pressedOpacity))
      ..add(DiagnosticsProperty('tinyStyle', tinyStyle))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle))
      ..add(DiagnosticsProperty('bigStyle', bigStyle));
  }
}

extension IconButtonThemeDataBuildContextProps on BuildContext {
  IconButtonThemeData get iconButtonThemeData =>
      Theme.of(this).extension<IconButtonThemeData>()!;
  double get pressedOpacity => iconButtonThemeData.pressedOpacity;
  IconButtonStyle? get tinyStyle => iconButtonThemeData.tinyStyle;
  IconButtonStyle? get smallStyle => iconButtonThemeData.smallStyle;
  IconButtonStyle? get mediumStyle => iconButtonThemeData.mediumStyle;
  IconButtonStyle? get largeStyle => iconButtonThemeData.largeStyle;
  IconButtonStyle? get bigStyle => iconButtonThemeData.bigStyle;
}
