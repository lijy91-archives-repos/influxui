import 'package:base_ui_core/src/badge/badge_theme.dart';
import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

export 'badge_theme.dart';

/// Controls badge appearance
enum BadgeVariant {
  light,
  filled,
  outline,
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
    this.size = BadgeSize.medium,
    this.cornered,
    this.cornerRadius,
    this.label,
    this.labelStyle,
    this.labelBuilder,
  })  : assert(labelBuilder == null && label != null),
        _pilled = false;

  Badge.pill({
    super.key,
    this.variant,
    this.color,
    this.size = BadgeSize.medium,
    this.cornered,
    this.cornerRadius,
    this.label,
    this.labelStyle,
    this.labelBuilder,
  }) : _pilled = true;

  Badge.dot({
    super.key,
    this.variant,
    this.color,
    this.size = BadgeSize.medium,
    this.cornered,
    this.cornerRadius,
    this.label,
    this.labelStyle,
    this.labelBuilder,
  }) : _pilled = true;

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

  final bool _pilled;

  @override
  Widget build(BuildContext context) {
    final BadgeThemeData badgeTheme = BadgeTheme.of(context);
    final BadgeThemeData defaults = _BadgeDefaults(context);

    final Color color = this.color ?? badgeTheme.color ?? defaults.color!;
    final TextStyle labelStyle =
        this.labelStyle ?? badgeTheme.labelStyle ?? defaults.labelStyle!;

    Color backgroundColor = color;
    Color labelColor = labelStyle.color ?? color;
    bool cornered = this.cornered ?? badgeTheme.cornered ?? defaults.cornered!;
    double cornerRadius =
        this.cornerRadius ?? badgeTheme.cornerRadius ?? defaults.cornerRadius!;

    switch (variant) {
      case BadgeVariant.light:
        backgroundColor = color is ShadedColor ? color.shade100 : color;
        break;
      case BadgeVariant.filled:
        labelColor = Colors.white;
        break;
      case BadgeVariant.outline:
        backgroundColor = Colors.transparent;
        break;
      case BadgeVariant.gradient:
        break;
      default:
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: color,
        ),
        borderRadius:
            cornered ? BorderRadius.circular(cornerRadius) : BorderRadius.zero,
      ),
      child: DefaultTextStyle(
        style: labelStyle.copyWith(
          color: labelColor,
        ),
        child: labelBuilder?.call(context) ?? Text(label!),
      ),
    );
  }
}

class _BadgeDefaults extends BadgeThemeData {
  _BadgeDefaults(this.context)
      : super(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: const AlignmentDirectional(12, -4),
        );

  @override
  Color? get color => Theme.of(context).primaryColor;

  @override
  bool? get cornered => true;

  @override
  double? get cornerRadius => 24;

  @override
  TextStyle? get labelStyle => Theme.of(context).textTheme.textStyle;

  final BuildContext context;
}
