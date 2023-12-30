import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide Notification;
import 'package:rise_ui/src/widgets/badge/badge_theme.dart';
import 'package:rise_ui/src/widgets/divider/divider_theme.dart';
import 'package:rise_ui/src/widgets/menu/menu_theme.dart';
import 'package:rise_ui/src/widgets/notification/notification.dart';
import 'package:rise_ui/src/widgets/text/text_theme.dart';
import 'package:rise_ui/src/widgets/theme/colors.dart';

export 'package:flutter/services.dart' show Brightness;

/// Defines the configuration of the overall visual [Theme] for a [MaterialApp]
/// or a widget subtree within the app.
///
/// The [MaterialApp] theme property can be used to configure the appearance
/// of the entire app. Widget subtree's within an app can override the app's
/// theme by including a [Theme] widget at the top of the subtree.
///
/// Widgets whose appearance should align with the overall theme can obtain the
/// current theme's configuration with [Theme.of]. Material components typically
/// depend exclusively on the [colorScheme] and [textTheme]. These properties
/// are guaranteed to have non-null values.
///
/// The static [Theme.of] method finds the [ThemeData] value specified for the
/// nearest [BuildContext] ancestor. This lookup is inexpensive, essentially
/// just a single HashMap access. It can sometimes be a little confusing
/// because [Theme.of] can not see a [Theme] widget that is defined in the
/// current build method's context. To overcome that, create a new custom widget
/// for the subtree that appears below the new [Theme], or insert a widget
/// that creates a new BuildContext, like [Builder].
///
/// {@tool snippet}
/// In this example, the [Container] widget uses [Theme.of] to retrieve the
/// primary color from the theme's [colorScheme] to draw an amber square.
/// The [Builder] widget separates the parent theme's [BuildContext] from the
/// child's [BuildContext].
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/theme_data.png)
///
/// ```dart
/// Theme(
///   data: ThemeData.from(
///     colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
///   ),
///   child: Builder(
///     builder: (BuildContext context) {
///       return Container(
///         width: 100,
///         height: 100,
///         color: Theme.of(context).colorScheme.primary,
///       );
///     },
///   ),
/// )
/// ```
/// {@end-tool}
///
/// {@tool snippet}
///
/// This sample creates a [MaterialApp] with a [Theme] whose
/// [ColorScheme] is based on [Colors.blue], but with the color
/// scheme's [ColorScheme.secondary] color overridden to be green. The
/// [AppBar] widget uses the color scheme's [ColorScheme.primary] as
/// its default background color and the [FloatingActionButton] widget
/// uses the color scheme's [ColorScheme.secondary] for its default
/// background. By default, the [Text] widget uses
/// [TextTheme.bodyMedium], and the color of that [TextStyle] has been
/// changed to purple.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/material_app_theme_data.png)
///
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     colorScheme: ColorScheme.fromSwatch().copyWith(
///       secondary: Colors.green,
///     ),
///     textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
///   ),
///   home: Scaffold(
///     appBar: AppBar(
///       title: const Text('ThemeData Demo'),
///     ),
///     floatingActionButton: FloatingActionButton(
///       child: const Icon(Icons.add),
///       onPressed: () {},
///     ),
///     body: const Center(
///       child: Text('Button pressed 0 times'),
///     ),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See <https://material.io/design/color/> for
/// more discussion on how to pick the right colors.

@immutable
class ThemeData with Diagnosticable {
  /// Create a [ThemeData] that's used to configure a [Theme].
  factory ThemeData({
    // COLOR
    Brightness? brightness,
    Color? canvasColor,
    Color? primaryColor,
    // TYPOGRAPHY & ICONOGRAPHY
    IconThemeData? iconTheme,
    TextThemeData? textTheme,
    // COMPONENT THEMES
    BadgeThemeData? badgeTheme,
    MenuThemeData? menuTheme,
    NotificationThemeData? notificationTheme,
  }) {
    // GENERAL CONFIGURATION
    brightness ??= Brightness.light;

    // COLOR
    canvasColor ??= const Color(0xffffffff);
    primaryColor ??= Colors.blue;

    // TYPOGRAPHY & ICONOGRAPHY
    iconTheme ??= const IconThemeData(color: Color(0xff000000));

    // COMPONENT THEMES
    badgeTheme ??= const BadgeThemeData();

    menuTheme ??= const MenuThemeData();
    notificationTheme ??= const NotificationThemeData();

    return ThemeData.raw(
      // GENERAL CONFIGURATION
      brightness: brightness,
      // COLOR
      canvasColor: canvasColor,
      primaryColor: primaryColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme,
      textTheme: textTheme ?? TextThemeData(),
      // COMPONENT THEMES
      badgeTheme: badgeTheme,

      menuTheme: menuTheme,
      notificationTheme: notificationTheme,
    );
  }

  /// Create a [ThemeData] given a set of exact values. Most values must be
  /// specified. They all must also be non-null except for
  /// [cupertinoOverrideTheme], and deprecated members.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [ThemeData] constructor.
  const ThemeData.raw({
    // COLOR
    required this.brightness,
    required this.canvasColor,
    required this.primaryColor,
    // TYPOGRAPHY & ICONOGRAPHY
    required this.iconTheme,
    required this.textTheme,
    // COMPONENT THEMES
    required this.badgeTheme,
    required this.menuTheme,
    required this.notificationTheme,
  });

  /// A default light blue theme.
  factory ThemeData.light() => ThemeData(brightness: Brightness.light);

  /// A default dark theme with a teal secondary [ColorScheme] color.
  factory ThemeData.dark() => ThemeData(brightness: Brightness.dark);

  /// The default color theme. Same as [ThemeData.light].
  factory ThemeData.fallback() => ThemeData.light();

  /// The overall theme brightness.
  ///
  /// The default [TextStyle] color for the [textTheme] is black if the
  /// theme is constructed with [Brightness.light] and white if the
  /// theme is constructed with [Brightness.dark].
  final Brightness brightness;

  // For the sanity of the reader, make sure these properties are in the same
  // order in every place that they are separated by section comments (e.g.
  // GENERAL CONFIGURATION). Each section except for deprecations should be
  // alphabetical by symbol name.

  // COLOR

  /// The default color of [MaterialType.canvas] [Material].
  final Color canvasColor;

  /// The background color for major parts of the app (toolbars, tab bars, etc)
  ///
  /// The theme's [colorScheme] property contains [ColorScheme.primary], as
  /// well as a color that contrasts well with the primary color called
  /// [ColorScheme.onPrimary]. It might be simpler to just configure an app's
  /// visuals in terms of the theme's [colorScheme].
  final Color primaryColor;

  // TYPOGRAPHY & ICONOGRAPHY

  /// An icon theme that contrasts with the card and canvas colors.
  final IconThemeData iconTheme;

  /// Text with a color that contrasts with the card and canvas colors.
  final TextThemeData textTheme;

  // COMPONENT THEMES

  /// A theme for customizing the color of [Badge]s.
  final BadgeThemeData badgeTheme;

  final MenuThemeData menuTheme;

  final NotificationThemeData notificationTheme;

  /// Caches localized themes to speed up the [localize] method.

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  ///
  /// The [brightness] value is applied to the [colorScheme].
  ThemeData copyWith({
    // COLOR
    Brightness? brightness,
    Color? canvasColor,
    Color? primaryColor,
    // TYPOGRAPHY & ICONOGRAPHY
    IconThemeData? iconTheme,
    TextThemeData? textTheme,
    // COMPONENT THEMES
    BadgeThemeData? badgeTheme,
    DividerThemeData? dividerTheme,
    MenuThemeData? menuTheme,
    NotificationThemeData? notificationTheme,
  }) {
    return ThemeData.raw(
      // COLOR
      brightness: brightness ?? this.brightness,
      canvasColor: canvasColor ?? this.canvasColor,
      primaryColor: primaryColor ?? this.primaryColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme ?? this.iconTheme,
      textTheme: textTheme ?? this.textTheme,
      // COMPONENT THEMES
      badgeTheme: badgeTheme ?? this.badgeTheme,
      menuTheme: menuTheme ?? this.menuTheme,
      notificationTheme: notificationTheme ?? this.notificationTheme,
    );
  }

  /// Linearly interpolate between two themes.
  ///
  /// The arguments must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static ThemeData lerp(ThemeData a, ThemeData b, double t) {
    return ThemeData.raw(
      // COLOR
      brightness: t < 0.5 ? a.brightness : b.brightness,
      canvasColor: Color.lerp(a.canvasColor, b.canvasColor, t)!,
      primaryColor: Color.lerp(a.primaryColor, b.primaryColor, t)!,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: IconThemeData.lerp(a.iconTheme, b.iconTheme, t),
      textTheme: TextThemeData.lerp(a.textTheme, b.textTheme, t),
      // COMPONENT THEMES
      badgeTheme: BadgeThemeData.lerp(a.badgeTheme, b.badgeTheme, t),

      menuTheme: MenuThemeData.lerp(a.menuTheme, b.menuTheme, t),
      notificationTheme: NotificationThemeData.lerp(
          a.notificationTheme, b.notificationTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ThemeData &&
        // COLOR
        other.canvasColor == canvasColor &&
        // COMPONENT THEMES
        other.badgeTheme == badgeTheme &&
        other.notificationTheme == notificationTheme;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      // COLOR
      canvasColor,
      // COMPONENT THEMES
      badgeTheme,

      notificationTheme,
    ];
    return Object.hashAll(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final ThemeData defaultData = ThemeData.fallback();
    // COLORS
    properties.add(ColorProperty(
      'canvasColor',
      canvasColor,
      defaultValue: defaultData.canvasColor,
      level: DiagnosticLevel.debug,
    ));
    // COMPONENT THEMES
    properties.add(DiagnosticsProperty<BadgeThemeData>(
      'badgeTheme',
      badgeTheme,
      defaultValue: defaultData.badgeTheme,
      level: DiagnosticLevel.debug,
    ));
    properties.add(DiagnosticsProperty<NotificationThemeData>(
      'notificationTheme',
      notificationTheme,
      defaultValue: defaultData.notificationTheme,
      level: DiagnosticLevel.debug,
    ));
  }
}
