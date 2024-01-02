// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'Roboto',
  fontSize: 17.0,
  letterSpacing: -0.41,
  color: Colors.black,
  decoration: TextDecoration.none,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultActionTextStyle = TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  letterSpacing: -0.41,
  color: Colors.blue,
  decoration: TextDecoration.none,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultTabLabelTextStyle = TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Text',
  fontSize: 10.0,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.24,
  color: Colors.grey,
);

const TextStyle _kDefaultMiddleTitleTextStyle = TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
  color: Colors.black,
);

const TextStyle _kDefaultLargeTitleTextStyle = TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Display',
  fontSize: 34.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.41,
  color: Colors.black,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Inspected on iOS 13 simulator with "Debug View Hierarchy".
// Value extracted from off-center labels. Centered labels have a font size of 25pt.
//
// The letterSpacing sourced from iOS 14 simulator screenshots for comparison.
// See also:
//
// * https://github.com/flutter/flutter/pull/65501#discussion_r486557093
const TextStyle _kDefaultPickerTextStyle = TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Display',
  fontSize: 21.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.6,
  color: Colors.black,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Inspected on iOS 13 simulator with "Debug View Hierarchy".
// Value extracted from off-center labels. Centered labels have a font size of 25pt.
const TextStyle _kDefaultDateTimePickerTextStyle = TextStyle(
  inherit: false,
  // fontFamily: '.SF Pro Display',
  fontSize: 21,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

TextStyle? _resolveTextStyle(TextStyle? style, BuildContext context) {
  // This does not resolve the shadow color, foreground, background, etc.
  return style?.copyWith(
    color: style.color,
    backgroundColor: style.backgroundColor,
    decorationColor: style.decorationColor,
  );
}

/// Cupertino typography theme in a [ThemeData].
@immutable
class TextThemeData with Diagnosticable {
  /// Create a [TextThemeData].
  ///
  /// The [primaryColor] is used to derive TextStyle defaults of other attributes
  /// such as [navActionTextStyle] and [actionTextStyle], it must not be null when
  /// either [navActionTextStyle] or [actionTextStyle] is null. Defaults to
  /// [CupertinoColors.systemBlue].
  ///
  /// Other [TextStyle] parameters default to default iOS text styles when
  /// unspecified.
  TextThemeData({
    Color primaryColor = Colors.blue,
    TextStyle? textStyle,
    TextStyle? actionTextStyle,
    TextStyle? tabLabelTextStyle,
    TextStyle? navTitleTextStyle,
    TextStyle? navLargeTitleTextStyle,
    TextStyle? navActionTextStyle,
    TextStyle? pickerTextStyle,
    TextStyle? dateTimePickerTextStyle,
  }) : this._raw(
          const _TextThemeDefaultsBuilder(Colors.black, Colors.grey),
          primaryColor,
          textStyle,
          actionTextStyle,
          tabLabelTextStyle,
          navTitleTextStyle,
          navLargeTitleTextStyle,
          navActionTextStyle,
          pickerTextStyle,
          dateTimePickerTextStyle,
        );

  const TextThemeData._raw(
    this._defaults,
    this._primaryColor,
    this._textStyle,
    this._actionTextStyle,
    this._tabLabelTextStyle,
    this._navTitleTextStyle,
    this._navLargeTitleTextStyle,
    this._navActionTextStyle,
    this._pickerTextStyle,
    this._dateTimePickerTextStyle,
  ) : assert((_navActionTextStyle != null && _actionTextStyle != null) ||
            _primaryColor != null);

  final _TextThemeDefaultsBuilder _defaults;
  final Color? _primaryColor;

  final TextStyle? _textStyle;

  /// The [TextStyle] of general text content for Cupertino widgets.
  TextStyle get textStyle => _textStyle ?? _defaults.textStyle;

  final TextStyle? _actionTextStyle;

  /// The [TextStyle] of interactive text content such as text in a button without background.
  TextStyle get actionTextStyle {
    return _actionTextStyle ??
        _defaults.actionTextStyle(primaryColor: _primaryColor);
  }

  final TextStyle? _tabLabelTextStyle;

  /// The [TextStyle] of unselected tabs.
  TextStyle get tabLabelTextStyle =>
      _tabLabelTextStyle ?? _defaults.tabLabelTextStyle;

  final TextStyle? _navTitleTextStyle;

  /// The [TextStyle] of titles in standard navigation bars.
  TextStyle get navTitleTextStyle =>
      _navTitleTextStyle ?? _defaults.navTitleTextStyle;

  final TextStyle? _navLargeTitleTextStyle;

  /// The [TextStyle] of large titles in sliver navigation bars.
  TextStyle get navLargeTitleTextStyle =>
      _navLargeTitleTextStyle ?? _defaults.navLargeTitleTextStyle;

  final TextStyle? _navActionTextStyle;

  /// The [TextStyle] of interactive text content in navigation bars.
  TextStyle get navActionTextStyle {
    return _navActionTextStyle ??
        _defaults.navActionTextStyle(primaryColor: _primaryColor);
  }

  final TextStyle? _pickerTextStyle;

  /// The [TextStyle] of pickers.
  TextStyle get pickerTextStyle =>
      _pickerTextStyle ?? _defaults.pickerTextStyle;

  final TextStyle? _dateTimePickerTextStyle;

  /// The [TextStyle] of date time pickers.
  TextStyle get dateTimePickerTextStyle =>
      _dateTimePickerTextStyle ?? _defaults.dateTimePickerTextStyle;

  /// Returns a copy of the current [CupertinoTextThemeData] with all the colors
  /// resolved against the given [BuildContext].
  ///
  /// If any of the [InheritedWidget]s required to resolve this
  /// [CupertinoTextThemeData] is not found in [context], any unresolved
  /// [CupertinoDynamicColor]s will use the default trait value
  /// ([Brightness.light] platform brightness, normal contrast,
  /// [CupertinoUserInterfaceLevelData.base] elevation level).
  TextThemeData resolveFrom(BuildContext context) {
    return TextThemeData._raw(
      _defaults,
      _primaryColor,
      _resolveTextStyle(_textStyle, context),
      _resolveTextStyle(_actionTextStyle, context),
      _resolveTextStyle(_tabLabelTextStyle, context),
      _resolveTextStyle(_navTitleTextStyle, context),
      _resolveTextStyle(_navLargeTitleTextStyle, context),
      _resolveTextStyle(_navActionTextStyle, context),
      _resolveTextStyle(_pickerTextStyle, context),
      _resolveTextStyle(_dateTimePickerTextStyle, context),
    );
  }

  /// Returns a copy of the current [TextThemeData] instance with
  /// specified overrides.
  TextThemeData copyWith({
    Color? primaryColor,
    TextStyle? textStyle,
    TextStyle? actionTextStyle,
    TextStyle? tabLabelTextStyle,
    TextStyle? navTitleTextStyle,
    TextStyle? navLargeTitleTextStyle,
    TextStyle? navActionTextStyle,
    TextStyle? pickerTextStyle,
    TextStyle? dateTimePickerTextStyle,
  }) {
    return TextThemeData._raw(
      _defaults,
      primaryColor ?? _primaryColor,
      textStyle ?? _textStyle,
      actionTextStyle ?? _actionTextStyle,
      tabLabelTextStyle ?? _tabLabelTextStyle,
      navTitleTextStyle ?? _navTitleTextStyle,
      navLargeTitleTextStyle ?? _navLargeTitleTextStyle,
      navActionTextStyle ?? _navActionTextStyle,
      pickerTextStyle ?? _pickerTextStyle,
      dateTimePickerTextStyle ?? _dateTimePickerTextStyle,
    );
  }

  /// Linearly interpolate between two icon theme data objects.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static TextThemeData lerp(TextThemeData? a, TextThemeData? b, double t) {
    return TextThemeData();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final TextThemeData defaultData = TextThemeData();
    properties.add(DiagnosticsProperty<TextStyle>('textStyle', textStyle,
        defaultValue: defaultData.textStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'actionTextStyle', actionTextStyle,
        defaultValue: defaultData.actionTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'tabLabelTextStyle', tabLabelTextStyle,
        defaultValue: defaultData.tabLabelTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'navTitleTextStyle', navTitleTextStyle,
        defaultValue: defaultData.navTitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'navLargeTitleTextStyle', navLargeTitleTextStyle,
        defaultValue: defaultData.navLargeTitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'navActionTextStyle', navActionTextStyle,
        defaultValue: defaultData.navActionTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'pickerTextStyle', pickerTextStyle,
        defaultValue: defaultData.pickerTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'dateTimePickerTextStyle', dateTimePickerTextStyle,
        defaultValue: defaultData.dateTimePickerTextStyle));
  }
}

@immutable
class _TextThemeDefaultsBuilder {
  const _TextThemeDefaultsBuilder(
    this.labelColor,
    this.inactiveGrayColor,
  );

  final Color labelColor;
  final Color inactiveGrayColor;

  static TextStyle _applyLabelColor(TextStyle original, Color color) {
    return original.color == color ? original : original.copyWith(color: color);
  }

  TextStyle get textStyle => _applyLabelColor(_kDefaultTextStyle, labelColor);
  TextStyle get tabLabelTextStyle =>
      _applyLabelColor(_kDefaultTabLabelTextStyle, inactiveGrayColor);
  TextStyle get navTitleTextStyle =>
      _applyLabelColor(_kDefaultMiddleTitleTextStyle, labelColor);
  TextStyle get navLargeTitleTextStyle =>
      _applyLabelColor(_kDefaultLargeTitleTextStyle, labelColor);
  TextStyle get pickerTextStyle =>
      _applyLabelColor(_kDefaultPickerTextStyle, labelColor);
  TextStyle get dateTimePickerTextStyle =>
      _applyLabelColor(_kDefaultDateTimePickerTextStyle, labelColor);

  TextStyle actionTextStyle({Color? primaryColor}) =>
      _kDefaultActionTextStyle.copyWith(color: primaryColor);
  TextStyle navActionTextStyle({Color? primaryColor}) =>
      actionTextStyle(primaryColor: primaryColor);
}

/// An inherited widget that overrides the default color style, and size
/// parameters for [Badge]s in this widget's subtree.
///
/// Values specified here override the defaults for [Badge] properties which
/// are not given an explicit non-null value.
class TextTheme extends InheritedTheme {
  /// Creates a theme that overrides the default color parameters for [Badge]s
  /// in this widget's subtree.
  const TextTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Specifies the default color and size overrides for descendant [Badge] widgets.
  final TextThemeData data;

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
  static TextThemeData of(BuildContext context) {
    final TextTheme? badgeTheme =
        context.dependOnInheritedWidgetOfExactType<TextTheme>();
    return badgeTheme?.data ?? TextThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TextTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(TextTheme oldWidget) => data != oldWidget.data;
}
