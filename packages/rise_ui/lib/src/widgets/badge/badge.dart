import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/badge/badge_theme.dart';
import 'package:rise_ui/src/widgets/text/text_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

export 'badge_theme.dart';

/// Controls badge appearance
enum BadgeVariant {
  light,
  filled,
  outline,
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
    this.variant = BadgeVariant.light,
    this.color,
    this.size = BadgeSize.medium,
    this.cornered,
    this.cornerRadius,
    this.label,
    this.labelStyle,
    this.labelBuilder,
  }) : assert(labelBuilder == null && label != null);

  /// Controls badge appearance
  final BadgeVariant? variant;

  /// The badge's fill color.
  final Color? color;

  final Size? size;

  final bool? cornered;

  final double? cornerRadius;

  /// Badge label
  final String? label;

  /// Badge label style
  final TextStyle? labelStyle;

  /// Badge label builder
  final WidgetBuilder? labelBuilder;

  @override
  Widget build(BuildContext context) {
    final themeData = BadgeTheme.of(context);

    return Container(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      child: Align(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: DefaultTextStyle(
          style: TextTheme.of(context).textStyle.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
          child: labelBuilder?.call(context) ?? Text(label!),
        ),
      ),
    );
  }
}
