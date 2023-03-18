import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('blockquote-goldens', () {
    testGolden(
      'blockquote',
      (_) => Blockquote(
        cite: 'test-cite',
        child: Text('test-quote'),
      ),
    );
  });
}
