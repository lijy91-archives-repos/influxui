import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BadgeBaseStyle with Diagnosticable {
  const BadgeBaseStyle({
    this.color,
    this.colorShade,
    this.colorOpacity,
    this.foregroundColor,
    this.foregroundColorShade,
    this.foregroundColorOpacity,
    this.borderColor,
    this.borderColorShade,
    this.borderColorOpacity,
  });

  /// The color of the box.
  final Color? color;
  final int? colorShade;
  final double? colorOpacity;

  /// The color of the box foreground.
  final Color? foregroundColor;
  final int? foregroundColorShade;
  final double? foregroundColorOpacity;

  /// The color of the box border.
  final Color? borderColor;
  final int? borderColorShade;
  final double? borderColorOpacity;

  BadgeBaseStyle copyWith({
    Color? color,
    int? colorShade,
    double? colorOpacity,
    Color? foregroundColor,
    int? foregroundColorShade,
    double? foregroundColorOpacity,
    Color? borderColor,
    int? borderColorShade,
    double? borderColorOpacity,
  }) {
    return BadgeBaseStyle(
      color: color ?? this.color,
      colorShade: colorShade ?? this.colorShade,
      colorOpacity: colorOpacity ?? this.colorOpacity,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundColorShade: foregroundColorShade ?? this.foregroundColorShade,
      foregroundColorOpacity:
          foregroundColorOpacity ?? this.foregroundColorOpacity,
      borderColor: borderColor ?? this.borderColor,
      borderColorShade: borderColorShade ?? this.borderColorShade,
      borderColorOpacity: borderColorOpacity ?? this.borderColorOpacity,
    );
  }

  /// Returns a copy of this BadgeBaseStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this BadgeBaseStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this BadgeBaseStyle.
  BadgeBaseStyle merge(BadgeBaseStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      color: color ?? style.color,
      colorShade: colorShade ?? style.colorShade,
      colorOpacity: colorOpacity ?? style.colorOpacity,
      foregroundColor: foregroundColor ?? style.foregroundColor,
      foregroundColorShade: foregroundColorShade ?? style.foregroundColorShade,
      foregroundColorOpacity:
          foregroundColorOpacity ?? style.foregroundColorOpacity,
      borderColor: borderColor ?? style.borderColor,
      borderColorShade: borderColorShade ?? style.borderColorShade,
      borderColorOpacity: borderColorOpacity ?? style.borderColorOpacity,
    );
  }
}
