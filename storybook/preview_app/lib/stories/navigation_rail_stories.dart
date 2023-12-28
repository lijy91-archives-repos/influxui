import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'navigation_rail_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/NavigationRail',
)
class NavigationRailMeta extends Meta with _$NavigationRailMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
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
        selectedValue: 'settings',
        onDestinationSelected: (value) {},
      ),
    );
  }
}

@storybook.Story('Default')
class NavigationRailDefaultStory extends StoryObj<NavigationRailMeta>
    with _$NavigationRailDefaultStory {}
