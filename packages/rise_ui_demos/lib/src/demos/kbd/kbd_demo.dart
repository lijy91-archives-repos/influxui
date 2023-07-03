import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class KbdDemo extends StatelessWidget {
  const KbdDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Kbd('shift'),
    );
  }
}
