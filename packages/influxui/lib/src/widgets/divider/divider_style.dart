import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class DividerStyle with Diagnosticable {
  const DividerStyle({
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

  DividerStyle copyWith({
    Size? minimumSize,
    Size? maximumSize,
    double? iconSize,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? padding,
  }) {
    return DividerStyle(
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
      iconSize: iconSize ?? this.iconSize,
      labelStyle: labelStyle ?? this.labelStyle,
      padding: padding ?? this.padding,
    );
  }

  /// Returns a copy of this DividerStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this DividerStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this DividerStyle.
  DividerStyle merge(DividerStyle? style) {
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
