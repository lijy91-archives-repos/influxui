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
  DividerStyle? get smallStyle;
  DividerStyle? get mediumStyle;
  DividerStyle? get largeStyle;

  @override
  DividerThemeData copyWith({
    Color? color,
    DividerStyle? smallStyle,
    DividerStyle? mediumStyle,
    DividerStyle? largeStyle,
  }) {
    return DividerThemeData(
      color: color ?? this.color,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
    );
  }

  @override
  DividerThemeData lerp(
      covariant ThemeExtension<DividerThemeData>? other, double t) {
    if (other is! DividerThemeData) return this as DividerThemeData;
    return DividerThemeData(
      color: Color.lerp(color, other.color, t),
      smallStyle: t < 0.5 ? smallStyle : other.smallStyle,
      mediumStyle: t < 0.5 ? mediumStyle : other.mediumStyle,
      largeStyle: t < 0.5 ? largeStyle : other.largeStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DividerThemeData &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(smallStyle, other.smallStyle) &&
            const DeepCollectionEquality()
                .equals(mediumStyle, other.mediumStyle) &&
            const DeepCollectionEquality()
                .equals(largeStyle, other.largeStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(smallStyle),
      const DeepCollectionEquality().hash(mediumStyle),
      const DeepCollectionEquality().hash(largeStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DividerThemeData'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle));
  }
}

extension DividerThemeDataBuildContextProps on BuildContext {
  DividerThemeData get dividerThemeData =>
      Theme.of(this).extension<DividerThemeData>()!;
  Color? get color => dividerThemeData.color;
  DividerStyle? get smallStyle => dividerThemeData.smallStyle;
  DividerStyle? get mediumStyle => dividerThemeData.mediumStyle;
  DividerStyle? get largeStyle => dividerThemeData.largeStyle;
}
