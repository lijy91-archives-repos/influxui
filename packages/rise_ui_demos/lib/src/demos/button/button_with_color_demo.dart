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
          ButtonVariant.filled,
          ButtonVariant.light,
          ButtonVariant.outline,
          ButtonVariant.subtle,
          ButtonVariant.transparent,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kAllColors)
                Button(
                  label: 'Button',
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
