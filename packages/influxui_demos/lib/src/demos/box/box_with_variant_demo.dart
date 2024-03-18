import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';

class BoxWithVariantDemo extends StatelessWidget {
  const BoxWithVariantDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
          Box(
            variant: variant,
            builder: (context, foregroundColor) {
              return SizedBox(
                width: 100,
                height: 100,
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
    );
  }
}
