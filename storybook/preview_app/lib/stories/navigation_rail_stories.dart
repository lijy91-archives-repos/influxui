import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'navigation_rail_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/NavigationRail',
)
class NavigationRailMeta extends Meta with _$NavigationRailMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return NavigationRail(
      destinations: [],
    );
  }
}

@storybook.Story('Default')
class NavigationRailDefaultStory extends StoryObj<NavigationRailMeta>
    with _$NavigationRailDefaultStory {}
