import 'package:flutter/material.dart'
    show Brightness, Colors, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_destination.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_theme.dart';
import 'package:rise_ui/src/widgets/theme/extended_colors.dart';
import 'package:rise_ui/src/widgets/web_icon/web_icon.dart';

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
                          child: SizedBox(
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

class _NavigationRailDefaults extends NavigationRailThemeData {
  _NavigationRailDefaults(this.context) : super();

  final BuildContext context;

  late final ThemeData _theme = Theme.of(context);
  late final bool _isDark = _theme.brightness == Brightness.dark;

  @override
  IconThemeData? get unselectedIconTheme {
    if (_isDark) {
      return const IconThemeData(
        color: ExtendedColors.white,
        size: 16,
      );
    }
    return const IconThemeData(
      color: ExtendedColors.black,
      size: 16,
    );
  }

  @override
  TextStyle? get unselectedLabelStyle {
    if (_isDark) {
      return const TextStyle(
        color: ExtendedColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
    }
    return const TextStyle(
      color: ExtendedColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  IconThemeData? get selectedIconTheme {
    if (_isDark) {
      return const IconThemeData(
        color: ExtendedColors.white,
        size: 16,
      );
    }
    return const IconThemeData(
      color: ExtendedColors.black,
      size: 16,
    );
  }

  @override
  TextStyle? get selectedLabelStyle {
    if (_isDark) {
      return const TextStyle(
        color: ExtendedColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
    }
    return const TextStyle(
      color: ExtendedColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Color? get indicatorColor {
    if (_isDark) {
      return ExtendedColors.gray;
    }
    return ExtendedColors.gray.shade300;
  }

  @override
  ShapeBorder? get indicatorShape => null;
}
