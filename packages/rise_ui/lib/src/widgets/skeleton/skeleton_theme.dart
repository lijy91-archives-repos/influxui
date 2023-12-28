// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeExtension;
import 'package:flutter/widgets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'skeleton_theme.tailor.dart';

@TailorMixin()
class SkeletonThemeData extends ThemeExtension<SkeletonThemeData>
    with DiagnosticableTreeMixin, _$SkeletonThemeDataTailorMixin {
  const SkeletonThemeData({
    this.borderRadius,
  });

  final BorderRadius? borderRadius;
}

class SkeletonTheme extends InheritedTheme {
  const SkeletonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final SkeletonThemeData data;

  static SkeletonThemeData of(BuildContext context) {
    return context.skeletonThemeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SkeletonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SkeletonTheme oldWidget) => data != oldWidget.data;
}
