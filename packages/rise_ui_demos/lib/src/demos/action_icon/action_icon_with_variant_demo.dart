import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class ActionIconWithVariantDemo extends StatelessWidget {
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
        ])
          ActionIcon(
            TablerIcons.sun,
            variant: variant,
            onPressed: () {},
          ),
      ],
    );
  }
}
