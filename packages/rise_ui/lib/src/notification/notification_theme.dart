import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide Notification;
import 'package:rise_ui/src/notification/notification.dart';
import 'package:rise_ui/src/theme/theme.dart';

final _kNotificationBrightnessedCustomizer =
    Customizer<Brightness, NotificationThemeData>({
  Brightness.light: NotificationThemeData(
    backgroundColor: Colors.white,
  ),
  Brightness.dark: NotificationThemeData(
    backgroundColor: Colors.darkGray.shade600,
  ),
});

final _kNotificationColoredCustomizer =
    Customizer<Color, NotificationThemeData>({});

// Examples can assume:
// late BuildContext context;

/// Overrides the default properties values for descendant [Notification] widgets.
///
/// Descendant widgets obtain the current [NotificationThemeData] object
/// using `NotificationTheme.of(context)`. Instances of [NotificationThemeData] can
/// be customized with [NotificationThemeData.copyWith].
///
/// Typically a [NotificationThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.notificationTheme].
///
/// All [NotificationThemeData] properties are `null` by default.
/// When null, the [Notification] will use the values from [ThemeData]
/// if they exist, otherwise it will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class NotificationThemeData
    with
        Diagnosticable,
        BrightnessedCustomizable<NotificationThemeData>,
        ColoredCustomizable<NotificationThemeData> {
  /// Creates the set of color, style, and size properties used to configure [Notification].
  const NotificationThemeData({
    this.brightness,
    this.color,
    this.backgroundColor,
    this.titleColor,
    this.titleFontSize,
    Customizer<Brightness, NotificationThemeData>? brightnessedCustomizer,
    Customizer<Color, NotificationThemeData>? coloredCustomizer,
  })  : _brightnessedCustomizer = brightnessedCustomizer,
        _coloredCustomizer = coloredCustomizer;

  /// Overrides the default value for [Notification.brightness].
  final Brightness? brightness;

  /// Overrides the default value for [Notification.color].
  final Color? color;

  final Color? backgroundColor;

  /// Overrides the default value for [Notification.titleColor].
  final Color? titleColor;

  /// Overrides the default value for [Notification.titleFontSize].
  final double? titleFontSize;

  /// The [Customizer] for [NotificationThemeData]s that are brightnessed.
  final Customizer<Brightness, NotificationThemeData>? _brightnessedCustomizer;

  /// The [Customizer] for [NotificationThemeData]s that are brightnessed.
  final Customizer<Color, NotificationThemeData>? _coloredCustomizer;

  @override
  Customizer<Brightness, NotificationThemeData> get brightnessedCustomizer {
    return _brightnessedCustomizer ?? _kNotificationBrightnessedCustomizer;
  }

  @override
  Customizer<Color, NotificationThemeData> get coloredCustomizer {
    return _coloredCustomizer ?? _kNotificationColoredCustomizer;
  }

  @override
  NotificationThemeData brightnessed(Brightness? brightness) {
    NotificationThemeData? brightnessedTheme =
        brightnessedCustomizer.of(brightness);
    return copyWith(
      backgroundColor: brightnessedTheme?.backgroundColor ?? backgroundColor,
    );
  }

  @override
  NotificationThemeData colored(Color? color) {
    NotificationThemeData? coloredTheme = coloredCustomizer.of(color);

    return copyWith(
      color: coloredTheme?.color ?? color ?? this.color,
      titleColor: coloredTheme?.titleColor ?? titleColor,
    );
  }

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  NotificationThemeData copyWith({
    EdgeInsetsGeometry? padding,
    Color? color,
    Color? backgroundColor,
    Color? titleColor,
    double? titleFontSize,
    Customizer<Brightness, NotificationThemeData>? brightnessedCustomizer,
    Customizer<Color, NotificationThemeData>? coloredCustomizer,
  }) {
    return NotificationThemeData(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleColor: titleColor ?? this.titleColor,
      titleFontSize: titleFontSize ?? this.titleFontSize,
      brightnessedCustomizer:
          brightnessedCustomizer ?? this.brightnessedCustomizer,
      coloredCustomizer: coloredCustomizer ?? this.coloredCustomizer,
    );
  }

  /// Linearly interpolate between two [Notification] themes.
  static NotificationThemeData lerp(
      NotificationThemeData? a, NotificationThemeData? b, double t) {
    return NotificationThemeData(
      color: Color.lerp(a?.color, b?.color, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        brightness,
        color,
        backgroundColor,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is NotificationThemeData &&
        other.color == color &&
        other.backgroundColor == backgroundColor &&
        other.titleColor == titleColor;
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
/// parameters for [Notification]s in this widget's subtree.
///
/// Values specified here override the defaults for [Notification] properties which
/// are not given an explicit non-null value.
class NotificationTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Notification]s
  /// in this widget's subtree.
  const NotificationTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Notification] widgets.
  final NotificationThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [NotificationTheme] widget, then
  /// [ThemeData.notificationTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// NotificationThemeData theme = NotificationTheme.of(context);
  /// ```
  static NotificationThemeData of(BuildContext context) {
    final NotificationTheme? notificationTheme =
        context.dependOnInheritedWidgetOfExactType<NotificationTheme>();
    return notificationTheme?.data ?? Theme.of(context).notificationTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return NotificationTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(NotificationTheme oldWidget) =>
      data != oldWidget.data;
}
