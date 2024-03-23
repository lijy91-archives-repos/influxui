import 'package:influxui/influxui.dart';

class ButtonWithVariantDemo extends StatelessWidget {
  const ButtonWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in ButtonVariant.values)
          Button(
            variant: variant,
            label: 'Button',
            onPressed: () {},
          ),
      ],
    );
  }
}
