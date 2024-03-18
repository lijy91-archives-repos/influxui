// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/action_icon/action_icon_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'action_icon_theme.tailor.dart';

@TailorMixin()
class ActionIconThemeData extends ThemeExtension<ActionIconThemeData>
    with DiagnosticableTreeMixin, _$ActionIconThemeDataTailorMixin {
  const ActionIconThemeData({
    this.borderRadius,
    this.pressedOpacity = 0.8,
    this.smallStyle,
    this.mediumStyle,
    this.largeStyle,
  });

  final BorderRadius? borderRadius;

  final double pressedOpacity;

  final ActionIconStyle? smallStyle;
  final ActionIconStyle? mediumStyle;
  final ActionIconStyle? largeStyle;
}

class ActionIconTheme extends InheritedTheme {
  const ActionIconTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ActionIconThemeData data;

  static ActionIconThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ActionIconTheme>();
    return theme?.data ?? Theme.of(context).extension<ActionIconThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ActionIconTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ActionIconTheme oldWidget) => data != oldWidget.data;
}
