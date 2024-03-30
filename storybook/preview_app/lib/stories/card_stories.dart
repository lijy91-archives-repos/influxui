import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'card_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Card',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class CardMeta extends Meta with _$CardMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Card(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text('Card'),
        ),
      ),
    );
  }
}

@storybook.Story('Default')
class CardDefaultStory extends StoryObj<CardMeta> with _$CardDefaultStory {}
