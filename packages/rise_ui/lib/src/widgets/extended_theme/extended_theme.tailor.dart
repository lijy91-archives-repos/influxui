// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'extended_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ExtendedThemeDataTailorMixin
    on ThemeExtension<ExtendedThemeData>, DiagnosticableTreeMixin {
  Brightness? get brightness;

  @override
  ExtendedThemeData copyWith({
    Brightness? brightness,
  }) {
    return ExtendedThemeData(
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  ExtendedThemeData lerp(
      covariant ThemeExtension<ExtendedThemeData>? other, double t) {
    if (other is! ExtendedThemeData) return this as ExtendedThemeData;
    return ExtendedThemeData(
      brightness: t < 0.5 ? brightness : other.brightness,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExtendedThemeData &&
            const DeepCollectionEquality()
                .equals(brightness, other.brightness));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(brightness),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExtendedThemeData'))
      ..add(DiagnosticsProperty('brightness', brightness));
  }
}

extension ExtendedThemeDataBuildContextProps on BuildContext {
  ExtendedThemeData get extendedThemeData =>
      Theme.of(this).extension<ExtendedThemeData>()!;
  Brightness? get brightness => extendedThemeData.brightness;
}
