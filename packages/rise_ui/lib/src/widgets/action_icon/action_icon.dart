import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    hide ActionIconTheme, ActionIconThemeData;
import 'package:rise_ui/src/widgets/action_icon/action_icon_style.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon_theme.dart';
import 'package:rise_ui/src/widgets/box/box.dart';
import 'package:rise_ui/src/widgets/theme/sizes.dart';
import 'package:rise_ui/src/widgets/web_icon/web_icon.dart';

export 'package:rise_ui/src/widgets/action_icon/action_icon_style.dart';
export 'package:rise_ui/src/widgets/action_icon/action_icon_theme.dart';

enum ActionIconVariant {
  filled,
  light,
  outline,
  subtle,
  transparent,
  white;
}

class ActionIconSize extends Size {
  ActionIconSize(super.width, super.height);
  static const NamedSize tiny = NamedSize.tiny;
  static const NamedSize small = NamedSize.small;
  static const NamedSize medium = NamedSize.medium;
  static const NamedSize large = NamedSize.large;
  static const NamedSize big = NamedSize.big;
}

class ActionIcon extends StatefulWidget {
  const ActionIcon(
    this.icon, {
    super.key,
    this.variant = ActionIconVariant.filled,
    this.style,
    this.padding,
    this.color,
    this.size,
    this.iconSize,
    this.onPressed,
  }) : assert(size is Size || size is NamedSize || size == null);

  final IconData icon;
  final ActionIconVariant? variant;
  final ActionIconStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  // final Shape? shape;
  final Size? size;
  final double? iconSize;
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<ActionIcon> createState() => _ActionIconState();
}

class _ActionIconState extends State<ActionIcon> {
  @override
  Widget build(BuildContext context) {
    final ActionIconThemeData? themeData = ActionIconTheme.of(context);
    final ActionIconThemeData defaults = _ActionIconDefaults(context);

    ActionIconStyle mergedStyle = widget.style ??
        themeData?.mediumStyle ??
        defaults.mediumStyle ??
        ActionIconStyle();

    if (widget.size is NamedSize) {
      switch (widget.size) {
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
    } else if (widget.size is Size) {
      mergedStyle = mergedStyle.copyWith(size: widget.size);
    }
    if (widget.iconSize != null) {
      mergedStyle = mergedStyle.copyWith(iconSize: widget.iconSize);
    }

    final widgetWidth = mergedStyle.size?.width;
    final widgetHeight = mergedStyle.size?.height;
    final iconSize = mergedStyle.iconSize;

    return Box(
      variant: BoxVariant.valueOf(widget.variant?.name),
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
              child: kIsWeb
                  ? WebIcon(
                      widget.icon,
                      size: iconSize,
                    )
                  : Icon(
                      widget.icon,
                      size: iconSize,
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _ActionIconDefaults extends ActionIconThemeData {
  _ActionIconDefaults(this.context) : super();

  final BuildContext context;

  @override
  get borderRadius => BorderRadius.all(Radius.circular(4));

  @override
  get pressedOpacity => 0.8;

  @override
  get tinyStyle {
    return ActionIconStyle(
      size: Size(18, 18),
      iconSize: 12,
    );
  }

  @override
  get smallStyle {
    return ActionIconStyle(
      size: Size(22, 22),
      iconSize: 16,
    );
  }

  @override
  get mediumStyle {
    return ActionIconStyle(
      size: Size(28, 28),
      iconSize: 20,
    );
  }

  @override
  get largeStyle {
    return ActionIconStyle(
      size: Size(34, 34),
      iconSize: 24,
    );
  }

  @override
  get bigStyle {
    return ActionIconStyle(
      size: Size(44, 44),
      iconSize: 32,
    );
  }
}
