import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

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
            TablerIcons.sun,
            variant: ActionIconVariant.light,
            size: NamedSize.big,
          ),
          SizedBox(width: 8),
          ActionIcon(
            TablerIcons.settings,
            variant: ActionIconVariant.light,
            size: NamedSize.big,
          ),
          Container(
            color: Colors.red,
            child: Icon(
              TablerIcons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
