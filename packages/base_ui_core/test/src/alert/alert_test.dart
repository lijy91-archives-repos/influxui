import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('alert-goldens', () {
    testGolden(
      'alert',
      (_) => Alert(
        title: 'title',
        message: 'message',
      ),
    );
  });
}