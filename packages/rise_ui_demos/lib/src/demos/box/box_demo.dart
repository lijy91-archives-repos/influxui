import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Box(
        child: Container(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
