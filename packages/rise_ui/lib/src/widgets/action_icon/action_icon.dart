import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/theme/sizes.dart';
import 'package:rise_ui/src/widgets/web_icon/web_icon.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon_style.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon_theme.dart';
import 'package:rise_ui/src/widgets/box/box.dart';

export 'package:rise_ui/src/widgets/action_icon/action_icon_style.dart';
export 'package:rise_ui/src/widgets/action_icon/action_icon_theme.dart';
export 'package:rise_ui/src/widgets/action_icon/action_icon_theme_defaults.dart';

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
  static NamedSize get tiny => NamedSize.tiny;
  static NamedSize get small => NamedSize.small;
  static NamedSize get medium => NamedSize.medium;
  static NamedSize get large => NamedSize.large;
  static NamedSize get big => NamedSize.big;
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
    final themeData = ActionIconTheme.of(context);
    ActionIconStyle mergedStyle = widget.style ?? themeData.mediumStyle;

    if (widget.size is NamedSize) {
      switch (widget.size) {
        case NamedSize.tiny:
          mergedStyle = themeData.tinyStyle.merge(mergedStyle);
          break;
        case NamedSize.small:
          mergedStyle = themeData.smallStyle.merge(mergedStyle);
          break;
        case NamedSize.medium:
          mergedStyle = themeData.mediumStyle.merge(mergedStyle);
          break;
        case NamedSize.large:
          mergedStyle = themeData.largeStyle.merge(mergedStyle);
          break;
        case NamedSize.big:
          mergedStyle = themeData.bigStyle.merge(mergedStyle);
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
      borderRadius: themeData.borderRadius,
      pressedOpacity: themeData.pressedOpacity,
      mouseCursor: widget.enabled && kIsWeb
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      onPressed: widget.onPressed,
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
  }
}
