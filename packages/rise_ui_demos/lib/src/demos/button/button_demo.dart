import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Button(
          label: 'Settings',
          onPressed: () {},
        ),
      ],
    );
  }
}
