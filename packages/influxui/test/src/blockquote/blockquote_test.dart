import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

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
