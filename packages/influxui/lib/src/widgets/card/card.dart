import 'package:flutter/material.dart' hide CardTheme;
import 'package:influxui/src/widgets/card/card_theme.dart';

class Card extends StatelessWidget {
  const Card({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final CardThemeData? themeData = CardTheme.of(context);
    final CardThemeData defaults = _CardDefaults(context);
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

class _CardDefaults extends CardThemeData {
  _CardDefaults(this.context) : super();

  final BuildContext context;

  @override
  BorderRadius get borderRadius => BorderRadius.circular(8);
}
