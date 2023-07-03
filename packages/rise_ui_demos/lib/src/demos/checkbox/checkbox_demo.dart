import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class CheckboxDemo extends StatelessWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        label: 'Label',
      ),
    );
  }
}
