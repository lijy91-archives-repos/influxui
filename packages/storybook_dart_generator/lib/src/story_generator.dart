import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';
import 'package:storybook_dart_generator/src/shared_metas.dart';
import 'package:storybook_dart_generator/src/story_info.dart';

class ReactStoryGenerator {
  const ReactStoryGenerator();

  File _getOutput(StoryInfo story) {
    return File('../../website/src/stories/${story.meta.widget}.stories.tsx');
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
  const StoryGenerator(this.metas);

  final SharedMetas metas;

  MetaInfo _resolveMeta(Element element, ConstantReader annotation) {
    final firstSupertype = (element as ClassElement).allSupertypes[0];
    final className = firstSupertype.typeArguments.first.getDisplayString(
      withNullability: false,
    );
    return metas.getMeta(className) ??
        MetaInfo(
          widget: className.replaceFirst('Meta', ''),
          className: className,
        );
  }

  StoryInfo _resolveStory(Element element, ConstantReader annotation) {
    final className = (element as ClassElement).name;
    return StoryInfo(
      annotation.read('name').stringValue,
      meta: _resolveMeta(element, annotation),
      className: className,
    );
  }

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final StoryInfo story = _resolveStory(element, annotation);
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
