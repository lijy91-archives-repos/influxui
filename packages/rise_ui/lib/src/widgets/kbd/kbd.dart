import 'package:flutter/widgets.dart';
import 'package:non_uniform_border/non_uniform_border.dart';
import 'package:rise_ui/src/widgets/text/text_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_theme.dart';

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
    final KbdThemeData theme = KbdTheme.of(context);

    final Brightness brightness =
        this.brightness ?? theme.brightness ?? Theme.of(context).brightness;

    final KbdThemeData styledTheme = KbdTheme.of(context) // styled
        .brightnessed(brightness)
        .sized(size);

    final TextStyle textStyle = TextTheme.of(context).textStyle.copyWith(
      color: styledTheme.labelColor,
      fontSize: styledTheme.labelFontSize,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: ['Roboto'],
    );

    return Container(
      decoration: ShapeDecoration(
        color: styledTheme.color,
        shape: NonUniformBorder(
          leftWidth: 1,
          rightWidth: 1,
          topWidth: 1,
          bottomWidth: 3,
          color: styledTheme.borderColor!,
          strokeAlign: BorderSide.strokeAlignInside,
          borderRadius: styledTheme.borderRadius ?? BorderRadius.zero,
        ),
      ),
      child: Padding(
        padding: styledTheme.padding ?? EdgeInsets.zero,
        child: DefaultTextStyle(
          style: textStyle,
          child: Text(label),
        ),
      ),
    );
  }
}
