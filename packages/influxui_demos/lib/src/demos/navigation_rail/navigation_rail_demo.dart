import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class NavigationRailDemo extends StatefulWidget {
  const NavigationRailDemo({super.key});

  @override
  State<NavigationRailDemo> createState() => _NavigationRailDemoState();
}

class _NavigationRailDemoState extends State<NavigationRailDemo> {
  String? _selectedDestination;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(40),
      child: NavigationRail(
        destinations: const [
          NavigationRailDestination(
            value: 'settings',
            icon: TablerIcons.settings,
            label: 'Settings',
          ),
          NavigationRailDestination(
            value: 'messages',
            icon: TablerIcons.message,
            label: 'Messages',
          ),
          NavigationRailDestination(
            value: 'gallery',
            icon: TablerIcons.photo,
            label: 'Gallery',
          ),
          NavigationRailDestination(
            value: 'search',
            icon: TablerIcons.search,
            label: 'Search',
          ),
        ],
        selectedValue: _selectedDestination,
        onDestinationSelected: (value) {
          setState(() {
            _selectedDestination = value;
          });
        },
      ),
    );
  }
}
