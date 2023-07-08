import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class KbdWithSizeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final size in [
          NamedSize.tiny,
          NamedSize.small,
          NamedSize.medium,
          NamedSize.large,
          NamedSize.big,
        ])
          Kbd('Shift', size: size),
      ],
    );
  }
}
