import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'action_icon.g.dart';

@storybook.Meta(
  title: 'Widgets/ActionIcon',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class ActionIconMeta extends Meta with _$ActionIconMeta {}

@storybook.Story('Default')
class ActionIconDefaultStory extends StoryObj<ActionIconMeta>
    with _$ActionIconDefaultStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: ActionIcon(
          args[0].value as IconData,
          variant: ActionIconVariant.filled,
          onPressed: () {},
        ),
      ),
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
    with _$ActionIconDefaultStory {}

@storybook.Story('With Size')
class ActionIconWithColorStory extends StoryObj<ActionIconMeta>
    with _$ActionIconDefaultStory {}
