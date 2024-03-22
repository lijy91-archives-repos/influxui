import 'package:flutter/material.dart' as md;
import 'package:flutter_test/flutter_test.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_test/influxui_test.dart';

void main() {
  group('menu-goldens', () {
    testGolden(
      'menu',
      (_) => Container(
        padding: const EdgeInsets.all(40),
        child: const Menu(
          items: [
            MenuItem(
              icon: md.Icons.wb_sunny_outlined,
              label: 'Settings',
            ),
            MenuItem(
              icon: md.Icons.wb_sunny_outlined,
              label: 'Messages',
            ),
            MenuItem(
              icon: md.Icons.wb_sunny_outlined,
              label: 'Gallery',
            ),
            MenuItem(
              icon: md.Icons.wb_sunny_outlined,
              label: 'Search',
            ),
          ],
        ),
      ),
      size: const Size(300, 500),
    );
  });
}
