import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/loader/loader.dart';
import 'package:rise_ui/src/theme/theme.dart';

final _kLoaderVariantedCustomizer = Customizer<LoaderVariant, LoaderThemeData>({
  LoaderVariant.bars: LoaderThemeData(),
  LoaderVariant.oval: LoaderThemeData(),
  LoaderVariant.dots: LoaderThemeData(),
});

final _kLoaderColoredCustomizer = Customizer<Color, LoaderThemeData>({});

final _kLoaderSizedCustomizer = Customizer<NamedSize, LoaderThemeData>({
  NamedSize.tiny: LoaderThemeData(
    size: Size.square(18),
  ),
  NamedSize.small: LoaderThemeData(
    size: Size.square(22),
  ),
  NamedSize.medium: LoaderThemeData(
    size: Size.square(36),
  ),
  NamedSize.large: LoaderThemeData(
    size: Size.square(44),
  ),
  NamedSize.big: LoaderThemeData(
    size: Size.square(58),
  ),
});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [Loader] widgets.
///
/// Descendant widgets obtain the current [LoaderThemeData] object
/// using `LoaderTheme.of(context)`. Instances of [LoaderThemeData] can
/// be customized with [LoaderThemeData.copyWith].
///
/// Typically a [LoaderThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.loaderTheme].
///
/// All [LoaderThemeData] properties are `null` by default.
/// When null, the [Loader] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class LoaderThemeData
    with
        Diagnosticable,
        VariantedCustomizable<LoaderVariant, LoaderThemeData>,
        ColoredCustomizable<LoaderThemeData>,
        SizedCustomizable<LoaderThemeData> {
  /// Creates the set of color, style, and size properties used to configure [Loader].
  const LoaderThemeData({
    this.color,
    this.size,
    Customizer<LoaderVariant, LoaderThemeData>? variantedCustomizer,
    Customizer<Color, LoaderThemeData>? coloredCustomizer,
    Customizer<Size, LoaderThemeData>? sizedCustomizer,
  })  : _variantedCustomizer = variantedCustomizer,
        _coloredCustomizer = coloredCustomizer,
        _sizedCustomizer = sizedCustomizer;

  /// Overrides the default value for [Loader.color].
  final Color? color;

  /// Overrides the default value for [Loader.size].
  final Size? size;

  /// The [Customizer] for [LoaderThemeData]s that are varianted.
  final Customizer<LoaderVariant, LoaderThemeData>? _variantedCustomizer;

  /// The [Customizer] for [LoaderThemeData]s that are brightnessed.
  final Customizer<Color, LoaderThemeData>? _coloredCustomizer;

  /// The [Customizer] for [LoaderThemeData]s that are sized.
  final Customizer<Size, LoaderThemeData>? _sizedCustomizer;

  @override
  Customizer<LoaderVariant, LoaderThemeData> get variantedCustomizer {
    return _variantedCustomizer ?? _kLoaderVariantedCustomizer;
  }

  @override
  Customizer<Color, LoaderThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kLoaderColoredCustomizer;
  }

  @override
  Customizer<Size, LoaderThemeData> get sizedCustomizer {
    return _sizedCustomizer ?? _kLoaderSizedCustomizer;
  }

  @override
  LoaderThemeData varianted(LoaderVariant? variant) {
    // LoaderThemeData? variantedTheme = variantedCustomizer.of(variant);
    return copyWith();
  }

  @override
  LoaderThemeData colored(Color? color) {
    LoaderThemeData? coloredTheme = coloredCustomizer.of(color);

    return copyWith(
      color: coloredTheme?.color ?? color ?? this.color,
    );
  }

  @override
  LoaderThemeData sized(Size? size) {
    LoaderThemeData? sizedTheme = sizedCustomizer.of(size);
    return copyWith(
      size: sizedTheme?.size ?? size,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  LoaderThemeData copyWith({
    Size? size,
    Color? color,
    Customizer<LoaderVariant, LoaderThemeData>? variantedCustomizer,
    Customizer<Color, LoaderThemeData>? coloredCustomizer,
    Customizer<Size, LoaderThemeData>? sizedCustomizer,
  }) {
    return LoaderThemeData(
      size: size ?? this.size,
      color: color ?? this.color,
      variantedCustomizer: variantedCustomizer ?? this.variantedCustomizer,
      coloredCustomizer: coloredCustomizer ?? this.coloredCustomizer,
      sizedCustomizer: sizedCustomizer ?? this.sizedCustomizer,
    );
  }

  /// Linearly interpolate between two [Loader] themes.
  static LoaderThemeData lerp(
      LoaderThemeData? a, LoaderThemeData? b, double t) {
    return LoaderThemeData(
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
    return other is LoaderThemeData &&
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
/// parameters for [Loader]s in this widget's subtree.
///
/// Values specified here override the defaults for [Loader] properties which
/// are not given an explicit non-null value.
class LoaderTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Loader]s
  /// in this widget's subtree.
  const LoaderTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Loader] widgets.
  final LoaderThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [LoaderTheme] widget, then
  /// [ThemeData.loaderTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// LoaderThemeData theme = LoaderTheme.of(context);
  /// ```
  static LoaderThemeData of(BuildContext context) {
    final LoaderTheme? loaderTheme =
        context.dependOnInheritedWidgetOfExactType<LoaderTheme>();
    return loaderTheme?.data ?? Theme.of(context).loaderTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return LoaderTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(LoaderTheme oldWidget) => data != oldWidget.data;
}
