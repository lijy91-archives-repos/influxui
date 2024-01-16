import 'package:flutter/material.dart';
import 'package:rise_ui/src/widgets/extended_theme/extended_theme.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_style.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_theme.dart';

export 'kbd_theme.dart';

/// Display keyboard button or keys combination
class Kbd extends StatefulWidget {
  const Kbd(
    this.label, {
    super.key,
    this.style,
    this.size,
  });

  final String label;

  final KbdStyle? style;
  final Size? size;

  @override
  State<Kbd> createState() => _KbdState();
}

class _KbdState extends State<Kbd> {
  @override
  Widget build(BuildContext context) {
    final KbdThemeData? themeData = KbdTheme.of(context);
    final KbdThemeData defaults = _KbdDefaults(context);
    final Size size = widget.size ?? NamedSize.medium;
    KbdStyle mergedStyle = widget.style ?? const KbdStyle();

    if (size is NamedSize) {
      switch (size) {
        case NamedSize.tiny:
          mergedStyle = mergedStyle //
              .merge(themeData?.tinyStyle)
              .merge(defaults.tinyStyle);
          break;
        case NamedSize.small:
          mergedStyle = mergedStyle //
              .merge(themeData?.smallStyle)
              .merge(defaults.smallStyle);
          break;
        case NamedSize.medium:
          mergedStyle = mergedStyle //
              .merge(themeData?.mediumStyle)
              .merge(defaults.mediumStyle);
          break;
        case NamedSize.large:
          mergedStyle = mergedStyle //
              .merge(themeData?.largeStyle)
              .merge(defaults.largeStyle);
          break;
        case NamedSize.big:
          mergedStyle = mergedStyle //
              .merge(themeData?.bigStyle)
              .merge(defaults.bigStyle);
          break;
      }
    }

    final TextStyle? textStyle = mergedStyle.labelStyle?.copyWith(
      color: themeData?.labelColor ?? defaults.labelColor,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: ['Roboto'],
    );

    return Container(
      constraints: BoxConstraints(
        minWidth: mergedStyle.size!.width,
        minHeight: mergedStyle.size!.height,
      ),
      decoration: BoxDecoration(
        color: themeData?.color ?? defaults.color,
        border: BorderDirectional(
          start: BorderSide(
            color: themeData?.borderColor ?? defaults.borderColor!,
            width: 1,
          ),
          top: BorderSide(
            color: themeData?.borderColor ?? defaults.borderColor!,
            width: 1,
          ),
          end: BorderSide(
            color: themeData?.borderColor ?? defaults.borderColor!,
            width: 1,
          ),
          bottom: BorderSide(
            color: themeData?.borderColor ?? defaults.borderColor!,
            width: 3,
          ),
        ),
        borderRadius: themeData?.borderRadius ??
            defaults.borderRadius ??
            BorderRadius.zero,
      ),
      child: Padding(
        padding: mergedStyle.padding ?? EdgeInsets.zero,
        child: DefaultTextStyle(
          style: textStyle!,
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _KbdDefaults extends KbdThemeData {
  _KbdDefaults(this.context) : super();

  final BuildContext context;

  late final ThemeData _theme = Theme.of(context);
  late final bool _isDark = _theme.brightness == Brightness.dark;

  @override
  get color =>
      _isDark ? ExtendedColors.gray.shade500 : ExtendedColors.gray.shade50;

  @override
  get borderColor =>
      _isDark ? ExtendedColors.gray.shade300 : ExtendedColors.gray.shade300;

  @override
  get labelColor =>
      _isDark ? ExtendedColors.gray.shade50 : ExtendedColors.gray.shade700;

  @override
  get tinyStyle {
    return const KbdStyle(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      size: Size.square(10),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  get smallStyle {
    return const KbdStyle(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      size: Size.square(12),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  get mediumStyle {
    return const KbdStyle(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      size: Size.square(14),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  get largeStyle {
    return const KbdStyle(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      size: Size.square(16),
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  get bigStyle {
    return const KbdStyle(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      size: Size.square(20),
      labelStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
