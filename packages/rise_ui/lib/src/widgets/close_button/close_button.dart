import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/action_icon/action_icon.dart';
import 'package:rise_ui/src/widgets/theme/icons.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionIcon(
      Icons.square,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
