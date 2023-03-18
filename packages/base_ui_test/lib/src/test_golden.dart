import 'package:base_ui_core/base_ui_core.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _loadFonts() async {
  final font = rootBundle.load(
    'packages/base_ui_test/fonts/Roboto/Roboto-Regular.ttf',
  );
  final fontLoader = FontLoader('Roboto')..addFont(font);
  await fontLoader.load();
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
