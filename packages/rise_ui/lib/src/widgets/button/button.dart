import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/box/box.dart';
import 'package:rise_ui/src/widgets/button/button_style.dart';
import 'package:rise_ui/src/widgets/button/button_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

export 'package:rise_ui/src/widgets/button/button_style.dart';
export 'package:rise_ui/src/widgets/button/button_theme.dart';
export 'package:rise_ui/src/widgets/button/button_theme_defaults.dart';

enum ButtonVariant {
  filled,
  light,
  outline,
  subtle,
  transparent,
  white;
}

class ButtonSize extends Size {
  ButtonSize(super.width, super.height);
  static NamedSize get tiny => NamedSize.tiny;
  static NamedSize get small => NamedSize.small;
  static NamedSize get medium => NamedSize.medium;
  static NamedSize get large => NamedSize.large;
  static NamedSize get big => NamedSize.big;
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.variant = ButtonVariant.filled,
    this.label,
    this.labelBuilder,
    this.style,
    this.padding,
    this.color,
    this.size,
    this.iconSize,
    this.onPressed,
  }) : assert(size is Size || size is NamedSize || size == null);

  final ButtonVariant? variant;
  final String? label;
  final WidgetBuilder? labelBuilder;
  final ButtonStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Size? size;
  final double? iconSize;
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final themeData = ButtonTheme.of(context);
    ButtonStyle mergedStyle = widget.style ?? themeData.mediumStyle;

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
    }
    if (widget.iconSize != null) {
      mergedStyle = mergedStyle.copyWith(iconSize: widget.iconSize);
    }

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
      builder: (context, foregroundColor) {
        return Container(
          padding: mergedStyle.padding,
          constraints: BoxConstraints(
            minWidth: mergedStyle.minimumSize?.width ?? 0,
            minHeight: mergedStyle.minimumSize?.height ?? 0,
            maxWidth: mergedStyle.maximumSize?.width ?? double.infinity,
            maxHeight: mergedStyle.maximumSize?.height ?? double.infinity,
          ),
          child: DefaultTextStyle(
            style: (mergedStyle.labelStyle ?? TextStyle()).copyWith(
              color: foregroundColor,
            ),
            child: IconTheme(
              data: IconThemeData(
                color: foregroundColor,
                size: mergedStyle.iconSize,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.labelBuilder?.call(context) ?? Text(widget.label!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
