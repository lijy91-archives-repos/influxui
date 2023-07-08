import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class ActionIconWithColorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          ActionIconVariant.subtle,
          ActionIconVariant.outline,
          ActionIconVariant.light,
          ActionIconVariant.filled,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kAllColors)
                ActionIcon(
                  TablerIcons.sun,
                  variant: variant,
                  color: color,
                ),
            ],
          ),
      ],
    );
  }
}
