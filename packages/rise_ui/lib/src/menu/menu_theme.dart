import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/theme/theme.dart';

export 'menu_item/menu_item_theme.dart';
export 'menu_section/menu_section_theme.dart';

final _kMenuItemBrightnessedCustomizer = Customizer<Brightness, MenuThemeData>({
  Brightness.light: MenuThemeData(
    padding: EdgeInsets.all(4),
  ),
  Brightness.dark: MenuThemeData(
    padding: EdgeInsets.all(4),
  ),
});

@immutable
class MenuThemeData
    with Diagnosticable, BrightnessedCustomizable<MenuThemeData> {
  const MenuThemeData({
    this.brightness,
    this.padding,
    Customizer<Brightness, MenuThemeData>? brightnessedCustomizer,
  }) : _brightnessedCustomizer = brightnessedCustomizer;

  final Brightness? brightness;

  final EdgeInsetsGeometry? padding;

  /// The [Customizer] for [MenuThemeData]s that are brightnessed.
  final Customizer<Brightness, MenuThemeData>? _brightnessedCustomizer;

  @override
  Customizer<Brightness, MenuThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kMenuItemBrightnessedCustomizer;
  }

  @override
  MenuThemeData brightnessed(Brightness? brightness) {
    MenuThemeData? brightnessedTheme = brightnessedCustomizer.of(brightness);
    return copyWith(
      padding: brightnessedTheme?.padding ?? padding,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  MenuThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Customizer<Brightness, MenuThemeData>? brightnessedCustomizer,
  }) {
    return MenuThemeData(
      padding: padding ?? this.padding,
      brightnessedCustomizer:
          brightnessedCustomizer ?? this.brightnessedCustomizer,
    );
  }

  /// Linearly interpolate between two [MenuItem] themes.
  static MenuThemeData lerp(MenuThemeData? a, MenuThemeData? b, double t) {
    return MenuThemeData(
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
    return other is MenuThemeData && other.padding == padding;
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
