import 'package:flutter/widgets.dart';
import 'package:open_color/open_color.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_theme.dart';

const kDarkNavigationRailThemeDefaults = NavigationRailThemeData(
  unselectedIconTheme: IconThemeData(
    color: OpenColors.white,
    size: 16,
  ),
  unselectedLabelStyle: TextStyle(
    color: OpenColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: IconThemeData(
    color: OpenColors.white,
    size: 16,
  ),
  selectedLabelStyle: TextStyle(
    color: OpenColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  indicatorColor: OpenColors.gray,
);

final kLightNavigationRailThemeDefaults = NavigationRailThemeData(
  unselectedIconTheme: IconThemeData(
    color: OpenColors.black,
    size: 16,
  ),
  unselectedLabelStyle: TextStyle(
    color: OpenColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedLabelStyle: TextStyle(
    color: OpenColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: IconThemeData(
    color: OpenColors.black,
    size: 16,
  ),
  indicatorColor: OpenColors.gray.shade300,
);
