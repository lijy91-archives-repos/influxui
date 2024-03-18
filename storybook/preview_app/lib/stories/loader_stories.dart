import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'loader_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Loader',
)
class LoaderMeta extends Meta with _$LoaderMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return const Loader();
  }
}

@storybook.Story('Default')
class LoaderDefaultStory extends StoryObj<LoaderMeta>
    with _$LoaderDefaultStory {}
