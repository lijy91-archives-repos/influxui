import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ButtonStyle with Diagnosticable {
  const ButtonStyle({
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

  ButtonStyle copyWith({
    Size? minimumSize,
    Size? maximumSize,
    double? iconSize,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? padding,
  }) {
    return ButtonStyle(
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
      iconSize: iconSize ?? this.iconSize,
      labelStyle: labelStyle ?? this.labelStyle,
      padding: padding ?? this.padding,
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
      minimumSize: minimumSize ?? style.minimumSize,
      maximumSize: maximumSize ?? style.maximumSize,
      iconSize: iconSize ?? style.iconSize,
      labelStyle: labelStyle ?? style.labelStyle,
      padding: padding ?? style.padding,
    );
  }
}
