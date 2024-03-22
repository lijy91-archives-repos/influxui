import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'icon_button_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/IconButton',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class IconButtonMeta extends Meta with _$IconButtonMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return IconButton(
      TablerIcons.sun,
      variant: IconButtonVariant.filled,
      onPressed: () {},
    );
  }
}

@storybook.Story('Default')
class IconButtonDefaultStory extends StoryObj<IconButtonMeta>
    with _$IconButtonDefaultStory {}

@storybook.Story(
  'With Variant',
)
class IconButtonWithVariantStory extends StoryObj<IconButtonMeta>
    with _$IconButtonWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in IconButtonVariant.values)
          IconButton(
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
class IconButtonWithSizeStory extends StoryObj<IconButtonMeta>
    with _$IconButtonWithSizeStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final size in [
          IconButtonSize.small,
          IconButtonSize.medium,
          IconButtonSize.large,
        ])
          IconButton(
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
class IconButtonWithColorStory extends StoryObj<IconButtonMeta>
    with _$IconButtonWithColorStory {}
