import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class ButtonWithColorDemo extends StatelessWidget {
  const ButtonWithColorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final color in kExtendedColors)
          Wrap(
            spacing: 10,
            children: [
              for (final variant in ButtonVariant.values)
                Button(
                  label: 'Button',
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
