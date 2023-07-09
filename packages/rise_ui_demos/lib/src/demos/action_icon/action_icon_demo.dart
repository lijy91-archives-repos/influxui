import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class ActionIconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActionIcon(
      TablerIcons.sun,
      variant: ActionIconVariant.light,
      onPressed: () {},
    );
  }
}
