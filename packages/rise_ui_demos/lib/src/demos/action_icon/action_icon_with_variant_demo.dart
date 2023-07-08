import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class ActionIconWithVariantDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        ActionIcon(
          TablerIcons.sun,
          variant: ActionIconVariant.transparent,
        ),
        ActionIcon(
          TablerIcons.sun,
          variant: ActionIconVariant.subtle,
        ),
        ActionIcon(
          TablerIcons.sun,
          variant: ActionIconVariant.outline,
        ),
        ActionIcon(
          TablerIcons.sun,
          variant: ActionIconVariant.filled,
        ),
        ActionIcon(
          TablerIcons.sun,
          variant: ActionIconVariant.light,
        ),
      ],
    );
  }
}
