import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

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
