import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:influxui/src/foundation/customizable_property.dart';
import 'package:influxui/src/widgets/button/button_base_state.dart';

class ButtonBaseStyle with Diagnosticable {
  const ButtonBaseStyle({
    this.color,
    this.foregroundColor,
    this.borderColor,
  });

  /// The color of the box.
  final CustomizableProperty<Color, Set<ButtonBaseState>>? color;

  /// The color of the box foreground.
  final CustomizableProperty<Color, Set<ButtonBaseState>>? foregroundColor;

  /// The color of the box border.
  final CustomizableProperty<Color, Set<ButtonBaseState>>? borderColor;

  ButtonBaseStyle copyWith({
    CustomizableProperty<Color, Set<ButtonBaseState>>? color,
    CustomizableProperty<Color, Set<ButtonBaseState>>? foregroundColor,
    CustomizableProperty<Color, Set<ButtonBaseState>>? borderColor,
  }) {
    return ButtonBaseStyle(
      color: color ?? this.color,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  /// Returns a copy of this ButtonBaseStyle where the non-null fields in [style]
  /// have replaced the corresponding null fields in this ButtonBaseStyle.
  ///
  /// In other words, [style] is used to fill in unspecified (null) fields
  /// this ButtonBaseStyle.
  ButtonBaseStyle merge(ButtonBaseStyle? style) {
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
