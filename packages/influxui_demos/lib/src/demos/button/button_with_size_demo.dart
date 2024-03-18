import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class ButtonWithSizeDemo extends StatelessWidget {
  const ButtonWithSizeDemo({super.key});

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
              for (final size in kExtendedSizes)
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
