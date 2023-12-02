import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BoxWithColorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        for (final variant in [
          BoxVariant.filled,
          BoxVariant.light,
          BoxVariant.outline,
          BoxVariant.subtle,
          BoxVariant.transparent,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kAllColors)
                Box(
                  variant: variant,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: color,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
