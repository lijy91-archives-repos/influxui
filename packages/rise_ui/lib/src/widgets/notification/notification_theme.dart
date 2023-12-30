// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'notification_theme.tailor.dart';

@TailorMixin()
class NotificationThemeData extends ThemeExtension<NotificationThemeData>
    with DiagnosticableTreeMixin, _$NotificationThemeDataTailorMixin {
  const NotificationThemeData({
    this.borderRadius,
  });

  final BorderRadius? borderRadius;
}

class NotificationTheme extends InheritedTheme {
  const NotificationTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final NotificationThemeData data;

  static NotificationThemeData of(BuildContext context) {
    return context.notificationThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return NotificationTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(NotificationTheme oldWidget) =>
      data != oldWidget.data;
}
