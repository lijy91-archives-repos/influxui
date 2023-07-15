import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ActionIconWithColorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          ActionIconVariant.filled,
          ActionIconVariant.light,
          ActionIconVariant.outline,
          ActionIconVariant.subtle,
          ActionIconVariant.transparent,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kAllColors)
                ActionIcon(
                  Icons.light_mode,
                  variant: variant,
                  color: color,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}
