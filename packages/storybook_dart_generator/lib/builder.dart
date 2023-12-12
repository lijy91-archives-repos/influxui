import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_generator/src/meta_generator.dart';
import 'package:storybook_dart_generator/src/story_generator.dart';
import 'package:storybook_dart_generator/src/storybook_config_builder.dart';

Builder storybookConfigBuilder(BuilderOptions options) {
  return StorybookConfigBuilder();
}

Builder storybookDartBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [MetaGenerator(), StoryGenerator()],
    'storybook_dart_builder',
  );
}
