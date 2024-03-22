import 'package:influxui/influxui.dart';

class IconButtonWithVariantDemo extends StatelessWidget {
  const IconButtonWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
          IconButton(
            ExtendedIcons.light_mode,
            variant: variant,
            onPressed: () {},
          ),
      ],
    );
  }
}
