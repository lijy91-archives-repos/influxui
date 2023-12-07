import 'package:storybook_dart_annotation/src/arg.dart';

class Story {
  const Story(
    this.name, {
    this.args = const [],
  });

  final String name;
  final List<Arg> args;
}
