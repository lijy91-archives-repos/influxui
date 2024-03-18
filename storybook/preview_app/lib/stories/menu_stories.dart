import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'menu_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Menu',
)
class MenuMeta extends Meta with _$MenuMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Menu(
      items: [],
    );
  }
}

@storybook.Story('Default')
class MenuDefaultStory extends StoryObj<MenuMeta> with _$MenuDefaultStory {}
