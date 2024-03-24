import 'package:flutter/material.dart' show Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/badge/badge_base.dart';
import 'package:influxui/src/widgets/badge/badge_style.dart';
import 'package:influxui/src/widgets/badge/badge_theme.dart';
import 'package:influxui/src/widgets/extended_theme/extended_sizes.dart';

export 'badge_theme.dart';

/// Controls badge appearance
enum BadgeVariant {
  filled,
  outlined,
  light,
}

class BadgeSize extends Size {
  const BadgeSize(super.width, super.height);
  static const ExtendedSize tiny = ExtendedSize.tiny;
  static const ExtendedSize small = ExtendedSize.small;
  static const ExtendedSize medium = ExtendedSize.medium;
  static const ExtendedSize large = ExtendedSize.large;
  static const ExtendedSize big = ExtendedSize.big;
}

/// Display badge, pill or tag
class Badge extends StatelessWidget {
  const Badge({
    super.key,
    this.variant = BadgeVariant.light,
    this.padding,
    this.color,
    this.size = BadgeSize.medium,
    this.label,
    this.labelStyle,
    this.labelBuilder,
  }) : assert(labelBuilder == null && label != null);

  /// Controls badge appearance
  final BadgeVariant? variant;

  final EdgeInsetsGeometry? padding;

  /// The badge's fill color.
  final Color? color;

  final Size? size;

  /// Badge label
  final String? label;

  /// Badge label style
  final TextStyle? labelStyle;

  /// Badge label builder
  final WidgetBuilder? labelBuilder;

  @override
  Widget build(BuildContext context) {
    final BadgeThemeData? themeData = BadgeTheme.of(context);
    final BadgeThemeData defaults = _BadgeDefaults(context);

    BadgeStyle mergedStyle = const BadgeStyle();

    if (size is ExtendedSize) {
      switch (size) {
        case ExtendedSize.tiny:
          mergedStyle = mergedStyle // merge tiny style
              .merge(themeData?.tinyStyle)
              .merge(defaults.tinyStyle);
          break;
        case ExtendedSize.small:
          mergedStyle = mergedStyle // merge small style
              .merge(themeData?.smallStyle)
              .merge(defaults.smallStyle);
          break;
        case ExtendedSize.medium:
          mergedStyle = mergedStyle // merge medium style
              .merge(themeData?.mediumStyle)
              .merge(defaults.mediumStyle);
          break;
        case ExtendedSize.large:
          mergedStyle = mergedStyle // merge large style
              .merge(themeData?.largeStyle)
              .merge(defaults.largeStyle);
          break;
        case ExtendedSize.big:
          mergedStyle = mergedStyle // merge big style
              .merge(themeData?.bigStyle)
              .merge(defaults.bigStyle);
          break;
      }
    }

    return BadgeBase(
      variant: BadgeBaseVariant.valueOf(variant?.name),
      padding: padding ?? mergedStyle.padding,
      color: color,
      borderRadius: mergedStyle.borderRadius,
      builder: (context, foregroundColor) {
        return Container(
          constraints: BoxConstraints(
            minWidth: mergedStyle.minimumSize?.width ?? 0,
            minHeight: mergedStyle.minimumSize?.height ?? 0,
            maxWidth: mergedStyle.maximumSize?.width ?? double.infinity,
            maxHeight: mergedStyle.maximumSize?.height ?? double.infinity,
          ),
          child: DefaultTextStyle(
            style: (mergedStyle.labelStyle ?? const TextStyle()).copyWith(
              color: foregroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                labelBuilder?.call(context) ?? Text(label!),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BadgeDefaults extends BadgeThemeData {
  _BadgeDefaults(this.context) : super();

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);

  @override
  BadgeStyle? get tinyStyle {
    return BadgeStyle(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(20),
      labelStyle: _theme.textTheme.labelSmall,
    );
  }

  @override
  BadgeStyle? get smallStyle {
    return BadgeStyle(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(20),
      labelStyle: _theme.textTheme.labelSmall,
    );
  }

  @override
  BadgeStyle? get mediumStyle {
    return BadgeStyle(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(20),
      labelStyle: _theme.textTheme.labelSmall,
    );
  }

  @override
  BadgeStyle? get largeStyle {
    return BadgeStyle(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(20),
      labelStyle: _theme.textTheme.labelSmall,
    );
  }

  @override
  BadgeStyle? get bigStyle {
    return BadgeStyle(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      // minimumSize: const Size.square(20),
      labelStyle: _theme.textTheme.labelSmall,
    );
  }
}
