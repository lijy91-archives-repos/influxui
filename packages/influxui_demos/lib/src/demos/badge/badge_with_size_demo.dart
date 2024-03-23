import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class BadgeWithSizeDemo extends StatelessWidget {
  const BadgeWithSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in BadgeVariant.values)
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              for (final size in kExtendedSizes)
                Badge(
                  label: 'Badge',
                  variant: variant,
                  size: size,
                ),
            ],
          ),
      ],
    );
  }
}
