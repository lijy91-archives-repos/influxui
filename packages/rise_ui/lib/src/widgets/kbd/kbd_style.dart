import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class KbdStyle with Diagnosticable {
  const KbdStyle({
    this.padding,
    this.size,
    this.labelStyle,
  });

  final EdgeInsetsGeometry? padding;

  final Size? size;

  final TextStyle? labelStyle;

  KbdStyle copyWith({
    EdgeInsetsGeometry? padding,
    Size? size,
    TextStyle? labelStyle,
  }) {
    return KbdStyle(
      padding: padding ?? this.padding,
      size: size ?? this.size,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }

  /// Returns a copy of this KbdStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this KbdStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this KbdStyle.
  KbdStyle merge(KbdStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      padding: padding ?? style.padding,
      size: size ?? style.size,
      labelStyle: labelStyle ?? style.labelStyle,
    );
  }
}
