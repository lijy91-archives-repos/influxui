import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_generator/src/meta_generator.dart';
import 'package:storybook_dart_generator/src/shared_metas.dart';
import 'package:storybook_dart_generator/src/story_generator.dart';

Builder storybookDartBuilder(BuilderOptions options) {
  final sharedMetas = SharedMetas();
  return SharedPartBuilder(
    [
      MetaGenerator(sharedMetas),
      StoryGenerator(sharedMetas),
    ],
    'storybook_dart_builder',
  );
}
