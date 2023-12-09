import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';
import 'package:storybook_dart_generator/src/shared_metas.dart';

class ReactMetaGenerator {
  const ReactMetaGenerator();

  File _getOutputComponent(MetaInfo meta) {
    return File('../../website/src/stories/${meta.widget}.tsx');
  }

  Future<void> _generateComponent(MetaInfo meta) async {
    final output = _getOutputComponent(meta);
    output.writeAsStringSync('''
import React from "react";
import FlutterRenderer from "../components/FlutterRenderer";

interface ${meta.widget}Props {
}

export const ${meta.widget} = (props: ${meta.widget}Props) => {
  return (
    <FlutterRenderer {...props} />
  );
};
''');
  }

  File _getOutputComponentStories(MetaInfo meta) {
    return File('../../website/src/stories/${meta.widget}.stories.tsx');
  }

  Future<void> _generateComponentStories(MetaInfo meta) async {
    final output = _getOutputComponentStories(meta);
    output.writeAsStringSync('''
import { Meta, StoryObj } from "@storybook/react";
import { ${meta.widget} } from "./${meta.widget}";

const meta = {
  title: "${meta.title}",
  component: ${meta.widget},
  parameters: {
    layout: "centered",
  },
  tags: ["autodocs"],
  argTypes: {},
} satisfies Meta<typeof ${meta.widget}>;

export default meta
type Story = StoryObj<typeof meta>
''');
  }

  Future<void> generate(MetaInfo meta) async {
    await _generateComponent(meta);
    await _generateComponentStories(meta);
  }
}

class MetaGenerator extends GeneratorForAnnotation<Meta> {
  const MetaGenerator(this.metas);

  final SharedMetas metas;

  MetaInfo _resolveMeta(Element element, ConstantReader annotation) {
    final String className = (element as ClassElement).name;
    final meta = MetaInfo(
      widget: className.replaceFirst('Meta', ''),
      title: annotation.read('title').stringValue,
      argTypes: annotation
          .read('argTypes')
          .listValue
          .map((e) => ArgType(
                e.getField('name')!.toStringValue()!,
                defaultValue: e.getField('defaultValue')!.toSymbolValue(),
              ))
          .toList(),
      className: className,
    );
    metas.add(meta);
    return meta;
  }

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final meta = _resolveMeta(element, annotation);
    ReactMetaGenerator().generate(meta);

    return '''
 mixin _\$${meta.className} on Meta {
  @override
  String get title => '${meta.title}';

  @override
  List<ArgType> get argTypes => [
    ${meta.argTypes?.map((e) => 'ArgType(\'${e.name}\', defaultValue: ${e.defaultValue})').join(',\n')}
  ];
}
''';
  }
}