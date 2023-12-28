import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
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
    return const Divider();
  }
}

@storybook.Story('Default')
class DividerDefaultStory extends StoryObj<DividerMeta>
    with _$DividerDefaultStory {}
