import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    hide IconButtonTheme, IconButtonThemeData;
import 'package:influxui/src/widgets/button/button_base.dart';
import 'package:influxui/src/widgets/extended_theme/extended_sizes.dart';
import 'package:influxui/src/widgets/icon_button/icon_button_style.dart';
import 'package:influxui/src/widgets/icon_button/icon_button_theme.dart';
import 'package:influxui/src/widgets/web_icon/web_icon.dart';

export 'package:influxui/src/widgets/icon_button/icon_button_style.dart';
export 'package:influxui/src/widgets/icon_button/icon_button_theme.dart';

typedef IconWidgetBuilder = Widget Function(
  BuildContext context,
  IconData icon,
);

enum IconButtonVariant {
  filled,
  outlined,
  light,
  subtle,
  transparent;
}

class IconButtonSize extends Size {
  IconButtonSize(super.width, super.height);
  static const ExtendedSize tiny = ExtendedSize.tiny;
  static const ExtendedSize small = ExtendedSize.small;
  static const ExtendedSize medium = ExtendedSize.medium;
  static const ExtendedSize large = ExtendedSize.large;
  static const ExtendedSize big = ExtendedSize.big;
}

class IconButton extends StatefulWidget {
  const IconButton(
    this.icon, {
    super.key,
    this.variant = IconButtonVariant.filled,
    this.iconBuilder,
    this.style,
    this.padding,
    this.color,
    this.size = ExtendedSize.medium,
    this.iconSize,
    this.onPressed,
  }) : assert(size is Size || size is ExtendedSize || size == null);

  final IconButtonVariant? variant;
  final IconData icon;
  final IconWidgetBuilder? iconBuilder;
  final IconButtonStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  // final Shape? shape;
  final Size? size;
  final double? iconSize;
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
  @override
  Widget build(BuildContext context) {
    final IconButtonThemeData? themeData = IconButtonTheme.of(context);
    final IconButtonThemeData defaults = _IconButtonDefaults(context);

    IconButtonStyle mergedStyle = widget.style ?? const IconButtonStyle();

    if (widget.size is ExtendedSize) {
      switch (widget.size) {
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
    } else if (widget.size is Size) {
      mergedStyle = mergedStyle.copyWith(size: widget.size);
    }
    if (widget.iconSize != null) {
      mergedStyle = mergedStyle.copyWith(iconSize: widget.iconSize);
    }

    final widgetWidth = mergedStyle.size?.width;
    final widgetHeight = mergedStyle.size?.height;
    final iconSize = mergedStyle.iconSize;

    Widget? iconWidget = kIsWeb
        ? WebIcon(widget.icon, size: iconSize)
        : Icon(widget.icon, size: iconSize);
    if (widget.iconBuilder != null) {
      iconWidget = widget.iconBuilder!(context, widget.icon);
    }

    return ButtonBase(
      variant: ButtonBaseVariant.valueOf(widget.variant?.name),
      padding: widget.padding,
      color: widget.color,
      borderRadius: mergedStyle.borderRadius,
      pressedOpacity: themeData?.pressedOpacity ?? defaults.pressedOpacity,
      mouseCursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      onPressed: widget.onPressed,
      builder: (context, foregroundColor) {
        return IconTheme(
          data: IconThemeData(
            color: foregroundColor,
            size: iconSize,
          ),
          child: SizedBox(
            width: widgetWidth,
            height: widgetHeight,
            child: Center(
              child: iconWidget,
            ),
          ),
        );
      },
    );
  }
}

class _IconButtonDefaults extends IconButtonThemeData {
  _IconButtonDefaults(this.context) : super();

  final BuildContext context;

  @override
  get pressedOpacity => 0.8;

  @override
  get tinyStyle {
    return const IconButtonStyle(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      size: Size(24, 24),
      iconSize: 18,
    );
  }

  @override
  get smallStyle {
    return const IconButtonStyle(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      size: Size(28, 28),
      iconSize: 22,
    );
  }

  @override
  get mediumStyle {
    return const IconButtonStyle(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      size: Size(32, 32),
      iconSize: 24,
    );
  }

  @override
  get largeStyle {
    return const IconButtonStyle(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      size: Size(36, 36),
      iconSize: 28,
    );
  }

  @override
  get bigStyle {
    return const IconButtonStyle(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      size: Size(40, 40),
      iconSize: 32,
    );
  }
}
