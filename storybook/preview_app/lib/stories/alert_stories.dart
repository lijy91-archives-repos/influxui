import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'alert_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Alert',
  argTypes: [
    storybook.ArgType<String>(
      'title',
      defaultValue: 'Alert title',
    ),
  ],
)
class AlertMeta extends Meta with _$AlertMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Alert(
      // title: 'Alert title',
      message:
          'A new software update is available. See what’s new in version 2.0.4.',
    );
  }
}

@storybook.Story('Default')
class AlertDefaultStory extends StoryObj<AlertMeta> with _$AlertDefaultStory {}

@storybook.Story(
  'With Type',
)
class AlertWithTypeStory extends StoryObj<AlertMeta> with _$AlertWithTypeStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return Wrap(
      runSpacing: 10,
      children: [
        for (final type in AlertType.values)
          Alert(
            type: type,
            icon: const Icon(TablerIcons.info_circle),
            title: 'Alert title',
            message:
                'Lorem ipsum dolor sit, amet consectetur adipisicing elit. '
                'At officiis, quae tempore necessitatibus placeat saepe.',
          ),
      ],
    );
  }
}
