import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Controls button appearance
enum ButtonVariant {
  filled,
  outline,
  light,
  white,
  subtle,
  gradient,
}

class Button extends StatelessWidget {
  final ButtonVariant? variant;

  const Button({
    super.key,
    this.variant,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
