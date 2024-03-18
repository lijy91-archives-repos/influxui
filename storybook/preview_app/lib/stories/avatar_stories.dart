import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'avatar_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Avatar',
)
class AvatarMeta extends Meta with _$AvatarMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Avatar();
  }
}

@storybook.Story('Default')
class AvatarDefaultStory extends StoryObj<AvatarMeta>
    with _$AvatarDefaultStory {}
