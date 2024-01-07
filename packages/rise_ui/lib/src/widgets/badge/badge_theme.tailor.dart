// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'badge_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BadgeThemeDataTailorMixin
    on ThemeExtension<BadgeThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;
  double get pressedOpacity;
  BadgeStyle? get tinyStyle;
  BadgeStyle? get smallStyle;
  BadgeStyle? get mediumStyle;
  BadgeStyle? get largeStyle;
  BadgeStyle? get bigStyle;

  @override
  BadgeThemeData copyWith({
    BorderRadius? borderRadius,
    double? pressedOpacity,
    BadgeStyle? tinyStyle,
    BadgeStyle? smallStyle,
    BadgeStyle? mediumStyle,
    BadgeStyle? largeStyle,
    BadgeStyle? bigStyle,
  }) {
    return BadgeThemeData(
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
  BadgeThemeData lerp(
      covariant ThemeExtension<BadgeThemeData>? other, double t) {
    if (other is! BadgeThemeData) return this as BadgeThemeData;
    return BadgeThemeData(
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
            other is BadgeThemeData &&
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
      ..add(DiagnosticsProperty('type', 'BadgeThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('pressedOpacity', pressedOpacity))
      ..add(DiagnosticsProperty('tinyStyle', tinyStyle))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle))
      ..add(DiagnosticsProperty('bigStyle', bigStyle));
  }
}

extension BadgeThemeDataBuildContextProps on BuildContext {
  BadgeThemeData get badgeThemeData =>
      Theme.of(this).extension<BadgeThemeData>()!;
  BorderRadius? get borderRadius => badgeThemeData.borderRadius;
  double get pressedOpacity => badgeThemeData.pressedOpacity;
  BadgeStyle? get tinyStyle => badgeThemeData.tinyStyle;
  BadgeStyle? get smallStyle => badgeThemeData.smallStyle;
  BadgeStyle? get mediumStyle => badgeThemeData.mediumStyle;
  BadgeStyle? get largeStyle => badgeThemeData.largeStyle;
  BadgeStyle? get bigStyle => badgeThemeData.bigStyle;
}
