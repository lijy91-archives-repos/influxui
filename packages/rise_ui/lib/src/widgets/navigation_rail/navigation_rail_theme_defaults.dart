import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/navigation_rail/navigation_rail_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

const kDarkNavigationRailThemeDefaults = NavigationRailThemeData(
  unselectedIconTheme: IconThemeData(
    color: ExtendedColors.white,
    size: 16,
  ),
  unselectedLabelStyle: TextStyle(
    color: ExtendedColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: IconThemeData(
    color: ExtendedColors.white,
    size: 16,
  ),
  selectedLabelStyle: TextStyle(
    color: ExtendedColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  indicatorColor: ExtendedColors.gray,
);

final kLightNavigationRailThemeDefaults = NavigationRailThemeData(
  unselectedIconTheme: const IconThemeData(
    color: ExtendedColors.black,
    size: 16,
  ),
  unselectedLabelStyle: const TextStyle(
    color: ExtendedColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedLabelStyle: const TextStyle(
    color: ExtendedColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: const IconThemeData(
    color: ExtendedColors.black,
    size: 16,
  ),
  indicatorColor: ExtendedColors.gray.shade300,
);
