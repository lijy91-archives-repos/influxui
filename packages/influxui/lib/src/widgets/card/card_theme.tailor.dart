// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$InfluxCardThemeDataTailorMixin
    on ThemeExtension<InfluxCardThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;

  @override
  InfluxCardThemeData copyWith({
    BorderRadius? borderRadius,
  }) {
    return InfluxCardThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  InfluxCardThemeData lerp(
      covariant ThemeExtension<InfluxCardThemeData>? other, double t) {
    if (other is! InfluxCardThemeData) return this as InfluxCardThemeData;
    return InfluxCardThemeData(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfluxCardThemeData &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InfluxCardThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius));
  }
}

extension InfluxCardThemeDataBuildContextProps on BuildContext {
  InfluxCardThemeData get influxCardThemeData =>
      Theme.of(this).extension<InfluxCardThemeData>()!;
  BorderRadius? get borderRadius => influxCardThemeData.borderRadius;
}
