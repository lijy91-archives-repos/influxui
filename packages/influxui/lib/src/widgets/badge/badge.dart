import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/badge/badge_style.dart';
import 'package:influxui/src/widgets/badge/badge_theme.dart';
import 'package:influxui/src/widgets/extended_theme/extended_sizes.dart';
import 'package:influxui/src/widgets/text/text_theme.dart';

export 'badge_theme.dart';

/// Controls badge appearance
enum BadgeVariant {
  light,
  filled,
  outline,
}

class BadgeSize extends Size {
  const BadgeSize(super.width, super.height);
  static const ExtendedSize small = ExtendedSize.small;
  static const ExtendedSize medium = ExtendedSize.medium;
  static const ExtendedSize large = ExtendedSize.large;
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
    final BadgeThemeData? themeData = BadgeTheme.of(context);
    final BadgeThemeData defaults = _BadgeDefaults(context);

    BadgeStyle mergedStyle =
        themeData?.mediumStyle ?? defaults.mediumStyle ?? const BadgeStyle();

    if (size is ExtendedSize) {
      switch (size) {
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
      }
    }

    return Container(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: mergedStyle.minimumSize?.width ?? 0,
        minHeight: mergedStyle.minimumSize?.height ?? 0,
        maxWidth: mergedStyle.maximumSize?.width ?? double.infinity,
        maxHeight: mergedStyle.maximumSize?.height ?? double.infinity,
      ),
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

class _BadgeDefaults extends BadgeThemeData {
  _BadgeDefaults(this.context) : super();

  final BuildContext context;

  @override
  get borderRadius => const BorderRadius.all(Radius.circular(4));

  @override
  get pressedOpacity => 0.8;

  @override
  BadgeStyle? get smallStyle {
    return const BadgeStyle(
      padding: EdgeInsets.symmetric(horizontal: 8),
      minimumSize: Size.square(22),
      iconSize: 16,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  BadgeStyle? get mediumStyle {
    return const BadgeStyle(
      padding: EdgeInsets.symmetric(horizontal: 10),
      minimumSize: Size.square(28),
      iconSize: 20,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  BadgeStyle? get largeStyle {
    return const BadgeStyle(
      padding: EdgeInsets.symmetric(horizontal: 12),
      minimumSize: Size.square(34),
      iconSize: 24,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
