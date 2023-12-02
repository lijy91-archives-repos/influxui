import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/badge/badge.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

final _kBadgeBrightnessedCustomizer = Customizer<Brightness, BadgeThemeData>({
  Brightness.light: BadgeThemeData(
    variantedCustomizer: Customizer<BadgeVariant, BadgeThemeData>({
      BadgeVariant.light: BadgeThemeData(
        colorShade: 50,
        coloredCustomizer: Customizer<Color, BadgeThemeData>({
          Colors.darkGray: BadgeThemeData(
            colorShade: 100,
          ),
        }),
      ),
      BadgeVariant.filled: BadgeThemeData(
        labelColor: Colors.white,
        coloredCustomizer: Customizer<Color, BadgeThemeData>({
          Colors.darkGray: BadgeThemeData(
            colorShade: 100,
          ),
        }),
      ),
      BadgeVariant.outline: BadgeThemeData(
        colorShade: -1,
        labelColorShade: 700,
        coloredCustomizer: Customizer<Color, BadgeThemeData>({
          Colors.darkGray: BadgeThemeData(
            colorShade: 100,
          ),
        }),
      ),
    }),
  ),
  Brightness.dark: BadgeThemeData(
    variantedCustomizer: Customizer<BadgeVariant, BadgeThemeData>({
      BadgeVariant.light: BadgeThemeData(
        colorShade: 800,
      ),
      BadgeVariant.filled: BadgeThemeData(
        labelColor: Colors.white,
      ),
    }),
  ),
});

final _kBadgeColoredCustomizer = Customizer<Color, BadgeThemeData>({});

final _kBadgeSizedCustomizer = Customizer<NamedSize, BadgeThemeData>({
  NamedSize.tiny: BadgeThemeData(
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    size: Size(0, 16),
    labelFontSize: 9,
  ),
  NamedSize.small: BadgeThemeData(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    size: Size(0, 18),
    labelFontSize: 10,
  ),
  NamedSize.medium: BadgeThemeData(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    size: Size(0, 20),
    labelFontSize: 11,
  ),
  NamedSize.large: BadgeThemeData(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
    size: Size(0, 26),
    labelFontSize: 13,
  ),
  NamedSize.big: BadgeThemeData(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    size: Size(0, 32),
    labelFontSize: 26,
  ),
});

final _kBadgeShapedCustomizer = Customizer<Shape, BadgeThemeData>({
  Shape.round: BadgeThemeData(
    cornerRadius: 4,
  ),
  Shape.pill: BadgeThemeData(
    cornerRadius: 100,
  ),
});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [Badge] widgets.
///
/// Descendant widgets obtain the current [BadgeThemeData] object
/// using `BadgeTheme.of(context)`. Instances of [BadgeThemeData] can
/// be customized with [BadgeThemeData.copyWith].
///
/// Typically a [BadgeThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.badgeTheme].
///
/// All [BadgeThemeData] properties are `null` by default.
/// When null, the [Badge] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class BadgeThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<BadgeThemeData>,
        VariantedCustomizable<BadgeVariant, BadgeThemeData>,
        ColoredCustomizable<BadgeThemeData>,
        SizedCustomizable<BadgeThemeData>,
        ShapedCustomizable<BadgeThemeData> {
  /// Creates the set of color, style, and size properties used to configure [Badge].
  const BadgeThemeData(
      {this.brightness,
      this.padding,
      this.color,
      this.colorShade,
      this.size,
      this.cornered,
      this.cornerRadius,
      this.labelColor,
      this.labelColorShade,
      this.labelFontSize,
      Customizer<Brightness, BadgeThemeData>? brightnessedCustomizer,
      Customizer<BadgeVariant, BadgeThemeData>? variantedCustomizer,
      Customizer<Color, BadgeThemeData>? coloredCustomizer,
      Customizer<Size, BadgeThemeData>? sizedCustomizer,
      Customizer<Shape, BadgeThemeData>? shapedCustomizer})
      : _brightnessedCustomizer = brightnessedCustomizer,
        _variantedCustomizer = variantedCustomizer,
        _coloredCustomizer = coloredCustomizer,
        _sizedCustomizer = sizedCustomizer,
        _shapedCustomizer = shapedCustomizer;

  /// Overrides the default value for [Badge.brightness].
  final Brightness? brightness;

  /// Overrides the default value for [Badge.color].
  final Color? color;

  final int? colorShade;

  /// Overrides the default value for [Badge.size].
  final Size? size;

  final bool? cornered;

  final double? cornerRadius;

  /// Overrides the default value for [Badge.labelColor].
  final Color? labelColor;

  final int? labelColorShade;

  /// Overrides the default value for [Badge.labelFontSize].
  final double? labelFontSize;

  /// Overrides the default value for [Badge.padding].
  final EdgeInsetsGeometry? padding;

  /// The [Customizer] for [BadgeThemeData]s that are brightnessed.
  final Customizer<Brightness, BadgeThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [BadgeThemeData]s that are varianted.
  final Customizer<BadgeVariant, BadgeThemeData>? _variantedCustomizer;

  /// The [Customizer] for [BadgeThemeData]s that are brightnessed.
  final Customizer<Color, BadgeThemeData>? _coloredCustomizer;

  /// The [Customizer] for [BadgeThemeData]s that are sized.
  final Customizer<Size, BadgeThemeData>? _sizedCustomizer;

  /// The [Customizer] for [BadgeThemeData]s that are shaped.
  final Customizer<Shape, BadgeThemeData>? _shapedCustomizer;

  @override
  Customizer<Brightness, BadgeThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kBadgeBrightnessedCustomizer;
  }

  @override
  Customizer<BadgeVariant, BadgeThemeData> get variantedCustomizer {
    return _variantedCustomizer ??
        brightnessedCustomizer
            .of(brightness ?? Brightness.light)!
            .variantedCustomizer;
  }

  @override
  Customizer<Color, BadgeThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kBadgeColoredCustomizer;
  }

  @override
  Customizer<Size, BadgeThemeData> get sizedCustomizer {
    return _sizedCustomizer ?? _kBadgeSizedCustomizer;
  }

  @override
  Customizer<Shape, BadgeThemeData> get shapedCustomizer {
    return _shapedCustomizer ?? _kBadgeShapedCustomizer;
  }

  @override
  BadgeThemeData brightnessed(Brightness? brightness) {
    BadgeThemeData? brightnessedTheme = brightnessedCustomizer.of(brightness);
    return copyWith(
      variantedCustomizer:
          brightnessedTheme?.variantedCustomizer ?? variantedCustomizer,
    );
  }

  @override
  BadgeThemeData varianted(BadgeVariant? variant) {
    BadgeThemeData? variantedTheme = variantedCustomizer.of(variant);
    return copyWith(
      colorShade: variantedTheme?.colorShade ?? colorShade,
      labelColor: variantedTheme?.labelColor ?? labelColor,
      labelColorShade: variantedTheme?.labelColorShade ?? labelColorShade,
      coloredCustomizer: variantedTheme?.coloredCustomizer ?? coloredCustomizer,
    );
  }

  @override
  BadgeThemeData colored(Color? color) {
    BadgeThemeData? coloredTheme = coloredCustomizer.of(color);

    return copyWith(
      color: coloredTheme?.color ?? color ?? this.color,
      colorShade: coloredTheme?.colorShade ?? colorShade,
      labelColor: coloredTheme?.labelColor ?? labelColor ?? color,
      labelColorShade: coloredTheme?.labelColorShade ?? labelColorShade,
    );
  }

  @override
  BadgeThemeData sized(Size? size) {
    BadgeThemeData? sizedTheme = sizedCustomizer.of(size);
    return copyWith(
      padding: sizedTheme?.padding ?? padding,
      size: sizedTheme?.size ?? size,
      labelFontSize: sizedTheme?.labelFontSize ?? labelFontSize,
    );
  }

  @override
  BadgeThemeData shaped(Shape? shape) {
    BadgeThemeData? shapedTheme = shapedCustomizer.of(shape);
    return copyWith(
      cornered: shapedTheme?.cornered ?? cornered,
      cornerRadius: shapedTheme?.cornerRadius ?? cornerRadius,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  BadgeThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Size? size,
    Color? color,
    int? colorShade,
    bool? cornered,
    double? cornerRadius,
    Color? labelColor,
    int? labelColorShade,
    double? labelFontSize,
    Customizer<Brightness, BadgeThemeData>? brightnessedCustomizer,
    Customizer<BadgeVariant, BadgeThemeData>? variantedCustomizer,
    Customizer<Color, BadgeThemeData>? coloredCustomizer,
    Customizer<Size, BadgeThemeData>? sizedCustomizer,
  }) {
    return BadgeThemeData(
      padding: padding ?? this.padding,
      size: size ?? this.size,
      color: color ?? this.color,
      colorShade: colorShade ?? this.colorShade,
      cornered: cornered ?? this.cornered,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      labelColor: labelColor ?? this.labelColor,
      labelColorShade: labelColorShade ?? this.labelColorShade,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      brightnessedCustomizer:
          brightnessedCustomizer ?? this.brightnessedCustomizer,
      variantedCustomizer: variantedCustomizer ?? this.variantedCustomizer,
      coloredCustomizer: coloredCustomizer ?? this.coloredCustomizer,
      sizedCustomizer: sizedCustomizer ?? this.sizedCustomizer,
    );
  }

  /// Linearly interpolate between two [Badge] themes.
  static BadgeThemeData lerp(BadgeThemeData? a, BadgeThemeData? b, double t) {
    return BadgeThemeData(
      size: Size.lerp(a?.size, b?.size, t),
      color: Color.lerp(a?.color, b?.color, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        brightness,
        padding,
        size,
        color,
        cornerRadius,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is BadgeThemeData &&
        other.size == size &&
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

/// An inherited widget that overrides the default color style, and size
/// parameters for [Badge]s in this widget's subtree.
///
/// Values specified here override the defaults for [Badge] properties which
/// are not given an explicit non-null value.
class BadgeTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Badge]s
  /// in this widget's subtree.
  const BadgeTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Badge] widgets.
  final BadgeThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [BadgeTheme] widget, then
  /// [ThemeData.badgeTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// BadgeThemeData theme = BadgeTheme.of(context);
  /// ```
  static BadgeThemeData of(BuildContext context) {
    final BadgeTheme? badgeTheme =
        context.dependOnInheritedWidgetOfExactType<BadgeTheme>();
    return badgeTheme?.data ?? Theme.of(context).badgeTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) => data != oldWidget.data;
}
