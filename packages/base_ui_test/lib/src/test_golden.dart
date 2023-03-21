import 'package:base_ui_core/base_ui_core.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _loadFonts() async {
  final List<Map<String, dynamic>> fonts = [
    {
      'name': 'Roboto',
      'files': [
        'packages/base_ui_test/fonts/Roboto/Roboto-Regular.ttf',
      ]
    },
    {
      'name': 'Roboto Mono',
      'files': [
        'packages/base_ui_test/fonts/RobotoMono/RobotoMono-Regular.ttf',
      ]
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
  Size? size,
  bool skip = false,
}) {
  testWidgets(
    description,
    (tester) async {
      await tester.binding.setSurfaceSize(size ?? Size(160, 120));
      await _loadFonts();

      const widgetKey = ValueKey('widget-key');
      goldenFile ??= '../_goldens/$description.png';

      await tester.pumpWidget(BaseApp(
        key: widgetKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Builder(builder: builder),
          ),
        ),
      ));

      await expectLater(
        find.byKey(widgetKey),
        matchesGoldenFile(goldenFile!),
      );
    },
    skip: skip,
  );
}
