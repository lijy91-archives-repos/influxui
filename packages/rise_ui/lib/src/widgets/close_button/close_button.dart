import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/theme/icons.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon.dart';

class CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActionIcon(
      Icons.square,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
