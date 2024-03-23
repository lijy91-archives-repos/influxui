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
  ButtonBaseStyle? get outlinedStyle;
  ButtonBaseStyle? get lightStyle;
  ButtonBaseStyle? get subtleStyle;
  ButtonBaseStyle? get transparentStyle;

  @override
  ButtonBaseThemeData copyWith({
    ButtonBaseStyle? filledStyle,
    ButtonBaseStyle? outlinedStyle,
    ButtonBaseStyle? lightStyle,
    ButtonBaseStyle? subtleStyle,
    ButtonBaseStyle? transparentStyle,
  }) {
    return ButtonBaseThemeData(
      filledStyle: filledStyle ?? this.filledStyle,
      outlinedStyle: outlinedStyle ?? this.outlinedStyle,
      lightStyle: lightStyle ?? this.lightStyle,
      subtleStyle: subtleStyle ?? this.subtleStyle,
      transparentStyle: transparentStyle ?? this.transparentStyle,
    );
  }

  @override
  ButtonBaseThemeData lerp(
      covariant ThemeExtension<ButtonBaseThemeData>? other, double t) {
    if (other is! ButtonBaseThemeData) return this as ButtonBaseThemeData;
    return ButtonBaseThemeData(
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
            other is ButtonBaseThemeData &&
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
      ..add(DiagnosticsProperty('type', 'ButtonBaseThemeData'))
      ..add(DiagnosticsProperty('filledStyle', filledStyle))
      ..add(DiagnosticsProperty('outlinedStyle', outlinedStyle))
      ..add(DiagnosticsProperty('lightStyle', lightStyle))
      ..add(DiagnosticsProperty('subtleStyle', subtleStyle))
      ..add(DiagnosticsProperty('transparentStyle', transparentStyle));
  }
}

extension ButtonBaseThemeDataBuildContextProps on BuildContext {
  ButtonBaseThemeData get buttonBaseThemeData =>
      Theme.of(this).extension<ButtonBaseThemeData>()!;
  ButtonBaseStyle? get filledStyle => buttonBaseThemeData.filledStyle;
  ButtonBaseStyle? get outlinedStyle => buttonBaseThemeData.outlinedStyle;
  ButtonBaseStyle? get lightStyle => buttonBaseThemeData.lightStyle;
  ButtonBaseStyle? get subtleStyle => buttonBaseThemeData.subtleStyle;
  ButtonBaseStyle? get transparentStyle => buttonBaseThemeData.transparentStyle;
}
