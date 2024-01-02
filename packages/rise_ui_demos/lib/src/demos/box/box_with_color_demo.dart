import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/src/utils/constants.dart';

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
          BoxVariant.white,
        ])
          Wrap(
            spacing: 10,
            children: [
              for (final color in kOpenColors)
                Box(
                  variant: variant,
                  builder: (context, foregroundColor) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: color,
                    );
                  },
                ),
            ],
          ),
      ],
    );
  }
}
