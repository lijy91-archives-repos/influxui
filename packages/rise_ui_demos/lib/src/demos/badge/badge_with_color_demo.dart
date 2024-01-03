import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/src/utils/constants.dart';

class BadgeWithColorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          BadgeVariant.light,
          BadgeVariant.filled,
          BadgeVariant.outline,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kExtendedColors)
                Badge(
                  variant: variant,
                  color: color,
                  label: 'Badge',
                ),
            ],
          ),
      ],
    );
  }
}
