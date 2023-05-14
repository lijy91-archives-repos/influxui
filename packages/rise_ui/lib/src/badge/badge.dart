import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/badge/badge_theme.dart';
import 'package:rise_ui/src/text/text_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

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
    this.brightness,
    this.variant = BadgeVariant.light,
    this.shape = Shape.pill,
    this.color,
    this.size = BadgeSize.medium,
    this.cornered,
    this.cornerRadius,
    this.label,
    this.labelStyle,
    this.labelBuilder,
  }) : assert(labelBuilder == null && label != null);

  final Brightness? brightness;

  /// Controls badge appearance
  final BadgeVariant? variant;

  final Shape? shape;

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
    final BadgeThemeData styledTheme = BadgeTheme.of(context) // styled
        .brightnessed(brightness ?? Theme.of(context).brightness)
        .varianted(variant)
        .colored(color ?? Theme.of(context).primaryColor)
        .sized(size)
        .shaped(shape);

    Size minSize = Size(
      styledTheme.size?.width ?? 0,
      styledTheme.size?.height ?? 0,
    );
    Size maxSize = Size(
      (styledTheme.size?.width ?? 0) != 0
          ? styledTheme.size!.width
          : double.infinity,
      styledTheme.size?.height ?? double.infinity,
    );
    Color? backgroundColor = styledTheme.color;
    Color? borderColor = styledTheme.color;
    Color? labelColor = styledTheme.labelColor;

    if (backgroundColor is ShadedColor) {
      if (styledTheme.colorShade != null) {
        backgroundColor = backgroundColor[styledTheme.colorShade!];
      }
    }

    if (borderColor is ShadedColor) {
      if (variant != BadgeVariant.outline) {
        borderColor = null;
      }
    }

    if (labelColor is ShadedColor) {
      if (styledTheme.labelColorShade != null) {
        labelColor = labelColor[styledTheme.labelColorShade!];
      }
    }

    ShapeBorder? shapeBorder = RoundedRectangleBorder(
      side: BorderSide(
        color: borderColor ?? Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        styledTheme.cornerRadius ?? 0,
      ),
    );

    if (shape == Shape.circle) {
      shapeBorder = CircleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
        ),
      );
    }
    if (shape == Shape.square || shape == Shape.circle) {
      minSize = Size(
        minSize.height,
        minSize.height,
      );
      maxSize = Size(
        maxSize.height,
        maxSize.height,
      );
    }

    return Container(
      padding: styledTheme.padding ?? EdgeInsets.zero,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: shapeBorder,
      ),
      constraints: BoxConstraints(
        minWidth: minSize.width,
        minHeight: minSize.height,
        maxWidth: maxSize.width,
        maxHeight: maxSize.height,
      ),
      child: Align(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: DefaultTextStyle(
          style: TextTheme.of(context).textStyle.copyWith(
                color: styledTheme.labelColor,
                fontSize: styledTheme.labelFontSize,
                overflow: TextOverflow.ellipsis,
              ),
          child: labelBuilder?.call(context) ?? Text(label!),
        ),
      ),
    );
  }
}
