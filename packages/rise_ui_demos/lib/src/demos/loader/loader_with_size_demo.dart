import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class LoaderWithSizeDemo extends StatelessWidget {
  const LoaderWithSizeDemo({super.key});

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
          Loader(
            size: size,
          ),
      ],
    );
  }
}
