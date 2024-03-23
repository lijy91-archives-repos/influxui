import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BadgeStyle with Diagnosticable {
  const BadgeStyle({
    this.padding,
    this.borderRadius,
    this.minimumSize,
    this.maximumSize,
    this.labelStyle,
  });

  final EdgeInsetsGeometry? padding;

  final BorderRadius? borderRadius;

  final Size? minimumSize;

  final Size? maximumSize;

  final TextStyle? labelStyle;

  BadgeStyle copyWith({
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    Size? minimumSize,
    Size? maximumSize,
    TextStyle? labelStyle,
  }) {
    return BadgeStyle(
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
      labelStyle: labelStyle ?? this.labelStyle,
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
      padding: padding ?? style.padding,
      borderRadius: borderRadius ?? style.borderRadius,
      minimumSize: minimumSize ?? style.minimumSize,
      maximumSize: maximumSize ?? style.maximumSize,
      labelStyle: labelStyle ?? style.labelStyle,
    );
  }
}
