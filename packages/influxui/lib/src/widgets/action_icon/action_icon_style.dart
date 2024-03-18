import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ActionIconStyle with Diagnosticable {
  const ActionIconStyle({
    this.size,
    this.iconSize,
  });

  final Size? size;

  final double? iconSize;

  ActionIconStyle copyWith({
    Size? size,
    double? iconSize,
  }) {
    return ActionIconStyle(
      size: size ?? this.size,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  /// Returns a copy of this ActionIconStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this ActionIconStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this ActionIconStyle.
  ActionIconStyle merge(ActionIconStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      size: size ?? style.size,
      iconSize: iconSize ?? style.iconSize,
    );
  }
}
