import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('blockquote-goldens', () {
    testGolden(
      'blockquote',
      (_) => const Blockquote(
        cite: 'test-cite',
        child: Text('test-quote'),
      ),
    );
  });
}
