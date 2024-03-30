// ignore_for_file: non_constant_identifier_names

import 'package:influxui/influxui.dart';
import 'package:preview_app/storybook_preview_app.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class TablerIconLibrary extends IconLibrary {
  @override
  IconData get chevron_left => TablerIcons.chevron_left;

  @override
  IconData get chevron_right => TablerIcons.chevron_right;

  @override
  IconData get square => TablerIcons.square;

  @override
  IconData get light_mode => TablerIcons.sun;

  @override
  IconData get dark_mode => TablerIcons.moon;
}

void main() {
  ExtendedIcons.iconLibrary = TablerIconLibrary();
  runApp(const StorybookPreviewApp());
}
