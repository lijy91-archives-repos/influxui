import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ButtonWithVariantDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in [
          ButtonVariant.subtle,
          ButtonVariant.outline,
          ButtonVariant.light,
          ButtonVariant.filled,
        ])
          Button(
            variant: variant,
            label: 'Button',
          ),
      ],
    );
  }
}
