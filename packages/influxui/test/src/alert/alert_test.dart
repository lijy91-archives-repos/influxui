import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('alert-goldens', () {
    testGolden(
      'alert',
      (_) => const Alert(
        title: 'title',
        message: 'message',
      ),
    );
  });
}
