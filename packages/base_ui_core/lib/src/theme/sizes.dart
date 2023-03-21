import 'package:flutter/widgets.dart';

class NamedSize extends Size {
  const NamedSize(this.name) : super(0.0, 0.0);

  final String name;

  @override
  int get hashCode => Object.hash(width, height, name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is NamedSize && other.name == name;
  }

  static const NamedSize tiny = NamedSize('tiny');
  static const NamedSize small = NamedSize('small');
  static const NamedSize medium = NamedSize('medium');
  static const NamedSize large = NamedSize('large');
  static const NamedSize big = NamedSize('big');
}
