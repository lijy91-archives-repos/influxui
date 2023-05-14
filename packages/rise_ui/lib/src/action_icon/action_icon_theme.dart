import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/action_icon/action_icon.dart';
import 'package:rise_ui/src/theme/theme.dart';

final _kActionIconBrightnessedCustomizer =
    Customizer<Brightness, ActionIconThemeData>({
  Brightness.light: ActionIconThemeData(
    variantedCustomizer: Customizer<ActionIconVariant, ActionIconThemeData>({
      ActionIconVariant.light: ActionIconThemeData(
        colorShade: 50,
        coloredCustomizer: Customizer<Color, ActionIconThemeData>({
          Colors.darkGray: ActionIconThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ActionIconVariant.filled: ActionIconThemeData(
        coloredCustomizer: Customizer<Color, ActionIconThemeData>({
          Colors.darkGray: ActionIconThemeData(
            colorShade: 100,
          ),
        }),
      ),
      ActionIconVariant.outline: ActionIconThemeData(
        colorShade: -1,
        coloredCustomizer: Customizer<Color, ActionIconThemeData>({
          Colors.darkGray: ActionIconThemeData(
            colorShade: 100,
          ),
        }),
      ),
    }),
  ),
  Brightness.dark: ActionIconThemeData(
    variantedCustomizer: Customizer<ActionIconVariant, ActionIconThemeData>({
      ActionIconVariant.light: ActionIconThemeData(
        colorShade: 800,
      ),
      ActionIconVariant.filled: ActionIconThemeData(),
    }),
  ),
});

final _kActionIconColoredCustomizer =
    Customizer<Color, ActionIconThemeData>({});

final _kActionIconSizedCustomizer = Customizer<NamedSize, ActionIconThemeData>({
  NamedSize.tiny: ActionIconThemeData(
    size: Size.square(18),
  ),
  NamedSize.small: ActionIconThemeData(
    size: Size.square(22),
  ),
  NamedSize.medium: ActionIconThemeData(
    size: Size.square(28),
  ),
  NamedSize.large: ActionIconThemeData(
    size: Size.square(4),
  ),
  NamedSize.big: ActionIconThemeData(
    size: Size.square(44),
  ),
});

final _kActionIconShapedCustomizer = Customizer<Shape, ActionIconThemeData>({
  Shape.round: ActionIconThemeData(
    cornerRadius: 4,
  ),
  Shape.pill: ActionIconThemeData(
    cornerRadius: 100,
  ),
});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [ActionIcon] widgets.
///
/// Descendant widgets obtain the current [ActionIconThemeData] object
/// using `ActionIconTheme.of(context)`. Instances of [ActionIconThemeData] can
/// be customized with [ActionIconThemeData.copyWith].
///
/// Typically a [ActionIconThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.actionIconTheme].
///
/// All [ActionIconThemeData] properties are `null` by default.
/// When null, the [ActionIcon] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class ActionIconThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<ActionIconThemeData>,
        VariantedCustomizable<ActionIconVariant, ActionIconThemeData>,
        ColoredCustomizable<ActionIconThemeData>,
        SizedCustomizable<ActionIconThemeData>,
        ShapedCustomizable<ActionIconThemeData> {
  /// Creates the set of color, style, and size properties used to configure [ActionIcon].
  const ActionIconThemeData({
    this.brightness,
    this.color,
    this.colorShade,
    this.size,
    this.cornered,
    this.cornerRadius,
    Customizer<Brightness, ActionIconThemeData>? brightnessedCustomizer,
    Customizer<ActionIconVariant, ActionIconThemeData>? variantedCustomizer,
    Customizer<Color, ActionIconThemeData>? coloredCustomizer,
    Customizer<Size, ActionIconThemeData>? sizedCustomizer,
    Customizer<Shape, ActionIconThemeData>? shapedCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _variantedCustomizer = variantedCustomizer,
        _coloredCustomizer = coloredCustomizer,
        _sizedCustomizer = sizedCustomizer,
        _shapedCustomizer = shapedCustomizer;

  /// Overrides the default value for [ActionIcon.brightness].
  final Brightness? brightness;

  /// Overrides the default value for [ActionIcon.color].
  final Color? color;

  final int? colorShade;

  /// Overrides the default value for [ActionIcon.size].
  final Size? size;

  final bool? cornered;

  final double? cornerRadius;

  /// The [Customizer] for [ActionIconThemeData]s that are brightnessed.
  final Customizer<Brightness, ActionIconThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [ActionIconThemeData]s that are varianted.
  final Customizer<ActionIconVariant, ActionIconThemeData>?
      _variantedCustomizer;

  /// The [Customizer] for [ActionIconThemeData]s that are brightnessed.
  final Customizer<Color, ActionIconThemeData>? _coloredCustomizer;

  /// The [Customizer] for [ActionIconThemeData]s that are sized.
  final Customizer<Size, ActionIconThemeData>? _sizedCustomizer;

  /// The [Customizer] for [ActionIconThemeData]s that are shaped.
  final Customizer<Shape, ActionIconThemeData>? _shapedCustomizer;

  @override
  Customizer<Brightness, ActionIconThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kActionIconBrightnessedCustomizer;
  }

  @override
  Customizer<ActionIconVariant, ActionIconThemeData> get variantedCustomizer {
    return _variantedCustomizer ??
        brightnessedCustomizer
            .of(brightness ?? Brightness.light)!
            .variantedCustomizer;
  }

  @override
  Customizer<Color, ActionIconThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kActionIconColoredCustomizer;
  }

  @override
  Customizer<Size, ActionIconThemeData> get sizedCustomizer {
    return _sizedCustomizer ?? _kActionIconSizedCustomizer;
  }

  @override
  Customizer<Shape, ActionIconThemeData> get shapedCustomizer {
    return _shapedCustomizer ?? _kActionIconShapedCustomizer;
  }

  @override
  ActionIconThemeData brightnessed(Brightness? brightness) {
    ActionIconThemeData? brightnessedTheme =
        brightnessedCustomizer.of(brightness);
    return copyWith(
      variantedCustomizer:
          brightnessedTheme?.variantedCustomizer ?? variantedCustomizer,
    );
  }

  @override
  ActionIconThemeData varianted(ActionIconVariant? variant) {
    ActionIconThemeData? variantedTheme = variantedCustomizer.of(variant);
    return copyWith(
      colorShade: variantedTheme?.colorShade ?? colorShade,
      coloredCustomizer: variantedTheme?.coloredCustomizer ?? coloredCustomizer,
    );
  }

  @override
  ActionIconThemeData colored(Color? color) {
    ActionIconThemeData? coloredTheme = coloredCustomizer.of(color);

    return copyWith(
      color: coloredTheme?.color ?? color ?? this.color,
      colorShade: coloredTheme?.colorShade ?? colorShade,
    );
  }

  @override
  ActionIconThemeData sized(Size? size) {
    ActionIconThemeData? sizedTheme = sizedCustomizer.of(size);
    return copyWith(
      size: sizedTheme?.size ?? size,
    );
  }

  @override
  ActionIconThemeData shaped(Shape? shape) {
    ActionIconThemeData? shapedTheme = shapedCustomizer.of(shape);
    return copyWith(
      cornered: shapedTheme?.cornered ?? cornered,
      cornerRadius: shapedTheme?.cornerRadius ?? cornerRadius,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  ActionIconThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Size? size,
    Color? color,
    int? colorShade,
    bool? cornered,
    double? cornerRadius,
    Customizer<Brightness, ActionIconThemeData>? brightnessedCustomizer,
    Customizer<ActionIconVariant, ActionIconThemeData>? variantedCustomizer,
    Customizer<Color, ActionIconThemeData>? coloredCustomizer,
    Customizer<Size, ActionIconThemeData>? sizedCustomizer,
  }) {
    return ActionIconThemeData(
      size: size ?? this.size,
      color: color ?? this.color,
      colorShade: colorShade ?? this.colorShade,
      cornered: cornered ?? this.cornered,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      brightnessedCustomizer:
          brightnessedCustomizer ?? this.brightnessedCustomizer,
      variantedCustomizer: variantedCustomizer ?? this.variantedCustomizer,
      coloredCustomizer: coloredCustomizer ?? this.coloredCustomizer,
      sizedCustomizer: sizedCustomizer ?? this.sizedCustomizer,
    );
  }

  /// Linearly interpolate between two [ActionIcon] themes.
  static ActionIconThemeData lerp(
      ActionIconThemeData? a, ActionIconThemeData? b, double t) {
    return ActionIconThemeData(
      size: Size.lerp(a?.size, b?.size, t),
      color: Color.lerp(a?.color, b?.color, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        brightness,
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
    return other is ActionIconThemeData &&
        other.size == size &&
        other.color == color;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty(
      'color',
      color,
      defaultValue: null,
    ));
  }
}

/// An inherited widget that overrides the default color style, and size
/// parameters for [ActionIcon]s in this widget's subtree.
///
/// Values specified here override the defaults for [ActionIcon] properties which
/// are not given an explicit non-null value.
class ActionIconTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [ActionIcon]s
  /// in this widget's subtree.
  const ActionIconTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [ActionIcon] widgets.
  final ActionIconThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [ActionIconTheme] widget, then
  /// [ThemeData.actionIconTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ActionIconThemeData theme = ActionIconTheme.of(context);
  /// ```
  static ActionIconThemeData of(BuildContext context) {
    final ActionIconTheme? actionIconTheme =
        context.dependOnInheritedWidgetOfExactType<ActionIconTheme>();
    return actionIconTheme?.data ?? Theme.of(context).actionIconTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ActionIconTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ActionIconTheme oldWidget) => data != oldWidget.data;
}
