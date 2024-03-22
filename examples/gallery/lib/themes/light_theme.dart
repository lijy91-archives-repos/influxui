import 'package:influxui/influxui.dart';

final lightThemeData = ThemeData(
  colorScheme: ColorScheme.light(
    primary: ExtendedColors.indigo,
    background: ExtendedColors.gray.shade100,
    surface: ExtendedColors.white,
    outline: ExtendedColors.gray.shade200,
  ),
  extensions: const [
    ExtendedThemeData(
      brightness: Brightness.light,
    ),
  ],
);
