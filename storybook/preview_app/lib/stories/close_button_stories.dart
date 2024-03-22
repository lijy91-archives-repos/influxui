import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'close_button_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/CloseButton',
)
class CloseButtonMeta extends Meta with _$CloseButtonMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const CloseButton();
  }
}

@storybook.Story('Default')
class CloseButtonDefaultStory extends StoryObj<CloseButtonMeta>
    with _$CloseButtonDefaultStory {}
