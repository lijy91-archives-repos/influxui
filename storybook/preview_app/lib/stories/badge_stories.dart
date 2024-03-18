import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'badge_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Badge',
  argTypes: [
    storybook.ArgType<String>(
      'label',
      defaultValue: 'Badge',
    ),
  ],
)
class BadgeMeta extends Meta with _$BadgeMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Badge(
      label: 'Badge',
      variant: BadgeVariant.filled,
    );
  }
}

@storybook.Story('Default')
class BadgeDefaultStory extends StoryObj<BadgeMeta> with _$BadgeDefaultStory {}
