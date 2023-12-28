import 'package:storybook_dart/storybook_dart.dart';

import 'package:preview_app/stories/avatar_stories.dart';
import 'package:preview_app/stories/navigation_rail_stories.dart';
import 'package:preview_app/stories/box_stories.dart';
import 'package:preview_app/stories/button_stories.dart';
import 'package:preview_app/stories/badge_stories.dart';
import 'package:preview_app/stories/menu_stories.dart';
import 'package:preview_app/stories/action_icon_stories.dart';
import 'package:preview_app/stories/divider_stories.dart';
import 'package:preview_app/stories/close_button_stories.dart';
import 'package:preview_app/stories/alert_stories.dart';
import 'package:preview_app/stories/kbd_stories.dart';
import 'package:preview_app/stories/loader_stories.dart';

final StorybookConfig storybookConfig = StorybookConfig(
  stories: [
    AvatarDefaultStory(),
    NavigationRailDefaultStory(),
    BoxDefaultStory(),
    BoxWithVariantStory(),
    BoxWithSizeStory(),
    BoxWithColorStory(),
    ButtonDefaultStory(),
    ButtonWithVariantStory(),
    ButtonWithSizeStory(),
    ButtonWithColorStory(),
    BadgeDefaultStory(),
    MenuDefaultStory(),
    ActionIconDefaultStory(),
    ActionIconWithVariantStory(),
    ActionIconWithSizeStory(),
    ActionIconWithColorStory(),
    DividerDefaultStory(),
    CloseButtonDefaultStory(),
    AlertDefaultStory(),
    KbdDefaultStory(),
    KbdWithSizeStory(),
    LoaderDefaultStory(),
  ],
);

