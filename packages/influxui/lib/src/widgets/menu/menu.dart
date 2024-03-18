import 'package:flutter/material.dart' show Colors;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/menu/menu_item.dart';
import 'package:influxui/src/widgets/menu/menu_theme.dart';
import 'package:influxui/src/widgets/web_icon/web_icon.dart';

export 'menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    this.brightness,
    this.leading,
    this.trailing,
    required this.items,
    this.selectedValue,
    this.onDestinationSelected,
  });

  final Brightness? brightness;
  final Widget? leading;
  final Widget? trailing;
  final List<MenuItem> items;
  final String? selectedValue;
  final ValueChanged<String>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final styledTheme = MenuTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading!,
          for (var i = 0; i < items.length; i++)
            Builder(
              builder: (_) {
                final item = items[i];
                final bool selected =
                    selectedValue != null && item.value == selectedValue;
                return _RailDestination(
                  icon: item.icon,
                  iconBuilder: item.iconBuilder != null
                      ? (ctx) {
                          return item.iconBuilder!.call(ctx, selected);
                        }
                      : null,
                  iconTheme: selected
                      ? styledTheme.selectedIconTheme
                      : styledTheme.unselectedIconTheme,
                  label: items[i].label,
                  labelTextStyle: selected
                      ? styledTheme.selectedLabelStyle
                      : styledTheme.unselectedLabelStyle,
                  backgroundColor: selected ? styledTheme.indicatorColor : null,
                  hoveredBackgroundColor: styledTheme.indicatorColor,
                  shape: styledTheme.indicatorShape,
                  onTap: () {
                    item.onPressed?.call();
                    if (item.value != null) {
                      onDestinationSelected?.call(item.value!);
                    }
                  },
                );
              },
            ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _RailDestination extends StatefulWidget {
  const _RailDestination({
    this.icon,
    this.iconBuilder,
    this.iconTheme,
    this.label,
    this.labelTextStyle,
    this.shape,
    this.backgroundColor,
    this.hoveredBackgroundColor,
    this.onTap,
  });

  final IconData? icon;
  final WidgetBuilder? iconBuilder;
  final IconThemeData? iconTheme;
  final String? label;
  final TextStyle? labelTextStyle;
  final Color? backgroundColor;
  final Color? hoveredBackgroundColor;
  final ShapeBorder? shape;
  final VoidCallback? onTap;

  @override
  State<_RailDestination> createState() => __RailDestinationState();
}

class __RailDestinationState extends State<_RailDestination> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    ShapeBorder? shapeBorder = RoundedRectangleBorder(
      side: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(4),
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
        onTap: () {
          widget.onTap?.call();
        },
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                color: _isHovering
                    ? widget.hoveredBackgroundColor
                    : widget.backgroundColor,
                shape: shapeBorder,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: DefaultTextStyle(
                    style: widget.labelTextStyle ?? const TextStyle(),
                    child: Row(
                      children: [
                        if (widget.icon != null || widget.iconBuilder != null)
                          Container(
                            padding: const EdgeInsets.only(),
                            child: IconTheme(
                              data: widget.iconTheme ?? const IconThemeData(),
                              child: Builder(
                                builder: (_) {
                                  if (widget.iconBuilder != null) {
                                    return widget.iconBuilder!(context);
                                  }
                                  return WebIcon(widget.icon);
                                },
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(widget.label!),
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
