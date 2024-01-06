import 'package:flutter/material.dart'
    hide ButtonStyle, ButtonTheme, ButtonThemeData;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/box/box.dart';
import 'package:rise_ui/src/widgets/button/button_style.dart';
import 'package:rise_ui/src/widgets/button/button_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

export 'package:rise_ui/src/widgets/button/button_style.dart';
export 'package:rise_ui/src/widgets/button/button_theme.dart';

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
    final ButtonThemeData? themeData = ButtonTheme.of(context);
    final ButtonThemeData defaults = _ButtonDefaults(context);
    ButtonStyle mergedStyle = widget.style ??
        themeData?.mediumStyle ??
        defaults.mediumStyle ??
        const ButtonStyle();

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
    }
    if (widget.iconSize != null) {
      mergedStyle = mergedStyle.copyWith(iconSize: widget.iconSize);
    }

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
        return Container(
          padding: mergedStyle.padding,
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

class _ButtonDefaults extends ButtonThemeData {
  _ButtonDefaults(this.context) : super();

  final BuildContext context;

  @override
  BorderRadius? get borderRadius => const BorderRadius.all(Radius.circular(4));

  @override
  double get pressedOpacity => 0.8;

  @override
  ButtonStyle? get tinyStyle {
    return const ButtonStyle(
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
  ButtonStyle? get smallStyle {
    return const ButtonStyle(
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
  ButtonStyle? get mediumStyle {
    return const ButtonStyle(
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
  ButtonStyle? get largeStyle {
    return const ButtonStyle(
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
  ButtonStyle? get bigStyle {
    return const ButtonStyle(
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
