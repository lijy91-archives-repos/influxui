import 'package:flutter/material.dart';

// Controls Alert background, color and border styles, "light" by default
enum AlertVariant {
  filled,
  outline,
  light,
}

/// Attract user attention with important static message
class Alert extends StatelessWidget {
  const Alert({
    super.key,
    this.variant,
    this.title,
    this.titleBuilder,
    this.message,
    this.messageBuilder,
  });

  final AlertVariant? variant;

  /// Alert title
  final String? title;

  /// Alert title builder
  final WidgetBuilder? titleBuilder;

  /// Alert message
  final String? message;

  /// Alert message builder
  final WidgetBuilder? messageBuilder;

  Widget _buildTitle(BuildContext context) {
    return Text(title!);
  }

  Widget _buildMessage(BuildContext context) {
    return Text(message!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        _buildMessage(context),
      ],
    );
  }
}
