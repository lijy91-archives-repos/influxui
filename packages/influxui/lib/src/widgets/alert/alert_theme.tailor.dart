// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'alert_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AlertThemeDataTailorMixin
    on ThemeExtension<AlertThemeData>, DiagnosticableTreeMixin {
  AlertStyle? get successStyle;
  AlertStyle? get infoStyle;
  AlertStyle? get warningStyle;
  AlertStyle? get dangerStyle;

  @override
  AlertThemeData copyWith({
    AlertStyle? successStyle,
    AlertStyle? infoStyle,
    AlertStyle? warningStyle,
    AlertStyle? dangerStyle,
  }) {
    return AlertThemeData(
      successStyle: successStyle ?? this.successStyle,
      infoStyle: infoStyle ?? this.infoStyle,
      warningStyle: warningStyle ?? this.warningStyle,
      dangerStyle: dangerStyle ?? this.dangerStyle,
    );
  }

  @override
  AlertThemeData lerp(
      covariant ThemeExtension<AlertThemeData>? other, double t) {
    if (other is! AlertThemeData) return this as AlertThemeData;
    return AlertThemeData(
      successStyle: t < 0.5 ? successStyle : other.successStyle,
      infoStyle: t < 0.5 ? infoStyle : other.infoStyle,
      warningStyle: t < 0.5 ? warningStyle : other.warningStyle,
      dangerStyle: t < 0.5 ? dangerStyle : other.dangerStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertThemeData &&
            const DeepCollectionEquality()
                .equals(successStyle, other.successStyle) &&
            const DeepCollectionEquality().equals(infoStyle, other.infoStyle) &&
            const DeepCollectionEquality()
                .equals(warningStyle, other.warningStyle) &&
            const DeepCollectionEquality()
                .equals(dangerStyle, other.dangerStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(successStyle),
      const DeepCollectionEquality().hash(infoStyle),
      const DeepCollectionEquality().hash(warningStyle),
      const DeepCollectionEquality().hash(dangerStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlertThemeData'))
      ..add(DiagnosticsProperty('successStyle', successStyle))
      ..add(DiagnosticsProperty('infoStyle', infoStyle))
      ..add(DiagnosticsProperty('warningStyle', warningStyle))
      ..add(DiagnosticsProperty('dangerStyle', dangerStyle));
  }
}

extension AlertThemeDataBuildContextProps on BuildContext {
  AlertThemeData get alertThemeData =>
      Theme.of(this).extension<AlertThemeData>()!;
  AlertStyle? get successStyle => alertThemeData.successStyle;
  AlertStyle? get infoStyle => alertThemeData.infoStyle;
  AlertStyle? get warningStyle => alertThemeData.warningStyle;
  AlertStyle? get dangerStyle => alertThemeData.dangerStyle;
}
