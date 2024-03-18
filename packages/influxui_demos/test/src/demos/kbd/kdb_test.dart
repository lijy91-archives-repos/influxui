import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui_demos/influxui_demos.dart';
import 'package:influxui_demos/src/demos/kbd/kbd_with_size_demo.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('kdb-goldens', () {
    testGolden(
      'kdb_demo',
      (_) => const KbdDemo(),
    );
    testGolden(
      'kdb_with_size_demo',
      (_) => const KbdWithSizeDemo(),
      size: const Size(320, 60),
    );
  });
}
