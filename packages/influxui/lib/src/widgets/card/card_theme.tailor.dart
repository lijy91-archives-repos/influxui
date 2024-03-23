// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$CardThemeDataTailorMixin
    on ThemeExtension<CardThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;

  @override
  CardThemeData copyWith({
    BorderRadius? borderRadius,
  }) {
    return CardThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  CardThemeData lerp(covariant ThemeExtension<CardThemeData>? other, double t) {
    if (other is! CardThemeData) return this as CardThemeData;
    return CardThemeData(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardThemeData &&
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
      ..add(DiagnosticsProperty('type', 'CardThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius));
  }
}

extension CardThemeDataBuildContextProps on BuildContext {
  CardThemeData get cardThemeData => Theme.of(this).extension<CardThemeData>()!;
  BorderRadius? get borderRadius => cardThemeData.borderRadius;
}
