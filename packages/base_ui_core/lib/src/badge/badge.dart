import 'package:flutter/widgets.dart';

import 'badge_theme.dart';
export 'badge_theme.dart';

/// Controls badge appearance
enum BadgeVariant {
  light,
  filled,
  outline,
  dot,
  gradient,
}

/// Display badge, pill or tag
class Badge extends StatelessWidget {
  /// The badge's fill color.
  final Color? color;

  /// Controls badge appearance
  final BadgeVariant? variant;

  /// Badge label
  final String? label;

  /// Badge label color
  final Color? labelColor;

  /// Badge label style
  final TextStyle? labelStyle;

  /// Badge label builder
  final WidgetBuilder? labelBuilder;

  const Badge({
    super.key,
    this.color,
    this.variant,
    this.label,
    this.labelColor,
    this.labelStyle,
    this.labelBuilder,
  }) : assert(labelBuilder == null && label != null);

  Widget _buildLabel(BuildContext context) {
    BadgeThemeData themeData = BadgeTheme.of(context);
    return DefaultTextStyle(
      style: themeData.labelStyle ?? const TextStyle(),
      child: labelBuilder?.call(context) ?? Text(label!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildLabel(context),
    );
  }
}
