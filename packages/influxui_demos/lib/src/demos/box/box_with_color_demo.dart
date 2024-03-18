import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/src/utils/constants.dart';

class BoxWithColorDemo extends StatelessWidget {
  const BoxWithColorDemo({super.key});

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
              for (final color in kExtendedColors)
                Box(
                  variant: variant,
                  color: color,
                  builder: (context, foregroundColor) {
                    return SizedBox(
                      width: 80,
                      height: 80,
                      child: DefaultTextStyle(
                        style: TextStyle(color: foregroundColor),
                        child: Center(
                          child: Text(variant.name),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
      ],
    );
  }
}
