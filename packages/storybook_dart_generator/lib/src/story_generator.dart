import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';
import 'package:storybook_dart_generator/src/story_info.dart';
import 'package:storybook_dart_generator/src/utils/resolve_story_info.dart';

class ReactStoryGenerator {
  const ReactStoryGenerator();

  File _getOutput(StoryInfo story) {
    final directory = Directory('../../storybook/src/stories');
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    return File('${directory.path}/${story.meta.widget}.stories.tsx');
  }

  Future<void> generate(StoryInfo story) async {
    final output = _getOutput(story);
    final storyName = story.name.replaceAll(' ', '_');

    final contents = output.readAsStringSync();
    output.writeAsStringSync([
      contents,
      '''
export const $storyName: Story = {
  args: {},
};
'''
    ].join('\n'));
  }
}

class StoryGenerator extends GeneratorForAnnotation<Story> {
  const StoryGenerator();

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final StoryInfo story = resolveStoryInfo(element, annotation);
    final MetaInfo meta = story.meta;
    ReactStoryGenerator().generate(story);

    return '''
mixin _\$${story.className} on StoryObj<${meta.className}> {
  @override
  String get name => '${story.name}';

  @override
  ${meta.className} get meta => ${meta.className}();
}
''';
  }
}
