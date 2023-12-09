import 'package:storybook_dart_annotation/storybook_dart_annotation.dart';

class MetaInfo extends Meta {
  const MetaInfo({
    super.title,
    super.argTypes,
    required this.widget,
    required this.className,
  });

  final String widget;
  final String className;
}
