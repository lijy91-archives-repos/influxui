import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Badge(
      variant: BadgeVariant.filled,
      label: 'Badge',
    );
  }
}
