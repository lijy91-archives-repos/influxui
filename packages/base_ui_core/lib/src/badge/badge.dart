import 'package:flutter/material.dart';

/// Controls badge appearance
enum BadgeVariant {
  light,
  filled,
  outline,
  dot,
  gradient,
}

class Badge extends StatelessWidget {
  final BadgeVariant? variant;

  const Badge({
    super.key,
    this.variant,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
