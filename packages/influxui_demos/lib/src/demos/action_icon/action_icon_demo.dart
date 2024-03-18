import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';

class ActionIconDemo extends StatelessWidget {
  const ActionIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionIcon(
      ExtendedIcons.light_mode,
      variant: ActionIconVariant.light,
      onPressed: () {},
    );
  }
}
