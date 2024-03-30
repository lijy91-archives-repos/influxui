import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'divider_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Divider',
)
class DividerMeta extends Meta with _$DividerMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const SizedBox(
      width: 500,
      height: 100,
      child: Center(
        child: Divider(),
      ),
    );
  }
}

@storybook.Story('Default')
class DividerDefaultStory extends StoryObj<DividerMeta>
    with _$DividerDefaultStory {}

@storybook.Story(
  'With Variant',
)
class DividerWithVariantStory extends StoryObj<DividerMeta>
    with _$DividerWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return SizedBox(
      width: 500,
      height: 100,
      child: Center(
        child: GappedColumn(
          gap: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final variant in DividerVariant.values)
              Divider(
                variant: variant,
              ),
          ],
        ),
      ),
    );
  }
}
