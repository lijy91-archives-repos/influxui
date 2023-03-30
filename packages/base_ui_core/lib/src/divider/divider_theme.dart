import 'package:base_ui_core/src/divider/divider.dart';
import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

final _kDividerColoredCustomizer = Customizer<Color, DividerThemeData>({});

final _kDividerSizedCustomizer = Customizer<NamedSize, DividerThemeData>({
  NamedSize.tiny: DividerThemeData(
    size: Size(0, 16),
    labelFontSize: 9,
  ),
  NamedSize.small: DividerThemeData(
    size: Size(0, 18),
    labelFontSize: 10,
  ),
  NamedSize.medium: DividerThemeData(
    size: Size(0, 20),
    labelFontSize: 11,
  ),
  NamedSize.large: DividerThemeData(
    size: Size(0, 26),
    labelFontSize: 13,
  ),
  NamedSize.big: DividerThemeData(
    size: Size(0, 32),
    labelFontSize: 26,
  ),
});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [Divider] widgets.
///
/// Descendant widgets obtain the current [DividerThemeData] object
/// using `DividerTheme.of(context)`. Instances of [DividerThemeData] can
/// be customized with [DividerThemeData.copyWith].
///
/// Typically a [DividerThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.dividerTheme].
///
/// All [DividerThemeData] properties are `null` by default.
/// When null, the [Divider] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class DividerThemeData
    with
        Diagnosticable,
        VariantedCustomizable<DividerVariant, DividerThemeData>,
        SizedCustomizable<DividerThemeData> {
  /// Creates the set of color, style, and size properties used to configure [Divider].
  const DividerThemeData({
    this.color,
    this.colorShade,
    this.size,
    this.labelColor,
    this.labelColorShade,
    this.labelFontSize,
    Customizer<DividerVariant, DividerThemeData>? variantedCustomizer,
    Customizer<Color, DividerThemeData>? coloredCustomizer,
    Customizer<Size, DividerThemeData>? sizedCustomizer,
  })  : _variantedCustomizer = variantedCustomizer,
        _sizedCustomizer = sizedCustomizer;

  /// Overrides the default value for [Divider.color].
  final Color? color;

  final int? colorShade;

  /// Overrides the default value for [Divider.size].
  final Size? size;

  /// Overrides the default value for [Divider.labelColor].
  final Color? labelColor;

  final int? labelColorShade;

  /// Overrides the default value for [Divider.labelFontSize].
  final double? labelFontSize;

  /// The [Customizer] for [DividerThemeData]s that are varianted.
  final Customizer<DividerVariant, DividerThemeData>? _variantedCustomizer;

  /// The [Customizer] for [DividerThemeData]s that are sized.
  final Customizer<Size, DividerThemeData>? _sizedCustomizer;

  @override
  Customizer<DividerVariant, DividerThemeData> get variantedCustomizer {
    return _variantedCustomizer ??
        const Customizer<DividerVariant, DividerThemeData>({});
  }

  @override
  Customizer<Size, DividerThemeData> get sizedCustomizer {
    return _sizedCustomizer ?? _kDividerSizedCustomizer;
  }

  @override
  DividerThemeData varianted(DividerVariant? variant) {
    DividerThemeData? variantedTheme = variantedCustomizer.of(variant);
    return copyWith(
      colorShade: variantedTheme?.colorShade ?? colorShade,
      labelColor: variantedTheme?.labelColor ?? labelColor,
      labelColorShade: variantedTheme?.labelColorShade ?? labelColorShade,
    );
  }

  @override
  DividerThemeData sized(Size? size) {
    DividerThemeData? sizedTheme = sizedCustomizer.of(size);
    return copyWith(
      size: sizedTheme?.size ?? size,
      labelFontSize: sizedTheme?.labelFontSize ?? labelFontSize,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  DividerThemeData copyWith({
    Size? size,
    Color? color,
    int? colorShade,
    Color? labelColor,
    int? labelColorShade,
    double? labelFontSize,
    Customizer<DividerVariant, DividerThemeData>? variantedCustomizer,
    Customizer<Size, DividerThemeData>? sizedCustomizer,
  }) {
    return DividerThemeData(
      size: size ?? this.size,
      color: color ?? this.color,
      colorShade: colorShade ?? this.colorShade,
      labelColor: labelColor ?? this.labelColor,
      labelColorShade: labelColorShade ?? this.labelColorShade,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      variantedCustomizer: variantedCustomizer ?? this.variantedCustomizer,
      sizedCustomizer: sizedCustomizer ?? this.sizedCustomizer,
    );
  }

  /// Linearly interpolate between two [Divider] themes.
  static DividerThemeData lerp(
      DividerThemeData? a, DividerThemeData? b, double t) {
    return DividerThemeData(
      size: Size.lerp(a?.size, b?.size, t),
      color: Color.lerp(a?.color, b?.color, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        size,
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
    return other is DividerThemeData &&
        other.size == size &&
        other.color == color &&
        other.labelColor == labelColor;
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
/// parameters for [Divider]s in this widget's subtree.
///
/// Values specified here override the defaults for [Divider] properties which
/// are not given an explicit non-null value.
class DividerTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Divider]s
  /// in this widget's subtree.
  const DividerTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Divider] widgets.
  final DividerThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [DividerTheme] widget, then
  /// [ThemeData.dividerTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// DividerThemeData theme = DividerTheme.of(context);
  /// ```
  static DividerThemeData of(BuildContext context) {
    final DividerTheme? dividerTheme =
        context.dependOnInheritedWidgetOfExactType<DividerTheme>();
    return dividerTheme?.data ?? Theme.of(context).dividerTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DividerTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(DividerTheme oldWidget) => data != oldWidget.data;
}
