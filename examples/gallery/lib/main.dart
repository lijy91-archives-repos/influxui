// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart' hide IconButton;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gallery/router_config.dart';
import 'package:gallery/themes/themes.dart';
import 'package:influxui/influxui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class TablerIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => TablerIcons.chevron_left;

  @override
  IconData get chevron_right => TablerIcons.chevron_right;

  @override
  IconData get square => TablerIcons.square;

  @override
  IconData get light_mode => TablerIcons.sun;

  @override
  IconData get dark_mode => TablerIcons.moon;
}

Future<void> _ensureInitialized() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
}

void main() async {
  await _ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  Widget _buildApp(BuildContext context) {
    return MaterialApp.router(
      theme: lightThemeData,
      darkTheme: darkThemeData,
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      builder: (context, child) {
        child = ExtendedTheme(
          data: ExtendedThemeData(
            brightness: _themeMode == ThemeMode.dark
                ? Brightness.dark
                : Brightness.light,
          ),
          child: child!,
        );
        return Stack(
          children: [
            child,
            Positioned(
              right: 20,
              bottom: 20,
              child: IconButton(
                _themeMode == ThemeMode.light
                    ? TablerIcons.sun
                    : TablerIcons.moon,
                variant: IconButtonVariant.filled,
                onPressed: () {
                  _themeMode = _themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                  setState(() {});
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedThemeBuilder(
      iconLibrary: TablerIconLibrary(),
      builder: (_, value, child) {
        return _buildApp(context);
      },
    );
  }
}
