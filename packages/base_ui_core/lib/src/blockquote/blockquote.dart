import 'package:flutter/material.dart';

/// Blockquote with optional cite
class Blockquote extends StatelessWidget {
  /// Describe a reference to a cited quote
  final String? cite;

  final WidgetBuilder? citeBuilder;

  /// Icon, defaults to quote icon
  final Widget? icon;

  final Widget child;

  const Blockquote({
    super.key,
    this.icon,
    this.cite,
    this.citeBuilder,
    required this.child,
  });

  Widget _buildCite(BuildContext context) {
    return Text(cite!);
  }

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
              _buildCite(context),
            ],
          ),
        ],
      ),
    );
  }
}
