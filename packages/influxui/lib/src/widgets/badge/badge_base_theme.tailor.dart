// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'badge_base_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BadgeBaseThemeDataTailorMixin
    on ThemeExtension<BadgeBaseThemeData>, DiagnosticableTreeMixin {
  BadgeBaseStyle? get filledStyle;
  BadgeBaseStyle? get outlinedStyle;
  BadgeBaseStyle? get lightStyle;
  BadgeBaseStyle? get subtleStyle;
  BadgeBaseStyle? get transparentStyle;

  @override
  BadgeBaseThemeData copyWith({
    BadgeBaseStyle? filledStyle,
    BadgeBaseStyle? outlinedStyle,
    BadgeBaseStyle? lightStyle,
    BadgeBaseStyle? subtleStyle,
    BadgeBaseStyle? transparentStyle,
  }) {
    return BadgeBaseThemeData(
      filledStyle: filledStyle ?? this.filledStyle,
      outlinedStyle: outlinedStyle ?? this.outlinedStyle,
      lightStyle: lightStyle ?? this.lightStyle,
      subtleStyle: subtleStyle ?? this.subtleStyle,
      transparentStyle: transparentStyle ?? this.transparentStyle,
    );
  }

  @override
  BadgeBaseThemeData lerp(
      covariant ThemeExtension<BadgeBaseThemeData>? other, double t) {
    if (other is! BadgeBaseThemeData) return this as BadgeBaseThemeData;
    return BadgeBaseThemeData(
      filledStyle: t < 0.5 ? filledStyle : other.filledStyle,
      outlinedStyle: t < 0.5 ? outlinedStyle : other.outlinedStyle,
      lightStyle: t < 0.5 ? lightStyle : other.lightStyle,
      subtleStyle: t < 0.5 ? subtleStyle : other.subtleStyle,
      transparentStyle: t < 0.5 ? transparentStyle : other.transparentStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BadgeBaseThemeData &&
            const DeepCollectionEquality()
                .equals(filledStyle, other.filledStyle) &&
            const DeepCollectionEquality()
                .equals(outlinedStyle, other.outlinedStyle) &&
            const DeepCollectionEquality()
                .equals(lightStyle, other.lightStyle) &&
            const DeepCollectionEquality()
                .equals(subtleStyle, other.subtleStyle) &&
            const DeepCollectionEquality()
                .equals(transparentStyle, other.transparentStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(filledStyle),
      const DeepCollectionEquality().hash(outlinedStyle),
      const DeepCollectionEquality().hash(lightStyle),
      const DeepCollectionEquality().hash(subtleStyle),
      const DeepCollectionEquality().hash(transparentStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BadgeBaseThemeData'))
      ..add(DiagnosticsProperty('filledStyle', filledStyle))
      ..add(DiagnosticsProperty('outlinedStyle', outlinedStyle))
      ..add(DiagnosticsProperty('lightStyle', lightStyle))
      ..add(DiagnosticsProperty('subtleStyle', subtleStyle))
      ..add(DiagnosticsProperty('transparentStyle', transparentStyle));
  }
}

extension BadgeBaseThemeDataBuildContextProps on BuildContext {
  BadgeBaseThemeData get badgeBaseThemeData =>
      Theme.of(this).extension<BadgeBaseThemeData>()!;
  BadgeBaseStyle? get filledStyle => badgeBaseThemeData.filledStyle;
  BadgeBaseStyle? get outlinedStyle => badgeBaseThemeData.outlinedStyle;
  BadgeBaseStyle? get lightStyle => badgeBaseThemeData.lightStyle;
  BadgeBaseStyle? get subtleStyle => badgeBaseThemeData.subtleStyle;
  BadgeBaseStyle? get transparentStyle => badgeBaseThemeData.transparentStyle;
}
