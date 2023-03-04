import 'package:flutter/material.dart';

class Blockquote extends StatelessWidget {
  final Widget? icon;
  final Widget cite;
  final Widget child;

  const Blockquote({
    super.key,
    this.icon,
    required this.cite,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
              cite,
            ],
          ),
        ],
      ),
    );
  }
}
