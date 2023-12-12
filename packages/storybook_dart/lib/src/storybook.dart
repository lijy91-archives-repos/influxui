import 'package:storybook_dart/storybook_dart.dart';

class Storybook {
  Storybook({
    required this.config,
  });

  final StorybookConfig config;

  List<StoryObj> get stories => config.stories;
}
