import 'package:flutter/widgets.dart';

typedef NavigationRailDestinationIconBuilder = Widget Function(
  BuildContext context,
  bool selected,
);

class NavigationRailDestination {
  const NavigationRailDestination({
    required this.value,
    this.icon,
    this.iconBuilder,
    required this.label,
  });

  final String value;
  final IconData? icon;
  final NavigationRailDestinationIconBuilder? iconBuilder;
  final String label;
}
