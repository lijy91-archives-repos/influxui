import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:rise_ui_demos/src/demos/kbd/kbd_with_size_demo.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('kdb-goldens', () {
    testGolden(
      'kdb_demo',
      (_) => KbdDemo(),
    );
    testGolden(
      'kdb_with_size_demo',
      (_) => KbdWithSizeDemo(),
      size: Size(320, 60),
    );
  });
}
