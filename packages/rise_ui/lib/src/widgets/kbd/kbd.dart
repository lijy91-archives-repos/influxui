import 'package:flutter/widgets.dart';
import 'package:non_uniform_border/non_uniform_border.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_style.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_theme.dart';
import 'package:rise_ui/src/widgets/text/text_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

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
    final themeData = KbdTheme.of(context);
    KbdStyle mergedStyle = widget.style ?? themeData.mediumStyle;

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

    final TextStyle? textStyle = mergedStyle.labelStyle?.copyWith(
      color: themeData.labelColor,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: ['Roboto'],
    );

    return Container(
      constraints: BoxConstraints(
        minWidth: mergedStyle.size!.width,
        minHeight: mergedStyle.size!.height,
      ),
      decoration: ShapeDecoration(
        color: themeData.color,
        shape: NonUniformBorder(
          leftWidth: 1,
          rightWidth: 1,
          topWidth: 1,
          bottomWidth: 3,
          color: themeData.borderColor!,
          strokeAlign: BorderSide.strokeAlignInside,
          borderRadius: themeData.borderRadius ?? BorderRadius.zero,
        ),
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
