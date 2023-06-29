import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/theme/theme.dart';

final _kMenuItemBrightnessedCustomizer =
    Customizer<Brightness, MenuSectionThemeData>({
  Brightness.light: MenuSectionThemeData(
    padding: EdgeInsets.symmetric(
      vertical: styleGuide.spacing.sized(NamedSize.tiny) / 2,
      horizontal: styleGuide.spacing.sized(NamedSize.small),
    ),
    labelColor: Colors.gray.shade600,
    labelFontSize: styleGuide.fontSizes.sized(NamedSize.tiny),
    labelFontWeight: FontWeight.w500,
  ),
  Brightness.dark: MenuSectionThemeData(
    padding: EdgeInsets.symmetric(
      vertical: styleGuide.spacing.sized(NamedSize.tiny) / 2,
      horizontal: styleGuide.spacing.sized(NamedSize.small),
    ),
    labelColor: Colors.darkGray.shade200,
    labelFontSize: styleGuide.fontSizes.sized(NamedSize.tiny),
    labelFontWeight: FontWeight.w500,
  ),
});

final _kMenuItemColoredCustomizer = Customizer<Color, MenuSectionThemeData>({});

@immutable
class MenuSectionThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<MenuSectionThemeData>,
        ColoredCustomizable<MenuSectionThemeData> {
  const MenuSectionThemeData({
    this.brightness,
    this.padding,
    this.labelColor,
    this.labelColorShade,
    this.labelFontSize,
    this.labelFontWeight,
    Customizer<Brightness, MenuSectionThemeData>? brightnessedCustomizer,
    Customizer<Color, MenuSectionThemeData>? coloredCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _coloredCustomizer = coloredCustomizer;

  final Brightness? brightness;

  final EdgeInsetsGeometry? padding;

  final Color? labelColor;

  final int? labelColorShade;

  final double? labelFontSize;

  final FontWeight? labelFontWeight;

  /// The [Customizer] for [MenuSectionThemeData]s that are brightnessed.
  final Customizer<Brightness, MenuSectionThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [MenuSectionThemeData]s that are brightnessed.
  final Customizer<Color, MenuSectionThemeData>? _coloredCustomizer;

  @override
  Customizer<Brightness, MenuSectionThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kMenuItemBrightnessedCustomizer;
  }

  @override
  Customizer<Color, MenuSectionThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kMenuItemColoredCustomizer;
  }

  @override
  MenuSectionThemeData brightnessed(Brightness? brightness) {
    MenuSectionThemeData? brightnessedTheme =
        brightnessedCustomizer.of(brightness);
    return copyWith(
      padding: brightnessedTheme?.padding ?? padding,
      labelColor: brightnessedTheme?.labelColor ?? labelColor,
      labelColorShade: brightnessedTheme?.labelColorShade ?? labelColorShade,
      labelFontSize: brightnessedTheme?.labelFontSize ?? labelFontSize,
      labelFontWeight: brightnessedTheme?.labelFontWeight ?? labelFontWeight,
    );
  }

  @override
  MenuSectionThemeData colored(Color? color) {
    MenuSectionThemeData? coloredTheme = coloredCustomizer.of(color);
    return copyWith(
      labelColor: coloredTheme?.labelColor ?? labelColor ?? color,
      labelColorShade: coloredTheme?.labelColorShade ?? labelColorShade,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  MenuSectionThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Color? labelColor,
    int? labelColorShade,
    double? labelFontSize,
    FontWeight? labelFontWeight,
    Customizer<Brightness, MenuSectionThemeData>? brightnessedCustomizer,
    Customizer<Color, MenuSectionThemeData>? coloredCustomizer,
  }) {
    return MenuSectionThemeData(
      padding: padding ?? this.padding,
      labelColor: labelColor ?? this.labelColor,
      labelColorShade: labelColorShade ?? this.labelColorShade,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      brightnessedCustomizer:
          brightnessedCustomizer ?? this.brightnessedCustomizer,
      coloredCustomizer: coloredCustomizer ?? this.coloredCustomizer,
    );
  }

  /// Linearly interpolate between two [MenuItem] themes.
  static MenuSectionThemeData lerp(
      MenuSectionThemeData? a, MenuSectionThemeData? b, double t) {
    return MenuSectionThemeData(
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        brightness,
        padding,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MenuSectionThemeData &&
        other.labelColor == labelColor &&
        other.padding == padding;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
      'padding',
      padding,
      defaultValue: null,
    ));
  }
}

class MenuSectionTheme extends InheritedTheme {
  const MenuSectionTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MenuSectionThemeData data;

  static MenuSectionThemeData of(BuildContext context) {
    final MenuSectionTheme? menuSectionTheme =
        context.dependOnInheritedWidgetOfExactType<MenuSectionTheme>();
    return menuSectionTheme?.data ?? Theme.of(context).menuSectionTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MenuSectionTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MenuSectionTheme oldWidget) => data != oldWidget.data;
}
