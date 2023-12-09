import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';

class StoryInfo extends Story {
  const StoryInfo(
    super.name, {
    super.args = const [],
    required this.meta,
    required this.className,
  });

  final MetaInfo meta;
  final String className;

  String get id =>
      '${meta.title?.replaceAll('/', '-')}--${name.replaceAll(' ', '-')}'
          .toLowerCase();
}
