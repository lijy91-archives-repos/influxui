import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';

class KbdWithSizeDemo extends StatelessWidget {
  const KbdWithSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final size in [
          ExtendedSize.small,
          ExtendedSize.medium,
          ExtendedSize.large,
        ])
          Kbd('Shift', size: size),
      ],
    );
  }
}
