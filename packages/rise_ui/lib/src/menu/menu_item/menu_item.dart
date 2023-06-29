import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/menu/menu_item/menu_item_theme.dart';
import 'package:rise_ui/src/text/text_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    this.icon,
    this.iconBuilder,
    this.label,
    this.labelBuilder,
    this.color,
  });

  final IconData? icon;
  final WidgetBuilder? iconBuilder;
  final String? label;
  final WidgetBuilder? labelBuilder;
  final Color? color;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final MenuItemThemeData styledTheme = MenuItemTheme.of(context) // styled
        .brightnessed(Theme.of(context).brightness)
        .colored(widget.color);
    bool enabled = true;

    Color? bgColor = styledTheme.color;
    Color? hoveredBgColor = styledTheme.color;

    if (bgColor is ShadedColor) {
      bgColor = bgColor[styledTheme.colorShade!];
    }
    if (hoveredBgColor is ShadedColor) {
      hoveredBgColor = hoveredBgColor[styledTheme.hoveredColorShade!];
    }
    ShapeBorder? shapeBorder = RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(4),
    );
    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (PointerEnterEvent event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (PointerExitEvent event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                color: _isHovering ? hoveredBgColor : bgColor,
                shape: shapeBorder,
              ),
              child: Container(
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
                          overflow: TextOverflow.ellipsis,
                        ),
                    child: Row(
                      children: [
                        if (widget.iconBuilder != null || widget.icon != null)
                          widget.iconBuilder?.call(context) ??
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      styleGuide.spacing.sized(NamedSize.tiny),
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: styledTheme.iconSize,
                                    color: styledTheme.iconColor,
                                  ),
                                  child: Icon(
                                    widget.icon,
                                  ),
                                ),
                              ),
                        Expanded(
                          child: widget.labelBuilder?.call(context) ??
                              Text(widget.label!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
