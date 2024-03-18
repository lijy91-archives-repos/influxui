import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'action_icon_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/ActionIcon',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class ActionIconMeta extends Meta with _$ActionIconMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return ActionIcon(
      TablerIcons.sun,
      variant: ActionIconVariant.filled,
      onPressed: () {},
    );
  }
}

@storybook.Story('Default')
class ActionIconDefaultStory extends StoryObj<ActionIconMeta>
    with _$ActionIconDefaultStory {}

@storybook.Story(
  'With Variant',
)
class ActionIconWithVariantStory extends StoryObj<ActionIconMeta>
    with _$ActionIconWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in ActionIconVariant.values)
          ActionIcon(
            TablerIcons.sun,
            variant: variant,
            onPressed: () {},
          ),
      ],
    );
  }
}

@storybook.Story(
  'With Size',
  args: [
    storybook.Arg<String>('size'),
  ],
)
class ActionIconWithSizeStory extends StoryObj<ActionIconMeta>
    with _$ActionIconWithSizeStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final size in [
          ActionIconSize.small,
          ActionIconSize.medium,
          ActionIconSize.large,
        ])
          ActionIcon(
            TablerIcons.sun,
            size: size,
            onPressed: () {},
          ),
      ],
    );
  }
}

@storybook.Story(
  'With Color',
)
class ActionIconWithColorStory extends StoryObj<ActionIconMeta>
    with _$ActionIconWithColorStory {}
