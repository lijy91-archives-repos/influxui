import 'dart:ui';

import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

const EdgeInsetsGeometry _kKbdPadding =
    EdgeInsets.symmetric(vertical: 3, horizontal: 5);

final _kKbdBrightnessedCustomizer = Customizer<Brightness, KbdThemeData>({
  Brightness.light: KbdThemeData(
    color: Colors.gray.shade50,
    borderColor: Colors.gray.shade300,
    labelColor: Colors.gray.shade700,
  ),
  Brightness.dark: KbdThemeData(
    color: Colors.black54,
    borderColor: Colors.black45,
    labelColor: Colors.black45,
  ),
});

final _kKbdSizedCustomizer = Customizer<NamedSize, KbdThemeData>({
  NamedSize.tiny: KbdThemeData(
    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
    labelFontSize: 10,
  ),
  NamedSize.small: KbdThemeData(
    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    labelFontSize: 12,
  ),
  NamedSize.medium: KbdThemeData(
    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 7),
    labelFontSize: 14,
  ),
  NamedSize.large: KbdThemeData(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
    labelFontSize: 16,
  ),
  NamedSize.big: KbdThemeData(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
    labelFontSize: 20,
  ),
});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [Kbd] widgets.
///
/// Descendant widgets obtain the current [KbdThemeData] object
/// using `KbdTheme.of(context)`. Instances of [KbdThemeData] can
/// be customized with [KbdThemeData.copyWith].
///
/// Typically a [KbdThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.kbdTheme].
///
/// All [KbdThemeData] properties are `null` by default.
/// When null, the [Kbd] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class KbdThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<KbdThemeData>,
        SizedCustomizable<KbdThemeData> {
  /// Creates the set of color, style, and size properties used to configure [Kbd].
  const KbdThemeData({
    this.brightness,
    this.padding = _kKbdPadding,
    this.color,
    this.size,
    this.borderColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.labelColor,
    this.labelFontSize,
    Customizer<Brightness, KbdThemeData>? brightnessedCustomizer,
    Customizer<Size, KbdThemeData>? sizedCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _sizedCustomizer = sizedCustomizer;

  /// Overrides the default value for [Kbd.brightness].
  final Brightness? brightness;

  /// Overrides the default value for [Kbd.padding].
  final EdgeInsetsGeometry? padding;

  /// Overrides the default value for [Kbd.color].
  final Color? color;

  /// Overrides the default value for [Kbd.size].
  final Size? size;

  final Color? borderColor;

  /// The radius of the button's corners when it has a background color.
  ///
  /// Defaults to round corners of 8 logical pixels.
  final BorderRadius? borderRadius;

  /// Overrides the default value for [Kbd.labelColor].
  final Color? labelColor;

  /// Overrides the default value for [Kbd.labelFontSize].
  final double? labelFontSize;

  final Customizer<Size, KbdThemeData>? _sizedCustomizer;
  final Customizer<Brightness, KbdThemeData>? _brightnessedCustomizer;

  @override
  Customizer<Brightness, KbdThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kKbdBrightnessedCustomizer;
  }

  @override
  Customizer<Size, KbdThemeData> get sizedCustomizer {
    return _sizedCustomizer ?? _kKbdSizedCustomizer;
  }

  @override
  KbdThemeData sized(Size? size) {
    if (size is! NamedSize) return this;
    KbdThemeData? theme = sizedCustomizer.of(size);
    return copyWith(
      size: theme?.size ?? this.size,
      labelFontSize: theme?.labelFontSize ?? labelFontSize,
    );
  }

  @override
  KbdThemeData brightnessed(Brightness? brightness) {
    brightness ??= this.brightness ?? Brightness.light;
    KbdThemeData? theme = brightnessedCustomizer.of(brightness);
    return copyWith(
      color: theme?.color ?? color,
      borderColor: theme?.borderColor ?? borderColor,
      labelColor: theme?.labelColor ?? labelColor,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  KbdThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Color? color,
    Size? size,
    Color? borderColor,
    BorderRadius? borderRadius,
    Color? labelColor,
    double? labelFontSize,
  }) {
    return KbdThemeData(
      padding: padding ?? this.padding,
      color: color ?? this.color,
      size: size ?? this.size,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      labelColor: labelColor ?? this.labelColor,
      labelFontSize: labelFontSize ?? this.labelFontSize,
    );
  }

  /// Linearly interpolate between two [Kbd] themes.
  static KbdThemeData lerp(KbdThemeData? a, KbdThemeData? b, double t) {
    return KbdThemeData(
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      color: Color.lerp(a?.color, b?.color, t),
      size: Size.lerp(a?.size, b?.size, t),
      labelColor: Color.lerp(a?.labelColor, b?.labelColor, t),
      labelFontSize: lerpDouble(a?.labelFontSize, b?.labelFontSize, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        color,
        padding,
        labelColor,
        labelFontSize,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is KbdThemeData &&
        other.color == color &&
        other.padding == padding &&
        other.labelColor == labelColor &&
        other.labelFontSize == labelFontSize;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
      'padding',
      padding,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'color',
      color,
      defaultValue: null,
    ));
    properties.add(DiagnosticsProperty<Color>(
      'labelColor',
      labelColor,
      defaultValue: null,
    ));
  }
}

/// An inherited widget that overrides the default color style, and size
/// parameters for [Kbd]s in this widget's subtree.
///
/// Values specified here override the defaults for [Kbd] properties which
/// are not given an explicit non-null value.
class KbdTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Kbd]s
  /// in this widget's subtree.
  const KbdTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Kbd] widgets.
  final KbdThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [KbdTheme] widget, then
  /// [ThemeData.kbdTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// KbdThemeData theme = KbdTheme.of(context);
  /// ```
  static KbdThemeData of(BuildContext context) {
    final KbdTheme? kbdTheme =
        context.dependOnInheritedWidgetOfExactType<KbdTheme>();
    return kbdTheme?.data ?? Theme.of(context).kbdTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return KbdTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(KbdTheme oldWidget) => data != oldWidget.data;
}
