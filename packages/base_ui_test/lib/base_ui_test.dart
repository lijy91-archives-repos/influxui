import 'package:flutter/services.dart';

export 'src/test_widget_app.dart';

Future<void> loadTestFonts() async {
  final font = rootBundle.load(
    'packages/base_ui_test/fonts/Roboto/Roboto-Regular.ttf',
  );

  final fontLoader = FontLoader('Roboto')..addFont(font);
  await fontLoader.load();
}
