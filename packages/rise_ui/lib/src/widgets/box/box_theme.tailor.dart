// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'box_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BoxThemeDataTailorMixin
    on ThemeExtension<BoxThemeData>, DiagnosticableTreeMixin {
  BoxStyle get filledStyle;
  BoxStyle get lightStyle;
  BoxStyle get outlineStyle;
  BoxStyle get subtleStyle;
  BoxStyle get transparentStyle;
  BoxStyle get whiteStyle;

  @override
  BoxThemeData copyWith({
    BoxStyle? filledStyle,
    BoxStyle? lightStyle,
    BoxStyle? outlineStyle,
    BoxStyle? subtleStyle,
    BoxStyle? transparentStyle,
    BoxStyle? whiteStyle,
  }) {
    return BoxThemeData(
      filledStyle: filledStyle ?? this.filledStyle,
      lightStyle: lightStyle ?? this.lightStyle,
      outlineStyle: outlineStyle ?? this.outlineStyle,
      subtleStyle: subtleStyle ?? this.subtleStyle,
      transparentStyle: transparentStyle ?? this.transparentStyle,
      whiteStyle: whiteStyle ?? this.whiteStyle,
    );
  }

  @override
  BoxThemeData lerp(covariant ThemeExtension<BoxThemeData>? other, double t) {
    if (other is! BoxThemeData) return this as BoxThemeData;
    return BoxThemeData(
      filledStyle: t < 0.5 ? filledStyle : other.filledStyle,
      lightStyle: t < 0.5 ? lightStyle : other.lightStyle,
      outlineStyle: t < 0.5 ? outlineStyle : other.outlineStyle,
      subtleStyle: t < 0.5 ? subtleStyle : other.subtleStyle,
      transparentStyle: t < 0.5 ? transparentStyle : other.transparentStyle,
      whiteStyle: t < 0.5 ? whiteStyle : other.whiteStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoxThemeData &&
            const DeepCollectionEquality()
                .equals(filledStyle, other.filledStyle) &&
            const DeepCollectionEquality()
                .equals(lightStyle, other.lightStyle) &&
            const DeepCollectionEquality()
                .equals(outlineStyle, other.outlineStyle) &&
            const DeepCollectionEquality()
                .equals(subtleStyle, other.subtleStyle) &&
            const DeepCollectionEquality()
                .equals(transparentStyle, other.transparentStyle) &&
            const DeepCollectionEquality()
                .equals(whiteStyle, other.whiteStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(filledStyle),
      const DeepCollectionEquality().hash(lightStyle),
      const DeepCollectionEquality().hash(outlineStyle),
      const DeepCollectionEquality().hash(subtleStyle),
      const DeepCollectionEquality().hash(transparentStyle),
      const DeepCollectionEquality().hash(whiteStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BoxThemeData'))
      ..add(DiagnosticsProperty('filledStyle', filledStyle))
      ..add(DiagnosticsProperty('lightStyle', lightStyle))
      ..add(DiagnosticsProperty('outlineStyle', outlineStyle))
      ..add(DiagnosticsProperty('subtleStyle', subtleStyle))
      ..add(DiagnosticsProperty('transparentStyle', transparentStyle))
      ..add(DiagnosticsProperty('whiteStyle', whiteStyle));
  }
}

extension BoxThemeDataBuildContextProps on BuildContext {
  BoxThemeData get boxThemeData => Theme.of(this).extension<BoxThemeData>()!;
  BoxStyle get filledStyle => boxThemeData.filledStyle;
  BoxStyle get lightStyle => boxThemeData.lightStyle;
  BoxStyle get outlineStyle => boxThemeData.outlineStyle;
  BoxStyle get subtleStyle => boxThemeData.subtleStyle;
  BoxStyle get transparentStyle => boxThemeData.transparentStyle;
  BoxStyle get whiteStyle => boxThemeData.whiteStyle;
}
