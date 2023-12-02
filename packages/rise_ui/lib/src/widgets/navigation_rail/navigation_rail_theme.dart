import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

final _kNavigationRailBrightnessedCustomizer =
    Customizer<Brightness, NavigationRailThemeData>({
  Brightness.light: NavigationRailThemeData(
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
  Brightness.dark: NavigationRailThemeData(
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
final _kNavigationRailColoredCustomizer =
    Customizer<Color, NavigationRailThemeData>({});

@immutable
class NavigationRailThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<NavigationRailThemeData>,
        ColoredCustomizable<NavigationRailThemeData> {
  const NavigationRailThemeData({
    this.brightness,
    this.backgroundColor,
    this.unselectedLabelTextStyle,
    this.selectedLabelTextStyle,
    this.unselectedIconTheme,
    this.selectedIconTheme,
    this.indicatorColor,
    this.indicatorShape,
    Customizer<Brightness, NavigationRailThemeData>? brightnessedCustomizer,
    Customizer<Color, NavigationRailThemeData>? coloredCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _coloredCustomizer = coloredCustomizer;

  /// The brightness of the [NavigationRail].
  final Brightness? brightness;

  /// Color to be used for the [NavigationRail]'s background.
  final Color? backgroundColor;

  /// The style to merge with the default text style for
  /// [NavigationRailDestination] labels, when the destination is not selected.
  final TextStyle? unselectedLabelTextStyle;

  /// The style to merge with the default text style for
  /// [NavigationRailDestination] labels, when the destination is selected.
  final TextStyle? selectedLabelTextStyle;

  /// The theme to merge with the default icon theme for
  /// [NavigationRailDestination] icons, when the destination is not selected.
  final IconThemeData? unselectedIconTheme;

  /// The theme to merge with the default icon theme for
  /// [NavigationRailDestination] icons, when the destination is selected.
  final IconThemeData? selectedIconTheme;

  /// Overrides the default value of [NavigationRail]'s selection indicator color,
  /// when [useIndicator] is true.
  final Color? indicatorColor;

  /// Overrides the default shape of the [NavigationRail]'s selection indicator.
  final ShapeBorder? indicatorShape;

  /// The [Customizer] for [NavigationRailThemeData]s that are brightnessed.
  final Customizer<Brightness, NavigationRailThemeData>?
      _brightnessedCustomizer;

  /// The [Customizer] for [NavigationRailThemeData]s that are brightnessed.
  final Customizer<Color, NavigationRailThemeData>? _coloredCustomizer;

  @override
  Customizer<Brightness, NavigationRailThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kNavigationRailBrightnessedCustomizer;
  }

  @override
  Customizer<Color, NavigationRailThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kNavigationRailColoredCustomizer;
  }

  @override
  NavigationRailThemeData brightnessed(Brightness? brightness) {
    NavigationRailThemeData? brightnessedTheme =
        brightnessedCustomizer.of(brightness);
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
  NavigationRailThemeData colored(Color? color) {
    NavigationRailThemeData? coloredTheme = coloredCustomizer.of(color);
    return copyWith(
      indicatorColor: coloredTheme?.indicatorColor ?? color ?? indicatorColor,
    );
  }

  NavigationRailThemeData copyWith({
    Brightness? brightness,
    Color? backgroundColor,
    TextStyle? unselectedLabelTextStyle,
    TextStyle? selectedLabelTextStyle,
    IconThemeData? unselectedIconTheme,
    IconThemeData? selectedIconTheme,
    Color? indicatorColor,
    ShapeBorder? indicatorShape,
  }) {
    return NavigationRailThemeData(
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

  static NavigationRailThemeData lerp(
    NavigationRailThemeData? a,
    NavigationRailThemeData? b,
    double t,
  ) {
    return NavigationRailThemeData(
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
    return other is NavigationRailThemeData && other.brightness == brightness;
  }
}

class NavigationRailTheme extends InheritedTheme {
  const NavigationRailTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final NavigationRailThemeData data;

  static NavigationRailThemeData of(BuildContext context) {
    final NavigationRailTheme? navigationRailTheme =
        context.dependOnInheritedWidgetOfExactType<NavigationRailTheme>();
    return navigationRailTheme?.data ?? Theme.of(context).navigationRailTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return NavigationRailTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(NavigationRailTheme oldWidget) =>
      data != oldWidget.data;
}
