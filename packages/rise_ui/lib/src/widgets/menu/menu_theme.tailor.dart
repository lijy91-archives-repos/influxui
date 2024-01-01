// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'menu_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MenuThemeDataTailorMixin
    on ThemeExtension<MenuThemeData>, DiagnosticableTreeMixin {
  IconThemeData? get unselectedIconTheme;
  TextStyle? get unselectedLabelStyle;
  IconThemeData? get selectedIconTheme;
  TextStyle? get selectedLabelStyle;
  Color? get indicatorColor;
  ShapeBorder? get indicatorShape;

  @override
  MenuThemeData copyWith({
    IconThemeData? unselectedIconTheme,
    TextStyle? unselectedLabelStyle,
    IconThemeData? selectedIconTheme,
    TextStyle? selectedLabelStyle,
    Color? indicatorColor,
    ShapeBorder? indicatorShape,
  }) {
    return MenuThemeData(
      unselectedIconTheme: unselectedIconTheme ?? this.unselectedIconTheme,
      unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
      selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
      selectedLabelStyle: selectedLabelStyle ?? this.selectedLabelStyle,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorShape: indicatorShape ?? this.indicatorShape,
    );
  }

  @override
  MenuThemeData lerp(covariant ThemeExtension<MenuThemeData>? other, double t) {
    if (other is! MenuThemeData) return this as MenuThemeData;
    return MenuThemeData(
      unselectedIconTheme:
          t < 0.5 ? unselectedIconTheme : other.unselectedIconTheme,
      unselectedLabelStyle:
          TextStyle.lerp(unselectedLabelStyle, other.unselectedLabelStyle, t),
      selectedIconTheme: t < 0.5 ? selectedIconTheme : other.selectedIconTheme,
      selectedLabelStyle:
          TextStyle.lerp(selectedLabelStyle, other.selectedLabelStyle, t),
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t),
      indicatorShape: t < 0.5 ? indicatorShape : other.indicatorShape,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuThemeData &&
            const DeepCollectionEquality()
                .equals(unselectedIconTheme, other.unselectedIconTheme) &&
            const DeepCollectionEquality()
                .equals(unselectedLabelStyle, other.unselectedLabelStyle) &&
            const DeepCollectionEquality()
                .equals(selectedIconTheme, other.selectedIconTheme) &&
            const DeepCollectionEquality()
                .equals(selectedLabelStyle, other.selectedLabelStyle) &&
            const DeepCollectionEquality()
                .equals(indicatorColor, other.indicatorColor) &&
            const DeepCollectionEquality()
                .equals(indicatorShape, other.indicatorShape));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(unselectedIconTheme),
      const DeepCollectionEquality().hash(unselectedLabelStyle),
      const DeepCollectionEquality().hash(selectedIconTheme),
      const DeepCollectionEquality().hash(selectedLabelStyle),
      const DeepCollectionEquality().hash(indicatorColor),
      const DeepCollectionEquality().hash(indicatorShape),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MenuThemeData'))
      ..add(DiagnosticsProperty('unselectedIconTheme', unselectedIconTheme))
      ..add(DiagnosticsProperty('unselectedLabelStyle', unselectedLabelStyle))
      ..add(DiagnosticsProperty('selectedIconTheme', selectedIconTheme))
      ..add(DiagnosticsProperty('selectedLabelStyle', selectedLabelStyle))
      ..add(DiagnosticsProperty('indicatorColor', indicatorColor))
      ..add(DiagnosticsProperty('indicatorShape', indicatorShape));
  }
}

extension MenuThemeDataBuildContextProps on BuildContext {
  MenuThemeData get menuThemeData => Theme.of(this).extension<MenuThemeData>()!;
  IconThemeData? get unselectedIconTheme => menuThemeData.unselectedIconTheme;
  TextStyle? get unselectedLabelStyle => menuThemeData.unselectedLabelStyle;
  IconThemeData? get selectedIconTheme => menuThemeData.selectedIconTheme;
  TextStyle? get selectedLabelStyle => menuThemeData.selectedLabelStyle;
  Color? get indicatorColor => menuThemeData.indicatorColor;
  ShapeBorder? get indicatorShape => menuThemeData.indicatorShape;
}
