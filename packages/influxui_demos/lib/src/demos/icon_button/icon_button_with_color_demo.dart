import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class IconButtonWithColorDemo extends StatelessWidget {
  const IconButtonWithColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in IconButtonVariant.values)
          Wrap(
            spacing: 10,
            children: [
              for (final color in kExtendedColors)
                IconButton(
                  ExtendedIcons.light_mode,
                  variant: variant,
                  color: color,
                  onPressed: () {},
                ),
            ],
          ),
      ],
    );
  }
}
