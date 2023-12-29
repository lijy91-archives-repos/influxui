import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_theme.dart';
import 'package:rise_ui/src/widgets/theme/colors.dart';

const kDarkNavigationRailThemeDefaults = NavigationRailThemeData(
  unselectedIconTheme: IconThemeData(
    color: Colors.white,
    size: 16,
  ),
  unselectedLabelStyle: TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: IconThemeData(
    color: Colors.white,
    size: 16,
  ),
  selectedLabelStyle: TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  indicatorColor: Colors.darkGray,
);

final kLightNavigationRailThemeDefaults = NavigationRailThemeData(
  unselectedIconTheme: IconThemeData(
    color: Colors.black,
    size: 16,
  ),
  unselectedLabelStyle: TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedLabelStyle: TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: IconThemeData(
    color: Colors.black,
    size: 16,
  ),
  indicatorColor: Colors.gray.shade300,
);
