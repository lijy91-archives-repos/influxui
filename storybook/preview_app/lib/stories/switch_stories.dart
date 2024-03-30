import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;
import 'package:tabler_icon_library/tabler_icon_library.dart';

part 'switch_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Switch',
  argTypes: [
    storybook.ArgType<IconData>(
      'icon',
      defaultValue: TablerIcons.sun,
    ),
  ],
)
class SwitchMeta extends Meta with _$SwitchMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    bool checked = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Switch(
          value: checked,
          onChanged: (value) {
            setState(() {
              checked = value;
            });
          },
        );
      },
    );
  }
}

@storybook.Story('Default')
class SwitchDefaultStory extends StoryObj<SwitchMeta>
    with _$SwitchDefaultStory {}
