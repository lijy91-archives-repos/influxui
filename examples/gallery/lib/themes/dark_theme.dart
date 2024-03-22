import 'package:influxui/influxui.dart';

final darkThemeData = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: ExtendedColors.black,
  extensions: [
    const ExtendedThemeData(
      brightness: Brightness.light,
    ),
  ],
);
