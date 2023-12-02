import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

final _kMenuBrightnessedCustomizer = Customizer<Brightness, MenuThemeData>({
  Brightness.light: MenuThemeData(
    unselectedLabelTextStyle: TextStyle(
      color: Colors.black,
      fontSize: styleGuide.fontSizes.sized(NamedSize.small),
      fontWeight: FontWeight.w500,
    ),
    selectedLabelTextStyle: TextStyle(
      color: Colors.black,
      fontSize: styleGuide.fontSizes.sized(NamedSize.small),
      fontWeight: FontWeight.w500,
    ),
    selectedIconTheme: IconThemeData(
      color: Colors.black,
      size: 16,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black,
      size: 16,
    ),
  ),
  Brightness.dark: MenuThemeData(
    unselectedLabelTextStyle: TextStyle(
      color: Colors.white.withOpacity(0.8),
      fontSize: styleGuide.fontSizes.sized(NamedSize.small),
      fontWeight: FontWeight.w500,
      height: 1.1,
    ),
    selectedLabelTextStyle: TextStyle(
      color: Colors.white.withOpacity(0.8),
      fontSize: styleGuide.fontSizes.sized(NamedSize.small),
      fontWeight: FontWeight.w500,
      height: 1.1,
    ),
    selectedIconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.8),
      size: 16,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.8),
      size: 16,
    ),
  ),
});
final _kMenuColoredCustomizer = Customizer<Color, MenuThemeData>({});

@immutable
class MenuThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<MenuThemeData>,
        ColoredCustomizable<MenuThemeData> {
  const MenuThemeData({
    this.brightness,
    this.backgroundColor,
    this.unselectedLabelTextStyle,
    this.selectedLabelTextStyle,
    this.unselectedIconTheme,
    this.selectedIconTheme,
    this.indicatorColor,
    this.indicatorShape,
    Customizer<Brightness, MenuThemeData>? brightnessedCustomizer,
    Customizer<Color, MenuThemeData>? coloredCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _coloredCustomizer = coloredCustomizer;

  /// The brightness of the [Menu].
  final Brightness? brightness;

  /// Color to be used for the [Menu]'s background.
  final Color? backgroundColor;

  /// The style to merge with the default text style for
  /// [MenuDestination] labels, when the destination is not selected.
  final TextStyle? unselectedLabelTextStyle;

  /// The style to merge with the default text style for
  /// [MenuDestination] labels, when the destination is selected.
  final TextStyle? selectedLabelTextStyle;

  /// The theme to merge with the default icon theme for
  /// [MenuDestination] icons, when the destination is not selected.
  final IconThemeData? unselectedIconTheme;

  /// The theme to merge with the default icon theme for
  /// [MenuDestination] icons, when the destination is selected.
  final IconThemeData? selectedIconTheme;

  /// Overrides the default value of [Menu]'s selection indicator color,
  /// when [useIndicator] is true.
  final Color? indicatorColor;

  /// Overrides the default shape of the [Menu]'s selection indicator.
  final ShapeBorder? indicatorShape;

  /// The [Customizer] for [MenuThemeData]s that are brightnessed.
  final Customizer<Brightness, MenuThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [MenuThemeData]s that are brightnessed.
  final Customizer<Color, MenuThemeData>? _coloredCustomizer;

  @override
  Customizer<Brightness, MenuThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kMenuBrightnessedCustomizer;
  }

  @override
  Customizer<Color, MenuThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kMenuColoredCustomizer;
  }

  @override
  MenuThemeData brightnessed(Brightness? brightness) {
    MenuThemeData? brightnessedTheme = brightnessedCustomizer.of(brightness);
    return copyWith(
      brightness: brightness ?? this.brightness,
      unselectedLabelTextStyle: brightnessedTheme?.unselectedLabelTextStyle ??
          unselectedLabelTextStyle,
      selectedLabelTextStyle:
          brightnessedTheme?.selectedLabelTextStyle ?? selectedLabelTextStyle,
      unselectedIconTheme:
          brightnessedTheme?.unselectedIconTheme ?? unselectedIconTheme,
      selectedIconTheme:
          brightnessedTheme?.selectedIconTheme ?? selectedIconTheme,
      indicatorColor: indicatorColor,
    );
  }

  @override
  MenuThemeData colored(Color? color) {
    MenuThemeData? coloredTheme = coloredCustomizer.of(color);
    return copyWith(
      indicatorColor: coloredTheme?.indicatorColor ?? color ?? indicatorColor,
    );
  }

  MenuThemeData copyWith({
    Brightness? brightness,
    Color? backgroundColor,
    TextStyle? unselectedLabelTextStyle,
    TextStyle? selectedLabelTextStyle,
    IconThemeData? unselectedIconTheme,
    IconThemeData? selectedIconTheme,
    Color? indicatorColor,
    ShapeBorder? indicatorShape,
  }) {
    return MenuThemeData(
      brightness: brightness ?? this.brightness,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      unselectedLabelTextStyle:
          unselectedLabelTextStyle ?? this.unselectedLabelTextStyle,
      selectedLabelTextStyle:
          selectedLabelTextStyle ?? this.selectedLabelTextStyle,
      unselectedIconTheme: unselectedIconTheme ?? this.unselectedIconTheme,
      selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorShape: indicatorShape ?? this.indicatorShape,
    );
  }

  static MenuThemeData lerp(
    MenuThemeData? a,
    MenuThemeData? b,
    double t,
  ) {
    return MenuThemeData(
      brightness: t < 0.5 ? a?.brightness : b?.brightness,
    );
  }

  @override
  int get hashCode => Object.hash(
        brightness,
        backgroundColor,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MenuThemeData && other.brightness == brightness;
  }
}

class MenuTheme extends InheritedTheme {
  const MenuTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MenuThemeData data;

  static MenuThemeData of(BuildContext context) {
    final MenuTheme? menuTheme =
        context.dependOnInheritedWidgetOfExactType<MenuTheme>();
    return menuTheme?.data ?? Theme.of(context).menuTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MenuTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MenuTheme oldWidget) => data != oldWidget.data;
}
