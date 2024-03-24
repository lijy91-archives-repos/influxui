import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart'
    show Colors, MaterialColor, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/badge/badge_base_style.dart';
import 'package:influxui/src/widgets/badge/badge_base_theme.dart';

export 'package:influxui/src/widgets/badge/badge_base_style.dart';
export 'package:influxui/src/widgets/badge/badge_base_theme.dart';

enum BadgeBaseVariant {
  filled,
  outlined,
  light,
  subtle,
  transparent;

  static BadgeBaseVariant? valueOf(String? name) {
    return BadgeBaseVariant.values.firstWhereOrNull(
      (variant) => variant.name == name,
    );
  }
}

typedef BadgeBaseWidgetBuilder = Widget Function(
  BuildContext context,
  Color foregroundColor,
);

class BadgeBase extends StatefulWidget {
  const BadgeBase({
    super.key,
    this.variant,
    this.style,
    this.padding,
    this.color,
    this.borderRadius,
    this.pressedOpacity,
    this.mouseCursor,
    this.disabled = false,
    this.onPressed,
    required this.builder,
  });

  final BadgeBaseVariant? variant;
  final BadgeBaseStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadius? borderRadius;
  final double? pressedOpacity;
  final MouseCursor? mouseCursor;
  final bool disabled;
  final VoidCallback? onPressed;
  final BadgeBaseWidgetBuilder builder;

  @override
  State<BadgeBase> createState() => _BadgeBaseState();
}

class _BadgeBaseState extends State<BadgeBase> {
  Color? _resolveColor(
    Color? seedColor, {
    Color? color,
    int? colorShade,
    double? colorOpacity,
  }) {
    if (color != null) return color;
    if (colorShade == -1) return Colors.transparent;
    if (seedColor is MaterialColor) {
      if (colorShade != null) {
        return seedColor[colorShade];
      } else if (colorOpacity != null) {
        return seedColor.withOpacity(colorOpacity);
      }
    }
    return seedColor;
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final BadgeBaseThemeData? themeData = BadgeBaseTheme.of(context);
    final BadgeBaseThemeData defaults = _BadgeBaseDefaults(context);

    BadgeBaseStyle mergedStyle = widget.style ?? const BadgeBaseStyle();
    switch (widget.variant) {
      case BadgeBaseVariant.filled:
        mergedStyle = mergedStyle // merge filled style
            .merge(themeData?.filledStyle)
            .merge(defaults.filledStyle);
      case BadgeBaseVariant.outlined:
        mergedStyle = mergedStyle // merge outlined style
            .merge(themeData?.outlinedStyle)
            .merge(defaults.outlinedStyle);
      case BadgeBaseVariant.light:
        mergedStyle = mergedStyle // merge light style
            .merge(themeData?.lightStyle)
            .merge(defaults.lightStyle);
      case BadgeBaseVariant.subtle: // merge subtle style
        mergedStyle = mergedStyle
            .merge(themeData?.subtleStyle)
            .merge(defaults.subtleStyle);
      case BadgeBaseVariant.transparent:
        mergedStyle = mergedStyle // merge transparent style
            .merge(themeData?.transparentStyle)
            .merge(defaults.transparentStyle);
      default:
    }

    final backgroundColor = _resolveColor(
      widget.color ?? mergedStyle.color ?? primaryColor,
      color: mergedStyle.color,
      colorShade: mergedStyle.colorShade,
      colorOpacity: mergedStyle.colorOpacity,
    );
    final foregroundColor = _resolveColor(
      widget.color ?? mergedStyle.foregroundColor ?? primaryColor,
      color: mergedStyle.foregroundColor,
      colorShade: mergedStyle.foregroundColorShade,
      colorOpacity: mergedStyle.foregroundColorOpacity,
    );
    final borderColor = _resolveColor(
      widget.color ?? mergedStyle.borderColor ?? primaryColor,
      color: mergedStyle.borderColor,
      colorShade: mergedStyle.borderColorShade,
      colorOpacity: mergedStyle.borderColorOpacity,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: widget.builder(context, foregroundColor!),
      ),
    );
  }
}

class _BadgeBaseDefaults extends BadgeBaseThemeData {
  _BadgeBaseDefaults(this.context) : super();

  final BuildContext context;

  late final ThemeData _theme = Theme.of(context);
  late final bool _isDark = _theme.brightness == Brightness.dark;

  @override
  BadgeBaseStyle? get filledStyle {
    return const BadgeBaseStyle(
      colorShade: 600,
      foregroundColor: Colors.white,
      borderColorShade: 600,
    );
  }

  @override
  BadgeBaseStyle? get outlinedStyle {
    if (_isDark) {
      return const BadgeBaseStyle(
        colorShade: -1,
        borderColorShade: 600,
      );
    }
    return const BadgeBaseStyle(
      colorShade: -1,
      foregroundColorShade: 600,
      borderColorShade: 600,
    );
  }

  @override
  BadgeBaseStyle? get lightStyle {
    if (_isDark) {
      return const BadgeBaseStyle(
        colorOpacity: 0.15,
      );
    }
    return const BadgeBaseStyle(
      colorShade: 50,
      borderColorShade: 50,
    );
  }

  @override
  BadgeBaseStyle? get subtleStyle {
    if (_isDark) {
      return const BadgeBaseStyle(
        colorShade: -1,
      );
    }
    return const BadgeBaseStyle(
      colorShade: -1,
    );
  }

  @override
  BadgeBaseStyle? get transparentStyle {
    return const BadgeBaseStyle(
      color: Colors.transparent,
    );
  }
}
