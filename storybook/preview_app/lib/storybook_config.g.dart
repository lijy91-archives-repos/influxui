import 'package:preview_app/stories/alert_stories.dart';
import 'package:preview_app/stories/avatar_stories.dart';
import 'package:preview_app/stories/badge_stories.dart';
import 'package:preview_app/stories/button_stories.dart';
import 'package:preview_app/stories/close_button_stories.dart';
import 'package:preview_app/stories/divider_stories.dart';
import 'package:preview_app/stories/icon_button_stories.dart';
import 'package:preview_app/stories/kbd_stories.dart';
import 'package:preview_app/stories/loader_stories.dart';
import 'package:preview_app/stories/menu_stories.dart';
import 'package:preview_app/stories/navigation_rail_stories.dart';
import 'package:storybook_dart/storybook_dart.dart';

final StorybookConfig storybookConfig = StorybookConfig(
  stories: [
    IconButtonDefaultStory(),
    IconButtonWithVariantStory(),
    IconButtonWithSizeStory(),
    IconButtonWithColorStory(),
    AlertDefaultStory(),
    AvatarDefaultStory(),
    BadgeDefaultStory(),
    ButtonDefaultStory(),
    ButtonWithVariantStory(),
    ButtonWithSizeStory(),
    ButtonWithColorStory(),
    CloseButtonDefaultStory(),
    DividerDefaultStory(),
    KbdDefaultStory(),
    KbdWithSizeStory(),
    LoaderDefaultStory(),
    MenuDefaultStory(),
    NavigationRailDefaultStory(),
  ],
);
