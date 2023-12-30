// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'divider_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$DividerThemeDataTailorMixin
    on ThemeExtension<DividerThemeData>, DiagnosticableTreeMixin {
  Color? get color;
  DividerStyle get tinyStyle;
  DividerStyle get smallStyle;
  DividerStyle get mediumStyle;
  DividerStyle get largeStyle;
  DividerStyle get bigStyle;

  @override
  DividerThemeData copyWith({
    Color? color,
    DividerStyle? tinyStyle,
    DividerStyle? smallStyle,
    DividerStyle? mediumStyle,
    DividerStyle? largeStyle,
    DividerStyle? bigStyle,
  }) {
    return DividerThemeData(
      color: color ?? this.color,
      tinyStyle: tinyStyle ?? this.tinyStyle,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
      bigStyle: bigStyle ?? this.bigStyle,
    );
  }

  @override
  DividerThemeData lerp(
      covariant ThemeExtension<DividerThemeData>? other, double t) {
    if (other is! DividerThemeData) return this as DividerThemeData;
    return DividerThemeData(
      color: Color.lerp(color, other.color, t),
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
            other is DividerThemeData &&
            const DeepCollectionEquality().equals(color, other.color) &&
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
      const DeepCollectionEquality().hash(color),
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
      ..add(DiagnosticsProperty('type', 'DividerThemeData'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('tinyStyle', tinyStyle))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle))
      ..add(DiagnosticsProperty('bigStyle', bigStyle));
  }
}

extension DividerThemeDataBuildContextProps on BuildContext {
  DividerThemeData get dividerThemeData =>
      Theme.of(this).extension<DividerThemeData>()!;
  Color? get color => dividerThemeData.color;
  DividerStyle get tinyStyle => dividerThemeData.tinyStyle;
  DividerStyle get smallStyle => dividerThemeData.smallStyle;
  DividerStyle get mediumStyle => dividerThemeData.mediumStyle;
  DividerStyle get largeStyle => dividerThemeData.largeStyle;
  DividerStyle get bigStyle => dividerThemeData.bigStyle;
}
