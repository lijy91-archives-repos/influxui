import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ButtonWithVariantDemo extends StatelessWidget {
  const ButtonWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in [
          ButtonVariant.filled,
          ButtonVariant.light,
          ButtonVariant.outline,
          ButtonVariant.subtle,
          ButtonVariant.transparent,
        ])
          Button(
            variant: variant,
            label: 'Button',
            onPressed: () {},
          ),
      ],
    );
  }
}
