import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class IconButtonWithSizeDemo extends StatelessWidget {
  const IconButtonWithSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          IconButtonVariant.filled,
          IconButtonVariant.light,
          IconButtonVariant.outline,
          IconButtonVariant.subtle,
          IconButtonVariant.transparent,
          IconButtonVariant.white,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final size in kExtendedSizes)
                IconButton(
                  ExtendedIcons.light_mode,
                  variant: variant,
                  size: size,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}
