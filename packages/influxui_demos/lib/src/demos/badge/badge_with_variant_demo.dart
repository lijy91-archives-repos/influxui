import 'package:influxui/influxui.dart';

class BadgeWithVariantDemo extends StatelessWidget {
  const BadgeWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (final variant in BadgeVariant.values)
          Badge(
            variant: variant,
            label: 'Badge',
          ),
      ],
    );
  }
}
