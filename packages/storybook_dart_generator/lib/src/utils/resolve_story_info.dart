import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';
import 'package:storybook_dart_generator/src/story_info.dart';

MetaInfo _resolveMeta(Element element, ConstantReader annotation) {
  final firstSupertype = (element as ClassElement).allSupertypes[0];
  final className = firstSupertype.typeArguments.first.getDisplayString(
    withNullability: false,
  );
  return MetaInfo(
    widget: className.replaceFirst('Meta', ''),
    className: className,
  );
}

StoryInfo resolveStoryInfo(
  Element element,
  ConstantReader annotation, {
  AssetId? assetId,
}) {
  final className = (element as ClassElement).name;
  return StoryInfo(
    annotation.read('name').stringValue,
    meta: _resolveMeta(element, annotation),
    className: className,
    assetId: assetId,
  );
}
