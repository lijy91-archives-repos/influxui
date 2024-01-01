import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_destination.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';
import 'package:rise_ui/src/widgets/web_icon/web_icon.dart';

export 'navigation_rail_destination.dart';

class NavigationRail extends StatelessWidget {
  const NavigationRail({
    Key? key,
    this.leading,
    this.trailing,
    required this.destinations,
    this.selectedValue,
    this.onDestinationSelected,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;
  final List<NavigationRailDestination> destinations;
  final String? selectedValue;
  final ValueChanged<String>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final themeData = NavigationRailTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) leading!,
          for (var i = 0; i < destinations.length; i++)
            Builder(builder: (_) {
              final destination = destinations[i];
              final bool selected = destination.value == selectedValue;
              return _RailDestination(
                icon: destination.icon,
                iconBuilder: destination.iconBuilder != null
                    ? (ctx) {
                        return destination.iconBuilder!.call(ctx, selected);
                      }
                    : null,
                iconTheme: selected
                    ? themeData.selectedIconTheme
                    : themeData.unselectedIconTheme,
                label: destinations[i].label,
                labelTextStyle: selected
                    ? themeData.selectedLabelStyle
                    : themeData.unselectedLabelStyle,
                backgroundColor: selected ? themeData.indicatorColor : null,
                shape: themeData.indicatorShape,
                onTap: () => onDestinationSelected?.call(destination.value),
              );
            }),
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
    this.onTap,
  });

  final IconData? icon;
  final WidgetBuilder? iconBuilder;
  final IconThemeData? iconTheme;
  final String? label;
  final TextStyle? labelTextStyle;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final VoidCallback? onTap;

  @override
  State<_RailDestination> createState() => __RailDestinationState();
}

class __RailDestinationState extends State<_RailDestination> {
  @override
  Widget build(BuildContext context) {
    ShapeBorder? shapeBorder = RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(4),
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
                color: widget.backgroundColor,
                shape: shapeBorder,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(),
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: DefaultTextStyle(
                    style: widget.labelTextStyle ?? TextStyle(),
                    child: Row(
                      children: [
                        if (widget.icon != null || widget.iconBuilder != null)
                          Container(
                            padding: EdgeInsets.only(),
                            child: IconTheme(
                                data: widget.iconTheme ?? IconThemeData(),
                                child: Builder(builder: (_) {
                                  if (widget.iconBuilder != null) {
                                    return widget.iconBuilder!(context);
                                  }
                                  return WebIcon(widget.icon);
                                })),
                          ),
                        Expanded(
                          child: Container(
                            child: Text(widget.label!),
                          ),
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
