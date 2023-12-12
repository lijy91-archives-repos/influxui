import 'package:build/build.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';
import 'package:storybook_dart_generator/src/meta_info.dart';

class StoryInfo extends Story {
  const StoryInfo(
    super.name, {
    super.args = const [],
    required this.meta,
    required this.className,
    required this.assetId,
  });

  final MetaInfo meta;
  final String className;
  final AssetId? assetId;
}
