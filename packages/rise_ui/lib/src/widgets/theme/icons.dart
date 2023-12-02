// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';

abstract class IconLibrary {
  IconData get chevron_left;
  IconData get chevron_right;
  IconData get square;
  IconData get light_mode;
  IconData get dark_mode;
}

class Icons {
  static IconLibrary? _iconLibrary;

  static IconLibrary get iconLibrary {
    assert(_iconLibrary != null);
    return _iconLibrary!;
  }

  static set iconLibrary(IconLibrary? iconLibrary) {
    _iconLibrary = iconLibrary;
  }

  static IconData get chevron_left => iconLibrary.chevron_left;
  static IconData get chevron_right => iconLibrary.chevron_right;
  static IconData get square => iconLibrary.square;
  static IconData get light_mode => iconLibrary.light_mode;
  static IconData get dark_mode => iconLibrary.dark_mode;
}
