import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_style.dart';
import 'package:rise_ui/src/widgets/kbd/kbd_theme.dart';
import 'package:rise_ui/src/widgets/theme/extended_colors.dart';

const _defaults = KbdThemeData(
  tinyStyle: KbdStyle(
    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    size: Size.square(10),
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  ),
  smallStyle: KbdStyle(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
    size: Size.square(12),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
  mediumStyle: KbdStyle(
    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
    size: Size.square(14),
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  largeStyle: KbdStyle(
    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    size: Size.square(16),
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  bigStyle: KbdStyle(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    size: Size.square(20),
    labelStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final kDarkKbdThemeDefaults = _defaults.copyWith(
  color: ExtendedColors.gray.shade500,
  borderColor: ExtendedColors.gray.shade300,
  labelColor: ExtendedColors.gray.shade50,
);

final kLightKbdThemeDefaults = _defaults.copyWith(
  color: ExtendedColors.gray.shade50,
  borderColor: ExtendedColors.gray.shade300,
  labelColor: ExtendedColors.gray.shade700,
);
