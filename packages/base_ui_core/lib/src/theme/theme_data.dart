import 'package:base_ui_core/src/badge/badge_theme.dart';
import 'package:base_ui_core/src/button/button_theme.dart';
import 'package:base_ui_core/src/kbd/kbd_theme.dart';
import 'package:base_ui_core/src/loader/loader_theme.dart';
import 'package:base_ui_core/src/text/text_theme.dart';
import 'package:base_ui_core/src/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

export 'package:flutter/services.dart' show Brightness;

// Examples can assume:
// late BuildContext context;

/// An interface that defines custom additions to a [ThemeData] object.
///
/// Typically used for custom colors. To use, subclass [ThemeExtension],
/// define a number of fields (e.g. [Color]s), and implement the [copyWith] and
/// [lerp] methods. The latter will ensure smooth transitions of properties when
/// switching themes.
///
/// {@tool dartpad}
/// This sample shows how to create and use a subclass of [ThemeExtension] that
/// defines two colors.
///
/// ** See code in examples/api/lib/material/theme/theme_extension.1.dart **
/// {@end-tool}
abstract class ThemeExtension<T extends ThemeExtension<T>> {
  /// Enable const constructor for subclasses.
  const ThemeExtension();

  /// The extension's type.
  Object get type => T;

  /// Creates a copy of this theme extension with the given fields
  /// replaced by the non-null parameter values.
  ThemeExtension<T> copyWith();

  /// Linearly interpolate with another [ThemeExtension] object.
  ///
  /// {@macro dart.ui.shadow.lerp}
  ThemeExtension<T> lerp(covariant ThemeExtension<T>? other, double t);
}

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
    // GENERAL CONFIGURATION
    Iterable<ThemeExtension<dynamic>>? extensions,
    // COLOR
    Brightness? brightness,
    Color? canvasColor,
    Color? primaryColor,
    // TYPOGRAPHY & ICONOGRAPHY
    IconThemeData? iconTheme,
    TextThemeData? textTheme,
    // COMPONENT THEMES
    BadgeThemeData? badgeTheme,
    ButtonThemeData? buttonTheme,
    KbdThemeData? kbdTheme,
    LoaderThemeData? loaderTheme,
  }) {
    // GENERAL CONFIGURATION
    extensions ??= <ThemeExtension<dynamic>>[];

    // COLOR
    canvasColor ??= const Color(0xffffffff);
    primaryColor ??= Colors.blue;

    // TYPOGRAPHY & ICONOGRAPHY
    iconTheme ??= const IconThemeData(color: Color(0xff000000));

    // COMPONENT THEMES
    badgeTheme ??= const BadgeThemeData();
    buttonTheme ??= const ButtonThemeData();
    kbdTheme ??= const KbdThemeData();
    loaderTheme ??= const LoaderThemeData();

    return ThemeData.raw(
      // GENERAL CONFIGURATION
      extensions: _themeExtensionIterableToMap(extensions),
      // COLOR
      canvasColor: canvasColor,
      primaryColor: primaryColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme,
      textTheme: textTheme ?? TextThemeData(),
      // COMPONENT THEMES
      badgeTheme: badgeTheme,
      buttonTheme: buttonTheme,
      kbdTheme: kbdTheme,
      loaderTheme: loaderTheme,
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
    // GENERAL CONFIGURATION
    required this.extensions,
    // COLOR
    required this.canvasColor,
    required this.primaryColor,
    // TYPOGRAPHY & ICONOGRAPHY
    required this.iconTheme,
    required this.textTheme,
    // COMPONENT THEMES
    required this.badgeTheme,
    required this.buttonTheme,
    required this.kbdTheme,
    required this.loaderTheme,
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
  Brightness get brightness => Brightness.light;

  // For the sanity of the reader, make sure these properties are in the same
  // order in every place that they are separated by section comments (e.g.
  // GENERAL CONFIGURATION). Each section except for deprecations should be
  // alphabetical by symbol name.

  // GENERAL CONFIGURATION

  /// Arbitrary additions to this theme.
  ///
  /// To define extensions, pass an [Iterable] containing one or more [ThemeExtension]
  /// subclasses to [ThemeData.new] or [copyWith].
  ///
  /// To obtain an extension, use [extension].
  ///
  /// {@tool dartpad}
  /// This sample shows how to create and use a subclass of [ThemeExtension] that
  /// defines two colors.
  ///
  /// ** See code in examples/api/lib/material/theme/theme_extension.1.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [extension], a convenience function for obtaining a specific extension.
  final Map<Object, ThemeExtension<dynamic>> extensions;

  /// Used to obtain a particular [ThemeExtension] from [extensions].
  ///
  /// Obtain with `Theme.of(context).extension<MyThemeExtension>()`.
  ///
  /// See [extensions] for an interactive example.
  T? extension<T>() => extensions[T] as T?;

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

  final ButtonThemeData buttonTheme;

  final KbdThemeData kbdTheme;

  final LoaderThemeData loaderTheme;

  /// Caches localized themes to speed up the [localize] method.

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  ///
  /// The [brightness] value is applied to the [colorScheme].
  ThemeData copyWith({
    // GENERAL CONFIGURATION
    Iterable<ThemeExtension<dynamic>>? extensions,
    // COLOR
    Brightness? brightness,
    Color? canvasColor,
    Color? primaryColor,
    // TYPOGRAPHY & ICONOGRAPHY
    IconThemeData? iconTheme,
    TextThemeData? textTheme,
    // COMPONENT THEMES
    BadgeThemeData? badgeTheme,
    ButtonThemeData? buttonTheme,
    KbdThemeData? kbdTheme,
    LoaderThemeData? loaderTheme,
  }) {
    return ThemeData.raw(
      // GENERAL CONFIGURATION
      extensions: (extensions != null)
          ? _themeExtensionIterableToMap(extensions)
          : this.extensions,
      // COLOR
      canvasColor: canvasColor ?? this.canvasColor,
      primaryColor: primaryColor ?? this.primaryColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme ?? this.iconTheme,
      textTheme: textTheme ?? this.textTheme,
      // COMPONENT THEMES
      badgeTheme: badgeTheme ?? this.badgeTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      kbdTheme: kbdTheme ?? this.kbdTheme,
      loaderTheme: loaderTheme ?? this.loaderTheme,
    );
  }

  /// Linearly interpolate between two [extensions].
  ///
  /// Includes all theme extensions in [a] and [b].
  ///
  /// {@macro dart.ui.shadow.lerp}
  static Map<Object, ThemeExtension<dynamic>> _lerpThemeExtensions(
      ThemeData a, ThemeData b, double t) {
    // Lerp [a].
    final Map<Object, ThemeExtension<dynamic>> newExtensions =
        a.extensions.map((Object id, ThemeExtension<dynamic> extensionA) {
      final ThemeExtension<dynamic>? extensionB = b.extensions[id];
      return MapEntry<Object, ThemeExtension<dynamic>>(
          id, extensionA.lerp(extensionB, t));
    });
    // Add [b]-only extensions.
    newExtensions.addEntries(b.extensions.entries.where(
        (MapEntry<Object, ThemeExtension<dynamic>> entry) =>
            !a.extensions.containsKey(entry.key)));

    return newExtensions;
  }

  /// Convert the [extensionsIterable] passed to [ThemeData.new] or [copyWith]
  /// to the stored [extensions] map, where each entry's key consists of the extension's type.
  static Map<Object, ThemeExtension<dynamic>> _themeExtensionIterableToMap(
      Iterable<ThemeExtension<dynamic>> extensionsIterable) {
    return Map<Object, ThemeExtension<dynamic>>.unmodifiable(<Object,
        ThemeExtension<dynamic>>{
      // Strangely, the cast is necessary for tests to run.
      for (final ThemeExtension<dynamic> extension in extensionsIterable)
        extension.type: extension as ThemeExtension<ThemeExtension<dynamic>>,
    });
  }

  /// Linearly interpolate between two themes.
  ///
  /// The arguments must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static ThemeData lerp(ThemeData a, ThemeData b, double t) {
    return ThemeData.raw(
      // GENERAL CONFIGURATION
      extensions: _lerpThemeExtensions(a, b, t),
      // COLOR
      canvasColor: Color.lerp(a.canvasColor, b.canvasColor, t)!,
      primaryColor: Color.lerp(a.primaryColor, b.primaryColor, t)!,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: IconThemeData.lerp(a.iconTheme, b.iconTheme, t),
      textTheme: TextThemeData.lerp(a.textTheme, b.textTheme, t),
      // COMPONENT THEMES
      badgeTheme: BadgeThemeData.lerp(a.badgeTheme, b.badgeTheme, t),
      buttonTheme: ButtonThemeData.lerp(a.buttonTheme, b.buttonTheme, t),
      kbdTheme: KbdThemeData.lerp(a.kbdTheme, b.kbdTheme, t),
      loaderTheme: LoaderThemeData.lerp(a.loaderTheme, b.loaderTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ThemeData &&
        // GENERAL CONFIGURATION
        mapEquals(other.extensions, extensions) &&
        // COLOR
        other.canvasColor == canvasColor &&
        // COMPONENT THEMES
        other.badgeTheme == badgeTheme &&
        other.buttonTheme == buttonTheme &&
        other.kbdTheme == kbdTheme &&
        other.loaderTheme == loaderTheme;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      // GENERAL CONFIGURATION
      ...extensions.keys,
      ...extensions.values,
      // COLOR
      canvasColor,
      // COMPONENT THEMES
      badgeTheme,
      buttonTheme,
      kbdTheme,
      loaderTheme,
    ];
    return Object.hashAll(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final ThemeData defaultData = ThemeData.fallback();
    // GENERAL CONFIGURATION
    properties.add(IterableProperty<ThemeExtension<dynamic>>(
      'extensions',
      extensions.values,
      defaultValue: defaultData.extensions.values,
      level: DiagnosticLevel.debug,
    ));
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
    properties.add(DiagnosticsProperty<ButtonThemeData>(
      'buttonTheme',
      buttonTheme,
      defaultValue: defaultData.buttonTheme,
      level: DiagnosticLevel.debug,
    ));
    properties.add(DiagnosticsProperty<KbdThemeData>(
      'kbdTheme',
      kbdTheme,
      defaultValue: defaultData.kbdTheme,
      level: DiagnosticLevel.debug,
    ));
    properties.add(DiagnosticsProperty<LoaderThemeData>(
      'loaderTheme',
      loaderTheme,
      defaultValue: defaultData.loaderTheme,
      level: DiagnosticLevel.debug,
    ));
  }
}
