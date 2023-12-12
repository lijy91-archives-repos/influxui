import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';

MetaInfo resolveMetaInfo(Element element, ConstantReader annotation) {
  final String className = (element as ClassElement).name;
  return MetaInfo(
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
}
