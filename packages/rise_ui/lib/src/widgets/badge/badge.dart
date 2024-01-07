import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/badge/badge_style.dart';
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
    final BadgeThemeData? themeData = BadgeTheme.of(context);
    final BadgeThemeData defaults = _BadgeDefaults(context);

    BadgeStyle mergedStyle =
        themeData?.mediumStyle ?? defaults.mediumStyle ?? const BadgeStyle();

    if (size is NamedSize) {
      switch (size) {
        case NamedSize.tiny:
          mergedStyle = mergedStyle // merge tiny style
              .merge(themeData?.tinyStyle)
              .merge(defaults.tinyStyle);
          break;
        case NamedSize.small:
          mergedStyle = mergedStyle // merge small style
              .merge(themeData?.smallStyle)
              .merge(defaults.smallStyle);
          break;
        case NamedSize.medium:
          mergedStyle = mergedStyle // merge medium style
              .merge(themeData?.mediumStyle)
              .merge(defaults.mediumStyle);
          break;
        case NamedSize.large:
          mergedStyle = mergedStyle // merge large style
              .merge(themeData?.largeStyle)
              .merge(defaults.largeStyle);
          break;
        case NamedSize.big:
          mergedStyle = mergedStyle // merge big style
              .merge(themeData?.bigStyle)
              .merge(defaults.bigStyle);
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
  BadgeStyle? get tinyStyle {
    return const BadgeStyle(
      padding: EdgeInsets.symmetric(horizontal: 6),
      minimumSize: Size.square(18),
      iconSize: 12,
      labelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    );
  }

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

  @override
  BadgeStyle? get bigStyle {
    return const BadgeStyle(
      padding: EdgeInsets.symmetric(horizontal: 14),
      minimumSize: Size.square(44),
      iconSize: 32,
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
