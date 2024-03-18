// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'alert_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AlertThemeTailorMixin
    on ThemeExtension<AlertTheme>, DiagnosticableTreeMixin {
  TextStyle get titleStyle;
  TextStyle get messageStyle;
  Color get iconColor;
  double get iconSize;

  @override
  AlertTheme copyWith({
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    Color? iconColor,
    double? iconSize,
  }) {
    return AlertTheme(
      titleStyle: titleStyle ?? this.titleStyle,
      messageStyle: messageStyle ?? this.messageStyle,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  @override
  AlertTheme lerp(covariant ThemeExtension<AlertTheme>? other, double t) {
    if (other is! AlertTheme) return this as AlertTheme;
    return AlertTheme(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      messageStyle: TextStyle.lerp(messageStyle, other.messageStyle, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertTheme &&
            const DeepCollectionEquality()
                .equals(titleStyle, other.titleStyle) &&
            const DeepCollectionEquality()
                .equals(messageStyle, other.messageStyle) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(messageStyle),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(iconSize),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlertTheme'))
      ..add(DiagnosticsProperty('titleStyle', titleStyle))
      ..add(DiagnosticsProperty('messageStyle', messageStyle))
      ..add(DiagnosticsProperty('iconColor', iconColor))
      ..add(DiagnosticsProperty('iconSize', iconSize));
  }
}

extension AlertThemeBuildContextProps on BuildContext {
  AlertTheme get alertTheme => Theme.of(this).extension<AlertTheme>()!;
  TextStyle get titleStyle => alertTheme.titleStyle;
  TextStyle get messageStyle => alertTheme.messageStyle;
  Color get iconColor => alertTheme.iconColor;
  double get iconSize => alertTheme.iconSize;
}
