import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BadgeStyle with Diagnosticable {
  const BadgeStyle({
    this.padding,
    this.minimumSize,
    this.maximumSize,
    this.iconSize,
    this.labelStyle,
  });

  final EdgeInsetsGeometry? padding;

  final Size? minimumSize;

  final Size? maximumSize;

  final double? iconSize;

  final TextStyle? labelStyle;

  BadgeStyle copyWith({
    Size? minimumSize,
    Size? maximumSize,
    double? iconSize,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? padding,
  }) {
    return BadgeStyle(
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
      iconSize: iconSize ?? this.iconSize,
      labelStyle: labelStyle ?? this.labelStyle,
      padding: padding ?? this.padding,
    );
  }

  /// Returns a copy of this BadgeStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this BadgeStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this BadgeStyle.
  BadgeStyle merge(BadgeStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      minimumSize: minimumSize ?? style.minimumSize,
      maximumSize: maximumSize ?? style.maximumSize,
      iconSize: iconSize ?? style.iconSize,
      labelStyle: labelStyle ?? style.labelStyle,
      padding: padding ?? style.padding,
    );
  }
}
