import 'package:base_ui_core/src/kbd/kbd_theme.dart';
import 'package:base_ui_core/src/text/text_theme.dart';
import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:non_uniform_border/non_uniform_border.dart';

export 'kbd_theme.dart';

/// Display keyboard button or keys combination
class Kbd extends StatelessWidget {
  const Kbd(
    this.label, {
    super.key,
    this.brightness,
    this.size,
  });

  final String label;

  final Brightness? brightness;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final brightness = this.brightness ??
        KbdTheme.of(context).brightness ??
        Theme.of(context).brightness;

    final KbdThemeData theme =
        KbdTheme.of(context).brightnessed(brightness).sized(size);

    final TextStyle textStyle = TextTheme.of(context).textStyle.copyWith(
      color: theme.labelColor,
      fontSize: theme.labelFontSize,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: ['Roboto'],
    );

    return Container(
      decoration: ShapeDecoration(
        color: theme.color,
        shape: NonUniformBorder(
          leftWidth: 1,
          rightWidth: 1,
          topWidth: 1,
          bottomWidth: 3,
          color: theme.borderColor!,
          strokeAlign: BorderSide.strokeAlignInside,
          borderRadius: theme.borderRadius ?? BorderRadius.zero,
        ),
      ),
      child: Padding(
        padding: theme.padding ?? EdgeInsets.zero,
        child: DefaultTextStyle(
          style: textStyle,
          child: Text(label),
        ),
      ),
    );
  }
}
