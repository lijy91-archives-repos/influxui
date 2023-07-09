// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart' show DefaultCupertinoLocalizations;
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gallery/generated/codegen_loader.g.dart';
import 'package:gallery/router_config.dart';
import 'package:gallery/themes/themes.dart';
import 'package:gallery/utilities/utilities.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class DefaultIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => TablerIcons.chevron_left;

  @override
  IconData get chevron_right => TablerIcons.chevron_right;

  @override
  IconData get square => TablerIcons.square;
}

Future<void> _ensureInitialized() async {
  Icons.iconLibrary = DefaultIconLibrary();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  usePathUrlStrategy();
}

void main() async {
  await _ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [
      Locale(kLanguageEN),
      Locale(kLanguageZH),
    ],
    path: 'resources/langs',
    assetLoader: CodegenLoader(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  md.ThemeMode _themeMode = md.ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return md.MaterialApp.router(
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      routerConfig: routerConfig,
      localizationsDelegates: [
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        ...context.localizationDelegates,
      ],
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      builder: (context, child) {
        child = Theme(
          data: ThemeData(
            brightness: _themeMode == md.ThemeMode.dark
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
              child: ActionIcon(
                _themeMode == md.ThemeMode.light
                    ? TablerIcons.sun
                    : TablerIcons.moon,
                variant: ActionIconVariant.filled,
                onPressed: () {
                  _themeMode = _themeMode == md.ThemeMode.light
                      ? md.ThemeMode.dark
                      : md.ThemeMode.light;
                  setState(() {});
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
