import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BoxWithVariantDemo extends StatelessWidget {
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
              return Container(
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
