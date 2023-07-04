// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart' show DefaultCupertinoLocalizations;
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gallery/generated/codegen_loader.g.dart';
import 'package:gallery/router_config.dart';
import 'package:gallery/themes/themes.dart';
import 'package:gallery/utilities/utilities.dart';
import 'package:rise_ui/rise_ui.dart';

class TablerIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => FluentIcons.chevron_left_24_regular;

  @override
  IconData get chevron_right => FluentIcons.chevron_right_24_regular;

  @override
  IconData get square => FluentIcons.square_24_regular;
}

Future<void> _ensureInitialized() async {
  Icons.iconLibrary = TablerIconLibrary();
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
  final md.ThemeMode _themeMode = md.ThemeMode.light;

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
        return child;
      },
    );
  }
}
