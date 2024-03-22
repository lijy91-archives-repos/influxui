import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('kdb-goldens', () {
    testGolden(
      'kdb-light',
      (_) => const Row(
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
      (_) => const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Kbd('shift', size: ExtendedSize.small),
          Kbd('shift', size: ExtendedSize.medium),
          Kbd('shift', size: ExtendedSize.large),
        ],
      ),
      size: const Size(320, 60),
    );
    testGolden(
      'kdb-dark',
      (_) => const ExtendedTheme(
        data: ExtendedThemeData(brightness: Brightness.dark),
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
      (_) => const ExtendedTheme(
        data: ExtendedThemeData(brightness: Brightness.dark),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Kbd('shift', size: ExtendedSize.small),
            Kbd('shift', size: ExtendedSize.medium),
            Kbd('shift', size: ExtendedSize.large),
          ],
        ),
      ),
      size: const Size(320, 60),
    );
  });
}
