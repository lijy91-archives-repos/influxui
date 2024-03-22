import 'package:flutter/widgets.dart';
import 'package:influxui_demos/src/demos/alert/known_demos.dart';
import 'package:influxui_demos/src/demos/avatar/known_demos.dart';
import 'package:influxui_demos/src/demos/badge/known_demos.dart';
import 'package:influxui_demos/src/demos/blockquote/known_demos.dart';
import 'package:influxui_demos/src/demos/breadcrumb/known_demos.dart';
import 'package:influxui_demos/src/demos/button/known_demos.dart';
import 'package:influxui_demos/src/demos/card/known_demos.dart';
import 'package:influxui_demos/src/demos/checkbox/known_demos.dart';
import 'package:influxui_demos/src/demos/close_button/known_demos.dart';
import 'package:influxui_demos/src/demos/divider/known_demos.dart';
import 'package:influxui_demos/src/demos/icon_button/known_demos.dart';
import 'package:influxui_demos/src/demos/kbd/known_demos.dart';
import 'package:influxui_demos/src/demos/loader/known_demos.dart';
import 'package:influxui_demos/src/demos/menu/known_demos.dart';
import 'package:influxui_demos/src/demos/navigation_rail/known_demos.dart';
import 'package:influxui_demos/src/demos/switch/known_demos.dart';

export 'alert/alert_demo.dart';
export 'alert/known_demos.dart';
export 'avatar/avatar_demo.dart';
export 'avatar/known_demos.dart';
export 'badge/badge_demo.dart';
export 'badge/known_demos.dart';
export 'blockquote/blockquote_demo.dart';
export 'blockquote/known_demos.dart';
export 'breadcrumb/breadcrumb_demo.dart';
export 'breadcrumb/known_demos.dart';
export 'button/button_demo.dart';
export 'button/known_demos.dart';
export 'card/card_demo.dart';
export 'card/known_demos.dart';
export 'checkbox/checkbox_demo.dart';
export 'checkbox/known_demos.dart';
export 'close_button/close_button_demo.dart';
export 'close_button/known_demos.dart';
export 'divider/divider_demo.dart';
export 'divider/known_demos.dart';
export 'icon_button/icon_button_demo.dart';
export 'icon_button/known_demos.dart';
export 'kbd/kbd_demo.dart';
export 'kbd/known_demos.dart';
export 'loader/known_demos.dart';
export 'loader/loader_demo.dart';
export 'menu/known_demos.dart';
export 'menu/menu_demo.dart';
export 'navigation_rail/known_demos.dart';
export 'navigation_rail/navigation_rail_demo.dart';
export 'switch/known_demos.dart';
export 'switch/switch_demo.dart';

final Map<String, WidgetBuilder> kKnownDemos = {
  ...knownIconButtonDemos,
  ...knownAlertDemos,
  ...knownAvatarDemos,
  ...knownBadgeDemos,
  ...knownBlockquoteDemos,
  ...knownBreadcrumbDemos,
  ...knownButtonDemos,
  ...knownCardDemos,
  ...knownCheckboxDemos,
  ...knownCloseButtonDemos,
  ...knownDividerDemos,
  ...knownKbdDemos,
  ...knownLoaderDemos,
  ...knownMenuDemos,
  ...knownNavigationRailDemos,
  ...knownSwitchDemos,
};
