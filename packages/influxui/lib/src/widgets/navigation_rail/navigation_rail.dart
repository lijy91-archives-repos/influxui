import 'package:flutter/material.dart'
    show Brightness, Colors, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/extended_theme/extended_colors.dart';
import 'package:influxui/src/widgets/gapped_row/gapped_row.dart';
import 'package:influxui/src/widgets/navigation_rail/navigation_rail_destination.dart';
import 'package:influxui/src/widgets/navigation_rail/navigation_rail_theme.dart';
import 'package:influxui/src/widgets/web_icon/web_icon.dart';

export 'navigation_rail_destination.dart';

class NavigationRail extends StatelessWidget {
  const NavigationRail({
    super.key,
    this.leading,
    this.trailing,
    required this.destinations,
    this.selectedValue,
    this.onDestinationSelected,
  });

  final Widget? leading;
  final Widget? trailing;
  final List<NavigationRailDestination> destinations;
  final String? selectedValue;
  final ValueChanged<String>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final NavigationRailThemeData? themeData = NavigationRailTheme.of(context);
    final NavigationRailThemeData defaults = _NavigationRailDefaults(context);

    final unselectedIconTheme =
        themeData?.unselectedIconTheme ?? defaults.unselectedIconTheme!;
    final unselectedLabelStyle =
        themeData?.unselectedLabelStyle ?? defaults.unselectedLabelStyle;
    final selectedIconTheme =
        themeData?.selectedIconTheme ?? defaults.selectedIconTheme!;
    final selectedLabelStyle =
        themeData?.selectedLabelStyle ?? defaults.selectedLabelStyle;
    final indicatorColor = themeData?.indicatorColor ?? defaults.indicatorColor;
    final indicatorShape = themeData?.indicatorShape ?? defaults.indicatorShape;

    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) leading!,
          for (var i = 0; i < destinations.length; i++)
            Builder(
              builder: (_) {
                final destination = destinations[i];
                final bool selected = destination.value == selectedValue;
                return _RailDestination(
                  icon: destination.icon,
                  iconBuilder: destination.iconBuilder != null
                      ? (ctx) {
                          return destination.iconBuilder!.call(ctx, selected);
                        }
                      : null,
                  iconTheme: selected ? selectedIconTheme : unselectedIconTheme,
                  label: destinations[i].label,
                  labelTextStyle:
                      selected ? selectedLabelStyle : unselectedLabelStyle,
                  backgroundColor: selected ? indicatorColor : null,
                  shape: indicatorShape,
                  onTap: () => onDestinationSelected?.call(destination.value),
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
      side: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(6),
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
          child: Container(
            constraints: const BoxConstraints(),
            margin: const EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: 12,
              right: 12,
            ),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: shapeBorder,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: DefaultTextStyle(
                    style: widget.labelTextStyle ?? const TextStyle(),
                    child: GappedRow(
                      gap: 12,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.icon != null || widget.iconBuilder != null)
                          IconTheme(
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
                        Expanded(
                          child: Text(
                            widget.label!,
                            style: widget.labelTextStyle,
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

class _NavigationRailDefaults extends NavigationRailThemeData {
  _NavigationRailDefaults(this.context) : super();

  final BuildContext context;

  late final ThemeData _theme = Theme.of(context);
  late final bool _isDark = _theme.brightness == Brightness.dark;

  @override
  IconThemeData? get unselectedIconTheme {
    return IconThemeData(
      color: _isDark ? ExtendedColors.white : ExtendedColors.gray.shade600,
      size: 22,
    );
  }

  @override
  TextStyle? get unselectedLabelStyle {
    return _theme.textTheme.bodyMedium?.copyWith(
      color: _isDark ? ExtendedColors.white : ExtendedColors.gray.shade900,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  IconThemeData? get selectedIconTheme {
    return IconThemeData(
      color: _isDark ? ExtendedColors.white : ExtendedColors.gray.shade600,
      size: 22,
    );
  }

  @override
  TextStyle? get selectedLabelStyle {
    return _theme.textTheme.bodyMedium?.copyWith(
      color: _isDark ? ExtendedColors.white : ExtendedColors.gray.shade900,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Color? get indicatorColor {
    return _isDark ? ExtendedColors.gray : ExtendedColors.gray.shade100;
  }

  @override
  ShapeBorder? get indicatorShape => null;
}
