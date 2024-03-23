import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show MaterialColor, ThemeData;
import 'package:flutter/widgets.dart';

class AlertStyle with Diagnosticable {
  const AlertStyle({
    this.backgroundColor,
    this.iconSize,
    this.titleStyle,
    this.messageStyle,
  });

  factory AlertStyle.fromColor(ThemeData theme, MaterialColor color) {
    return AlertStyle(
      backgroundColor: color.shade50,
      iconSize: 20,
      titleStyle: theme.textTheme.bodyMedium?.copyWith(
        color: color.shade700,
        fontWeight: FontWeight.w600,
      ),
      messageStyle: theme.textTheme.bodyMedium?.copyWith(
        color: color.shade600,
      ),
    );
  }

  final Color? backgroundColor;

  final double? iconSize;

  final TextStyle? titleStyle;

  final TextStyle? messageStyle;

  AlertStyle copyWith({
    Color? backgroundColor,
    double? iconSize,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
  }) {
    return AlertStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconSize: iconSize ?? this.iconSize,
      titleStyle: titleStyle ?? this.titleStyle,
      messageStyle: messageStyle ?? this.messageStyle,
    );
  }

  /// Returns a copy of this AlertStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this AlertStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this AlertStyle.
  AlertStyle merge(AlertStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      backgroundColor: style.backgroundColor,
      iconSize: iconSize ?? style.iconSize,
      titleStyle: titleStyle ?? style.titleStyle,
      messageStyle: messageStyle ?? style.messageStyle,
    );
  }
}
