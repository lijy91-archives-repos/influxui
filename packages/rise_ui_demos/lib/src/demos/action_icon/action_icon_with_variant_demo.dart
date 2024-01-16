import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ActionIconWithVariantDemo extends StatelessWidget {
  const ActionIconWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in [
          ActionIconVariant.filled,
          ActionIconVariant.light,
          ActionIconVariant.outline,
          ActionIconVariant.subtle,
          ActionIconVariant.transparent,
          ActionIconVariant.white,
        ])
          ActionIcon(
            ExtendedIcons.light_mode,
            variant: variant,
            onPressed: () {},
          ),
      ],
    );
  }
}
