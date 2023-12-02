import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_destination.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';
import 'package:rise_ui/src/widgets/web_icon/web_icon.dart';

export 'navigation_rail_destination.dart';

class NavigationRail extends StatelessWidget {
  const NavigationRail({
    Key? key,
    this.brightness,
    this.leading,
    this.trailing,
    required this.destinations,
    this.selectedValue,
    this.onDestinationSelected,
  }) : super(key: key);

  final Brightness? brightness;
  final Widget? leading;
  final Widget? trailing;
  final List<NavigationRailDestination> destinations;
  final String? selectedValue;
  final ValueChanged<String>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final styledTheme = NavigationRailTheme.of(context) // styled
        .brightnessed(brightness ?? Theme.of(context).brightness)
        .colored(Theme.of(context).primaryColor);

    return Padding(
      padding: EdgeInsets.only(
        bottom: styleGuide.spacing.sized(NamedSize.tiny),
        left: styleGuide.spacing.sized(NamedSize.tiny),
        right: styleGuide.spacing.sized(NamedSize.tiny),
      ),
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
                    ? styledTheme.selectedIconTheme
                    : styledTheme.unselectedIconTheme,
                label: destinations[i].label,
                labelTextStyle: selected
                    ? styledTheme.selectedLabelTextStyle
                    : styledTheme.unselectedLabelTextStyle,
                backgroundColor: selected ? styledTheme.indicatorColor : null,
                hoveredBackgroundColor: styledTheme.indicatorColor,
                shape: styledTheme.indicatorShape,
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
      side: BorderSide(color: Colors.transparent),
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
                padding: EdgeInsets.symmetric(
                  vertical: styleGuide.spacing.sized(NamedSize.tiny) * 0.8,
                  horizontal: styleGuide.spacing.sized(NamedSize.small),
                ),
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
                            padding: EdgeInsets.only(
                              right: styleGuide.spacing.sized(NamedSize.tiny),
                            ),
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
