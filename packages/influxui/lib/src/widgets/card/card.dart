import 'package:flutter/material.dart';
import 'package:influxui/src/widgets/card/card_theme.dart';

class InfluxCard extends StatelessWidget {
  const InfluxCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final InfluxCardThemeData? themeData = InfluxCardTheme.of(context);
    final InfluxCardThemeData defaults = _InfluxCardDefaults(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: themeData?.borderRadius ?? defaults.borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _InfluxCardDefaults extends InfluxCardThemeData {
  _InfluxCardDefaults(this.context) : super();

  final BuildContext context;

  @override
  BorderRadius get borderRadius => BorderRadius.circular(8);
}
