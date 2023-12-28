// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'skeleton_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SkeletonThemeDataTailorMixin
    on ThemeExtension<SkeletonThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;

  @override
  SkeletonThemeData copyWith({
    BorderRadius? borderRadius,
  }) {
    return SkeletonThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  SkeletonThemeData lerp(
      covariant ThemeExtension<SkeletonThemeData>? other, double t) {
    if (other is! SkeletonThemeData) return this as SkeletonThemeData;
    return SkeletonThemeData(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SkeletonThemeData &&
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
      ..add(DiagnosticsProperty('type', 'SkeletonThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius));
  }
}

extension SkeletonThemeDataBuildContextProps on BuildContext {
  SkeletonThemeData get skeletonThemeData =>
      Theme.of(this).extension<SkeletonThemeData>()!;
  BorderRadius? get borderRadius => skeletonThemeData.borderRadius;
}
