import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:influxui/src/foundation/customizable_property.dart';
import 'package:influxui/src/widgets/box/box_state.dart';

class BoxStyle with Diagnosticable {
  const BoxStyle({
    this.color,
    this.foregroundColor,
    this.borderColor,
  });

  /// The color of the box.
  final CustomizableProperty<Color, Set<BoxState>>? color;

  /// The color of the box foreground.
  final CustomizableProperty<Color, Set<BoxState>>? foregroundColor;

  /// The color of the box border.
  final CustomizableProperty<Color, Set<BoxState>>? borderColor;

  BoxStyle copyWith({
    CustomizableProperty<Color, Set<BoxState>>? color,
    CustomizableProperty<Color, Set<BoxState>>? foregroundColor,
    CustomizableProperty<Color, Set<BoxState>>? borderColor,
  }) {
    return BoxStyle(
      color: color ?? this.color,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  /// Returns a copy of this BoxStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this BoxStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this BoxStyle.
  BoxStyle merge(BoxStyle? style) {
    if (style == null) {
      return this;
    }
    return copyWith(
      color: color ?? style.color,
      foregroundColor: foregroundColor ?? style.foregroundColor,
      borderColor: borderColor ?? style.borderColor,
    );
  }
}
