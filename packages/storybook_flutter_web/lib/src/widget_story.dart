import 'package:flutter/widgets.dart';
import 'package:storybook_flutter_web/src/widget_meta.dart';

typedef StoryBuilder = Widget Function(
  BuildContext context,
  Map<String, dynamic> args,
);

abstract class Story<T extends WidgetMeta> {
  Story({required this.name});

  final String name;

  String get id => '${meta.title.replaceAll('/', '-')}--$name'.toLowerCase();

  T get meta;

  Widget build(BuildContext context, Map<String, dynamic> args);
}
