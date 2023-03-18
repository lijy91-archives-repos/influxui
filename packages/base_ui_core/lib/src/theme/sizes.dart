import 'package:flutter/widgets.dart';

class NamedSize extends Size {
  const NamedSize(this.name) : super(0.0, 0.0);

  final String name;

  static const NamedSize tiny = NamedSize('tiny');
  static const NamedSize small = NamedSize('small');
  static const NamedSize medium = NamedSize('medium');
  static const NamedSize large = NamedSize('large');
  static const NamedSize big = NamedSize('big');
}
