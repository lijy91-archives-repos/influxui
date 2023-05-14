// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class IconLibrary {
  IconData get chevron_left;
  IconData get chevron_right;
  IconData get square;
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
}
