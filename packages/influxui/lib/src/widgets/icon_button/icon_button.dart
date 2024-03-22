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
  light,
  outline,
  subtle,
  transparent,
  white;
}

class IconButtonSize extends Size {
  IconButtonSize(super.width, super.height);
  static const ExtendedSize small = ExtendedSize.small;
  static const ExtendedSize medium = ExtendedSize.medium;
  static const ExtendedSize large = ExtendedSize.large;
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
    this.size,
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

    IconButtonStyle mergedStyle = widget.style ??
        themeData?.mediumStyle ??
        defaults.mediumStyle ??
        const IconButtonStyle();

    if (widget.size is ExtendedSize) {
      switch (widget.size) {
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
      borderRadius: themeData?.borderRadius ?? defaults.borderRadius,
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
  get borderRadius => const BorderRadius.all(Radius.circular(4));

  @override
  get pressedOpacity => 0.8;

  @override
  get smallStyle {
    return const IconButtonStyle(
      size: Size(22, 22),
      iconSize: 16,
    );
  }

  @override
  get mediumStyle {
    return const IconButtonStyle(
      size: Size(28, 28),
      iconSize: 20,
    );
  }

  @override
  get largeStyle {
    return const IconButtonStyle(
      size: Size(34, 34),
      iconSize: 24,
    );
  }
}
