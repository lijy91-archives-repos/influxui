import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_test/rise_ui_test.dart';

void main() {
  group('menu-goldens', () {
    testGolden(
      'menu',
      (_) => Container(
        padding: EdgeInsets.all(40),
        child: Menu(
          children: [
            MenuSection(
              children: [
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
          ],
        ),
      ),
      size: Size(300, 500),
    );
  });
}
