import 'package:flutter/material.dart' hide TextTheme;
import 'package:rise_ui/src/widgets/notification/notification_theme.dart';
import 'package:rise_ui/src/widgets/text/text_theme.dart';

export 'notification_theme.dart';

class Notification extends StatelessWidget {
  const Notification({
    super.key,
    this.color,
    this.title,
    this.titleBuilder,
    this.body,
    this.bodyBuilder,
  }) : assert(titleBuilder == null && title != null);

  /// The notification's fill color.
  final Color? color;

  /// Notification title
  final String? title;

  /// Notification title builder
  final WidgetBuilder? titleBuilder;

  /// Notification body
  final String? body;

  /// Notification body builder
  final WidgetBuilder? bodyBuilder;

  @override
  Widget build(BuildContext context) {
    final themeData = NotificationTheme.of(context);
    final defaults = _NotificationDefaults(context);

    final borderRadius = themeData.borderRadius ?? defaults.borderRadius;

    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 28,
            spreadRadius: -7,
            offset: const Offset(0, 35),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            spreadRadius: -7,
            offset: const Offset(0, 15),
          ),
        ],
        border: Border.all(
          color: const Color(0xffe9ecef),
          width: 1.0,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Column(
          children: [
            DefaultTextStyle(
              style: TextTheme.of(context).textStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
              child: titleBuilder?.call(context) ?? Text(title!),
            ),
            if (bodyBuilder != null || body != null)
              DefaultTextStyle(
                style: TextTheme.of(context).textStyle.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                child: bodyBuilder?.call(context) ?? Text(body!),
              ),
          ],
        ),
      ),
    );
  }
}

class _NotificationDefaults extends NotificationThemeData {
  _NotificationDefaults(this.context) : super();

  final BuildContext context;

  @override
  get borderRadius => const BorderRadius.all(Radius.circular(4));
}
