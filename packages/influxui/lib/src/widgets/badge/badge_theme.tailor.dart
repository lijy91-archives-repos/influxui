// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'badge_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BadgeThemeDataTailorMixin
    on ThemeExtension<BadgeThemeData>, DiagnosticableTreeMixin {
  EdgeInsetsGeometry? get padding;
  BorderRadius? get borderRadius;
  BadgeStyle? get tinyStyle;
  BadgeStyle? get smallStyle;
  BadgeStyle? get mediumStyle;
  BadgeStyle? get largeStyle;
  BadgeStyle? get bigStyle;

  @override
  BadgeThemeData copyWith({
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    BadgeStyle? tinyStyle,
    BadgeStyle? smallStyle,
    BadgeStyle? mediumStyle,
    BadgeStyle? largeStyle,
    BadgeStyle? bigStyle,
  }) {
    return BadgeThemeData(
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
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
      padding: t < 0.5 ? padding : other.padding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
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
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
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
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(borderRadius),
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
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
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
  EdgeInsetsGeometry? get padding => badgeThemeData.padding;
  BorderRadius? get borderRadius => badgeThemeData.borderRadius;
  BadgeStyle? get tinyStyle => badgeThemeData.tinyStyle;
  BadgeStyle? get smallStyle => badgeThemeData.smallStyle;
  BadgeStyle? get mediumStyle => badgeThemeData.mediumStyle;
  BadgeStyle? get largeStyle => badgeThemeData.largeStyle;
  BadgeStyle? get bigStyle => badgeThemeData.bigStyle;
}
