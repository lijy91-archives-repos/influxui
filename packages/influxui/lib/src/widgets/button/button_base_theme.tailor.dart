// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'button_base_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ButtonBaseThemeDataTailorMixin
    on ThemeExtension<ButtonBaseThemeData>, DiagnosticableTreeMixin {
  ButtonBaseStyle? get filledStyle;
  ButtonBaseStyle? get lightStyle;
  ButtonBaseStyle? get outlineStyle;
  ButtonBaseStyle? get subtleStyle;
  ButtonBaseStyle? get transparentStyle;
  ButtonBaseStyle? get whiteStyle;

  @override
  ButtonBaseThemeData copyWith({
    ButtonBaseStyle? filledStyle,
    ButtonBaseStyle? lightStyle,
    ButtonBaseStyle? outlineStyle,
    ButtonBaseStyle? subtleStyle,
    ButtonBaseStyle? transparentStyle,
    ButtonBaseStyle? whiteStyle,
  }) {
    return ButtonBaseThemeData(
      filledStyle: filledStyle ?? this.filledStyle,
      lightStyle: lightStyle ?? this.lightStyle,
      outlineStyle: outlineStyle ?? this.outlineStyle,
      subtleStyle: subtleStyle ?? this.subtleStyle,
      transparentStyle: transparentStyle ?? this.transparentStyle,
      whiteStyle: whiteStyle ?? this.whiteStyle,
    );
  }

  @override
  ButtonBaseThemeData lerp(
      covariant ThemeExtension<ButtonBaseThemeData>? other, double t) {
    if (other is! ButtonBaseThemeData) return this as ButtonBaseThemeData;
    return ButtonBaseThemeData(
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
            other is ButtonBaseThemeData &&
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
      ..add(DiagnosticsProperty('type', 'ButtonBaseThemeData'))
      ..add(DiagnosticsProperty('filledStyle', filledStyle))
      ..add(DiagnosticsProperty('lightStyle', lightStyle))
      ..add(DiagnosticsProperty('outlineStyle', outlineStyle))
      ..add(DiagnosticsProperty('subtleStyle', subtleStyle))
      ..add(DiagnosticsProperty('transparentStyle', transparentStyle))
      ..add(DiagnosticsProperty('whiteStyle', whiteStyle));
  }
}

extension ButtonBaseThemeDataBuildContextProps on BuildContext {
  ButtonBaseThemeData get boxThemeData =>
      Theme.of(this).extension<ButtonBaseThemeData>()!;
  ButtonBaseStyle? get filledStyle => boxThemeData.filledStyle;
  ButtonBaseStyle? get lightStyle => boxThemeData.lightStyle;
  ButtonBaseStyle? get outlineStyle => boxThemeData.outlineStyle;
  ButtonBaseStyle? get subtleStyle => boxThemeData.subtleStyle;
  ButtonBaseStyle? get transparentStyle => boxThemeData.transparentStyle;
  ButtonBaseStyle? get whiteStyle => boxThemeData.whiteStyle;
}
