import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/button/button.dart';
import 'package:rise_ui/src/theme/theme.dart';

final _kButtonBrightnessedCustomizer = Customizer<Brightness, ButtonThemeData>({
  Brightness.light: ButtonThemeData(
    variantedCustomizer: Customizer<ButtonVariant, ButtonThemeData>({
      ButtonVariant.filled: ButtonThemeData(
        labelColor: Colors.white,
        coloredCustomizer: Customizer<Color, ButtonThemeData>({
          Colors.darkGray: ButtonThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ButtonVariant.outline: ButtonThemeData(
        colorShade: -1,
        labelColorShade: 700,
        coloredCustomizer: Customizer<Color, ButtonThemeData>({
          Colors.darkGray: ButtonThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ButtonVariant.light: ButtonThemeData(
        colorShade: 50,
        coloredCustomizer: Customizer<Color, ButtonThemeData>({
          Colors.darkGray: ButtonThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ButtonVariant.white: ButtonThemeData(
        labelColor: Colors.white,
        coloredCustomizer: Customizer<Color, ButtonThemeData>({
          Colors.darkGray: ButtonThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ButtonVariant.subtle: ButtonThemeData(
        colorShade: 50,
        coloredCustomizer: Customizer<Color, ButtonThemeData>({
          Colors.darkGray: ButtonThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ButtonVariant.gradient: ButtonThemeData(
        labelColor: Colors.white,
        coloredCustomizer: Customizer<Color, ButtonThemeData>({
          Colors.darkGray: ButtonThemeData(
            colorShade: 100,
          ),
        }),
      ),
    }),
  ),
  Brightness.dark: ButtonThemeData(
    variantedCustomizer: Customizer<ButtonVariant, ButtonThemeData>({
      ButtonVariant.light: ButtonThemeData(
        colorShade: 800,
      ),
      ButtonVariant.filled: ButtonThemeData(),
    }),
  ),
});

final _kButtonColoredCustomizer = Customizer<Color, ButtonThemeData>({});

final _kButtonSizedCustomizer = Customizer<NamedSize, ButtonThemeData>({
  NamedSize.tiny: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    size: Size(0, 16),
    labelFontSize: 9,
  ),
  NamedSize.small: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    size: Size(0, 18),
    labelFontSize: 10,
  ),
  NamedSize.medium: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    size: Size(0, 20),
    labelFontSize: 11,
  ),
  NamedSize.large: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
    size: Size(0, 26),
    labelFontSize: 13,
  ),
  NamedSize.big: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    size: Size(0, 32),
    labelFontSize: 26,
  ),
});

final _kButtonShapedCustomizer = Customizer<Shape, ButtonThemeData>({
  Shape.round: ButtonThemeData(
    cornerRadius: 4,
  ),
  Shape.pill: ButtonThemeData(
    cornerRadius: 100,
  ),
});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [Button] widgets.
///
/// Descendant widgets obtain the current [ButtonThemeData] object
/// using `ButtonTheme.of(context)`. Instances of [ButtonThemeData] can
/// be customized with [ButtonThemeData.copyWith].
///
/// Typically a [ButtonThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.buttonTheme].
///
/// All [ButtonThemeData] properties are `null` by default.
/// When null, the [Button] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class ButtonThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<ButtonThemeData>,
        VariantedCustomizable<ButtonVariant, ButtonThemeData>,
        ColoredCustomizable<ButtonThemeData>,
        SizedCustomizable<ButtonThemeData>,
        ShapedCustomizable<ButtonThemeData> {
  /// Creates the set of color, style, and size properties used to configure [Button].
  const ButtonThemeData(
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
      Customizer<Brightness, ButtonThemeData>? brightnessedCustomizer,
      Customizer<ButtonVariant, ButtonThemeData>? variantedCustomizer,
      Customizer<Color, ButtonThemeData>? coloredCustomizer,
      Customizer<Size, ButtonThemeData>? sizedCustomizer,
      Customizer<Shape, ButtonThemeData>? shapedCustomizer})
      : _brightnessedCustomizer = brightnessedCustomizer,
        _variantedCustomizer = variantedCustomizer,
        _coloredCustomizer = coloredCustomizer,
        _sizedCustomizer = sizedCustomizer,
        _shapedCustomizer = shapedCustomizer;

  /// Overrides the default value for [Button.brightness].
  final Brightness? brightness;

  /// Overrides the default value for [Button.color].
  final Color? color;

  final int? colorShade;

  /// Overrides the default value for [Button.size].
  final Size? size;

  final bool? cornered;

  final double? cornerRadius;

  /// Overrides the default value for [Button.labelColor].
  final Color? labelColor;

  final int? labelColorShade;

  /// Overrides the default value for [Button.labelFontSize].
  final double? labelFontSize;

  /// Overrides the default value for [Button.padding].
  final EdgeInsetsGeometry? padding;

  /// The [Customizer] for [ButtonThemeData]s that are brightnessed.
  final Customizer<Brightness, ButtonThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [ButtonThemeData]s that are varianted.
  final Customizer<ButtonVariant, ButtonThemeData>? _variantedCustomizer;

  /// The [Customizer] for [ButtonThemeData]s that are brightnessed.
  final Customizer<Color, ButtonThemeData>? _coloredCustomizer;

  /// The [Customizer] for [ButtonThemeData]s that are sized.
  final Customizer<Size, ButtonThemeData>? _sizedCustomizer;

  /// The [Customizer] for [ButtonThemeData]s that are shaped.
  final Customizer<Shape, ButtonThemeData>? _shapedCustomizer;

  @override
  Customizer<Brightness, ButtonThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kButtonBrightnessedCustomizer;
  }

  @override
  Customizer<ButtonVariant, ButtonThemeData> get variantedCustomizer {
    return _variantedCustomizer ??
        brightnessedCustomizer
            .of(brightness ?? Brightness.light)!
            .variantedCustomizer;
  }

  @override
  Customizer<Color, ButtonThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kButtonColoredCustomizer;
  }

  @override
  Customizer<Size, ButtonThemeData> get sizedCustomizer {
    return _sizedCustomizer ?? _kButtonSizedCustomizer;
  }

  @override
  Customizer<Shape, ButtonThemeData> get shapedCustomizer {
    return _shapedCustomizer ?? _kButtonShapedCustomizer;
  }

  @override
  ButtonThemeData brightnessed(Brightness? brightness) {
    ButtonThemeData? brightnessedTheme = brightnessedCustomizer.of(brightness);
    return copyWith(
      variantedCustomizer:
          brightnessedTheme?.variantedCustomizer ?? variantedCustomizer,
    );
  }

  @override
  ButtonThemeData varianted(ButtonVariant? variant) {
    ButtonThemeData? variantedTheme = variantedCustomizer.of(variant);
    return copyWith(
      colorShade: variantedTheme?.colorShade ?? colorShade,
      labelColor: variantedTheme?.labelColor ?? labelColor,
      labelColorShade: variantedTheme?.labelColorShade ?? labelColorShade,
      coloredCustomizer: variantedTheme?.coloredCustomizer ?? coloredCustomizer,
    );
  }

  @override
  ButtonThemeData colored(Color? color) {
    ButtonThemeData? coloredTheme = coloredCustomizer.of(color);

    return copyWith(
      color: coloredTheme?.color ?? color ?? this.color,
      colorShade: coloredTheme?.colorShade ?? colorShade,
      labelColor: coloredTheme?.labelColor ?? labelColor ?? color,
      labelColorShade: coloredTheme?.labelColorShade ?? labelColorShade,
    );
  }

  @override
  ButtonThemeData sized(Size? size) {
    ButtonThemeData? sizedTheme = sizedCustomizer.of(size);
    return copyWith(
      padding: sizedTheme?.padding ?? padding,
      size: sizedTheme?.size ?? size,
      labelFontSize: sizedTheme?.labelFontSize ?? labelFontSize,
    );
  }

  @override
  ButtonThemeData shaped(Shape? shape) {
    ButtonThemeData? shapedTheme = shapedCustomizer.of(shape);
    return copyWith(
      cornered: shapedTheme?.cornered ?? cornered,
      cornerRadius: shapedTheme?.cornerRadius ?? cornerRadius,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  ButtonThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Size? size,
    Color? color,
    int? colorShade,
    bool? cornered,
    double? cornerRadius,
    Color? labelColor,
    int? labelColorShade,
    double? labelFontSize,
    Customizer<Brightness, ButtonThemeData>? brightnessedCustomizer,
    Customizer<ButtonVariant, ButtonThemeData>? variantedCustomizer,
    Customizer<Color, ButtonThemeData>? coloredCustomizer,
    Customizer<Size, ButtonThemeData>? sizedCustomizer,
  }) {
    return ButtonThemeData(
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

  /// Linearly interpolate between two [Button] themes.
  static ButtonThemeData lerp(
      ButtonThemeData? a, ButtonThemeData? b, double t) {
    return ButtonThemeData(
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
    return other is ButtonThemeData &&
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
/// parameters for [Button]s in this widget's subtree.
///
/// Values specified here override the defaults for [Button] properties which
/// are not given an explicit non-null value.
class ButtonTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Button]s
  /// in this widget's subtree.
  const ButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Button] widgets.
  final ButtonThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [ButtonTheme] widget, then
  /// [ThemeData.buttonTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ButtonThemeData theme = ButtonTheme.of(context);
  /// ```
  static ButtonThemeData of(BuildContext context) {
    final ButtonTheme? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<ButtonTheme>();
    return buttonTheme?.data ?? Theme.of(context).buttonTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) => data != oldWidget.data;
}
