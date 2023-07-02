import 'package:flutter/widgets.dart';

import 'package:rise_ui/src/menu/menu_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

export 'menu_item/menu_item.dart';
export 'menu_section/menu_section.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    this.padding,
    required this.children,
  });

  final EdgeInsetsGeometry? padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final MenuThemeData styledTheme = MenuTheme.of(context) // styled
        .brightnessed(Theme.of(context).brightness);
    return Padding(
      padding: padding ?? styledTheme.padding ?? EdgeInsets.zero,
      child: Column(
        children: children,
      ),
    );
  }
}
