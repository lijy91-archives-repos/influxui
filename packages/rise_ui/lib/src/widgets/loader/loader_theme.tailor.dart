// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'loader_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$LoaderThemeDataTailorMixin
    on ThemeExtension<LoaderThemeData>, DiagnosticableTreeMixin {
  Color? get color;
  Size? get tinySize;
  Size? get smallSize;
  Size? get mediumSize;
  Size? get largeSize;
  Size? get bigSize;

  @override
  LoaderThemeData copyWith({
    Color? color,
    Size? tinySize,
    Size? smallSize,
    Size? mediumSize,
    Size? largeSize,
    Size? bigSize,
  }) {
    return LoaderThemeData(
      color: color ?? this.color,
      tinySize: tinySize ?? this.tinySize,
      smallSize: smallSize ?? this.smallSize,
      mediumSize: mediumSize ?? this.mediumSize,
      largeSize: largeSize ?? this.largeSize,
      bigSize: bigSize ?? this.bigSize,
    );
  }

  @override
  LoaderThemeData lerp(
      covariant ThemeExtension<LoaderThemeData>? other, double t) {
    if (other is! LoaderThemeData) return this as LoaderThemeData;
    return LoaderThemeData(
      color: Color.lerp(color, other.color, t),
      tinySize: t < 0.5 ? tinySize : other.tinySize,
      smallSize: t < 0.5 ? smallSize : other.smallSize,
      mediumSize: t < 0.5 ? mediumSize : other.mediumSize,
      largeSize: t < 0.5 ? largeSize : other.largeSize,
      bigSize: t < 0.5 ? bigSize : other.bigSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoaderThemeData &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality().equals(tinySize, other.tinySize) &&
            const DeepCollectionEquality().equals(smallSize, other.smallSize) &&
            const DeepCollectionEquality()
                .equals(mediumSize, other.mediumSize) &&
            const DeepCollectionEquality().equals(largeSize, other.largeSize) &&
            const DeepCollectionEquality().equals(bigSize, other.bigSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(tinySize),
      const DeepCollectionEquality().hash(smallSize),
      const DeepCollectionEquality().hash(mediumSize),
      const DeepCollectionEquality().hash(largeSize),
      const DeepCollectionEquality().hash(bigSize),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoaderThemeData'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('tinySize', tinySize))
      ..add(DiagnosticsProperty('smallSize', smallSize))
      ..add(DiagnosticsProperty('mediumSize', mediumSize))
      ..add(DiagnosticsProperty('largeSize', largeSize))
      ..add(DiagnosticsProperty('bigSize', bigSize));
  }
}

extension LoaderThemeDataBuildContextProps on BuildContext {
  LoaderThemeData get loaderThemeData =>
      Theme.of(this).extension<LoaderThemeData>()!;
  Color? get color => loaderThemeData.color;
  Size? get tinySize => loaderThemeData.tinySize;
  Size? get smallSize => loaderThemeData.smallSize;
  Size? get mediumSize => loaderThemeData.mediumSize;
  Size? get largeSize => loaderThemeData.largeSize;
  Size? get bigSize => loaderThemeData.bigSize;
}
