import 'package:flutter/widgets.dart';

typedef MenuItemIconBuilder = Widget Function(
  BuildContext context,
  bool selected,
);

class MenuItem {
  const MenuItem({
    this.value,
    this.icon,
    this.iconBuilder,
    required this.label,
    this.onPressed,
  });

  final String? value;
  final IconData? icon;
  final MenuItemIconBuilder? iconBuilder;
  final String label;
  final VoidCallback? onPressed;
}
