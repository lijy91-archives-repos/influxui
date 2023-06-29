import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/theme/theme.dart';

final _kMenuItemBrightnessedCustomizer =
    Customizer<Brightness, MenuItemThemeData>({
  Brightness.light: MenuItemThemeData(
    padding: EdgeInsets.symmetric(
      vertical: styleGuide.spacing.sized(NamedSize.tiny),
      horizontal: styleGuide.spacing.sized(NamedSize.small),
    ),
    color: Colors.gray,
    colorShade: -1,
    hoveredColorShade: 100,
    iconColor: Colors.black,
    iconSize: 14,
    labelColor: Colors.black,
    labelFontSize: styleGuide.fontSizes.sized(NamedSize.small),
  ),
  Brightness.dark: MenuItemThemeData(
    padding: EdgeInsets.symmetric(
      vertical: styleGuide.spacing.sized(NamedSize.tiny),
      horizontal: styleGuide.spacing.sized(NamedSize.small),
    ),
    color: Colors.darkGray,
    colorShade: -1,
    hoveredColorShade: 300,
    iconColor: Colors.darkGray.shade50,
    iconSize: 14,
    labelColor: Colors.darkGray.shade50,
    labelFontSize: styleGuide.fontSizes.sized(NamedSize.small),
  ),
});

final _kMenuItemColoredCustomizer = Customizer<Color, MenuItemThemeData>({});

@immutable
class MenuItemThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<MenuItemThemeData>,
        ColoredCustomizable<MenuItemThemeData> {
  const MenuItemThemeData({
    this.brightness,
    this.padding,
    this.color,
    this.colorShade,
    this.hoveredColorShade,
    this.iconColor,
    this.iconSize,
    this.labelColor,
    this.labelColorShade,
    this.labelFontSize,
    Customizer<Brightness, MenuItemThemeData>? brightnessedCustomizer,
    Customizer<Color, MenuItemThemeData>? coloredCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _coloredCustomizer = coloredCustomizer;

  final Brightness? brightness;

  final EdgeInsetsGeometry? padding;

  final Color? color;

  final int? colorShade;

  final int? hoveredColorShade;

  final Color? iconColor;

  final double? iconSize;

  final Color? labelColor;

  final int? labelColorShade;

  final double? labelFontSize;

  /// The [Customizer] for [MenuItemThemeData]s that are brightnessed.
  final Customizer<Brightness, MenuItemThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [MenuItemThemeData]s that are brightnessed.
  final Customizer<Color, MenuItemThemeData>? _coloredCustomizer;

  @override
  Customizer<Brightness, MenuItemThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kMenuItemBrightnessedCustomizer;
  }

  @override
  Customizer<Color, MenuItemThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kMenuItemColoredCustomizer;
  }

  @override
  MenuItemThemeData brightnessed(Brightness? brightness) {
    MenuItemThemeData? brightnessedTheme =
        brightnessedCustomizer.of(brightness);
    return copyWith(
      padding: brightnessedTheme?.padding ?? padding,
      color: brightnessedTheme?.color ?? color,
      colorShade: brightnessedTheme?.colorShade ?? colorShade,
      hoveredColorShade:
          brightnessedTheme?.hoveredColorShade ?? hoveredColorShade,
      iconColor: brightnessedTheme?.iconColor ?? iconColor,
      iconSize: brightnessedTheme?.iconSize ?? iconSize,
      labelColor: brightnessedTheme?.labelColor ?? labelColor,
      labelColorShade: brightnessedTheme?.labelColorShade ?? labelColorShade,
      labelFontSize: brightnessedTheme?.labelFontSize ?? labelFontSize,
    );
  }

  @override
  MenuItemThemeData colored(Color? color) {
    MenuItemThemeData? coloredTheme = coloredCustomizer.of(color);
    return copyWith(
      color: coloredTheme?.color ?? color ?? this.color,
      colorShade: coloredTheme?.colorShade ?? colorShade,
      labelColor: coloredTheme?.labelColor ?? labelColor ?? color,
      labelColorShade: coloredTheme?.labelColorShade ?? labelColorShade,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  MenuItemThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Color? color,
    int? colorShade,
    int? hoveredColorShade,
    Color? iconColor,
    double? iconSize,
    Color? labelColor,
    int? labelColorShade,
    double? labelFontSize,
    Customizer<Brightness, MenuItemThemeData>? brightnessedCustomizer,
    Customizer<Color, MenuItemThemeData>? coloredCustomizer,
    Customizer<Size, MenuItemThemeData>? sizedCustomizer,
  }) {
    return MenuItemThemeData(
      padding: padding ?? this.padding,
      color: color ?? this.color,
      colorShade: colorShade ?? this.colorShade,
      hoveredColorShade: hoveredColorShade ?? this.hoveredColorShade,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      labelColor: labelColor ?? this.labelColor,
      labelColorShade: labelColorShade ?? this.labelColorShade,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      brightnessedCustomizer:
          brightnessedCustomizer ?? this.brightnessedCustomizer,
      coloredCustomizer: coloredCustomizer ?? this.coloredCustomizer,
    );
  }

  /// Linearly interpolate between two [MenuItem] themes.
  static MenuItemThemeData lerp(
      MenuItemThemeData? a, MenuItemThemeData? b, double t) {
    return MenuItemThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        brightness,
        padding,
        color,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MenuItemThemeData &&
        other.color == color &&
        other.labelColor == labelColor &&
        other.padding == padding;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty(
      'color',
      color,
      defaultValue: null,
    ));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
      'padding',
      padding,
      defaultValue: null,
    ));
  }
}

class MenuItemTheme extends InheritedTheme {
  const MenuItemTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MenuItemThemeData data;

  static MenuItemThemeData of(BuildContext context) {
    final MenuItemTheme? menuItemTheme =
        context.dependOnInheritedWidgetOfExactType<MenuItemTheme>();
    return menuItemTheme?.data ?? Theme.of(context).menuItemTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MenuItemTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MenuItemTheme oldWidget) => data != oldWidget.data;
}
