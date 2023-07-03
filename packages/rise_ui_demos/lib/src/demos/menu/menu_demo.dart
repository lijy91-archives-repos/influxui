import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class MenuDemo extends StatelessWidget {
  const MenuDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(40),
      child: const Menu(
        children: [
          MenuSection(
            children: [
              MenuItem(
                icon: FluentIcons.settings_24_regular,
                label: 'Settings',
              ),
              MenuItem(
                icon: FluentIcons.chat_24_regular,
                label: 'Messages',
              ),
              MenuItem(
                icon: FluentIcons.photo_filter_24_regular,
                label: 'Gallery',
              ),
              MenuItem(
                icon: FluentIcons.search_24_regular,
                label: 'Search',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
