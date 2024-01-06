import 'package:flutter/material.dart' as md;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

Future<void> _loadFonts() async {
  final List<Map<String, dynamic>> fonts = [
    {
      'name': 'MaterialIcons',
      'files': [
        'packages/rise_ui_test/fonts/MaterialIcons-Regular.otf',
      ],
    },
    {
      'name': 'Roboto',
      'files': [
        'packages/rise_ui_test/fonts/Roboto-Regular.ttf',
      ],
    },
    {
      'name': 'Roboto Mono',
      'files': [
        'packages/rise_ui_test/fonts/RobotoMono-Regular.ttf',
      ],
    },
  ];

  for (var font in fonts) {
    final fontLoader = FontLoader(font['name']);
    for (var file in (font['files'] ?? [])) {
      fontLoader.addFont(rootBundle.load(file));
    }
    await fontLoader.load();
  }
}

void testGolden(
  String description,
  WidgetBuilder builder, {
  String? goldenFile,
  Color? backgroundColor,
  Size? size,
  bool skip = false,
}) {
  testWidgets(
    description,
    (tester) async {
      await tester.binding.setSurfaceSize(size ?? const Size(160, 120));
      await _loadFonts();

      const widgetKey = ValueKey('widget-key');
      goldenFile ??= '../_goldens/$description.png';

      debugDisableShadows = false;
      await tester.pumpWidget(md.MaterialApp(
        key: widgetKey,
        debugShowCheckedModeBanner: false,
        home: ExtendedTheme(
          data: const ExtendedThemeData(),
          child: md.Scaffold(
            backgroundColor: backgroundColor ?? Colors.transparent,
            body: Center(
              child: Builder(builder: builder),
            ),
          ),
        ),
      ),);

      await expectLater(
        find.byKey(widgetKey),
        matchesGoldenFile(goldenFile!),
      );
      debugDisableShadows = true;
    },
    skip: skip,
  );
}
