import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Shape {
  pill,
  round,
  circle,
  square,
}

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.shape,
    this.color,
    this.child,
  });

  final Shape shape;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        // shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
