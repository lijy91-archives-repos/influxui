import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class IconButtonStyle with Diagnosticable {
  const IconButtonStyle({
    this.size,
    this.iconSize,
  });

  final Size? size;

  final double? iconSize;

  IconButtonStyle copyWith({
    Size? size,
    double? iconSize,
  }) {
    return IconButtonStyle(
      size: size ?? this.size,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  /// Returns a copy of this IconButtonStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this IconButtonStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this IconButtonStyle.
  IconButtonStyle merge(IconButtonStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      size: size ?? style.size,
      iconSize: iconSize ?? style.iconSize,
    );
  }
}
