import 'package:storybook_dart/storybook_dart.dart';

import 'package:gallery/stories/box_stories.dart';
import 'package:gallery/stories/button_stories.dart';
import 'package:gallery/stories/action_icon_stories.dart';
import 'package:gallery/stories/kbd_stories.dart';

final StorybookConfig storybookConfig = StorybookConfig(
  stories: [
    BoxDefaultStory(),
    BoxWithSizeStory(),
    BoxWithColorStory(),
    BoxWithVariantStory(),
    ButtonDefaultStory(),
    ButtonWithSizeStory(),
    ButtonWithColorStory(),
    ActionIconDefaultStory(),
    ActionIconWithSizeStory(),
    ActionIconWithColorStory(),
    KbdDefaultStory(),
    KbdWithSizeStory(),
    KbdWithColorStory(),
  ],
);

