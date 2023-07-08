import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BadgeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Badge(
      variant: BadgeVariant.filled,
      label: 'Badge',
    );
  }
}
