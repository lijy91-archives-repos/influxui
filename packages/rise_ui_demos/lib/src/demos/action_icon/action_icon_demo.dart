import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ActionIconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ActionIcon(
        FluentIcons.settings_24_regular,
        variant: ActionIconVariant.subtle,
      ),
    );
  }
}
