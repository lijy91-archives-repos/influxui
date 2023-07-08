import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ButtonWithColorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          ButtonVariant.subtle,
          ButtonVariant.outline,
          ButtonVariant.light,
          ButtonVariant.filled,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kAllColors)
                Button(
                  label: 'Button',
                  variant: variant,
                  color: color,
                ),
            ],
          ),
      ],
    );
  }
}
