import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

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
      'kdb-light-sizes',
      (_) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Kbd('shift', size: NamedSize.tiny),
          Kbd('shift', size: NamedSize.small),
          Kbd('shift', size: NamedSize.medium),
          Kbd('shift', size: NamedSize.large),
          Kbd('shift', size: NamedSize.big),
        ],
      ),
      size: Size(320, 60),
    );
    testGolden(
      'kdb-dark',
      (_) => KbdTheme(
        data: KbdThemeData(brightness: Brightness.dark),
        child: Row(
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
      ),
    );
    testGolden(
      'kdb-dark-sizes',
      (_) => KbdTheme(
        data: KbdThemeData(brightness: Brightness.dark),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Kbd('shift', size: NamedSize.tiny),
            Kbd('shift', size: NamedSize.small),
            Kbd('shift', size: NamedSize.medium),
            Kbd('shift', size: NamedSize.large),
            Kbd('shift', size: NamedSize.big),
          ],
        ),
      ),
      size: Size(320, 60),
    );
  });
}
