import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'box_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Box',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class BoxMeta extends Meta with _$BoxMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return Box(
      variant: BoxVariant.filled,
      builder: (context, foregroundColor) {
        return Container(
          width: 100,
          height: 100,
        );
      },
    );
  }
}

@storybook.Story('Default')
class BoxDefaultStory extends StoryObj<BoxMeta> with _$BoxDefaultStory {}

@storybook.Story(
  'With Size',
  args: [
    storybook.Arg<String>('size'),
  ],
)
class BoxWithSizeStory extends StoryObj<BoxMeta> with _$BoxWithSizeStory {}

@storybook.Story(
  'With Color',
)
class BoxWithColorStory extends StoryObj<BoxMeta> with _$BoxWithColorStory {}

@storybook.Story(
  'With Variant',
)
class BoxWithVariantStory extends StoryObj<BoxMeta> with _$BoxWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in [
          BoxVariant.filled,
          BoxVariant.light,
          BoxVariant.outline,
          BoxVariant.subtle,
          BoxVariant.transparent,
          BoxVariant.white,
        ])
          Box(
            variant: variant,
            builder: (context, foregroundColor) {
              return Container(
                width: 100,
                height: 100,
                child: DefaultTextStyle(
                  style: TextStyle(color: foregroundColor),
                  child: Center(
                    child: Text(variant.name),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
