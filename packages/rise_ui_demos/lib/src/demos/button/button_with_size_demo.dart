import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/src/utils/constants.dart';

class ButtonWithSizeDemo extends StatelessWidget {
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
          ButtonVariant.white,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final size in kNamedSizes)
                Button(
                  label: 'Button',
                  variant: variant,
                  size: size,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}
