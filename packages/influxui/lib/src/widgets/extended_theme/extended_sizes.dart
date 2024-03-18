import 'package:flutter/widgets.dart';

class ExtendedSize extends Size {
  const ExtendedSize(this.name) : super(0.0, 0.0);

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
    return other is ExtendedSize && other.name == name;
  }

  static const ExtendedSize small = ExtendedSize('small');
  static const ExtendedSize medium = ExtendedSize('medium');
  static const ExtendedSize large = ExtendedSize('large');
}
