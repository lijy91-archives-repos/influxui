import 'package:base_ui_core/src/button/button.dart';
import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

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
class ButtonThemeData with Diagnosticable {
  /// Creates the set of color, style, and size properties used to configure [Button].
  const ButtonThemeData({
    this.color,
    this.labelColor,
    this.labelStyle,
    this.size,
    this.sizedCustomizer,
  });

  /// Overrides the default value for [Button.color].
  final Color? color;

  /// Overrides the default value for [Button.labelColor].
  final Color? labelColor;

  /// Overrides the default value for [Button.labelStyle].
  final TextStyle? labelStyle;

  /// Overrides the default value for [Button.size].
  final Size? size;

  final Customizer<Size, ButtonThemeData>? sizedCustomizer;

  ButtonThemeData sized(Size? size) {
    if (size is! NamedSize) return this;
    ButtonThemeData? sizedTheme = sizedCustomizer?.of(size);
    return copyWith(
      size: sizedTheme?.size ?? this.size,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  ButtonThemeData copyWith({
    Color? color,
    Color? labelColor,
    TextStyle? labelStyle,
    Size? size,
  }) {
    return ButtonThemeData(
      color: color ?? this.color,
      labelColor: labelColor ?? this.labelColor,
      labelStyle: labelStyle ?? this.labelStyle,
      size: size ?? this.size,
    );
  }

  /// Linearly interpolate between two [Button] themes.
  static ButtonThemeData lerp(
      ButtonThemeData? a, ButtonThemeData? b, double t) {
    return ButtonThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      labelColor: Color.lerp(a?.labelColor, b?.labelColor, t),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        color,
        labelColor,
        labelStyle,
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
        other.color == color &&
        other.labelColor == labelColor &&
        other.labelStyle == labelStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(ColorProperty('labelColor', labelColor, defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>('labelStyle', labelStyle,
        defaultValue: null));
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

  static ButtonThemeData sizedOf(BuildContext context) {
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
