import 'package:flutter/widgets.dart';
import 'package:storybook_dart/src/arg.dart';
import 'package:storybook_dart/src/meta.dart';

abstract class StoryObj<T extends Meta> {
  StoryObj();

  String get id =>
      '${meta.title.replaceAll('/', '-')}--${name.replaceAll(' ', '-')}'
          .toLowerCase();

  T get meta;

  String get name;

  Widget build(BuildContext context, List<Arg> args) {
    return meta.buildWidget(context, args);
  }
}
