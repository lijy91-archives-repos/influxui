import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ActionIconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ActionIcon(
            md.Icons.wb_sunny_outlined,
            variant: ActionIconVariant.light,
            size: NamedSize.big,
          ),
          SizedBox(width: 8),
          ActionIcon(
            FluentIcons.settings_16_regular,
            // md.Icons.wb_sunny_outlined,
            variant: ActionIconVariant.light,
            size: NamedSize.big,
          ),
          Container(
            color: Colors.red,
            child: Icon(
              FluentIcons.settings_24_regular,
              // size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
