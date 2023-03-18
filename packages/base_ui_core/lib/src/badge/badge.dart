import 'package:base_ui_core/src/badge/badge_theme.dart';
import 'package:base_ui_core/src/box/box.dart';
import 'package:base_ui_core/src/text/text_theme.dart';
import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/material.dart' show MaterialColor;
import 'package:flutter/widgets.dart';

export 'badge_theme.dart';

/// Controls badge appearance
enum BadgeVariant {
  light,
  filled,
  outline,
  dot,
  gradient,
}

class BadgeSize extends Size {
  const BadgeSize(super.width, super.height);
  static const NamedSize tiny = NamedSize.tiny;
  static const NamedSize small = NamedSize.small;
  static const NamedSize medium = NamedSize.medium;
  static const NamedSize large = NamedSize.large;
  static const NamedSize big = NamedSize.big;
}

/// Display badge, pill or tag
class Badge extends StatelessWidget {
  const Badge({
    super.key,
    this.variant,
    this.color,
    this.shape,
    this.size = BadgeSize.medium,
    this.label,
    this.labelColor,
    this.labelStyle,
    this.labelBuilder,
  }) : assert(labelBuilder == null && label != null);

  /// Controls badge appearance
  final BadgeVariant? variant;

  /// The badge's fill color.
  final Color? color;

  final Shape? shape;

  final Size? size;

  /// Badge label
  final String? label;

  /// Badge label color
  final Color? labelColor;

  /// Badge label style
  final TextStyle? labelStyle;

  /// Badge label builder
  final WidgetBuilder? labelBuilder;

  @override
  Widget build(BuildContext context) {
    Color color = this.color ?? Theme.of(context).primaryColor;
    Color labelColor = color;

    if (color is MaterialColor) {
      labelColor = color;
      color = color.shade200;
    }
    return Box(
      shape: shape ?? Shape.circle,
      color: color,
      child: Builder(builder: (_) {
        TextStyle labelStyle = (this.labelStyle ??
                BadgeTheme.of(context).labelStyle ??
                TextStyle())
            .copyWith(color: labelColor, fontFamily: 'Roboto');
        return DefaultTextStyle(
          style: labelStyle,
          child: labelBuilder?.call(context) ?? Text(label!),
        );
      }),
    );
  }
}
