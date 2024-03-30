import 'package:influxui/influxui.dart';
import 'package:preview_app/utils/constants.dart';
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

@storybook.Story(
  'With Size',
  args: [
    storybook.Arg<String>('size'),
  ],
)
class BadgeWithSizeStory extends StoryObj<BadgeMeta> with _$BadgeWithSizeStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in BadgeVariant.values)
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              for (final size in kExtendedSizes)
                Badge(
                  label: 'Badge',
                  variant: variant,
                  size: size,
                ),
            ],
          ),
      ],
    );
  }
}

@storybook.Story(
  'With Color',
)
class BadgeWithColorStory extends StoryObj<BadgeMeta>
    with _$BadgeWithColorStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in BadgeVariant.values)
          Wrap(
            spacing: 10,
            children: [
              for (final color in kExtendedColors)
                Badge(
                  variant: variant,
                  color: color,
                  label: 'Badge',
                ),
            ],
          ),
      ],
    );
  }
}

@storybook.Story(
  'With Variant',
)
class BadgeWithVariantStory extends StoryObj<BadgeMeta>
    with _$BadgeWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in BadgeVariant.values)
          Badge(
            variant: variant,
            label: 'Badge',
          ),
      ],
    );
  }
}
