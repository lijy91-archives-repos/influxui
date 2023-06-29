import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/menu/menu_section/menu_section_theme.dart';
import 'package:rise_ui/src/text/text_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

class MenuSection extends StatefulWidget {
  const MenuSection({
    super.key,
    this.label,
    this.labelBuilder,
    required this.children,
  });

  final String? label;
  final WidgetBuilder? labelBuilder;

  final List<Widget> children;

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  @override
  Widget build(BuildContext context) {
    final styledTheme = MenuSectionTheme.of(context) // styled
        .brightnessed(Theme.of(context).brightness);
    return Column(
      children: [
        if (widget.label != null || widget.labelBuilder != null)
          Container(
            width: double.infinity,
            padding: styledTheme.padding,
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: DefaultTextStyle(
                style: TextTheme.of(context).textStyle.copyWith(
                      color: styledTheme.labelColor,
                      fontSize: styledTheme.labelFontSize,
                      fontWeight: styledTheme.labelFontWeight,
                      overflow: TextOverflow.ellipsis,
                    ),
                child: Row(
                  children: [
                    Expanded(
                      child: widget.labelBuilder?.call(context) ??
                          Text(widget.label!),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ...widget.children,
      ],
    );
  }
}
