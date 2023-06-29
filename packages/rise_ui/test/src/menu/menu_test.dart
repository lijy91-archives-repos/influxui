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
                  label: 'Settings',
                ),
                MenuItem(
                  label: 'Messages',
                ),
                MenuItem(
                  label: 'Gallery',
                ),
                MenuItem(
                  label: 'Search',
                ),
              ],
            ),
            MenuSection(
              children: [
                MenuItem(
                  label: 'Settings',
                ),
                MenuItem(
                  label: 'Messages',
                ),
                MenuItem(
                  label: 'Gallery',
                ),
                MenuItem(
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
