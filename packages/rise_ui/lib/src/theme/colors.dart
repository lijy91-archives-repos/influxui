import 'package:flutter/painting.dart';

class ShadedColor extends ColorSwatch<int> {
  /// Creates a color swatch with a variety of shades.
  ///
  /// The `primary` argument should be the 32 bit ARGB value of one of the
  /// values in the swatch, as would be passed to the [Color.new] constructor
  /// for that same color, and as is exposed by [value]. (This is distinct from
  /// the specific index of the color in the swatch.)
  const ShadedColor(super.primary, super.swatch);

  /// The lightest shade.
  Color get shade50 => this[50]!;

  /// The second lightest shade.
  Color get shade100 => this[100]!;

  /// The third lightest shade.
  Color get shade200 => this[200]!;

  /// The fourth lightest shade.
  Color get shade300 => this[300]!;

  /// The fifth lightest shade.
  Color get shade400 => this[400]!;

  /// The default shade.
  Color get shade500 => this[500]!;

  /// The fourth darkest shade.
  Color get shade600 => this[600]!;

  /// The third darkest shade.
  Color get shade700 => this[700]!;

  /// The second darkest shade.
  Color get shade800 => this[800]!;

  /// The darkest shade.
  Color get shade900 => this[900]!;
}

/// [Color] and [ColorSwatch] constants which represent Material design's
/// [color palette](https://material.io/design/color/).
///
/// Instead of using an absolute color from these palettes, consider using
/// [Theme.of] to obtain the local [ThemeData.colorScheme], which defines
/// the colors that most of the Material components use by default.
///
///
/// Most swatches have colors from 100 to 900 in increments of one hundred, plus
/// the color 50. The smaller the number, the more pale the color. The greater
/// the number, the darker the color. The accent swatches (e.g. [redAccent]) only
/// have the values 100, 200, 400, and 700.
///
/// In addition, a series of blacks and whites with common opacities are
/// available. For example, [black54] is a pure black with 54% opacity.
///
/// {@tool snippet}
///
/// To select a specific color from one of the swatches, index into the swatch
/// using an integer for the specific color desired, as follows:
///
/// ```dart
/// Color selection = Colors.green[400]!; // Selects a mid-range green.
/// ```
/// {@end-tool}
/// {@tool snippet}
///
/// Each [ColorSwatch] constant is a color and can used directly. For example:
///
/// ```dart
/// Container(
///   color: Colors.blue, // same as Colors.blue[500] or Colors.blue.shade500
/// )
/// ```
/// {@end-tool}
///
/// ## Color palettes
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pink.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.pinkAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.redAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrange.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepOrangeAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orange.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.orangeAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amber.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.amberAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellow.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.yellowAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lime.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.limeAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreen.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightGreenAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.green.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.greenAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.teal.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.tealAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyan.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.cyanAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlueAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blue.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigo.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.indigoAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purple.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.purpleAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurple.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.deepPurpleAccent.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blueGrey.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.brown.png)
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.grey.png)
///
/// ## Blacks and whites
///
/// These colors are identified by their transparency. The low transparency
/// levels (e.g. [Colors.white12] and [Colors.white10]) are very hard to see and
/// should be avoided in general. They are intended for very subtle effects.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
///
/// The [Colors.transparent] color isn't shown here because it is entirely
/// invisible!
///
/// See also:
///
///  * Cookbook: [Use themes to share colors and font styles](https://flutter.dev/docs/cookbook/design/themes)
class Colors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Colors._();

  /// Completely invisible.
  static const Color transparent = Color(0x00000000);

  /// Completely opaque black.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [black87], [black54], [black45], [black38], [black26], [black12], which
  ///    are variants on this color but with different opacities.
  ///  * [white], a solid white color.
  ///  * [transparent], a fully-transparent color.
  static const Color black = Color(0xFF000000);

  /// Black with 87% opacity.
  ///
  /// This is a good contrasting color for text in light themes.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [Typography.black], which uses this color for its text styles.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [black], [black54], [black45], [black38], [black26], [black12], which
  ///    are variants on this color but with different opacities.
  static const Color black87 = Color(0xDD000000);

  /// Black with 54% opacity.
  ///
  /// This is a color commonly used for headings in light themes. It's also used
  /// as the mask color behind dialogs.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [Typography.black], which uses this color for its text styles.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [black], [black87], [black45], [black38], [black26], [black12], which
  ///    are variants on this color but with different opacities.
  static const Color black54 = Color(0x8A000000);

  /// Black with 45% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [black], [black87], [black54], [black38], [black26], [black12], which
  ///    are variants on this color but with different opacities.
  static const Color black45 = Color(0x73000000);

  /// Black with 38% opacity.
  ///
  /// For light themes, i.e. when the Theme's [ThemeData.brightness] is
  /// [Brightness.light], this color is used for disabled icons and for
  /// placeholder text in [DataTable].
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [black], [black87], [black54], [black45], [black26], [black12], which
  ///    are variants on this color but with different opacities.
  static const Color black38 = Color(0x61000000);

  /// Black with 26% opacity.
  ///
  /// Used for disabled radio buttons and the text of disabled flat buttons in light themes.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [ThemeData.disabledColor], which uses this color by default in light themes.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [black], [black87], [black54], [black45], [black38], [black12], which
  ///    are variants on this color but with different opacities.
  static const Color black26 = Color(0x42000000);

  /// Black with 12% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// Used for the background of disabled raised buttons in light themes.
  ///
  /// See also:
  ///
  ///  * [black], [black87], [black54], [black45], [black38], [black26], which
  ///    are variants on this color but with different opacities.
  static const Color black12 = Color(0x1F000000);

  /// Completely opaque white.
  ///
  /// This is a good contrasting color for the [ThemeData.primaryColor] in the
  /// dark theme. See [ThemeData.brightness].
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [Typography.white], which uses this color for its text styles.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [white70], [white60], [white54], [white38], [white30], [white12],
  ///    [white10], which are variants on this color but with different
  ///    opacities.
  ///  * [black], a solid black color.
  ///  * [transparent], a fully-transparent color.
  static const Color white = Color(0xFFFFFFFF);

  /// White with 70% opacity.
  ///
  /// This is a color commonly used for headings in dark themes.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [Typography.white], which uses this color for its text styles.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [white], [white60], [white54], [white38], [white30], [white12],
  ///    [white10], which are variants on this color but with different
  ///    opacities.
  static const Color white70 = Color(0xB3FFFFFF);

  /// White with 60% opacity.
  ///
  /// Used for medium-emphasis text and hint text when [ThemeData.brightness] is
  /// set to [Brightness.dark].
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [ExpandIcon], which uses this color for dark themes.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [white], [white54], [white30], [white38], [white12], [white10], which
  ///    are variants on this color but with different opacities.
  static const Color white60 = Color(0x99FFFFFF);

  /// White with 54% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [white], [white60], [white38], [white30], [white12], [white10], which
  ///    are variants on this color but with different opacities.
  static const Color white54 = Color(0x8AFFFFFF);

  /// White with 38% opacity.
  ///
  /// Used for disabled radio buttons and the text of disabled flat buttons in dark themes.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [ThemeData.disabledColor], which uses this color by default in dark themes.
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [white], [white60], [white54], [white70], [white30], [white12],
  ///    [white10], which are variants on this color but with different
  ///    opacities.
  static const Color white38 = Color(0x62FFFFFF);

  /// White with 30% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [Theme.of], which allows you to select colors from the current theme
  ///    rather than hard-coding colors in your build methods.
  ///  * [white], [white60], [white54], [white70], [white38], [white12],
  ///    [white10], which are variants on this color but with different
  ///    opacities.
  static const Color white30 = Color(0x4DFFFFFF);

  /// White with 24% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// Used for the splash color for filled buttons.
  ///
  /// See also:
  ///
  ///  * [white], [white60], [white54], [white70], [white38], [white30],
  ///    [white10], which are variants on this color
  ///    but with different opacities.
  static const Color white24 = Color(0x3DFFFFFF);

  /// White with 12% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// Used for the background of disabled raised buttons in dark themes.
  ///
  /// See also:
  ///
  ///  * [white], [white60], [white54], [white70], [white38], [white30],
  ///    [white10], which are variants on this color but with different
  ///    opacities.
  static const Color white12 = Color(0x1FFFFFFF);

  /// White with 10% opacity.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.whites.png)
  ///
  /// See also:
  ///
  ///  * [white], [white60], [white54], [white70], [white38], [white30],
  ///    [white12], which are variants on this color
  ///    but with different opacities.
  ///  * [transparent], a fully-transparent color, not far from this one.
  static const Color white10 = Color(0x1AFFFFFF);

  static const ShadedColor gray = ShadedColor(
    _grayPrimaryValue,
    <int, Color>{
      50: Color(0xFFf8f9fa),
      100: Color(0xFFf1f3f5),
      200: Color(0xFFe9ecef),
      300: Color(0xFFdee2e6),
      400: Color(0xFFced4da),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF868e96),
      700: Color(0xFF495057),
      800: Color(0xFF343a40),
      900: Color(0xFF212529),
    },
  );
  static const int _grayPrimaryValue = 0xFFadb5bd;

  /// The red primary color and swatch.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Icon(
  ///   Icons.widgets,
  ///   color: Colors.red[400],
  /// )
  /// ```
  /// {@end-tool}
  static const ShadedColor red = ShadedColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFfff5f5),
      100: Color(0xFFffe3e3),
      200: Color(0xFFffc9c9),
      300: Color(0xFFffa8a8),
      400: Color(0xFFff8787),
      500: Color(_redPrimaryValue),
      600: Color(0xFFfa5252),
      700: Color(0xFFf03e3e),
      800: Color(0xFFe03131),
      900: Color(0xFFc92a2a),
    },
  );
  static const int _redPrimaryValue = 0xFFff6b6b;

  static const ShadedColor pink = ShadedColor(
    _pinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFfff0f6),
      100: Color(0xFFffdeeb),
      200: Color(0xFFfcc2d7),
      300: Color(0xFFfaa2c1),
      400: Color(0xFFf783ac),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFe64980),
      700: Color(0xFFd6336c),
      800: Color(0xFFc2255c),
      900: Color(0xFFa61e4d),
    },
  );
  static const int _pinkPrimaryValue = 0xFFf06595;

  static const ShadedColor grape = ShadedColor(
    _grapePrimaryValue,
    <int, Color>{
      50: Color(0xFFf8f0fc),
      100: Color(0xFFf3d9fa),
      200: Color(0xFFeebefa),
      300: Color(0xFFe599f7),
      400: Color(0xFFda77f2),
      500: Color(_grapePrimaryValue),
      600: Color(0xFFbe4bdb),
      700: Color(0xFFae3ec9),
      800: Color(0xFF9c36b5),
      900: Color(0xFF862e9c),
    },
  );
  static const int _grapePrimaryValue = 0xFFcc5de8;

  static const ShadedColor violet = ShadedColor(
    _violetPrimaryValue,
    <int, Color>{
      50: Color(0xFFf3f0ff),
      100: Color(0xFFe5dbff),
      200: Color(0xFFd0bfff),
      300: Color(0xFFb197fc),
      400: Color(0xFF9775fa),
      500: Color(_violetPrimaryValue),
      600: Color(0xFF7950f2),
      700: Color(0xFF7048e8),
      800: Color(0xFF6741d9),
      900: Color(0xFF5f3dc4),
    },
  );
  static const int _violetPrimaryValue = 0xFF845ef7;

  static const ShadedColor indigo = ShadedColor(
    _indigoPrimaryValue,
    <int, Color>{
      50: Color(0xFFedf2ff),
      100: Color(0xFFdbe4ff),
      200: Color(0xFFbac8ff),
      300: Color(0xFF91a7ff),
      400: Color(0xFF748ffc),
      500: Color(_indigoPrimaryValue),
      600: Color(0xFF4c6ef5),
      700: Color(0xFF4263eb),
      800: Color(0xFF3b5bdb),
      900: Color(0xFF364fc7),
    },
  );
  static const int _indigoPrimaryValue = 0xFF5c7cfa;

  static const ShadedColor blue = ShadedColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFe7f5ff),
      100: Color(0xFFd0ebff),
      200: Color(0xFFa5d8ff),
      300: Color(0xFF74c0fc),
      400: Color(0xFF4dabf7),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF228be6),
      700: Color(0xFF1c7ed6),
      800: Color(0xFF1971c2),
      900: Color(0xFF1864ab),
    },
  );
  static const int _bluePrimaryValue = 0xFF339af0;

  static const ShadedColor cyan = ShadedColor(
    _cyanPrimaryValue,
    <int, Color>{
      50: Color(0xFFe3fafc),
      100: Color(0xFFc5f6fa),
      200: Color(0xFF99e9f2),
      300: Color(0xFF66d9e8),
      400: Color(0xFF3bc9db),
      500: Color(_cyanPrimaryValue),
      600: Color(0xFF15aabf),
      700: Color(0xFF1098ad),
      800: Color(0xFF0c8599),
      900: Color(0xFF0b7285),
    },
  );
  static const int _cyanPrimaryValue = 0xFF22b8cf;

  static const ShadedColor teal = ShadedColor(
    _tealPrimaryValue,
    <int, Color>{
      50: Color(0xFFe6fcf5),
      100: Color(0xFFc3fae8),
      200: Color(0xFF96f2d7),
      300: Color(0xFF63e6be),
      400: Color(0xFF38d9a9),
      500: Color(_tealPrimaryValue),
      600: Color(0xFF12b886),
      700: Color(0xFF0ca678),
      800: Color(0xFF099268),
      900: Color(0xFF087f5b),
    },
  );
  static const int _tealPrimaryValue = 0xFF20c997;

  static const ShadedColor green = ShadedColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFebfbee),
      100: Color(0xFFd3f9d8),
      200: Color(0xFFb2f2bb),
      300: Color(0xFF8ce99a),
      400: Color(0xFF69db7c),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF40c057),
      700: Color(0xFF37b24d),
      800: Color(0xFF2f9e44),
      900: Color(0xFF2b8a3e),
    },
  );
  static const int _greenPrimaryValue = 0xFF51cf66;

  static const ShadedColor lime = ShadedColor(
    _limePrimaryValue,
    <int, Color>{
      50: Color(0xFFf4fce3),
      100: Color(0xFFe9fac8),
      200: Color(0xFFd8f5a2),
      300: Color(0xFFc0eb75),
      400: Color(0xFFa9e34b),
      500: Color(_limePrimaryValue),
      600: Color(0xFF82c91e),
      700: Color(0xFF74b816),
      800: Color(0xFF66a80f),
      900: Color(0xFF5c940d),
    },
  );
  static const int _limePrimaryValue = 0xFF94d82d;

  static const ShadedColor yellow = ShadedColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFfff9db),
      100: Color(0xFFfff3bf),
      200: Color(0xFFffec99),
      300: Color(0xFFffe066),
      400: Color(0xFFffd43b),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFFfab005),
      700: Color(0xFFf59f00),
      800: Color(0xFFf08c00),
      900: Color(0xFFe67700),
    },
  );
  static const int _yellowPrimaryValue = 0xFFfcc419;

  static const ShadedColor orange = ShadedColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFfff4e6),
      100: Color(0xFFffe8cc),
      200: Color(0xFFffd8a8),
      300: Color(0xFFffc078),
      400: Color(0xFFffa94d),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFfd7e14),
      700: Color(0xFFf76707),
      800: Color(0xFFe8590c),
      900: Color(0xFFd9480f),
    },
  );
  static const int _orangePrimaryValue = 0xFFff922b;

  static const ShadedColor darkGray = ShadedColor(
    _darkGrayPrimaryValue,
    <int, Color>{
      50: Color(0xFFC1C2C5),
      100: Color(0xFFA6A7AB),
      200: Color(0xFF909296),
      300: Color(0xFF5c5f66),
      400: Color(0xFF373A40),
      500: Color(_darkGrayPrimaryValue),
      600: Color(0xFF25262b),
      700: Color(0xFF1A1B1E),
      800: Color(0xFF141517),
      900: Color(0xFF101113),
    },
  );
  static const int _darkGrayPrimaryValue = 0xFF2C2E33;
}

final kAllColors = [
  Colors.gray,
  Colors.red,
  Colors.pink,
  Colors.grape,
  Colors.violet,
  Colors.indigo,
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lime,
  Colors.yellow,
];
