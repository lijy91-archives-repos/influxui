import 'package:flutter/services.dart';

Future<void> loadTestFonts() async {
  final font = rootBundle.load(
    'packages/base_ui_test/fonts/Roboto/Roboto-Regular.ttf',
  );

  final fontLoader = FontLoader('Roboto')..addFont(font);
  await fontLoader.load();
}
