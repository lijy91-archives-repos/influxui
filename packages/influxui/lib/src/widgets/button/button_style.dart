import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ButtonStyle with Diagnosticable {
  const ButtonStyle({
    this.padding,
    this.borderRadius,
    this.minimumSize,
    this.maximumSize,
    this.iconSize,
    this.labelStyle,
  });

  final EdgeInsetsGeometry? padding;

  final BorderRadius? borderRadius;

  final Size? minimumSize;

  final Size? maximumSize;

  final double? iconSize;

  final TextStyle? labelStyle;

  ButtonStyle copyWith({
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    Size? minimumSize,
    Size? maximumSize,
    double? iconSize,
    TextStyle? labelStyle,
  }) {
    return ButtonStyle(
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
      iconSize: iconSize ?? this.iconSize,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }

  /// Returns a copy of this ButtonStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this ButtonStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this ButtonStyle.
  ButtonStyle merge(ButtonStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      padding: padding ?? style.padding,
      borderRadius: borderRadius ?? style.borderRadius,
      minimumSize: minimumSize ?? style.minimumSize,
      maximumSize: maximumSize ?? style.maximumSize,
      iconSize: iconSize ?? style.iconSize,
      labelStyle: labelStyle ?? style.labelStyle,
    );
  }
}
