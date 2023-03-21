import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('kdb-goldens', () {
    testGolden(
      'kdb-light',
      (_) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Kbd('shift'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text('+'),
          ),
          Kbd('M'),
        ],
      ),
    );
    testGolden(
      'kdb-dark',
      (_) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Kbd('shift', brightness: Brightness.dark),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text('+'),
          ),
          Kbd('M', brightness: Brightness.dark),
        ],
      ),
    );
  });
}
