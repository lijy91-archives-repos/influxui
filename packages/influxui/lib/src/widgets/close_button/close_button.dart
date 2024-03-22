import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/extended_theme/extended_icons.dart';
import 'package:influxui/src/widgets/icon_button/icon_button.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      ExtendedIcons.square,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
