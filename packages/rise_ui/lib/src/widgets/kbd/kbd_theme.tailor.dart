// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'kbd_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$KbdThemeDataTailorMixin
    on ThemeExtension<KbdThemeData>, DiagnosticableTreeMixin {
  Color? get color;
  Color? get labelColor;
  Color? get borderColor;
  BorderRadius? get borderRadius;
  KbdStyle? get smallStyle;
  KbdStyle? get mediumStyle;
  KbdStyle? get largeStyle;

  @override
  KbdThemeData copyWith({
    Color? color,
    Color? labelColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    KbdStyle? smallStyle,
    KbdStyle? mediumStyle,
    KbdStyle? largeStyle,
  }) {
    return KbdThemeData(
      color: color ?? this.color,
      labelColor: labelColor ?? this.labelColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      smallStyle: smallStyle ?? this.smallStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      largeStyle: largeStyle ?? this.largeStyle,
    );
  }

  @override
  KbdThemeData lerp(covariant ThemeExtension<KbdThemeData>? other, double t) {
    if (other is! KbdThemeData) return this as KbdThemeData;
    return KbdThemeData(
      color: Color.lerp(color, other.color, t),
      labelColor: Color.lerp(labelColor, other.labelColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      smallStyle: t < 0.5 ? smallStyle : other.smallStyle,
      mediumStyle: t < 0.5 ? mediumStyle : other.mediumStyle,
      largeStyle: t < 0.5 ? largeStyle : other.largeStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KbdThemeData &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(labelColor, other.labelColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
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
      const DeepCollectionEquality().hash(labelColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(smallStyle),
      const DeepCollectionEquality().hash(mediumStyle),
      const DeepCollectionEquality().hash(largeStyle),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KbdThemeData'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('labelColor', labelColor))
      ..add(DiagnosticsProperty('borderColor', borderColor))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DiagnosticsProperty('smallStyle', smallStyle))
      ..add(DiagnosticsProperty('mediumStyle', mediumStyle))
      ..add(DiagnosticsProperty('largeStyle', largeStyle));
  }
}

extension KbdThemeDataBuildContextProps on BuildContext {
  KbdThemeData get kbdThemeData => Theme.of(this).extension<KbdThemeData>()!;
  Color? get color => kbdThemeData.color;
  Color? get labelColor => kbdThemeData.labelColor;
  Color? get borderColor => kbdThemeData.borderColor;
  BorderRadius? get borderRadius => kbdThemeData.borderRadius;
  KbdStyle? get smallStyle => kbdThemeData.smallStyle;
  KbdStyle? get mediumStyle => kbdThemeData.mediumStyle;
  KbdStyle? get largeStyle => kbdThemeData.largeStyle;
}
