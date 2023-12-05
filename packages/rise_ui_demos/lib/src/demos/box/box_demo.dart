import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Box(
        variant: BoxVariant.filled,
        builder: (context, foregroundColor) {
          return Container(
            width: 100,
            height: 100,
          );
        },
      ),
    );
  }
}
